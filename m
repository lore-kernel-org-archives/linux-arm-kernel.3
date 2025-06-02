Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01801C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 12:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENM888yDfen7xAnog6XgzRUHBxfUT7iAXsAOptsOaU0=; b=5FJNTxAEowqwvgQ8wPCJ+WxKjT
	+Ahg62//c70QRplc7askafyScbFCmGM8w/6byt1g+3Fbqkv/CP9V9q2kSQM1/1pjm3fLmr/yPDYjV
	CuvFZpzmyU0x6MkaoZLcP/7LM9EQyFTxN2J7by7BKbD6UBWcdH1CcDs3AwdBXprcphHLYJT+9q7tz
	X/QDUQhOgrQtcYREygp26DfCgekUZt4Afax1Bx/ru5gHDUwZgvPeL4NXJUkSDKOmr99IMFDY5Wfta
	L0skJ3XQRm6TsXLqqV+6f7ZuhCVgfE7kT0mYJYhxXjnBOIwpoC4N0+B/47z32xmXKu6bR9oX36u31
	FUjSgw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM40D-00000007KlE-0HRI;
	Mon, 02 Jun 2025 12:10:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM3y1-00000007KdL-1fhQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 12:08:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B9E544790;
	Mon,  2 Jun 2025 12:08:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F5FC4CEEB;
	Mon,  2 Jun 2025 12:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748866116;
	bh=RWnKqnsp/1FPSmsLUS6zSkCoSv/M0/RRRwTSRXV15KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnQbUZh+AAvUo4bP4YVgd28E2selhWXfBfNabZ8fl/du2Tgf8mecvuCTqSgETjFlz
	 JtE30ZuJJgb4Vvs4wtvIPWWKZIT5R6R6efGyLeg4OIg2hi7cOiznQOJfGEDh6XeDK2
	 7CxyBla1qruWQUbcGwhOl29xpBHdvGxEFZthuK8YbbuYjqlb17vGOHyOU2Sn/Vmuz2
	 WsNz43tQtMcnbGnjz2gn0onTEPwyncVpjOtg/3UabypFZztPggeswuABynujt/kZpm
	 /qUBvR+vHJ59dyP5Bb7UkbjRPme0tBE58e/FTXXo+H6blgKs215F9fnlMQGM1EXY4n
	 /njeB8f4ynknA==
Date: Mon, 2 Jun 2025 13:08:31 +0100
From: Will Deacon <will@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mingwei Zhang <mizhang@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Add MIDR-based check for FEAT_ECBHB
Message-ID: <20250602120831.GC1227@willie-the-truck>
References: <20250522204148.4007406-1-oliver.upton@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522204148.4007406-1-oliver.upton@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_050837_488483_C20FC72A 
X-CRM114-Status: GOOD (  21.87  )
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

On Thu, May 22, 2025 at 01:41:48PM -0700, Oliver Upton wrote:
> Prior to commit e8cde32f111f ("arm64/cpufeatures/kvm: Add ARMv8.9
> FEAT_ECBHB bits in ID_AA64MMFR1 register") KVM was erroneously masking
> FEAT_ECBHB from VMs, giving the perception that safe implementations are
> actually vulnerable to Spectre-BHB. And, after commit e403e8538359
> ("arm64: errata: Assume that unknown CPUs _are_ vulnerable to Spectre
> BHB") guests are enabling the loop mitigation.
> 
> This broken virtual hardware is going to be around for some time, so do
> the ugly thing and check for revisions of Neoverse-V2 [1], Cortex-X3 [2],
> Cortex-A720 [3], and Neoverse-N3 [4] that are documented to have FEAT_ECBHB.
> 
> Cc: stable@vger.kernel.org
> Link: https://developer.arm.com/documentation/102375/0002
> Link: https://developer.arm.com/documentation/101593/0102
> Link: https://developer.arm.com/documentation/102530/0002
> Link: https://developer.arm.com/documentation/107997/0001
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
> ---
> 
> I thoroughly hate this but the alternative of nuking these busted VMs
> isn't exactly popular...
> 
>  arch/arm64/include/asm/cputype.h |  1 +
>  arch/arm64/kernel/proton-pack.c  | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index d1cc0571798b..5c6152e61cad 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -282,6 +282,7 @@ struct midr_range {
>  #define MIDR_REV_RANGE(m, v, r_min, r_max) MIDR_RANGE(m, v, r_min, v, r_max)
>  #define MIDR_REV(m, v, r) MIDR_RANGE(m, v, r, v, r)
>  #define MIDR_ALL_VERSIONS(m) MIDR_RANGE(m, 0, 0, 0xf, 0xf)
> +#define MIDR_MIN_VERSION(m, v, r) MIDR_RANGE(m, v, r, 0xf, 0xf)
>  
>  static inline bool midr_is_cpu_model_range(u32 midr, u32 model, u32 rv_min,
>  					   u32 rv_max)
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index b198dde79e59..3d00d4c22d58 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -962,8 +962,24 @@ static bool has_spectre_bhb_fw_mitigation(void)
>  
>  static bool supports_ecbhb(int scope)
>  {
> +	static const struct midr_range spectre_ecbhb_list[] = {
> +		MIDR_MIN_VERSION(MIDR_NEOVERSE_V2, 0, 2),
> +		MIDR_MIN_VERSION(MIDR_CORTEX_X3, 1, 1),
> +		MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N3),
> +		MIDR_MIN_VERSION(MIDR_CORTEX_A720, 0, 1),
> +		{},
> +	};
>  	u64 mmfr1;
>  
> +	/*
> +	 * Prior to commit e8cde32f111f ("arm64/cpufeatures/kvm: Add ARMv8.9
> +	 * FEAT_ECBHB bits in ID_AA64MMFR1 register"), KVM masked FEAT_ECBHB
> +	 * on implementations that actually have the feature. That sucks; infer
> +	 * presence of FEAT_ECBHB based on MIDR.
> +	 */
> +	if (is_midr_in_range_list(spectre_ecbhb_list))
> +		return true;
> +

I really don't think we want to go down this route.

If finer grained control of the spectre mitigations is needed, I think
extending the existing command-line options is probably the best bet
rather then inferring behaviours based on the MIDR.

Will

