Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26923C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 01:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnbHVdcob/NAXyZ4r+Tvz2AZQ+ZijsbBRZQ5vZvqWGY=; b=Sth61+Fjwvc84hDg02mXAxJTm+
	sgiIQJbUJkE8ZYmzV2aQqPIkMDJvJ2aKixq0A4W2b10fBlRfvnJp+GdNfFpkNkMZyJj355SbPa9zX
	QiBrLAPuuJGKk5Wv+p3d4s3S/2YoRW2slf2LFMqkwawitFdIDA2C2rH2P59Vs9buZyHGRRNS8zrH+
	+yxfGz4gnqCHkZg+qWw1KlHm1r+SeNzSO5/6fm2Z7YTBnUZIr2032BsM/x8HbtLVXibjOdfvlTHe+
	BVvPGl8t6KztGsnxFxHXTDjxkVKQjMKn05SxVXVbLMRUrzpQlXzY6KwZjNvVVkWtBIDQ8l1F3IV/A
	M989YpWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJXZ-000000076Ah-3fMn;
	Wed, 09 Jul 2025 01:24:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZJVD-0000000760k-3aGK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 01:21:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 98CB75C6557;
	Wed,  9 Jul 2025 01:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A203C4CEED;
	Wed,  9 Jul 2025 01:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752024098;
	bh=PrbBICA3NNs4hfUwHx+bIOiAj9282vkiXfbstW+6NBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LmPRQZuN+R1ssGpiXwqOHMRjxHNN5ADHenwMK3onGd13CofFM+xZ7Z+oHN5f0eGLh
	 q3NYY2Othz61NXhdeZb92Ie2ed/rKp97LCZuBR6VLYOsMHuvulF31Vspur+ejaf/Ld
	 NNonyx0TJklZIx4n7jn+5Npo4FLJHYJUXlRWEUq5j18wD+seYV5ABC+oTywzAvjWN3
	 la8s0DPM2xB91ohf55zh/QR/C51aWgVCRFDWvs3dh5b4Sf1+kgQi08ZIqwW3Ynut8w
	 9Ji41Zwh+sefgpTHIJy9jAuqN5jUTL1xZ635kN2BezS4rEVkdTf09fTEBC6mKUmfoO
	 Tm48VIEJstdgA==
Date: Tue, 8 Jul 2025 18:21:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Martin Wetterwald <martin@wetterwald.eu>
Cc: linus.walleij@linaro.org, linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Linux linking stage broken on ARM with binutils 2.33.1 (BFD)
Message-ID: <20250709012134.GA1785682@ax162>
References: <CAFERDQ0zPoya5ZQfpbeuKVZEo_fKsonLf6tJbp32QnSGAtbi+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFERDQ0zPoya5ZQfpbeuKVZEo_fKsonLf6tJbp32QnSGAtbi+Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_182139_984034_3EE518A4 
X-CRM114-Status: GOOD (  27.43  )
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

Hi Martin,

On Tue, Jul 08, 2025 at 09:44:44PM +0200, Martin Wetterwald wrote:
> When I upgraded from 6.12.22 to 6.12.23 (without changing anything else), the
> linking stage of vmlinux broke (arch ARM).
> 
> > /home/.../linux-6.12.23/scripts/link-vmlinux.sh: line 49: 136961 Segmentation fault      (core dumped) ${ld} ${ldflags} -o ${output} ${wl}--whole-archive ${objs} ${wl}--no-whole-archive ${wl}--start-group ${libs} ${wl}--end-group ${kallsymso} ${btf_vmlinux_bin_o} ${ldlibs}
> > make[2]: *** [/home/.../linux-6.12.23/scripts/Makefile.vmlinux:34: vmlinux] Error 139
> > make[1]: *** [/home/.../linux-6.12.23/Makefile:1179: vmlinux] Error 2
> > make: *** [/home/.../linux-6.12.23/Makefile:224: __sub-make] Error 2
> 
> This patch seems related:
> 
> > commit 59fc42318305cb38efb4f5565408150419be8451
> > Author: Nathan Chancellor <nathan@kernel.org>
> > Date:   Thu Mar 20 22:33:49 2025 +0100
> >
> >     ARM: 9443/1: Require linker to support KEEP within OVERLAY for DCE
> >
> >     commit e7607f7d6d81af71dcc5171278aadccc94d277cd upstream.
> >
> >     ld.lld prior to 21.0.0 does not support using the KEEP keyword within an
> >     overlay description, which may be needed to avoid discarding necessary
> >     sections within an overlay with '--gc-sections', which can be enabled
> >     for the kernel via CONFIG_LD_DEAD_CODE_DATA_ELIMINATION.
> >
> >     Disallow CONFIG_LD_DEAD_CODE_DATA_ELIMINATION without support for KEEP
> >     within OVERLAY and introduce a macro, OVERLAY_KEEP, that can be used to
> >     conditionally add KEEP when it is properly supported to avoid breaking
> >     old versions of ld.lld.
> >
> >     Cc: stable@vger.kernel.org
> >     Link: https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e55ec99b1620dba7d8c
> >     Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >     Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> >     [nathan: Fix conflict in init/Kconfig due to lack of RUSTC symbols]
> >     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> I'm using BFD linker from GNU binutils 2.33.1 (built using musl-cross-make with
> musl 1.2.5 and GCC 14).
> 
> > scripts/ld-version.sh /tmp/arm-linux-musleabihf-ld
> > BFD 23301
> 
> I don't know if it was the intention of the patch, but it is not only changing
> a behavior for LLD, but also for BFD:
> - Before the patch, ld BFD 2.33.1 was not selecting
>   HAVE_LD_DEAD_CODE_DATA_ELIMINATION, and my build worked.
> - After the patch, ld BFD 2.33.1 is activating
>   HAVE_LD_DEAD_CODE_DATA_ELIMINATION, and it is segfaulting.
> Shouldn't we keep the previous behavior and only select this option when BFD is
> >= 2.36.0 (and not just when we have a BFD linker) ?
> 
> The issue is the interaction between LD_CAN_USE_KEEP_IN_OVERLAY and
> HAVE_LD_DEAD_CODE_DATA_ELIMINATION.
> 
> Nathan, I've seen your proposal here: https://lkml.org/lkml/2025/7/5/431.
> I confirm it also fixes the issue on my side. Should I propose the patch?

Yes, your analysis is spot on, sorry again for the breakage :(

I sent that diff to the list formally yesterday:

https://lore.kernel.org/all/20250707-arm-fix-dce-older-binutils-v1-1-3b5e59dc3b26@kernel.org/

I plan to put it in Russell's patch tracker for application in the next
couple of days, I wanted to wait a few days for the opportunity for
review.

Cheers,
Nathan

