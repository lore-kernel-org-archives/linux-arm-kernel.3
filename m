Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EBEC5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhQYfCzrKB3FPv67GCrOaPhuOeIGj74d2TURGihtwgM=; b=DRE+tZIqfgJAUMDRDFeACdEvJ0
	H60eX8940c4TCqFwSrux30cS+c3I121dxcIUkqrayVtkbT92RhyE/koRAwntT83l1f6WmEXNEoLWD
	byXZUXq/yzqljlH0cyrHJGtZ/qLxmz0wnJJKtdDm69R4ZDcYpPfKWNE/7CRqyhNRHwyBkgP5xSajk
	86/cdHU0LGEPkSfsdSkGgGkaI/WaqJc3TSzvGG4U0TcYhP6oHbuSWJpIyz4YG1TMHlWgSWPxBlMQK
	jXlqOaRtbIeY8YstDtQRiER1ezZeFDJY0MjBkwZktOmN8sAjpwcJSWP9NHeC/tREsWqQYEBEncpot
	skw/48Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3x-00000005jsZ-1Xmi;
	Mon, 17 Aug 2026 08:51:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvt3u-00000005jqT-0LNX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 08:51:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1968D1655;
	Mon, 17 Aug 2026 01:51:11 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAE333F66F;
	Mon, 17 Aug 2026 01:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786956675; bh=eVs+4B/QuvbsHU8hn4JuKy6MD+W6ov3xTciN3sqiKZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nlZd49luYypCRZ/UatwE3QZ1wOTR2BGIEv1brNCTvlnFst7yke/t6UUsGBRtWiEVu
	 72L/5uDcYgGqYHoCFmuDCyoHlNxJ8QBqxBLPfJHKhZnB0Sloi43VrvGADkQT+3lel3
	 +m8qcg8kTECHOIF8PKcazkBNjIan8IKZ5szDAJG8=
Date: Mon, 17 Aug 2026 09:51:11 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
	robin.murphy@arm.com, gshan@redhat.com, kernel-dev@igalia.com,
	kernel@gpiccoli.net, Mark Brown <broonie@kernel.org>,
	Ryan Houdek <sonicadvance1@gmail.com>
Subject: Re: [PATCH] arm64/kernel: Expose the running CPU of a native task in
 TPIDRRO_EL0
Message-ID: <aoLLf_iZq6DLNpLO@arm.com>
References: <20260815152759.2046231-1-gpiccoli@igalia.com>
 <aoGIEEje1NIMTjyv@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoGIEEje1NIMTjyv@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_015118_243554_722FD734 
X-CRM114-Status: GOOD (  18.04  )
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

On Sun, Aug 16, 2026 at 10:51:12AM +0100, Will Deacon wrote:
> On Sat, Aug 15, 2026 at 12:19:32PM -0300, Guilherme G. Piccoli wrote:
> > The register TPIDRRO_EL0 has 2 meanings / usages today, depending on
> > the mode userspace is running:
> > 
> > - For native/arm64 mode, this register is always 0 from the userspace
> >   perspective. In the kernel, it is used during ventry (entry.S) as
> >   a scratch register, related to KPTI (stashes x30 in fact).
> > 
> > - For 32-bit compat tasks, this register holds the TLS userspace pointer,
> >   and is not used for KPTI or anything else in entry.S. This is ABI and
> >   userspace can count on having a valid TLS pointer there.
> > 
> > Happens that other operating systems follow a similar approach than 32-bit
> > compat mode, even for arm64: in both Windows[0] and MacOS (xnu/darwin)[1],
> > this register is used to hold the running CPU of the current task, hence
> > offering a very fast / non-syscall way for a given task to figure its
> > running CPU id.
> 
> I don't think we should allocate TPIDRRO_EL0 for this as it precludes us
> using it for anything else in the future. If you want the current CPU,
> then I think you're better off using either rseq (which I thought could
> do this) or looking at reviving the vDSO work you mention (but that has
> unresolved limitations iirc).

Indeed. IIRC glibc already implements getcpu() using rseq.

-- 
Catalin

