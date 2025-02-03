Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 749E2C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7OOta64viRWdp2sLVHYMlYidubtYCHU9LCmJU7avvRM=; b=azPVWMgin5gIj4ZaHQwwaQzfIa
	dR5UqbSPQFkdcTL+M2iRvOQtc3yxwBclv5gxKLHj/J8+WG5jdazyeam1uZRr6bi6qWPE0HsJ82+YV
	2YQn+FCOV95dXNOXUtulXaCrXijP0P1K+4kMWH5p+DOtpwWpgPGIsM8Xf9MmUN+qy8CLxrZmYJOH9
	XWEalUNygHEPir8tnys6UMuyENmpYY+nzlpuNRNbZxHa+GUwvElnJwVUFaQ2chtFH+SZgSZPnDbBu
	O4ezw+jEAoCKtP0BlE0VkDLbpi4zxySHX6VA0oVXAvRQsnTq469tO4QonaAti/1EziSssdBwkFQrU
	O6ra+QyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqNR-0000000Efqx-08Ek;
	Mon, 03 Feb 2025 06:56:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teqM6-0000000EflD-33yR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:54:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 280231476;
	Sun,  2 Feb 2025 22:55:14 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 54C8F3F5A1;
	Sun,  2 Feb 2025 22:54:45 -0800 (PST)
Message-ID: <9a4e16af-b5b9-406f-8f9f-4d395a14a61c@arm.com>
Date: Mon, 3 Feb 2025 12:24:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 05/11] perf: arm_v7_pmu: Don't disable counter in
 (armv7|krait_|scorpion_)pmu_enable_event()
To: "Rob Herring (Arm)" <robh@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20250202-arm-brbe-v19-v19-0-1c1300802385@kernel.org>
 <20250202-arm-brbe-v19-v19-5-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-5-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_225450_819312_8B63D7F0 
X-CRM114-Status: GOOD (  15.44  )
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



On 2/3/25 06:12, Rob Herring (Arm) wrote:
> Currently (armv7|krait_|scorpion_)pmu_enable_event() start by disabling
> the event counter it has been asked to enable. This should not be
> necessary as the counter (and the PMU as a whole) should not be active
> when *_enable_event() is called.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/perf/arm_v7_pmu.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/perf/arm_v7_pmu.c b/drivers/perf/arm_v7_pmu.c
> index 7fa88e3b64e0..17831e1920bd 100644
> --- a/drivers/perf/arm_v7_pmu.c
> +++ b/drivers/perf/arm_v7_pmu.c
> @@ -857,8 +857,6 @@ static void armv7pmu_enable_event(struct perf_event *event)
>  		return;
>  	}
>  
> -	armv7_pmnc_disable_counter(idx);
> -
>  	/*
>  	 * Set event (if destined for PMNx counters)
>  	 * We only need to set the event for the cycle counter if we
> @@ -1450,8 +1448,6 @@ static void krait_pmu_enable_event(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  
> -	armv7_pmnc_disable_counter(idx);
> -
>  	/*
>  	 * Set event (if destined for PMNx counters)
>  	 * We set the event for the cycle counter because we
> @@ -1762,8 +1758,6 @@ static void scorpion_pmu_enable_event(struct perf_event *event)
>  	struct hw_perf_event *hwc = &event->hw;
>  	int idx = hwc->idx;
>  
> -	armv7_pmnc_disable_counter(idx);
> -
>  	/*
>  	 * Set event (if destined for PMNx counters)
>  	 * We don't set the event for the cycle counter because we
> 

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

