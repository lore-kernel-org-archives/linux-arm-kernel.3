Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC803CCF2C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 20:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Hbm2xD0LRANUKICgcGtHkcphlWLJpUPTLT4POOZe0I=; b=n7Qbv5rVhfSAzMRJPl2YsXsExt
	xaa6qNEz7+k6hhR3BvI/qYVmt/HJH6E1Im2r8X0JOHVsLasTN13MhmyDq+1h4U1U0ZJWi/X4l63b0
	4EqLEH0SpHy8BOccIp6ufL91rCfypBPzrkVBg8BeCWVNG1dGMbdIW4QALf6z7FQ197eElPlpAHNWq
	L0SQlatD+uoMQMgsfFHlrweg6jRguOy3rDsalTRZhHCtQeo5lmETC+w7gU7bRenKSJJjNdHv5CbXy
	OFsYwDygm3pha7PkJSzySqJ5kEouLaUE0QztfY+jHWStD6YcRRTbcUqZiLxdbo7Vi+vUhvNwVt2Vt
	Ikfcdk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrIm-0000000C3N3-03F5;
	Mon, 05 Jan 2026 20:35:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcrIk-0000000C3Mx-30sT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 20:35:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CDF3C60010;
	Mon,  5 Jan 2026 20:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EA5C116D0;
	Mon,  5 Jan 2026 20:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767645341;
	bh=c0kzSZSP3Sc7meNMb3f814HG8Dspx6UwG6XS4EJ4IvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MMXJkWfso9Tos+MG/oop2Igl6Htr4RrwoBSNoJyB5IBmZ/eFJs0Sd8+kQnIRxgrPr
	 SirfMAsj1zJGvMeArIESyWKUosRymHUH5nBf/ZUowfQB24QzUr0Q5laB5lFznhDUqm
	 EN47fHrG2GtjZmmJ6O81VdsEmQHRdUBnFpHaKAmWaOOpqJV6Fz2Q6w50XlWPJfRFe2
	 bjisla2OHhYGJ2B6+FoW73e4b83Js2WWdD6hYPKN4SNmWMmkZZcQjJViL+BNsGovqB
	 eGExT8i2wax+aszxxD6svRwKC6yJhYC2TkJHDqZUuvUD5glfIdrJE6Jn3T77u73B+d
	 HfKoORi6zCTfg==
Date: Mon, 5 Jan 2026 20:35:36 +0000
From: Will Deacon <will@kernel.org>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: hw_breakpoint: warn on invalid breakpoint
 length
Message-ID: <aVwgmMlOjL1UXvOL@willie-the-truck>
References: <20251213112336.26503-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213112336.26503-1-osama.abdelkader@gmail.com>
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

On Sat, Dec 13, 2025 at 12:23:35PM +0100, Osama Abdelkader wrote:
> Some tools (e.g. perf) incorrectly assume that breakpoints should be
> sizeof(long), but this is wrong for AArch64 where breakpoints must be
> 4 bytes. Add a warning when we silently fix up the parameter so tool
> developers can get notified.
> 
> This addresses the FIXME comment by adding diagnostic output rather
> than breaking existing tools by returning -EINVAL.
> 
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---
> v2: fix warning messageline splitting
> ---
>  arch/arm64/kernel/hw_breakpoint.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
> index ab76b36dce82..cce306145d78 100644
> --- a/arch/arm64/kernel/hw_breakpoint.c
> +++ b/arch/arm64/kernel/hw_breakpoint.c
> @@ -475,11 +475,13 @@ static int arch_build_bp_info(struct perf_event *bp,
>  				return -EINVAL;
>  		} else if (hw->ctrl.len != ARM_BREAKPOINT_LEN_4) {
>  			/*
> -			 * FIXME: Some tools (I'm looking at you perf) assume
> -			 *	  that breakpoints should be sizeof(long). This
> -			 *	  is nonsense. For now, we fix up the parameter
> -			 *	  but we should probably return -EINVAL instead.
> +			 * Some tools (e.g. perf) incorrectly assume that
> +			 * breakpoints should be sizeof(long). This is wrong
> +			 * for AArch64 where breakpoints must be 4 bytes.
> +			 * Warn the user and fix up the parameter.
>  			 */
> +			pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d, fixing to 4 bytes\n",
> +				     hw->ctrl.len);
>  			hw->ctrl.len = ARM_BREAKPOINT_LEN_4;

This is user triggerable so I don't see why printing a message is a good
idea. Just remove the FIXME tag if it bothers you -- we can't really
change the behaviour at this point.

Will

