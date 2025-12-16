Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A2CD637A9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LLx7o8qacULiY5CnsYaJ+nvNRuzxxG70dIx5GLh8eU=; b=pwMFNeY7YV2plBJf6kJ2mtjLSO
	fXXNfH/aa3GbcKXANBD75HMGd0wBHRCBcjAI4qSbls1SzoJes90TNs6T15lXv/frNxa7JCi/1dwVE
	Vz1yUCARmTSyYym8d0AbiegGPSSe5xL926UFeueCCxEj+yrClPze4vKdnwzgBpbvG9pW3YEJpBehu
	qnfbgYwmFQsPvevcdx5VHjjm5inwxpD5LZaW3oScAJNb3uuqE/xylhBudLzPQtDAv6mx7WhaQXBWX
	SE3xhElz1PCTPwiFXawWdXpkrrhhKCOkkvIOqy66n7wJYydhRrK3VbXRoiMd0wGxeKJcXnoWLUFw4
	UBSQBUzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbuh-00000005npC-1JzG;
	Tue, 16 Dec 2025 20:44:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbuf-00000005noo-0335
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 20:44:54 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f02651fccso41215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 12:44:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765917892; cv=none;
        d=google.com; s=arc-20240605;
        b=fcNwBQNTdrYpUl744Zp6y/aEvAg/NUkpWgYYnQ0nB94iE3aBuHdUXCABapnuR+Z0jx
         WFRHJMJDGU31WuCcgEI/IYd6imhhP952RPWFODCacaHGd41ngOE8e46KAvUxI8Nb86Vx
         abtmeOJYQFX78ePXljStePAxFadZa4xkMoAgy6PmokeJBKsMb7byIsVpM8aBGsXH7dBl
         7KxVvYb+fGzH6ATMCWJma+nwfIaoQ5Hu7r4zx7GdgN6Z9SI51wLaTcuoWRYf+olIu/yx
         BCqRfL6K96BM4UiN6czr8213vzNrXQqXUPK+wE7EHXzhz0KOUiupISmG1CqPbxa/5hQM
         zxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2LLx7o8qacULiY5CnsYaJ+nvNRuzxxG70dIx5GLh8eU=;
        fh=sEoUCSvRcAl0r1s3qdft/gx1z9Xp0aRoOiGnAcrO8Yg=;
        b=ZAiOyzYYAvXJoAE03vGHVRVrBbgtpVWuxxTvNQ5BZmNDp/vLWv4EQI/MDuOK5VVoNr
         jhEsBb7RTlS2u6TGVh7xSzn8pGjoZemnx+Jiey8xfTy3Qb3iPf+lnfGlvub91kr+FflQ
         t2NLDYHpsFlI1ZFZ4i70qxvtIzeKZnQuKv608ds73Zj7Mxk+77pIOWCsawYON8UBEEA6
         M3Us13RrpRZs/v4FanJ8Pm2WbmNdc2RUtZwWoiCnF2QibH4tTNL66Z7HVWWPXr5KC7Ru
         LkT8wEIKBZf/zRD1sLx/kCmDQm13jaMI+KNpJthxPjbdotW3unLvaXJxuJDTS7nVBbjb
         XN4g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765917892; x=1766522692; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LLx7o8qacULiY5CnsYaJ+nvNRuzxxG70dIx5GLh8eU=;
        b=MX/BOaJ5exlWfpO36uqaEGGVm+ZQ2v0EMI4ZyTphEXAM9ODn3J+L/iUbiTLTNAuX41
         QNt/54W/r2/bZSrohT3VNM32I5NTT7g32k/VTNIG+hfnGUzK+nQk/SOAEOTxCmRer4ls
         B4mOxiTS0bsyzYmGc+pyI1H09y12NZEHmTRfwdRLYBSAY4+8Ld9sTR6saR2v2EXGs3uF
         5zE/p8sn9EVXcbNdlfobUy/6plsc3Awr2GeiEC9N6aonieInOSW/wHzV6UsELCrLjlOw
         M4wYMyYD4XaPnrs8OP4aqQU/bs3M5D3zA9F4aYfIGVe54aTon+9iUqQecxok0WYeE/Pe
         6XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765917892; x=1766522692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LLx7o8qacULiY5CnsYaJ+nvNRuzxxG70dIx5GLh8eU=;
        b=nPSYD4cpq/LNoTBykgLASOqSIVZVu7qBaYZk7TniKusKpmVmn/bBRqrwGn2/3VWFfr
         Fr2sP6RY+x8dxyanl7h2sRyDMWTjzUeoxqG1d3Zh5/vERLAoOxSXPfyhetlysMGjjM4J
         kT5nsLyhA23vo+V8zXgjnCRFs1L34ttkuys9Vfn7waBiS/GFiSSTDrMPzxnY9amM4tsw
         s4BXEVUcYLGWqbXZ/kPB/r8BASe9lFueZs1pUNWbZTA8ba0eaqh6gLDyorh2pERcmwI+
         ZJlc6U5CcuDg4ZJVvPqo5wjQlXFhTmDCfbiVqblUJ7SUphW0sHCWM37U11YR4fHJJjhn
         fNkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUDt6hYkmG+xhQfgweEdXcJDwhMrrcmNtoW5/VOFgzvX0Em4EuJQqwQabFpLVNB6IxII5TdWI1wOnYemsZfOWe@lists.infradead.org
X-Gm-Message-State: AOJu0YyzAl1PXttwzvPhsvDX693FRx0zkec0wjXrJce4JmouQWx0v2DG
	xYXCnP1RI9nR8Lq88q8lErjKMawIO0o5CU/ggfM3Hxp8V7jjnn4kTw44FJQoJfkgjlIdGJ46p9H
	y1tZzbkq32Z6eWfY23/CmGV24c5mGbzP4yVoeWc35
X-Gm-Gg: AY/fxX5J2jZekjw6uwuNGDuf2zUOd+ppFTkwRYzECh+YoXEztUPInXdRlgdDBIFrhWE
	1IvFlysIdXV+/69aRusFih2kuTz98gI+mnw3prsKnZc9Np3eT8YgUzoeVavSRX1BxKXzdkbBtCN
	NtUor1EnKOUfuv/pIMF2eGwIrPSK2ifdbuB9xlNh9CA8QWxn+2rWs1xYD1XBMd7m9gfL9mq7/XC
	DAHQc+3Yr9QhpnM3G8jFllEy0xsc1W1SCbnIZgej5KR+ZcUkQX++NQb5TFfYYP2Vmu1TLIGroPV
	6F4KMTeSBwDR376onDJeRL7pOQ==
X-Google-Smtp-Source: AGHT+IE6CjCFZBwbsdmegBB69hl7iVQBsVm/wpuAsXfRbt/LWg5fDNm8swZTLE0fwCiZj305lX7sT+/YotUXZ03uutM=
X-Received: by 2002:a17:903:46c5:b0:298:144f:b759 with SMTP id
 d9443c01a7336-2a15f32ceacmr409475ad.9.1765917891871; Tue, 16 Dec 2025
 12:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org> <20251212-james-perf-config-bits-v3-5-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-5-aa36a4846776@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Dec 2025 12:44:40 -0800
X-Gm-Features: AQt7F2rjA-Iq0O35uFlH-FSpbyzfTkG3lNU-Igxt37dlPKq959y9P2pH2UKNTRM
Message-ID: <CAP-5=fUbr56hFd7e7yt33-gnhEGGa72GLmShQ5bCHxQjFAbFCQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] perf evsel: Add a helper to get the value of a
 config field
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
X-CRM114-CacheID: sfid-20251216_124453_066954_72937E54 
X-CRM114-Status: GOOD (  31.48  )
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

On Fri, Dec 12, 2025 at 7:32=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> This will be used by aux PMUs to read an already written value for
> configuring their events and for also testing.
>
> Its helper pmu_format_unpack() does the opposite of the existing
> pmu_format_value() so rename that one to pmu_format_pack() so it's clear
> how they are related.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/evsel.h |  2 ++
>  tools/perf/util/pmu.c   | 77 ++++++++++++++++++++++++++++++++++++++++++-=
------
>  2 files changed, 68 insertions(+), 11 deletions(-)
>
> diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
> index a08130ff2e47a887b19f6c47bfa9f51e0c40d226..092904a61ec7afdc59253f9b7=
8a9fe8b7cb5bfa7 100644
> --- a/tools/perf/util/evsel.h
> +++ b/tools/perf/util/evsel.h
> @@ -575,6 +575,8 @@ void evsel__uniquify_counter(struct evsel *counter);
>         ((((src) >> (pos)) & ((1ull << (size)) - 1)) << (63 - ((pos) + (s=
ize) - 1)))
>
>  u64 evsel__bitfield_swap_branch_flags(u64 value);
> +int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
> +                         const char *config_name, u64 *val);
>  void evsel__set_config_if_unset(struct perf_pmu *pmu, struct evsel *evse=
l,
>                                 const char *config_name, u64 val);
>
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 514cba91f5d99b399d2d6a1e350971660c54a9fc..ef7358ad1fb955f29f2e68b3d=
0ce711754e4d67c 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -144,8 +144,8 @@ struct perf_pmu_format {
>  };
>
>  static int pmu_aliases_parse(struct perf_pmu *pmu);
> -static void pmu_format_value(unsigned long *format, __u64 value, __u64 *=
v,
> -                            bool zero);
> +static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v=
,
> +                           bool zero);
>  static struct perf_pmu_format *pmu_find_format(const struct list_head *f=
ormats,
>                                                const char *name);
>
> @@ -1377,6 +1377,61 @@ bool evsel__is_aux_event(const struct evsel *evsel=
)
>         return pmu && pmu->auxtrace;
>  }
>
> +/*
> + * Unpacks a raw config[n] value using the sparse bitfield that defines =
a
> + * format attr. For example "config1:1,6-7,44" defines a 4 bit value acr=
oss non
> + * contiguous bits and this function returns those 4 bits as a value.
> + */
> +static u64 pmu_format_unpack(u64 format, u64 config_val)
> +{
> +       int val_bit =3D 0;
> +       u64 res =3D 0;
> +       int fmt_bit;
> +
> +       for_each_set_bit(fmt_bit, &format, PERF_PMU_FORMAT_BITS) {
> +               if (test_bit(fmt_bit, &config_val))
> +                       res |=3D BIT_ULL(val_bit);
> +
> +               val_bit++;
> +       }
> +       return res;
> +}
> +
> +int evsel__get_config_val(struct perf_pmu *pmu, struct evsel *evsel,
> +                         const char *config_name, u64 *val)

nits:
This is an evsel__ function but the evsel is the 2nd argument not the first=
.
Why pass the PMU and not just read evsel->pmu (or better evsel__find_pmu) ?
Why not place this in evsel.c to match the header file declaration?
The evsel could be likely be const.

Thanks,
Ian

> +{
> +       struct perf_pmu_format *format =3D pmu_find_format(&pmu->format, =
config_name);
> +       u64 bits =3D perf_pmu__format_bits(pmu, config_name);
> +
> +       if (!format || !bits) {
> +               pr_err("Unknown/empty format name: %s\n", config_name);
> +               *val =3D 0;
> +               return -EINVAL;
> +       }
> +
> +       switch (format->value) {
> +       case PERF_PMU_FORMAT_VALUE_CONFIG:
> +               *val =3D pmu_format_unpack(bits, evsel->core.attr.config)=
;
> +               return 0;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG1:
> +               *val =3D pmu_format_unpack(bits, evsel->core.attr.config1=
);
> +               return 0;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG2:
> +               *val =3D pmu_format_unpack(bits, evsel->core.attr.config2=
);
> +               return 0;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG3:
> +               *val =3D pmu_format_unpack(bits, evsel->core.attr.config3=
);
> +               return 0;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG4:
> +               *val =3D pmu_format_unpack(bits, evsel->core.attr.config4=
);
> +               return 0;
> +       default:
> +               pr_err("Unknown format value: %d\n", format->value);
> +               *val =3D 0;
> +               return -EINVAL;
> +       }
> +}
> +
>  /*
>   * Set @config_name to @val as long as the user hasn't already set or cl=
eared it
>   * by passing a config term on the command line.
> @@ -1432,7 +1487,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pm=
u, struct evsel *evsel,
>                 return;
>
>         /* Otherwise replace it */
> -       pmu_format_value(&bits, val, vp, /*zero=3D*/true);
> +       pmu_format_pack(&bits, val, vp, /*zero=3D*/true);
>  }
>
>  static struct perf_pmu_format *
> @@ -1477,8 +1532,8 @@ int perf_pmu__format_type(struct perf_pmu *pmu, con=
st char *name)
>   * Sets value based on the format definition (format parameter)
>   * and unformatted value (value parameter).
>   */
> -static void pmu_format_value(unsigned long *format, __u64 value, __u64 *=
v,
> -                            bool zero)
> +static void pmu_format_pack(unsigned long *format, __u64 value, __u64 *v=
,
> +                           bool zero)
>  {
>         unsigned long fbit, vbit;
>
> @@ -1595,23 +1650,23 @@ static int pmu_config_term(const struct perf_pmu =
*pmu,
>                 switch (term->type_term) {
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> -                       pmu_format_value(bits, term->val.num, &attr->conf=
ig, zero);
> +                       pmu_format_pack(bits, term->val.num, &attr->confi=
g, zero);
>                         break;
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> -                       pmu_format_value(bits, term->val.num, &attr->conf=
ig1, zero);
> +                       pmu_format_pack(bits, term->val.num, &attr->confi=
g1, zero);
>                         break;
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> -                       pmu_format_value(bits, term->val.num, &attr->conf=
ig2, zero);
> +                       pmu_format_pack(bits, term->val.num, &attr->confi=
g2, zero);
>                         break;
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG3:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> -                       pmu_format_value(bits, term->val.num, &attr->conf=
ig3, zero);
> +                       pmu_format_pack(bits, term->val.num, &attr->confi=
g3, zero);
>                         break;
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> -                       pmu_format_value(bits, term->val.num, &attr->conf=
ig4, zero);
> +                       pmu_format_pack(bits, term->val.num, &attr->confi=
g4, zero);
>                         break;
>                 case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> @@ -1749,7 +1804,7 @@ static int pmu_config_term(const struct perf_pmu *p=
mu,
>                  */
>         }
>
> -       pmu_format_value(format->bits, val, vp, zero);
> +       pmu_format_pack(format->bits, val, vp, zero);
>         return 0;
>  }
>
>
> --
> 2.34.1
>

