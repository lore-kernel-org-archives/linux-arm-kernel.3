Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC72DC71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 15:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB8ezSjDnELyZ5ynpdOHrDYhHPMFlYMUKjOOWBV8uLc=; b=ywgzrXBQslIfejvxniOPBESCog
	BM+5UPl50Xk1ls04/vbkz4RkID2YXHB3RwRKvKhlhFUA+s7+rhwWFuIE15lpH1nKlOmWQ6/ZWhgNj
	T98GpYtyq3sYH36TA62MWZaZCFUsXPUJLcUvjiIP8eNHKqKlFAjTmCPj+6UTofw9HNBFqj/f0++t8
	Hs14ILVtK6hb0nwDatRfAGi/dQneDBecS5PzC8dWLmqPWlF9f4tdNord14JSa0lhHb8sfIBIjVRp4
	HwLBUcGJUwENk6s3nGAaibK3jHak6xvCzVuTMy+oe/vwz5GEXdp/QKoeNUM1+sc/AMCNE78q1rtx0
	0niT3VRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoFt-00000002wuy-3Z9g;
	Mon, 07 Jul 2025 15:59:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoDZ-00000002wSC-0r9t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 15:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2B31D5C5A5F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 15:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D092AC4CEF5
	for <linux-arm-kernel@lists.infradead.org>; Mon,  7 Jul 2025 15:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751903839;
	bh=cOPqcxIf5X1X2HD8wmgQa984+uwttfeDa/9MRlym0cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mknh5w67+oZcvYnxfTf5SObhpeuygcV7+wQz5THrA095mP+3YluTKI25/pX/5q7md
	 xuS3Dtw4Itai3fUbwgqBdG58BnqHNU+JrduGTPp4lf5eDfCaBb71WZbJJx6x4EzQPq
	 fbGVoqBexCC8dpSY+SNzDZGxYBOt1j4s1HA4iPykrdk+V6wW4npZqMi5vSaMuL2r0r
	 rDByPDjxeZ9xDGVOyexH93aEtOFtbal35NL0LYFZvnR/chJYTL4xdPCTldNi7Y9R3G
	 w2aGrnLdc/+FYZZzESNhltUKMTtiFQhGVn7Uak8e1zEIzblSNciqmosLm4sADWhFIF
	 tjgy7FxVeXzaA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae36e88a5daso686256466b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 08:57:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBFutAfJdStxSdxUjClmYChT95B5zy90tEHBlHtqTxVhNrDnRtDqSw9SnhFuwBJUXWxhCNzPVa89Txvd/6Zq1r@lists.infradead.org
X-Gm-Message-State: AOJu0YyhwL0R3Vqd9yaItMCJRIHQsTj0imSe5Kckx+30RN6SrytZ7RlP
	gc5YWi/nY2KB2b9WorNUaUgWwpZMsLDj58f8AeDj1NAFtsdhGSGocEsr0VBuieyi630scNDRZQj
	fyGxGw2fg/ajD/PE/Zkxz9aWgMSqSaw==
X-Google-Smtp-Source: AGHT+IGROcI/rOerYv7nZXlhWEmc4bo4VMMhzIieXt0ir3fuJoe5yHNFs/XUqQmhE3pqqxvZ92DyoWse/8P+jtjd2j0=
X-Received: by 2002:a17:906:6a08:b0:ae3:c6a3:f833 with SMTP id
 a640c23a62f3a-ae3fbcb576amr1339358466b.23.1751903838354; Mon, 07 Jul 2025
 08:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-arm-brbe-v19-v23-0-e7775563036e@kernel.org>
 <20250611-arm-brbe-v19-v23-4-e7775563036e@kernel.org> <aGgM4Pk5dU1LXd2I@J2N7QTR9R3>
In-Reply-To: <aGgM4Pk5dU1LXd2I@J2N7QTR9R3>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Jul 2025 10:57:06 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKPjQE99d27pBHffo=K6stT1QaaeVyeqSeRKa9m8OSmxw@mail.gmail.com>
X-Gm-Features: Ac12FXxiERhwrk8TwYBiCk2nTj5uV-39ekDgmaoI7v4X8_oFWq7oDAhMnIvdJ90
Message-ID: <CAL_JsqKPjQE99d27pBHffo=K6stT1QaaeVyeqSeRKa9m8OSmxw@mail.gmail.com>
Subject: Re: [PATCH v23 4/4] perf: arm_pmuv3: Add support for the Branch
 Record Buffer Extension (BRBE)
To: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, James Clark <james.clark@linaro.org>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Leo Yan <leo.yan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_085721_326558_654AACE3 
X-CRM114-Status: GOOD (  27.45  )
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

On Fri, Jul 4, 2025 at 12:18=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> Hi Rob,
>
> Thanks for this; I think this is in good shape now. There's a couple of
> thing I think we should fixup, described below and diff provided at the
> end of this mail. That aside I reckon we should apply this shortly.
>
> Will, are you happy to apply that diff when picking this up?
>
> On Wed, Jun 11, 2025 at 01:01:14PM -0500, Rob Herring (Arm) wrote:
> > +/*
> > + * BRBE is assumed to be disabled/paused on entry
> > + */
> > +void brbe_enable(const struct arm_pmu *arm_pmu)
> > +{
> > +     struct pmu_hw_events *cpuc =3D this_cpu_ptr(arm_pmu->hw_events);
> > +     u64 brbfcr =3D 0, brbcr =3D 0;
> > +
> > +     /*
> > +      * Merge the permitted branch filters of all events.
> > +      */
> > +     for (int i =3D 0; i < ARMPMU_MAX_HWEVENTS; i++) {
> > +             struct perf_event *event =3D cpuc->events[i];
> > +
> > +             if (event && has_branch_stack(event)) {
> > +                     brbfcr |=3D event->hw.branch_reg.config;
> > +                     brbcr |=3D event->hw.extra_reg.config;
> > +             }
> > +     }
>
> I see that in v20 you moved the brbe_invaliate() form here into
> brbe_read_filtered_entries(), when entries are read upon an event
> overflowing. The changelog says:
>
> | Rework BRBE invalidation to avoid invalidating in interrupt handler
> | when no handled events capture the branch stack (i.e. when there are
> | multiple users).
>
> I don't think that's quite right. Since BRBCR_ELx.FZP causes a freeze
> BRBFCR_EL1.PAUSE to be set when *any* event overflows, not discarding
> across an overflow or other transient disable/enable can introduce a
> discontinuity in the branch records.

My thought was the discontinuity is samples from the PMU interrupt
which we don't want to sample anyways, so better to keep samples from
prior to the unrelated interrupt.

> The rationale for doing the invalidation here was to avoid the
> possiblity of any such discontinuity, and to do so simply, at the cost
> of discarding records in some cases where we could theoretically keep
> them around.

That's fine by me as well. It probably doesn't really matter much in
practice as you would have to get 2 PMU interrupts fairly close
together to lose samples (from before the first interrupt).

>
> I would prefer the invalidate to be performed within brbe_enable()
> (before the actual enable/unpause), and for armv8pmu_restart() to be
> folded back into armv8pmu_start().
>
> I've provided a diff/fixup at the end of this reply.

Thanks.

Rob

