Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF674C55196
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1AIPF5SDT4J7PNUPtkxqesvFiiIPup4Fza0Vbizlw8=; b=neW9FuXZGDo64fpDt0DprIdHdz
	9/Uxi1geRMSAc9Jp//ATuyZtzlf4HCXq2+0UBdizxegkzeCxsndCH4/TCoo28CCKv2yZg/JF2vIMd
	cXtfcXqZM8a+WtKUr6d0oKO/LLjqamj680z65YFQYWgpu9hQXS9/6J1+hf9epVTmf8HRicMwR8mcX
	+ycMSQ+MK8PJFP7MRuf6T87Dms2v1vMzU0ircurVzko6EY6l4QGoZQjpeI5FUqpZ3CwKWNrCZiJvo
	F2H1WYHmCpTh11qLHteVb9F5rR+qvBjAHMxy0TOe1t8OPN6yhTkPOKfq0smTnoSKkczOUQGkAmZ7t
	VCEe0o4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxoK-00000000P4P-45dy;
	Mon, 03 Aug 2026 18:54:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxoI-00000000P43-0xtm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:54:51 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-6a0a4a8d251so4332894a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:54:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785783288; cv=none;
        d=google.com; s=arc-20260327;
        b=gQSC3pDnQPP0ugztEriTNKlH550G8pS0Gffr6IPlHQqLnXP54jqDE8/BKfvmO30NZm
         6lvQXhf3sM+rPjFt6nU5kB4FHwyVX5nLaxCZEAS2/URpyE4Lslkz6UyLNZT+n/JOqr7j
         cz9iMvd9JIcUwauKPoI8Pxsxd0licQXEd5nLM93whObHpt1E8AXJO8evg4s9bgSKX299
         CZ0ZXSR2VHyOyn9XVHBaanThUK6asyGW/+eqcXaUtUh/pJpP4EzqmCID52hHyeRpyUJ0
         xv12ucr7sIpLXWz2wt93+8Ld2wiBpG2RRzv4dCFVGdc7H98vvt9adkl/3yVfTA0ZR2nw
         HgJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x1AIPF5SDT4J7PNUPtkxqesvFiiIPup4Fza0Vbizlw8=;
        fh=Qxn4cnOi2wLElPymAopkMHewL7awPtk3Vmmj4AQzZmw=;
        b=eGSufZ2SUw5Lfho8ARczVhgmQ3fc+rQjS+zXnOScUf53FHS4urNl04k3Ant6n+nt41
         +eI1EEZFUVh0l/ExPap/MOLJcQig9OS6AxVJEq7x24fQ0KPM54q82TgWvjBmbGiiXGZu
         60mZqZ15G4Dfyie+gYsETaOTrzTg+c3mURmM3aQu1dtKxNwqlfI/wQ0BmHY5jnCumHyV
         7Q0iK09E3ItZUSCJCAxkP2lurq2Q5d8RVdofEq+T4Wshgnp0yXq52n/9TIZJlDhu3y82
         54KSJdFXCvpHalIZV86abF+q3KQiCNC8d/AVvcXTlr78emQ3+hTARO90u9I3JuVc8/jO
         sY1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785783288; x=1786388088; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1AIPF5SDT4J7PNUPtkxqesvFiiIPup4Fza0Vbizlw8=;
        b=gnKgM5MOmfZdQ9fYKbkSS8/0dYJyPFq2R9Htnca0m95Xs6YUxNHxr5BqIuB2h3C2H/
         j6/onEMJrYY1W3XIKhHgdQRYnwSKJRa5EcO6NM/KcowtyPOhTO0ZFTN55RhnDBwGwFU4
         BqkV3/kDfeLuZMDf3XRuikcnr96V443FH6vIc9mlh0MSAv+fKI6MLA11Vl952pgZaUYB
         3Nd6z59ZK3fflu5QZlFkzjSbfLAhB1RLphcAcCNglCHGQFG/VOGpLwJ+34DKlmOA/wAy
         ZBE0/RhRKxKWlD5OY/hY4dUgCcB/ZKvBH9Mhsa6mFlBTazOhYsXEqS1rzyBys/fb+LWz
         BfwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785783288; x=1786388088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1AIPF5SDT4J7PNUPtkxqesvFiiIPup4Fza0Vbizlw8=;
        b=ainyq6mvjJ+37Dqcmtzg+71LBAcwOMsufm8XfgPuK3B9iN9uoUIQfvWIm3ch6DFMWf
         1cNgDOskcNWtiCA4ha92NwO19h1iFcGNSSMhw60/IM54ut1RzaDbFwE024HEEsILtCFW
         Lj6Hrgj4hHls7iZZXhuy2Ybv2E6XmSXNAKPHCeMKRQdNjRAnl/vHUNV6HfRMFRO+njyY
         xXKGjkeHi5bgA9iDt2Ro0Y+xYQ5oJ19V6E6l/o90V0abZ0vNxt0nwKiz7qHjM8JC2UQF
         uYJ/DFgLF9YGk9QEwZnkVkfiqmW/iF5Whacw4fGyfNieZbbkh6U2u3T8XQI7VHix4DZ2
         W8cw==
X-Forwarded-Encrypted: i=1; AHgh+Rqjdx12Um5MjTKZllBfjHxD4XI+1rR/5+gqKIy0TLrkU5y3Ngof/mVGbdm7gOJAo7dGnfknTxtgMRNYmm1qtknD@lists.infradead.org
X-Gm-Message-State: AOJu0YzImhG/Ic+QQashXeIMm26KKYYM8R+lzlxwK6eIVxl2eLtbM5XN
	xLDjaH9u+DMPdMsZeZAo++8ykM0ohz6tiKK2ESnKlp+4tVZ87tcAoAIoJSqhFCaQNuTtcD58qaX
	+68M9h6tnKUvYVVPkvtrnH2t5y9LjfI0=
X-Gm-Gg: AR+sD13UkKkEjUDhJI3W2BhyGdd0QCawrE2iCtNzbCph/b4BAuLpcP23SLXQm1yyCLm
	60tLCnH+5j+UxV/RRSBltof871Y6R9xO5Lu0y5WI86Zmnz01TVwNOF/B+BWDBMhTi720UCTV8//
	X9Urj/RKEaFaI1a9d+p+NC6WVFcOaP/RZ4Gkbq3mc1jHClc9f/OWROwwM8858CQglCQnVcQkLXb
	c8u0BcP78slaIU3bRVKOvLdyk1ZwrilYso7t6M1KTh8FYz8Rt46OYpmeOT3pzRFT5IAbf4DgU+Y
	Y+VvELPytKxzGeGXLi5sb3OiglXqGq5DU1Dc1KvrA3pXjxZU94tQrMQg8JIw
X-Received: by 2002:a17:907:1c22:b0:c15:d4f8:dade with SMTP id
 a640c23a62f3a-c1fe7eebb0amr1012287766b.2.1785783287476; Mon, 03 Aug 2026
 11:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260616155716.2631508-1-puranjay@kernel.org> <20260616155716.2631508-4-puranjay@kernel.org>
 <8a24abbc-10bc-42bb-8fee-0a174d8f1751@linaro.org>
In-Reply-To: <8a24abbc-10bc-42bb-8fee-0a174d8f1751@linaro.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 3 Aug 2026 19:54:33 +0100
X-Gm-Features: AUfX_mwx8Ydt3A9LE8X-Qfww0uHrsaIvN1PiEerTcOucV_-waglDDq-7iwaK1XQ
Message-ID: <CANk7y0inRXCUKtuio3Cb03DvuNPq6yp1o+tsE8PZitrY0LaOPQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260803_115450_330335_95C2B613 
X-CRM114-Status: GOOD (  52.89  )
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

On Mon, Aug 3, 2026 at 12:07=E2=80=AFPM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 16/06/2026 16:57, Puranjay Mohan wrote:
> > Enable bpf_get_branch_snapshot() on ARM64 by implementing the
> > perf_snapshot_branch_stack static call for BRBE.
> >
> > BRBE is paused before masking exceptions to avoid branch buffer
> > pollution from trace_hardirqs_off(). Exceptions are then masked with
> > local_daif_save() to prevent PMU overflow pseudo-NMIs from interfering.
> > If an overflow between pause and DAIF save re-enables BRBE, the snapsho=
t
> > detects this via BRBFCR_EL1.PAUSED and bails out.
> >
> > Branch records are read using perf_entry_from_brbe_regset() with a NULL
> > event pointer to bypass event-specific filtering. The buffer is
> > invalidated after reading.
> >
> > Introduce a for_each_brbe_entry() iterator to deduplicate bank
> > iteration between brbe_read_filtered_entries() and the snapshot.
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   drivers/perf/arm_brbe.c  | 128 ++++++++++++++++++++++++++++++++------=
-
> >   drivers/perf/arm_brbe.h  |   9 +++
> >   drivers/perf/arm_pmuv3.c |   5 +-
> >   3 files changed, 120 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index effbdeacfcbb..a141ad7abcf2 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> > @@ -9,6 +9,7 @@
> >   #include <linux/types.h>
> >   #include <linux/bitmap.h>
> >   #include <linux/perf/arm_pmu.h>
> > +#include <asm/daifflags.h>
> >   #include "arm_brbe.h"
> >
> >   #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> > @@ -256,6 +257,14 @@ static bool valid_brbe_version(int brbe_version)
> >              brbe_version =3D=3D ID_AA64DFR0_EL1_BRBE_BRBE_V1P1;
> >   }
> >
> > +static __always_inline bool cpu_has_brbe(void)
>
> This should be more like cpu_valid_brbe_version(). has_brbe() only
> implies that the CPU has BRBE, not that it's a version that the driver
> supports. And it's actually just a wrapper around valid_brbe_version()
> that accesses the ID reg on that CPU, not a functionally different check.
>
> But it also looks like valid_brbe_version() isn't called from anywhere
> else, so why not delete that function and use its name for the new one?

I will do that in next version

>
> > +{
> > +     u64 aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> > +     int brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA=
64DFR0_EL1_BRBE_SHIFT);
> > +
> > +     return valid_brbe_version(brbe);
> > +}
> > +
> >   static void select_brbe_bank(int bank)
> >   {
> >       u64 brbfcr;
> > @@ -271,6 +280,20 @@ static void select_brbe_bank(int bank)
> >       isb();
> >   }
> >
> > +static inline void __brbe_advance(int *bank, int *idx, int nr_hw)
> > +{
> > +     if (++(*idx) >=3D BRBE_BANK_MAX_ENTRIES &&
> > +         *bank * BRBE_BANK_MAX_ENTRIES + *idx < nr_hw) {
> > +             *idx =3D 0;
> > +             select_brbe_bank(++(*bank));
> > +     }
> > +}
> > +
> > +#define for_each_brbe_entry(idx, nr_hw)                               =
       \
> > +     for (int __bank =3D (select_brbe_bank(0), 0), idx =3D 0;         =
   \
> > +          __bank * BRBE_BANK_MAX_ENTRIES + idx < (nr_hw);            \
> > +          __brbe_advance(&__bank, &idx, (nr_hw)))
> > +
> >   static bool __read_brbe_regset(struct brbe_regset *entry, int idx)
> >   {
> >       entry->brbinf =3D get_brbinf_reg(idx);
> > @@ -474,11 +497,9 @@ unsigned int brbe_num_branch_records(const struct =
arm_pmu *armpmu)
> >
> >   void brbe_probe(struct arm_pmu *armpmu)
> >   {
> > -     u64 brbidr, aa64dfr0 =3D read_sysreg_s(SYS_ID_AA64DFR0_EL1);
> > -     u32 brbe;
> > +     u64 brbidr;
> >
> > -     brbe =3D cpuid_feature_extract_unsigned_field(aa64dfr0, ID_AA64DF=
R0_EL1_BRBE_SHIFT);
> > -     if (!valid_brbe_version(brbe))
> > +     if (!cpu_has_brbe())
> >               return;
> >
> >       brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> > @@ -618,10 +639,10 @@ static bool perf_entry_from_brbe_regset(int index=
, struct perf_branch_entry *ent
> >
> >       brbe_set_perf_entry_type(entry, brbinf);
> >
> > -     if (!branch_sample_no_cycles(event))
> > +     if (!event || !branch_sample_no_cycles(event))
> >               entry->cycles =3D brbinf_get_cycles(brbinf);
> >
> > -     if (!branch_sample_no_flags(event)) {
> > +     if (!event || !branch_sample_no_flags(event)) {
> >               /* Mispredict info is available for source only and compl=
ete branch records. */
> >               if (!brbe_record_is_target_only(brbinf)) {
> >                       entry->mispred =3D brbinf_get_mispredict(brbinf);
> > @@ -774,32 +795,97 @@ void brbe_read_filtered_entries(struct perf_branc=
h_stack *branch_stack,
> >   {
> >       struct arm_pmu *cpu_pmu =3D to_arm_pmu(event->pmu);
> >       int nr_hw =3D brbe_num_branch_records(cpu_pmu);
> > -     int nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> >       int nr_filtered =3D 0;
> >       u64 branch_sample_type =3D event->attr.branch_sample_type;
> >       DECLARE_BITMAP(event_type_mask, PERF_BR_ARM64_MAX);
> >
> >       prepare_event_branch_type_mask(branch_sample_type, event_type_mas=
k);
> >
> > -     for (int bank =3D 0; bank < nr_banks; bank++) {
> > -             int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_ENTRIE=
S);
> > -             int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_ENTR=
IES);
> > +     for_each_brbe_entry(i, nr_hw) {
> > +             struct perf_branch_entry *pbe =3D &branch_stack->entries[=
nr_filtered];
> >
> > -             select_brbe_bank(bank);
> > +             if (!perf_entry_from_brbe_regset(i, pbe, event))
> > +                     break;
> >
> > -             for (int i =3D 0; i < nr_this_bank; i++) {
> > -                     struct perf_branch_entry *pbe =3D &branch_stack->=
entries[nr_filtered];
> > +             if (!filter_branch_record(pbe, branch_sample_type, event_=
type_mask))
> > +                     continue;
> >
> > -                     if (!perf_entry_from_brbe_regset(i, pbe, event))
> > -                             goto done;
> > +             nr_filtered++;
> > +     }
> >
> > -                     if (!filter_branch_record(pbe, branch_sample_type=
, event_type_mask))
> > -                             continue;
> > +     branch_stack->nr =3D nr_filtered;
> > +}
> >
> > -                     nr_filtered++;
> > -             }
> > +/*
> > + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> > + * self-recording and return 0 if the snapshot state appears disturbed=
.
> > + */
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +     unsigned long flags;
> > +     int nr_hw, nr_copied =3D 0;
> > +     u64 brbfcr, brbcr;
> > +
> > +     if (!cnt)
> > +             return 0;
>
> If you're trying to avoid branches before pausing BRBE, can't you check
> this after the pause?

will drop this in the next version and this is just an optimization.

>
> > +
> > +     /* Guard against running on a CPU without BRBE (e.g. big.LITTLE).=
 */
> > +     if (!cpu_has_brbe())
> > +             return 0;
> > +
> > +     /*
> > +      * Pause BRBE first to avoid recording our own branches. The
> > +      * sysreg read/write and ISB are branchless, so pausing before
> > +      * checking BRBCR avoids polluting the buffer with our own
> > +      * conditional branches.
> > +      */
> > +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> > +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
>
> Can this work without first disabling interrupts? Sashiko pointed it
> out, but I think it's correct. If you read an active state into brbfcr,
> then the PMU event fires and disables BRBE, then you disable interrupts,
> then you would restore an active state when it should be inactive.
> Surely the only way to do it properly is to disable interrupts before
> touching anything at all, if the PMU handler is also touching the same
> registers?
>
> If you want to avoid trace_hardirqs_off() can you make a new
> raw_local_daif_save() that disables interrupts and then call
> trace_hardirqs_off() yourself after pausing BRBE? Or not call
> trace_hardirqs_off() at all? There is a comment mentioning something
> like that in arch/arm64/kernel/suspend.c.

Yes. I'll add raw_local_daif_save()/raw_local_daif_restore() and mask befor=
e
touching any BRBE register, which fixes the stale restore. trace_hardirqs_o=
ff()
then moves below the pause so lockdep still sees a balanced off/on pair whi=
le
its branches land in an already paused buffer.

>
> Also, disabling interrupts doesn't stop the PMU event from overflowing
> and changing the state of PAUSED either. I think this is another path
> that leads to you restoring the wrong state, so don't you also need to
> disable the PMU?

Hardware only sets PAUSED on a BRBE freeze event (RBHYTD), and a freeze nee=
ds
BRBE to not already be paused (RNXCWF). So once we have paused, nothing cha=
nges
underneath us and the PMU does not need disabling. It would not help anyway=
:
armv8pmu_stop() calls brbe_disable(), which zeroes BRBCR_EL1 and discards t=
he
records we came to read.

You are right that a freeze can still land in the window between reading BR=
BFCR
and setting PAUSED, and restoring the value we read would then clear a PAUS=
ED
bit the hardware set. So v6 checks PMOVSCLR_EL0 and leaves BRBE paused if a
counter has overflowed. Reads of PMOVSCLR are non-destructive and it stays =
set
until the overflow handler clears it, so it is still visible after we have =
set
PAUSED ourselves:

        if (!valid_brbe_version())
                return 0;

        flags =3D raw_local_daif_save();

        brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
        brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);

        write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
        isb();

        trace_hardirqs_off();

        /* BRBCR_EL1 is zero while the driver has BRBE disabled. */
        if (!brbcr)
                goto restore;

        ... read the records ...

        if ((brbfcr & BRBFCR_EL1_PAUSED) || read_pmovsclr())
                brbfcr |=3D BRBFCR_EL1_PAUSED;
        else
                brbe_invalidate();
restore:
        write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
        isb();
        local_daif_restore(flags);

If BRBE stays paused the records are left alone, they belong to the pending
overflow handler. Otherwise recording resumes and the records either side o=
f
the pause are not contiguous (RPKZCF), so they are discarded.

What do you think about this?

Thanks,
Puranjay

