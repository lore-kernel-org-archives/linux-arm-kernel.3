Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF5DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRC2B+UCjsmwn9vi7+5CKE6PtB28WE8Fwaga4+NHtmE=; b=dBLyA7HOuAmlsM/3qXp9NhSnAW
	qJi/NIUhWGnYkQ17cqAz4K+hSaYMp+jCNGktYhbW/aJJjTTh87Lah9xJTE3Xlx40nIkqlcwGP45E4
	VU3KGfQMYiho7VtBt3mwR+YlZKbRFsfFEcmiAdx5/7uwRO8zqCdzAlOQP6wjfcXjCMuAOWxPmsgZq
	eE4B4DAQOJ9GekycH/r1m49Mn2HjRuDo/xV86glHvX8NJ/lMYFrFtVqEAYsC6xnnkTfBQls+1XS/t
	VBdtdUHinIck7NO9TH5BmEJ/70uYBjq6ru1RneroT701BGGzYaAXv+1p9Y7weJ6C+T546Vi+S9X6a
	4ygwtQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpvp-00000003sVO-0aIA;
	Tue, 11 Feb 2025 13:04:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpIJ-00000003l1g-1UTE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:23:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 729301424;
	Tue, 11 Feb 2025 04:23:33 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8026A3F6A8;
	Tue, 11 Feb 2025 04:23:10 -0800 (PST)
Date: Tue, 11 Feb 2025 12:23:08 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <tabba@google.com>
Subject: Re: [PATCH 02/18] arm64: Add syndrome information for trapped
 LD64B/ST64B{,V,V0}
Message-ID: <Z6tBLIsEejdCRQKP@J2N7QTR9R3>
References: <20250210184150.2145093-1-maz@kernel.org>
 <20250210184150.2145093-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210184150.2145093-3-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_042315_435466_6B733C37 
X-CRM114-Status: GOOD (  18.43  )
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

On Mon, Feb 10, 2025 at 06:41:33PM +0000, Marc Zyngier wrote:
> Provide the architected EC and ISS values for all the FEAT_LS64*
> instructions.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/esr.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/esr.h b/arch/arm64/include/asm/esr.h
> index d1b1a33f9a8b0..d5c2fac21a16c 100644
> --- a/arch/arm64/include/asm/esr.h
> +++ b/arch/arm64/include/asm/esr.h
> @@ -20,7 +20,8 @@
>  #define ESR_ELx_EC_FP_ASIMD	UL(0x07)
>  #define ESR_ELx_EC_CP10_ID	UL(0x08)	/* EL2 only */
>  #define ESR_ELx_EC_PAC		UL(0x09)	/* EL2 and above */
> -/* Unallocated EC: 0x0A - 0x0B */
> +#define ESR_ELx_EC_LS64B	UL(0x0A)

This EC code has been generalised recently. In the latest ARM ARM (ARM
DDI 0487 L.a), which can be found at:

  https://developer.arm.com/documentation/ddi0487/la/?lang=en

... the table on page D24-7333 refers to it as:

| Trapped execution of any instruction not covered by other EC values.

... and the corresponding ISS description is named:

| ISS encoding for an exception from any other instruction

... so maybe it makes sense to call it 'ESR_ELx_EC_OTHER_INSN',
'ESR_ELx_EC_INSN_MISC', or something of that rough shape?

With that, the PSB CSYNC oddity in patch 15 makes a bit more sense,
though the L.a release of the ARM ARM is still missing the description
of that.

Mark.

> +/* Unallocated EC: 0x0B */
>  #define ESR_ELx_EC_CP14_64	UL(0x0C)
>  #define ESR_ELx_EC_BTI		UL(0x0D)
>  #define ESR_ELx_EC_ILL		UL(0x0E)
> @@ -174,6 +175,11 @@
>  #define ESR_ELx_WFx_ISS_WFE	(UL(1) << 0)
>  #define ESR_ELx_xVC_IMM_MASK	((UL(1) << 16) - 1)
>  
> +/* ISS definitions for LD64B/ST64B instructions */
> +#define ESR_ELx_ISS_ST64BV	(0)
> +#define ESR_ELx_ISS_ST64BV0	(1)
> +#define ESR_ELx_ISS_LDST64B	(2)
> +
>  #define DISR_EL1_IDS		(UL(1) << 24)
>  /*
>   * DISR_EL1 and ESR_ELx share the bottom 13 bits, but the RES0 bits may mean
> -- 
> 2.39.2
> 

