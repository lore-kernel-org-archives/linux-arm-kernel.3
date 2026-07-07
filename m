Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8333C43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEE3m3WVJuBFnAm3gjDrsTE+bClUghMxtBjGH4/4pak=; b=sdrkflxYEwjiPFVFg0lONeaue7
	bKMVTxEU6AgYPyY9HEn2aM7uUYXD2DZ3Qv5hdLrzANqHHzAZwLN94ZkV9ULr6lvGu5JA7mov4sOGL
	owGrYCrauPzLqLywB1M+p0YxrgfP2m2UxCE2aN9uA4rCBvBRL+TERnWDXHAqmNavJ3FYtFf6bJYsE
	mW3zkhQ2x1DoLa0NNpKJOmyRmPuxIpxeih6uztZjq52PP2BC7zX+b1gihMaIGVAnm4lKGEIG9q5Lx
	4nR0jvciYnODsRRDehyCR2kk/7xMMl1IUhf4eTAmhizbwL1ruDG/XZpW5J0qhHl/o6mlk1n3wlbMf
	SKRK5+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Cw-0000000EzeV-2cJe;
	Tue, 07 Jul 2026 12:47:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5Cv-0000000EzeG-12CF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 12:47:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB8E641429;
	Tue,  7 Jul 2026 12:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F51F1F00A3D;
	Tue,  7 Jul 2026 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783428444;
	bh=hEE3m3WVJuBFnAm3gjDrsTE+bClUghMxtBjGH4/4pak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dh2ykrRTucW/VBrxB9M+J/VOLxuu8Lp95gVoTmE/Xe1V/jHHEAVNrNpBPWO+ZIBXt
	 HG+X8VMiuLB4EZ9AKx7hjBsSp++azCCCIWW/C337n6ePgDj45+2IvH3Ms3ctzZQW8X
	 kvD21TM/G5banmvITBwHlXzBgWdEgf/b1ajmy+3+asmEKFWAckNYgoCcpZDiOphpcd
	 VC4WI0myBdBHSmnabwjUPsIaXePp2p6H2sRRuYtoNlLoX2MW8n0pjYjQBDi2OQDdYV
	 ngTsYJmUH7nO8cyxfaaE2MM+N/yece/OeonxsgVKvveXcZwK+8IYV6OXIHuwG+j4Oy
	 r4gBfxReXLBmQ==
Date: Tue, 7 Jul 2026 13:47:14 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Qi Xi <xiqi2@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>, 
	akpm@linux-foundation.org, david@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, linusw@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, sunnanyong@huawei.com, 
	linux-mm@kvack.org, lilinjie8@huawei.com, liaohua4@huawei.com
Subject: Re: [PATCH v3 1/2] ARM: mm: fix use-after-free in __do_user_fault()
 under CONFIG_DEBUG_USER
Message-ID: <akz1LNXtM2ign5u1@lucifer>
References: <20260626073048.3595106-2-xiqi2@huawei.com>
 <20260706133247.145485-1-xieyuanbin1@huawei.com>
 <c11452a3-b918-4d4c-afd7-a835a1d0a3bc@huawei.com>
 <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akzpuerKqOY7qfFi@shell.armlinux.org.uk>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2026 at 12:57:45PM +0100, Russell King wrote:
> On Tue, Jul 07, 2026 at 07:48:12PM +0800, Qi Xi wrote:
> > You're right. And I think the fix is to simply skip show_pte() for kernel
> > addresses.
>
> No. This information is useful debug for kernel oops.

Yup see my reply, just upgrade it to an mmap write lock and you should be
safe to keep this.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

Cheers, Lorenzo

