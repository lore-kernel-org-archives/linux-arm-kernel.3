Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653BB107BCD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Act0nsQpNOTwOEOVN8vznQnBkgNXARysghnHBxbiaY=; b=CoCnCrphUsU61NJReXGgH6s/Ku
	TB1k9m5InZJvns7/LDNGt/dyuI2sEfhAQoWK5d9LvZu+8UF1GVjQ13Dl6W0QlKPPz4KkuB7Gh2eUg
	AWkig6BUry+h9qd3Bs/OEEkITB9wj/PPDfgrHwArXoF2RUmNblXQ8pRQ/Q3CZ0j35T9q5f30INY5P
	+yNy7QiU3nVKnvKsx4wNqHV8J8+BtEjm11u7nvpFPFDG5IW2i7OBDIGXtibPwyWbfU9HoXlWcuJoS
	sox4XzAmJGjdk22HUz9t3hMt1S3gxK+ij8UdhtMbuvioiSue3P0mEehz8sb0q2ICoGWPcJE8J2pAH
	VQKO+ofA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18fY-0000000190m-0CK2;
	Fri, 13 Mar 2026 19:59:36 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w18fV-000000018z8-43dI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 19:59:35 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6631e0edcf1so3742801a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 12:59:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773431971; cv=none;
        d=google.com; s=arc-20240605;
        b=Lkk3Y6+d0qSVzkFXcNIofFZjiO+35FTuoro4zyk3DduWaQlOmxdVDGWmvEJV3J/mTW
         9P27rOVlWzdCHi4rKb9ilGNTGy2iGd9Qjw9wCKaanQC0Po1RA1rlRZFMywQANT4tYYP7
         X59A4oHfKdOE1SB8Fp41NcUGHpPdnzy8k6cDkMjhtgEcKT3/P7YF52xNZXzX3ImHh6Sl
         WW9NUw8GKqgLQZLtpI8GYYZw8cVgTeq67mJG46kRnQzIQ1cmBYnfByNB568/zbqxpQBH
         Q2orZCWF2AC7Ob6seb8LAurUcgY0ASVF+ha+zJhFk6TxQEIw4BaGcBAgElgulT7MWb4J
         9ySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Act0nsQpNOTwOEOVN8vznQnBkgNXARysghnHBxbiaY=;
        fh=gEhDmkUJlG/VYkZ7bu586llU1rY+JfbOi9yQ0LD8IjM=;
        b=XYIKOO7LveCWnK32eboEQFChqcE0Ah9aTv22qpLgCoB1SJIIZa3hbkw7q/i0E41tUV
         uilsxOl42gJRUqVUT8FgbMUAgFy/R0xn4toDKpQc3MIrDKwBdrk5e/iVkGh6/whj5U0K
         c6xbkUZzLSY4k+JI45HkTnOlLSRmSqBw26gGbzBVQOolrkdU/d1/bzko76+1zeFAdtDy
         XFEFNCtMWEk4lXKwYTj7lGh/+UJ7N55Ec6p2STP6FoYlBVhnPxlup45gasHRxorQ917q
         i6yhfh9eJpuiFNoIMrAzrXW06Ov20SuOPmDPDaxgxCMY9nJvB79vSlKojaYOhrzuARpp
         0hwQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773431971; x=1774036771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Act0nsQpNOTwOEOVN8vznQnBkgNXARysghnHBxbiaY=;
        b=RwcvfcvN3LJ/bCg2MQTYXBR1iGWZPBii5jhQPPx+by5zPshE/ujpo+id+coWH9gVnP
         X7CyWrC7AXfPQPREaF0sFOtpdNXJ0ytBomK5F3Z4K6YYA/91SZY7aEUFYZ0kJzm4bp/b
         JgnK048+XzCL7mB+NvjrTr82lkcAf1hEH//PdEpkYJj0Mn8ptxd6HYILvtoKjrxU078s
         R+EO9KJqeRnQOwjCny94pdNbSxW6A1vDRLWO9rwKQyF/9BOtADpeO13VScCY+uoxTfDc
         7NbG52WhXGByQEznIpeBdNqt+tlTKBmlg+9p8q4IjkhzkE17+dtBz778N9cX6mZhcwoG
         CJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773431971; x=1774036771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Act0nsQpNOTwOEOVN8vznQnBkgNXARysghnHBxbiaY=;
        b=JTWtqmcYojrVHU9+MAqoTWvqxqViodzs3a3NM9ZR89jjv6v2WOLmKLm/tWMBUcp3Cc
         S7bzIy4c3ml/ICiqOHD+067wb0L8vOpZ8CmizHYB0twhKOytoT/JAeeUSBe2bVUo+BpR
         LZcBW07G4jw2zEZDzct5/vud31KWpIesw3AHeE14YKLezia7TqGqz641UcYoS1tl7CFp
         7r8YJN9Jn37ifk4edEt6vdymrQQEbq5A4LERhmiCBk5NEKtVyE+Yuf/HfOwRuSJiSaAa
         5BMP9iRT4sB+ne39lqZDnEMplOIjlOLCeH9YvJ6ayNO2zPYrvVWAxp04Y1SVR2ewi1qQ
         J9TA==
X-Forwarded-Encrypted: i=1; AJvYcCUHrIRna3EfzoWmIBSGfB3HqgZXrl9fRSBJX2n8e/vDrpMLeZ/IQktcSp6Ic9V+bTfwq3PV3UrcpF3+YOW/Z76g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2ETwMj3lDVxuu5pMnoDQdAQLuqO0Q0DkLAuaP/D6ma3zTxyC5
	wxgzJ5yA2gm0CGJLuJcmCrBWXQ75qrassbWI3LXn7FW3JIM6BGpRmfebqM3djIUUDhPtJDuqvUg
	Xfq+ubX+NYEEANqGhvB++HcC2MbIq5HE=
X-Gm-Gg: ATEYQzylTqH0rOiApZeUHNfusSSj2kEh6d2XESQp7q2Kaq2B84bI0CitJ1TEQ5d1dfe
	i7w68zk9YNw5kf0XWysOau/yeUGkVHsZtySyZ13uDphX/2/k0fOCpN3hvc3sR5jP9XjrlA/g+VW
	ei35dgxuHDW1OIC9P2PNkWVa1+Hknkx6NaN8U8b0tzrIhumcUEgVv+ViLKVUSmLUSfsRVojP7x3
	HqXPiIjR9oNPYIytXeT6f4oR+12lQi/wPFvit6/U/DqiPBpcOQQl+TW0kdmc9FHyMNzakblfmBL
	X6/BU20PKKYNEbodIpZJcDFbKqNgdMs1v5pIxBLBjw==
X-Received: by 2002:a05:6402:254a:b0:663:8e2e:f0a1 with SMTP id
 4fb4d7f45d1cf-663bac038dbmr2432564a12.28.1773431970504; Fri, 13 Mar 2026
 12:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260313180352.3800358-1-puranjay@kernel.org> <20260313180352.3800358-3-puranjay@kernel.org>
In-Reply-To: <20260313180352.3800358-3-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 13 Mar 2026 19:59:18 +0000
X-Gm-Features: AaiRm51GikI9-zP9fY-3_TgKJfmb6uaUMWjbiaWm-fp3xLHqk8JTGxatmTS6nYg
Message-ID: <CANk7y0jjd6XC7nd2BxtsVhs8vWp_9cC-ckXPGRQK_CW5BSuogQ@mail.gmail.com>
Subject: Re: [PATCH bpf 2/3] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_125934_073616_9D29682C 
X-CRM114-Status: GOOD (  33.19  )
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

On Fri, Mar 13, 2026 at 6:04=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org=
> wrote:
>
> Implement the perf_snapshot_branch_stack static call for ARM's Branch
> Record Buffer Extension (BRBE), enabling the bpf_get_branch_snapshot()
> BPF helper on ARM64.
>
> This is a best-effort snapshot helper intended for tracing and debugging
> use. It favors non-invasive snapshotting over strong serialization, and
> returns 0 whenever a clean snapshot cannot be obtained. Nested
> invocations are not serialized; callers may observe a 0-length result
> when a clean snapshot cannot be preserved.
>
> BRBE is paused before the helper does any other work to avoid recording
> its own branches. The sysreg writes used to pause are branchless.
> local_daif_save() blocks local exception delivery while reading the
> buffer. If a PMU overflow raced before that point and re-enabled BRBE,
> the helper detects the cleared PAUSED state and returns 0.
>
> Branch records are read using perf_entry_from_brbe_regset() without
> event-specific filtering. The BPF program is responsible for applying
> its own filter criteria. The BRBE buffer is invalidated after reading
> to maintain contiguity for other consumers.
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>  drivers/perf/arm_brbe.c  | 70 ++++++++++++++++++++++++++++++++++++++--
>  drivers/perf/arm_brbe.h  |  9 ++++++
>  drivers/perf/arm_pmuv3.c |  5 ++-
>  3 files changed, 81 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..db5e000b2575 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -9,6 +9,7 @@
>  #include <linux/types.h>
>  #include <linux/bitmap.h>
>  #include <linux/perf/arm_pmu.h>
> +#include <asm/daifflags.h>
>  #include "arm_brbe.h"
>
>  #define BRBFCR_EL1_BRANCH_FILTERS (BRBFCR_EL1_DIRECT   | \
> @@ -618,10 +619,10 @@ static bool perf_entry_from_brbe_regset(int index, =
struct perf_branch_entry *ent
>
>         brbe_set_perf_entry_type(entry, brbinf);
>
> -       if (!branch_sample_no_cycles(event))
> +       if (!event || !branch_sample_no_cycles(event))
>                 entry->cycles =3D brbinf_get_cycles(brbinf);
>
> -       if (!branch_sample_no_flags(event)) {
> +       if (!event || !branch_sample_no_flags(event)) {
>                 /* Mispredict info is available for source only and compl=
ete branch records. */
>                 if (!brbe_record_is_target_only(brbinf)) {
>                         entry->mispred =3D brbinf_get_mispredict(brbinf);
> @@ -803,3 +804,68 @@ void brbe_read_filtered_entries(struct perf_branch_s=
tack *branch_stack,
>  done:
>         branch_stack->nr =3D nr_filtered;
>  }
> +
> +/*
> + * Best-effort BRBE snapshot for BPF tracing. Pause BRBE to avoid
> + * self-recording and return 0 if the snapshot state appears disturbed.
> + */
> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, un=
signed int cnt)
> +{
> +       unsigned long flags;
> +       int nr_hw, nr_banks, nr_copied =3D 0;
> +       u64 brbidr, brbfcr, brbcr;
> +
> +       if (!cnt)
> +               return 0;
> +
> +       /* Pause BRBE first to avoid recording our own branches. */
> +       brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> +       brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> +       write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> +       isb();
> +
> +       /* Block local exception delivery while reading the buffer. */
> +       flags =3D local_daif_save();
> +
> +       /*
> +        * A PMU overflow before local_daif_save() could have re-enabled
> +        * BRBE, clearing the PAUSED bit. Bail out.
> +        */
> +       if (!(read_sysreg_s(SYS_BRBFCR_EL1) & BRBFCR_EL1_PAUSED))
> +               goto out;
> +

The code below doesn't implement filtering, I am currently trying to
figure out the best way to implement that by reusing
read_branch_records() somehow.

> +       brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> +       if (!valid_brbidr(brbidr))
> +               goto out;
> +
> +       nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> +       nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> +
> +       for (int bank =3D 0; bank < nr_banks; bank++) {
> +               int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_ENTRIE=
S);
> +               int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_ENTR=
IES);
> +
> +               select_brbe_bank(bank);
> +
> +               for (int i =3D 0; i < nr_this_bank; i++) {
> +                       if (nr_copied >=3D cnt)
> +                               goto done;
> +
> +                       if (!perf_entry_from_brbe_regset(i, &entries[nr_c=
opied], NULL))
> +                               goto done;
> +
> +                       nr_copied++;
> +               }
> +       }
> +
> +done:
> +       brbe_invalidate();
> +out:
> +       /* Restore BRBCR before unpausing via BRBFCR, matching brbe_enabl=
e(). */
> +       write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> +       isb();
> +       write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> +       local_daif_restore(flags);
> +
> +       return nr_copied;
> +}
> diff --git a/drivers/perf/arm_brbe.h b/drivers/perf/arm_brbe.h
> index b7c7d8796c86..c2a1824437fb 100644
> --- a/drivers/perf/arm_brbe.h
> +++ b/drivers/perf/arm_brbe.h
> @@ -10,6 +10,7 @@
>  struct arm_pmu;
>  struct perf_branch_stack;
>  struct perf_event;
> +struct perf_branch_entry;
>
>  #ifdef CONFIG_ARM64_BRBE
>  void brbe_probe(struct arm_pmu *arm_pmu);
> @@ -22,6 +23,8 @@ void brbe_disable(void);
>  bool brbe_branch_attr_valid(struct perf_event *event);
>  void brbe_read_filtered_entries(struct perf_branch_stack *branch_stack,
>                                 const struct perf_event *event);
> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries,
> +                                  unsigned int cnt);
>  #else
>  static inline void brbe_probe(struct arm_pmu *arm_pmu) { }
>  static inline unsigned int brbe_num_branch_records(const struct arm_pmu =
*armpmu)
> @@ -44,4 +47,10 @@ static void brbe_read_filtered_entries(struct perf_bra=
nch_stack *branch_stack,
>                                        const struct perf_event *event)
>  {
>  }
> +
> +static inline int arm_brbe_snapshot_branch_stack(struct perf_branch_entr=
y *entries,
> +                                                unsigned int cnt)
> +{
> +       return 0;
> +}
>  #endif
> diff --git a/drivers/perf/arm_pmuv3.c b/drivers/perf/arm_pmuv3.c
> index 2d097fad9c10..e00c7c47a98d 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1456,8 +1456,11 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu,=
 char *name,
>         cpu_pmu->set_event_filter       =3D armv8pmu_set_event_filter;
>
>         cpu_pmu->pmu.event_idx          =3D armv8pmu_user_event_idx;
> -       if (brbe_num_branch_records(cpu_pmu))
> +       if (brbe_num_branch_records(cpu_pmu)) {
>                 cpu_pmu->pmu.sched_task         =3D armv8pmu_sched_task;
> +               static_call_update(perf_snapshot_branch_stack,
> +                                  arm_brbe_snapshot_branch_stack);
> +       }
>
>         cpu_pmu->name                   =3D name;
>         cpu_pmu->map_event              =3D map_event;
> --
> 2.52.0
>

