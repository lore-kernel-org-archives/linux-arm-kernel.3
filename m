Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1C1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 18:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZLDFPYYERChhwGiLV1V4ti0sf1HZ45rpQN9Kgve63o=; b=M1mKCnHE6qm0XZjed1IFNGUv1u
	Sbb2yqwapAPHd5KlnQY3ZtnEuk5ZnXXfvHmAwuRsIIb2TrpCqgE0gVPXN/L24BtbH11SgGn/Zvv10
	YTfa3+lWGMtrHn8vPp7pbLEwj0LZHHGskMVhoNGtX0EZ4febjqeFLdLrGJAzniriqFmtGkQ1JnwqR
	wBsx2uKliuCclp4nc8xLf99tY8WfQUs9OgUQT8XR9bZEfLQ4jQw6JJkQIFW2jMnZb3JAv9tUGPK2+
	ve8+taJ1MO4B9NuHyGChddtm1Il+6jlr8WT31sirSF4zZNFpt3yMMF9lkd0yLlz70kHUW+RwHR5wG
	7gYccWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81PY-0000000F2UD-0H8c;
	Thu, 24 Apr 2025 18:35:00 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81Nh-0000000F2I8-28ZQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 18:33:06 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6e8fb83e137so13981846d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 11:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745519583; x=1746124383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZLDFPYYERChhwGiLV1V4ti0sf1HZ45rpQN9Kgve63o=;
        b=id5dYCpB0d4sFN2+GC5ju7wPWF6zFV3bP1L3bsFbVE+Yl45U5Gh4IIHJHrnC9yzuhx
         qqfBECa3CdMctEbX6oqAXdJ44GfCH5ZTPQhzbzfgeB7UWMxV6kErkxNBfBLBdxlT7lvh
         kKGx7q/WqhShUsH9OAL1g7qOXQuu64GdmE0205j3sTIbjTeE5QnadH4UEn+icYZIXFOI
         FXoVQoy3w3I0iLG4ESpQxpSRrUWXxAr+MJwOqAYLjJ6gh3tQw4ZwR02YR+OWJrQq/tgI
         bVHjG9bC2AT7lmdYK60xUfBExwwHCZc0Lycm7IA0FYeoqxzlTV02dfFMynSFzuFm/ksu
         sfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519583; x=1746124383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZLDFPYYERChhwGiLV1V4ti0sf1HZ45rpQN9Kgve63o=;
        b=DPrTuEz5sgiUKfppWqZKa6MKdumPygYB7tD/dWAJoOC7UKDNlrPQsqzOGn0Zc4IJuy
         oL0o5bJs8BYYf9zLg3R8vIdVoGEvpSXfOTr2DpXrSEa9dr9kvhDRnFCw07tzN0tDD58a
         R+XgLN8Gcwv/NrpHbt3u2PkGwGI5E7fdhlHPH5TceuDK0gpQ+XABaK+FX+X7iBMSEI37
         HKKGb/nJ8nFDv7MeXKhDmtOhIYmHXeMV+d7lXswSGi1fiYILrOhPefIWC8nYID1ipj3W
         CCk6G8n9pqUETk0YT65k1gU0uZX+RuMbVlEMZPy8s2Tyr4U1osTdw7LRaurFRqg+4S5/
         iJbg==
X-Forwarded-Encrypted: i=1; AJvYcCVLfnB1593JF5JTo+4ZUfebGgR+6fgG32WtY2US4VhtctOy0/j5+POXms1T8yUP70MRZLXofa94m4sBOyb+CKO1@lists.infradead.org
X-Gm-Message-State: AOJu0YwrRU7GRXc3ABH/BXCuba51FSmXijzefmN4XcKUFmiv7JKRXI46
	O3BoOCzsB80XXpjllHtQZfNmW5DVu1xDqOi/7pwkkuOE8qY1vv63UPDIFpWGY5hQ4pULU7rRO37
	e+kH1YAEMZS7cojTPntnflSb4DfljcHY202U=
X-Gm-Gg: ASbGncu+xDOeHzlA0Q1IVelN8k/JY+skskM/vySTmoOuys4BmCiyxN9w7N1H8IC53eg
	z5BSjmqPb3K7YYtpPbaNPr/qs1KqYpBNz7S0rVTuhXsgTBKCAwC+NA0frJrUtW37r6R6pesUtKu
	AEZ/p/W7TvAPtzClszLegjzJxHHfUXI/Wd9a8ugB+AxEzpXdGgWfxpICs=
X-Google-Smtp-Source: AGHT+IEQy8HLY9L1xq1buozzz2mjfrB7q7OHv76jqVScfSv3yY42ZW1q86tGFEOQmX5exFFK+eIU1yfKiVx6TSLc6Rw=
X-Received: by 2002:ad4:5ba2:0:b0:6f2:a886:7c6d with SMTP id
 6a1803df08f44-6f4bfbc963bmr60071466d6.3.1745519583247; Thu, 24 Apr 2025
 11:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250421215818.3800081-1-yabinc@google.com> <20250421215818.3800081-3-yabinc@google.com>
 <20250422142102.GI28953@e132581.arm.com> <CALJ9ZPNKZU7nVLyodN5i7GeRxWL6KzkXnqEJMv2sJkk2SwYi9Q@mail.gmail.com>
 <b002574d-e993-4b06-87f7-54bd01dfa500@arm.com>
In-Reply-To: <b002574d-e993-4b06-87f7-54bd01dfa500@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 24 Apr 2025 11:32:51 -0700
X-Gm-Features: ATxdqUFZ5Rgkz0Uy3iPfdZn7rATtAi2L_ZiNJkBFnMe_eiVY_i8WBoCCOZy6iHc
Message-ID: <CALJ9ZPOBUc1wkQXVgjU-4w6r8c27uv4YxzKkfgEQdqtNJbVt9Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] coresight: etm-perf: Add AUX_NON_CONTIGUOUS_PAGES to
 cs_etm PMU
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_113305_547762_2D6BBC3C 
X-CRM114-Status: GOOD (  25.90  )
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

On Thu, Apr 24, 2025 at 4:29=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
>
> On 4/24/25 01:31, Yabin Cui wrote:
> > On Tue, Apr 22, 2025 at 7:21=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote=
:
> >>
> >> On Mon, Apr 21, 2025 at 02:58:18PM -0700, Yabin Cui wrote:
> >>> The cs_etm PMU, regardless of the underlying trace sink (ETF, ETR or
> >>> TRBE), doesn't require contiguous pages for its AUX buffer.
> >>
> >> Though contiguous pages are not mandatory for TRBE, I would set the
> >> PERF_PMU_CAP_AUX_NO_SG flag for it.  This can potentially benefit
> >> performance.
> >
> > As explained in the patch 1/2, my use case periodically collects ETM da=
ta
> > from the field (using both TRBE and ETR), and needs to reduce memory
> > fragmentation. If the performance impact is big, we can make it user
> > configurable. Otherwise, shall we default it to non-contiguous pages?
>
> But is not that already happening ? cs_etm does not set the PMU cap
> PERF_PMU_CAP_AUX_NO_SG that means it can allocate non-contig memory
> chunk. Where am I missing ?

Although cs_etm doesn't set AUX_NO_SG flag, the perf component still prefer=
s
to allocate contiguous AUX pages for it. The new flag is to ask perf
component to
not allocate contiguous AUX pages.

>
> >
> >>
> >> For non per CPU sinks, it is fine to allocate non-contiguous pages.
> >>
> >> Thanks,
> >> Leo
> >>
> >>> This patch adds the PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES capability
> >>> to the cs_etm PMU. This allows the kernel to allocate non-contiguous
> >>> pages for the AUX buffer, reducing memory fragmentation when using
> >>> cs_etm.
> >>>
> >>> Signed-off-by: Yabin Cui <yabinc@google.com>
> >>> ---
> >>>  drivers/hwtracing/coresight/coresight-etm-perf.c | 3 ++-
> >>>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drive=
rs/hwtracing/coresight/coresight-etm-perf.c
> >>> index f4cccd68e625..c98646eca7f8 100644
> >>> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> >>> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> >>> @@ -899,7 +899,8 @@ int __init etm_perf_init(void)
> >>>       int ret;
> >>>
> >>>       etm_pmu.capabilities            =3D (PERF_PMU_CAP_EXCLUSIVE |
> >>> -                                        PERF_PMU_CAP_ITRACE);
> >>> +                                        PERF_PMU_CAP_ITRACE |
> >>> +                                        PERF_PMU_CAP_AUX_NON_CONTIGU=
OUS_PAGES);
> >>>
> >>>       etm_pmu.attr_groups             =3D etm_pmu_attr_groups;
> >>>       etm_pmu.task_ctx_nr             =3D perf_sw_context;
> >>> --
> >>> 2.49.0.805.g082f7c87e0-goog
> >>>
> >>>
> >

