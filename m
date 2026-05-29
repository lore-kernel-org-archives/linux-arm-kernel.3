Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1932CD6E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeelb+SxVvWZH/Lny1Z/xaobYN8qV++QCgA8BW3g8rM=; b=UcfypNULqiFk/T3OC83M4w4ArG
	TB2eYRVFc/nygmY645MiCXcw/WY2dP0CqerU21EksiTKyOx2WzB47XNd1RgkBiMX1uyYhoHvFuGjU
	zuZLcis+/Yevs0kMRhoi8Y0yMWNubHQDDpbbL0iZEkgP6hhUXRJVfRY6abXQudEq1R9GsguEVu0XY
	+X7xUqBSsnGTR5nJhHgOJb5vIz+YMGNTk+5K3N4BN7GESqtFMtM8GBmvtGFskvWJ1w6MK0ZJwahOv
	UxRDWI3tbTyZReEfWp5nFG4D9BdDpxTGNc7Yb6SsNDy31DBY6SpG+0PErHu4kYEC4sC6almvyT0md
	BnGU7fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSybC-00000007aGU-1ms1;
	Fri, 29 May 2026 14:54:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyb6-00000007aFk-2FQN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:54:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C739A441FE;
	Fri, 29 May 2026 14:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADDF1F00893;
	Fri, 29 May 2026 14:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066443;
	bh=aeelb+SxVvWZH/Lny1Z/xaobYN8qV++QCgA8BW3g8rM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=btigZHr6ceEB8i2nQXFz9UnBi4GN5ysMJzsAvsBa/b8RDtQe4dDZu2SKAjg9tz1IH
	 kA3njYoCJ6YwvL/NHLD2Rq+cmPoL38pP7srU5dchpJcOQBejoaHYMP6pPwnQCUgmtY
	 nQR2ttvfFZjmqth/a+pjwrwQoerMiJJnVyLKBhvtveBX5TbCbhFLw6e0Fb/umydsoE
	 BkKS82gPL3L318UY6HxFF7SMew1C7iD8IwTCmyHldFJ/cDGbmqDgooA/IAJ8a5BPJ/
	 SvARwc84o/1tB2WocLKPsjXC2DmLpsUBCqrBNFPHWresKz67G1OQjotOBQoYiM795v
	 fdJpKGY4WiX9w==
Date: Fri, 29 May 2026 15:53:58 +0100
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Pratyush Anand <panand@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	clm@meta.com, leo.bras@arm.com, kernel-team@meta.com
Subject: Re: [PATCH] arm64/hw_breakpoint: reject unaligned watchpoints that
 would truncate BAS
Message-ID: <ahmohv6vQGxY-asL@willie-the-truck>
References: <20260430-arm64_bas-v1-1-c6ab2b15aec0@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430-arm64_bas-v1-1-c6ab2b15aec0@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_075404_613753_17034036 
X-CRM114-Status: GOOD (  29.21  )
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

Hi Breno,

Thanks for sending this out.

On Thu, Apr 30, 2026 at 02:40:10AM -0700, Breno Leitao wrote:
> hw_breakpoint_arch_parse() positions the BAS bit pattern in
> hw->ctrl.len with
> 
> 	offset = hw->address & alignment_mask;	/* 0..7 */
> 	hw->ctrl.len <<= offset;
> 
> ctrl.len is an 8-bit bitfield (struct arch_hw_breakpoint_ctrl::len is
> u32 :8), so the shift silently drops any bits past bit 7.  For
> non-compat AArch64 watchpoints the offset is unbounded relative to
> ctrl.len: a perf_event_open(PERF_TYPE_BREAKPOINT) caller asking for
> HW_BREAKPOINT_W with bp_addr=page+1 and bp_len=HW_BREAKPOINT_LEN_8
> ends up with 0xff << 1 = 0x1fe, stored as 0xfe.  The kernel programs
> WCR.BAS=0xfe and the hardware watches bytes [1..7] instead of the
> requested [1..8] -- the eighth byte is silently dropped.  The
> syscall still returns success, leaving userspace to discover the
> gap by empirical probing.
> 
> The same class affects HW_BREAKPOINT_LEN_{2,4} when offset pushes the
> high BAS bit past bit 7 (e.g. LEN_4 with offset=5 yields 0xe0
> instead of 0x1e0).  No memory-safety impact -- the value is masked
> into 8 bits before encoding -- but debuggers and perf users observe
> missed events on bytes they thought they were watching.
> 
> The AArch32 branch immediately above already rejects unrepresentable
> (offset, len) combinations via an explicit switch.  Mirror that for
> the non-compat branch by checking that the shifted pattern fits in
> the BAS field, returning -EINVAL when it does not.
> 
> Reproducer:
> 
>   struct perf_event_attr a = {
>       .type = PERF_TYPE_BREAKPOINT, .size = sizeof(a),
>       .bp_type = HW_BREAKPOINT_W,
>       .bp_addr = (uintptr_t)(buf + 1),
>       .bp_len = HW_BREAKPOINT_LEN_8,
>       .exclude_kernel = 1, .exclude_hv = 1,
>   };
>   int fd = perf_event_open(&a, 0, -1, -1, 0);
>   /* before this fix: succeeds, watches 7 bytes (buf+1..buf+7)   */
>   /* after  this fix: fails with EINVAL                          */
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> Fixes: b08fb180bb88 ("arm64: Allow hw watchpoint at varied offset from base address")

Oh man, this has been broken for nearly a decade :/

I think we probably should've stuck with the old behaviour of rejecting
unaligned base addresses, but it's too late now. Damn.

>  arch/arm64/kernel/hw_breakpoint.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index ab76b36dce820..b8a1402119f3a 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -559,6 +559,15 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>  		else
>  			alignment_mask = 0x7;
>  		offset = hw->address & alignment_mask;
> +
> +		/*
> +		 * BAS is an 8-bit field in WCR/BCR; the shift below would
> +		 * silently drop the high bits of ctrl.len when offset + len
> +		 * exceeds 8, programming hardware to watch fewer bytes than
> +		 * the user requested.
> +		 */
> +		if (((u32)hw->ctrl.len << offset) > 0xff)

nit: Use ARM_BREAKPOINT_LEN_8 instead of 0xff

> +			return -EINVAL;
>  	}

I must confess, I'm very nervous about breaking userspace here. If GDB
is triggering this path, then this patch will change an unreliable
watchpoint into a hard error (which probably means GDB exits). Have you
looked to see what GDB and/or any other debuggers do?

I had a quick peek and found the bugzilla entry which motivated the
buggy change in the first place:

https://sourceware.org/bugzilla/show_bug.cgi?id=20207

and it looks like the aarch64_align_watchpoint() function does try to
spill into multiple watchpoints, so perhaps your patch is ok. I'd
appreciate your opinion, though.

Will

