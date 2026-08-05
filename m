Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D68C55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 10:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AhK4VD+NMKqhR3cJcndUaz+mOuTJcgBioYBISeP+sk=; b=sPR13EP5GVhy30asut0YLPP/CO
	b3+D892DPSGemq/3Tova7TRjrwv+qREVQ5wpK65u2ihbH9gY9oPLbUWxgmPui43I1Hjy6g3SWxnz6
	HpQtT88mEf5e9BPVygLiPEWNI3bE4AegjYEWUvd/WOlOMimk/XWwsr3KFibJW+MrGrHUpIjF/Su2U
	r80Zz74C6ilep6HsFgr1hjc705/EMaLS/RW4K2X4P2+Onop8i+FGmZS39h8yuG4LWmuh51COo1ch9
	YneGm5NnjbWNXrT7Y0yya/snUzc0WlHHYwbY5Go5dRJHWng1M0HPWsAE2RTki4aMkPUT2ee5IL89O
	LpL3WcBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYWo-00000003grL-3g6h;
	Wed, 05 Aug 2026 10:07:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrYWl-00000003gqW-48PO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 10:07:13 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-47f7027ca11so502203f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785924430; x=1786529230; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AhK4VD+NMKqhR3cJcndUaz+mOuTJcgBioYBISeP+sk=;
        b=j4w+hTc3mTQ/obx21wvVC6vp5Hzd4qA3YB8s2ywIIWhwCmHkLlZ7cHK6pou8whDGaU
         QQk38Jos2FZpZ6IWY0YwENw2LdpE/u3Xf+pHlQebTttdBaGOYNfJ0ptv5WW0yOS3aWF9
         xl68Pqd7AVyWP73sLuD2hv7HURs8cLJDtrmp0kpv53SEOa8qGkcmr5u+lFhDLM0NMqqG
         hGvSlzAoAMcaHo+9iTXYDmqTHqgafOl9SGnIqiADl5end7t2NfxxqmiHXa6Wj5GDhHP2
         lwTw34lIu+YTMdIdHt41G2fRqb326AvpGUJ1v+WOEKfiH8XluzXsrQmL4R3Qexptc2Lo
         g5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785924430; x=1786529230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AhK4VD+NMKqhR3cJcndUaz+mOuTJcgBioYBISeP+sk=;
        b=pdLDSyXPEjJq8cqHmbtvj73k/gutzVrkmtMGkUjkco+pV2mSH4xnqPb46XKhZOJ4K2
         0WwEtrMh8e1ZEjk4qrpA60DwS9h3CEqpSMB/zsUgNMV7JSR0ao7BTGsLrCSikFbAPjzA
         ZFPFjLDypvzqNwtdQzJcC46R1+Ylsh9zuKNO6htP8m4k/gMBjhtfAeJyabgpr+sZ2O3b
         o3LD/50QawCaVKmE+Ii4r3lVzJG7T0ZCGCw6wvzYQ+jpHZYXKi4wVpLoiDGjGz1qJEy0
         A2EEMBCTQogGfclV8TAx6IyoUa9zqDuZGFeRJNcA0Ti4eY9ARTHm7axrw5l8hk9yyZHu
         M25g==
X-Forwarded-Encrypted: i=1; AHgh+RpxzMh9Mg14brVzM9fCtsYiVZEz0tbu10FIoXRMsDceP4GRrU0XDp8RNhlnBzftSOfJ/8uIEZnjIhSPZN6/IiG4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0tZG2JYhp40mCasoKaMqMyfGNrahCTpNj+wj94tUaUznbtbIF
	x2jkdSEeJn9uPdPqJ3AW5bG2Ns/qtGUHdP7aAR9sEq7DLr3F6j+Guixna1hFhOUpZyE=
X-Gm-Gg: AR+sD129YbWRzvrf4RTbpS3csNOhNTNWrIneHJH/epXwYAry4sNtIvX0mBgRU/3hkJC
	iRsQBxDno+FJSAc0pu8nVb5kLol6LJzk7ENh4JsOgl0UDzW/fNn4yHMRcuIiyosCKHiCeUboBXO
	VDSHHORV8E1dh5CvRl2xqO31o1tMBcuBdcRjknTFoUu7rDqkFZ4K5j7UfrD9ystvowaSGUSkEXP
	CYi8vvN0zAVhugqY0J48PdbCXKWWLVzHiPa8nQau/+X5sr+EevMVfdQrem6R/FDbFXj8pP1KNv3
	CZl8WhVArfHlFhfKzQjlwibcY50nzQhy2vTByvCE0vnJ6nuAK6d7t6d6BMw6BqALF75xzpOCJwy
	24vx15K4oSMaxy9FNLxKciuSXUtFeMGp58c88ig+wQFlOIvLAqISbLszaMf6hqsZcOU/B+hKbJ4
	uVp1gmhXdwLnDpef/LFCIQIT7Zgtn8ALAIRuDQWWo2L23vRaC7NcDLBbkyX/Apbha+KA==
X-Received: by 2002:a05:600c:4f4c:b0:499:4892:e84e with SMTP id 5b1f17b1804b1-4994e7b74afmr77866375e9.11.1785924429725;
        Wed, 05 Aug 2026 03:07:09 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5b1bsm6743054f8f.12.2026.08.05.03.07.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 03:07:09 -0700 (PDT)
Message-ID: <6ee32efc-01be-4532-aa59-3948f59156c0@linaro.org>
Date: Wed, 5 Aug 2026 11:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] perf/arm64: Add BRBE support for
 bpf_get_branch_snapshot()
To: Puranjay Mohan <puranjay12@gmail.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Shuah Khan <shuah@kernel.org>,
 Breno Leitao <leitao@debian.org>, Ravi Bangoria <ravi.bangoria@amd.com>,
 Stephane Eranian <eranian@google.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif
 <usama.arif@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20260616155716.2631508-1-puranjay@kernel.org>
 <20260616155716.2631508-4-puranjay@kernel.org>
 <8a24abbc-10bc-42bb-8fee-0a174d8f1751@linaro.org>
 <CANk7y0inRXCUKtuio3Cb03DvuNPq6yp1o+tsE8PZitrY0LaOPQ@mail.gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <CANk7y0inRXCUKtuio3Cb03DvuNPq6yp1o+tsE8PZitrY0LaOPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_030712_143908_7677EE68 
X-CRM114-Status: GOOD (  46.80  )
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



On 03/08/2026 7:54 pm, Puranjay Mohan wrote:
> On Mon, Aug 3, 2026 at 12:07 PM James Clark <james.clark@linaro.org> wrote:
>>
>>
>>
>> On 16/06/2026 16:57, Puranjay Mohan wrote:
>>> Enable bpf_get_branch_snapshot() on ARM64 by implementing the
>>> perf_snapshot_branch_stack static call for BRBE.
>>>
>>> BRBE is paused before masking exceptions to avoid branch buffer
>>> pollution from trace_hardirqs_off(). Exceptions are then masked with
>>> local_daif_save() to prevent PMU overflow pseudo-NMIs from interfering.
>>> If an overflow between pause and DAIF save re-enables BRBE, the snapshot
>>> detects this via BRBFCR_EL1.PAUSED and bails out.
>>>
>>> Branch records are read using perf_entry_from_brbe_regset() with a NULL
>>> event pointer to bypass event-specific filtering. The buffer is
>>> invalidated after reading.
>>>
>>> Introduce a for_each_brbe_entry() iterator to deduplicate bank
>>> iteration between brbe_read_filtered_entries() and the snapshot.
>>>
>>> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>    drivers/perf/arm_brbe.c  | 128 ++++++++++++++++++++++++++++++++-------
>>>    drivers/perf/arm_brbe.h  |   9 +++
>>>    drivers/perf/arm_pmuv3.c |   5 +-
>>>    3 files changed, 120 insertions(+), 22 deletions(-)
>>>
>>> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
>>> index effbdeacfcbb..a141ad7abcf2 100644
>>> --- a/drivers/perf/arm_brbe.c
>>> +++ b/drivers/perf/arm_brbe.c
>>> @@ -9,6 +9,7 @@
>>>    #include <linux/types.h>
>>>    #include <linux/bitmap.h>
>>>    #include <linux/perf/arm_pmu.h>
>>> +#include <asm/daifflags.h>
>>>    #include "arm_brbe.h"
>>>
>>>    #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
>>> @@ -256,6 +257,14 @@ static bool valid_brbe_version(int brbe_version)
>>>               brbe_version == ID_AA64DFR0_EL1_BRBE_BRBE_V1P1;
>>>    }
>>>
>>> +static __always_inline bool cpu_has_brbe(void)
>>
>> This should be more like cpu_valid_brbe_version(). has_brbe() only
>> implies that the CPU has BRBE, not that it's a version that the driver
>> supports. And it's actually just a wrapper around valid_brbe_version()
>> that accesses the ID reg on that CPU, not a functionally different check.
>>
>> But it also looks like valid_brbe_version() isn't called from anywhere
>> else, so why not delete that function and use its name for the new one?
> 
> I will do that in next version
> 
>>
>>> +{
>>> +     u64 aa64dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
>>> +     int brbe = cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT);
>>> +
>>> +     return valid_brbe_version(brbe);
>>> +}
>>> +
>>>    static void select_brbe_bank(int bank)
>>>    {
>>>        u64 brbfcr;
>>> @@ -271,6 +280,20 @@ static void select_brbe_bank(int bank)
>>>        isb();
>>>    }
>>>
>>> +static inline void __brbe_advance(int *bank, int *idx, int nr_hw)
>>> +{
>>> +     if (++(*idx) >= BRBE_BANK_MAX_ENTRIES &&
>>> +         *bank * BRBE_BANK_MAX_ENTRIES + *idx < nr_hw) {
>>> +             *idx = 0;
>>> +             select_brbe_bank(++(*bank));
>>> +     }
>>> +}
>>> +
>>> +#define for_each_brbe_entry(idx, nr_hw)                                      \
>>> +     for (int __bank = (select_brbe_bank(0), 0), idx = 0;            \
>>> +          __bank * BRBE_BANK_MAX_ENTRIES + idx < (nr_hw);            \
>>> +          __brbe_advance(&__bank, &idx, (nr_hw)))
>>> +
>>>    static bool __read_brbe_regset(struct brbe_regset *entry, int idx)
>>>    {
>>>        entry->brbinf = get_brbinf_reg(idx);
>>> @@ -474,11 +497,9 @@ unsigned int brbe_num_branch_records(const struct arm_pmu *armpmu)
>>>
>>>    void brbe_probe(struct arm_pmu *armpmu)
>>>    {
>>> -     u64 brbidr, aa64dfr0 = read_sysreg_s(SYS_ID_AA64DFR0_EL1);
>>> -     u32 brbe;
>>> +     u64 brbidr;
>>>
>>> -     brbe = cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA64DFR0_EL1_BRBE_SHIFT);
>>> -     if (!valid_brbe_version(brbe))
>>> +     if (!cpu_has_brbe())
>>>                return;
>>>
>>>        brbidr = read_sysreg_s(SYS_BRBIDR0_EL1);
>>> @@ -618,10 +639,10 @@ static bool perf_entry_from_brbe_regset(int index, struct perf_branch_entry *ent
>>>
>>>        brbe_set_perf_entry_type(entry, brbinf);
>>>
>>> -     if (!branch_sample_no_cycles(event))
>>> +     if (!event || !branch_sample_no_cycles(event))
>>>                entry->cycles = brbinf_get_cycles(brbinf);
>>>
>>> -     if (!branch_sample_no_flags(event)) {
>>> +     if (!event || !branch_sample_no_flags(event)) {
>>>                /* Mispredict info is available for source only and complete branch records. */
>>>                if (!brbe_record_is_target_only(brbinf)) {
>>>                        entry->mispred = brbinf_get_mispredict(brbinf);
>>> @@ -774,32 +795,97 @@ void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>>>    {
>>>        struct arm_pmu *cpu_pmu = to_arm_pmu(event->pmu);
>>>        int nr_hw = brbe_num_branch_records(cpu_pmu);
>>> -     int nr_banks = DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
>>>        int nr_filtered = 0;
>>>        u64 branch_sample_type = event->attr.branch_sample_type;
>>>        DECLARE_BITMAP(event_type_mask, PERF_BR_ARM64_MAX);
>>>
>>>        prepare_event_branch_type_mask(branch_sample_type, event_type_mask);
>>>
>>> -     for (int bank = 0; bank < nr_banks; bank++) {
>>> -             int nr_remaining = nr_hw - (bank * BRBE_BANK_MAX_ENTRIES);
>>> -             int nr_this_bank = min(nr_remaining, BRBE_BANK_MAX_ENTRIES);
>>> +     for_each_brbe_entry(i, nr_hw) {
>>> +             struct perf_branch_entry *pbe = &branch_stack->entries[nr_filtered];
>>>
>>> -             select_brbe_bank(bank);
>>> +             if (!perf_entry_from_brbe_regset(i, pbe, event))
>>> +                     break;
>>>
>>> -             for (int i = 0; i < nr_this_bank; i++) {
>>> -                     struct perf_branch_entry *pbe = &branch_stack->entries[nr_filtered];
>>> +             if (!filter_branch_record(pbe, branch_sample_type, event_type_mask))
>>> +                     continue;
>>>
>>> -                     if (!perf_entry_from_brbe_regset(i, pbe, event))
>>> -                             goto done;
>>> +             nr_filtered++;
>>> +     }
>>>
>>> -                     if (!filter_branch_record(pbe, branch_sample_type, event_type_mask))
>>> -                             continue;
>>> +     branch_stack->nr = nr_filtered;
>>> +}
>>>
>>> -                     nr_filtered++;
>>> -             }
>>> +/*
>>> + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
>>> + * self-recording and return 0 if the snapshot state appears disturbed.
>>> + */
>>> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, unsigned int cnt)
>>> +{
>>> +     unsigned long flags;
>>> +     int nr_hw, nr_copied = 0;
>>> +     u64 brbfcr, brbcr;
>>> +
>>> +     if (!cnt)
>>> +             return 0;
>>
>> If you're trying to avoid branches before pausing BRBE, can't you check
>> this after the pause?
> 
> will drop this in the next version and this is just an optimization.
> 
>>
>>> +
>>> +     /* Guard against running on a CPU without BRBE (e.g. big.LITTLE). */
>>> +     if (!cpu_has_brbe())
>>> +             return 0;
>>> +
>>> +     /*
>>> +      * Pause BRBE first to avoid recording our own branches. The
>>> +      * sysreg read/write and ISB are branchless, so pausing before
>>> +      * checking BRBCR avoids polluting the buffer with our own
>>> +      * conditional branches.
>>> +      */
>>> +     brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>>> +     brbcr = read_sysreg_s(SYS_BRBCR_EL1);
>>> +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>>
>> Can this work without first disabling interrupts? Sashiko pointed it
>> out, but I think it's correct. If you read an active state into brbfcr,
>> then the PMU event fires and disables BRBE, then you disable interrupts,
>> then you would restore an active state when it should be inactive.
>> Surely the only way to do it properly is to disable interrupts before
>> touching anything at all, if the PMU handler is also touching the same
>> registers?
>>
>> If you want to avoid trace_hardirqs_off() can you make a new
>> raw_local_daif_save() that disables interrupts and then call
>> trace_hardirqs_off() yourself after pausing BRBE? Or not call
>> trace_hardirqs_off() at all? There is a comment mentioning something
>> like that in arch/arm64/kernel/suspend.c.
> 
> Yes. I'll add raw_local_daif_save()/raw_local_daif_restore() and mask before
> touching any BRBE register, which fixes the stale restore. trace_hardirqs_off()
> then moves below the pause so lockdep still sees a balanced off/on pair while
> its branches land in an already paused buffer.
> 
>>
>> Also, disabling interrupts doesn't stop the PMU event from overflowing
>> and changing the state of PAUSED either. I think this is another path
>> that leads to you restoring the wrong state, so don't you also need to
>> disable the PMU?
> 
> Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a freeze needs
> BRBE to not already be paused (RNXCWF). So once we have paused, nothing changes
> underneath us and the PMU does not need disabling. It would not help anyway:
> armv8pmu_stop() calls brbe_disable(), which zeroes BRBCR_EL1 and discards the
> records we came to read.

That does mean you throw away real freeze events while paused though, in 
addition to the brbe_invalidate() you need to avoid non contiguous 
buffers. So it takes branches away from PMU events.

> 
> You are right that a freeze can still land in the window between reading BRBFCR
> and setting PAUSED, and restoring the value we read would then clear a PAUSED
> bit the hardware set. So v6 checks PMOVSCLR_EL0 and leaves BRBE paused if a
> counter has overflowed. Reads of PMOVSCLR are non-destructive and it stays set
> until the overflow handler clears it, so it is still visible after we have set
> PAUSED ourselves:
> 
>          if (!valid_brbe_version())
>                  return 0;
> 
>          flags = raw_local_daif_save();
> 
>          brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
>          brbcr = read_sysreg_s(SYS_BRBCR_EL1);
> 
>          write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>          isb();
> 
>          trace_hardirqs_off();
> 
>          /* BRBCR_EL1 is zero while the driver has BRBE disabled. */
>          if (!brbcr)
>                  goto restore;
> 
>          ... read the records ...
> 

Up to the point where you read the records you technically don't need 
any branches (if you don't do trace_hardirqs_off()) so you could do the 
whole thing without pausing. Just disable interrupts, read every branch 
entry unconditionally, re-enable interrupts and then find the last valid 
entry and do the branchy stuff after reading.

I'm thinking out loud, but doesn't that make it a lot easier? And it 
avoids the brbe_invalidate() which takes the branches away from the PMU 
event. It also avoids having to think too hard about racing with PMU 
events causing a freeze even after interrupts are disabled and after 
reading the freeze value:

   raw_local_daif_save();
   brbfcr = read_sysreg_s(SYS_BRBFCR_EL1);
   brbcr = read_sysreg_s(SYS_BRBCR_EL1);
   select_bank(0);
   read_record(0);
   read_record(1);
   ...
   select_bank(0);
   read_record(0);
   read_record(1);
   ...
   write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
   isb();
   local_daif_restore();

   /* Now do post processing, find last valid record, check if it was 
enabled by looking at brbcr etc. */

>          if ((brbfcr & BRBFCR_EL1_PAUSED) || read_pmovsclr())
>                  brbfcr |= BRBFCR_EL1_PAUSED;
>          else
>                  brbe_invalidate();
> restore:
>          write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
>          isb();
>          local_daif_restore(flags);
> 
> If BRBE stays paused the records are left alone, they belong to the pending
> overflow handler. Otherwise recording resumes and the records either side of
> the pause are not contiguous (RPKZCF), so they are discarded.
> 
> What do you think about this?
> 
> Thanks,
> Puranjay


