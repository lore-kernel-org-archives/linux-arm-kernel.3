Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D861C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMCFjcDYKufJvMwFbFoS0kPacOFt/H1BGkqn/nrFgq0=; b=o6u5yV56zpZzHH8WYbn25foGhN
	LEcIGXsMITpcaT9MMLicMc32g3f1Lv0IGVsVfXd16i4pNsvyjkghvAMg9mUoJ2JbARZPAYHTyxtud
	J1FhihRzb7ph/gCAuhyA1z4sIRIgiY/vUEtvmzHWwO6cRxTh1QTH/LTmcl2vnE9ZXGhAFnl3VFGfr
	ykqdVBLmY3zU/iUNzL3MsEoNqaIouBBzq2Gj4ba86MbVIX/U4zdpwJeRSuUuW2FuuOJhy1x2uhshJ
	t+nMRS46XlNw5Mrj1poLK7BFemqBdpu+b80cgeDdapIzXE4EMqKeXEoFzxT9mOb9h8b+0i7oxD7xZ
	9pQ4T+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuG4-00000002grT-1kQJ;
	Fri, 02 May 2025 17:33:08 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAuE6-00000002gkg-0ogU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 17:31:08 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so26627866d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746207065; x=1746811865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMCFjcDYKufJvMwFbFoS0kPacOFt/H1BGkqn/nrFgq0=;
        b=v3s287ZXlAnevvB1keTehtyIAy3872/EXyA+deHxii21ehJKuNlMjnVzoIdB1bZJ+y
         UIqdfIEE8jrakPjFqhcN0mswQWAoJVBzA8xXBQHfncq7/99O31dyeE6OusuZDDUQOmXP
         1izhj/61digY+CdXVAVrE0MzzUGcqIqgPSEgMX22EpEuFhGjqfrNTdG3iE79r4D4ixqj
         lNpv8jIR6qDGK3n0+gPCw4xPsIvmOwWz5CT6VTsj+JAFh+ChwLG+afMMJX+KPnsoMlBu
         GqS7od3LUQfm9vhiMAvaAUpCIzNIXIAj9T+j0RNQp5G7Aoyfb0hvwiu66zvnQMenNO7I
         qd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207065; x=1746811865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMCFjcDYKufJvMwFbFoS0kPacOFt/H1BGkqn/nrFgq0=;
        b=NUoJnP0fTOzfAaxqVeBE3zl/1EADG7cuSNsFV6v7Dt+ISztC7DRwPaqTIu8CUbxQnh
         ZVigCrNADNuElz4fxHnULnSj87ACCl2YhluWrV/f5G1vnqEFhXfgeOS7DsPhgQBKNwSR
         SEK0nLkB59zGWHSnoTIOBFewyyMaM6HFtxOiRGugD32Z0tWj+Bl0ppPErB20XdnlY5/B
         DDqNBRorJlZEVMRu/OScy/AKAW7QkB2L5xH7zsAgL8sD0dTK68djrstz4QGuCjZabxob
         DPmR/KKWz0u0Ofsy/kRfzUdpC2g9FWsA0n1Q5jtK0AqdVhqbU3r5aIfFp7/QnHqpjbFE
         1QNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZfM744XCRcdpAX7J7uZx47nnUQ+/4JS/jlV5fsI06cAwg+EcpsrjY5UDLjryEkARVFSrP6k2d4eJ+69HoMVJD@lists.infradead.org
X-Gm-Message-State: AOJu0YzsBU99KwCgvWvn2rZkP1LQJOJNOg6Ojw12V/hVTZM6TCnQC2E9
	vnjMpGHxKvXdE9Mvyr6GrnvT/VTorXC98boUXENpu+YnHoj7seEC98ua56QPnUiEqLLKrVlb/gD
	UFY54x2vxBuleZD6zKE0R7zt0bw60l2rZL8U=
X-Gm-Gg: ASbGncuJBkh7IjUax3x7/qz/1T7c04GXGbefwTfkByCA2VUv5Xz8vC6HgZ36j/pdal5
	OS+6OuUNVlNpEVTXsfKbL4yhTscM2gOR6NG3GNpxjH6EAp9BH7Gw9BbYiOVazZMwGD5XSkGz56O
	tHhudV2byr+zFejBC3/OBEI9VI6n4Fa/3Kbygz69BfpkvkUHsV66vp1YM=
X-Google-Smtp-Source: AGHT+IFketDgIAyIg1nzLpZwpgdnRMDBObLxDNHG1f3j9ZJ7VtHRnYWzb9gAuuD1s4QoK/s07tDlq6e1k6CDT2Gw9WA=
X-Received: by 2002:ad4:5d63:0:b0:6e6:6c7f:1116 with SMTP id
 6a1803df08f44-6f51578445fmr53465476d6.24.1746207063804; Fri, 02 May 2025
 10:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250501193556.23473-1-yabinc@google.com> <02c125c9-7a1f-4dfd-b058-02a38ed5b598@arm.com>
In-Reply-To: <02c125c9-7a1f-4dfd-b058-02a38ed5b598@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 2 May 2025 10:30:52 -0700
X-Gm-Features: ATxdqUFmx2hBUO3uk91d37roh8hs55lc6aLf5LBhD3FNcxdPEhGgyk4RnUvPDUU
Message-ID: <CALJ9ZPMYj=+ZsbPDWHe80R_i3GiMmKBviZ+WBRaj3jm96ZH+VQ@mail.gmail.com>
Subject: Re: [PATCH v3] perf: Allocate non-contiguous AUX pages by default
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_103106_228978_6BE90EAC 
X-CRM114-Status: GOOD (  38.35  )
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

On Fri, May 2, 2025 at 3:51=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 5/2/25 01:05, Yabin Cui wrote:
> > perf always allocates contiguous AUX pages based on aux_watermark.
> > However, this contiguous allocation doesn't benefit all PMUs. For
> > instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> > ETR allocates a separate buffer. For these PMUs, allocating contiguous
> > AUX pages unnecessarily exacerbates memory fragmentation. This
> > fragmentation can prevent their use on long-running devices.
> >
> > This patch modifies the perf driver to be memory-friendly by default,
> > by allocating non-contiguous AUX pages. For PMUs requiring contiguous
> > pages (Intel BTS and some Intel PT), the existing
> > PERF_PMU_CAP_AUX_NO_SG capability can be used. For PMUs that don't
> > require but can benefit from contiguous pages (some Intel PT), a new
> > capability, PERF_PMU_CAP_AUX_PREFER_LARGE, is added to maintain their
> > existing behavior.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> > Changes since v2:
> > Let NO_SG imply PREFER_LARGE. So PMUs don't need to set both flags.
> > Then the only place needing PREFER_LARGE is intel/pt.c.
> >
> > Changes since v1:
> > In v1, default is preferring contiguous pages, and add a flag to
> > allocate non-contiguous pages. In v2, default is allocating
> > non-contiguous pages, and add a flag to prefer contiguous pages.
> >
> > v1 patchset:
> > perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> > cs_etm
> >
> >  arch/x86/events/intel/pt.c  |  2 ++
> >  include/linux/perf_event.h  |  1 +
> >  kernel/events/ring_buffer.c | 20 +++++++++++++-------
> >  3 files changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> > index fa37565f6418..25ead919fc48 100644
> > --- a/arch/x86/events/intel/pt.c
> > +++ b/arch/x86/events/intel/pt.c
> > @@ -1863,6 +1863,8 @@ static __init int pt_init(void)
> >
> >       if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
> >               pt_pmu.pmu.capabilities =3D PERF_PMU_CAP_AUX_NO_SG;
> > +     else
> > +             pt_pmu.pmu.capabilities =3D PERF_PMU_CAP_AUX_PREFER_LARGE=
;
> >
> >       pt_pmu.pmu.capabilities         |=3D PERF_PMU_CAP_EXCLUSIVE |
> >                                          PERF_PMU_CAP_ITRACE |
>
> Why this PMU has PERF_PMU_CAP_AUX_PREFER_LARGE fallback option but
> not the other PMU in arch/x86/events/intel/bts.c even though both
> had PERF_PMU_CAP_AUX_NO_SG ?

Because Intel BTS always use NO_SG, while in some cases Intel PT
doesn't use NO_SG.
>
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 0069ba6866a4..56d77348c511 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
> >  #define PERF_PMU_CAP_AUX_OUTPUT                      0x0080
> >  #define PERF_PMU_CAP_EXTENDED_HW_TYPE                0x0100
> >  #define PERF_PMU_CAP_AUX_PAUSE                       0x0200
> > +#define PERF_PMU_CAP_AUX_PREFER_LARGE                0x0400
> >
> >  /**
> >   * pmu::scope
> > diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> > index 5130b119d0ae..4d2f1c95673e 100644
> > --- a/kernel/events/ring_buffer.c
> > +++ b/kernel/events/ring_buffer.c
> > @@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct per=
f_event *event,
> >  {
> >       bool overwrite =3D !(flags & RING_BUFFER_WRITABLE);
> >       int node =3D (event->cpu =3D=3D -1) ? -1 : cpu_to_node(event->cpu=
);
> > -     int ret =3D -ENOMEM, max_order;
> > +     int ret =3D -ENOMEM, max_order =3D 0;
>
> 0 order is now the default allocation granularity. This might benefit
> from a comment above explaining that max_order could change only with
> PERF_PMU_CAP_AUX_NO_SG or PERF_PMU_CAP_AUX_PREFER_LARGE PMU flags etc.
>
Will add the comment in the next respin.
> >
> >       if (!has_aux(event))
> >               return -EOPNOTSUPP;
> > @@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct per=
f_event *event,
> >
> >       if (!overwrite) {
> >               /*
> > -              * Watermark defaults to half the buffer, and so does the
> > -              * max_order, to aid PMU drivers in double buffering.
> > +              * Watermark defaults to half the buffer, to aid PMU driv=
ers
> > +              * in double buffering.
> >                */
> >               if (!watermark)
> >                       watermark =3D min_t(unsigned long,
> > @@ -698,16 +698,22 @@ int rb_alloc_aux(struct perf_buffer *rb, struct p=
erf_event *event,
> >                                         (unsigned long)nr_pages << (PAG=
E_SHIFT - 1));
> >
> >               /*
> > -              * Use aux_watermark as the basis for chunking to
> > +              * For PMUs that need or prefer large contiguous buffers,
> > +              * use aux_watermark as the basis for chunking to
> >                * help PMU drivers honor the watermark.
> >                */
> > -             max_order =3D get_order(watermark);
> > +             if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
> > +                                             PERF_PMU_CAP_AUX_PREFER_L=
ARGE))
> > +                     max_order =3D get_order(watermark);
> >       } else {
> >               /*
> > -              * We need to start with the max_order that fits in nr_pa=
ges,
> > +              * For PMUs that need or prefer large contiguous buffers,
> > +              * we need to start with the max_order that fits in nr_pa=
ges,
> >                * not the other way around, hence ilog2() and not get_or=
der.
> >                */
> > -             max_order =3D ilog2(nr_pages);
> > +             if (event->pmu->capabilities & (PERF_PMU_CAP_AUX_NO_SG |
> > +                                             PERF_PMU_CAP_AUX_PREFER_L=
ARGE))
> > +                     max_order =3D ilog2(nr_pages);
> >               watermark =3D 0;
> >       }
> >
>
> Although not really sure, could event->pmu->capabilities check against th=
e ORed
> PMU flags PERF_PMU_CAP_AUX_NO_SG and PERF_PMU_CAP_AUX_PREFER_LARGE be con=
tained
> in a helper pmu_prefers_cont_alloc(struct *pmu ...) or something similar =
?

Sure, but I feel it's not very worthwhile. Maybe add a local variable
use_contiguous_pages? It can also work as another comment near
max_order.

