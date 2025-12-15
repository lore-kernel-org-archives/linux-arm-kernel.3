Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D25D5B17B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB5xMIRwAbyWJ6x0t01HnHBTIU6RaSAZoRyYflZR1pE=; b=paTDpan2Jc3VKwIUBCGDnNIPPk
	yNMI0mPXVjKxLWISIH7GGPAOiKIgzxESAdpHBt60H5WgqhjYRPHU0/JxE6joUW4jgehWgORk72FTV
	Q/7tA5dq/6Nw3o8x9/oLua+VO9k4bBJwYHIXSSCbVkd7CEWn/vjjhqbYCK3P5aB+zlmXJUD+uRyBT
	tNSBBqX8419LGavOxR0fQhpUHNYE7nCe9BmDLkvEnY6H5HDMmVJINcRrinfTS3+yGJOI00zOffn9G
	NeER3gX8hRAVstJc0ChBnyLtzaso5+TqViGFxG1/vL8Kuc836/E+febFYYWQdFtt/7mZyVIC4KdAa
	c7/SvxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA2d-00000003ppY-2xBV;
	Mon, 15 Dec 2025 14:59:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVA2b-00000003ppA-369f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:59:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 230CC497;
	Mon, 15 Dec 2025 06:59:04 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC3C3F73B;
	Mon, 15 Dec 2025 06:59:10 -0800 (PST)
Date: Mon, 15 Dec 2025 14:59:09 +0000
From: Leo Yan <leo.yan@arm.com>
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: hw_breakpoint: warn on invalid breakpoint
 length
Message-ID: <20251215145909.GC681384@e132581.arm.com>
References: <20251213112336.26503-1-osama.abdelkader@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251213112336.26503-1-osama.abdelkader@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_065913_848953_58B4A609 
X-CRM114-Status: GOOD (  24.59  )
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

Hi,

On Sat, Dec 13, 2025 at 12:23:35PM +0100, Osama Abdelkader wrote:
> Some tools (e.g. perf) incorrectly assume that breakpoints should be
> sizeof(long), but this is wrong for AArch64 where breakpoints must be
> 4 bytes. Add a warning when we silently fix up the parameter so tool
> developers can get notified.

To be clear, the perf tool has fixed the issue since:

  fa6cc3f93258 ("perf parse-events: Vary default_breakpoint_len on i386 and arm64")

The latest perf can pass the correct length (4) for instruction
breakpoint.

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

This FIXME is still valid for me.  IMO, if really want to remove the
comment, a reasonable solution is:

  1) Backport two patches (fa6cc3f93258 and 70b27c756f9) onto the
     stable kernel code base for fixing perf tool.

  2) Based on perf tool has fixed the issue on the mainline kernel and
     stable kernels, we can change to return -EINVAL instead.

> +			 * Some tools (e.g. perf) incorrectly assume that
> +			 * breakpoints should be sizeof(long). This is wrong
> +			 * for AArch64 where breakpoints must be 4 bytes.
> +			 * Warn the user and fix up the parameter.
>  			 */
> +			pr_warn_once("hw_breakpoint: invalid AArch64 breakpoint length %d, fixing to 4 bytes\n",
> +				     hw->ctrl.len);

AFAIK, since I started to use Armv5 CPUs, Arm instructions (not Thumb
ones) are always 4-byte length. Not sure if the log is useful or not,
I would leave this to maintainers.

Thanks,
Leo

>  			hw->ctrl.len = ARM_BREAKPOINT_LEN_4;
>  		}
>  	}
> -- 
> 2.43.0
> 
> 

