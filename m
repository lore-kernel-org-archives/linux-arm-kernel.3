Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEEDFC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 06:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8r6AKNJpPBkD6/PB44tuhAlf71wY3nDDWA+p1FP4gU=; b=SwiGF2F7ZJVLgl3IQdud0L2M/0
	MY5vnfY9t2tY20lFopjO6HiKH1x/U4W6Tkb9wU9RbSPLR34oenJJUZ0jRzAIDD2OCkM31c+/MRnvf
	l7yAwGjyufhloQlY5AGcUdkmcROTlzaKWe0SAjBS0dssq5oDVfb0IuAe2mCEtbSuK3fCLj5I8fB/Z
	wwj21wB89yujNmuoiPXJTT/VVbPWmmDUm1zdt6tT4r5wv3Ag+gUhi5MrucNxdYxtElcxnPg3NJxRm
	WHXWZNts2u2xpN36bTALug2bJxE8ws9Q63jyJhvPKlMQ1u6z/R+v0OZuZqwtXGAlws7LBdDHkXwpB
	4TMu9iCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teq7q-0000000Ef2W-13PQ;
	Mon, 03 Feb 2025 06:40:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teq6V-0000000Eexr-3xdL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 06:38:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8FC21476;
	Sun,  2 Feb 2025 22:39:06 -0800 (PST)
Received: from [10.162.16.79] (unknown [10.162.16.79])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 187F73F63F;
	Sun,  2 Feb 2025 22:38:37 -0800 (PST)
Message-ID: <8584f5cc-70b0-46a0-9582-8d7b4d491ba6@arm.com>
Date: Mon, 3 Feb 2025 12:08:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 03/11] perf: arm_pmuv3: Don't disable counter in
 armv8pmu_enable_event()
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
 <20250202-arm-brbe-v19-v19-3-1c1300802385@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250202-arm-brbe-v19-v19-3-1c1300802385@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_223844_030166_042E252F 
X-CRM114-Status: GOOD (  16.64  )
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
> From: Mark Rutland <mark.rutland@arm.com>
> 
> Currently armv8pmu_enable_event() starts by disabling the event counter
> it has been asked to enable. This should not be necessary as the counter
> (and the PMU as a whole) should not be active when
> armv8pmu_enable_event() is called.
Makes sense.

> 
> Remove the redundant call to armv8pmu_disable_event_counter(). At the
> same time, remove the comment immeditately above as everything it says

s/immeditately/immediately

> is obvious from the function names below.

But should this comment drop change be folded into the next patch which
exclusively drops all obviously redundant disable/enable comments.

> 
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/perf/arm_pmuv3.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 9ebc950559c0..5406b9ca591a 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -795,11 +795,6 @@ static void armv8pmu_enable_user_access(struct arm_pmu *cpu_pmu)
>  
>  static void armv8pmu_enable_event(struct perf_event *event)
>  {
> -	/*
> -	 * Enable counter and interrupt, and set the counter to count
> -	 * the event that we're interested in.
> -	 */
> -	armv8pmu_disable_event_counter(event);
>  	armv8pmu_write_event_type(event);
>  	armv8pmu_enable_event_irq(event);
>  	armv8pmu_enable_event_counter(event);
> 

Otherwise LGTM.

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

