Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7095CC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PtPUEU6K4nOHbG681U3DnztrdVloOBKzNVLP+ulTPO8=; b=F8MiExt9ZyGH6kuKQ7Ab2/1N6o
	MNBTju9TqYxNdTba25zrkgE5NzHkh1YKjjlrl3ph1LaUlw2dImKkyR7w6nxKWvJWEQo5tvA3YXztS
	ZljwGlftPPshFBYqz3F/t6iH6ho56KMckE7JGOYRWtHTO49jdGpo9I1XIZImOlyrrQzXcwmvET/3X
	5E6SDkmlQ8QGZjbwJvG6Gjq6QUz24aey9hy1ZR/GdmNnGG+ryvbUJg837y9mLIn5c9PW0thkRRM4p
	TOMo70/niIWzIJVapYqE/oj5YfjnRuy1mZHiqL8aiwHH7e06cZgEjCcFKbhsEIffC21moWYDaO2C5
	G/j9zGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdn3-00000004Cqu-1hov;
	Wed, 05 Aug 2026 15:44:21 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrdn1-00000004CqZ-0Lql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 15:44:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-c15d3cd51b2so162567866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 08:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785944657; cv=none;
        d=google.com; s=arc-20260327;
        b=jdGueyc4U0Gy7CqU2bk5gcGOAntDOwjCBWrUTqtB41e5PaSNR11l2SbWAX9+oysL5F
         PBOTPfKzS/oIWH884g3ykUyQ5HqQNFgoe++H/SED4IX9z7iqAsDZlR3/Feu63Bw1ifsL
         EfY3fHf1KpKXByvJtLqJRqcW/Df7NgntGzzZxy/t0WDO4Fw/4in6z+ayIhfyaUr3tT42
         xhx5eDsIh6h3ZC46z3SUSgz059YZpyv3s4KkZSNM48pSPn6U1A+HtIOGCaCSEWrvl5u5
         +FI+zmrO2r2u4vRtu+ZkIOotjeRAT4v2RMvul/ylbLZ2PWyDEXocA3U+b4dJZq8S5N06
         C9og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PtPUEU6K4nOHbG681U3DnztrdVloOBKzNVLP+ulTPO8=;
        fh=Hx86MymZzMvY9M9K+beKpLS/MfOpZV2JeaTI9apiJds=;
        b=r06gbi/34eJl96bSHRx4JQNvOfJYTqkNE3tlaJhC2232En/JbzDl/genO4U0LQum/J
         hhnackYXV0XItRRXhF8jWmlUsO69iPUQUqoKSwt0nP4wYQF5A2IDERG0tJ4mY7mES8UU
         BpWZpERkUnSt9rXSHqKvHV92oDTL9FtsCcwxYXYqfzaTlRUp4gX2Sf/EUB6Dk4Fsgmfc
         /Qg7IfSEkqyH06094L6NvrhUqIL0nCmJGps6EsueWkv6vu0Rau/CasI3GWopRzbNZtn/
         G93XVX25GkfMOtHjTEu2AThC/Tq9qNCZiyz7yY+Xk0UiD8IOESv2h5ia6hfRG7AIkm+Q
         9xmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785944657; x=1786549457; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtPUEU6K4nOHbG681U3DnztrdVloOBKzNVLP+ulTPO8=;
        b=m+VEoPhVBLPp7uE7Udmes5wwbbDWbeH5ww1fsmI4IAMkhipMjfF8ERfcjucwhqC31k
         +LnCutzAoP6eAhL3vVEc3u55JhG/kfApgu11BAQRIOi9rG+7Y5nZv7ff5GFY3+O7VpCa
         kBVco0sRbRL7HJoPOk7OlJ1srNoGePMNiYr07Oj/lWH/vOjQaoJtljBAm9m2dJIMIa1U
         VWFBqECTAwDD8WMMGBvAXpdWorX4AGj0JHe3Lw0otGXQaUEe+I5UOlmeI77RsEURAjbF
         KbYjElvSICfRYw8APBmi9IeWkGZ1R3yS5PuAiBOnhunDcxPRXd8QS01Ku55pmdXHsi+I
         38IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944657; x=1786549457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtPUEU6K4nOHbG681U3DnztrdVloOBKzNVLP+ulTPO8=;
        b=WQxS18axAb8BLMKNVzv9nhOecZ9hHVPAujlEF4elLFwQgTJgj7KSRYPTcxvQbOrKzO
         sCzv/YBfpziXZuYYb7wbj5bOpfN1LuS1Ff5inNw7/zr5oa5Rb8pSM0FtoLJltSeDzx73
         yWEpjUw+2eEYTz+w2TcBgqklIXV/s5TlefhLMIL8ZZrUndeHcS5UpEpTggoPyK2sZJAo
         7+POsawteiWs0YtyUuWmJFXEkBDQrAYmaMMkIqLlZILEb4OVmR/yKBmsw+GSUwzqIfgg
         6peMlKJcPtA2tlY0otdORYF/Qekn3KZLBgHHxgSx0QLQ1v6w03aPd6mVtbIFWO5v3jXU
         X0Cg==
X-Forwarded-Encrypted: i=1; AHgh+RointAy8e6HrwanM/KuChahJ5dlfOQwAQZKWEXJlToC7ag7asWZTjcnwqghpvATW1j+guyxFtzQqkzkbTB0xq4H@lists.infradead.org
X-Gm-Message-State: AOJu0YxTn14NzMbZakQKprbYQ+zmduYgn6NV8gzeikkhMWpl4VG+idfI
	zmZBDNrBVTSp0ekD4K9k1aEi6g6wB5jmOwWnmHgdJ1TZ70hx20Rnwgm2N5MLT0TSJ9fFmcqb+58
	G/lNpIIZla4WujRoWVoDxT8qb3xV+ijA=
X-Gm-Gg: AR+sD10FqmzRwihcsoG4CyyriDGaH78kqg/qII0ZeXGbTU2bZN1W0Mc/k+hGG7QOM3A
	RT+fCvFETw4jlWvXbRF+ob8N4OfnoLNoc/CQQui4XE+E9E0oHi2c0XpPQi9vCUzGsYOhWCgMQtU
	oCA1gFZMtAfusM9cplGR1eB7KQkkHv5vrr8+FNcjo3AjHngo3TDJn1G1FvuaBV9jzlm6Ov9JaKy
	tsDwOjGY1IcS1GnkqamAkOEAB8XIbLA1Z3cv6zAzbnDKLkSZ6R94dSfI+99QgIEBX9r5LWeNn1c
	s3EnIHA7ZqvQpowpSiyFp1N0rF8rNHditH39CRT8qWiz7o+XRLE6Vi7zSyjcBKQrh/3sd8N+
X-Received: by 2002:a17:907:1688:b0:c20:223e:940a with SMTP id
 a640c23a62f3a-c2039e699e3mr335339866b.21.1785944656604; Wed, 05 Aug 2026
 08:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-4-puranjay@kernel.org>
 <8a24abbc-10bc-42bb-8fee-0a174d8f1751@linaro.org> <CANk7y0inRXCUKtuio3Cb03DvuNPq6yp1o+tsE8PZitrY0LaOPQ@mail.gmail.com>
 <6ee32efc-01be-4532-aa59-3948f59156c0@linaro.org> <CANk7y0hU_m6gJ9FpGfGUJg-Ok8PoXhKruny_0OkeOgLbCo6ZLA@mail.gmail.com>
 <9fa68534-2b12-420a-93b7-a6ada21c180e@linaro.org> <CANk7y0is-SB+hPhriwQ24v-UUTUfk9p01y1CQm=q_Y-=GXO04A@mail.gmail.com>
 <ffeea852-b55b-45b5-afcd-47dc4e6f6824@linaro.org>
In-Reply-To: <ffeea852-b55b-45b5-afcd-47dc4e6f6824@linaro.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 5 Aug 2026 16:44:02 +0100
X-Gm-Features: AUfX_mwSkNmLG_4KuocMiMKxbKSsF0wqXR8t9qAZcppzEjsHXiBYd-yJ5d-EIiE
Message-ID: <CANk7y0gcj-kRCt-EgL6UK+Tc4xvJQkGz9F=HNpE86kB3fKxymA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260805_084419_326525_51FDE990 
X-CRM114-Status: GOOD (  34.94  )
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

On Wed, Aug 5, 2026 at 4:14=E2=80=AFPM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 05/08/2026 15:43, Puranjay Mohan wrote:
> > On Wed, Aug 5, 2026 at 2:58=E2=80=AFPM James Clark <james.clark@linaro.=
org> wrote:
> >>
> >>
> >>
> >> On 05/08/2026 12:47, Puranjay Mohan wrote:
> >>> On Wed, Aug 5, 2026 at 11:07=E2=80=AFAM James Clark <james.clark@lina=
ro.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 03/08/2026 7:54 pm, Puranjay Mohan wrote:
> >>>>> On Mon, Aug 3, 2026 at 12:07=E2=80=AFPM James Clark <james.clark@li=
naro.org> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 16/06/2026 16:57, Puranjay Mohan wrote:
> >>>>>>> Enable bpf_get_branch_snapshot() on ARM64 by implementing the
> >>>>>>> perf_snapshot_branch_stack static call for BRBE.
> >>>>>>>
> >>>>>>> BRBE is paused before masking exceptions to avoid branch buffer
> >>>>>>> pollution from trace_hardirqs_off(). Exceptions are then masked w=
ith
> >>>>>>> local_daif_save() to prevent PMU overflow pseudo-NMIs from interf=
ering.
> >>>>>>> If an overflow between pause and DAIF save re-enables BRBE, the s=
napshot
> >>>>>>> detects this via BRBFCR_EL1.PAUSED and bails out.
> >>>>>>>
> >>>>>>> Branch records are read using perf_entry_from_brbe_regset() with =
a NULL
> >>>>>>> event pointer to bypass event-specific filtering. The buffer is
> >>>>>>> invalidated after reading.
> >>>>>>>
> >>>>>>> Introduce a for_each_brbe_entry() iterator to deduplicate bank
> >>>>>>> iteration between brbe_read_filtered_entries() and the snapshot.
> >>>>>>>
> >>>>>>> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> >>>>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >>>>>>> ---
> >>>>>>>      drivers/perf/arm_brbe.c  | 128 +++++++++++++++++++++++++++++=
+++-------
> >>>>>>>      drivers/perf/arm_brbe.h  |   9 +++
> >>>>>>>      drivers/perf/arm_pmuv3.c |   5 +-
> >>>>>>>      3 files changed, 120 insertions(+), 22 deletions(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> >>>>>>> index effbdeacfcbb..a141ad7abcf2 100644
> >>>>>>> --- a/drivers/perf/arm_brbe.c
> >>>>>>> +++ b/drivers/perf/arm_brbe.c
> >>>>>>> @@ -9,6 +9,7 @@
> >>>>>>>      #include <linux/types.h>
> >>>>>>>      #include <linux/bitmap.h>
> >>>>>>>      #include <linux/perf/arm_pmu.h>
> >>>>>>> +#include <asm/daifflags.h>
> >>>>>>>      #include "arm_brbe.h"
> >>>>>>>
> >>>>>>>      #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> >>>>>>> @@ -256,6 +257,14 @@ static bool valid_brbe_version(int brbe_vers=
ion)
> >>>>>>>                 brbe_version =3D=3D ID_AA64DFR0_EL1_BRBE_BRBE_V1P=
1;
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +static __always_inline bool cpu_has_brbe(void)
> >>>>>>
> >>>>>> This should be more like cpu_valid_brbe_version(). has_brbe() only
> >>>>>> implies that the CPU has BRBE, not that it's a version that the dr=
iver
> >>>>>> supports. And it's actually just a wrapper around valid_brbe_versi=
on()
> >>>>>> that accesses the ID reg on that CPU, not a functionally different=
 check.
> >>>>>>
> >>>>>> But it also looks like valid_brbe_version() isn't called from anyw=
here
> >>>>>> else, so why not delete that function and use its name for the new=
 one?
> >>>>>
> >>>>> I will do that in next version
> >>>>>
> >>>>>>
> >>>>>>> +{
> >>>>>>> +     u64 aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> >>>>>>> +     int brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0,=
 ID_AA64DFR0_EL1_BRBE_SHIFT);
> >>>>>>> +
> >>>>>>> +     return valid_brbe_version(brbe);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>>      static void select_brbe_bank(int bank)
> >>>>>>>      {
> >>>>>>>          u64 brbfcr;
> >>>>>>> @@ -271,6 +280,20 @@ static void select_brbe_bank(int bank)
> >>>>>>>          isb();
> >>>>>>>      }
> >>>>>>>
> >>>>>>> +static inline void __brbe_advance(int *bank, int *idx, int nr_hw=
)
> >>>>>>> +{
> >>>>>>> +     if (++(*idx) >=3D BRBE_BANK_MAX_ENTRIES &&
> >>>>>>> +         *bank * BRBE_BANK_MAX_ENTRIES + *idx < nr_hw) {
> >>>>>>> +             *idx =3D 0;
> >>>>>>> +             select_brbe_bank(++(*bank));
> >>>>>>> +     }
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +#define for_each_brbe_entry(idx, nr_hw)                         =
             \
> >>>>>>> +     for (int __bank =3D (select_brbe_bank(0), 0), idx =3D 0;   =
         \
> >>>>>>> +          __bank * BRBE_BANK_MAX_ENTRIES + idx < (nr_hw);       =
     \
> >>>>>>> +          __brbe_advance(&__bank, &idx, (nr_hw)))
> >>>>>>> +
> >>>>>>>      static bool __read_brbe_regset(struct brbe_regset *entry, in=
t idx)
> >>>>>>>      {
> >>>>>>>          entry->brbinf =3D get_brbinf_reg(idx);
> >>>>>>> @@ -474,11 +497,9 @@ unsigned int brbe_num_branch_records(const s=
truct arm_pmu *armpmu)
> >>>>>>>
> >>>>>>>      void brbe_probe(struct arm_pmu *armpmu)
> >>>>>>>      {
> >>>>>>> -     u64 brbidr, aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1)=
;
> >>>>>>> -     u32 brbe;
> >>>>>>> +     u64 brbidr;
> >>>>>>>
> >>>>>>> -     brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0, ID_=
AA64DFR0_EL1_BRBE_SHIFT);
> >>>>>>> -     if (!valid_brbe_version(brbe))
> >>>>>>> +     if (!cpu_has_brbe())
> >>>>>>>                  return;
> >>>>>>>
> >>>>>>>          brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> >>>>>>> @@ -618,10 +639,10 @@ static bool perf_entry_from_brbe_regset(int=
 index, struct perf_branch_entry *ent
> >>>>>>>
> >>>>>>>          brbe_set_perf_entry_type(entry, brbinf);
> >>>>>>>
> >>>>>>> -     if (!branch_sample_no_cycles(event))
> >>>>>>> +     if (!event || !branch_sample_no_cycles(event))
> >>>>>>>                  entry->cycles =3D brbinf_get_cycles(brbinf);
> >>>>>>>
> >>>>>>> -     if (!branch_sample_no_flags(event)) {
> >>>>>>> +     if (!event || !branch_sample_no_flags(event)) {
> >>>>>>>                  /* Mispredict info is available for source only =
and complete branch records. */
> >>>>>>>                  if (!brbe_record_is_target_only(brbinf)) {
> >>>>>>>                          entry->mispred =3D brbinf_get_mispredict=
(brbinf);
> >>>>>>> @@ -774,32 +795,97 @@ void brbe_read_filtered_entries(struct perf=
_branch_stack *branch_stack,
> >>>>>>>      {
> >>>>>>>          struct arm_pmu *cpu_pmu =3D to_arm_pmu(event->pmu);
> >>>>>>>          int nr_hw =3D brbe_num_branch_records(cpu_pmu);
> >>>>>>> -     int nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES)=
;
> >>>>>>>          int nr_filtered =3D 0;
> >>>>>>>          u64 branch_sample_type =3D event->attr.branch_sample_typ=
e;
> >>>>>>>          DECLARE_BITMAP(event_type_mask, PERF_BR_ARM64_MAX);
> >>>>>>>
> >>>>>>>          prepare_event_branch_type_mask(branch_sample_type, event=
_type_mask);
> >>>>>>>
> >>>>>>> -     for (int bank =3D 0; bank < nr_banks; bank++) {
> >>>>>>> -             int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_=
ENTRIES);
> >>>>>>> -             int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MA=
X_ENTRIES);
> >>>>>>> +     for_each_brbe_entry(i, nr_hw) {
> >>>>>>> +             struct perf_branch_entry *pbe =3D &branch_stack->en=
tries[nr_filtered];
> >>>>>>>
> >>>>>>> -             select_brbe_bank(bank);
> >>>>>>> +             if (!perf_entry_from_brbe_regset(i, pbe, event))
> >>>>>>> +                     break;
> >>>>>>>
> >>>>>>> -             for (int i =3D 0; i < nr_this_bank; i++) {
> >>>>>>> -                     struct perf_branch_entry *pbe =3D &branch_s=
tack->entries[nr_filtered];
> >>>>>>> +             if (!filter_branch_record(pbe, branch_sample_type, =
event_type_mask))
> >>>>>>> +                     continue;
> >>>>>>>
> >>>>>>> -                     if (!perf_entry_from_brbe_regset(i, pbe, ev=
ent))
> >>>>>>> -                             goto done;
> >>>>>>> +             nr_filtered++;
> >>>>>>> +     }
> >>>>>>>
> >>>>>>> -                     if (!filter_branch_record(pbe, branch_sampl=
e_type, event_type_mask))
> >>>>>>> -                             continue;
> >>>>>>> +     branch_stack->nr =3D nr_filtered;
> >>>>>>> +}
> >>>>>>>
> >>>>>>> -                     nr_filtered++;
> >>>>>>> -             }
> >>>>>>> +/*
> >>>>>>> + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoi=
d
> >>>>>>> + * self-recording and return 0 if the snapshot state appears dis=
turbed.
> >>>>>>> + */
> >>>>>>> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *ent=
ries, unsigned int cnt)
> >>>>>>> +{
> >>>>>>> +     unsigned long flags;
> >>>>>>> +     int nr_hw, nr_copied =3D 0;
> >>>>>>> +     u64 brbfcr, brbcr;
> >>>>>>> +
> >>>>>>> +     if (!cnt)
> >>>>>>> +             return 0;
> >>>>>>
> >>>>>> If you're trying to avoid branches before pausing BRBE, can't you =
check
> >>>>>> this after the pause?
> >>>>>
> >>>>> will drop this in the next version and this is just an optimization=
.
> >>>>>
> >>>>>>
> >>>>>>> +
> >>>>>>> +     /* Guard against running on a CPU without BRBE (e.g. big.LI=
TTLE). */
> >>>>>>> +     if (!cpu_has_brbe())
> >>>>>>> +             return 0;
> >>>>>>> +
> >>>>>>> +     /*
> >>>>>>> +      * Pause BRBE first to avoid recording our own branches. Th=
e
> >>>>>>> +      * sysreg read/write and ISB are branchless, so pausing bef=
ore
> >>>>>>> +      * checking BRBCR avoids polluting the buffer with our own
> >>>>>>> +      * conditional branches.
> >>>>>>> +      */
> >>>>>>> +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>>>>> +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>>>>> +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >>>>>>
> >>>>>> Can this work without first disabling interrupts? Sashiko pointed =
it
> >>>>>> out, but I think it's correct. If you read an active state into br=
bfcr,
> >>>>>> then the PMU event fires and disables BRBE, then you disable inter=
rupts,
> >>>>>> then you would restore an active state when it should be inactive.
> >>>>>> Surely the only way to do it properly is to disable interrupts bef=
ore
> >>>>>> touching anything at all, if the PMU handler is also touching the =
same
> >>>>>> registers?
> >>>>>>
> >>>>>> If you want to avoid trace_hardirqs_off() can you make a new
> >>>>>> raw_local_daif_save() that disables interrupts and then call
> >>>>>> trace_hardirqs_off() yourself after pausing BRBE? Or not call
> >>>>>> trace_hardirqs_off() at all? There is a comment mentioning somethi=
ng
> >>>>>> like that in arch/arm64/kernel/suspend.c.
> >>>>>
> >>>>> Yes. I'll add raw_local_daif_save()/raw_local_daif_restore() and ma=
sk before
> >>>>> touching any BRBE register, which fixes the stale restore. trace_ha=
rdirqs_off()
> >>>>> then moves below the pause so lockdep still sees a balanced off/on =
pair while
> >>>>> its branches land in an already paused buffer.
> >>>>>
> >>>>>>
> >>>>>> Also, disabling interrupts doesn't stop the PMU event from overflo=
wing
> >>>>>> and changing the state of PAUSED either. I think this is another p=
ath
> >>>>>> that leads to you restoring the wrong state, so don't you also nee=
d to
> >>>>>> disable the PMU?
> >>>>>
> >>>>> Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a fr=
eeze needs
> >>>>> BRBE to not already be paused (RNXCWF). So once we have paused, not=
hing changes
> >>>>> underneath us and the PMU does not need disabling. It would not hel=
p anyway:
> >>>>> armv8pmu_stop() calls brbe_disable(), which zeroes BRBCR_EL1 and di=
scards the
> >>>>> records we came to read.
> >>>>
> >>>> That does mean you throw away real freeze events while paused though=
, in
> >>>> addition to the brbe_invalidate() you need to avoid non contiguous
> >>>> buffers. So it takes branches away from PMU events.
> >>>
> >>> RBHYTD gives a freeze two effects: PAUSED is set, and BRBTS_EL1 captu=
res a
> >>> timestamp. Recording has already stopped because we paused, and the d=
river never
> >>> reads BRBTS_EL1. On the way out we check PMOVSCLR_EL0 and leave PAUSE=
D set if a
> >>> counter overflowed, so a pending overflow handler still finds a froze=
n buffer.
> >>>
> >>>> So it takes branches away from PMU events.
> >>>
> >>> Yes, but that is brbe_invalidate(), not the pause. Interrupts are mas=
ked and
> >>> nothing else runs on the CPU, so the only branches the pause suppress=
es are the
> >>> snapshot's own.
> >>>
> >>>>>
> >>>>> You are right that a freeze can still land in the window between re=
ading BRBFCR
> >>>>> and setting PAUSED, and restoring the value we read would then clea=
r a PAUSED
> >>>>> bit the hardware set. So v6 checks PMOVSCLR_EL0 and leaves BRBE pau=
sed if a
> >>>>> counter has overflowed. Reads of PMOVSCLR are non-destructive and i=
t stays set
> >>>>> until the overflow handler clears it, so it is still visible after =
we have set
> >>>>> PAUSED ourselves:
> >>>>>
> >>>>>            if (!valid_brbe_version())
> >>>>>                    return 0;
> >>>>>
> >>>>>            flags =3D raw_local_daif_save();
> >>>>>
> >>>>>            brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>>>            brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>>>
> >>>>>            write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL=
1);
> >>>>>            isb();
> >>>>>
> >>>>>            trace_hardirqs_off();
> >>>>>
> >>>>>            /* BRBCR_EL1 is zero while the driver has BRBE disabled.=
 */
> >>>>>            if (!brbcr)
> >>>>>                    goto restore;
> >>>>>
> >>>>>            ... read the records ...
> >>>>>
> >>>>
> >>>> Up to the point where you read the records you technically don't nee=
d
> >>>> any branches (if you don't do trace_hardirqs_off()) so you could do =
the
> >>>> whole thing without pausing. Just disable interrupts, read every bra=
nch
> >>>> entry unconditionally, re-enable interrupts and then find the last v=
alid
> >>>> entry and do the branchy stuff after reading.
> >>>>
> >>>> I'm thinking out loud, but doesn't that make it a lot easier? And it
> >>>> avoids the brbe_invalidate() which takes the branches away from the =
PMU
> >>>> event. It also avoids having to think too hard about racing with PMU
> >>>> events causing a freeze even after interrupts are disabled and after
> >>>> reading the freeze value:
> >>>>
> >>>>      raw_local_daif_save();
> >>>>      brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>>      brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>>      select_bank(0);
> >>>>      read_record(0);
> >>>>      read_record(1);
> >>>>      ...
> >>>>      select_bank(0);
> >>>>      read_record(0);
> >>>>      read_record(1);
> >>>>      ...
> >>>>      write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >>>>      isb();
> >>>>      local_daif_restore();
> >>>>
> >>>>      /* Now do post processing, find last valid record, check if it =
was
> >>>> enabled by looking at brbcr etc. */
> >>>
> >>> MRS is not a branch, so that works, but three things would have to ch=
ange:
> >>>
> >>> 1. perf_entry_from_brbe_regset() goes through BRBE_REGN_SWITCH, a 32 =
case
> >>>      switch, because the register number has to be an immediate. gcc =
emits a jump
> >>>      table and the function has 52 branches in the object file. The r=
ead would
> >>>      need full unrolling.
> >>>
> >>
> >> Yes you would have to manually unroll it. I doubt the compiler would
> >> emit a branch for BRBE_REGN_SWITCH() because your indexes are static i=
f
> >> it's unrolled. But if it does you can change it to a sequence of
> >> read_sysreg_s()s.
> >>
> >> If you really want to be sure there are no branches, write it in a
> >> single asm block.
> >
> > I will try that approach in the next version.
> >
> >>> 2. RPGDLX needs an ISB before the reads, and Table D19-10 makes it
> >>>      IMPLEMENTATION DEFINED whether ISB itself generates a record. Wh=
en we pause,
> >>>      IZCHRF means the pausing ISB cannot pollute the buffer it is abo=
ut to read.
> >>>
> >>
> >> I assume one potential extra record from the isb() is acceptible seein=
g
> >> as you already have two or more conditions plus a function call before
> >> the pause? Is the problem that you don't know whether to filter it out
> >> later because it's IMPDEF and isn't always there? You already don't kn=
ow
> >> exactly how many branches there will be before the pause beause it's
> >> written in C. So I'm not sure what the exact issue here is.
> >>
> >>> 3. 64 record parts still need a bank switch, so BRBFCR_EL1 still has =
to be
> >>>      written and restored.
> >>>
> >>
> >> Yes that was included in my pseudo code example but it's still
> >> branchless. I did miss that you might need an isb() after disabling
> >> interrupts, but you added one for RPGDLX anyway.
> >>
> >>> Correctness would then depend on the read staying branchless, which i=
s not
> >>> checkable at build time and fails silently: a branch mid read shifts =
the buffer,
> >>
> >> Why would the compiler insert a branch between two read_sysreg_s()s,
> >> which are asm volatile? Is that allowed?
> >
> > You are right, I just over complicated it!
> >
> >>> giving a duplicate and a gap. 64 * 24 bytes of records also wants a p=
er-CPU
> >>> scratch buffer rather than the stack.
> >>>
> >>
> >> A per-CPU scratch buffer doesn't sound too bad. But aren't you in
> >> control of how many entries are available to write to? You can reject
> >> any calls that have fewer than 64 and always write directly to *entrie=
s.
> >>
> >> You could also compare with 'cnt' after reading each record and exit t=
he
> >> read section. Like you say below, branches not taken don't generate
> >> records, and once the branch is taken you stop reading so after that
> >> point generating records doesn't matter.
> >>
> >>> Happy to prototype it. What I would not do is pause without invalidat=
ing:
> >>> records are from/to pairs, so a consumer walking across the hole reco=
nstructs a
> >>> call path that never happened. The invalidate was Mark's request afte=
r the RFC,
> >>> "to maintain record contiguity for other consumers", so dropping the =
pause drops
> >>> that too.
> >>
> >> Well the point was to not have to pause at all, so there's no need to
> >> invalidate either. Even if you did add a pause, as long as there are n=
o
> >> branches between the pause and resume you don't need an invalidate
> >> because you didn't miss any branches.
> >>
> >>>
> >>> I was thinking of this for v6:
> >>>
> >>>           flags =3D raw_local_daif_save();
> >>>
> >>>           /* The BRBE sysregs below are UNDEFINED without this. */
> >>>           if (!valid_brbe_version()) {
> >>
> >> You don't need to disable interrupts to call this, it's a constant. Or
> >> is it to stop migration?
> >
> > It was to stop migration.
> >
>
> Ah ok, so V5 wasn't correct then.

Yes, It was buggy! I missed that one CPU could implement BRBE while
another doesn't

>
> Separately to this, I'm also not sure how this BPF call is invoked. Is
> it supposed to target a CPU, or an event or a process? How do you know
> you are getting the branches from the CPU that you want?

So, A BPF program can attach to a function's entry through ftrace or
kprobe and from there we call this helper to find out what branches
were taken to reach that function.
A BPF program runs on a CPU with migration always disabled, so it
knows which cpu it is getting the branches from. And It can also
filter for a process as it knows which process is called the BPF
program, let's say a process does a syscall and we attach a bpf
program to it as the example I gave with the retsnoop tool in the
cover letter's Usage model section. A BPF program can also attach to a
tracepoint, or even to a perf event and this BPF helper can be called
from any of those contexts, but the filtering based on cpu or pid or
anything else is done by the BPF program itself, this helper should
just return the raw branch records.

> >>
> >> V5 reads sysregs before disabling interrupts so I assume migration isn=
't
> >> an issue here.
> >>
> >>>                   raw_local_daif_restore(flags);
> >>>                   return 0;
> >>>           }
> >>>
> >>>           brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>>           brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>>
> >>>           write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >>>           isb();
> >>>
> >>>           /* BRBCR_EL1 is zero while the driver has BRBE disabled. */
> >>>           if (!brbcr) {
> >>>                   write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >>>                   isb();
> >>>                   raw_local_daif_restore(flags);
> >>>                   return 0;
> >>>           }
> >>>
> >>>           trace_hardirqs_off();
> >>>
> >>>           ... read the records ...
> >>>
> >>>           if (!(brbfcr & BRBFCR_EL1_PAUSED) &&
> >>>               !(read_pmovsclr() & (ARMV8_PMU_OVSR_P | ARMV8_PMU_OVSR_=
F)))
> >>>                   brbe_invalidate();
> >>>           else
> >>>                   brbfcr |=3D BRBFCR_EL1_PAUSED;
> >>>
> >>>           write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >>>           isb();
> >>>           local_daif_restore(flags);
> >>>
> >>> Exceptions are masked before anything is sampled, BRBCR_EL1 is only r=
ead and
> >>> never written, and BRBFCR_EL1 is written back from the value saved un=
der the
> >>> mask. cpu_has_brbe() is now valid_brbe_version().
> >>>
> >>> Neither conditional costs a record: valid_brbe_version() falls throug=
h when BRBE
> >>> is present (RBBNSZ, only taken branches are recorded), and the BRBCR_=
EL1 test is
> >>
> >> Isn't the compiler free to invert it and make the happy path a taken
> >> branch. I don't think any of that can be assumed without writing in
> >> assembly.
> >>
> >>> after the pause. It cannot move later because BRBFCR_EL1 is UNDEFINED=
 without
> >>> FEAT_BRBE.
> >>>
> >>> PMOVSCLR_EL0 is masked because PMCCNTR_EL0 is bit 31 and PMCR_EL0.N i=
s at most
> >>> 31, so the cycle counter is outside every range RNXCWF, RGXGWY, RPKTX=
Q and
> >>> RLDMVK name. Unmasked, a cycle counter overflow looked like a freeze.
> >>
> >> Sorry I didn't understand this bit. Can you elaborate?
> >>
> >>>
> >>> Do you think this version works?
> >>>
> >>> Thanks,
> >>> Puranjay
> >>
> >>
> >>   From your previous reply:
> >>
> >>     "Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a
> >>      freeze needs BRBE to not already be paused (RNXCWF). So once we h=
ave
> >>      paused, nothing changes underneath us and the PMU does not need
> >>      disabling."
> >>
> >> I'm still not 100% convinced this is correct. You read BRBFCR_EL1 and
> >> write PAUSED to it in separate instructions. The PMU can overflow and
> >> change the PAUSED state between those two instructions leading to
> >> restoration of the wrong value.
> >
> > I was checking if the overflow happened and leaving it paused in that c=
ase.
> >
>
> But couldn't it overflow after that check? I still think it's vulnerable
> to the same issue unless you disable the PMU completely.

yeah you are right, I missed that it can overflow after the check.

>
> >> Isn't this non pausing version way simpler to understand, and also has
> >> the benefit of not invalidating someone elses BRBE buffers. The only
> >> downside seems to be that it might have some assembly to make sure the
> >> if statements are always not taken branches rather than inverted, but
> >> personally I don't think that makes it any harder to understand than t=
he
> >> branchy pausing version in V5:
> >>
> >>     #define read_record(i)
> >>       if (i >=3D cnt)                                       \
> >>          goto out;                                        \
> >>       isb(); /* Ensure our own exit branch isn't read? */ \
> >>       entries[i].inf =3D read_brbe_inf(i)                   \
> >>       if (!inf)                                           \
> >>          goto out;                                        \
> >>       entries[i].src =3D read_brb_src(i)                    \
> >>       entries[i].dst =3D read_brb_dst(i)                    \
> >>
> >>     raw_local_daif_save();
> >>
> >>     /* disable counters to stop BRBFCR_EL1.PAUSE state changing */
> >>     pmcr =3D armv8pmu_pmcr_read();
> >>     armv8pmu_pmcr_write(pmcr & ~ARMV8_PMU_PMCR_E);
> >>     isb();
> >>
> >>     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> >>     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> >>
> >>     select_bank(0);
> >>     read_record(0);
> >>     read_record(1);
> >>     ...
> >>     select_bank(1);
> >>     read_record(32);
> >>     read_record(33);
> >>     ...
> >>
> >> out:
> >>     write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >>     isb();
> >>     armv8pmu_pmcr_write(pmcr);
> >>     raw_local_daif_restore();
> >>
> >>     /* Post process entries[n].inf etc into correct format */
> >
> > I will try out this approach and get back.
> >
> > Thanks,
> > Puranjay
>
> Nice, hope it can work.
>

