Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2750B606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 05:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O/jvDl6A;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=kfqKBl33
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XHtOnNb/QT0KYcuG2D6k7Sc+gTZ6iTr4Jo8NFEFUk6c=; b=O/jvDl6ACJu0dmdhF7CLAbQSZl
	+R9QR++KLUrBC8rEaGcQyP+cI0Mnyk3vrrwripurinCLJ2jqsdjYFsPNZXCKy4CA+Vv6qBOY/GU+x
	8AIx1BsS0FGV3fEAFdrbaB2uRk4VHVsGIPAPfsk+QhfOB8Wsqh3oSjg64PxvKq7Mqjpw3RGK8kXje
	D/VNQsFjkmb12r30JHBzeUpbnKabPZK1tbO2yJziMOF8tRNts8Na3CXJuiMKWlhhk5DowIDv0AoT9
	V3JFDrJiREhqNG71V7qtunPoAJhWh6IBXyByjecE0kfjSu7iKx2oAp/TS5HK6/FA3dphdIRnwwhw8
	FTmoLCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeib-0000000Apv3-3HVg;
	Fri, 30 Oct 2026 04:59:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMeiY-0000000Apuh-2pVs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 04:59:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 127671576;
	Thu, 29 Oct 2026 21:59:49 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 746343F673;
	Thu, 29 Oct 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793336392; bh=qCqzGHRAYqmG7w1mdu0JzAwGvdKPeHbAcgCcr7TK1pE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kfqKBl33CLhrnzoGB+6Iy03S+L8vPpDEwz6ocMm//mxaOyrP9GhpqNf/hh1XVwBIG
	 F/nI4qjS9fEJ/dofCdVjLv2KmQyoK7ov7wq48ZWfvIY+x2tj8NHXxrjFf9kSmUUcLz
	 44+EAy3HrVUb6U1Vf8i+RtQk34iRvhMM403lVbK8=
Date: Fri, 30 Oct 2026 10:29:48 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Kristina =?utf-8?Q?Mart=C5=A1enko?= <kristina.martsenko@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-efi@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [RFC 02/12] arm64: Detect FEAT_TLBID
Message-ID: <tzt7fqgh6ksbuo5pe7qeh6gofjsumwrw7w6pw5iwdu3b5nd5dm@zkzrelsc2upt>
References: <20261001110655.461473-1-kristina.martsenko@arm.com>
 <20261001110655.461473-3-kristina.martsenko@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001110655.461473-3-kristina.martsenko@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_215954_892604_20ECEB27 
X-CRM114-Status: GOOD (  18.62  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Thu, Oct 01, 2026 at 12:06:45PM +0100, Kristina Martšenko wrote:
> Detect if FEAT_TLBID is supported by the system. Detect TLBID
> configuration from TLBIDIDR_EL1. This information will be used in later
> patches.
> 
> Set HFGRTR2_EL2.nTLBIDIDR_EL1 so that the kernel can access TLBIDIDR_EL1
> at EL1 (in case of nVHE/hVHE).
> 
> Signed-off-by: Kristina Martšenko <kristina.martsenko@arm.com>
> ---
>  arch/arm64/include/asm/cpu.h        |  1 +
>  arch/arm64/include/asm/cpufeature.h |  7 +++++++
>  arch/arm64/include/asm/el2_setup.h  |  9 ++++++++-
>  arch/arm64/kernel/cpufeature.c      | 25 +++++++++++++++++++++++++
>  arch/arm64/kernel/cpuinfo.c         |  3 +++
>  arch/arm64/tools/cpucaps            |  1 +
>  6 files changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/cpu.h b/arch/arm64/include/asm/cpu.h
> index 3c008821219c..967ccdedf526 100644
> --- a/arch/arm64/include/asm/cpu.h
> +++ b/arch/arm64/include/asm/cpu.h
> @@ -48,6 +48,7 @@ struct cpuinfo_arm64 {
>  	u64		reg_gmid;
>  	u64		reg_smidr;
>  	u64		reg_mpamidr;
> +	u64		reg_tlbididr;
>  
>  	u64		reg_id_aa64dfr0;
>  	u64		reg_id_aa64dfr1;
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index 4f04ad82ea34..d4e7497143b2 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -627,6 +627,13 @@ static inline bool id_aa64pfr1_mpamfrac(u64 pfr1)
>  	return val > 0;
>  }
>  
> +static inline bool id_aa64mmfr4_tlbid(u64 mmfr4)
> +{
> +	u32 val = cpuid_feature_extract_unsigned_field(mmfr4, ID_AA64MMFR4_EL1_TLBID_SHIFT);
> +
> +	return val > 0;
> +}
> +
>  void __init setup_boot_cpu_features(void);
>  void __init setup_system_features(void);
>  void __init setup_user_features(void);
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index aa8ec9df8024..bd70a470596c 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -438,9 +438,16 @@
>  	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
>  
>  .Lskip_spefds_\@:
> +	mov	x1, xzr
> +	mrs_s	x2, SYS_ID_AA64MMFR4_EL1
> +	ubfx	x2, x2, #ID_AA64MMFR4_EL1_TLBID_SHIFT, #ID_AA64MMFR4_EL1_TLBID_WIDTH
> +	cbz	x2, .Lskip_tlbid_\@
> +	orr	x1, x1, #HFGRTR2_EL2_nTLBIDIDR_EL1
> +
> +.Lskip_tlbid_\@:
>  	msr_s   SYS_HDFGRTR2_EL2, x0
>  	msr_s   SYS_HDFGWTR2_EL2, x0
> -	msr_s   SYS_HFGRTR2_EL2, xzr
> +	msr_s   SYS_HFGRTR2_EL2, x1
>  	msr_s   SYS_HFGWTR2_EL2, xzr
>  	msr_s   SYS_HFGITR2_EL2, xzr
>  .Lskip_fgt2_\@:

IMO, would be good to move the above changes into a separate patch.

Thanks,
Linu Cherian.

 

