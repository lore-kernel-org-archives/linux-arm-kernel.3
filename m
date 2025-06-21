Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0DADC7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 00:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kpi3z/hNG1omr0pyfwgE93KYt7IiamCkriHdc1+ZtYI=; b=lm41ez8HbPbMD4OCvp6INQVqeh
	7Ukl3JtA3GH2ETnju/yEeFR0VrPV2pCzlmJ679ucW4S2A+PKHExV02fGtq26e0Rygkl1WG5osUmHH
	ARpQnW6wpQ0wUM56A7itRSj5EGjnYkhgw+Zo4RzNb0M9kgMJWTLuolejvfITu+tn89sUUlAp6eQK0
	v5VR7WOvWLg6Jf1xQhTLzdWdG70XQruRx11jchhd5SummqAUgavHJF1gNWESebTCOTVmuOQjNKdc7
	NQubNxd5XKc600r9FRZzfGqVoj5nYXqHMjhX402NxM5e0MCpFedc0nK7ga2kHeTIggnslIMkZJwdr
	DKpBfrrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmRF-0000000Gsln-3bdD;
	Sat, 21 Jun 2025 00:50:33 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSmMX-0000000GsJZ-2BQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 00:45:43 +0000
Date: Fri, 20 Jun 2025 17:45:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750466738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kpi3z/hNG1omr0pyfwgE93KYt7IiamCkriHdc1+ZtYI=;
	b=vCuYaekTWBlPi19QjJ6BkAuNfYaHJHZpoZH6fyYfCKbSeZ3TbNq0iuiNshL0PH0BNKBq6s
	FXYMCBwxw/y1EmA2UzvuntJoB0IpgIMBryhmTdlEx+Raib3BifedgKp08j9RSP940/ctKF
	dS8wOC5a5WYT+OkVB0l8XRSb9/GZTFM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 03/23] arm64: cpufeature: Add cpucap for PMICNTR
Message-ID: <aFYAq7GcSx4pTK9Y@linux.dev>
References: <20250620221326.1261128-1-coltonlewis@google.com>
 <20250620221326.1261128-4-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620221326.1261128-4-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_174541_709699_B1C8860E 
X-CRM114-Status: GOOD (  16.36  )
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

On Fri, Jun 20, 2025 at 10:13:03PM +0000, Colton Lewis wrote:
> Add a cpucap for FEAT_PMUv3_PMICNTR, meaning there is a dedicated
> instruction counter as well as the cycle counter.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>

I don't see this capability being used in this series.

Thanks,
Oliver

> ---
>  arch/arm64/kernel/cpufeature.c | 7 +++++++
>  arch/arm64/tools/cpucaps       | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 278294fdc97d..85dea9714928 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -2904,6 +2904,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>  		.matches = has_cpuid_feature,
>  		ARM64_CPUID_FIELDS(ID_AA64DFR0_EL1, HPMN0, IMP)
>  	},
> +	{
> +		.desc = "PMU Dedicated Instruction Counter",
> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
> +		.capability = ARM64_HAS_PMICNTR,
> +		.matches = has_cpuid_feature,
> +		ARM64_CPUID_FIELDS(ID_AA64DFR1_EL1, PMICNTR, IMP)
> +	},
>  #ifdef CONFIG_ARM64_SME
>  	{
>  		.desc = "Scalable Matrix Extension",
> diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> index 5b196ba21629..6dd72fcdd612 100644
> --- a/arch/arm64/tools/cpucaps
> +++ b/arch/arm64/tools/cpucaps
> @@ -47,6 +47,7 @@ HAS_LSE_ATOMICS
>  HAS_MOPS
>  HAS_NESTED_VIRT
>  HAS_PAN
> +HAS_PMICNTR
>  HAS_PMUV3
>  HAS_S1PIE
>  HAS_S1POE
> -- 
> 2.50.0.714.g196bf9f422-goog
> 

