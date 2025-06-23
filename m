Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FA1C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=iJHuSuwyngESt8WBCKXgeOnblRRUSgRFggwy+8QiK3Q=; b=CHf9bAU6M5/SJI
	qQj1ejxkF5ImjSVJxqZ+VLm0faF+im64KDmZGg5xTuJMMrlbZb19EdB1LFYJWjsIDeA8c+w7EURDy
	dpLVF5Yt5Idm60W/Sx0ay6oUQCKzJR8AzE54l/4hwLkEn7Ved3ZSU3NwgV14jg27F7V9jHIPGsYTS
	EDcdIgmCXDuqong53uYL7ubjdIPUf19Y1zF3YLn3S0POII3ESqtk2xoYL1NyEKi8a88Em5m5vnAOg
	/5GA1GwzKUAUPuJlGqcA7dKJHt76Z1r4C9+hoPH8zD+Et/DrcXzKfhR1gff35pQTlX4vRe7svoarQ
	L56K43UD7KkBvdPJqWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZw-00000004G4c-01Jr;
	Tue, 24 Jun 2025 00:32:00 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlsS-00000003gT0-3twK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 18:26:46 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-4066a4d2d31so823325b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 11:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750703203; x=1751308003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iJHuSuwyngESt8WBCKXgeOnblRRUSgRFggwy+8QiK3Q=;
        b=gZQStVOpTmxayzf6iAB5fBn8wJKXD9MWpqDeyNFvLs1lwMpXWvM6n5B4SMsCXCOBIx
         2qA1xEjBcT36cdVwRLQD/3A5tCj1GbFRiq9+a+sDOV+oieUlWlUVWGRQKV+z0xrR95+m
         qRjVjsAJ4aKuKXDlij1N5xIFrXGZ31/ntz0FQbpKSYWT+pwLGtbw3rvr19bY1fcWchE4
         f7tLnJ49kfgbBE4Dni9JwDlsBqGakQMoeJEiVJObwoR6RFyen7585s83OdqjaLEMz/AF
         9/WSu1a+mlvhvKJ0ZGog769kNvVTL1+GQI7K/ZPqkpeniTFl1osnj1/HvrGQ5A07BjZd
         BzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703203; x=1751308003;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJHuSuwyngESt8WBCKXgeOnblRRUSgRFggwy+8QiK3Q=;
        b=j0IkAdcW8RM1oa1qsvFrR/WyVONV7YlPAt55BkAN/OGDD5C4B5Y0DaL9knB3eAVLDH
         e2/dB8UP2dWQbvpke10Duh2qOp+o4MrZmuL3XomLpQr5Hjaiax9guXaRPIrvzmZqY6Rd
         geCk1DCai+FNPqoD62Y7JclgxOrAfnJbWhhLa7IIDXK8gccQ87nE6gSEq/Pp2AGdTMlt
         r71QXRYv8leMbIoMhzU4H3KlFsdyPUdMIB9Q3X9yY4WlpEjwdVgrSh+5yvjAdc8O1fSu
         21knZ28EvfVp1dP5ZmgN9v7eG2/Fezouf158tpT+MZtfY++Zb3NeUXyK1Q1wi+4lizx7
         rtRg==
X-Forwarded-Encrypted: i=1; AJvYcCUjkvRd9W/ons6tUGhQC1nPpPswolUw2MEiL97Qrm/yN2kJkJ3qRZO+CrtyiFs4Pp1YbGa6y4ivz3eiAI+ZQZx/@lists.infradead.org
X-Gm-Message-State: AOJu0YwZnhnFY3mRgideHtyyEbg6iRve7CHlXw7TqB79xTwlaKHElmkZ
	p1ewYphIhvcpoQDdajEdYIlwRrwMnoKQaiFbXzjprp3Aq0irSunS5+SxMuGZWqo6pq2QknpojSb
	rMDWKvvVKTkKdONXWKCB3lKsdYw==
X-Google-Smtp-Source: AGHT+IGC715JfAZ6bB+MUmt3e2UkqjENUKLIOq46BUMkNYiBZaTpU+l16Sml2Ik55e/lBKhpSWes9ItyhVpKmkS24Q==
X-Received: from oirr11.prod.google.com ([2002:a05:6808:840b:b0:40a:c991:8f3c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1645:b0:401:918a:5b89 with SMTP id 5614622812f47-40ac6ef30e6mr10779472b6e.26.1750703203710;
 Mon, 23 Jun 2025 11:26:43 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:26:42 +0000
In-Reply-To: <aFYFqrYRsmCi6oii@linux.dev> (message from Oliver Upton on Fri,
 20 Jun 2025 18:06:50 -0700)
Mime-Version: 1.0
Message-ID: <gsntpleu9uvx.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v2 07/23] perf: arm_pmuv3: Introduce method to partition
 the PMU
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, mark.rutland@arm.com, shuah@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_112644_970904_B3461DB6 
X-CRM114-Status: GOOD (  36.82  )
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

Oliver Upton <oliver.upton@linux.dev> writes:

> On Fri, Jun 20, 2025 at 10:13:07PM +0000, Colton Lewis wrote:
>> For PMUv3, the register field MDCR_EL2.HPMN partitiones the PMU
>> counters into two ranges where counters 0..HPMN-1 are accessible by
>> EL1 and, if allowed, EL0 while counters HPMN..N are only accessible by
>> EL2.

>> Create module parameters partition_pmu and reserved_guest_counters to
>> reserve a number of counters for the guest. These numbers are set at
>> boot because the perf subsystem assumes the number of counters will
>> not change after the PMU is probed.

>> Introduce the function armv8pmu_partition() to modify the PMU driver's
>> cntr_mask of available counters to exclude the counters being reserved
>> for the guest and record reserved_guest_counters as the maximum
>> allowable value for HPMN.

>> Due to the difficulty this feature would create for the driver running
>> at EL1 on the host, partitioning is only allowed in VHE mode. Working
>> on nVHE mode would require a hypercall for every counter access in the
>> driver because the counters reserved for the host by HPMN are only
>> accessible to EL2.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm/include/asm/arm_pmuv3.h   | 10 ++++
>>   arch/arm64/include/asm/arm_pmuv3.h |  5 ++
>>   drivers/perf/arm_pmuv3.c           | 95 +++++++++++++++++++++++++++++-
>>   include/linux/perf/arm_pmu.h       |  1 +
>>   4 files changed, 109 insertions(+), 2 deletions(-)

>> diff --git a/arch/arm/include/asm/arm_pmuv3.h  
>> b/arch/arm/include/asm/arm_pmuv3.h
>> index 2ec0e5e83fc9..9dc43242538c 100644
>> --- a/arch/arm/include/asm/arm_pmuv3.h
>> +++ b/arch/arm/include/asm/arm_pmuv3.h
>> @@ -228,6 +228,11 @@ static inline bool kvm_set_pmuserenr(u64 val)

>>   static inline void kvm_vcpu_pmu_resync_el0(void) {}

>> +static inline bool has_vhe(void)
>> +{
>> +	return false;
>> +}
>> +

> This has nothing to do with PMUv3, I'm a bit surprised to see you're
> touching 32-bit ARM. Can you just gate the whole partitioning thing on
> arm64?

The PMUv3 driver also has to compile on 32-bit ARM.

My first series had the partitioning code in arch/arm64 but you asked me
to move it to the PMUv3 driver.

How are you suggesting I square those two requirements?

>> +static bool partition_pmu __read_mostly;
>> +static u8 reserved_guest_counters __read_mostly;
>> +
>> +module_param(partition_pmu, bool, 0);
>> +MODULE_PARM_DESC(partition_pmu,
>> +		 "Partition the PMU into host and guest VM counters [y/n]");
>> +
>> +module_param(reserved_guest_counters, byte, 0);
>> +MODULE_PARM_DESC(reserved_guest_counters,
>> +		 "How many counters to reserve for guest VMs [0-$NR_COUNTERS]");
>> +

> This is confusing and not what we discussed offline.

> Please use a single parameter that describes the number of counters used
> by the *host*. This affects the *host* PMU driver, KVM can discover (and
> use) the leftovers.

> If the single module parameter goes unspecified the user did not ask for
> PMU partitioning.

I understand what we discussed offline, but I had a dilemma.

If we do a single module parameter for number of counters used by the
host, then it defaults to 0 if unset and there is no way to distinguish
between no partitioning and a request for partitioning reserving 0
counters to the host which I also thought you requested. Would you be
happy leaving no way to specify that?

In any case, I think the usage is more self explainatory if
partitition=[y/n] is a separate bit. The other parameter for guest
reservation is then based on a consideration of what an unset parameter
should mean and I decided it's a more sane default if partition=y
[other-param]=0/unset gives 0 counters to the guest.

It does affect the host, but by default the host owns everything. The
only people who will be tweaking these parameters are going to be
concerned with how many counters the guest gets and I think the
parameters should reflect that intent.

>> +/**
>> + * armv8pmu_reservation_is_valid() - Determine if reservation is allowed
>> + * @guest_counters: Number of host counters to reserve
>> + *
>> + * Determine if the number of host counters in the argument is
>> + * allowed. It is allowed if it will produce a valid value for
>> + * register field MDCR_EL2.HPMN.
>> + *
>> + * Return: True if reservation allowed, false otherwise
>> + */
>> +static bool armv8pmu_reservation_is_valid(u8 guest_counters)
>> +{
>> +	return guest_counters <= armv8pmu_pmcr_n_read();
>> +}
>> +
>> +/**
>> + * armv8pmu_partition_supported() - Determine if partitioning is  
>> possible
>> + *
>> + * Partitioning is only supported in VHE mode (with PMUv3, assumed
>> + * since we are in the PMUv3 driver)
>> + *
>> + * Return: True if partitioning is possible, false otherwise
>> + */
>> +static bool armv8pmu_partition_supported(void)
>> +{
>> +	return has_vhe();
>> +}
>> +
>> +/**
>> + * armv8pmu_partition() - Partition the PMU
>> + * @pmu: Pointer to pmu being partitioned
>> + * @guest_counters: Number of host counters to reserve
>> + *
>> + * Partition the given PMU by taking a number of host counters to
>> + * reserve and, if it is a valid reservation, recording the
>> + * corresponding HPMN value in the hpmn field of the PMU and clearing
>> + * the guest-reserved counters from the counter mask.
>> + *
>> + * Passing 0 for @guest_counters has the effect of disabling  
>> partitioning.
>> + *
>> + * Return: 0 on success, -ERROR otherwise
>> + */
>> +static int armv8pmu_partition(struct arm_pmu *pmu, u8 guest_counters)
>> +{
>> +	u8 nr_counters;
>> +	u8 hpmn;
>> +
>> +	if (!armv8pmu_reservation_is_valid(guest_counters))
>> +		return -EINVAL;
>> +
>> +	nr_counters = armv8pmu_pmcr_n_read();
>> +	hpmn = guest_counters;
>> +
>> +	pmu->hpmn_max = hpmn;

> I'm not sure the host driver needs this for anything, KVM just needs to
> know what's potentially in use by the host.

>> +	/* Inform host driver of available counters */

> ... said the driver to itself :)

I can delete that comment now :)

