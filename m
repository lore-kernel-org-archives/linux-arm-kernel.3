Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8354C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 18:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cqRl3w4AtCKFBPHjOptg/HIVao4uiXyk5YEdQsWeC9M=; b=jbbMuGBkpRuogUEmQXwMkNYpoJ
	Qm1RClDQPGnsMqJujo+QbA8B+lXE8sr6v+YDCUm3VnMRl5OMou//xbSy4ktJPSOMb6qtCXAIV90/R
	OLs1BM6aFBnciUm3e6InzpmUWAIXAvY9E5Rp3OtTFMSqKhdT1JufYMkicWCWARLNrBkr4CmCVYmcq
	fOfQvtVLm0+LVY1AaGd/tHP8F3I42I+Cy2gSQP14DsowuE8X1obHtsjZsYh5vLf8R1LYvZih6keBA
	oj0oYV6bCd/GO1X5CpvOoh74gFdp6oq8NsdTywvY48u/qbw5SggoYUlXVCv5TRLxsrLwnyYIVNBzB
	840lLPxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Rz-0000000Cp4C-2jHL;
	Wed, 15 Jan 2025 18:49:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8KG-0000000Cnfq-23kf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 15 Jan 2025 18:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cqRl3w4AtCKFBPHjOptg/HIVao4uiXyk5YEdQsWeC9M=; b=XxH+7YecwWTC8ZpWg8WXwklu3O
	Uq8WvueruB7ez1TGWRoBIrzS+pshGbRXsNMNInvKLoZfOsKqSSmXKoQI2xX5uhIKcPf+IL/Z3vWDU
	F+ABkkDS6qJSKilxd3hI8O86NCJ+usD16x6w+mYi6wb5dON115qMId16vLNnVa+EjdzrX2OewTtyo
	2CwCkF76lzIWfyWVruflGUioV9uIK5kPwy2ctfAg7sOCOSgjCGzsjKR6DF19aM4jhlpjlizSHlzhr
	ddS6L7wFgJ1XpECxLghHmt2zJcQwk5Gm8bCNcno9PH2GWLVVr8vDFc2XuqpuDDUWCRliGUs5A60HM
	HvNXKnPQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8KA-0000000AuCO-2w4L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 18:41:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 890F21F02;
	Wed, 15 Jan 2025 10:41:32 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A95E03F73F;
	Wed, 15 Jan 2025 10:41:02 -0800 (PST)
Date: Wed, 15 Jan 2025 18:41:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
 <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu
 <yuzenghui@huawei.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 03/17] arm64: sysreg: Add layout for ICH_MISR_EL2
Message-ID: <20250115184100.3c2450cc@donnerap.manchester.arm.com>
In-Reply-To: <20250112170845.1181891-4-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
	<20250112170845.1181891-4-maz@kernel.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_184107_279915_B273A804 
X-CRM114-Status: GOOD (  14.06  )
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

On Sun, 12 Jan 2025 17:08:31 +0000
Marc Zyngier <maz@kernel.org> wrote:

> The ICH_MISR_EL2-related macros are missing a number of status
> bits that we are about to handle. Take this opportunity to fully
> describe the layout of that register as part of the automatic
> generation infrastructure.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Compared against the ARM ARM:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  arch/arm64/include/asm/sysreg.h       |  5 -----
>  arch/arm64/tools/sysreg               | 12 ++++++++++++
>  tools/arch/arm64/include/asm/sysreg.h |  5 -----
>  3 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index cf74ebcd46d95..815e9b0bdff27 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -561,7 +561,6 @@
>  
>  #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
>  #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
> -#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
>  #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
>  #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
>  #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
> @@ -991,10 +990,6 @@
>  #define TRFCR_ELx_E0TRE			BIT(0)
>  
>  /* GIC Hypervisor interface registers */
> -/* ICH_MISR_EL2 bit definitions */
> -#define ICH_MISR_EOI		(1 << 0)
> -#define ICH_MISR_U		(1 << 1)
> -
>  /* ICH_LR*_EL2 bit definitions */
>  #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
>  
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index f5927d345eea3..a601231a088d7 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2974,6 +2974,18 @@ Res0	17:5
>  Field	4:0	ListRegs
>  EndSysreg
>  
> +Sysreg	ICH_MISR_EL2	3	4	12	11	2
> +Res0	63:8
> +Field	7	VGrp1D
> +Field	6	VGrp1E
> +Field	5	VGrp0D
> +Field	4	VGrp0E
> +Field	3	NP
> +Field	2	LRENP
> +Field	1	U
> +Field	0	EOI
> +EndSysreg
> +
>  Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
>  Fields	CONTEXTIDR_ELx
>  EndSysreg
> diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
> index f43e303d31d25..0169bd3137caf 100644
> --- a/tools/arch/arm64/include/asm/sysreg.h
> +++ b/tools/arch/arm64/include/asm/sysreg.h
> @@ -420,7 +420,6 @@
>  
>  #define SYS_ICH_VSEIR_EL2		sys_reg(3, 4, 12, 9, 4)
>  #define SYS_ICC_SRE_EL2			sys_reg(3, 4, 12, 9, 5)
> -#define SYS_ICH_MISR_EL2		sys_reg(3, 4, 12, 11, 2)
>  #define SYS_ICH_EISR_EL2		sys_reg(3, 4, 12, 11, 3)
>  #define SYS_ICH_ELRSR_EL2		sys_reg(3, 4, 12, 11, 5)
>  #define SYS_ICH_VMCR_EL2		sys_reg(3, 4, 12, 11, 7)
> @@ -634,10 +633,6 @@
>  #define TRFCR_ELx_E0TRE			BIT(0)
>  
>  /* GIC Hypervisor interface registers */
> -/* ICH_MISR_EL2 bit definitions */
> -#define ICH_MISR_EOI		(1 << 0)
> -#define ICH_MISR_U		(1 << 1)
> -
>  /* ICH_LR*_EL2 bit definitions */
>  #define ICH_LR_VIRTUAL_ID_MASK	((1ULL << 32) - 1)
>  


