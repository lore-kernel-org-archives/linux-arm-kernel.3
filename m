Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDA0C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 15:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/odHM+paqO5cLwJS2OA3loJjeD1iRiCBbkio+y15QQA=; b=KeUrBw4oJg3dIym8B5hQ+Xn49h
	reOaw6VMZHe7sXgLtUYanOLz8wPnisIGSITsdorqkQBlYTPCfVGefKI2Mo88oaWv7Kq/JK96b4PE9
	ENJoKTQF8wnu1DsUrdE8bzYFpbraHtmE2ADAqgAsXSVKDgwdIIe1EmNCa08s9Aky/ZMH50g8LIuZq
	n6hZ6lcMkgVtjqaV4/WrEqn1/qlzX+3HsYW0D0J2LTbJBaqNhv+Y2gA4F8S4uU09thYpm+uTgGOUR
	Ym4/v+2eQIcrMJw4P4s5oWnW9k3AayfJ1ZtY3ZBMbzaVE+VTesty8H0dCVPUZ5G2VVoQZdhGfzIGD
	LoAApAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojPO-00000005apB-2oLa;
	Tue, 28 Jul 2026 15:07:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wojPM-00000005aoL-09Rs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 15:07:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF3B169E;
	Tue, 28 Jul 2026 08:07:46 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0824B3F66F;
	Tue, 28 Jul 2026 08:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785251270; bh=BD1LV6gEweEYUjcl9ARIkRkGvDhvtnv+9e/uvIhdghI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p/2GpzZ5F0kbQ5EoZfBqT6yq53KWffSqkwhsIwKSHFzBhk0XWz3iHGtbOpnwKHDaR
	 +mZWUXOg8abFit3hXggkmWfs+gpD13GREcrsMwRHMljNbkHBS+FeDf/VC9w1pW9RMp
	 idzWRxlG6MXIBei4T3i++d8CNJbO219W9tqEu8Ng=
Message-ID: <b8b1fbe4-fb73-418a-b43d-086894d31ce8@arm.com>
Date: Tue, 28 Jul 2026 16:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/21] perf: arm_pmuv3: Check cntr_mask before using
 pmccntr
To: Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>,
 Shuah Khan <shuah@kernel.org>,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260612192909.1153907-1-coltonlewis@google.com>
 <20260612192909.1153907-6-coltonlewis@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260612192909.1153907-6-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_080752_128188_0B713F5B 
X-CRM114-Status: GOOD (  15.60  )
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

On 12/06/2026 8:28 pm, Colton Lewis wrote:
> Check cntr_mask before using pmccntr to ensure it's available. With a
> partitioned PMU, there may be instances where pmccntr is being used by
> the guest and will be absent from cntr_mask.
> 
> Signed-off-by: Colton Lewis <coltonlewis@google.com>
> ---
>   drivers/perf/arm_pmuv3.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 1cceb1f614515..17bb1cfdc271c 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1028,7 +1028,8 @@ static int armv8pmu_get_event_idx(struct pmu_hw_events *cpuc,
>   
>   	/* Always prefer to place a cycle counter into the cycle counter. */
>   	if (armv8pmu_can_use_pmccntr(cpuc, event)) {

Something smells wrong here - we can use PMCCNTR but we can't?

> -		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
> +		if (test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask) &&

...i.e. this test would seem to belong in the helper function.

> +		    !test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
>   			return ARMV8_PMU_CYCLE_IDX;
>   		else if (armv8pmu_event_is_64bit(event) &&
>   			   armv8pmu_event_want_user_access(event) &&

Plus it also doesn't make much sense to fall through to the "we _could_ 
accommodate this event if only PMCCNTR was free" case here if we know 
PMCCNTR can never be free because it's not even available.

Thanks,
Robin.

