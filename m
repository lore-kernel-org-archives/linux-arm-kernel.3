Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99FAAC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1QHi2Yc9+c3ilp7G6J3VL4jKd5PBH7PTjhxdRNzNECI=; b=d/hQVbRBbVoYIG8Tg7tNjPecfk
	1ZRciVyV5qxlrme5JIuVJjs6/BvIbc9cpNYpkHa9b2mXZwU+2BfH/ZdVs0YHsJ2KEunQ3Wtc+1wQc
	nFJP5vk010TcFBau0Ut1CgCrrLzS9kR7HqevJYg+A/cKgzsb3jHT5ou0Ki9MjPUkOaejrUhyP9wON
	VJ3mnuBC6olGw/BTNr0pY0fg5PFccJI7DE7ztc+yidDikQZNtfytgTZ9Y6MIjbdqpRZcPJcCjRage
	DXnTEjbUmtV3OF/c0E4P329V0Kqlq04NOEHf0itHzE+FzAVPBDBJp7/ai9PyzoHc77KCG+bblwX2B
	BsR6QsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXWS-00000004crX-03E5;
	Sun, 16 Aug 2026 09:51:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXWQ-00000004crR-1avo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 09:51:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9DBE86001D;
	Sun, 16 Aug 2026 09:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 166F01F000E9;
	Sun, 16 Aug 2026 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786873877;
	bh=1QHi2Yc9+c3ilp7G6J3VL4jKd5PBH7PTjhxdRNzNECI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnSLpHrMVBuGBPaGbGjdKBhXF+MeHRRxlEwHgjEoQ7fcEyL4B5jb7QM0bqSEPfwjs
	 OddzRSzB86MPtwDkYC/t86KsfnYQRpgID5K13YG/Ave5UOCUfvkhsdzl+7aDFeBRU5
	 jhFeXFSHTo+lOVFRqWkYJ6HhsfDgmBtRso0ORoS5mGg+Hw5kL6XZFUk1niamF3/hAs
	 pZKUTljY2NAro/0KG4mbS0Rj2mDrTm2H5HoraTPC/rlrDaKyOfIQUsfoaixWz0M+J2
	 uFgphW4RBdFWtZRgg33dgQrRTp2OK0evC36mG8OaRHxv/cDQMzXM5/pnbvC9GGjST8
	 WFK4A/z6hfVBg==
Date: Sun, 16 Aug 2026 10:51:12 +0100
From: Will Deacon <will@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	mark.rutland@arm.com, robin.murphy@arm.com, gshan@redhat.com,
	kernel-dev@igalia.com, kernel@gpiccoli.net,
	Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
Message-ID: <aoGIEEje1NIMTjyv@willie-the-truck>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815152759.2046231-1-gpiccoli@igalia.com>
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

On Sat, Aug 15, 2026 at 12:19:32PM -0300, Guilherme G. Piccoli wrote:
> The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
> the mode userspace is running:
> 
> - For native/arm64 mode, this register is always 0 from the userspace
>   perspective. In the kernel, it is used during ventry (entry.S) as
>   a scratch register, related to KPTI (stashes x30 in fact).
> 
> - For 32-bit compat tasks, this register holds the TLS userspace pointer,
>   and is not used for KPTI or anything else in entry.S. This is ABI and
>   userspace can count on having a valid TLS pointer there.
> 
> Happens that other operating systems follow a similar approach than 32-bit
> compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin)[1],
> this register is used to hold the running CPU of the current task, hence
> offering a very fast / non-syscall way for a given task to figure its
> running CPU id.

I don't think we should allocate TPIDRRO_EL0 for this as it precludes us
using it for anything else in the future. If you want the current CPU,
then I think you're better off using either rseq (which I thought could
do this) or looking at reviving the vDSO work you mention (but that has
unresolved limitations iirc).

Will

