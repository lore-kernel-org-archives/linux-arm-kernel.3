Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C13B5F34C4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TWFfKp/TWghMUUA6IzgBnGVqi4hfkBllldqvNPSkdJ0=; b=zexG1yTesRvaN8nrQ4q3J19Z9C
	SUn9k2fsd+I+NUW9ePrNSQ0vUxIT/hK9MnxxH0BOS2OU8aEh4Wl685E3pzF8Vao2HrJpwXCAzxFTt
	QtQgz1m72GbK2wY3UGerOhI9lGjma/QxXAXLteJ0zZzesl3PjWQGgwo2NdsfTCJDb46w8VUW96EZc
	lTY47lUpzszmHqJ/BVTWPqShoiWW7VjLEzD3mJCObqzviZKKe05lS1EjJbWEQB9W05r4mEfdp05wH
	1ixMjnbjhCiT6Lidhew3FeyrJsPdDgT9n+bSJhDoxAhq27+Bbb3HDI/oT0hO5V3YFT7g05EU2q7/t
	AOW0nEQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCH8t-0000000FizG-1ClX;
	Mon, 13 Apr 2026 13:15:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCH8q-0000000Fixq-0t1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 13:15:53 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-671a2f4fd28so795195a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 06:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776086150; cv=none;
        d=google.com; s=arc-20240605;
        b=F9tPdN+LHRVm/sroDhZGLtdk1F/sofvCxlGCJuBtCL0bDahMvzQii/e8XJYrTcZhGo
         C9OASDYSbVe0YPC8DLyRtGwYflDCTPy7xSR+/cjtf7ZL2as9GA3uMxZp154zq0ogjB5/
         /mllcRjKtYUVpbJv04OD+SbIbOmAdoajSt/Iqpd4mg3V15z2IxTCKSUM9gug+Dx6+SAg
         QeMma9tN5PgA1cx7gXrnvzWsAL7HFKL6X1+ez3YUQOJgzKPU3Yf+lCMqCVge+JHQB4XS
         kZFzeI4ZtZqtxXIw29Yk2aluPoOLChL8ALn7Kd+vvdvMsDe+UwxqYYjmyqAUosO+d9xA
         ApFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TWFfKp/TWghMUUA6IzgBnGVqi4hfkBllldqvNPSkdJ0=;
        fh=4rgm8hXcnwGUSvolklIWCp4+VYn0KkaZvLE9N7/djHc=;
        b=SzdBo6VfuxcRpZEL60CJpf8MXi7yt8MnVjL3uxiJMGNm7Eek6TgRbe1C0JuleaMoV6
         41Shhf9EhAgICtFhcJKJIRmBMu2P7BkCXBCQAvHYa2BLqblzcm0A2w6L1GrKxAlumWYk
         qkgPGRuu24e4ThMPU/jwZunluI/9Tu4v7xdqC8HY12UQTdTFt3ck3NRaUJ1KH97lU5Oj
         XcrafsFeAZAfiJDOqRa2qy0tZLWV5USwOYJjktpp23wNPzs7Zi6um1W+nRHtCoLS6CkE
         ejC6qKEIK+fB7WCY7H/ZOpOhBZi/Lj5NAhOMjr/4AxmxryMHNHeKFmy0R0B6zn2KIbTS
         xl1Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776086150; x=1776690950; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWFfKp/TWghMUUA6IzgBnGVqi4hfkBllldqvNPSkdJ0=;
        b=KtRT5IzgAtCFmkcoZoCbA7NQGfcHPaxg4PVF91sRCjlsAD989vtoKaR0Wm0PxMeczv
         fYgWJ7YK0jdo2FnzwWukMnWJhDii9NuCFXQMH5w13/sYGqqNgBcBjRLUrt9JHmIDBt4D
         PnilkE3m3fzpFIj28G5J/xlX681gzd4ScszX1mYYJyLFwt0qjsKOP1/Kx/9FayLpXbYQ
         i/ZNrPb1i5dqO5MCHGW9AcnMp7yf2McVe5o88mFKIXwQqCvYa+BQ0eUlmRb4VKXbNlN6
         xxRxu2NG28oOyO5TVdeqURBysyVTtvB2/Ublog/4dA52A8eNk8oJS2n70GE5X7s9X/zg
         WEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776086150; x=1776690950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TWFfKp/TWghMUUA6IzgBnGVqi4hfkBllldqvNPSkdJ0=;
        b=VN5/34t9kPapXGjjN/xeGENbNbsOxXhOsJYWzAAxmuxkVpZXSjSbKehD2id4iyBsOh
         HsMIXKu2d9o9IlmycJGH0H65cG7m+exW12yg/icPBvdwcQJ0T666tlntbi7VBDyvq5Ee
         s53WltglKOIwt0uIHrFWhWcG6SfKYlgeEMEZtEhVkG1jULqORSqinad8lrIhQcqxS6QJ
         /lKeGAIXnNdSDGynFOP+DX1wm1sjML63gQNr18GZws2s28KUQgOA4s1mEz++btcx424j
         7/v1iKOLeBI8U5UTzvclI5h4H7Gjxkx/GFzETrVx5qYh8ix3Ri2sO2NnlOcLn1EPtB1r
         up2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1u8yVL9qkdxpohuluJ1Dyugc18im1c4Nmex22cgx03zISeOecPqr9X8HT3CZ3PtpNY9H7BnhA1sZfx+Bk2ggF@lists.infradead.org
X-Gm-Message-State: AOJu0YzCwWWVmagQSRq09oVoFLLzM1c6+FMgCGzMf3KnFdxxQGtjzwnH
	W8nDddVTU+IYcEaigBE82ceFGsvDiHcP/X27tVyPxKkHqBh99yg87s1Li2TFetg7UiIsHqeY/lN
	QxnZR35sdtOwhTsa7owKQrxCqsIJtGt8=
X-Gm-Gg: AeBDieuxS9fEeYMnv5wAjRV36TicsJyB+CpdpZKQeExNDOYD3VAWxULtoH1iw6bXmLI
	yi7p102eq3JapvYnkCiF+witTrrTf2fLkWKw9VbIh4hPCQ4qZoK4QNNA6ItkIzxI2DSP6XcMPTI
	9WjAy/D7+gMH9F+Kj/5GSJ/xqfJJwiCETDc4ww/sjPeX9SKhbMa57u4pLMh6uxbIvwdQVU2IG4o
	OVITY6ojKTWZoHXhOkOhWDCYuMtirmA7cleejsLqiwzy/OjRh9/knSUFMvFaV6W6EDcifulqQtl
	CIt2cUfroIk2+VX6KaZfHB4=
X-Received: by 2002:a17:907:3d51:b0:b9b:4519:7914 with SMTP id
 a640c23a62f3a-b9d729665efmr793693166b.33.1776086149384; Mon, 13 Apr 2026
 06:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260318171706.2840512-1-puranjay@kernel.org> <20260318171706.2840512-4-puranjay@kernel.org>
 <20260410192300.GA1050337-robh@kernel.org>
In-Reply-To: <20260410192300.GA1050337-robh@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 13 Apr 2026 14:15:36 +0100
X-Gm-Features: AQROBzCue1TP9mde88YkHmv2yOUt3MzeMPylxtPFcG41TotdWLOxWFNqGRjveP0
Message-ID: <CANk7y0h1m1ECB7ud2Sw0_PTRq3bPstSm_CGg=nwU8d4yruxdfw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: Rob Herring <robh@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_061552_309667_F362FA06 
X-CRM114-Status: GOOD (  49.58  )
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

On Fri, Apr 10, 2026 at 8:23=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Mar 18, 2026 at 10:16:57AM -0700, Puranjay Mohan wrote:
> > Enable the bpf_get_branch_snapshot() BPF helper on ARM64 by implementin=
g
> > the perf_snapshot_branch_stack static call for ARM's Branch Record Buff=
er
> > Extension (BRBE).
> >
> > The BPF helper bpf_get_branch_snapshot() allows BPF programs to capture
> > hardware branch records on-demand. This was previously only available o=
n
> > x86 (Intel LBR) but not on ARM64 despite BRBE being available since
> > ARMv9.
> >
> > BRBE is paused before disabling interrupts because local_irq_save() can
> > trigger trace_hardirqs_off() which performs stack walking and pollutes
> > the branch buffer. The sysreg read/write and ISB used to pause BRBE are
> > branchless, so pausing first avoids this pollution.
> >
> > All exceptions are masked after pausing BRBE using local_daif_save() to
> > prevent pseudo-NMI from PMU counter overflow from interfering with the
> > snapshot read. A PMU overflow arriving between the pause and
> > local_daif_save() can re-enable BRBE via the interrupt handler; the
> > snapshot detects this by re-checking BRBFCR_EL1.PAUSED and bailing out.
> >
> > Branch records are read using the existing perf_entry_from_brbe_regset(=
)
> > helper with a NULL event pointer, which bypasses event-specific filteri=
ng
> > and captures all recorded branches. The BPF program is responsible for
> > filtering entries based on its own criteria. The BRBE buffer is
> > invalidated after reading to maintain contiguity for other consumers.
> >
> > On heterogeneous big.LITTLE systems, only some CPUs may implement
> > FEAT_BRBE. The perf_snapshot_branch_stack static call is system-wide, s=
o
> > a per-CPU brbe_active flag is used to prevent BRBE sysreg access on CPU=
s
> > that do not implement FEAT_BRBE, where such access would be UNDEFINED.
>
> Is this something you've seen? IIRC, the existing assumption is all CPUs
> have FEAT_BRBE or that perf has been limited to those CPUs. It is
> allowed that the number of records can vary.

I just added it as a safeguard, but if you say that it is not
possible, I will remove this in the next version.

>
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >  drivers/perf/arm_brbe.c  | 79 +++++++++++++++++++++++++++++++++++++++-
> >  drivers/perf/arm_brbe.h  |  9 +++++
> >  drivers/perf/arm_pmuv3.c |  5 ++-
> >  3 files changed, 90 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index ba554e0c846c..527c2d5ebba6 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> > @@ -8,9 +8,13 @@
> >   */
> >  #include <linux/types.h>
> >  #include <linux/bitmap.h>
> > +#include <linux/percpu.h>
> >  #include <linux/perf/arm_pmu.h>
> > +#include <asm/daifflags.h>
> >  #include "arm_brbe.h"
> >
> > +static DEFINE_PER_CPU(bool, brbe_active);
> > +
> >  #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> >                                  BRBFCR_EL1_INDIRECT | \
> >                                  BRBFCR_EL1_RTN      | \
> > @@ -533,6 +537,8 @@ void brbe_enable(const struct arm_pmu *arm_pmu)
> >       /* Finally write SYS_BRBFCR_EL to unpause BRBE */
> >       write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> >       /* Synchronization in PMCR write ensures ordering WRT PMU enablin=
g */
> > +
> > +     this_cpu_write(brbe_active, true);
> >  }
> >
> >  void brbe_disable(void)
> > @@ -544,6 +550,7 @@ void brbe_disable(void)
> >        */
> >       write_sysreg_s(BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> >       write_sysreg_s(0, SYS_BRBCR_EL1);
> > +     this_cpu_write(brbe_active, false);
> >  }
> >
> >  static const int brbe_type_to_perf_type_map[BRBINFx_EL1_TYPE_DEBUG_EXI=
T + 1][2] =3D {
> > @@ -618,10 +625,10 @@ static bool perf_entry_from_brbe_regset(int index=
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
> > @@ -803,3 +810,71 @@ void brbe_read_filtered_entries(struct perf_branch=
_stack *branch_stack,
> >  done:
> >       branch_stack->nr =3D nr_filtered;
> >  }
> > +
> > +/*
> > + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> > + * self-recording and return 0 if the snapshot state appears disturbed=
.
> > + */
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +     unsigned long flags;
> > +     int nr_hw, nr_banks, nr_copied =3D 0;
> > +     u64 brbidr, brbfcr, brbcr;
> > +
> > +     if (!cnt || !__this_cpu_read(brbe_active))
> > +             return 0;
> > +
> > +     /* Pause BRBE first to avoid recording our own branches. */
> > +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> > +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> > +     isb();
>
> Is there something that guarantees BRBE is enabled when you enter this
> function and that it is not disabled in this window? A context switch
> could disable it unless it's a global event for example.

The user space program handling this BPF program should create a
system wide event in the expected use case. But you are right that it
is not guaranteed to be enabled, I will check and return early in that
case.

>
> > +
> > +     /* Block local exception delivery while reading the buffer. */
> > +     flags =3D local_daif_save();
> > +
> > +     /*
> > +      * A PMU overflow before local_daif_save() could have re-enabled
> > +      * BRBE, clearing the PAUSED bit. The overflow handler already
> > +      * restored BRBE to its correct state, so just bail out.
> > +      */
> > +     if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED)) {
> > +             local_daif_restore(flags);
> > +             return 0;
> > +     }
> > +
> > +     brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> > +     if (!valid_brbidr(brbidr))
>
> This is not possibly true if brbe_active is true. If BRBIDR is not
> valid, then we would have rejected any event requesting branch stack.

Will remove it in the next version.

>
> > +             goto out;
> > +
> > +     nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> > +     nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> > +
> > +     for (int bank =3D 0; bank < nr_banks; bank++) {
> > +             int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_ENTRIE=
S);
> > +             int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_ENTR=
IES);
> > +
> > +             select_brbe_bank(bank);
> > +
> > +             for (int i =3D 0; i < nr_this_bank; i++) {
>
> I don't love all this being duplicated. Perhaps an iterator would help
> here (and the other copy):
>
> static void next_slot(int *bank, int *bank_idx, int nr_hw)
> {
>         *bank_idx++;
>         if (*bank_idx + (*bank * BRBE_BANK_MAX_ENTRIES) =3D=3D nr_hw)
>                 bank =3D BRBE_MAX_BANKS;
>         else if ((*bank_idx % BRBE_BANK_MAX_ENTRIES) =3D=3D 0) {
>                 *bank_idx =3D 0;
>                 select_brbe_bank(++(*bank));
>         }
>
> }
>
> #define for_each_bank_slot(i, nr_hw) \
> for (int bank =3D 0, int i =3D 0; bank < BRBE_MAX_BANKS; next_slot(&bank,
> &i))
>
> Then here you just have:
>
> for_each_bank_slot(i, FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr)) {
>         ...
> }
>
> Feel free to come up with better naming. :)

Will add this to the next version, thanks

>
> > +                     if (nr_copied >=3D cnt)
> > +                             goto done;
> > +
> > +                     if (!perf_entry_from_brbe_regset(i, &entries[nr_c=
opied], NULL))
> > +                             goto done;
> > +
> > +                     nr_copied++;
> > +             }
> > +     }
> > +
> > +done:
> > +     brbe_invalidate();
> > +out:
> > +     /* Restore BRBCR before unpausing via BRBFCR, matching brbe_enabl=
e(). */
> > +     write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> > +     isb();
> > +     write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> > +     local_daif_restore(flags);
> > +
> > +     return nr_copied;
> > +}

