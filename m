Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C79CE74AC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31p2KCGlZnELuu+jIu1s94gjTesBViipZ7NRxxkjvrQ=; b=ax82DVeWWOOEuIuljCZVq3FLjH
	W3Mj00pB+VuFVHwr0ShhTo6rvbFvVsX7XMUaOgMVPXn+z4jjZVTCKCZZbwT3MFPzgKLofjHgaJZgO
	yN/evqGUOm2DKz27sLTJJh8z9syyFWycWY1AGvhA62nIGZIuWGKiko/mqeft2p+S2i+xr2UhztTIm
	HwnU7PL6gzlfNwEGAm32XwTr3h3bqrAq/pSpyXsjFoHR95F72CKByJ8MS9DytvP1dzv+CPj9owQue
	zPOxvcC9a9x8qqyTbe1DPmMqIu0rUPJWlNY9W+be1krZiibmUJFyHyU2tb4G/A10U0mCEt1vOgiOV
	GSPOhhcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVgO-0000000A5AH-277G;
	Tue, 03 Dec 2024 16:23:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVfN-0000000A52u-3wlQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:22:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DB49FEC;
	Tue,  3 Dec 2024 08:22:51 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 990B23F71E;
	Tue,  3 Dec 2024 08:22:22 -0800 (PST)
Date: Tue, 3 Dec 2024 16:22:20 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>
Subject: Re: [PATCH] arm64: Ensure bits ASID[15:8] are masked out when the
 kernel uses 8-bit ASIDs
Message-ID: <Z08wPAbb1SGYJfdH@J2N7QTR9R3.cambridge.arm.com>
References: <20241203151941.353796-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203151941.353796-1-catalin.marinas@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_082226_020638_791A5CDF 
X-CRM114-Status: GOOD (  22.46  )
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

On Tue, Dec 03, 2024 at 03:19:41PM +0000, Catalin Marinas wrote:
> Linux currently sets the TCR_EL1.AS bit unconditionally during CPU
> bring-up. On an 8-bit ASID CPU, this is RES0 and ignored, otherwise
> 16-bit ASIDs are enabled. However, if running in a VM and the hypervisor
> reports 8-bit ASIDs (ID_AA64MMFR0_EL1.ASIDBits == 0) on a 16-bit ASIDs
> CPU, Linux uses bits 8 to 63 as a generation number for tracking old
> process ASIDs. The bottom 8 bits of this generation end up being written
> to TTBR1_EL1 and also used for the ASID-based TLBI operations as the
> upper 8 bits of the ASID. Following an ASID roll-over event we can have
> threads of the same application with the same 8-bit ASID but different
> generation numbers running on separate CPUs. Both TLB caching and the
> TLBI operations will end up using different actual 16-bit ASIDs for the
> same process.
> 
> A similar scenario can happen in a big.LITTLE configuration if the boot
> CPU only uses 8-bit ASIDs while secondary CPUs have 16-bit ASIDs.
> 
> Ensure that the ASID generation is only tracked by bits 16 and up,
> leaving bits 15:8 as 0 if the kernel uses 8-bit ASIDs. Note that
> clearing TCR_EL1.AS is not sufficient since the architecture requires
> that the top 8 bits of the ASID passed to TLBI instructions are 0 rather
> than ignored in such configuration.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Cc: <stable@vger.kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: James Morse <james.morse@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/mm/context.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
> index 188197590fc9..b2ac06246327 100644
> --- a/arch/arm64/mm/context.c
> +++ b/arch/arm64/mm/context.c
> @@ -32,9 +32,9 @@ static unsigned long nr_pinned_asids;
>  static unsigned long *pinned_asid_map;
>  
>  #define ASID_MASK		(~GENMASK(asid_bits - 1, 0))
> -#define ASID_FIRST_VERSION	(1UL << asid_bits)
> +#define ASID_FIRST_VERSION	(1UL << 16)
>  
> -#define NUM_USER_ASIDS		ASID_FIRST_VERSION
> +#define NUM_USER_ASIDS		(1UL << asid_bits)
>  #define ctxid2asid(asid)	((asid) & ~ASID_MASK)
>  #define asid2ctxid(asid, genid)	((asid) | (genid))
>  

