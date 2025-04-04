Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B19CC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My25F9/bScMJSrGnT/OpBwm0OzqyY4mJ2A2WBB6gTCs=; b=DGI27pqL4TFOZcJjcYQCP0RlsZ
	P2lyZjgdK7vEsOuKcDpY8LtSRj6goVwFNY80Uuj4KAaTPly9HUPv4pZN98sgU6h8aNyOunXBVsWnN
	DV7qmGKs07+FEZwAtvvHhk7tofik7oJVLo67aFcGDU5s0SCVwkkDaoI1yXF+tZuOoEiNHS+L/luI2
	UwmZKR7/0MtpxsY03PSBElcbimR0X1vBhSXGHo7Kr1DNtE7L3qp5SHvAE/N2R+KTuJThFZ/PSC7dg
	GViwW9/jMVxlSHvFCt4rRGcP1MEJwNefxxxcMJ39myaa9MM3bYNgkWQWdGNNxeVmYPZbS5tzJaUGP
	gj5A5uSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eOF-0000000BQre-0sLF;
	Fri, 04 Apr 2025 10:35:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eMP-0000000BQNu-3LTM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 10:33:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 675FB1516;
	Fri,  4 Apr 2025 03:33:19 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BADD3F63F;
	Fri,  4 Apr 2025 03:33:16 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:33:13 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	robh@kernel.org
Subject: Re: [boot-wrapper] aarch64: Enable access into FEAT_PMUv3p9
 registers from EL2 and below
Message-ID: <Z--1afRYgxy4rjXa@J2N7QTR9R3>
References: <20250227041603.2029058-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227041603.2029058-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_033317_874657_E4A39BE5 
X-CRM114-Status: GOOD (  14.62  )
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

On Thu, Feb 27, 2025 at 09:46:03AM +0530, Anshuman Khandual wrote:
> FEAT_PMUv3p9 adds system register PMUACR_EL1 and similarly FEAT_PMUv3_ICNTR
> adds system registers PMICFILTR_EL0 and PMICNTR_EL0. But access into these
> system registers from EL2 and below exception levels, will trap into EL3
> unless MDCR_EL3.EnPM2 is set.
> 
> Enable access to FEAT_PMUv3p9 registers when they are implemented.
> 
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

Applied.

Mark.

> ---
>  arch/aarch64/include/asm/cpu.h | 2 ++
>  arch/aarch64/init.c            | 3 +++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/cpu.h
> index e049cda..b04bf71 100644
> --- a/arch/aarch64/include/asm/cpu.h
> +++ b/arch/aarch64/include/asm/cpu.h
> @@ -56,6 +56,7 @@
>  #define MDCR_EL3_SBRBE_NOTRAP_NOPROHIBIT	(UL(3) << 32)
>  #define MDCR_EL3_ENPMSN				BIT(36)
>  #define MDCR_EL3_EBWE				BIT(43)
> +#define MDCR_EL3_EnPM2				BIT(7)
>  
>  #define SCR_EL3_RES1			BITS(5, 4)
>  #define SCR_EL3_NS			BIT(0)
> @@ -87,6 +88,7 @@
>  #define ID_AA64DFR0_EL1_PMSVER		BITS(35, 32)
>  #define ID_AA64DFR0_EL1_TRACEBUFFER	BITS(47, 44)
>  #define ID_AA64DFR0_EL1_BRBE		BITS(55, 52)
> +#define ID_AA64DFR0_EL1_PMUVER		BITS(11, 8)
>  #define ID_AA64DFR0_EL1_DEBUGVER	BITS(3, 0)
>  
>  #define ID_AA64ISAR0_EL1_TME		BITS(27, 24)
> diff --git a/arch/aarch64/init.c b/arch/aarch64/init.c
> index 54e4cc4..fe7ed5f 100644
> --- a/arch/aarch64/init.c
> +++ b/arch/aarch64/init.c
> @@ -152,6 +152,9 @@ static void cpu_init_el3(void)
>  	if (mrs_field(ID_AA64DFR0_EL1, DEBUGVER) >= 11)
>  		mdcr |= MDCR_EL3_EBWE;
>  
> +	if (mrs_field(ID_AA64DFR0_EL1, PMUVER) >= 0b1001)
> +		mdcr |= MDCR_EL3_EnPM2;
> +
>  	msr(MDCR_EL3, mdcr);
>  
>  	if (mrs_field(ID_AA64PFR0_EL1, SVE)) {
> -- 
> 2.25.1
> 

