Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F604C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmKuYnc86DNlMiU9IPUM6hRlMNPMsSVV3yRLUh7Zy/w=; b=3A/bsBv6Q5ABqT2boeB5Po66XZ
	DmCDrBv6qt+v4xL3fafggK/0jp7UV1Nc/ek4ZPPw9Q+sUjAkOGMJuSAo5iXgwmQYai/BmDjQv4rYd
	TyCipj7tWu5+mfzcxaNl9EbyBKNLyN0WxXo8GDDHcIaOYVEei0/uQV6z1y1/HZMG/DJofpWyCQyOG
	oZHSw2CK0abRVaS3B70cF970EWfwm0Eb9in4qIfSK0Bc9Oc+BA/WgEAnov/Xsntox8gnPcwggAgjH
	liPJruFvjK0ATM8szj2O5ckgWFTQt3g8AJCj5KNmQw1Ed/uRNCPi1EbP1+69U4ByA0V9ljDnYOrb1
	icuxxBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcq4-000000046JR-1ihE;
	Wed, 05 Aug 2026 14:43:24 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrcq1-000000046IQ-113c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 14:43:22 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so178130666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 07:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785940999; cv=none;
        d=google.com; s=arc-20260327;
        b=ojbshUTCZlxE5i1sD/gMXo/tLQ98gi2Yz54If8GZ7Nqr12afqcmiVE7/7kYApl9Il4
         RmzQBvQm4/c3+cAyVmw61nGovqcLUfd8RnHIsC9+0i1069BozPY0sFxUtnjMz4JVNXiS
         iEFKreIXzHBoVWjM7VaXOPx5SBcttN+F0Oza5ZCn31ebpHfiThuAZTZ0AqNS9hVlHcgC
         eaQT37J1cNk1yyGYxA20uo12uC9F+3PyzLxq2jBHvCmhGINdon5+FZeRwvhGWYCWdj7x
         zwSA/MKG0ktPk0N8ppezrSYiFgCLEo2ZicCijTCs2Y1qGj9ygF9KS6YgwI+SbcpJlrpk
         tbAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GmKuYnc86DNlMiU9IPUM6hRlMNPMsSVV3yRLUh7Zy/w=;
        fh=XDL6SiRy5QPgh1H9fdxdpCVLgUxSKrTnkfoAAb71RA0=;
        b=B3x0PWjQCpMnnbLx8wmPO/wTm8ZzsDKmJSu3koETKhKaJDiqnYw7DLBDO+ccr+3XOJ
         fkCyJ6Sbm3lNEt7dqNtfyJ6weMtAYSV58XstABnhPHc2TFOguYCzuZ5bdk6LmW5TjCGD
         /Tj35sP2yBPCp6pN4yzMHheoXF2Kx3gK16GEBHGlRnmN/fScTYByV0cO3zqq6cuMUtFC
         a+jiFf8XFvpDTlIciht+hA+CjJmkC1vbxQ44sRncG0G81dljSHsoR5BQW1F1xlv91gzN
         rdL+QgclkuWQcQAcxjC3o29t6N3mvfzy0k2Rl2LhJt/gsP0ueq2Il2h98nR3W4JiL0Un
         1WaQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785940998; x=1786545798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GmKuYnc86DNlMiU9IPUM6hRlMNPMsSVV3yRLUh7Zy/w=;
        b=sUGHmXIotdfz16MLW/c+fNWZ/ckjoMerXW2R1A3lpeL1U5FY1e9/AfqdcoRA861yjF
         f3GEuKad2nLk7VIbKqOpDPGJHq8bzq0HFXyNvsWcfehti6g5lpsOd7RxBov/rcdBfR4J
         5lFjez95dh9qJSGfrAkafLbl0xf0xG/znf3j+cTlD7oa5KI1v9COIeGL/vJze0AkpaXD
         qdnkgO9qQ/cB/TEr8SzZTeKhv3kQ/q+rzvXWDfMwTyRlK1l4bL2b/Qrv3ITGS/OU1qQj
         TR10zRsMwSMZQwmv3br4GQDqIWcVqDTDmGnP29EyZS8fQSmOL5HAhAq3rfPZsn/CQvLy
         eKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785940998; x=1786545798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GmKuYnc86DNlMiU9IPUM6hRlMNPMsSVV3yRLUh7Zy/w=;
        b=HYx6NCvTQEBi0t38i7Aj6VbL+RW/k/K80oXamxKV3ARiErXOo4tw9AD6Zmv1ZB6mmp
         iAkCiUnQc5Yv2cira7BupvKEWoF37hrZPqZioojZjtOvOjxfb/VzbCkGqVq0uop/oyRo
         bFTSRfKFikJAWQyAocSK7XrkqJQ3WKUZH5apRXjrQR3bs5JTfJjedsIlLYoP95i6BNFS
         kTiGwOCttyYLIwJaMVal4u6HMo+fVU4wX5RBBSEb5WRP+71oxc909Ew6sSW6Fk+tncje
         GVGVA7eGkDK9n6jXJPOBvdwNER8CINhO0l+Rn1g/5dsDoc6sMOoYqXxu1h8ZN/pKKanV
         LR4g==
X-Forwarded-Encrypted: i=1; AHgh+RrcQSLJthFcilbTiOhg0J5pkx1jfpyqTdCWofYzzBrVr+68s3RLVlHZrQWBogrcIrmoyhvDfyHfV/ux2QCiOM1k@lists.infradead.org
X-Gm-Message-State: AOJu0YwurRzt+pX2l314fPDt3cpqGWd4aAMP/l4jWEXRpm7qLzNEP60z
	rOKhxwHao51SJ+ZUV2Rv/81YsFuIBhkpEztF5VXGG7VbT9jQDS3ljMpmdSzF6qBlupsKhUC0+Kz
	GydvGtj/1vgQUpoHOz8vlL5vD6n82Eq4=
X-Gm-Gg: AR+sD13wjuQzMBsXw1TOSwqel86haOapoScJ10tdtNnarmwd9ABoy6NUQY5OlA+HIX/
	yWZIZvl+JCgWSXF0JET4I0tOAUGpd1EN/8ELDb2MRKJdWd9kbXsQltS68igCVhzPwvsm0IZ03wf
	QU1wzADD4G5RHT3QPU2uBQm5e8kPvxC3ju2HLjoiGS2oud23NK2pVx2a3OY3DKRIlNUfgDOIaAZ
	Yk5JSCX15es42Up3NhQvY0LUUeEaSbLmI+XpadW895LwaIgwSP+PaSAzppbwiVhoOIKCkJGL+yG
	7gVwFb1JdAj40pb+cd+usyyBEAmWUljyQB0HBocA7lenSbI03hBh4eTegcW2
X-Received: by 2002:a17:907:97d3:b0:c1f:e09d:12 with SMTP id
 a640c23a62f3a-c2039ed30e4mr347405066b.25.1785940998077; Wed, 05 Aug 2026
 07:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-4-puranjay@kernel.org>
 <8a24abbc-10bc-42bb-8fee-0a174d8f1751@linaro.org> <CANk7y0inRXCUKtuio3Cb03DvuNPq6yp1o+tsE8PZitrY0LaOPQ@mail.gmail.com>
 <6ee32efc-01be-4532-aa59-3948f59156c0@linaro.org> <CANk7y0hU_m6gJ9FpGfGUJg-Ok8PoXhKruny_0OkeOgLbCo6ZLA@mail.gmail.com>
 <9fa68534-2b12-420a-93b7-a6ada21c180e@linaro.org>
In-Reply-To: <9fa68534-2b12-420a-93b7-a6ada21c180e@linaro.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 5 Aug 2026 15:43:03 +0100
X-Gm-Features: AUfX_myFuMQkGotW7dGfaw08yRHYvZWV8Y5fv9LrxJXxEZA7_XIfztesEAbA_3s
Message-ID: <CANk7y0is-SB+hPhriwQ24v-UUTUfk9p01y1CQm=q_Y-=GXO04A@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: James Clark <james.clark@linaro.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Shuah Khan <shuah@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Stephane Eranian <eranian@google.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Usama Arif <usama.arif@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_074321_462297_5C1F5B56 
X-CRM114-Status: GOOD (  38.89  )
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

On Wed, Aug 5, 2026 at 2:58=E2=80=AFPM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 05/08/2026 12:47, Puranjay Mohan wrote:
> > On Wed, Aug 5, 2026 at 11:07=E2=80=AFAM James Clark <james.clark@linaro=
.org> wrote:
> >>
> >>
> >>
> >> On 03/08/2026 7:54 pm, Puranjay Mohan wrote:
> >>> On Mon, Aug 3, 2026 at 12:07=E2=80=AFPM James Clark <james.clark@lina=
ro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 16/06/2026 16:57, Puranjay Mohan wrote:
> >>>>> Enable bpf_get_branch_snapshot() on ARM64 by implementing the
> >>>>> perf_snapshot_branch_stack static call for BRBE.
> >>>>>
> >>>>> BRBE is paused before masking exceptions to avoid branch buffer
> >>>>> pollution from trace_hardirqs_off(). Exceptions are then masked wit=
h
> >>>>> local_daif_save() to prevent PMU overflow pseudo-NMIs from interfer=
ing.
> >>>>> If an overflow between pause and DAIF save re-enables BRBE, the sna=
pshot
> >>>>> detects this via BRBFCR_EL1.PAUSED and bails out.
> >>>>>
> >>>>> Branch records are read using perf_entry_from_brbe_regset() with a =
NULL
> >>>>> event pointer to bypass event-specific filtering. The buffer is
> >>>>> invalidated after reading.
> >>>>>
> >>>>> Introduce a for_each_brbe_entry() iterator to deduplicate bank
> >>>>> iteration between brbe_read_filtered_entries() and the snapshot.
> >>>>>
> >>>>> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> >>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>>>> ---
> >>>>>     drivers/perf/arm_brbe.c  | 128 ++++++++++++++++++++++++++++++++=
-------
> >>>>>     drivers/perf/arm_brbe.h  |   9 +++
> >>>>>     drivers/perf/arm_pmuv3.c |   5 +-
> >>>>>     3 files changed, 120 insertions(+), 22 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> >>>>> index effbdeacfcbb..a141ad7abcf2 100644
> >>>>> --- a/drivers/perf/arm_brbe.c
> >>>>> +++ b/drivers/perf/arm_brbe.c
> >>>>> @@ -9,6 +9,7 @@
> >>>>>     #include <linux/types.h>
> >>>>>     #include <linux/bitmap.h>
> >>>>>     #include <linux/perf/arm_pmu.h>
> >>>>> +#include <asm/daifflags.h>
> >>>>>     #include "arm_brbe.h"
> >>>>>
> >>>>>     #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> >>>>> @@ -256,6 +257,14 @@ static bool valid_brbe_version(int brbe_versio=
n)
> >>>>>                brbe_version =3D=3D ID_AA64DFR0_EL1_BRBE_BRBE_V1P1;
> >>>>>     }
> >>>>>
> >>>>> +static __always_inline bool cpu_has_brbe(void)
> >>>>
> >>>> This should be more like cpu_valid_brbe_version(). has_brbe() only
> >>>> implies that the CPU has BRBE, not that it's a version that the driv=
er
> >>>> supports. And it's actually just a wrapper around valid_brbe_version=
()
> >>>> that accesses the ID reg on that CPU, not a functionally different c=
heck.
> >>>>
> >>>> But it also looks like valid_brbe_version() isn't called from anywhe=
re
> >>>> else, so why not delete that function and use its name for the new o=
ne?
> >>>
> >>> I will do that in next version
> >>>
> >>>>
> >>>>> +{
> >>>>> +     u64 aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> >>>>> +     int brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0, I=
D_AA64DFR0_EL1_BRBE_SHIFT);
> >>>>> +
> >>>>> +     return valid_brbe_version(brbe);
> >>>>> +}
> >>>>> +
> >>>>>     static void select_brbe_bank(int bank)
> >>>>>     {
> >>>>>         u64 brbfcr;
> >>>>> @@ -271,6 +280,20 @@ static void select_brbe_bank(int bank)
> >>>>>         isb();
> >>>>>     }
> >>>>>
> >>>>> +static inline void __brbe_advance(int *bank, int *idx, int nr_hw)
> >>>>> +{
> >>>>> +     if (++(*idx) >=3D BRBE_BANK_MAX_ENTRIES &&
> >>>>> +         *bank * BRBE_BANK_MAX_ENTRIES + *idx < nr_hw) {
> >>>>> +             *idx =3D 0;
> >>>>> +             select_brbe_bank(++(*bank));
> >>>>> +     }
> >>>>> +}
> >>>>> +
> >>>>> +#define for_each_brbe_entry(idx, nr_hw)                           =
           \
> >>>>> +     for (int __bank =3D (select_brbe_bank(0), 0), idx =3D 0;     =
       \
> >>>>> +          __bank * BRBE_BANK_MAX_ENTRIES + idx < (nr_hw);         =
   \
> >>>>> +          __brbe_advance(&__bank, &idx, (nr_hw)))
> >>>>> +
> >>>>>     static bool __read_brbe_regset(struct brbe_regset *entry, int i=
dx)
> >>>>>     {
> >>>>>         entry->brbinf =3D get_brbinf_reg(idx);
> >>>>> @@ -474,11 +497,9 @@ unsigned int brbe_num_branch_records(const str=
uct arm_pmu *armpmu)
> >>>>>
> >>>>>     void brbe_probe(struct arm_pmu *armpmu)
> >>>>>     {
> >>>>> -     u64 brbidr, aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> >>>>> -     u32 brbe;
> >>>>> +     u64 brbidr;
> >>>>>
> >>>>> -     brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA=
64DFR0_EL1_BRBE_SHIFT);
> >>>>> -     if (!valid_brbe_version(brbe))
> >>>>> +     if (!cpu_has_brbe())
> >>>>>                 return;
> >>>>>
> >>>>>         brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> >>>>> @@ -618,10 +639,10 @@ static bool perf_entry_from_brbe_regset(int i=
ndex, struct perf_branch_entry *ent
> >>>>>
> >>>>>         brbe_set_perf_entry_type(entry, brbinf);
> >>>>>
> >>>>> -     if (!branch_sample_no_cycles(event))
> >>>>> +     if (!event || !branch_sample_no_cycles(event))
> >>>>>                 entry->cycles =3D brbinf_get_cycles(brbinf);
> >>>>>
> >>>>> -     if (!branch_sample_no_flags(event)) {
> >>>>> +     if (!event || !branch_sample_no_flags(event)) {
> >>>>>                 /* Mispredict info is available for source only and=
 complete branch records. */
> >>>>>                 if (!brbe_record_is_target_only(brbinf)) {
> >>>>>                         entry->mispred =3D brbinf_get_mispredict(br=
binf);
> >>>>> @@ -774,32 +795,97 @@ void brbe_read_filtered_entries(struct perf_b=
ranch_stack *branch_stack,
> >>>>>     {
> >>>>>         struct arm_pmu *cpu_pmu =3D to_arm_pmu(event->pmu);
> >>>>>         int nr_hw =3D brbe_num_branch_records(cpu_pmu);
> >>>>> -     int nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> >>>>>         int nr_filtered =3D 0;
> >>>>>         u64 branch_sample_type =3D event->attr.branch_sample_type;
> >>>>>         DECLARE_BITMAP(event_type_mask, PERF_BR_ARM64_MAX);
> >>>>>
> >>>>>         prepare_event_branch_type_mask(branch_sample_type, event_ty=
pe_mask);
> >>>>>
> >>>>> -     for (int bank =3D 0; bank < nr_banks; bank++) {
> >>>>> -             int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_EN=
TRIES);
> >>>>> -             int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_=
ENTRIES);
> >>>>> +     for_each_brbe_entry(i, nr_hw) {
> >>>>> +             struct perf_branch_entry *pbe =3D &branch_stack->entr=
ies[nr_filtered];
> >>>>>
> >>>>> -             select_brbe_bank(bank);
> >>>>> +             if (!perf_entry_from_brbe_regset(i, pbe, event))
> >>>>> +                     break;
> >>>>>
> >>>>> -             for (int i =3D 0; i < nr_this_bank; i++) {
> >>>>> -                     struct perf_branch_entry *pbe =3D &branch_sta=
ck->entries[nr_filtered];
> >>>>> +             if (!filter_branch_record(pbe, branch_sample_type, ev=
ent_type_mask))
> >>>>> +                     continue;
> >>>>>
> >>>>> -                     if (!perf_entry_from_brbe_regset(i, pbe, even=
t))
> >>>>> -                             goto done;
> >>>>> +             nr_filtered++;
> >>>>> +     }
> >>>>>
> >>>>> -                     if (!filter_branch_record(pbe, branch_sample_=
type, event_type_mask))
> >>>>> -                             continue;
> >>>>> +     branch_stack->nr =3D nr_filtered;
> >>>>> +}
> >>>>>
> >>>>> -                     nr_filtered++;
> >>>>> -             }
> >>>>> +/*
> >>>>> + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> >>>>> + * self-recording and return 0 if the snapshot state appears distu=
rbed.
> >>>>> + */
> >>>>> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entri=
es, unsigned int cnt)
> >>>>> +{
> >>>>> +     unsigned long flags;
> >>>>> +     int nr_hw, nr_copied =3D 0;
> >>>>> +     u64 brbfcr, brbcr;
> >>>>> +
> >>>>> +     if (!cnt)
> >>>>> +             return 0;
> >>>>
> >>>> If you're trying to avoid branches before pausing BRBE, can't you ch=
eck
> >>>> this after the pause?
> >>>
> >>> will drop this in the next version and this is just an optimization.
> >>>
> >>>>
> >>>>> +
> >>>>> +     /* Guard against running on a CPU without BRBE (e.g. big.LITT=
LE). */
> >>>>> +     if (!cpu_has_brbe())
> >>>>> +             return 0;
> >>>>> +
> >>>>> +     /*
> >>>>> +      * Pause BRBE first to avoid recording our own branches. The
> >>>>> +      * sysreg read/write and ISB are branchless, so pausing befor=
e
> >>>>> +      * checking BRBCR avoids polluting the buffer with our own
> >>>>> +      * conditional branches.
> >>>>> +      */
> >>>>> +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>>> +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>>> +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >>>>
> >>>> Can this work without first disabling interrupts? Sashiko pointed it
> >>>> out, but I think it's correct. If you read an active state into brbf=
cr,
> >>>> then the PMU event fires and disables BRBE, then you disable interru=
pts,
> >>>> then you would restore an active state when it should be inactive.
> >>>> Surely the only way to do it properly is to disable interrupts befor=
e
> >>>> touching anything at all, if the PMU handler is also touching the sa=
me
> >>>> registers?
> >>>>
> >>>> If you want to avoid trace_hardirqs_off() can you make a new
> >>>> raw_local_daif_save() that disables interrupts and then call
> >>>> trace_hardirqs_off() yourself after pausing BRBE? Or not call
> >>>> trace_hardirqs_off() at all? There is a comment mentioning something
> >>>> like that in arch/arm64/kernel/suspend.c.
> >>>
> >>> Yes. I'll add raw_local_daif_save()/raw_local_daif_restore() and mask=
 before
> >>> touching any BRBE register, which fixes the stale restore. trace_hard=
irqs_off()
> >>> then moves below the pause so lockdep still sees a balanced off/on pa=
ir while
> >>> its branches land in an already paused buffer.
> >>>
> >>>>
> >>>> Also, disabling interrupts doesn't stop the PMU event from overflowi=
ng
> >>>> and changing the state of PAUSED either. I think this is another pat=
h
> >>>> that leads to you restoring the wrong state, so don't you also need =
to
> >>>> disable the PMU?
> >>>
> >>> Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a free=
ze needs
> >>> BRBE to not already be paused (RNXCWF). So once we have paused, nothi=
ng changes
> >>> underneath us and the PMU does not need disabling. It would not help =
anyway:
> >>> armv8pmu_stop() calls brbe_disable(), which zeroes BRBCR_EL1 and disc=
ards the
> >>> records we came to read.
> >>
> >> That does mean you throw away real freeze events while paused though, =
in
> >> addition to the brbe_invalidate() you need to avoid non contiguous
> >> buffers. So it takes branches away from PMU events.
> >
> > RBHYTD gives a freeze two effects: PAUSED is set, and BRBTS_EL1 capture=
s a
> > timestamp. Recording has already stopped because we paused, and the dri=
ver never
> > reads BRBTS_EL1. On the way out we check PMOVSCLR_EL0 and leave PAUSED =
set if a
> > counter overflowed, so a pending overflow handler still finds a frozen =
buffer.
> >
> >> So it takes branches away from PMU events.
> >
> > Yes, but that is brbe_invalidate(), not the pause. Interrupts are maske=
d and
> > nothing else runs on the CPU, so the only branches the pause suppresses=
 are the
> > snapshot's own.
> >
> >>>
> >>> You are right that a freeze can still land in the window between read=
ing BRBFCR
> >>> and setting PAUSED, and restoring the value we read would then clear =
a PAUSED
> >>> bit the hardware set. So v6 checks PMOVSCLR_EL0 and leaves BRBE pause=
d if a
> >>> counter has overflowed. Reads of PMOVSCLR are non-destructive and it =
stays set
> >>> until the overflow handler clears it, so it is still visible after we=
 have set
> >>> PAUSED ourselves:
> >>>
> >>>           if (!valid_brbe_version())
> >>>                   return 0;
> >>>
> >>>           flags =3D raw_local_daif_save();
> >>>
> >>>           brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>           brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>
> >>>           write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >>>           isb();
> >>>
> >>>           trace_hardirqs_off();
> >>>
> >>>           /* BRBCR_EL1 is zero while the driver has BRBE disabled. */
> >>>           if (!brbcr)
> >>>                   goto restore;
> >>>
> >>>           ... read the records ...
> >>>
> >>
> >> Up to the point where you read the records you technically don't need
> >> any branches (if you don't do trace_hardirqs_off()) so you could do th=
e
> >> whole thing without pausing. Just disable interrupts, read every branc=
h
> >> entry unconditionally, re-enable interrupts and then find the last val=
id
> >> entry and do the branchy stuff after reading.
> >>
> >> I'm thinking out loud, but doesn't that make it a lot easier? And it
> >> avoids the brbe_invalidate() which takes the branches away from the PM=
U
> >> event. It also avoids having to think too hard about racing with PMU
> >> events causing a freeze even after interrupts are disabled and after
> >> reading the freeze value:
> >>
> >>     raw_local_daif_save();
> >>     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>     select_bank(0);
> >>     read_record(0);
> >>     read_record(1);
> >>     ...
> >>     select_bank(0);
> >>     read_record(0);
> >>     read_record(1);
> >>     ...
> >>     write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >>     isb();
> >>     local_daif_restore();
> >>
> >>     /* Now do post processing, find last valid record, check if it was
> >> enabled by looking at brbcr etc. */
> >
> > MRS is not a branch, so that works, but three things would have to chan=
ge:
> >
> > 1. perf_entry_from_brbe_regset() goes through BRBE_REGN_SWITCH, a 32 ca=
se
> >     switch, because the register number has to be an immediate. gcc emi=
ts a jump
> >     table and the function has 52 branches in the object file. The read=
 would
> >     need full unrolling.
> >
>
> Yes you would have to manually unroll it. I doubt the compiler would
> emit a branch for BRBE_REGN_SWITCH() because your indexes are static if
> it's unrolled. But if it does you can change it to a sequence of
> read_sysreg_s()s.
>
> If you really want to be sure there are no branches, write it in a
> single asm block.

I will try that approach in the next version.

> > 2. RPGDLX needs an ISB before the reads, and Table D19-10 makes it
> >     IMPLEMENTATION DEFINED whether ISB itself generates a record. When =
we pause,
> >     IZCHRF means the pausing ISB cannot pollute the buffer it is about =
to read.
> >
>
> I assume one potential extra record from the isb() is acceptible seeing
> as you already have two or more conditions plus a function call before
> the pause? Is the problem that you don't know whether to filter it out
> later because it's IMPDEF and isn't always there? You already don't know
> exactly how many branches there will be before the pause beause it's
> written in C. So I'm not sure what the exact issue here is.
>
> > 3. 64 record parts still need a bank switch, so BRBFCR_EL1 still has to=
 be
> >     written and restored.
> >
>
> Yes that was included in my pseudo code example but it's still
> branchless. I did miss that you might need an isb() after disabling
> interrupts, but you added one for RPGDLX anyway.
>
> > Correctness would then depend on the read staying branchless, which is =
not
> > checkable at build time and fails silently: a branch mid read shifts th=
e buffer,
>
> Why would the compiler insert a branch between two read_sysreg_s()s,
> which are asm volatile? Is that allowed?

You are right, I just over complicated it!

> > giving a duplicate and a gap. 64 * 24 bytes of records also wants a per=
-CPU
> > scratch buffer rather than the stack.
> >
>
> A per-CPU scratch buffer doesn't sound too bad. But aren't you in
> control of how many entries are available to write to? You can reject
> any calls that have fewer than 64 and always write directly to *entries.
>
> You could also compare with 'cnt' after reading each record and exit the
> read section. Like you say below, branches not taken don't generate
> records, and once the branch is taken you stop reading so after that
> point generating records doesn't matter.
>
> > Happy to prototype it. What I would not do is pause without invalidatin=
g:
> > records are from/to pairs, so a consumer walking across the hole recons=
tructs a
> > call path that never happened. The invalidate was Mark's request after =
the RFC,
> > "to maintain record contiguity for other consumers", so dropping the pa=
use drops
> > that too.
>
> Well the point was to not have to pause at all, so there's no need to
> invalidate either. Even if you did add a pause, as long as there are no
> branches between the pause and resume you don't need an invalidate
> because you didn't miss any branches.
>
> >
> > I was thinking of this for v6:
> >
> >          flags =3D raw_local_daif_save();
> >
> >          /* The BRBE sysregs below are UNDEFINED without this. */
> >          if (!valid_brbe_version()) {
>
> You don't need to disable interrupts to call this, it's a constant. Or
> is it to stop migration?

It was to stop migration.

>
> V5 reads sysregs before disabling interrupts so I assume migration isn't
> an issue here.
>
> >                  raw_local_daif_restore(flags);
> >                  return 0;
> >          }
> >
> >          brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >          brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >
> >          write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >          isb();
> >
> >          /* BRBCR_EL1 is zero while the driver has BRBE disabled. */
> >          if (!brbcr) {
> >                  write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >                  isb();
> >                  raw_local_daif_restore(flags);
> >                  return 0;
> >          }
> >
> >          trace_hardirqs_off();
> >
> >          ... read the records ...
> >
> >          if (!(brbfcr & BRBFCR_EL1_PAUSED) &&
> >              !(read_pmovsclr() & (ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_F))=
)
> >                  brbe_invalidate();
> >          else
> >                  brbfcr |=3D BRBFCR_EL1_PAUSED;
> >
> >          write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >          isb();
> >          local_daif_restore(flags);
> >
> > Exceptions are masked before anything is sampled, BRBCR_EL1 is only rea=
d and
> > never written, and BRBFCR_EL1 is written back from the value saved unde=
r the
> > mask. cpu_has_brbe() is now valid_brbe_version().
> >
> > Neither conditional costs a record: valid_brbe_version() falls through =
when BRBE
> > is present (RBBNSZ, only taken branches are recorded), and the BRBCR_EL=
1 test is
>
> Isn't the compiler free to invert it and make the happy path a taken
> branch. I don't think any of that can be assumed without writing in
> assembly.
>
> > after the pause. It cannot move later because BRBFCR_EL1 is UNDEFINED w=
ithout
> > FEAT_BRBE.
> >
> > PMOVSCLR_EL0 is masked because PMCCNTR_EL0 is bit 31 and PMCR_EL0.N is =
at most
> > 31, so the cycle counter is outside every range RNXCWF, RGXGWY, RPKTXQ =
and
> > RLDMVK name. Unmasked, a cycle counter overflow looked like a freeze.
>
> Sorry I didn't understand this bit. Can you elaborate?
>
> >
> > Do you think this version works?
> >
> > Thanks,
> > Puranjay
>
>
>  From your previous reply:
>
>    "Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a
>     freeze needs BRBE to not already be paused (RNXCWF). So once we have
>     paused, nothing changes underneath us and the PMU does not need
>     disabling."
>
> I'm still not 100% convinced this is correct. You read BRBFCR_EL1 and
> write PAUSED to it in separate instructions. The PMU can overflow and
> change the PAUSED state between those two instructions leading to
> restoration of the wrong value.

I was checking if the overflow happened and leaving it paused in that case.

> Isn't this non pausing version way simpler to understand, and also has
> the benefit of not invalidating someone elses BRBE buffers. The only
> downside seems to be that it might have some assembly to make sure the
> if statements are always not taken branches rather than inverted, but
> personally I don't think that makes it any harder to understand than the
> branchy pausing version in V5:
>
>    #define read_record(i)
>      if (i >=3D cnt)                                       \
>         goto out;                                        \
>      isb(); /* Ensure our own exit branch isn't read? */ \
>      entries[i].inf =3D read_brbe_inf(i)                   \
>      if (!inf)                                           \
>         goto out;                                        \
>      entries[i].src =3D read_brb_src(i)                    \
>      entries[i].dst =3D read_brb_dst(i)                    \
>
>    raw_local_daif_save();
>
>    /* disable counters to stop BRBFCR_EL1.PAUSE state changing */
>    pmcr =3D armv8pmu_pmcr_read();
>    armv8pmu_pmcr_write(pmcr & ~ARMV8_PMU_PMCR_E);
>    isb();
>
>    brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
>    brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
>
>    select_bank(0);
>    read_record(0);
>    read_record(1);
>    ...
>    select_bank(1);
>    read_record(32);
>    read_record(33);
>    ...
>
> out:
>    write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
>    isb();
>    armv8pmu_pmcr_write(pmcr);
>    raw_local_daif_restore();
>
>    /* Post process entries[n].inf etc into correct format */

I will try out this approach and get back.

Thanks,
Puranjay

