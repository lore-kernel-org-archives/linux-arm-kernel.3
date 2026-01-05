Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947F3C79FBA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 19:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wKP8BXcQ6rjEgwWhGXyvSC3sJuSoh+CpPU6v8uC/NLU=; b=rV4mdnBk0fdrOfw2n7xA5DUraj
	275VB3Xw/eS/DMe5zaR/+I8ZINjSxPoOrtT7qff9YlR534bNf9NF0e5EstUf+Pf8mgxE8WOkMpnfV
	zM8QoOF6g44p9d05MS6HZ6gbks0T5qyZhNPN4Vi3zbIjBhkuMg0L/eIEfCeIkzdepyr7lfOmY5UVq
	C+HjCXF6JoBe7UQVpeasc8pG05uOh6vkk/MWO2LhVfvyVU3r7fgqwx2hWdktIDvLAqAFQtmJZUmq4
	ZNWPx+d9ZG47hoamVZ1/lz1UmPfCtvGWuff6qAOt1S1SfiVVIVV+MO48jHRCTetWY9RErJTkPHbXD
	fpA4iFKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqIl-0000000Byrp-1nRT;
	Mon, 05 Jan 2026 19:31:39 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcqIj-0000000ByrQ-0PKD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 19:31:38 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b725ead5800so43137266b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 11:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767641494; x=1768246294; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wKP8BXcQ6rjEgwWhGXyvSC3sJuSoh+CpPU6v8uC/NLU=;
        b=G7rqPf6XyCH0Xj//UE7h4TkjZhMr6zM3qFHPqBJFAH/m6j4sSEEAgJPXLSor5Y1GeI
         Lx4g3QmXzokRxKCyQ/ALjImqPBMnfKxuxQ1cMQaeFwlMSxgjeohJDpQAOlV6454rnqFZ
         07+NJB8fwos7fba0H4GVOUxzrL1cgsiq4yHs9jsL1urViTIC3lVAQFLoX7kIzsK7wRu2
         tFgdyddGsjMXuXaHA3BZ5jxXqhIHXMZEHvWpCrz8qTTRdFeUVrA9kWED0no1qWZDKq4Q
         ji82s7JjO6+xOhlwveMbwAsM13lWKHTdQ0Qiq9Pc8+LmPeq9zL91tZ6L7YkHdE6CEdEr
         /9pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767641494; x=1768246294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wKP8BXcQ6rjEgwWhGXyvSC3sJuSoh+CpPU6v8uC/NLU=;
        b=HPnRZVFXiBpuRccW0Iu0FDU9zZmjsSOOe/fYxPiw7Vkz0VMgGDk+zkohvD65ZF9Nc5
         6Kmm+nwkGsq6tyVdHxRv2MsxmuZu4mwg+l6Oc7D3SSO06/1BUPiYuJ59FE5ymT+13pe/
         2URWaOYnc64nnl4n+3UrTMMN0BWM36mQbcDYXy64F6NiB3VLZg+l74W5VjQ+A6olI7St
         t+IcHGcx9mMx7OyzLoRLGUFfAGBjiRdcgHWgxDq8n1D0YM52qsOGL2+tZumcXvzUkLN/
         /rVcw9PyIenJ83CydqNIjyYknVPkm40FRLQBTYHJ+fT2rKKP6WcstC3j5R1XDvCbQQjM
         rNiA==
X-Forwarded-Encrypted: i=1; AJvYcCX6iwchgVV8QdYJpjdq39VMHtmyP0DPdUrvR2gnQuOLM6YQHi6NlegmZ4mz9HJPHnH9gy+OSUuR6IKtLkYDx08G@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0HLbZM47ZuHmkgCORQj1GxANOlIrUCtq+HU/psQznMMiHgeD5
	9HaiYzgH1w/ZJNpiRRYELBNoVuTD8GfOzglhZoU4DRlrVvk3KRnBygKinI92B8eJOqRH+NWEOTU
	yG/0pqU+3CA2ihoNXrAUYA6LtK8rqgRk=
X-Gm-Gg: AY/fxX7Xoq/2mTq0++HGZXxZwMjbfcGm7Xy60TuFeNXHOFCsSL17bZtbeEfE2bvPAxI
	eDGwmQ+I2BBNvVUbJ/9LB5zaRykFMNv18cysmKFbiXawOpPggXHiaRMLM/xkoFBRvGm5IRqb4ZO
	0M5ZseQgj/hI8M0EVU3YjzL490tYeB0f+vDlr87Onoj99B0uDPjlGSkjg0E+whqwu/4qFyspoMW
	qVhWZ1TFjnCG/2GztdUJwLLdL68DY8krnXYyplAZfn0pLdZhI8g4abThZ04Tcb+sZugtxGT69YW
	24nydCs5A/0=
X-Google-Smtp-Source: AGHT+IHWXWcSL2ypRzwrXhZGRYXDxTuhkUPTtqeF8miccqaxHJcqkcxP/4yTCaxUzXMQIBg+77A8IP9i8mP3CXWFU2c=
X-Received: by 2002:a17:907:7288:b0:b76:eec9:a1a9 with SMTP id
 a640c23a62f3a-b8426a56bb3mr72786566b.7.1767641494141; Mon, 05 Jan 2026
 11:31:34 -0800 (PST)
MIME-Version: 1.0
References: <20260102214043.1410242-1-puranjay@kernel.org> <aVv5nq5QTVDOz1Zk@J2N7QTR9R3>
In-Reply-To: <aVv5nq5QTVDOz1Zk@J2N7QTR9R3>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Mon, 5 Jan 2026 19:31:19 +0000
X-Gm-Features: AQt7F2qGhDBs3pKZB2Wr69RbJg7A6Q93VsSbpiAu0Y3FJEpYrfWHO1XDHG-ebLE
Message-ID: <CANk7y0gthCiw5K-z-8sWsWF0ZcbmDgYuDHjE4RPLfHTjQk=4nw@mail.gmail.com>
Subject: Re: [RFC PATCH] perf/arm64: Add BRBE support for bpf_get_branch_snapshot()
To: Mark Rutland <mark.rutland@arm.com>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Rob Herring <robh@kernel.org>, 
	Breno Leitao <leitao@debian.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_113137_207739_EA8D4F2B 
X-CRM114-Status: GOOD (  51.19  )
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

On Mon, Jan 5, 2026 at 5:49=E2=80=AFPM Mark Rutland <mark.rutland@arm.com> =
wrote:
>
> Hi Puranjay,
>
> I have a number of techincal concerns with this, noted below. At a high
> level, I don't think this makes sense without a better description of
> the usage, and I suspect we'd need changes to bpf_get_branch_snapshot()
> to be able to implement something useful.

Hi Mark,

Thanks for your review.

>
> On Fri, Jan 02, 2026 at 01:40:41PM -0800, Puranjay Mohan wrote:
> > Enable the bpf_get_branch_snapshot() BPF helper on ARM64 by implementin=
g
> > the perf_snapshot_branch_stack static call for ARM's Branch Record
> > Buffer Extension (BRBE).
> >
> > The BPF helper bpf_get_branch_snapshot() allows BPF programs to capture
> > hardware branch records on-demand. This was previously only available o=
n
> > x86 (Intel LBR, AMD BRS) but not on ARM64 despite BRBE being available
> > since ARMv9.
>
> When exactly can bpf_get_branch_snapshot() be called?
>
> How is it expected to be used?
>
> The driver is written on the expectation that BRBE records are only read
> in the PMUv3 overflow handler.

bpf_get_branch_snapshot() can be called from any BPF tracing program
so from unknown context.

>
> > This implementation:
> >
> > - Follows the x86 snapshot pattern (intel_pmu_snapshot_branch_stack)
> > - Performs atomic snapshot by pausing BRBE, reading records, and
> >   restoring previous state without disrupting ongoing perf events
>
> If BRBE is stopped, then we lost contiguity of branch records (e.g. for
> a series of branches A->B->C->D->E, we could record A->B->D->E). The
> driver is intended to ensure contiguity of those records, and if that's
> lost, we deliberately discard. That's why brbe_enable() calls
> brbe_invalidate().
>
> Restarting BRBE without discarding will produce bogus data for other
> consumers. If BRBE is stopped, we *must* discard.
>
> > - Reads branch records directly from BRBE registers without
> >   event-specific filtering to minimize branch pollution
>
> If BRBE is paused, there's no polution, so this rationale doesn't make
> sense to me.
>
> BRBE can be configured with various filters (specific to the event),
> multiple events with distinct filters can be active simultaneously, and
> if no branch-sampling events are active, BRBE won't record anything. I
> do not think it makes sense to record whatever happens to be present,
> without filtering. Regardless, BRBE won't be recording if you don't have
> events. so this doesn't seem to make sense.

In the expected usage of this bpf helper, perf_events are expected to
be created with the correct filtering.

From 856c02dbce4f ("bpf: Introduce helper bpf_get_branch_snapshot")

    Introduce bpf_get_branch_snapshot(), which allows tracing program to ge=
t
    branch trace from hardware (e.g. Intel LBR). To use the feature, the
    user need to create perf_event with proper branch_record filtering
    on each cpu, and then calls bpf_get_branch_snapshot in the bpf function=
.
    On Intel CPUs, VLBR event (raw event 0x1b00) can be use for this.

>
> > - Handles all BRBE record types (complete, source-only, target-only)
> > - Complies with ARM ARM synchronization requirements (ISB barriers per
> >   rule PPBZP)
> > - Reuses existing BRBE infrastructure (select_brbe_bank,
> >   __read_brbe_regset, brbe_set_perf_entry_type, etc.)
>
> This duplicates other code (e.g. the body of
> brbe_read_filtered_entries()), and I don't think this is justified.

Ack.

>
> >
> > Signed-off-by: Puranjay Mohan <puranjay@kernel.org>
> > ---
> >
> > This patch is only compile tested as I don't have access to hardware wi=
th BRBE.
> >
> > ---
> >  drivers/perf/arm_brbe.c  | 95 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/perf/arm_brbe.h  |  9 ++++
> >  drivers/perf/arm_pmuv3.c |  5 ++-
> >  3 files changed, 108 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/perf/arm_brbe.c b/drivers/perf/arm_brbe.c
> > index ba554e0c846c..cda7bf522c06 100644
> > --- a/drivers/perf/arm_brbe.c
> > +++ b/drivers/perf/arm_brbe.c
> > @@ -803,3 +803,98 @@ void brbe_read_filtered_entries(struct perf_branch=
_stack *branch_stack,
> >  done:
> >       branch_stack->nr =3D nr_filtered;
> >  }
> > +
> > +/*
> > + * ARM-specific callback invoked through perf_snapshot_branch_stack st=
atic
> > + * call, defined in include/linux/perf_event.h. See its definition for=
 API
> > + * details. It's up to caller to provide enough space in *entries* to =
fit all
> > + * branch records, otherwise returned result will be truncated to *cnt=
* entries.
> > + *
> > + * This is similar to brbe_read_filtered_entries but optimized for sna=
pshot mode:
> > + * - No filtering based on event attributes (captures everything)
> > + * - Minimal branches to avoid polluting the branch buffer
> > + * - Direct register reads without event-specific processing
> > + */
>
> As above I don't think these differences are necessary nor do I think we
> should be duplicating this.

Ack.

>
> > +int arm_brbe_snapshot_branch_stack(struct perf_branch_entry *entries, =
unsigned int cnt)
> > +{
> > +     unsigned long flags;
> > +     int nr_hw, nr_banks, nr_copied =3D 0;
> > +     u64 brbidr, brbfcr, brbcr;
> > +
> > +     /*
> > +      * The sequence of steps to freeze BRBE should be completely inli=
ned
> > +      * and contain no branches to minimize contamination of branch sn=
apshot.
> > +      */
> > +     local_irq_save(flags);
>
> The PMU overflow interrupt can be delivered as a pNMI, so this can race
> with that. Disabling interrupts is not sufficient.

In that case this implementation is completely broken, Do you have
suggestions about how this should be implemented?
The use case is to find out how the execution reached a bpf program by
looking at the Branch records. Do you think BRBE can be used to fulfil
this?

>
> If this is only called within a perf event overflow handler, then we
> already have the necessary serialization.
>
> > +
> > +     /* Save current BRBE configuration */
> > +     brbfcr =3D read_sysreg_s(SYS_BRBFCR_EL1);
> > +     brbcr =3D read_sysreg_s(SYS_BRBCR_EL1);
> > +
> > +     /* Pause BRBE to freeze the buffer */
> > +     write_sysreg_s(brbfcr | BRBFCR_EL1_PAUSED, SYS_BRBFCR_EL1);
> > +     isb();
> > +
> > +     /* Read BRBIDR to determine number of records */
> > +     brbidr =3D read_sysreg_s(SYS_BRBIDR0_EL1);
> > +     if (!valid_brbidr(brbidr))
> > +             goto out_restore;
> > +
> > +     nr_hw =3D FIELD_GET(BRBIDR0_EL1_NUMREC_MASK, brbidr);
> > +     nr_banks =3D DIV_ROUND_UP(nr_hw, BRBE_BANK_MAX_ENTRIES);
> > +
> > +     /* Read branch records from BRBE banks */
> > +     for (int bank =3D 0; bank < nr_banks; bank++) {
> > +             int nr_remaining =3D nr_hw - (bank * BRBE_BANK_MAX_ENTRIE=
S);
> > +             int nr_this_bank =3D min(nr_remaining, BRBE_BANK_MAX_ENTR=
IES);
> > +
> > +             select_brbe_bank(bank);
> > +
> > +             for (int i =3D 0; i < nr_this_bank; i++) {
> > +                     struct brbe_regset bregs;
> > +                     struct perf_branch_entry *entry;
> > +
> > +                     if (nr_copied >=3D cnt)
> > +                             goto out_restore;
> > +
> > +                     if (!__read_brbe_regset(&bregs, i))
> > +                             goto out_restore;
> > +
> > +                     entry =3D &entries[nr_copied];
> > +                     perf_clear_branch_entry_bitfields(entry);
> > +
> > +                     /* Simple conversion without filtering */
> > +                     if (brbe_record_is_complete(bregs.brbinf)) {
> > +                             entry->from =3D bregs.brbsrc;
> > +                             entry->to =3D bregs.brbtgt;
> > +                     } else if (brbe_record_is_source_only(bregs.brbin=
f)) {
> > +                             entry->from =3D bregs.brbsrc;
> > +                             entry->to =3D 0;
> > +                     } else if (brbe_record_is_target_only(bregs.brbin=
f)) {
> > +                             entry->from =3D 0;
> > +                             entry->to =3D bregs.brbtgt;
> > +                     }
> > +
> > +                     brbe_set_perf_entry_type(entry, bregs.brbinf);
> > +                     entry->cycles =3D brbinf_get_cycles(bregs.brbinf)=
;
> > +
> > +                     if (!brbe_record_is_target_only(bregs.brbinf)) {
> > +                             entry->mispred =3D brbinf_get_mispredict(=
bregs.brbinf);
> > +                             entry->predicted =3D !entry->mispred;
> > +                     }
> > +
> > +                     if (!brbe_record_is_source_only(bregs.brbinf))
> > +                             entry->priv =3D brbinf_get_perf_priv(breg=
s.brbinf);
> > +
> > +                     nr_copied++;
> > +             }
> > +     }
> > +
> > +out_restore:
> > +     /* Restore BRBE to its previous state */
> > +     write_sysreg_s(brbcr, SYS_BRBCR_EL1);
> > +     isb();
> > +     write_sysreg_s(brbfcr, SYS_BRBFCR_EL1);
> > +     local_irq_restore(flags);
> > +     return nr_copied;
> > +}
>
> As above, this is duplicating a lot of logic we already have. If we
> really need this function, we should be sharing much more logic with
> brbe_read_filtered_entries(), if not using that directly.
>
> Mark.

