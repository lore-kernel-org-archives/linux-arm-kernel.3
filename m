Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717AEC3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGjwIotwYx2XvIKhgDLZQr9CxiI0z5/EQ148mfVrAMU=; b=mkDR+Um2bIFxWuLXK7ypohk7Cs
	9wmYE6Rt7st1urjfr2hoP2fBhp/uZmwpWspwf32Yg7cOqb3RJ/VL5chZajbYHGVWMhsf8DLpgGEey
	96rm8+Y46VlAn2hNvbemBWI4J5o73CutIdmVjW4VD7G7ZNd7Yyi4h9jBNVdMkRgWbOsuP5P2pSoVV
	HuerfgC7YrG4w7B5WQqfn+BBLaxm3qBdPw2jp+KLK9VMS/mmx0R0K+JX4Ic3yqvfgSBprgJ7nXXbB
	t1bJKgx0iGPGaNkNFAtDgMBv2YTRi2JmIL0mSLZgsTahLuzzwc+y4Mlbat7+KPeTVRlUv0LswPvSE
	sgI+nzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZoE-0000000GVZp-3VUm;
	Thu, 01 May 2025 19:43:02 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZmK-0000000GVTC-2wsQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:41:05 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6ecfc2cb1aaso15531556d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746128463; x=1746733263; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGjwIotwYx2XvIKhgDLZQr9CxiI0z5/EQ148mfVrAMU=;
        b=wWovzXcbwaGGd2iIiaH4Ax12L04ohV8TCpZ0zsAT89Wy09DPABt00sFCGRrBGOOkIK
         t4LbyD8vxK3OmihlQ/x+wA+QPe1QZhOjq1cw1U4UxQu3g3TQ9CHGW/4UTMkUV1tfdV05
         UIkt5fU8ZJInmlIG4AyuuMA/Lx6+89c71qt3k3xBHrVnraZNMl8mKGYIwpWtW6Qhte9z
         cYyCdcZhaf5OQzOID1ygSlarc6KYwQb31J/72iYCPEqSc9syaqAiUoAsqGAzzuBH/FBH
         5GwnPmcWwO96udGMw6O3kyvkiMmdBwrD3XILFlBmkHUZMTG5UaBtuMbadK/pAwV4bxzp
         0S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128463; x=1746733263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hGjwIotwYx2XvIKhgDLZQr9CxiI0z5/EQ148mfVrAMU=;
        b=dzCSk83ci+RRPt8am0zh0NyVpSGLrZ3VSBCBtXZkn41BMCpbD1fMteVF/laV/OYad6
         cFWQBhRFCqiKmFtJ0M5optmTLYiFEpm4ACjYJtBANezKnYTOkUwCxNRVX8j9YrA/9Byw
         tDjuc7SJ12WMnjcYIkr7Vogkf1NLFpuz7UdBwwOFmORi9YdGPdcx4uo6zjSzvrobgJYI
         jRUCfU8IO6QC3CAsN2dXMySPMB7hngLl1s5RsW0nqVbIFfRM8amuaPMQWhvc6b9SM/BO
         KtlSj0XtY3GxSWCz39OwaqNIedbjtVQ8Tju8cI0ugdSNpWytY8cEbLP1e9wUZdp+TOw+
         yY/w==
X-Forwarded-Encrypted: i=1; AJvYcCWaFMitOEzJChRAXrIx9We6M09Tfzu4R3kTWVuXHZe2jysRIE9ETtvpwOKwU21Bs5c5pgJ+mVgNdpqVQaA224pW@lists.infradead.org
X-Gm-Message-State: AOJu0YwNPB/Mq72LayEc9rnkmPpzhZ4R2O3AIID93b8mfWssZVPMunkY
	49hIM6xdlDjuRK/xVvMrezqASY/BybU7vHDRHOSEV7tuPNb+1iLG2wahbkB92aBmpoJO0Q1TRMd
	sD1WlIBrKnnwDaWCy3SgHs+jIA97rcUDg1h8=
X-Gm-Gg: ASbGncsphF1GYxclXHH0qU0bbmphdTGGVLrOjKOBi7LxWiGztTQyaFukCKeQJeWNIcy
	gKS4pAMpzK3pkB+Vw0il0fwR3sOqH5OdB5g7IT4wK4Dhx0Us8AFJPQcIgmT12iuD9HOZu2dZ1Nd
	AWezHo3JXNhcpo6EPQHUDaFhtx/kkpWscvgxnL63d+7U3N7S2YhMs=
X-Google-Smtp-Source: AGHT+IGmG4Q6q6A4+zcAS84FjPk+vhRIQTCiE8mwB+hojxIFoINeC3OH8FibnJUGPn2uTrcgIuHY8VK2eWaXjD7DrtQ=
X-Received: by 2002:ad4:5cee:0:b0:6e8:9e9c:d20f with SMTP id
 6a1803df08f44-6f51538dd01mr7400556d6.21.1746128462429; Thu, 01 May 2025
 12:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250429213133.922495-1-yabinc@google.com> <a7c2ff21-4399-4cff-83d9-2fb0da0b5a08@linaro.org>
In-Reply-To: <a7c2ff21-4399-4cff-83d9-2fb0da0b5a08@linaro.org>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 1 May 2025 12:40:50 -0700
X-Gm-Features: ATxdqUHhwNwpEdxYYpxc7dOP4rb5LoVMEh7OUs5FnZ9i5VfeUpLDEgFZmftWHkY
Message-ID: <CALJ9ZPParuzroQmPGuz5YR94R=AHEw+gFp1NOdrsUer_MBmvsw@mail.gmail.com>
Subject: Re: [PATCH v2] perf: Allocate non-contiguous AUX pages by default
To: James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_124104_744198_64CD3A8F 
X-CRM114-Status: GOOD (  35.36  )
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

On Thu, May 1, 2025 at 3:47=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
>
>
> On 29/04/2025 10:31 pm, Yabin Cui wrote:
> > perf always allocates contiguous AUX pages based on aux_watermark.
> > However, this contiguous allocation doesn't benefit all PMUs. For
> > instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> > ETR allocates a separate buffer. For these PMUs, allocating contiguous
> > AUX pages unnecessarily exacerbates memory fragmentation. This
> > fragmentation can prevent their use on long-running devices.
> >
> > This patch modifies the perf driver to allocate non-contiguous AUX
> > pages by default. For PMUs that can benefit from contiguous pages (
> > Intel PT and BTS), a new PMU capability, PERF_PMU_CAP_AUX_PREFER_LARGE
> > is introduced to maintain their existing behavior.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> > Changes since v1:
> > In v1, default is preferring contiguous pages, and add a flag to
> > allocate non-contiguous pages. In v2, default is allocating
> > non-contiguous pages, and add a flag to prefer contiguous pages.
> >
> > v1 patchset:
> > perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> > cs_etm
> >
> >   arch/x86/events/intel/bts.c |  3 ++-
> >   arch/x86/events/intel/pt.c  |  3 ++-
> >   include/linux/perf_event.h  |  1 +
> >   kernel/events/ring_buffer.c | 18 +++++++++++-------
> >   4 files changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
> > index a95e6c91c4d7..9129f00e4b9f 100644
> > --- a/arch/x86/events/intel/bts.c
> > +++ b/arch/x86/events/intel/bts.c
> > @@ -625,7 +625,8 @@ static __init int bts_init(void)
> >               return -ENOMEM;
> >
> >       bts_pmu.capabilities    =3D PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP=
_ITRACE |
> > -                               PERF_PMU_CAP_EXCLUSIVE;
> > +                               PERF_PMU_CAP_EXCLUSIVE |
> > +                               PERF_PMU_CAP_AUX_PREFER_LARGE;
> >       bts_pmu.task_ctx_nr     =3D perf_sw_context;
> >       bts_pmu.event_init      =3D bts_event_init;
> >       bts_pmu.add             =3D bts_event_add;
> > diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> > index fa37565f6418..37179e813b8c 100644
> > --- a/arch/x86/events/intel/pt.c
> > +++ b/arch/x86/events/intel/pt.c
> > @@ -1866,7 +1866,8 @@ static __init int pt_init(void)
> >
> >       pt_pmu.pmu.capabilities         |=3D PERF_PMU_CAP_EXCLUSIVE |
> >                                          PERF_PMU_CAP_ITRACE |
> > -                                        PERF_PMU_CAP_AUX_PAUSE;
> > +                                        PERF_PMU_CAP_AUX_PAUSE |
> > +                                        PERF_PMU_CAP_AUX_PREFER_LARGE;
> >       pt_pmu.pmu.attr_groups           =3D pt_attr_groups;
> >       pt_pmu.pmu.task_ctx_nr           =3D perf_sw_context;
> >       pt_pmu.pmu.event_init            =3D pt_event_init;
> > diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> > index 0069ba6866a4..56d77348c511 100644
> > --- a/include/linux/perf_event.h
> > +++ b/include/linux/perf_event.h
> > @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
> >   #define PERF_PMU_CAP_AUX_OUTPUT                     0x0080
> >   #define PERF_PMU_CAP_EXTENDED_HW_TYPE               0x0100
> >   #define PERF_PMU_CAP_AUX_PAUSE                      0x0200
> > +#define PERF_PMU_CAP_AUX_PREFER_LARGE                0x0400
> >
> >   /**
> >    * pmu::scope
> > diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> > index 5130b119d0ae..d76249ce4f17 100644
> > --- a/kernel/events/ring_buffer.c
> > +++ b/kernel/events/ring_buffer.c
> > @@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct per=
f_event *event,
> >   {
> >       bool overwrite =3D !(flags & RING_BUFFER_WRITABLE);
> >       int node =3D (event->cpu =3D=3D -1) ? -1 : cpu_to_node(event->cpu=
);
> > -     int ret =3D -ENOMEM, max_order;
> > +     int ret =3D -ENOMEM, max_order =3D 0;
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
> > @@ -698,16 +698,20 @@ int rb_alloc_aux(struct perf_buffer *rb, struct p=
erf_event *event,
> >                                         (unsigned long)nr_pages << (PAG=
E_SHIFT - 1));
> >
> >               /*
> > -              * Use aux_watermark as the basis for chunking to
> > +              * For PMUs that prefer large contiguous buffers,
> > +              * use aux_watermark as the basis for chunking to
> >                * help PMU drivers honor the watermark.
> >                */
> > -             max_order =3D get_order(watermark);
> > +             if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LA=
RGE)
> > +                     max_order =3D get_order(watermark);
> >       } else {
> >               /*
> > -              * We need to start with the max_order that fits in nr_pa=
ges,
> > +              * For PMUs that prefer large contiguous buffers,
> > +              * we need to start with the max_order that fits in nr_pa=
ges,
> >                * not the other way around, hence ilog2() and not get_or=
der.
> >                */
> > -             max_order =3D ilog2(nr_pages);
> > +             if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LA=
RGE)
> > +                     max_order =3D ilog2(nr_pages);
>
> Doesn't this one need to be 'PERF_PMU_CAP_AUX_PREFER_LARGE |
> PERF_PMU_CAP_AUX_NO_SG', otherwise the NO_SG test further down doesn't
> work for devices that only have NO_SG and not PREFER_LARGE.
>
> NO_SG implies PREFER_LARGE behavior, except that NO_SG additionally hard
> fails if it can't do it in one alloc. But I think you shouldn't have to
> set them both to get the correct behavior.
>
Thanks for pointing it out! I made the change in v3 patch.

