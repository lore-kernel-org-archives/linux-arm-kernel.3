Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C1CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyL9i2Ps9ihe0zv6AT1n4AgSwB0/Wr45TQsgHUUycf0=; b=Kbc4JVMyNQGCWq7UHM7Z/wq2vv
	eAviTVBrNf2JUzlvFFdltrBxtX/JrAzoFi3rghl/EfOfRi3x1UihIW+E1hyqkGDfD/vm6kbV81SJr
	9uzOm3mBEWMPkDkJXlqJcfjz2c+UF9KUM1ZMZj5gLnijdigUlFeGf+xJ7/nicKpb9zeJZLdPUZ2VO
	AAH1qx5de9rrbKyojDxaznUu6xNoIBQ0FuS7RidxGcW8KOxmnFIJSFmcmcaxE1nJaJARZwc5zsgXc
	KmXmL2EQ+d+NyqxJtvcStKY0cfSfB+7z6iPbPAXyTnS/85imU/Gn36unfla4uQ7a+Eho9F6i7Iyav
	tJ94CklQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS4N-0000000Dy6A-2aFg;
	Mon, 11 May 2026 14:57:19 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMS4L-0000000Dy5S-0MCN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 14:57:18 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so2611667f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 07:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778511435; x=1779116235; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QyL9i2Ps9ihe0zv6AT1n4AgSwB0/Wr45TQsgHUUycf0=;
        b=Jz+Z+u2qO+bjIuiYc56WVIRg/x7U2BmsMehr1IdLIWXHd3iaFOPM3xUNZdX+6nkfgU
         f3ui71VdFgAjHk7rQPQ8HFS/K+LcnfIJG+QJyoWtyytpF+d4UDwiRHjjhgVjUBXLZ5aq
         gnHTWSB7uoSlr2/Tz1pGMqeILppdPZMSUULXpIw5W29EN5qCqugYYUnFsxu0mIT+0LSG
         pTvyBHrOCFffYoxlSW3a8GDJ4rujRcNNCPIYfMnEPT2rZnWemup0RbvYuYtDpDWdtX3E
         03fN7+Q38aIOSm325W4z8MATTCONKAAzaipLWHatQc60VsrOP+3M1pYjXuqRJoECw7rr
         JNgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778511435; x=1779116235;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QyL9i2Ps9ihe0zv6AT1n4AgSwB0/Wr45TQsgHUUycf0=;
        b=hWAVgGfonEURIQZVz8wHMFbygzi0trw3YOBo7fmmJT23i1CQ9QI7edg4m3mK2uc1I2
         JYDtM+WNKd26pwFg7rkjVgTRygTJS0xQUo/IzhJyob3FKm6zn9AUlxfBA8K61CUb0SPT
         kJonrdBUSEdJ+xy8q/ywjLpiLOOOwqT5ovyzG6vBHuZD8r2cC5FlE6nT+1S0Zxw8IIiJ
         06EliqazrNO0wSxReAIV0eyCwLRAYSLA0Bj+Gepgm5ziK8ZKHknR66aUO2vlL4ACrlIM
         mW5cMSPfJZXCFZWrZAvxbjaXK6ujeWDO0Aua0OIS0pK0q6NIkhc8GzXdR+ogpE2kn3B2
         e1yw==
X-Forwarded-Encrypted: i=1; AFNElJ9o8mtBVaIWQFQP3Va52AJGL4B6aElezRfuX9rl595dZSNuaKyHpAckDa10HoBou/bbbIKUy003BiTTTUeKaiuL@lists.infradead.org
X-Gm-Message-State: AOJu0YxJbeiHIEUlwM4YjSPJNpZCEEFa1EEpIT+tefJVGk59xPNCQOkT
	GgJQKmeyfHaAdA8UzFpdOKWVWw/DwxHQDLT5nPER/HUDmI4inAodACaPBXkgaD02lSk=
X-Gm-Gg: Acq92OGNbCzQpcwzJ+ayIjYYIOXRlOzlyhXaOUDT4Bp29+b79C5noUnuLZmm+Ih5G5O
	cp53g53ttlqLOeosWtlZaCa3Gls/0SjReZcPbm3y6kep5l9qSwXh2OBejHdGgeJiRIsUJExpUSA
	qcAWSSgyYWMEYaeJ+8VY2plY1nE2gnUGO/rsRpVSOjGNzK65uATh+6/mI+6JWdYAVKL/cgOZIrb
	kMo1ofJAVeUvFusz98bNss4mIIj07DXUu8aXGYfK/zqACuDJI1zcQMp+N5c/3rYSey1VQyQORJr
	5L/93kGM4ct/Cnx/1P6Imw4DUBaI/4STDIB5205qn77a343QLLcRDaoJ1PInd6ECxvwKcLuW6sY
	+SUiCFQGyiQXZ4fL8ZoMNieVnrOKuYedRxlrO5QfRbFE9o3aR4HV8aPjqQSBB9NXzda+7pSmw/B
	P2m3rpmBwGRjMKZ09We1F2+uXLFD6GOeR9ZEj3gDw=
X-Received: by 2002:a5d:64e8:0:b0:449:9aee:4573 with SMTP id ffacd0b85a97d-4515ad768e3mr41131274f8f.18.1778511435091;
        Mon, 11 May 2026 07:57:15 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491f8d4c3sm25577709f8f.34.2026.05.11.07.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 07:57:14 -0700 (PDT)
Message-ID: <18d747ea-660a-4ae6-b8b8-365d745352ce@linaro.org>
Date: Mon, 11 May 2026 15:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/20] ARM64 PMU Partitioning
To: Colton Lewis <coltonlewis@google.com>
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
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260504211813.1804997-1-coltonlewis@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_075717_179846_C308E8B8 
X-CRM114-Status: GOOD (  33.79  )
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



On 04/05/2026 10:17 pm, Colton Lewis wrote:
> This series creates a new PMU scheme on ARM, a partitioned PMU that
> allows reserving a subset of counters for more direct guest access,
> significantly reducing overhead. More details, including performance
> benchmarks, can be read in the v1 cover letter linked below.
> 
> An overview of what this series accomplishes was presented at KVM
> Forum 2025. Slides [1] and video [2] are linked below.
> 
> After a few false starts, meeting with Will Deacon and Mark Rutland to
> discuss implementation ideas, and a few more false starts, I finally
> have an implementation of dynamic counter reservation that works
> without disrupting host perf too much. Now the host only loses access
> to the guest counters when a vCPU resides on the CPU.
> 
> The key was creating perf_pmu_resched_update, which behaves exactly
> like perf_pmu_resched except it takes a callback to call in between
> when the perf events are scheduled out and when they are scheduled
> back in. That allows us to update the PMU's available counters when we
> know they are not currently in use without needing to expose private
> perf core functions and triple check they are not being called in a
> way that violates existing assumptions.
> 
> Because this introduces a possibility of perf reschedule during vCPU
> load, I've optimized to only do that operation if there are host
> events occupying the intended guest counters at the time of the load.
> 
> The kernel command line parameter for the driver still exists, but now
> only defines an upper limit of counters the guest might use rather
> than taking those counters from the host permanently.
> 
> v7:
> 
> * Implement dynamic counter reservation as described above. One side
>    effect is the PMUv3 driver now needs much fewer changes to enforce
>    the boundary.
> 
> * Move register accesses out of fast path for non-FGT hardware. The
>    performance impact was negligible and this moves bloat out of the
>    fast path and allows a more reliable design with more code sharing.
> 
> * Make PMCCNTR a special case in the context swap again because trying
>    to access it with PMXEVCNTR is undefined.
> 
> * Fix a bug where kvm_pmu_guest_counter_mask was using & instead of |.
> 
> * Re-expose the dedicated instruction counter to the host since it was
>    decided the guest will not own it.
> 
> * Change the global armv8pmu_reserved_host_counters to
>    armv8pmu_is_partitoned because it was only used in boolean checks.
> 
> * Fix typo in vcpu attribute commit so the spelling of the flag in the
>    commit message matches the code.
> 
> * Rebase to v7.0-rc7
> 
> v6:
> https://lore.kernel.org/kvmarm/20260209221414.2169465-1-coltonlewis@google.com/
> 
> v5:
> https://lore.kernel.org/kvmarm/20251209205121.1871534-1-coltonlewis@google.com/
> 
> v4:
> https://lore.kernel.org/kvmarm/20250714225917.1396543-1-coltonlewis@google.com/
> 
> v3:
> https://lore.kernel.org/kvm/20250626200459.1153955-1-coltonlewis@google.com/
> 
> v2:
> https://lore.kernel.org/kvm/20250620221326.1261128-1-coltonlewis@google.com/
> 
> v1:
> https://lore.kernel.org/kvm/20250602192702.2125115-1-coltonlewis@google.com/
> 
> [1] https://gitlab.com/qemu-project/kvm-forum/-/raw/main/_attachments/2025/Optimizing__itvHkhc.pdf
> [2] https://www.youtube.com/watch?v=YRzZ8jMIA6M&list=PLW3ep1uCIRfxwmllXTOA2txfDWN6vUOHp&index=9
> 
> Colton Lewis (19):
>    arm64: cpufeature: Add cpucap for HPMN0
>    KVM: arm64: Reorganize PMU functions
>    perf: arm_pmuv3: Generalize counter bitmasks
>    perf: arm_pmuv3: Check cntr_mask before using pmccntr
>    perf: arm_pmuv3: Add method to partition the PMU
>    KVM: arm64: Set up FGT for Partitioned PMU
>    KVM: arm64: Add Partitioned PMU register trap handlers
>    KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
>    KVM: arm64: Context swap Partitioned PMU guest registers
>    KVM: arm64: Enforce PMU event filter at vcpu_load()
>    perf: Add perf_pmu_resched_update()
>    KVM: arm64: Apply dynamic guest counter reservations
>    KVM: arm64: Implement lazy PMU context swaps
>    perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
>    KVM: arm64: Detect overflows for the Partitioned PMU
>    KVM: arm64: Add vCPU device attr to partition the PMU
>    KVM: selftests: Add find_bit to KVM library
>    KVM: arm64: selftests: Add test case for Partitioned PMU
>    KVM: arm64: selftests: Relax testing for exceptions when partitioned
> 
> Marc Zyngier (1):
>    KVM: arm64: Reorganize PMU includes
> 
>   arch/arm/include/asm/arm_pmuv3.h              |  18 +
>   arch/arm64/include/asm/arm_pmuv3.h            |  12 +-
>   arch/arm64/include/asm/kvm_host.h             |  17 +-
>   arch/arm64/include/asm/kvm_types.h            |   6 +-
>   arch/arm64/include/uapi/asm/kvm.h             |   2 +
>   arch/arm64/kernel/cpufeature.c                |   8 +
>   arch/arm64/kvm/Makefile                       |   2 +-
>   arch/arm64/kvm/arm.c                          |   2 +
>   arch/arm64/kvm/config.c                       |  41 +-
>   arch/arm64/kvm/debug.c                        |  31 +-
>   arch/arm64/kvm/pmu-direct.c                   | 494 ++++++++++++
>   arch/arm64/kvm/pmu-emul.c                     | 674 +----------------
>   arch/arm64/kvm/pmu.c                          | 701 ++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c                     | 250 ++++++-
>   arch/arm64/tools/cpucaps                      |   1 +
>   arch/arm64/tools/sysreg                       |   6 +-
>   drivers/perf/arm_pmuv3.c                      | 111 ++-
>   include/kvm/arm_pmu.h                         | 110 +++
>   include/linux/perf/arm_pmu.h                  |   3 +
>   include/linux/perf/arm_pmuv3.h                |  14 +-
>   include/linux/perf_event.h                    |   3 +
>   kernel/events/core.c                          |  28 +-
>   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
>   .../selftests/kvm/arm64/vpmu_counter_access.c | 112 ++-
>   tools/testing/selftests/kvm/lib/find_bit.c    |   1 +
>   25 files changed, 1861 insertions(+), 787 deletions(-)
>   create mode 100644 arch/arm64/kvm/pmu-direct.c
>   create mode 100644 tools/testing/selftests/kvm/lib/find_bit.c
> 
> 
> base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
> --
> 2.54.0.545.g6539524ca2-goog

I tested it a bit and ran the kselftests and it all seems to be working 
ok. Some of the critical sashiko comments look like they are worth 
looking into though: 
https://sashiko.dev/#/patchset/20260504211813.1804997-1-coltonlewis%40google.com

For example writing to PMCR_EL0.P from EL2 resets the host's counters, 
even if it's KVM doing it after trapping a write from the guest.


