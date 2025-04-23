Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37085C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 20:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lp4CdKMNjxvtvuUzztK6+9w/pLy8jiHgEZIHEVYZ3qc=; b=Yx4MERmnxpxMnqDcUa7QUeGGSP
	SwTxOnWK/OT5uJA8mkvz3Su68Vz7GT2rkC2tylURnUqPHeWBVoBPIn3CXcgekMOxkzRxQnZLmD57J
	UeeMrYhaoc+i/ZyJgJ+p/zbBFCWsul0DRr5xhk2+z2Tr6V9fKpzj0nUvlUlYozMuStmO8+uOQ4CuF
	AtwJuuFtzf67zwZU7oT6YE2z+AfCPTJwIbf4ilOqiksJrqzoShra8XfPwvcyu47l1hNGfMBxWARhW
	D4Higg6XmvhjGd3xRdLrgfYcCZ4sAGs8t1M+LE4l/UJFyXB6fhu+0NZFQh53hQp+iDCkaKxN4mD34
	st77k3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gJT-0000000BtJ7-4C2o;
	Wed, 23 Apr 2025 20:03:20 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7gHU-0000000Bsk3-1sok
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 20:01:20 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c55b53a459so26268485a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 13:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745438475; x=1746043275; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp4CdKMNjxvtvuUzztK6+9w/pLy8jiHgEZIHEVYZ3qc=;
        b=MnQSISGRtJYaUzdMrCfxSSGX1MUIAUZmI6r8Q6kcFEwKk6uXJCnuHJgph42aGNgwN+
         eemdWi/EV12tOBYPDQrtQE8LbTARJ+3YsWdLaXS6ausBJhAYeBiOuIvSi86JinyJleYG
         Pq/RgBKU6Rqw+5shBqW5KIo6Pxk+l8wganJTCkm4SueQatXctA8buvnKn7Xa7wnYPz1W
         FeMnQBZovZ6bnpGmgL8m69HvX4wQj+0oqRcaEf9Srkh22DHDXstRFHQjXmHY/XrhSHgG
         kjlrjFn4GI3I/mliUC42SkSHjoXnj+NVCB8WMWhcY5AKipQ50vVLSPO8CAeND/WEDY0v
         Sz9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745438475; x=1746043275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp4CdKMNjxvtvuUzztK6+9w/pLy8jiHgEZIHEVYZ3qc=;
        b=WWCrSkpDm0dTnrpbWhThjGPi5wZwM/fOTyzy8TwYax3ZxNH3i2DRiIjEExfkbHOAee
         qEnFMd5f5wECntTRlCtLswAcN8BXmIL+hRD+HutZX4lMJEyn2Ps3cxMF9AiY4m5lC9Jz
         p60o5y1XshOIInR5rEbwNFG9WCSmF09k6eANj0how5HNiB3z90cv7karxU3rh2IzHv1H
         Fplxdvh3lZV+CHU9/FzTcwp+r0F+gBWe5ugVP9J+AobEvvzvuh3laZ95OFinemQ+pDRI
         f5UVXWasiiyqTPoYYIoXOIPYAFBJVIx4EKNgwGF3tA1TfydBnAWkfMv1RVCSFaCgIkAR
         qE0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUB9IHSoUEfso19WTrmMm798nCKjMpFIryGB+BuTshe+B0+FeqreO+TFEoy2J1vtCv/SR5iHJIft6EFkmi/h+c1@lists.infradead.org
X-Gm-Message-State: AOJu0YziAd//6xRFBU8IyjhYEgG/+7QqTWJOByF6+x28c9l5hwte6hL7
	ksFw8eAYwg+GFOW4RkKuDFupNwvzdn5VJNCuaI/wXQgLHL9F5zjf86eCzbacgogCYINNe4WgecH
	+ABrBV0jMUOJ/UiOEyD1vyYkxukQMg90znqg=
X-Gm-Gg: ASbGncvJepNxwZhdyQ4h30AmDViwVJ3XWO4dsmPiFK5VN6JqMV8+L/uaNch4e61sdq0
	nM9Z3stgd+XO7D+V3uYJvamTrZNrJcbXeCAc2coQBIgXvMNkU6E5VaaQQZV7W/EiH/PTtjrd9qV
	BUYKHwAS5OOVp5K/VDJk9IHYoOg0e/bIKZMgl5Y716MEMnVj4uBuB9lQZI3K5fbw==
X-Google-Smtp-Source: AGHT+IGLQ5HSuz+Vu0fNrtBJpS4OlBT/hHsgAWnUcy9YtEjieTri+yDmgzJuQXVWkptGriSGBQGbhS8z3mhXYKbvHzo=
X-Received: by 2002:ad4:574a:0:b0:6d8:9c92:6555 with SMTP id
 6a1803df08f44-6f4bfc7afc4mr561126d6.29.1745438474901; Wed, 23 Apr 2025
 13:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-3-yabinc@google.com>
 <20250422142102.GI28953@e132581.arm.com>
In-Reply-To: <20250422142102.GI28953@e132581.arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Wed, 23 Apr 2025 13:01:03 -0700
X-Gm-Features: ATxdqUHxCe0dNQK1zzumyasbHqzp8bMN4VyHh8fq17oPYK91Kakr2wvuHppdyfg
Message-ID: <CALJ9ZPNKZU7nVLyodN5i7GeRxWL6KzkXnqEJMv2sJkk2SwYi9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_130118_122645_69110E48 
X-CRM114-Status: GOOD (  23.78  )
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

On Tue, Apr 22, 2025 at 7:21=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Mon, Apr 21, 2025 at 02:58:18PM -0700, Yabin Cui wrote:
> > The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
> > TRBE), doesn't require contiguous pages for its AUX buffer.
>
> Though contiguous pages are not mandatory for TRBE, I would set the
> PERF_PMU_CAP_AUX_NO_SG flag for it.  This can potentially benefit
> performance.

As explained in the patch 1/2, my use case periodically collects ETM data
from the field (using both TRBE and ETR), and needs to reduce memory
fragmentation. If the performance impact is big, we can make it user
configurable. Otherwise, shall we default it to non-contiguous pages?

>
> For non per CPU sinks, it is fine to allocate non-contiguous pages.
>
> Thanks,
> Leo
>
> > This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
> > to the cs_etm PMU. This allows the kernel to allocate non-contiguous
> > pages for the AUX buffer, reducing memory fragmentation when using
> > cs_etm.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >  drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers=
/hwtracing/coresight/coresight-etm-perf.c
> > index f4cccd68e625..c98646eca7f8 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> > @@ -899,7 +899,8 @@ int __init etm_perf_init(void)
> >       int ret;
> >
> >       etm_pmu.capabilities            =3D (PERF_PMU_CAP_EXCLUSIVE |
> > -                                        PERF_PMU_CAP_ITRACE);
> > +                                        PERF_PMU_CAP_ITRACE |
> > +                                        PERF_PMU_CAP_AUX_NON_CONTIGUOU=
S_PAGES);
> >
> >       etm_pmu.attr_groups             =3D etm_pmu_attr_groups;
> >       etm_pmu.task_ctx_nr             =3D perf_sw_context;
> > --
> > 2.49.0.805.g082f7c87e0-goog
> >
> >

