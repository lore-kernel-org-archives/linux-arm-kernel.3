Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC82C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 21:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WdoFzCI6/MSoPm4Khb52UUh02MpjvNSJrVeGRSfhXrI=; b=lcLgjH+6mDmUW/M1HHGB7SA7MI
	u2nXJRovuM9Wd4f2WFy5ijLmhuS21A4Ctb/sgAkfYxWzltgTr4AL6iUo8tWixy7vXeMc7RUMQtWE7
	Y9pEXAtnl/wjKTMow8J5/fCgyxADGu7TqOuBj1DmQwJ5X3/+6ENKM++3FTQbK9oCH6oFw4eMNw1ib
	wy1XZLxAnkIrEhdvv8Q7o7qaZOonpYtZvbi5z9cM0Hi+Yf7L1Yhld6bzR47uXERooKEElqx32LRTu
	RLcCf8Fbf9W/NQpMN7HsWcUPHh5WOegE2aUkJAv8f0fvxsQp8VHYYSaSz/VqfWctsE9t/C+0lK5yw
	F+CD2ZDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5uI-00000006kTw-0vJ5;
	Thu, 06 Aug 2026 21:45:42 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws5uE-00000006kTJ-3IOa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 21:45:40 +0000
Message-ID: <a8749023-d598-43d9-8a64-569b2d057438@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786052731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WdoFzCI6/MSoPm4Khb52UUh02MpjvNSJrVeGRSfhXrI=;
	b=iP14MZpKhZJ+z+2rvfX0XlFyk4Tgyh1nCMITUlGFyIb4ogl4Mn/PrfIdy7huNh/NHvrtzz
	RZvG3RqEQg1vduqQeXJ2WtMVw5h2qF8Ap1r+Sc60B97Z5gL6XiWtGYKYBTTl2CBPSr028Z
	vucexiDg6x8wsSlrpBWqzkESx7cP1rI=
Date: Thu, 6 Aug 2026 14:45:03 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v8 14/22] RISC-V: perf: Implement supervisor counter
 delegation support
To: Yicong Yang <yang.yicong@picoheart.com>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>,
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-14-7909f863a645@meta.com>
 <46cc0a87-a6cf-44d0-87d0-187ae8f6791e@picoheart.com>
 <12675382-8ef2-4dcb-9e12-bc9cf8cc46ab@linux.dev>
 <15b63bb1-ea29-42cd-905c-fbecc8423118@picoheart.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <15b63bb1-ea29-42cd-905c-fbecc8423118@picoheart.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_144539_121228_12001F38 
X-CRM114-Status: GOOD (  34.23  )
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


On 8/6/26 5:16 AM, Yicong Yang wrote:
> On 8/6/26 10:00 AM, Atish Patra wrote:
>> On 7/7/26 1:24 AM, Yicong Yang wrote:
>>> On 7/1/26 4:47 PM, Atish Patra wrote:
>>>> From: Atish Patra <atishp@rivosinc.com>
>>>>
>>>> There are few new RISC-V ISA exensions (ssccfg, sscsrind, smcntrpmf) which
>>>> allows the hpmcounter/hpmevents to be programmed directly from S-mode. The
>>>> implementation detects the ISA extension at runtime and uses them if
>>>> available instead of SBI PMU extension. SBI PMU extension will still be
>>>> used for firmware counters if the user requests it.
>>>>
>>>> The current linux driver relies on event encoding defined by SBI PMU
>>>> specification for standard perf events. However, there are no standard
>>>> event encoding available in the ISA. In the future, we may want to
>>>> decouple the counter delegation and SBI PMU completely. In that case,
>>>> counter delegation supported platforms must rely on the event encoding
>>>> defined in the perf json file or in the pmu driver.
>>>>
>>>> For firmware events, it will continue to use the SBI PMU encoding as
>>>> one can not support firmware event without SBI PMU.
>>>>
>>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>>> ---
>>>>    arch/riscv/include/asm/csr.h   |   1 +
>>>>    drivers/perf/riscv_pmu_sbi.c   | 578 +++++++++++++++++++++++++++++++++--------
>>>>    include/linux/perf/riscv_pmu.h |   3 +
>>>>    3 files changed, 478 insertions(+), 104 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
>>>> index a3b24b88e401..cd22b5168689 100644
>>>> --- a/arch/riscv/include/asm/csr.h
>>>> +++ b/arch/riscv/include/asm/csr.h
>>>> @@ -258,6 +258,7 @@
>>>>    #endif
>>>>      #define SISELECT_SSCCFG_BASE        0x40
>>>> +#define HPMEVENT_MASK            GENMASK_ULL(63, 56)
>>>>      /* mseccfg bits */
>>>>    #define MSECCFG_PMM            ENVCFG_PMM
>>>> diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
>>>> index 2568c6808f5d..7995da4a98a1 100644
>>>> --- a/drivers/perf/riscv_pmu_sbi.c
>>>> +++ b/drivers/perf/riscv_pmu_sbi.c
>>>> @@ -28,6 +28,8 @@
>>>>    #include <asm/cpufeature.h>
>>>>    #include <asm/vendor_extensions.h>
>>>>    #include <asm/vendor_extensions/andes.h>
>>>> +#include <asm/hwcap.h>
>>>> +#include <asm/csr_ind.h>
>>>>      #define ALT_SBI_PMU_OVERFLOW(__ovl)                    \
>>>>    asm volatile(ALTERNATIVE_2(                        \
>>>> @@ -60,7 +62,20 @@ asm volatile(ALTERNATIVE(                        \
>>>>    #define PERF_EVENT_FLAG_USER_ACCESS    BIT(SYSCTL_USER_ACCESS)
>>>>    #define PERF_EVENT_FLAG_LEGACY        BIT(SYSCTL_LEGACY)
>>>>    -PMU_FORMAT_ATTR(event, "config:0-55");
>>>> +#define RVPMU_SBI_PMU_FORMAT_ATTR    "config:0-47"
>>>> +#define RVPMU_CDELEG_PMU_FORMAT_ATTR    "config:0-55"
>>>> +
>>>> +static ssize_t __maybe_unused rvpmu_format_show(struct device *dev, struct device_attribute *attr,
>>>> +                        char *buf);
>>>> +
>>>> +#define RVPMU_ATTR_ENTRY(_name, _func, _config)    (            \
>>>> +    &((struct dev_ext_attribute[]) {                \
>>>> +        { __ATTR(_name, 0444, _func, NULL), (void *)_config }    \
>>>> +    })[0].attr.attr)
>>>> +
>>>> +#define RVPMU_FORMAT_ATTR_ENTRY(_name, _config) \
>>>> +    RVPMU_ATTR_ENTRY(_name, rvpmu_format_show, (char *)_config)
>>>> +
>>>>    PMU_FORMAT_ATTR(firmware, "config:62-63");
>>>>      static bool sbi_v2_available;
>>>> @@ -68,7 +83,11 @@ static bool sbi_v3_available;
>>>>    static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>>>>    #define sbi_pmu_snapshot_available() \
>>>>        static_branch_unlikely(&sbi_pmu_snapshot_available)
>>>> +
>>>>    static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
>>>> +#define riscv_pmu_sbi_available() \
>>>> +        static_branch_likely(&riscv_pmu_sbi_available)
>>>> +
>>>>    static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
>>>>      /* Avoid unnecessary code patching in the one time booting path*/
>>>> @@ -83,19 +102,35 @@ static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
>>>>    #define riscv_pmu_sbi_available() \
>>>>            static_branch_likely(&riscv_pmu_sbi_available)
>>>>    -static struct attribute *riscv_arch_formats_attr[] = {
>>>> -    &format_attr_event.attr,
>>>> +static struct attribute *riscv_sbi_pmu_formats_attr[] = {
>>>> +    RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_SBI_PMU_FORMAT_ATTR),
>>>>        &format_attr_firmware.attr,
>>>>        NULL,
>>>>    };
>>>>    -static struct attribute_group riscv_pmu_format_group = {
>>>> +static struct attribute_group riscv_sbi_pmu_format_group = {
>>>>        .name = "format",
>>>> -    .attrs = riscv_arch_formats_attr,
>>>> +    .attrs = riscv_sbi_pmu_formats_attr,
>>>>    };
>>>>    -static const struct attribute_group *riscv_pmu_attr_groups[] = {
>>>> -    &riscv_pmu_format_group,
>>>> +static const struct attribute_group *riscv_sbi_pmu_attr_groups[] = {
>>>> +    &riscv_sbi_pmu_format_group,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static struct attribute *riscv_cdeleg_pmu_formats_attr[] = {
>>>> +    RVPMU_FORMAT_ATTR_ENTRY(event, RVPMU_CDELEG_PMU_FORMAT_ATTR),
>>>> +    &format_attr_firmware.attr,
>>>> +    NULL,
>>>> +};
>>>> +
>>>> +static struct attribute_group riscv_cdeleg_pmu_format_group = {
>>>> +    .name = "format",
>>>> +    .attrs = riscv_cdeleg_pmu_formats_attr,
>>>> +};
>>>> +
>>>> +static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
>>>> +    &riscv_cdeleg_pmu_format_group,
>>>>        NULL,
>>>>    };
>>>>    @@ -482,6 +517,14 @@ static void rvpmu_sbi_check_std_events(struct work_struct *work)
>>>>      static DECLARE_WORK(check_std_events_work, rvpmu_sbi_check_std_events);
>>>>    +static ssize_t rvpmu_format_show(struct device *dev,
>>>> +                 struct device_attribute *attr, char *buf)
>>>> +{
>>>> +    struct dev_ext_attribute *eattr = container_of(attr,
>>>> +                struct dev_ext_attribute, attr);
>>>> +    return sysfs_emit(buf, "%s\n", (char *)eattr->var);
>>>> +}
>>>> +
>>>>    static int rvpmu_ctr_get_width(int idx)
>>>>    {
>>>>        return pmu_ctr_list[idx].width;
>>>> @@ -599,6 +642,38 @@ static uint8_t rvpmu_csr_index(struct perf_event *event)
>>>>        return pmu_ctr_list[event->hw.idx].csr - CSR_CYCLE;
>>>>    }
>>>>    +static uint64_t get_deleg_priv_filter_bits(struct perf_event *event)
>>>> +{
>>>> +    u64 priv_filter_bits = 0;
>>> could we explicitly initialize the priv_filter_bits to MINH? though this bit
>>> is S-mode read-only and won't have any effects, but considering the semantic
>>> is to inhibit counting at certain privilege mode, initialize it to MINH will
>>> make it clear.
>> Wouldn't that be confusing ? I feel we need a comment there as well to explain why
>> are setting MINH in S-mode if we need that.
>>
> sounds reasonable. let's keep it as is.
>
>>>> +    bool guest_events = false;
>>>> +
>>>> +    if (event->attr.config1 & RISCV_PMU_CONFIG1_GUEST_EVENTS)
>>>> +        guest_events = true;
>>> use attr::config1 to distinguish the KVM events looks incorrect. it's a user
>>> visible interface and could be set explicitly by the user and break the
>>> logic here.. e.g. perf stat -e cycles/config1=0x1/
>> Reusing config1 for kvm guest events are already in upstream. As KVM is just another user of host perf driver, it is used. The config is event specific so a user specific event vs kvm initiated event would be separate anyways.
>>
>> But we can harden the interface with additional check using this which was exclusive to perf_event_create_kernel_counter which
>> kvm invokes[1].
>>
>> event->owner = TASK_TOMBSTONE;
>>
>> [1] https://github.com/torvalds/linux/blob/master/kernel/events/core.c#L14324
>>
> makes sense. there's a is_kernel_event() wrapper but currently is local
> there in the event core (so is TASK_TOMBSTONE).
Correct.
> but yes it's not introduced by this patch.
>
>>>> +    if (event->attr.exclude_kernel)
>>>> +        priv_filter_bits |= guest_events ? HPMEVENT_VSINH : HPMEVENT_SINH;
>>>> +    if (event->attr.exclude_user)
>>>> +        priv_filter_bits |= guest_events ? HPMEVENT_VUINH : HPMEVENT_UINH;
>>>> +    if (guest_events && event->attr.exclude_hv)
>>>> +        priv_filter_bits |= HPMEVENT_SINH;
>>>> +    if (event->attr.exclude_host)
>>>> +        priv_filter_bits |= HPMEVENT_UINH | HPMEVENT_SINH;
>>>> +    if (event->attr.exclude_guest)
>>>> +        priv_filter_bits |= HPMEVENT_VSINH | HPMEVENT_VUINH;
>>>> +
>>>> +    return priv_filter_bits;
>>>> +}
>>>> +
> [...]
>
>>>> +static void rvpmu_deleg_ctr_enable_irq(struct perf_event *event)
>>>> +{
>>>> +    unsigned long hpmevent_curr;
>>>> +    unsigned long of_mask;
>>>> +    struct hw_perf_event *hwc = &event->hw;
>>>> +    int counter_idx = hwc->idx;
>>>> +    unsigned long sip_val = csr_read(CSR_SIP);
>>>> +
>>>> +    if (!is_sampling_event(event) || (sip_val & SIP_LCOFIP))
>>> we should also consider overflow for counters of non-sampling events..
>> This is intentional. As per the sscofpmf, OF bits as a interrupt disable and overflow indicator.
>> So we need to clear the bit if you need the interrupt for the sampled events.
>>
>> For non sampled events, that is not necessary. But If it overflows, it shouldn't raise an interrupt.
>>
> okay I see the existing interrupt handler skip the non-sample events as well
> so it's the current policy of the driver. but generally we should handle
> the overflow of non sampled events as well to avoid count lost if the counter
> is implemened less than 64bit. in such case it's possible to overflow
> several times for a long counting period.

  The wrap is already accounted for: riscv_pmu_event_update() recovers the
  delta with (new - prev) & cmask, which is correct for any advance short of a full lap,
  and the half-width preload in riscv_pmu_event_init() keeps prev_count away from the
  wrap point. This common design across architectures. If a platform implement too narrow
  counter width such that overflow several times for a long counting period without a single
  context switch, that's a platform problem.

> it's also another thing not introduced by this patch so we may keep the handling
> here as is.
>
> thanks.

