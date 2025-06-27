Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27003C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peSnTAENBHncQdjmouksOfzyd8lcxOaAnXt51y7tTSc=; b=ZYs0LM7r9AXNhqEvtdTM/5oS4Y
	Qgz/sbxLzCyw83d0dBgfSaMEsMQ7x1EK4rmOkTS/8GyWOp6zIuoYQglan3o0p/SrQx6MDLLgBqOYL
	eebbJI9w2Qby74IoTawzP1c67qn1LV8WkNOwnNs7SRhe+JD5FovmKtC+zs8pu0SFZgNbdNEnFP34G
	2d4HAEYmTXv9h2x3/Hcw/c/2bpOgNP4tDwDHwiI4HAjhMmPFDiX1yUqzuYNsc4BYS67QCsIXZA3Bq
	bc0vfVv9JUT0XFyxq2nm8k8cx4ZeOb/Bzm11hqluDeojiI5UXYPnnul2nUHSz5Ry2DYVKd4p+RP4V
	zmE5uROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVClW-0000000FOcq-1pGx;
	Fri, 27 Jun 2025 17:21:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVBGF-0000000F9Na-0oiu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 15:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7E1C0A52FAA;
	Fri, 27 Jun 2025 15:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA65C4CEE3;
	Fri, 27 Jun 2025 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039106;
	bh=pFu84L6q1kuh6bFLp7kCuJQ3lXRLskEyHTwuPUWFHdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPxNRJlr4p5zBjLmhIY+RtP2eV2qqlCOfXcgNTt8l/rZUvcBwz8mCguUQXnIxy3tx
	 ghu2VNNdDPeWAGNhSQGpL3TsK9S35uvM5buS4IjqIfCI+hBgqgKaqSPvAm3JFcdNFe
	 j0mqLfpk+tgmRTfJ39Py7g39n98ssaN1IQzy/5Y0FyqR6rRgPzZype4UKC23fiJqzT
	 ASNczrkzR1YtptOdhIefAyqAo5lpx3BbcFaLg98aoF6wgxkSecfmWibXu8yLISs3Gt
	 h06PQ3c0EKttL51eX5pY72YUVQcXI62JVUM42o0s/1s++ADvn5Mqw9Pa/vUe7MHo59
	 lfoOGFqHksmTA==
Date: Fri, 27 Jun 2025 16:45:02 +0100
From: Will Deacon <will@kernel.org>
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v4 02/13] arm64: refactor aarch32_break_handler()
Message-ID: <aF68fmViXqlrU0Eg@willie-the-truck>
References: <20250620211207.773980-1-ada.coupriediaz@arm.com>
 <20250620211207.773980-3-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620211207.773980-3-ada.coupriediaz@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_084507_307996_8F33B5BB 
X-CRM114-Status: GOOD (  16.93  )
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

On Fri, Jun 20, 2025 at 10:11:56PM +0100, Ada Couprie Diaz wrote:
> `aarch32_break_handler()` is called in `do_el0_undef()` when we
> are trying to handle an exception whose Exception Syndrome is unknown.
> It checks if the instruction hit might be a 32-bit arm break (be it
> A32 or T2), and sends a SIGTRAP to userspace if it is so that it can
> be handled.
> 
> However, this is badly represented in the naming of the function, and
> is not consistent with the other functions called with the same logic
> in `do_el0_undef()`.
> 
> Rename it `try_handle_aarch32_break()` and change the return value to
> a boolean to align with the logic of the other tentative handlers in
> `do_el0_undef()`, the previous error code being ignored anyway.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Tested-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> ---
>  arch/arm64/include/asm/debug-monitors.h |  2 +-
>  arch/arm64/kernel/debug-monitors.c      | 10 +++++-----
>  arch/arm64/kernel/traps.c               |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Will Deacon <will@kernel.org>

Will

