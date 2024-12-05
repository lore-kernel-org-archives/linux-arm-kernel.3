Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8105E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7DoeE3TYVVni0K1JKpeJT+u+a+Z3VlU3EP3kgxgJns=; b=AuUzhOPx4NbDACQOMwUaashlYo
	lIv5s8f3Oa+uyK1tqQf9EfZVpSm9bEpkA8sZACh60kOiiNCxR5qT3VxqZBPa8qBSAwKNVnuTkkz5E
	IbWC/vQ0C0MWSML6mGUkFS63kYpBrd9bMOkFTP29SRnomz69l7DIH+BlxjsDXQM18+yqWwkdOQ1Hn
	A2aw7id+mH42bG46KAYgnS81KX1ZeDwM55n0XzSPhYhU4yYWkvTQPyL/3GTiz58B/f0VDgyIbvtKX
	6AIWITetFSTYMOTOCwsMcWUJFylBmVg1SobHiGbZIRrk5HDqRxbItqRMHHkRHRI4u8sMaBVpXMiyv
	JRTlwq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCmb-0000000GJiP-3cLQ;
	Thu, 05 Dec 2024 14:24:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJClb-0000000GJcF-0shz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 14:23:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B0281063;
	Thu,  5 Dec 2024 06:24:10 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE54B3F5A1;
	Thu,  5 Dec 2024 06:23:40 -0800 (PST)
Date: Thu, 5 Dec 2024 14:23:35 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: will@kernel.org, catalin.marinas@arm.com, joro@8bytes.org,
	jean-philippe@linaro.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	ryan.roberts@arm.com, broonie@kernel.org
Subject: Re: [PATCH 2/2] arm64: cpufeature: Add GCS to cpucap_is_possible()
Message-ID: <Z1G3Z9C9efBkVKjR@J2N7QTR9R3>
References: <68a37b00a720f0827cac0e4f40e4d3a688924054.1733406275.git.robin.murphy@arm.com>
 <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <416c7369fcdce4ebb2a8f12daae234507be27e38.1733406275.git.robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_062343_290315_D7BE06FE 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Dec 05, 2024 at 01:48:10PM +0000, Robin Murphy wrote:
> Since system_supports_gcs() ends up referring to cpucap_is_possible(),
> teach the latter about GCS for consistency with similar features.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Looking around, we should probably do the same for HAFT.

Mark.

> ---
>  arch/arm64/include/asm/cpucaps.h    | 2 ++
>  arch/arm64/include/asm/cpufeature.h | 3 +--
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
> index 201a46efd918..cbbf70e0f204 100644
> --- a/arch/arm64/include/asm/cpucaps.h
> +++ b/arch/arm64/include/asm/cpucaps.h
> @@ -44,6 +44,8 @@ cpucap_is_possible(const unsigned int cap)
>  		return IS_ENABLED(CONFIG_ARM64_TLB_RANGE);
>  	case ARM64_HAS_S1POE:
>  		return IS_ENABLED(CONFIG_ARM64_POE);
> +	case ARM64_HAS_GCS:
> +		return IS_ENABLED(CONFIG_ARM64_GCS);
>  	case ARM64_UNMAP_KERNEL_AT_EL0:
>  		return IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0);
>  	case ARM64_WORKAROUND_843419:
> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> index b64e49bd9d10..8b4e5a3cd24c 100644
> --- a/arch/arm64/include/asm/cpufeature.h
> +++ b/arch/arm64/include/asm/cpufeature.h
> @@ -847,8 +847,7 @@ static inline bool system_supports_poe(void)
>  
>  static inline bool system_supports_gcs(void)
>  {
> -	return IS_ENABLED(CONFIG_ARM64_GCS) &&
> -		alternative_has_cap_unlikely(ARM64_HAS_GCS);
> +	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
>  }
>  
>  static inline bool system_supports_haft(void)
> -- 
> 2.39.2.101.g768bb238c484.dirty
> 

