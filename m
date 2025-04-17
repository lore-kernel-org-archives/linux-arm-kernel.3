Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E5EC369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naL7lB1xrvC1SAmPVR+GgUPQENH3vsgdA5teHZGXgj8=; b=4qkKQSKgOeADtICFl8Rea+9ovN
	JfwP312fVYwzBksjUuPqesLLXZdl4KXbIys/TBLROHOgjS7EBDPHHgHbbgtK8kcRvPHGvuuZVfej9
	RqDbMCpy47KC7zZIFmLCLUEDzVtVsleaMO4jvqn0M4lpuJqp6mRm7fCSmAsDuIa+Q6hBO0N9tsNzB
	W233jo5QRqQ0oK4j/+Dje9ptuwaw7RvHI9gxuVKgRoPxJyduUNMnyId3KfKp+B21d3XMpcCZ69/dz
	6T3m0DkWsdMpVmhi+6Q0grW86Yxq6aOZdQZYWt6lJ6qq+oQWtTdxbN/xZOIyW5v69/7/i/cubVfLQ
	ieFFKJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Prg-0000000DFjb-2kqP;
	Thu, 17 Apr 2025 14:05:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5PoP-0000000DEzB-41Bm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3228C5C548D;
	Thu, 17 Apr 2025 13:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922ABC4CEE4;
	Thu, 17 Apr 2025 14:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744898512;
	bh=3xdgWL9BKZ5VadvNoLxSAhmUejSLg6O3MJWTTyYsSOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G++VQaD7jw3OMS5E8HEUmfYc98bJHaUmmQ1qOlNrlUq2yLKlTYcAmDVB2I/q3iABG
	 z4bxahr+sds/BQWJxPAc1VADMfe+X5aoANVMVeogzzHbT/BSh0R+/wbf7IqoUcFUia
	 T/duQmQyLQjHaK4YXPiQC45Axry+bydvLoKn7iYQPYX8IwANI9DWzHAzZVfyQasH6P
	 qrp+uGkFQKPtJZ93McqdOnVNNxdyM0Lvq12G3ASVTkRN8SeGTw2rLm4QbFww180Ttb
	 EnZHq9u/l/MBCBRklxqYO2SgdSeE3oZDdliSB3gZOXUED8dWq/sOvRUqR8A9qd6Pfr
	 pn/bee+NmaVPQ==
Date: Thu, 17 Apr 2025 15:01:48 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH] arm64: Remove checks for broken Cavium HW from the PI
 code
Message-ID: <20250417140147.GA13109@willie-the-truck>
References: <20250416123534.1108220-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416123534.1108220-1-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_070154_081118_7BD74B84 
X-CRM114-Status: GOOD (  31.65  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Oliver Upton <oliver.upton@linux.dev>, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Apr 16, 2025 at 01:35:34PM +0100, Marc Zyngier wrote:
> Calling into the MIDR checking framework from the PI code has recently
> become much harder, due to the new fancy "multi-MIDR" support that
> relies on tables being populated at boot time, but not that early that
> they are available to the PI code. There are additional issues with
> this framework, as the code really isn't position independend *at all*.
> 
> This leads to some ugly breakages, as reported by Ada.
> 
> It so appears that the only reason for the PI code to call into the
> MIDR checking code is to cope with The Most Broken ARM64 System Ever,
> aka Cavium ThunderX, which cannot deal with nG attributes that result
> of the combination of KASLR and KPTI as a consequence of Erratum 27456.
> 
> Rather than adding extra complexity for something that is actually
> a very dead horse, let's simply drop that check. On my own machine,
> the firmware doesn't provide a KASLR seed, preventing the pathological
> case to show up.
> 
> And if someone does have a broken box that passes a seed to the kernel,
> "nokaslr" on the command-line is an easy enough workaround.
> 
> Fixes: c8c2647e69bed ("arm64: Make  _midr_in_range_list() an exported function")
> Reported-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> Link: https://lore.kernel.org/r/3d97e45a-23cf-419b-9b6f-140b4d88de7b@arm.com
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> ---
>  arch/arm64/include/asm/mmu.h   | 11 -----------
>  arch/arm64/kernel/cpu_errata.c |  2 +-
>  arch/arm64/kernel/image-vars.h |  4 ----
>  3 files changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
> index 30a29e88994ba..6e8aa8e726015 100644
> --- a/arch/arm64/include/asm/mmu.h
> +++ b/arch/arm64/include/asm/mmu.h
> @@ -94,17 +94,6 @@ static inline bool kaslr_requires_kpti(void)
>  			return false;
>  	}
>  
> -	/*
> -	 * Systems affected by Cavium erratum 24756 are incompatible
> -	 * with KPTI.
> -	 */
> -	if (IS_ENABLED(CONFIG_CAVIUM_ERRATUM_27456)) {
> -		extern const struct midr_range cavium_erratum_27456_cpus[];
> -
> -		if (is_midr_in_range_list(cavium_erratum_27456_cpus))
> -			return false;
> -	}
> -
>  	return true;
>  }
>  
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b55f5f7057502..6b0ad5070d3e0 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -335,7 +335,7 @@ static const struct midr_range cavium_erratum_23154_cpus[] = {
>  #endif
>  
>  #ifdef CONFIG_CAVIUM_ERRATUM_27456
> -const struct midr_range cavium_erratum_27456_cpus[] = {
> +static const struct midr_range cavium_erratum_27456_cpus[] = {
>  	/* Cavium ThunderX, T88 pass 1.x - 2.1 */
>  	MIDR_RANGE(MIDR_THUNDERX, 0, 0, 1, 1),
>  	/* Cavium ThunderX, T81 pass 1.0 */
> diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> index 5e3c4b58f2790..2004b4f41ade6 100644
> --- a/arch/arm64/kernel/image-vars.h
> +++ b/arch/arm64/kernel/image-vars.h
> @@ -47,10 +47,6 @@ PROVIDE(__pi_id_aa64smfr0_override	= id_aa64smfr0_override);
>  PROVIDE(__pi_id_aa64zfr0_override	= id_aa64zfr0_override);
>  PROVIDE(__pi_arm64_sw_feature_override	= arm64_sw_feature_override);
>  PROVIDE(__pi_arm64_use_ng_mappings	= arm64_use_ng_mappings);
> -#ifdef CONFIG_CAVIUM_ERRATUM_27456
> -PROVIDE(__pi_cavium_erratum_27456_cpus	= cavium_erratum_27456_cpus);
> -PROVIDE(__pi_is_midr_in_range_list	= is_midr_in_range_list);
> -#endif

Hmm, I'm not really sure about this as it seems to be punishing the poor
user of the box who really hasn't done anything wrong. The firmware might
not be passing a KASLR seed to the host, but what about guest VMs? It's
pretty easy for the VMM to stuff a seed into the DT, so if somebody was
running VMs on TX1 with kaslr before c8c2647e69bed ("arm64: Make
_midr_in_range_list() an exported function") and things worked, I don't
think we should be breaking that so that it crashes in weird ways.

Could we just read MIDR_EL1 (read_cpuid_id()) in the PI code to detect
ThunderX that way? I'm less fussed about the multi-MIDR code working on
this machine as it's a new feature (and we could disable the new
hypercalls here if we really cared).

Alternatively, we could properly rip out the TX1 support and fail to boot
if we detect it. At least that's deterministic and we could have a useful
error message about the thing being unsupported.

Will

