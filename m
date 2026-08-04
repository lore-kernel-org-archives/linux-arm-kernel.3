Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE774C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 21:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=OoNJERa7N+ihiUvZZhE29iP6C+dCF84EVkVoe6Oj4kU=; b=zUmAcmicch951r
	HxO8jH/9Qg4+UeLAGzij3hxboAuktE1gs5h1mr2avRXDf9FbnXJ12Xz8aGZcCrGxxEzXboiPSRjJE
	LIMJAeFg4K/3kjabuE6VQDfshp0T0s1Nrtu1CRQIqX4f2+f7cOYoa+JTFfK7rRKQ0zg0zFfR7FpdY
	RzhkHfIvqgSkhaDsrEWm1AL5pjMVcqdTNwxjOCzJdTT8yHcoGGAlFbwJVxBxwFBXHgOxe9TscV4nV
	YgalV0oPv909U4d/CNxN/YVlc3xvmft/i5QdBTH6NeJ45lxzJuj5LkS3R+dK+rbK33VAl2HYPnNI7
	NfdJ3D7hnD8lH6WoZIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMdg-00000002oWa-3e3w;
	Tue, 04 Aug 2026 21:25:32 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrMdd-00000002oWB-2xPn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 21:25:31 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-49d4cb3ca23so345379b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 14:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785878728; x=1786483528; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OoNJERa7N+ihiUvZZhE29iP6C+dCF84EVkVoe6Oj4kU=;
        b=B/RV4UjlWwi+AUd3DUicJpc+YtgwwagYPWl6pxiMInx5b50PGU6WQoHXxY3tfED77t
         pctLPkQ8v3wy14o1ATyHdJzlZ1ByMcmpvqCDX3i77S1q0xbtHtCN5XW47ipE0+lP45U0
         N50C7LXN1W2NtHe69GB35ra7zTtp04pL2b41/yDSruaPmgNHABcRR/ax4hsph8I1J2/Y
         aJNk8bCNFXCMJKsFlqayjpkZGkfRfQBK5Su8du/oxeIOQMMqnG0q2ZJPwpigqrSLIYQC
         PQaU8be45WTgftuuOLb4HMQe83kRCjfxhEbAPi5KJ3mjUmnuE8hcpmy80BVes8XW0TrV
         Tqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785878728; x=1786483528;
        h=content-type:cc:to:from:subject:message-id:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OoNJERa7N+ihiUvZZhE29iP6C+dCF84EVkVoe6Oj4kU=;
        b=At4wGzhV8uQVGqylejHa2V8NPPLjVzpSpgzdkjwy4ANa1/cXinXEPBgKtSGcsq4f+2
         3etv0F1z2YwKiF/s6F23haNTXPJmTLwACfmzPBxs594C/ZcARBYy53ez/GoZhQ4MZtmb
         HK1PTTeHcLTEzzIZglZRzdZ/9e3m6aCCtrxS/1V2lmRIAYSGbfBu/XqMsiGy6c9cffj9
         BPXRFgWwDc1IYYEDIVtHFeGmeZ1n5gFx5vITKZAXV0C0QsxQf0m88TDH1Q3o23FtTwd4
         ViHJwlA8Cwy0TgfseWuzQcVUoXKXnmcxGY1/4jVYKPjE0lLDtxw7sobDsano/8C1M3ls
         PAjQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwStW69btFiZQ7HsAdGxtEa7C5ZkNpoRf3utw0yIIyOGnCYF3VuP51V2ck808LZRh005y9ZYHYin1Kj5IC/Z10@lists.infradead.org
X-Gm-Message-State: AOJu0Yyx2MrzW4qYlThZ6GUsUKcUK1gXCn54yqdtAEe9MjrlhiSJqxww
	AOoT+kJFOO3M+py9+BmFuosTmx+LeLmwVVTvOG/Z1rrYkc0Z4x2Jvo4+naicGR+9bNBRufq6/NZ
	loCtlYhXuFOUK8nTLzKN/xU4O3Q==
X-Received: from iobmp17-n2.prod.google.com ([2002:a05:6602:a2d1:20b0:9ab:7c1:c30a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3986:b0:495:f85b:d08f with SMTP id 5614622812f47-4afadfd7dc5mr1041308b6e.18.1785878727621;
 Tue, 04 Aug 2026 14:25:27 -0700 (PDT)
Date: Tue, 04 Aug 2026 21:25:27 +0000
In-Reply-To: <b8b1fbe4-fb73-418a-b43d-086894d31ce8@arm.com> (message from
 Robin Murphy on Tue, 28 Jul 2026 16:07:44 +0100)
Mime-Version: 1.0
Message-ID: <gsntpkzxvarc.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 05/21] perf: arm_pmuv3: Check cntr_mask before using pmccntr
From: Colton Lewis <coltonlewis@google.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: kvm@vger.kernel.org, alexandru.elisei@arm.com, pbonzini@redhat.com, 
	corbet@lwn.net, linux@armlinux.org.uk, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	james.clark@linaro.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_142529_753753_BEFC2DFE 
X-CRM114-Status: GOOD (  17.22  )
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

Hi Robin, thanks for the review

Robin Murphy <robin.murphy@arm.com> writes:

> On 12/06/2026 8:28 pm, Colton Lewis wrote:
>> Check cntr_mask before using pmccntr to ensure it's available. With a
>> partitioned PMU, there may be instances where pmccntr is being used by
>> the guest and will be absent from cntr_mask.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>    drivers/perf/arm_pmuv3.c | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)

>> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
>> index 1cceb1f614515..17bb1cfdc271c 100644
>> --- a/drivers/perf/arm_pmuv3.c
>> +++ b/drivers/perf/arm_pmuv3.c
>> @@ -1028,7 +1028,8 @@ static int armv8pmu_get_event_idx(struct  
>> pmu_hw_events *cpuc,

>>    	/* Always prefer to place a cycle counter into the cycle counter. */
>>    	if (armv8pmu_can_use_pmccntr(cpuc, event)) {

> Something smells wrong here - we can use PMCCNTR but we can't?

>> -		if (!test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
>> +		if (test_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->cntr_mask) &&

> ...i.e. this test would seem to belong in the helper function.
>> +		    !test_and_set_bit(ARMV8_PMU_CYCLE_IDX, cpuc->used_mask))
>>    			return ARMV8_PMU_CYCLE_IDX;
>>    		else if (armv8pmu_event_is_64bit(event) &&
>>    			   armv8pmu_event_want_user_access(event) &&

> Plus it also doesn't make much sense to fall through to the "we _could_
> accommodate this event if only PMCCNTR was free" case here if we know
> PMCCNTR can never be free because it's not even available.

I agree it would be a good idea to refactor these if statements.

Probably something like:

/* tests moved to `armv8pmu_can_use_pmccntr` */
if (armv8pmu_can_use_pmccntr()) {
	set_bit(ARMV8_PMU_CYCLE_IDX, cpu_pmu->used_mask);
         return ARMV8_PMU_CYCLE_IDX;
}

if (armv8pmu_event_is_64bit(event) &&
     armv8pmu_event_want_user_access(event) &&
     !armv8pmu_has_long_event(cpu_pmu))
	return -EAGAIN;

