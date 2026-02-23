Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDBFEA4FB7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 12:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3821ZnuaSZcjl964JJV2MnnoezU8zJNJGJL9ManDvI=; b=t9+p7iIwd6dNrTGSWiMAUGs5cj
	sVlaphKQ0keeUqZSuKtgezohpkXAnH3IAOruoBQn3bCZ7EdM4dBq1NxnXMT+gZOrybHB/VtkU2oAq
	gHDdlnvtqW1CJdDEH6MW6VvuQwAw1NpDvjPJtE0VSYRH26Z/l1BT9jcYSW1QR3E1DiluclIaIpXMb
	bUlhcf643E1HobJMOCwOB2HMMAiZFvL3h0bRQpLxKXMaoV+ouknWmzuaTZqaZV9UIzJMlEAKBoF/h
	VrHGRfogwoPd73lTYLWGHxokdeooZmDGCX5dN35EMBV2PeJJOM6VWCNUrZEvu5mZ1RJl7Bellcfu/
	TuN2aCWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVCj-00000000Hyq-34WC;
	Mon, 23 Feb 2026 12:38:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVCi-00000000HyX-294v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 12:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9064260127;
	Mon, 23 Feb 2026 12:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBDAC116C6;
	Mon, 23 Feb 2026 12:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771850303;
	bh=5DismUcPcJBskV/yvsBitb/KFHFiQZOlsVjke+RQjdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uYKdJVvV97pw1GmKb7yYqwm5HPYJ8CmLKYpRtwoIHM0klDrYHjjpDNJ52sVnkiszE
	 4mDrF/OJgzpoI8XV5g1Bu1LNHOAl7PjL6nTEkzvGr1Oohisst1T8DIt6a66tFWXXrC
	 OcuRk0BQC+Jk/wg4NtBVhUqdizeVpRpChSxuzsD8FVPEdg9dd5HGDuNgje47TpnPvf
	 TKWzYPuvEV5uUPLtugbC8DCZtm3uhskOrzyU2hLtPEQ0RJoTKmFicG2xq9XqnS5qN1
	 dhlvB8+ri2oqBXsmIJsdaz9OqJJSbuKccyW5ZHP70AsLiTr3/FBggNoIff/jO1Mb2o
	 O9fdSouSWno7w==
Date: Mon, 23 Feb 2026 20:19:49 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm: Add runtime constant support for armv7 and
 !THUMB2_KERNEL
Message-ID: <aZxF5bjbwTKOCKZf@xhacker>
References: <20260221141831.16136-1-jszhang@kernel.org>
 <aZnXRGFJ1F-nT4Ou@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aZnXRGFJ1F-nT4Ou@shell.armlinux.org.uk>
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

On Sat, Feb 21, 2026 at 04:03:16PM +0000, Russell King (Oracle) wrote:
> On Sat, Feb 21, 2026 at 10:18:31PM +0800, Jisheng Zhang wrote:
> > Implement the runtime constant infrastructure for
> > armv7 && !THUMB2_KERNEL. So that armv7 can use this infrastructure
> > to generate constants to be used by the d_hash(), dentry_cache(),
> > names_cache() and so on.
> > 
> > This is the armv7 variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> > 
> > As for < armv7 or THUMB2_KERNEL, we fall back to the generic
> > runtime-constant.h, no functionality changes.
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> This looks fine to me, but it will need to appear in the patch system
> for me to apply it. Details linked via my signature below.

Thanks for the code review. Will put it into the patch system.

> 
> Thanks.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

