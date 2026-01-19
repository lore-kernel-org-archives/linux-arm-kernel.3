Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD70BC9830C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 01:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZNUsUjLhm5UFUgzDZQqKpLzGtDmZv4iToPekSwA0mM=; b=FbFx52Ztk8aeqTP080dhO8Z4KJ
	RroQ2ANjX4b7txl74E5nxQOJxxxPllHbpE0jP43sHIQKsZDCRtVkUwHzsMB7+2gQ3KlhMs/lzeRvL
	z8YVhd7qyq6KP8+dDtS8ra+rdnfKinx7c7UyyrmkKd5IVvu/08Uj3LVu+wmENdJyDgCICs2XAJlMQ
	DnREM/A3s5rIqe3PTMKl+ZixP2xhvxY/7GFR1HyZCOdEpdeUjAfHl8K2Gcey3TMYjWy//MAQywsdI
	sLYGlSZFohX3LNsXFLWdpzAFkVNYOlZzVjg4C4gluFuqoAbs72clfbgmQ45fXH/QdhBKrhO3nKn7Z
	UxWWcLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhe6b-00000001EiR-0hLS;
	Mon, 19 Jan 2026 01:30:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhe6Y-00000001Ehp-1XEa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 01:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768786251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ZNUsUjLhm5UFUgzDZQqKpLzGtDmZv4iToPekSwA0mM=;
	b=CRp8QHcaYHEAgi94XQTnX5FAJUDm1+msvRufrePd83vVcVN5YDlvnOQEOdHGR6Iz+en443
	VrRYzTs9BzJfVv6xAHMCwRhucJJ/GtI9CHxFeZ5Fy8jqKtuKCiR7BH77qNq6lqbQx9T0cy
	LCjpVfNKDv3+IzhlkI+s8GTS9jutPHE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-zn0BGwi-OpCm0mqmzeZNfw-1; Sun, 18 Jan 2026 20:30:47 -0500
X-MC-Unique: zn0BGwi-OpCm0mqmzeZNfw-1
X-Mimecast-MFC-AGG-ID: zn0BGwi-OpCm0mqmzeZNfw_1768786246
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso3651514a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 17:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768786246; x=1769391046;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ZNUsUjLhm5UFUgzDZQqKpLzGtDmZv4iToPekSwA0mM=;
        b=l6eeQbBcmBmt1RZWXkF8pDNQhq1PPnXlio5sVcY/anZ/r8JEmHg6yYRC64048zc6wA
         BvE+2bTKBwsRCVQjbfoyQQV1ZMy6OrW+zr5upoRdfUOtyDiP2EgAVNgIMhjHlwfRkh0V
         PXj7ASSD7mXgVy8tkdXN5hmnj6U3d7uyofAz8/49Vgz1+eWhCzMSvhxJ/SHIevsAd1El
         l0qgHWahdn6/6CzqycLTStX3XLmPZBiA+dP6QoAO4hUHL+cTx8PRzOGQp0ZVl1gBstaa
         dMHm3jizOO81LTBVLDdLGvlJSffpJoNv67PZIJ8H+xOxYhwjMqUtr+DBJPhRFYmniEkT
         yQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCXzfytKRYxJTCdgW9LELXgSbgmqtmjX3VJQonDlyxYEjM4i0Ji85TLu9SJWwI5O3T1sC1u8lkXcCpUaGhHkxXjn@lists.infradead.org
X-Gm-Message-State: AOJu0YxcSBuJZJAeeMrh5wkBxFBy4LESuJnAcstZmUdW/aXHzy/ie0rl
	V67Y+GsN4Oixg5pbBzRKn1hg0iaOSvo7s+d7oxkGfIAGajiPyXEWr5DX8Su+0hYYMK4rhVWPNdf
	Uo+zKI+U8kUpIRGJxpzGHmBwxLt6+K5wS8r7pLOUTI93Jpul4ZFt7OPgh0NYdTH2mzuYL6Wp+SP
	wE
X-Gm-Gg: AY/fxX7jUYtlsAIJLoimFGZCP1/9gUoAtS43yS8PqoLJmZoHy2CGwGtx6iQXaRI9WUe
	UYtTsZc3P/koZA9sODgJR57yLPo+CBC7Qs63z2rFeoFwWBUEEQBt2KkraOCLvB5UxBQud0nbyt1
	69DvWMlxYADZrjACtEDrgJLeo2vbQM2N3XqsviKaUHWbM0iUXRmEjxjcqEQHyazIidKNqUTLYj+
	R58kBzoCL2GrH/L3uVTZgbotnV8qXq+07893AA5CdRTCyc2uT5UY0V+mKTowWPjVc8+w20R32dY
	tfDi3SYkU1C0qlgnRcT53o2W0xx1egAcy5V3SmVOzYZ/Xvu3YwT+QKENMDc8z0UmBX9sBB20AVA
	8oSGNPDaSyAA=
X-Received: by 2002:a17:90b:4984:b0:34e:6e7d:7e73 with SMTP id 98e67ed59e1d1-352678b93d7mr12264064a91.11.1768786246340;
        Sun, 18 Jan 2026 17:30:46 -0800 (PST)
X-Received: by 2002:a17:90b:4984:b0:34e:6e7d:7e73 with SMTP id 98e67ed59e1d1-352678b93d7mr12264032a91.11.1768786245873;
        Sun, 18 Jan 2026 17:30:45 -0800 (PST)
Received: from [10.72.112.128] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527310210fsm804506a91.9.2026.01.18.17.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jan 2026 17:30:44 -0800 (PST)
Message-ID: <97a5f9d3-6afa-49cf-883d-4e6932e8ff60@redhat.com>
Date: Mon, 19 Jan 2026 09:30:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/47] arm_mpam: Add KVM/arm64 and resctrl glue code
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8oHb8z1v0F1OJCoy6tE9CRHU-WuwAHFwI5keR1MLYik_1768786246
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_173054_496657_1837AC24 
X-CRM114-Status: GOOD (  36.70  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> This new version of the mpam missing pieces has no major rework from the
> previous version. It's mainly small corrections and code tidying based on
> review and things I spotted along the way. To be able to merge this we need
> review from more people and people to start testing on their platforms and
> giving some Tested-by tags.
> 
> Change list in patches.
> 
> As mentioned in the cover letter for v2, one major departure from the
> previous snapshot branches referenced in the base driver series is that the
> same MPAM setting are used for kernel-space and user-space. There are pros
> and cons of choosing this policy but I think it is the best thing to start
> with as there are AMD plans for adding a resctrl feature to allow a
> different closid/rmid configuration for user-space from kernel space. The
> AMD feature is called PLZA and is mentioned in this lpc slide deck[1]. This
> gives us a path forward to add support for having the EL1 and EL0 MPAM
> partid/pmg configuration differ from each other.
> 
>  From James' cover letter:
> 
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
> 
> This adds the arch code and KVM support first. I anticipate the whole thing
> going via arm64, but if goes via tip instead, the an immutable branch with those
> patches should be easy to do.
> 
> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages produced
> when enabling dynamic debug and booting with:
> | dyndbg="file mpam_resctrl.c +pl"
> 
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
> 
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>   This document has the best overview)
> 
> 
> Based on v6.19-rc5
> This series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v3
> 
> v2 can be found at:
> https://lore.kernel.org/linux-arm-kernel/20251219181147.3404071-1-ben.horgan@arm.com/
> 
> rfc can be found at:
> https://lore.kernel.org/linux-arm-kernel/20251205215901.17772-1-james.morse@arm.com/
> 
> [1] https://lpc.events/event/19/contributions/2093/attachments/1958/4172/resctrl%20Microconference%20LPC%202025%20Tokyo.pdf
> 
> Ben Horgan (10):
>    arm_mpam: Use non-atomic bitops when modifying feature bitmap
>    arm64/sysreg: Add MPAMSM_EL1 register
>    KVM: arm64: Preserve host MPAM configuration when changing traps
>    KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
>    arm64: mpam: Initialise and context switch the MPAMSM_EL1 register
>    KVM: arm64: Use kernel-space partid configuration for hypercalls
>    arm_mpam: resctrl: Add rmid index helpers
>    arm_mpam: resctrl: Add kunit test for rmid idx conversions
>    arm_mpam: resctrl: Wait for cacheinfo to be ready
>    arm_mpam: resctrl: Add kunit test for mbw min control generation
> 
> Dave Martin (2):
>    arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
>    arm_mpam: resctrl: Add kunit test for control format conversions
> 
> James Morse (30):
>    arm64: mpam: Context switch the MPAM registers
>    arm64: mpam: Re-initialise MPAM regs when CPU comes online
>    arm64: mpam: Advertise the CPUs MPAM limits to the driver
>    arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
>    arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG
>      values
>    KVM: arm64: Force guest EL1 to use user-space's partid configuration
>    arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
>    arm_mpam: resctrl: Sort the order of the domain lists
>    arm_mpam: resctrl: Pick the caches we will use as resctrl resources
>    arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
>    arm_mpam: resctrl: Add resctrl_arch_get_config()
>    arm_mpam: resctrl: Implement helpers to update configuration
>    arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
>    arm_mpam: resctrl: Add CDP emulation
>    arm_mpam: resctrl: Add support for 'MB' resource
>    arm_mpam: resctrl: Add support for csu counters
>    arm_mpam: resctrl: Pick classes for use as mbm counters
>    arm_mpam: resctrl: Pre-allocate free running monitors
>    arm_mpam: resctrl: Pre-allocate assignable monitors
>    arm_mpam: resctrl: Add kunit test for ABMC/CDP interactions
>    arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
>    arm_mpam: resctrl: Allow resctrl to allocate monitors
>    arm_mpam: resctrl: Add resctrl_arch_rmid_read() and
>      resctrl_arch_reset_rmid()
>    arm_mpam: resctrl: Add resctrl_arch_cntr_read() &
>      resctrl_arch_reset_cntr()
>    arm_mpam: resctrl: Update the rmid reallocation limit
>    arm_mpam: resctrl: Add empty definitions for assorted resctrl
>      functions
>    arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
>    arm_mpam: resctrl: Call resctrl_init() on platforms that can support
>      resctrl
>    arm_mpam: Generate a configuration for min controls
>    arm_mpam: Quirk CMN-650's CSU NRDY behaviour
> 
> Jiapeng Chong (1):
>    arm_mpam: Remove duplicate linux/srcu.h header
> 
> Shanker Donthineni (4):
>    arm_mpam: Add quirk framework
>    arm_mpam: Add workaround for T241-MPAM-1
>    arm_mpam: Add workaround for T241-MPAM-4
>    arm_mpam: Add workaround for T241-MPAM-6
> 
>   Documentation/arch/arm64/silicon-errata.rst |    9 +
>   arch/arm64/Kconfig                          |    6 +-
>   arch/arm64/include/asm/el2_setup.h          |    3 +-
>   arch/arm64/include/asm/mpam.h               |   98 +
>   arch/arm64/include/asm/resctrl.h            |    2 +
>   arch/arm64/include/asm/thread_info.h        |    3 +
>   arch/arm64/kernel/Makefile                  |    1 +
>   arch/arm64/kernel/cpufeature.c              |   21 +-
>   arch/arm64/kernel/mpam.c                    |   58 +
>   arch/arm64/kernel/process.c                 |    7 +
>   arch/arm64/kvm/hyp/include/hyp/switch.h     |   12 +-
>   arch/arm64/kvm/hyp/nvhe/hyp-main.c          |    8 +
>   arch/arm64/kvm/hyp/vhe/sysreg-sr.c          |   13 +
>   arch/arm64/kvm/sys_regs.c                   |    2 +
>   arch/arm64/tools/sysreg                     |    8 +
>   drivers/resctrl/Kconfig                     |    9 +-
>   drivers/resctrl/Makefile                    |    1 +
>   drivers/resctrl/mpam_devices.c              |  306 ++-
>   drivers/resctrl/mpam_internal.h             |  131 +-
>   drivers/resctrl/mpam_resctrl.c              | 1930 +++++++++++++++++++
>   drivers/resctrl/test_mpam_devices.c         |   66 +
>   drivers/resctrl/test_mpam_resctrl.c         |  426 ++++
>   include/linux/arm_mpam.h                    |   32 +
>   23 files changed, 3119 insertions(+), 33 deletions(-)
>   create mode 100644 arch/arm64/include/asm/mpam.h
>   create mode 100644 arch/arm64/include/asm/resctrl.h
>   create mode 100644 arch/arm64/kernel/mpam.c
>   create mode 100644 drivers/resctrl/mpam_resctrl.c
>   create mode 100644 drivers/resctrl/test_mpam_resctrl.c
> 

The L3 cache partitioning and MBW (soft) limiting works fine on NVidia's grace-hopper machine.

Tested-by: Gavin Shan <gshan@redhat.com>

Thanks,
Gavin


