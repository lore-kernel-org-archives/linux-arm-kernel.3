Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A05C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fzyz75BNH6eKJio5/M+S/8tGB+J3tzH9FLQ299Avd1M=; b=woKQnJKPZMxK6bK+ZWwfQWARpQ
	e89NpR4L0AXmPQ0I0WCWE8EhsaXUsqeyst1LhXjRTXSy0BSNcadVCejiPVrWkg9XgFNGvRN0Am86G
	3uHlYPv2Tf915J8cjk230hpQR9nU8bFCnYB7uTimLb9hl3ylPY67TG7RkMORmFTw6qcCGPIHeZCEj
	AGKcgzPr9dnjJKKAm5hZu7iLHEo0OGOnw9YkoR0aXb5Ntw3qKFF/i6P/LDeu7EuejLQoBX/y+DFs0
	xtLUae/ytSMnhh+hjqx61cf4DSpwSrD6s5gDrhmDlACC2J9fgMHTJJzfww//vZlZPrzuoVU2AKA2w
	dQ4fs7uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOcW-00000008JeH-1jBg;
	Wed, 26 Mar 2025 11:08:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOZG-00000008J6H-1n95
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 11:05:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31C7F1596;
	Wed, 26 Mar 2025 04:05:11 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 139003F63F;
	Wed, 26 Mar 2025 04:05:03 -0700 (PDT)
Date: Wed, 26 Mar 2025 11:05:00 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Keir Fraser <keirf@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, stable@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: mops: Do not dereference src reg for a set
 operation
Message-ID: <Z-PfXFHBcXhDe03b@J2N7QTR9R3>
References: <20250326110059.3773318-1-keirf@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326110059.3773318-1-keirf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_040506_510474_92EE5C55 
X-CRM114-Status: GOOD (  20.56  )
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

On Wed, Mar 26, 2025 at 11:00:58AM +0000, Keir Fraser wrote:
> The source register is not used for SET* and reading it can result in
> a UBSAN out-of-bounds array access error, specifically when the MOPS
> exception is taken from a SET* sequence with XZR (reg 31) as the
> source. Architecturally this is the only case where a src/dst/size
> field in the ESR can be reported as 31.
> 
> Prior to 2de451a329cf662b the code in do_el0_mops() was benign as the
> use of pt_regs_read_reg() prevented the out-of-bounds access.
> 
> Fixes: 2de451a329cf662b ("KVM: arm64: Add handler for MOPS exceptions")
> Cc: Kristina Martsenko <kristina.martsenko@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: stable@vger.kernel.org
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Keir Fraser <keirf@google.com>

Thanks!

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/traps.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/traps.h b/arch/arm64/include/asm/traps.h
> index d780d1bd2eac..82cf1f879c61 100644
> --- a/arch/arm64/include/asm/traps.h
> +++ b/arch/arm64/include/asm/traps.h
> @@ -109,10 +109,9 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
>  	int dstreg = ESR_ELx_MOPS_ISS_DESTREG(esr);
>  	int srcreg = ESR_ELx_MOPS_ISS_SRCREG(esr);
>  	int sizereg = ESR_ELx_MOPS_ISS_SIZEREG(esr);
> -	unsigned long dst, src, size;
> +	unsigned long dst, size;
>  
>  	dst = regs->regs[dstreg];
> -	src = regs->regs[srcreg];
>  	size = regs->regs[sizereg];
>  
>  	/*
> @@ -129,6 +128,7 @@ static inline void arm64_mops_reset_regs(struct user_pt_regs *regs, unsigned lon
>  		}
>  	} else {
>  		/* CPY* instruction */
> +		unsigned long src = regs->regs[srcreg];
>  		if (!(option_a ^ wrong_option)) {
>  			/* Format is from Option B */
>  			if (regs->pstate & PSR_N_BIT) {
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

