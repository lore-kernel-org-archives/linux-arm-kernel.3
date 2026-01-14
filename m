Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D5AD38FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OI1+23JWX8FsCJMhCllis4rPC5JKUcNnLtovuqpzj+8=; b=3t/c0OKzCGTqkcENXhEhQcAcBH
	alK3dUiPQnIt9b9NPuqXYAvZqy6tZdE+3lRVk/If0H1woG9xchNYo7RZxXtVMYlNhKJr8UG3GvwuL
	k8prEvAPs7VvQty6DfqskK5CShREpG3nIbH66NesY8vGyzSs+t476wQl4yI8xqpJQXhbHddXDqhY8
	fuhGyjiNP7so40s69IluitAUxLSYbTqyV/+CV/ibYzmFMC/0GT+ekSP1mpBkHEVMpCHHvRr14bCP1
	iCwWA3m8IszWHjpvaPC9YZh+b46Yz9E34TkQXkQxL9iODxOEXER6GUcwYehGvBmcYKPj+tmPDcBxd
	3UyrjGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46m-0000000A01I-2Jxm;
	Wed, 14 Jan 2026 16:52:36 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg46U-00000009zml-29DH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:52:21 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a1462573caso91855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768409537; cv=none;
        d=google.com; s=arc-20240605;
        b=O0xc7KeKlV+Z3ZT/T3215jGljWbD7U//qjxSkpduiOlmWKGmmtelY6t2693syu9zz+
         cgWSS/l9aNwItzadZZL1EifuH2tT1UVbJ7UkT+sJ0DimOUEHvShTEm/XG2RFWvnz19P6
         y/EbWWaL0GiOP9ORPEmnkPTcNUh7LrpuRHmKAxMftPLUfEg1LNAcQXC8XJKqBlAZOMnj
         LSh2UQshp+w4UWwHSD1xsD7UrbWPE1/gHx5KHLsIymfr/mFPD2+kdJ4WizHpUGp2pBS8
         t175advL2empfaU5Tu7CfWd2SOFZRl2UbuFdVsXLIprYlOA5Ts4v35AC3x0rdfr4be20
         KU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OI1+23JWX8FsCJMhCllis4rPC5JKUcNnLtovuqpzj+8=;
        fh=Kra5hHLM8KmoyLU+OYplz3x2kIKLKInJJIfKwMzX3OA=;
        b=H481nD+GVllYJp4Utto7MDlciMc8dIDGbXbpsxCEa+IwP0mr+VEfYAQk1GBYDRZnET
         8GA5kG3FxuO5rKe2uvVpiouapPfycAKeHKTrcBWdV6U1MZLTo5rYnS+XzXw+utpTWgbh
         OsE1XO2X2Red7bkjvF7kPpCx28ARsIjrHqbibAAwY6RSeWRJuP17zCrgkv729sCzZ/tF
         pTj5VXINHy3a3Gq/gCUtywMZ7gTyL+zMDFW2yGEEikhEKm9uZoR4cNyh4TDwehm0uJ9V
         u8EmDQ9Ic0HOSMCrjt4oDC+ybuaxYS1+JjGzGeeAdABuDt20IMayT9At5xbTfw7SCZbn
         BTog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768409537; x=1769014337; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OI1+23JWX8FsCJMhCllis4rPC5JKUcNnLtovuqpzj+8=;
        b=Bnh8kG+nlPEgW5R5oaUoFKDU5z1dcNq2nhF95JRUAB+hzjKNnKYsl1bVRX1M5V16Sq
         3bYXwnGIYE5rhreLJBzxyE/odS5x8i8Jz1Wz2dJ4JxlP9aGnaPKlp5dqmPR/UD3Fm4a2
         0foAFf0vPbwcmZyjHRP7R0Ap3eB6HTLvdbPo8t6FqaTlGyHl/gjmQyoNG7GvKkOMUy7e
         pS/KlyUZyovSLb2BXFBaFSDFNyOsUfHd1iN9hxvn3XC6V+edfCRRSsH1rscoDHF3lBM1
         b6LPzpUPUMo256TXoW+TZ58O8HUkZAeDgXtB6VpbklxGe1AR1CzI06qz0mWV0caT5ODX
         y6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768409537; x=1769014337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OI1+23JWX8FsCJMhCllis4rPC5JKUcNnLtovuqpzj+8=;
        b=oFU5XR03GR+T+Nfrezd2wNbK2Vy+921XHyzguCpKi1Cq2HwO4BWIfeFkU7/RzIGD/n
         qrfxgizq3W7HUX0S4Q87Z3cWsBGr9KY6u61PS8ozqjIlbCDhBzDM8jw9kch5SLGWFfXw
         4LyVU63RcPmOoukplh9rcr86/496ThiFU3sU2O70ClHC5QcRIAP/XGC6Ch1biFo5pu7Z
         cUeb2gDYCoe5LPYy1LBc6QPl4C7l/nI3418HONwy2pJwCwaeLKCEmOoFznGPCU7ydUvA
         zOAlptv8sP2VHSi1YakuKeJEWRsO3OQDvtToYUej9Cs3boQFoZRdLlbkekFUkDFqu1uW
         SCfA==
X-Forwarded-Encrypted: i=1; AJvYcCXkNbluD5VlpexFC+pX78klErQ2JBWO6yDFO/8qgfTs93C+W7xc0wX2cJYe7ZNuIsFYG0VxDwNAc0VGZojeS1y1@lists.infradead.org
X-Gm-Message-State: AOJu0YxVKIA+mwu8VqGb9o/PnB8jmUEk0zFtncfMYfcTLiR7RzUwKXrR
	GDfOVgiiGxk6ZruSvDhhi9xpDET+TYUNRaEvvc9QzojO2xyF0T9vkqlBTR8UTGtUS3s+P2BjpK4
	6iF0b4ites9T2xLV4pTQQAuFXBHTITme273GNRhPm
X-Gm-Gg: AY/fxX7IDUCreHVt7N5Y37jdgbLqvy3CgFYg0+l5os1Cra+7Y/SgkvSVybD+RIywT71
	ZtVuPZ4eI1m14ZacUSWkShslG8hBoeh0KHXdWVE3CRfD6LkWW9I/40vaxTTmFLut9KvGdt8DBE+
	G1zvqbf9zlBcsIJgGf5UBrY9fTmnK2YWPAKb8G738jQdo+MhOGItdsWK8JAoi7hOEXaHa9LNknd
	cAbuDplaZteE/QfWOMeHF6IP6zyYrgTzcTkkWPayf575kVlqMcrFL/yV0WRJgXTMjvzeByhTcCY
	DaCPYFH2AuWTp5v1NHGwzkWxMA==
X-Received: by 2002:a17:903:2b06:b0:297:dad6:fe58 with SMTP id
 d9443c01a7336-2a599977232mr3419075ad.0.1768409537092; Wed, 14 Jan 2026
 08:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20260114-james-perf-config-bits-v5-0-0ef97aaf1ac0@linaro.org> <20260114-james-perf-config-bits-v5-3-0ef97aaf1ac0@linaro.org>
In-Reply-To: <20260114-james-perf-config-bits-v5-3-0ef97aaf1ac0@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 14 Jan 2026 08:52:05 -0800
X-Gm-Features: AZwV_QiKCUV62tv-YCq7vPDV3_F8u4hrLGMT5SirXiVOr8SHGdpodOsJ0fMh5j8
Message-ID: <CAP-5=fUhHJOiWCKZVKNpRYMvM-6c=xAaqwwSz=bpZSk=X-QKeQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/14] perf evsel: Move evsel__* functions to evsel.c
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
X-CRM114-CacheID: sfid-20260114_085218_975189_72EAD48B 
X-CRM114-Status: GOOD (  28.24  )
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
> At least one of these were put here to avoid a Python binding linking
> issue which is no longer present. Put them back in their correct
> location to avoid confusion about which file to add a new evsel__*
> function to later.
>
> Link: https://lore.kernel.org/all/ZEbAS2yx2fguW60w@kernel.org/
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/util/evsel.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  tools/perf/util/pmu.c   | 40 ----------------------------------------
>  2 files changed, 40 insertions(+), 40 deletions(-)
>
> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> index ec6552a6f667..21878e9bd029 100644
> --- a/tools/perf/util/evsel.c
> +++ b/tools/perf/util/evsel.c
> @@ -1314,6 +1314,35 @@ struct evsel_config_term *__evsel__get_config_term=
(struct evsel *evsel, enum evs
>         return found_term;
>  }
>
> +/*
> + * Set @config_name to @val as long as the user hasn't already set or cl=
eared it
> + * by passing a config term on the command line.
> + *
> + * @val is the value to put into the bits specified by @config_name rath=
er than
> + * the bit pattern. It is shifted into position by this function, so to =
set
> + * something to true, pass 1 for val rather than a pre shifted value.
> + */
> +#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask=
))
> +void evsel__set_config_if_unset(struct evsel *evsel, const char *config_=
name,
> +                               u64 val)
> +{
> +       u64 user_bits =3D 0, bits;
> +       struct evsel_config_term *term =3D evsel__get_config_term(evsel, =
CFG_CHG);
> +
> +       if (term)
> +               user_bits =3D term->val.cfg_chg;
> +
> +       bits =3D perf_pmu__format_bits(evsel->pmu, config_name);
> +
> +       /* Do nothing if the user changed the value */
> +       if (bits & user_bits)
> +               return;
> +
> +       /* Otherwise replace it */
> +       evsel->core.attr.config &=3D ~bits;
> +       evsel->core.attr.config |=3D field_prep(bits, val);
> +}
> +
>  void __weak arch_evsel__set_sample_weight(struct evsel *evsel)
>  {
>         evsel__set_sample_bit(evsel, WEIGHT);
> @@ -4098,6 +4127,17 @@ void evsel__set_leader(struct evsel *evsel, struct=
 evsel *leader)
>         evsel->core.leader =3D &leader->core;
>  }
>
> +bool evsel__is_aux_event(const struct evsel *evsel)
> +{
> +       struct perf_pmu *pmu;
> +
> +       if (evsel->needs_auxtrace_mmap)
> +               return true;
> +
> +       pmu =3D evsel__find_pmu(evsel);
> +       return pmu && pmu->auxtrace;
> +}
> +
>  int evsel__source_count(const struct evsel *evsel)
>  {
>         struct evsel *pos;
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index e87c12946d71..e3a1f26213ec 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1362,46 +1362,6 @@ void perf_pmu__warn_invalid_formats(struct perf_pm=
u *pmu)
>         }
>  }
>
> -bool evsel__is_aux_event(const struct evsel *evsel)
> -{
> -       struct perf_pmu *pmu;
> -
> -       if (evsel->needs_auxtrace_mmap)
> -               return true;
> -
> -       pmu =3D evsel__find_pmu(evsel);
> -       return pmu && pmu->auxtrace;
> -}
> -
> -/*
> - * Set @config_name to @val as long as the user hasn't already set or cl=
eared it
> - * by passing a config term on the command line.
> - *
> - * @val is the value to put into the bits specified by @config_name rath=
er than
> - * the bit pattern. It is shifted into position by this function, so to =
set
> - * something to true, pass 1 for val rather than a pre shifted value.
> - */
> -#define field_prep(_mask, _val) (((_val) << (ffsll(_mask) - 1)) & (_mask=
))
> -void evsel__set_config_if_unset(struct evsel *evsel, const char *config_=
name,
> -                               u64 val)
> -{
> -       u64 user_bits =3D 0, bits;
> -       struct evsel_config_term *term =3D evsel__get_config_term(evsel, =
CFG_CHG);
> -
> -       if (term)
> -               user_bits =3D term->val.cfg_chg;
> -
> -       bits =3D perf_pmu__format_bits(evsel->pmu, config_name);
> -
> -       /* Do nothing if the user changed the value */
> -       if (bits & user_bits)
> -               return;
> -
> -       /* Otherwise replace it */
> -       evsel->core.attr.config &=3D ~bits;
> -       evsel->core.attr.config |=3D field_prep(bits, val);
> -}
> -
>  static struct perf_pmu_format *
>  pmu_find_format(const struct list_head *formats, const char *name)
>  {
>
> --
> 2.34.1
>

