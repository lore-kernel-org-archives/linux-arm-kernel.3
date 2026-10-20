Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D209606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XgLaEjaB;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=JqZ9x03i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMXJLIURtDOpkdycL8inSoqHK7vyzH/j/PtjO3zTI6c=; b=XgLaEjaBm33Fpo6ayrRl2GPxrS
	4pgnDC3pMoimxlWI7f6Xe+7w6aJ/9Lvb2+XyT0RWYV1Akw2HgGFKsFS/2sex+Yq0wp/KpdbURRvQ9
	JjKL0f/bYMdZOCtksYJ057/pCEu1wOkcHiyCOzQYhp9sKM3DukdBBs43bJ5n+fhushvFQ/ex2gHTq
	XvH7oTOQSL35wGctDDrSB734/alGPhxNSeWJ5fHntUReSpG4hjrhmzb6FXDl/sWPzsH1AlgAq9dde
	GSJlHk0zipLyM9jpzISeAs4veUEXfcEbKcmN1HHJIUsZtSBX8WOQQFHMjVaB2rkzhzeBaSYEmLO16
	ynAGo4aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xT-00000009HCn-1MjZ;
	Tue, 20 Oct 2026 09:16:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ5xQ-00000009HBX-2eSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:16:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3521595;
	Tue, 20 Oct 2026 02:16:27 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EDEB3F7B4;
	Tue, 20 Oct 2026 02:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792487791; bh=xJDACHR8vKCEIdl66qlXjWgt1erwmbIC4nuSnmS5oAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JqZ9x03iZW44MFULb3duA6AM/Ep4UFb+5L8yB4llCG1pZ3D8zU25sa/xBZrCgGnAO
	 +HoSUG7QkAicJ27UxfXpdH0rejldKXPuWsrQxiyDQGUWLlZde1JqD9dQ/sNc/8SFYM
	 3mRZxsZVrMC+UuLIdoCzJzGyE1+vCAE0akcHDy0Y=
Message-ID: <41632f96-2769-4923-bb83-f4c557a7c244@arm.com>
Date: Tue, 20 Oct 2026 10:16:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: sysreg: generate TPIDR, SP and DAIF encodings
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Wei <lucaswei@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>,
 Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
 <20261016164648.251258-2-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016164648.251258-2-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_021632_855830_6364B558 
X-CRM114-Status: GOOD (  15.83  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 17:46, Ada Couprie Diaz wrote:
> Introduce missing SYS_DAIF and SYS_SP_EL0 encodings in preparation
> for a future commit.
> While we are here, replace SYS_SP_EL{1,2} manual encodings with
> automatically generated ones.
> 
> As the future commit will make use of SYS_TPIDR_EL{1,2} encodings,
> replace their and related registers manual encodings with
> automatically generated ones as well.
> 
> Clean up manual `SYS_CONTEXTIDR_EL2` definition, as it was already
> generated.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/sysreg.h |  8 -------
>  arch/arm64/tools/sysreg         | 37 +++++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index 7aa08d59d4944..7948b8c74cf49 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -418,10 +418,6 @@
>  #define SYS_PMUSERENR_EL0		sys_reg(3, 3, 9, 14, 0)
>  #define SYS_PMOVSSET_EL0		sys_reg(3, 3, 9, 14, 3)
>  
> -#define SYS_TPIDR_EL0			sys_reg(3, 3, 13, 0, 2)
> -#define SYS_TPIDRRO_EL0			sys_reg(3, 3, 13, 0, 3)
> -#define SYS_TPIDR2_EL0			sys_reg(3, 3, 13, 0, 5)
> -
>  #define SYS_SCXTNUM_EL0			sys_reg(3, 3, 13, 0, 7)
>  
>  /* Definitions for system register interface to AMU for ARMv8.4 onwards */
> @@ -520,7 +516,6 @@
>  #define SYS_HAFGRTR_EL2			sys_reg(3, 4, 3, 1, 6)
>  #define SYS_SPSR_EL2			sys_reg(3, 4, 4, 0, 0)
>  #define SYS_ELR_EL2			sys_reg(3, 4, 4, 0, 1)
> -#define SYS_SP_EL1			sys_reg(3, 4, 4, 1, 0)
>  #define SYS_SPSR_irq			sys_reg(3, 4, 4, 3, 0)
>  #define SYS_SPSR_abt			sys_reg(3, 4, 4, 3, 1)
>  #define SYS_SPSR_und			sys_reg(3, 4, 4, 3, 2)
> @@ -580,8 +575,6 @@
>  #define SYS_ICH_LR14_EL2		__SYS__LR8_EL2(6)
>  #define SYS_ICH_LR15_EL2		__SYS__LR8_EL2(7)
>  
> -#define SYS_CONTEXTIDR_EL2		sys_reg(3, 4, 13, 0, 1)
> -#define SYS_TPIDR_EL2			sys_reg(3, 4, 13, 0, 2)
>  #define SYS_SCXTNUM_EL2			sys_reg(3, 4, 13, 0, 7)
>  
>  #define __AMEV_op2(m)			(m & 0x7)
> @@ -623,7 +616,6 @@
>  #define SYS_CNTV_CTL_EL02		sys_reg(3, 5, 14, 3, 1)
>  #define SYS_CNTV_CVAL_EL02		sys_reg(3, 5, 14, 3, 2)
>  
> -#define SYS_SP_EL2			sys_reg(3, 6,  4, 1, 0)
>  
>  /* AT instructions */
>  #define AT_Op0 1
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index e2d37ee221b84..7349744f14211 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -2958,6 +2958,10 @@ Res0	4:1
>  Field	0	PCRSEL
>  EndSysreg
>  
> +Sysreg	SP_EL0	3	0	4	1	0
> +Field	63:0	SP
> +EndSysreg
> +
>  Sysreg	ALLINT	3	0	4	3	0
>  Res0	63:14
>  Field	13	ALLINT
> @@ -3811,6 +3815,15 @@ Sysreg	GCSPR_EL0	3	3	2	5	1
>  Fields	GCSPR_ELx
>  EndSysreg
>  
> +Sysreg	DAIF	3	3	4	2	1
> +Res0	63:10
> +Field	9	D
> +Field	8	A
> +Field	7	I
> +Field	6	F
> +Res0	5:0
> +EndSysreg
> +
>  Sysreg	SVCR	3	3	4	2	2
>  Res0	63:2
>  Field	1	ZA
> @@ -3885,6 +3898,22 @@ UnsignedEnum	2:0	F8S1
>  EndEnum
>  EndSysreg
>  
> +Sysreg	TPIDR_EL0	3	3	13	0	2
> +Field	63:0	ThreadID
> +EndSysreg
> +
> +Sysreg	TPIDRRO_EL0	3	3	13	0	3
> +Field	63:0	ThreadID
> +EndSysreg
> +
> +Sysreg	TPIDR2_EL0	3	3	13	0	5
> +Field	63:0	ThreadID
> +EndSysreg
> +
> +Sysreg	SP_EL1	3	4	4	1	0
> +Field	63:0	SP
> +EndSysreg
> +
>  Sysreg	SCTLR_EL2	3	4	1	0	0
>  Field	63	TIDCP
>  Field	62	SPINTMASK
> @@ -5425,6 +5454,10 @@ Sysreg	CONTEXTIDR_EL2	3	4	13	0	1
>  Fields	CONTEXTIDR_ELx
>  EndSysreg
>  
> +Sysreg	TPIDR_EL2	3	4	13	0	2
> +Field	63:0	ThreadID
> +EndSysreg
> +
>  Sysreg	CNTPOFF_EL2	3	4	14	0	6
>  Field	63:0	PhysicalOffset
>  EndSysreg
> @@ -5465,6 +5498,10 @@ Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
>  Mapping	CONTEXTIDR_EL1
>  EndSysreg
>  
> +Sysreg	SP_EL2	3	6	4	1	0
> +Field	63:0	SP
> +EndSysreg
> +
>  SysregFields TTBRx_EL1
>  Field	63:48	ASID
>  Field	47:1	BADDR
> -- 2.43.0
> 

I've cheeked replaced and removed encodings against generated sysreg-defs.h
and all look correct. New encodings matches ARM ARM.

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


