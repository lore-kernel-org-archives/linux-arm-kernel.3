Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B309CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=syDSn8FwCn4myKFJCIXbZFQJnGch0dw2zPcy4g4QTeo=; b=nzO2h8G6FS9Kco
	Xt0RPqAmLOYMQ4NGSVb810GI4+amXyhA+yf+1Ee34Ue8ohTQARLHMuhedbkCBNEihujE9PcbzO8VY
	OaqXfFz4yaoFcD/6zi5qSmeZSJSZz8B9zDOB18mx6PllrVfIP9054hfaY0EPv+PMb/TyAB+9VpQBn
	YqhbQQKwLV4t+ZHbGifg+QdJ3HHfmWOMrVMFR0/woAU7XKYWGyPyNr/mBI8araIvShgYd4HtFatC+
	OxZkKFHJMkAp4Vic7nYjCj7NV1nqzYatexFDIPWgfiY/e4ULswzqJhJESGJBaUL2SIBITRogdJO0j
	vPZCX0Wn9j/wI+DRGf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCAT-00000003AXG-3YC1;
	Wed, 13 May 2026 16:10:41 +0000
Received: from mail-oa1-x49.google.com ([2001:4860:4864:20::49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCAP-00000003AW3-0MBt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:10:40 +0000
Received: by mail-oa1-x49.google.com with SMTP id 586e51a60fabf-439f0492cfbso517689fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778688635; x=1779293435; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=syDSn8FwCn4myKFJCIXbZFQJnGch0dw2zPcy4g4QTeo=;
        b=tqIkY8GIJsvu9EuAhu17pq0rd1GaMmRwergv1EDemkKNB1e7nXEW/VQ+rnAU9b6Lrq
         w2xgEvPWNJZnD7/3aFkXL7nS8889Tr0EE6O0spiPjp6WqltayewroDGnf24g4SenFZrN
         vNQkGCZ+2kDYvwTRVrDaiuqMmYA/3r0IS+gj3uVI9hvcup56vn+llFrg2UGbZw3mI0/B
         wxVs3jku1y1DDA7oC8RZA6a6y/YP2o78Wd2pi15Mgsn2zbKs5Ka9vZBvPc/Kh3P3H7Ic
         tPk15R8xiaNoXo6rdxxG8bajUIA17AkU9hrViltcrv9OTdZqWoFGjvyEvX5ApAmrXVlt
         fpGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778688635; x=1779293435;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=syDSn8FwCn4myKFJCIXbZFQJnGch0dw2zPcy4g4QTeo=;
        b=QTfQE/2d2tCo/qVBDCDegCD6bKGNfFz7pUlWJb6rfqC6zMqktwGvQshkqvv4webVRZ
         d9Mk0KIYIbRsuecp5ALxb/rn7Okna50V28A9OfCLkpBZoyY0pwPIE2bHPh+Wgfz/jh7X
         TLlUAfoC5d+lsKIF2VQmvA2/rGdqGKEK1scx35XjNou8SjIU2bh3jp+wkGdXSBnMhk39
         zWHryRoSoTxmK35ibZYMLS+768vpzkx2Sp6xeHdmdtD7+Ex3/LHJQeoyhYHW1Vpl/Cjj
         69urGUNZESuxlMX7+yGmTT1VeyR55ghTuyGkkOR/5d6yn/3xu2qMAVLglNBZy1o0e+FR
         zWtw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZqOj0YYJJqh/w+ucCARbedaSaqgZFClMu1EltidNJ3cQLQ3rtwdjiaotJkg/u1sTBchLBE13vyJGoYATQyU5+@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpayy9LYkVHCy9ZhS1UVkqqSMe1q4OeasRV0oeO6hleyhdS1Gj
	HvMWZGWCRBOVUJThWLLGeU/iB3xILwq06+KIR9xSfLnM1cfGfTOhM68Z+LrV3p2/bcRw3rH6Hny
	ii299/N0YHeJhywS8EJipORf56A==
X-Received: from iovs8.prod.google.com ([2002:a05:6602:2bc8:b0:96e:18c2:898c])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1a0c:b0:696:64ab:cd9d with SMTP id 006d021491bc7-69b7a9d330cmr1858550eaf.12.1778688634368;
 Wed, 13 May 2026 09:10:34 -0700 (PDT)
Date: Wed, 13 May 2026 16:10:33 +0000
In-Reply-To: <18d747ea-660a-4ae6-b8b8-365d745352ce@linaro.org> (message from
 James Clark on Mon, 11 May 2026 15:57:13 +0100)
Mime-Version: 1.0
Message-ID: <gsnt8q9ncmti.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v7 00/20] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: alexandru.elisei@arm.com, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_091037_138476_23B0AB3D 
X-CRM114-Status: GOOD (  28.02  )
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


Hi James. Thanks for reviewing.

James Clark <james.clark@linaro.org> writes:

> On 04/05/2026 10:17 pm, Colton Lewis wrote:
>> This series creates a new PMU scheme on ARM, a partitioned PMU that
>> allows reserving a subset of counters for more direct guest access,
>> significantly reducing overhead. More details, including performance
>> benchmarks, can be read in the v1 cover letter linked below.

>> An overview of what this series accomplishes was presented at KVM
>> Forum 2025. Slides [1] and video [2] are linked below.

>> After a few false starts, meeting with Will Deacon and Mark Rutland to
>> discuss implementation ideas, and a few more false starts, I finally
>> have an implementation of dynamic counter reservation that works
>> without disrupting host perf too much. Now the host only loses access
>> to the guest counters when a vCPU resides on the CPU.

>> The key was creating perf_pmu_resched_update, which behaves exactly
>> like perf_pmu_resched except it takes a callback to call in between
>> when the perf events are scheduled out and when they are scheduled
>> back in. That allows us to update the PMU's available counters when we
>> know they are not currently in use without needing to expose private
>> perf core functions and triple check they are not being called in a
>> way that violates existing assumptions.

>> Because this introduces a possibility of perf reschedule during vCPU
>> load, I've optimized to only do that operation if there are host
>> events occupying the intended guest counters at the time of the load.

>> The kernel command line parameter for the driver still exists, but now
>> only defines an upper limit of counters the guest might use rather
>> than taking those counters from the host permanently.

>> v7:

>> * Implement dynamic counter reservation as described above. One side
>>     effect is the PMUv3 driver now needs much fewer changes to enforce
>>     the boundary.

>> * Move register accesses out of fast path for non-FGT hardware. The
>>     performance impact was negligible and this moves bloat out of the
>>     fast path and allows a more reliable design with more code sharing.

>> * Make PMCCNTR a special case in the context swap again because trying
>>     to access it with PMXEVCNTR is undefined.

>> * Fix a bug where kvm_pmu_guest_counter_mask was using & instead of |.

>> * Re-expose the dedicated instruction counter to the host since it was
>>     decided the guest will not own it.

>> * Change the global armv8pmu_reserved_host_counters to
>>     armv8pmu_is_partitoned because it was only used in boolean checks.

>> * Fix typo in vcpu attribute commit so the spelling of the flag in the
>>     commit message matches the code.

>> * Rebase to v7.0-rc7

>> v6:
>> https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/

>> v5:
>> https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/

>> v4:
>> https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/

>> v3:
>> https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/

>> v2:
>> https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/

>> v1:
>> https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/

>> [1]  
>> https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
>> [2]  
>> https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9

>> Colton Lewis (19):
>>     arm64: cpufeature: Add cpucap for HPMN0
>>     KVM: arm64: Reorganize PMU functions
>>     perf: arm_pmuv3: Generalize counter bitmasks
>>     perf: arm_pmuv3: Check cntr_mask before using pmccntr
>>     perf: arm_pmuv3: Add method to partition the PMU
>>     KVM: arm64: Set up FGT for Partitioned PMU
>>     KVM: arm64: Add Partitioned PMU register trap handlers
>>     KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
>>     KVM: arm64: Context swap Partitioned PMU guest registers
>>     KVM: arm64: Enforce PMU event filter at vcpu_load()
>>     perf: Add perf_pmu_resched_update()
>>     KVM: arm64: Apply dynamic guest counter reservations
>>     KVM: arm64: Implement lazy PMU context swaps
>>     perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
>>     KVM: arm64: Detect overflows for the Partitioned PMU
>>     KVM: arm64: Add vCPU device attr to partition the PMU
>>     KVM: selftests: Add find_bit to KVM library
>>     KVM: arm64: selftests: Add test case for Partitioned PMU
>>     KVM: arm64: selftests: Relax testing for exceptions when partitioned

>> Marc Zyngier (1):
>>     KVM: arm64: Reorganize PMU includes

>>    arch/arm/include/asm/arm_pmuv3.h              |  18 +
>>    arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
>>    arch/arm64/include/asm/kvm_host.h             |  17 +-
>>    arch/arm64/include/asm/kvm_types.h            |   6 +-
>>    arch/arm64/include/uapi/asm/kvm.h             |   2 +
>>    arch/arm64/kernel/cpufeature.c                |   8 +
>>    arch/arm64/kvm/Makefile                       |   2 +-
>>    arch/arm64/kvm/arm.c                          |   2 +
>>    arch/arm64/kvm/config.c                       |  41 +-
>>    arch/arm64/kvm/debug.c                        |  31 +-
>>    arch/arm64/kvm/pmu-direct.c                   | 494 ++++++++++++
>>    arch/arm64/kvm/pmu-emul.c                     | 674 +----------------
>>    arch/arm64/kvm/pmu.c                          | 701 ++++++++++++++++++
>>    arch/arm64/kvm/sys_regs.c                     | 250 ++++++-
>>    arch/arm64/tools/cpucaps                      |   1 +
>>    arch/arm64/tools/sysreg                       |   6 +-
>>    drivers/perf/arm_pmuv3.c                      | 111 ++-
>>    include/kvm/arm_pmu.h                         | 110 +++
>>    include/linux/perf/arm_pmu.h                  |   3 +
>>    include/linux/perf/arm_pmuv3.h                |  14 +-
>>    include/linux/perf_event.h                    |   3 +
>>    kernel/events/core.c                          |  28 +-
>>    tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>>    .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
>>    tools/testing/selftests/kvm/lib/find_bit.c    |   1 +
>>    25 files changed, 1861 insertions(+), 787 deletions(-)
>>    create mode 100644 arch/arm64/kvm/pmu-direct.c
>>    create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c


>> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
>> --
>> 2.54.0.545.g6539524ca2-goog

> I tested it a bit and ran the kselftests and it all seems to be working

Great to hear you didn't find any obvious problems with your testing!

> ok. Some of the critical sashiko comments look like they are worth
> looking into though:
> https://sashiko.dev/#/patchset/20260504211813.1804997-1-coltonlewis%40google.com
> For example writing to PMCR_EL0.P from EL2 resets the host's counters,
> even if it's KVM doing it after trapping a write from the guest.

I will comb through this and the other sashiko comments and fix.

