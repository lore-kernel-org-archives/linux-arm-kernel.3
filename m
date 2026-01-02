Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047D2FA3751
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dTenAvrqvobAuiOnSDe7zsX4M/71bvsOlNzXbEIzkOU=; b=0YYa7UajGppEMVjiroOABGSguG
	d0jfQ1ZjmQ6XooTRUrN5pcw17YVOcDX57asxbn48+uUtfNYNN6BGMlTlxJ6mgAmH6IPBqHquDL3hh
	qdRuTtsmT83F6oU9Ni+W2OVD4WRZKcSGIcCZxRhfq+SrgyqX5dgyps2meWw2HaD5gkhLe6vpaAI1K
	sSKJhZ8WtJHoYt/BWq1WJRRR7NW+WsfPb4WBWZSDz0qMbFRfmKryxlhoB1DPqptY/bPW2XssPiFNX
	K+0JOQ6LapPymRF8OA2WC+k0dUdQxik8vTylwSp6MCCHhjKTcOycvnQPP/PDu/i059oozj0//lgBV
	NYZVzsQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn3X-00000008jm6-2fiG;
	Fri, 02 Jan 2026 21:51:35 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbn3U-00000008jlj-0BJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 21:51:33 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b7ffbf4284dso1654865466b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 13:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767390690; x=1767995490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTenAvrqvobAuiOnSDe7zsX4M/71bvsOlNzXbEIzkOU=;
        b=KqEhPJ22ezKcSD+FffTQovE+B6OfRlOD/vLpqRgwDEb/V4bZKFPLFcbBYYOwmbH6k/
         eUN1GKKvrxGrPFE2lBJbqaagIWRLMVUPGV78VA4xJ8RrgC9sqgvCa8Al5HBRJbsfokIP
         hOVC62SHP7/zDhTJ0LlOOBShpF1juAinu+zx6RqZX6UIvZ8HVVz9m9xCj98T9jw9EdhU
         BXqNM0nq+JaZZJsBHuQbpvdiRaY9VgN2QeykJTGXsA9+awc2Of4x8PmYxQe4pEiP19ww
         Ctgcq9PGVR3vCG1h8Ma7YbRrBHD80dB046HCB5SljLsL8b8puVVpR6WFyDcIa9/mdW9o
         rnpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767390690; x=1767995490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dTenAvrqvobAuiOnSDe7zsX4M/71bvsOlNzXbEIzkOU=;
        b=DIAaUAbEgT9KFap8rClPJYLcqQmuKUNI/1lMvSwRytcZUGthQmhETX2YRz41QiZc6x
         zhJ3X7Zb8AdmZfqIQ/tUpq0AmXDQDpnkjV8TfAaIHUkEU5dL0zJmocjba0qBHScsCO0n
         q9P2znG7/0oVoOYJqqtaUESBVqpUqACfi4arT+DobKvpodKwWIi5XVS8awlHv85pUnpE
         HG+DZgTlr9CYzYKjtpDpkJKvcWMDGMOfqtp2r1iIJjeSZDAcM3GPGOpHRQtepoHRTrhe
         sqiVrZNIGmpVcDsyZ7xTP2f02+ToV6+5EiGssiivjzr6SNtjqjeo1sHk3PUQ0hcm60wb
         qP/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJQ9C9GwwKC7CaoK9MdmkLBYobvPM2Q0+ur7GZ8J/QS+ueHJ1q8d9K2irEZTvRmgI84YNoZW7+cvI6iBzeW+aC@lists.infradead.org
X-Gm-Message-State: AOJu0YyyydKxn/sAMPptPb5Td1Xgj0Gl8YJLUR1F7s6gM4NEPcP0cBHO
	utnpJp7NwhyVpxLtgeeC0vsMQQdRk0aSDgh4leF9TuRP7QYbfTH9+qECD18rQ1kJqQwozn4JAQk
	LoqJJDNv6vXRAu0SVOQnUhqMcjoKjWp0=
X-Gm-Gg: AY/fxX6c29UHsTciAYB7z3TrBypZI3hYngXCVVSZRouN46nXVaoXoyvfbOQ964WLG3e
	yi0+iV4gc4wovYJZOPIgC1eBW6EhJBgvJwlq28bpGQDtmNsvqKLvWodiR3Jx0EE2W2LCGp9JMep
	KBDQ643rjVZLWKIRDkDickWjmQmNTWluAvQdCfq04doqgnx47YbndHefLps5OHjcvjy0tUE/y5W
	1ndkLWfIdlH+B7xhH2gPivrNaHEJMmtOgehbJBfXxlTlKqP3E7QBvh3cj7XAWwwkjJ4B2aoSP0c
	ky+yVceBLg==
X-Google-Smtp-Source: AGHT+IGjZuqFXesd/PyiRzHysiotY9qzHDKLlbgVdwqG0k8JVSXWkfBUHAnebHZ354irsP07y4fQEuSwGXKhe1VKLAo=
X-Received: by 2002:a17:906:794e:b0:b5b:2c82:7dc6 with SMTP id
 a640c23a62f3a-b80371a71c3mr4567485566b.40.1767390689322; Fri, 02 Jan 2026
 13:51:29 -0800 (PST)
MIME-Version: 1.0
References: <20260102214043.1410242-1-puranjay@kernel.org>
In-Reply-To: <20260102214043.1410242-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 2 Jan 2026 21:51:15 +0000
X-Gm-Features: AQt7F2o2g8WMwL4DWvrJg3zxf8TCKOgBvkEBSVur3aBXGErVLgcQ2alRYtrUUTA
Message-ID: <CANk7y0j7hAJ7OcH_HgN0cVGnUh=iBz=iuD9sYZmSy-koMjB_cg@mail.gmail.com>
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Breno Leitao <leitao@debian.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_135132_161738_6CB4EF81 
X-CRM114-Status: GOOD (  33.41  )
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

Hi Catalin, Will, Mark, and Rob.

I don't have access to BRBE enabled hardware and Qemu doesn't support
this as well therefore I just sent the compile tested version.

Can you help me with testing this:

The relevant bpf self test is:

./test_progs -t get_branch_snapshot
#132     get_branch_snapshot:SKIP
Summary: 1/0 PASSED, 1 SKIPPED, 0 FAILED

skipped for my setup as it is not supported.

Thanks,
Puranjay

On Fri, Jan 2, 2026 at 9:41=E2=80=AFPM Puranjay Mohan <puranjay@kernel.org>=
 wrote:
>
> Enable the bpf_get_branch_snapshot() BPF helper on ARM64 by implementing
> the perf_snapshot_branch_stack static call for ARM's Branch Record
> Buffer Extension (BRBE).
>
> The BPF helper bpf_get_branch_snapshot() allows BPF programs to capture
> hardware branch records on-demand. This was previously only available on
> x86 (Intel LBR, AMD BRS) but not on ARM64 despite BRBE being available
> since ARMv9.
>
> This implementation:
>
> - Follows the x86 snapshot pattern (intel_pmu_snapshot_branch_stack)
> - Performs atomic snapshot by pausing BRBE, reading records, and
>   restoring previous state without disrupting ongoing perf events
> - Reads branch records directly from BRBE registers without
>   event-specific filtering to minimize branch pollution
> - Handles all BRBE record types (complete, source-only, target-only)
> - Complies with ARM ARM synchronization requirements (ISB barriers per
>   rule PPBZP)
> - Reuses existing BRBE infrastructure (select_brbe_bank,
>   __read_brbe_regset, brbe_set_perf_entry_type, etc.)
>
> Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> ---
>
> This patch is only compile tested as I don't have access to hardware with=
 BRBE.
>
> ---
>  drivers/perf/arm_brbe.c  | 95 ++++++++++++++++++++++++++++++++++++++++
>  drivers/perf/arm_brbe.h  |  9 ++++
>  drivers/perf/arm_pmuv3.c |  5 ++-
>  3 files changed, 108 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> index ba554e0c846c..cda7bf522c06 100644
> --- a/drivers/perf/arm_brbe.c
> +++ b/drivers/perf/arm_brbe.c
> @@ -803,3 +803,98 @@ void brbe_read_filtered_entries(struct perf_branch_s=
tack *branch_stack,
>  done:
>         branch_stack->nr =3D nr_filtered;
>  }
> +
> +/*
> + * ARM-specific callback invoked through perf_snapshot_branch_stack stat=
ic
> + * call, defined in include/linux/perf_event.h. See its definition for A=
PI
> + * details. It's up to caller to provide enough space in *entries* to fi=
t all
> + * branch records, otherwise returned result will be truncated to *cnt* =
entries.
> + *
> + * This is similar to brbe_read_filtered_entries but optimized for snaps=
hot mode:
> + * - No filtering based on event attributes (captures everything)
> + * - Minimal branches to avoid polluting the branch buffer
> + * - Direct register reads without event-specific processing
> + */
> +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, un=
signed int cnt)
> +{
> +       unsigned long flags;
> +       int nr_hw, nr_banks, nr_copied =3D 0;
> +       u64 brbidr, brbfcr, brbcr;
> +
> +       /*
> +        * The sequence of steps to freeze BRBE should be completely inli=
ned
> +        * and contain no branches to minimize contamination of branch sn=
apshot.
> +        */
> +       local_irq_save(flags);
> +
> +       /* Save current BRBE configuration */
> +       brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> +       brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> +
> +       /* Pause BRBE to freeze the buffer */
> +       write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> +       isb();
> +
> +       /* Read BRBIDR to determine number of records */
> +       brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> +       if (!valid_brbidr(brbidr))
> +               goto out_restore;
> +
> +       nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> +       nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> +
> +       /* Read branch records from BRBE banks */
> +       for (int bank =3D 0; bank < nr_banks; bank++) {
> +               int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_ENTRIE=
S);
> +               int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_ENTR=
IES);
> +
> +               select_brbe_bank(bank);
> +
> +               for (int i =3D 0; i < nr_this_bank; i++) {
> +                       struct brbe_regset bregs;
> +                       struct perf_branch_entry *entry;
> +
> +                       if (nr_copied >=3D cnt)
> +                               goto out_restore;
> +
> +                       if (!__read_brbe_regset(&bregs, i))
> +                               goto out_restore;
> +
> +                       entry =3D &entries[nr_copied];
> +                       perf_clear_branch_entry_bitfields(entry);
> +
> +                       /* Simple conversion without filtering */
> +                       if (brbe_record_is_complete(bregs.brbinf)) {
> +                               entry->from =3D bregs.brbsrc;
> +                               entry->to =3D bregs.brbtgt;
> +                       } else if (brbe_record_is_source_only(bregs.brbin=
f)) {
> +                               entry->from =3D bregs.brbsrc;
> +                               entry->to =3D 0;
> +                       } else if (brbe_record_is_target_only(bregs.brbin=
f)) {
> +                               entry->from =3D 0;
> +                               entry->to =3D bregs.brbtgt;
> +                       }
> +
> +                       brbe_set_perf_entry_type(entry, bregs.brbinf);
> +                       entry->cycles =3D brbinf_get_cycles(bregs.brbinf)=
;
> +
> +                       if (!brbe_record_is_target_only(bregs.brbinf)) {
> +                               entry->mispred =3D brbinf_get_mispredict(=
bregs.brbinf);
> +                               entry->predicted =3D !entry->mispred;
> +                       }
> +
> +                       if (!brbe_record_is_source_only(bregs.brbinf))
> +                               entry->priv =3D brbinf_get_perf_priv(breg=
s.brbinf);
> +
> +                       nr_copied++;
> +               }
> +       }
> +
> +out_restore:
> +       /* Restore BRBE to its previous state */
> +       write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> +       isb();
> +       write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> +       local_irq_restore(flags);
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
> index 8014ff766cff..1a9f129a0f94 100644
> --- a/drivers/perf/arm_pmuv3.c
> +++ b/drivers/perf/arm_pmuv3.c
> @@ -1449,8 +1449,11 @@ static int armv8_pmu_init(struct arm_pmu *cpu_pmu,=
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
>
> base-commit: c286e7e9d1f1f3d90ad11c37e896f582b02d19c4
> --
> 2.47.3
>

