Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D043FD11192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 19:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9ZKtsDO/Q8FwygSdDLskDJAHJNeZ7wl50axvyfs4JI=; b=iBW/HPUIDA1svYQO/SY7kxGShM
	H9Lp7lYnMYBu6VO4Ai/VBNEWjTTxx02jElvFP6XAqPE6ShsEehD8KYem9oI2/g/NCpajXvFoCvOAc
	nqvKC1zYUQx4by48EaLKYRY/FZ/o45LXsAFjSmm6gbs+2n6wYKQQbNgk3pvvpCTn4AMCubC8W0//x
	/M+1LYWHTJPBJ563a3wSOh25JxaUmMjmj6TvlTJB0L/lDKsDFpd9Y/OPEJ/0W+nEcJ7Hv5xRlwPSM
	odQFxNhfdxudBc97AlTYEcRUP+TLBtc3C/wSiFSrOzxAzlhEfidXRM0bk1Tl7LNGDaV+qsr2BQZMG
	l0EEJCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKpS-0000000FWzX-38BG;
	Wed, 26 Nov 2025 19:05:26 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOKpP-0000000FWyn-3uIe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 19:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Y9ZKtsDO/Q8FwygSdDLskDJAHJNeZ7wl50axvyfs4JI=; b=UmvLjZfbuwcJ75/6fQd2XfzGKj
	W2Qw+i6LUELILqmzUEsGna/JXsOY0Zr47ZEyRPopEkhGADSRoV1ySRu8YSbjkmYNUkTDZrJdoGIro
	n96oCbDuxDv8MMkBLkXHCMQT2YZk4OAPhYBmUfzjxaFx0YA9ntd/SRy7aaFgmR4/xICi8BsqXoB3O
	IeGl3S0XSTh6dmKGo0yMZtEIxjTbcxV+lkMZ3eSjoeEWWCJiN5i/o3yD028EkAmLdzFDXDR9QW+EA
	1CRX17ba79gV84fkmMT8j0Gpo7c0ygTma4hhPHlBV99CXV4/FvB+LSqLqPgrKFLTjpOqFb3KBqB7s
	n3QI8n1Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58250)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vOKpB-000000004QG-3kdq;
	Wed, 26 Nov 2025 19:05:09 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vOKp7-000000001wA-2sGZ;
	Wed, 26 Nov 2025 19:05:05 +0000
Date: Wed, 26 Nov 2025 19:05:05 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, brauner@kernel.org, jack@suse.cz,
	will@kernel.org, nico@fluxnic.net, akpm@linux-foundation.org,
	hch@lst.de, jack@suse.com, wozizhi@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	lilinjie8@huawei.com, liaohua4@huawei.com,
	wangkefeng.wang@huawei.com, pangliyuan1@huawei.com
Subject: Re: [RFC PATCH] vfs: Fix might sleep in load_unaligned_zeropad()
 with rcu read lock held
Message-ID: <aSdPYYqPD5V7Yeh6@shell.armlinux.org.uk>
References: <20251126090505.3057219-1-wozizhi@huaweicloud.com>
 <20251126101952.174467-1-xieyuanbin1@huawei.com>
 <20251126181031.GA3538@ZenIV>
 <20251126184820.GB3538@ZenIV>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126184820.GB3538@ZenIV>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_110524_247896_CD56B2A2 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, Nov 26, 2025 at 06:48:20PM +0000, Al Viro wrote:
> It's been years since I looked at 32bit arm exception handling, so I'd need
> quite a bit of (re)RTF{S,M} before I'm comfortable with poking in
> arch/arm/mm/fault.c; better let ARM folks deal with that.  But arch/* is
> where it should be dealt with; as for papering over that in fs/*:

Don't expect that to happen. I've not looked at it for over a decade,
I do very little 32-bit ARM stuff anymore. Others have modified the
fault handling, the VM has changed, I basically no longer have the
knowledge. Effectively, 32-bit ARM is unmaintained now, although it
still has many users.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

