Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F93D606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HBp5votj;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E3I/DCEn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q2/0Ue4giscDhogkms2MC+1BsK89qH5iUzgGUX6LCP4=; b=HBp5votjuEgP+jPzHLpE/97bZs
	MV4ck30vipSpmL6qokN5WG6Fsc1DfjxdyQRlcCAOhdoThUJTDpmh7d07MUlwDg9X/NhscIKxeA8sH
	UZ6Xrr3RGa+7dMSFk+JrXmMcq7ScqTZrNfCAvckYMR1NLJjkIV3xEf0gDuRdsuJarHRGlmb7nMOEX
	wELR7sPaTr4wtXBssbGuFIAtvHA/YUt0FB3CkWGp6ABN8BqBIugrSr0xCbyaI6VskmNGkSGDUuBih
	J9XquM4ysILvaEZMfEVGzOmncZVL/ppOZkdKlAAHf2rIRucQEeFqL89gKKoP4KZNCit9XTwgT5Pez
	5zU0o7Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKVX-00000003ZAh-2pqd;
	Tue, 03 Nov 2026 19:49:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOKVW-00000003ZAT-1BFx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 19:49:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 94B3D406E0;
	Tue,  3 Nov 2026 19:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D0F1F000C1;
	Tue,  3 Nov 2026 19:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793735361;
	bh=Q2/0Ue4giscDhogkms2MC+1BsK89qH5iUzgGUX6LCP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E3I/DCEnrwPBdTLhmdhtRbobh8XCmW7eI1pmKX4vsycqGAl3VuRlOf/lFWEGwGiSL
	 1ApzhVa9GY37LM73HbE00ZgvQ41RqHvQnPSEct+oPkpEcLAMHNe1kA6wnpbL0sPJ+b
	 TGAOEKI/a0f0wGrp/uP0h/JxWWM11V5eE8zsvEQFmK2rl/or75XVxurBa6wVqwpMsO
	 ZYuFX0d3U5aVVP0E9moW+jgmTVCFom4VE1px9AeiUZKtMeA7WHjH8eFZLCzrwYyY2h
	 CS3suGhVCLEThspTJ5pDS56e81ynODEJAdioHWksQk6xYOabN1gdxR+UJ4R67TMeam
	 edwtbeK5lzE7Q==
Date: Tue, 3 Nov 2026 19:49:14 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, fuad.tabba@linux.dev, 
	joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	will@kernel.org, mark.rutland@arm.com, linux-perf-users@vger.kernel.org, 
	catalin.marinas@arm.com, james.clark@linaro.org
Subject: Re: [RFC PATCH v7 28/28] KVM: arm64: Allow the creation of a SPE
 enabled VM
Message-ID: <auo4Zc5luDXD1Zei@gremlin>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
 <20260903160623.315525-29-alexandru.elisei@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903160623.315525-29-alexandru.elisei@arm.com>
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

On Thu, Sep 03, 2026 at 05:06:23PM +0100, Alexandru Elisei wrote:
> Everything is in place, allow userspace to enable SPE for a virtual
> machine.

I guess I've become fairly predictable :P but I think you should say more in
this commit message.

Explain what's being enabled, that you've laid the foundations, why you're
default =y, the dependency on the PMU, etc.

Also worth mentioning that you're bumping KVM_VCPU_MAX_FEATURES to make SPE
actually available to users when before it wasn't (and that you were doing the
work incrementally and only enabling once all in place for e.g.).

>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Agree on your response to Sashiko.

> ---
>  arch/arm64/include/asm/kvm_host.h | 2 +-
>  arch/arm64/kvm/Kconfig            | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index ff77f6ac3adf..32b30ffdcf77 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -40,7 +40,7 @@
>
>  #define KVM_MAX_VCPUS VGIC_V3_MAX_CPUS
>
> -#define KVM_VCPU_MAX_FEATURES 10
> +#define KVM_VCPU_MAX_FEATURES 11
>  #define KVM_VCPU_VALID_FEATURES	(BIT(KVM_VCPU_MAX_FEATURES) - 1)
>
>  #define KVM_REQ_SLEEP \
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 2bc8e34c538d..a285b18eb1cc 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -106,9 +106,9 @@ endif # NVHE_EL2_DEBUG
>
>
>  config KVM_ARM_SPE
> -	bool
> +	bool "Support SPE in guest"

I think this description could have been there all along?

>  	depends on KVM && ARM_SPE_PMU
> -	default n
> +	default y

Definitely need to justify this for a new feature :) Especially as there are
erratum.

I guess the argument is that it depends on ARM_SPE_PMU and somebody setting that
would by implication want KVM_ARM_SPE.

If you go that way probably better to just make it explicit so the user can't
have a weird setup with 1 but not the other?

Something like:

config KVM_ARM_SPE
-	bool
+	def_bool y
 	depends on KVM && ARM_SPE_PMU
-	default n

Maybe?


>  	help
>  	  Adds support for Statistical Profiling Extension (SPE) in virtual
>  	  machines.
> --
> 2.43.0
>
>

--
Cheers, Lorenzo

