Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D795CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 16:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T7eZ2Eehpx8xjtYqF85ryPs1mdL9igRv5/FTJcZoWss=; b=2KjyvhPZmG+cGreRoJVDWaHpcG
	gO9zQrZ5IVdaxjOOzuBMnR9X+GxJzwDF8SVQGjWTARHjTDni0dSReYa5s+lIpV+2G7aBqrGqlXEUv
	eTkw4kVCepr8fNzPi9kn7LJEQa4TCFLuhXNuZVPJ9kO9j0g9hBocXrz9KWnFGN+bJP0nVeTuSRa42
	gRiyhCoYeHE1GNO+HnaKGw8dmoKBxer1wNNh9Ia4KqnaD+VPadq6r0f4FNE2dcfwSsfL0DABE2Psy
	2tSjaw/CmyjLFno8DXzjHghCy7GWAE4r6qvGHmpQSamvCbLJSz4gT0yldCTx0v+fww8UI9mdMnWKx
	R6qh2dEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDtc-00000000yUd-1JsF;
	Mon, 28 Sep 2026 16:08:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBDtZ-00000000yU3-22nC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 16:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 384901655;
	Mon, 28 Sep 2026 09:07:56 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47AEC3FA1F;
	Mon, 28 Sep 2026 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790611679; bh=c5FHfUVz5VVHTSc2j+d6ycLo0NpKTyx2202wpOOflXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwU/63mP+mDZeSRe60JhpPQnlr7sDP3cia+ZLhZhxhc/Iyn6lkPHoIlEV+vofTcIG
	 QYnJuy+WgYfE6nrh8qbtZjjUn/b0kG5vKGmJ6Po2u7w7hWulE4bsqKG2cFxY7tmd66
	 l70A93Xu6/3iN2DQ+wYq1ZM3q40cP1SV7Pj/jrIc=
Date: Mon, 28 Sep 2026 17:07:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v8 16/29] arm64: Share arm64 headers with s390
Message-ID: <arqQ2Eat4VUBbl49@arm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
 <20260918133107.1042730-17-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918133107.1042730-17-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_090801_621785_869489A3 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, Sep 18, 2026 at 03:30:53PM +0200, Steffen Eiden wrote:
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 6b005c8fef70..12cbad460258 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -45,6 +45,11 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
>  
> +# Enable all code shared to s390
> +KBUILD_CFLAGS	+= -DARM64_S390_COMMON
> +KBUILD_AFLAGS	+= -DARM64_S390_COMMON
> +KBUILD_CPPFLAGS	+= -DARM64_S390_COMMON

Do we actually need these defines? They seem only to be used as markers
for the awk scripts to extract the definitions. Why do we need the C
preprocessor involved at all? Could we not just have comment markers:

/* ARM64_S390_COMMON_BEGIN */
...
/* ARM64_S390_COMMON_END */

(also the CPPFLAGS definition was enough, it gets copied into the others
automatically)

> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index ab205f9db94a..1c5c4df260be 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -16,6 +16,8 @@
>  
>  #include <asm/gpr-num.h>
>  
> +#ifdef ARM64_S390_COMMON
> +
>  /*
>   * ARMv8 ARM reserves the following encoding for system registers:
>   * (Ref: ARMv8 ARM, Section: "System instruction class encoding overview",
> @@ -50,6 +52,8 @@
>  #define sys_reg_CRm(id)	(((id) >> CRm_shift) & CRm_mask)
>  #define sys_reg_Op2(id)	(((id) >> Op2_shift) & Op2_mask)
>  
> +#endif /* ARM64_S390_COMMON */
> +
>  #ifndef CONFIG_BROKEN_GAS_INST
>  
>  #ifdef __ASSEMBLER__
> @@ -123,6 +127,8 @@
>  #define GSB_SYS_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 0, 31)
>  #define GSB_ACK_BARRIER_INSN		__SYS_BARRIER_INSN(1, 0, 12, 0, 1, 31)
>  
> +#ifdef ARM64_S390_COMMON
> +
>  /* Data cache zero operations */
>  #define SYS_DC_ISW			sys_insn(1, 0, 7, 6, 2)
>  #define SYS_DC_IGSW			sys_insn(1, 0, 7, 6, 4)
> @@ -832,6 +838,8 @@
>  #define SCTLR_ELx_A	 (BIT(1))
>  #define SCTLR_ELx_M	 (BIT(0))
>  
> +#endif /* ARM64_S390_COMMON */
> +
>  #ifdef CONFIG_CPU_BIG_ENDIAN
>  #define ENDIAN_SET_EL2		SCTLR_ELx_EE
>  #else
> @@ -866,6 +874,7 @@
>  	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
>  	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
>  
> +#ifdef ARM64_S390_COMMON
>  /* MAIR_ELx memory attributes (used by Linux) */
>  #define MAIR_ATTR_DEVICE_nGnRnE		UL(0x00)
>  #define MAIR_ATTR_DEVICE_nGnRE		UL(0x04)
> @@ -1102,6 +1111,8 @@
>  #define GICV5_GICR_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
>  #define GICV5_GICR_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
>  
> +#endif /* ARM64_S390_COMMON */

I haven't checked them all but there are a few definitions in here that
depend on arm64-specific configs: e.g. GCR depends on KASAN, TGRAN
macros depend on page size, PA_BITS_52 influences some other values.

I think they should be outside the common definitions shared with s390.
In addition, the awk scripts should reject any CONFIG_ (or at least
CONFIG_ARM64_) lines in the copied files. Ideally report an error rather
than silently masking them out.

-- 
Catalin

