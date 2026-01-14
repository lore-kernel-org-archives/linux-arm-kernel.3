Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9066D38FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kjv1wVcnUYn4H9c+GgiFr/qboEWraopFEvmNwvkz1TM=; b=A/CqxBBrOhCId2JcrqN8SA3pL1
	D5HZzP31J+hBN2x/diAltl5na7lunh8G+WBhUmyFp5Bkmyy01lToB9eDYPhcgPjYtF028hx7TZVmh
	4cA0Jts+utP313AVv3tufcfOgdwV79vXFaK+8qOBSoQMW7aWq+fVH7MyKHK4hNGPtQIQ/I5MO1Euk
	Ky0aQN2MmbSZK1HE269lMh+qbfzPLWXIe61YPwjC6LqQqckPYTPZJzZBknxtByRfW+gRMv1N13T8I
	59yZor/5+IThF3ApkzcWyWlijVncDb/I7D4M3GNhfVmwz8Y5Ah4stPfOrsP6eJqOOBGQZ91Jg95nw
	UpFEFLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46K-00000009ziU-0bpr;
	Wed, 14 Jan 2026 16:52:08 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg469-00000009zbO-3ZD9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:51:59 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29f02651fccso92805ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:51:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768409516; cv=none;
        d=google.com; s=arc-20240605;
        b=WTqArcJt8TriYpMWK7OBL7j0w/4t0FYtmSoNHiZE/ASPOW1OKc8IeE56De99SQT0DM
         6smQs4rLanTU0lxQaSGWAE6EzfjIbKXcPoZLV1XLtZoyhflMtToHorjMuBymlgAFg6l8
         IcblvNKuqrzJkNRwqYQwsXlPPaSwx4sYsCwr3qlljsdjPpt0djLXbSCTMBsGaB6Woni0
         zdnL8f+RPufxCGvhXZPd+tMmx+ygSBNL927JR6A/VRXVrJqaqKxt5iit3pHDs6qMlmCw
         cxxdASMMkKC8z/MqSxq3+NdKmKlS2D7ni5udBkdUltV8mUPvef1xXVXgJOlKrMp0JN6X
         0qFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kjv1wVcnUYn4H9c+GgiFr/qboEWraopFEvmNwvkz1TM=;
        fh=uzSvXheHhc6HA4oecy2avKIuX4y0m+dXLLSeFWwT+j8=;
        b=IDGAZyiP3t35YIZYb7zWDEsqu4kPlRBQGuT3TMXBy+8Zkso0cLDzPDyrnrsAAM2H4k
         pYiQh6EnfT3q/6j5+p+W2z3f11JkzfjV2aDSvBfIuqyywsEx0NHMafZME2p1odWYeL/9
         LPps/jD07OuYfy32L3JY4M7Lus8Dlc5TCjObXGTlWcqKCB22miOExuUiWzX0YBHqQv6v
         0XUqYlmwBkDLKUxBJ9pd0pnK1HD8EpJdhQ9MMBdjDzpjNgBQrp4taZHuQPx/mHC7luf7
         X/4ELubRSgemVLQqaLQfwmOhcren8EzrXNzbXBxS7P/PFKodCLOILmG6nCQgiew2h1IB
         Hnsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409516; x=1769014316; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjv1wVcnUYn4H9c+GgiFr/qboEWraopFEvmNwvkz1TM=;
        b=amTsHSQ6NTCZuknlq1fMYgulf9QSTkj/QsYsQ4XMBqx/bW6/yofcVZG8pBrxw2cPFd
         EpWpa6yH0AGSoj9wvAvRmfSfuaYwiP2NslvPsIA9wzW45V6lTQbF8Qbp5LNBRAPpkVEZ
         dL2wv2UcTeokqzKA3i/9EyGxQYYrd1Nj8ES1F9nNGW3sMXtP5PfWHHDZAxbJkklnzR7G
         GF/dL+JDHAK+Y21FO+ykKxstVU9WcDHsUbKTymBxBQV/qActveNVRTbEYvGPdOJBHTPo
         Rv9kjzUc0dm30LdWdctjXQgjhuohmLwdLBsKlo5PmnhW8m/jJItfNaf+f0hsRTh9TI2o
         XG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409516; x=1769014316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kjv1wVcnUYn4H9c+GgiFr/qboEWraopFEvmNwvkz1TM=;
        b=mZ+f/2c2soe6tOPbLeHLZWJViV2j4iyXhoS0WudjSp/lpnR2PNM85uYmbqJ7NFv4/S
         j+2O4JHByMTqsH5mQc3F5r/vb37wraiOwDjRb8WJskHRqJizOUccrY3KLIKhcZer9+Hx
         5a/tA6l8cvun+uB4bAiDdCMU91pgz+NYQrQidKFXwjgsJ3Hbz0t0tobdUgDmoi2zG7sZ
         wdOxW15REMd35w1BaekEPQbWFaXuiBxMB0OFT/R789WwuAopTlSeg9KnXLkRrI0HUDgQ
         Day/eXvnZt3MA1sKx1WgA8pUniiV8mLO6rvNqUsc90OPqGWmnm1q8t9BBPf1OXCmKFWW
         gG4w==
X-Forwarded-Encrypted: i=1; AJvYcCWY3/8Dj8OrUh89DzJOPVeUW2PKJrFKcBDUo4n+BQTcQFWOxpI6jgUf8+Wyuflcr8Nz+xHcLvURv1XNncjnNXmR@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk7F4uSTq3rKp/6fYVX0YgPh23zqMc7+KFpKtCB/P4Bel8wrKu
	HD0tr7Ak7BX+PKGABJX77pjzvgot7bFR5DoNGqLHNg2Ido3nzEM4+5wUkKDgy8rCLZiV6g22h8U
	fsPMIdTtX6WhfgteLoRX27McAjRdip3qCw0rhSgsH
X-Gm-Gg: AY/fxX6muzZeR/PeLP7gdazn1oImY6ypdRQYjy3duPU0MKFQ2+gH0Zpa4Y4tz7GARLB
	HvxDU9F4HB4FwFtFQBqANt4ENScsCCVGfLSuoO+jG+R9P7TL/aFhmlRueYKNFgCt6B9kxCI3n3w
	Jziwqezm1TD8cO54ohjdl5P0KKvn1ip3JGCI0dXFp/R8o9JPoojVtmE/Lw4CpCOllO9YfWTDFNJ
	KgXc/31qPCmV6pUIP94wZOoNpX6arjosfoom5/1CfavaxFxZ2BRYTSghsf3wgUPsloDbbrKYam1
	DjZIOJ0T8LUWyEFDBWFbyoilfA==
X-Received: by 2002:a17:902:ec85:b0:290:8ecf:e9f9 with SMTP id
 d9443c01a7336-2a59a918840mr2977165ad.7.1768409515777; Wed, 14 Jan 2026
 08:51:55 -0800 (PST)
MIME-Version: 1.0
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org> <20260114-james-perf-config-bits-v5-2-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-2-0ef97aaf1ac0@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Jan 2026 08:51:44 -0800
X-Gm-Features: AZwV_QgNKI19hlQFGQLMSXvqf0jhHCIRBL8Kn4OmCTj3y6VKnMxjSZb2KJMrP80
Message-ID: <CAP-5=fUuFAj_wtJ+PMq8iS3gs5Z8XErYdcBeYnEMU_wSb3UAkw@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] perf evsel: Refactor evsel__set_config_if_unset()
 arguments
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_085157_895787_0A50F5C3 
X-CRM114-Status: GOOD (  22.98  )
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

On Wed, Jan 14, 2026 at 7:57=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Make the evsel argument first to match the other evsel__* functions
> and remove the redundant pmu argument, which can be accessed via evsel.
>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/arch/arm/util/cs-etm.c    | 9 +++------
>  tools/perf/arch/arm64/util/arm-spe.c | 2 +-
>  tools/perf/arch/x86/util/intel-pt.c  | 3 +--
>  tools/perf/util/evsel.h              | 4 ++--
>  tools/perf/util/pmu.c                | 6 +++---
>  5 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git a/tools/perf/arch/arm/util/cs-etm.c b/tools/perf/arch/arm/util=
/cs-etm.c
> index ea891d12f8f4..c28208361d91 100644
> --- a/tools/perf/arch/arm/util/cs-etm.c
> +++ b/tools/perf/arch/arm/util/cs-etm.c
> @@ -441,10 +441,8 @@ static int cs_etm_recording_options(struct auxtrace_=
record *itr,
>          * when a context switch happened.
>          */
>         if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
> -               evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -                                          "timestamp", 1);
> -               evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -                                          "contextid", 1);
> +               evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
> +               evsel__set_config_if_unset(cs_etm_evsel, "contextid", 1);
>         }
>
>         /*
> @@ -453,8 +451,7 @@ static int cs_etm_recording_options(struct auxtrace_r=
ecord *itr,
>          * timestamp tracing.
>          */
>         if (opts->sample_time_set)
> -               evsel__set_config_if_unset(cs_etm_pmu, cs_etm_evsel,
> -                                          "timestamp", 1);
> +               evsel__set_config_if_unset(cs_etm_evsel, "timestamp", 1);
>
>         /* Add dummy event to keep tracking */
>         err =3D parse_event(evlist, "dummy:u");
> diff --git a/tools/perf/arch/arm64/util/arm-spe.c b/tools/perf/arch/arm64=
/util/arm-spe.c
> index d5ec1408d0ae..51014f8bff97 100644
> --- a/tools/perf/arch/arm64/util/arm-spe.c
> +++ b/tools/perf/arch/arm64/util/arm-spe.c
> @@ -274,7 +274,7 @@ static void arm_spe_setup_evsel(struct evsel *evsel, =
struct perf_cpu_map *cpus)
>          */
>         if (!perf_cpu_map__is_any_cpu_or_is_empty(cpus)) {
>                 evsel__set_sample_bit(evsel, CPU);
> -               evsel__set_config_if_unset(evsel->pmu, evsel, "ts_enable"=
, 1);
> +               evsel__set_config_if_unset(evsel, "ts_enable", 1);
>         }
>
>         /*
> diff --git a/tools/perf/arch/x86/util/intel-pt.c b/tools/perf/arch/x86/ut=
il/intel-pt.c
> index b394ad9cc635..c131a727774f 100644
> --- a/tools/perf/arch/x86/util/intel-pt.c
> +++ b/tools/perf/arch/x86/util/intel-pt.c
> @@ -664,8 +664,7 @@ static int intel_pt_recording_options(struct auxtrace=
_record *itr,
>                 return 0;
>
>         if (opts->auxtrace_sample_mode)
> -               evsel__set_config_if_unset(intel_pt_pmu, intel_pt_evsel,
> -                                          "psb_period", 0);
> +               evsel__set_config_if_unset(intel_pt_evsel, "psb_period", =
0);
>
>         err =3D intel_pt_validate_config(intel_pt_pmu, intel_pt_evsel);
>         if (err)
> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
> index a08130ff2e47..2cf87bc67df7 100644
> --- a/tools/perf/util/evsel.h
> +++ b/tools/perf/util/evsel.h
> @@ -575,8 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>         ((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (s=
ize) - 1)))
>
>  u64 evsel__bitfield_swap_branch_flags(u64 value);
> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evse=
l,
> -                               const char *config_name, u64 val);
> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_=
name,
> +                               u64 val);
>
>  bool evsel__is_offcpu_event(struct evsel *evsel);
>
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 956ea273c2c7..e87c12946d71 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1382,8 +1382,8 @@ bool evsel__is_aux_event(const struct evsel *evsel)
>   * something to true, pass 1 for val rather than a pre shifted value.
>   */
>  #define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask=
))
> -void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evse=
l,
> -                               const char *config_name, u64 val)
> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_=
name,
> +                               u64 val)
>  {
>         u64 user_bits =3D 0, bits;
>         struct evsel_config_term *term =3D evsel__get_config_term(evsel, =
CFG_CHG);
> @@ -1391,7 +1391,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pm=
u, struct evsel *evsel,
>         if (term)
>                 user_bits =3D term->val.cfg_chg;
>
> -       bits =3D perf_pmu__format_bits(pmu, config_name);
> +       bits =3D perf_pmu__format_bits(evsel->pmu, config_name);
>
>         /* Do nothing if the user changed the value */
>         if (bits & user_bits)
>
> --
> 2.34.1
>

