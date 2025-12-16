Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224CFD637AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ukuk6hNM0rhIIJoAwXdQKqwGGG0/U9BA+D9A0gMIbO4=; b=gpbtLcoYNE+sOLRHqBVF1JNoc6
	XvBizUZY0lUsQag3BcROGUiNNkt3B767i2RHNlTCAR4N9+AbjAHU6+f1TbvI54KtL8VGQZJ9DNLzv
	qQJPdQ9Mrn8PHUaqOkczjuh7d6mJTJU5xAi+0unkjJfrsywqFmyX293ppHpHJDp3zhiVqiTdjTwb5
	OIIYKMZt4IrKV3mmCTVA2ytj0wiYHfjxkekx5cslkgflrwHKR50BtfLgpl8fHtrBFynZFJVVB4c+5
	tQ5MGDVAPn6xFYIDO/wvCG3XTvRP4c81gdD1Ehz4BScg0zHcFPfFBFgpaM8PdvcF0THGfJTns1Lyx
	Jj0Mv/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbpS-00000005nZr-40yL;
	Tue, 16 Dec 2025 20:39:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVbpQ-00000005nZL-2sEL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 20:39:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-29e0753e5d8so7295ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Dec 2025 12:39:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765917567; cv=none;
        d=google.com; s=arc-20240605;
        b=aqPYAAfOQjtga3ox7flv3AszpJHZwIFIycU17e0QkEPvLFBnyEBLYU+0U2mBP8e/qG
         yHolb1vdAL14T7mtTF3SthNOgtH2cgGf/4+npnu4uBBrsaO9cZOJKK5UN4yXTfYNyD+e
         U2qEmgVOyrHjQ4/Ja1lkq1T3bq54NLcwFt5JohrsEoaRt6hB4fO964n3A1TIj87vxJyT
         Icdqw+o4/lcL7sz6Ee2A/3WdSBAecCJAxXY9NG4kRaL6sF6JukVTMKZVhL4xFqIUg27g
         l5D+e6u7gw2cI7gl4ja8Iw1dcBj1YnfRcApU1GsHd+1ebfI4yqlS7IvJatJP/9SwFkck
         Z7yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ukuk6hNM0rhIIJoAwXdQKqwGGG0/U9BA+D9A0gMIbO4=;
        fh=ghDXChDWpVmsyizuyyuoIYbsGbHSqsd+ECBU1yDBDmQ=;
        b=TPRCHtzvB03jlxwv7PjthNOPperbRfaxj4+8s4YJP0J4edVu6FZ8Q2NRg6STniPbZ6
         puwtZ+9FtMfWr5jy6PH8YOpcnJPBlZkPqaVnoF0lBgdRxd93Lci7rJi7Nj3vGjToIymc
         tqK6kHc5DX/eKnVnzMxL/Bg87aDPYlAGC5mucxFBYfSfUbdcDTpE/+usQRmp1w44MlKc
         CKH/websQws9lSDYv0g4WMDaSFChR7503KtTCMMUNZk9cYXW/Pzxsnzz3ih/EBG5nqKi
         qqkwfml/SrPPkzYJXMV+mF/9Kt6eirXKT0eJ4Ueu2COAxlGkKWP9bOznDQleapIegBmJ
         cwDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765917567; x=1766522367; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ukuk6hNM0rhIIJoAwXdQKqwGGG0/U9BA+D9A0gMIbO4=;
        b=JhfE1s8tJ8/TsXUKTQH/t7VI7tDxlSoKuNMA0k7yOu1kDgaoZU/y+Qr3ixL4EN9gZy
         p1L3Tj5fJv8LpsqrEvBSSwboU0j/OUAko/SM4SjbSiBFPUvEhyjodh26lnwDHhGT4cDH
         re6B0MQMVe6CFNpAcB1WadTzoc01+O/jdfFrQW+s/7aAHhpCoV15ls6voO+Ijjx6MXkQ
         ik36/gNPZUxcBqhnezAkoCThoeKOQyS+DVzgQv+TM09q5yu58uGepbHVYFS1yK//dN9x
         Sfuh54Q0varPdy/5Q4fwvqwde+u5kr/ihJNt8aiegJkaIYN9lNFxxY5krQBv6497EeFc
         Xulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765917567; x=1766522367;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ukuk6hNM0rhIIJoAwXdQKqwGGG0/U9BA+D9A0gMIbO4=;
        b=W1zyxxjpPAyWputU8V1Ee8zPJ2CrcAO7J65VQJngiMYXz+ebA7Phd98PCthJUkOhYO
         sL+e+B3qs//NvNWZoYAYv3alTyErTsJqKU/Vu6/vwU9jxfSrINlBugoMsCq4cAnGlnj9
         SVbYs5TzE0cZyGs9pVuBDFpDp8MCv55NnsHp8jJFsn78Wf3DzBhf16g+5tO5m7q9RTf5
         LOpCf9h4hvhed0q96FsBdUkXQsckX9Vd6DKe35+aexDtuwmTlKgX4RZZXw0btSY6lpnx
         baaUM8NcP/vEUH9lmevrA31dpm1+hOkc7vq6XiuamEJ84gqxMRHn5XnS0SnC3Ry0stDk
         GrRA==
X-Forwarded-Encrypted: i=1; AJvYcCWj7mTAJJTUHLmzsD/1JM2/MfWtj+kEhL3815D9Dxu8Wpkf2lu6+U1O4+te69diETXMmlsdi1u0d5rKW/gP8gTD@lists.infradead.org
X-Gm-Message-State: AOJu0YwJwt/V5RUCHnJAR8UnRzYytd1kSZ6zUkKcuwZBoKA6qD/dmAqe
	xQATj0Z822xdqAoNZKmsZ3XleAxIBTLZh1poef0cAULfcDI8UkCtNdBKt/rNaEcpWmAsXsczzB4
	hc50h2/j/grvVMuO0iA/xzzGSufVC59XCHMwOfHU/
X-Gm-Gg: AY/fxX58aSaVI5fC6qtwzuVKG8qKVuZ85j/KT4zmcYcf9eIF8OLrSa3LIZ1LhMLQIVp
	EulKTAcq2kjvTnA3wvQy1kIq6mueniNcMGr/2uuroHZPWWEK2Uf+CC38RNc8ya6X6f/RFT6hQs+
	LNFuOLh7ACq1dKmvoy83e74/c0f9MbdGXGrR6bo4eo6ld8xpt7bvgGwWVZmkc+eOzoBwIPUPNp6
	Jse8lTas9orgOVAtl0tw0W5X8586HDS/W19/+RWh6aBqR2fy2nNo4HS+vHaR7ZJWWs++/6s8q8o
	gXoiMJERrhTuKZtfVNsEPfzoPg==
X-Google-Smtp-Source: AGHT+IFbtromBH6vAzZR3khshhkq7zEpAfWZpYBVhFN1J0nhsZlubwpQbDkoQhPYSPVohaFwBMJplA+PSSewgLadUlI=
X-Received: by 2002:a17:902:e552:b0:294:d42c:ca0f with SMTP id
 d9443c01a7336-2a15f24dc5emr588085ad.2.1765917566615; Tue, 16 Dec 2025
 12:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20251212-james-perf-config-bits-v3-0-aa36a4846776@linaro.org> <20251212-james-perf-config-bits-v3-3-aa36a4846776@linaro.org>
In-Reply-To: <20251212-james-perf-config-bits-v3-3-aa36a4846776@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 16 Dec 2025 12:39:15 -0800
X-Gm-Features: AQt7F2o23fY33OmRwFHSMOklIQAwK0RjO2RcUW0zisLbAmMBE5vBP7v2D-DGMhY
Message-ID: <CAP-5=fUBSOHcK5rjJgyJed3PkgLb_dMys_qDNu=Cy_18faLX_Q@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] perf parse-events: Track all user changed config bits
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
X-CRM114-CacheID: sfid-20251216_123928_736926_DE5CECB9 
X-CRM114-Status: GOOD (  25.49  )
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
> Currently we only track which bits were set by the user in attr->config.
> But all configN fields should be treated equally as they can all have
> default and user overridden values.
>
> Track them all by making get_config_chgs() generic and calling it once
> for each config value.
>
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
>  tools/perf/util/evsel.c        |  6 ++-
>  tools/perf/util/evsel_config.h |  6 ++-
>  tools/perf/util/parse-events.c | 98 +++++++++++++++++++++++-------------=
------
>  tools/perf/util/pmu.c          |  2 +-
>  4 files changed, 65 insertions(+), 47 deletions(-)
>
> diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
> index 9cd706f6279313c2cc53eba1adbd45f352090f75..dcadf022405d398bf394b3da7=
f0db5c81a3ec268 100644
> --- a/tools/perf/util/evsel.c
> +++ b/tools/perf/util/evsel.c
> @@ -1242,7 +1242,11 @@ static void evsel__apply_config_terms(struct evsel=
 *evsel,
>                 case EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE:
>                         /* Already applied by auxtrace */
>                         break;
> -               case EVSEL__CONFIG_TERM_CFG_CHG:
> +               case EVSEL__CONFIG_TERM_USR_CHG_CONFIG:
> +               case EVSEL__CONFIG_TERM_USR_CHG_CONFIG1:
> +               case EVSEL__CONFIG_TERM_USR_CHG_CONFIG2:
> +               case EVSEL__CONFIG_TERM_USR_CHG_CONFIG3:
> +               case EVSEL__CONFIG_TERM_USR_CHG_CONFIG4:
>                         break;
>                 case EVSEL__CONFIG_TERM_RATIO_TO_PREV:
>                         rtp_buf =3D term->val.str;
> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_confi=
g.h
> index 685fd8d5c4a88fb8ae601ded60c1fc36dde73403..7b565d76c0bc4277effbbf950=
110986b423f571c 100644
> --- a/tools/perf/util/evsel_config.h
> +++ b/tools/perf/util/evsel_config.h
> @@ -27,7 +27,11 @@ enum evsel_term_type {
>         EVSEL__CONFIG_TERM_AUX_OUTPUT,
>         EVSEL__CONFIG_TERM_AUX_ACTION,
>         EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE,
> -       EVSEL__CONFIG_TERM_CFG_CHG,
> +       EVSEL__CONFIG_TERM_USR_CHG_CONFIG,
> +       EVSEL__CONFIG_TERM_USR_CHG_CONFIG1,
> +       EVSEL__CONFIG_TERM_USR_CHG_CONFIG2,
> +       EVSEL__CONFIG_TERM_USR_CHG_CONFIG3,
> +       EVSEL__CONFIG_TERM_USR_CHG_CONFIG4,
>         EVSEL__CONFIG_TERM_RATIO_TO_PREV,
>  };
>
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index 46422286380f33a48087e7079a45bb21beb2d573..7ef63b808d0542999fd1303b9=
f94cae68e38030f 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -1253,66 +1253,32 @@ static int get_config_terms(const struct parse_ev=
ents_terms *head_config,
>         return 0;
>  }
>
> -/*
> - * Add EVSEL__CONFIG_TERM_CFG_CHG where cfg_chg will have a bit set for
> - * each bit of attr->config that the user has changed.
> - */
> -static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_ter=
ms *head_config,
> -                          struct list_head *head_terms)
> +static int add_cfg_chg(struct perf_pmu *pmu,
> +                      struct parse_events_terms *head_config,

nit: the head_config could be made const here.

> +                      struct list_head *head_terms,
> +                      int format_type,
> +                      enum parse_events__term_type term_type,
> +                      enum evsel_term_type new_term_type)
>  {
>         struct parse_events_term *term;
>         u64 bits =3D 0;
>         int type;
>
>         list_for_each_entry(term, &head_config->terms, list) {
> -               switch (term->type_term) {
> -               case PARSE_EVENTS__TERM_TYPE_USER:
> +               if (term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_USER) =
{
>                         type =3D perf_pmu__format_type(pmu, term->config)=
;
> -                       if (type !=3D PERF_PMU_FORMAT_VALUE_CONFIG)
> +                       if (type !=3D format_type)
>                                 continue;
>                         bits |=3D perf_pmu__format_bits(pmu, term->config=
);
> -                       break;
> -               case PARSE_EVENTS__TERM_TYPE_CONFIG:
> +               } else if (term->type_term =3D=3D term_type) {
>                         bits =3D ~(u64)0;
> -                       break;
> -               case PARSE_EVENTS__TERM_TYPE_CONFIG1:
> -               case PARSE_EVENTS__TERM_TYPE_CONFIG2:
> -               case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> -               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> -               case PARSE_EVENTS__TERM_TYPE_LEGACY_HARDWARE_CONFIG:
> -               case PARSE_EVENTS__TERM_TYPE_LEGACY_CACHE_CONFIG:
> -               case PARSE_EVENTS__TERM_TYPE_NAME:
> -               case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> -               case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> -               case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
> -               case PARSE_EVENTS__TERM_TYPE_TIME:
> -               case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
> -               case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
> -               case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
> -               case PARSE_EVENTS__TERM_TYPE_INHERIT:
> -               case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
> -               case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
> -               case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
> -               case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
> -               case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
> -               case PARSE_EVENTS__TERM_TYPE_PERCORE:
> -               case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
> -               case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
> -               case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
> -               case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
> -               case PARSE_EVENTS__TERM_TYPE_RAW:
> -               case PARSE_EVENTS__TERM_TYPE_CPU:
> -               case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
> -               default:
> -                       break;
>                 }
>         }
>
>         if (bits) {
>                 struct evsel_config_term *new_term;
>
> -               new_term =3D add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
> -                                          head_terms, false);
> +               new_term =3D add_config_term(new_term_type, head_terms, f=
alse);
>                 if (!new_term)
>                         return -ENOMEM;
>                 new_term->val.cfg_chg =3D bits;
> @@ -1321,6 +1287,50 @@ static int get_config_chgs(struct perf_pmu *pmu, s=
truct parse_events_terms *head
>         return 0;
>  }
>
> +/*
> + * Add EVSEL__CONFIG_TERM_USR_CFG_CONFIGn where cfg_chg will have a bit =
set for
> + * each bit of attr->configN that the user has changed.
> + */
> +static int get_config_chgs(struct perf_pmu *pmu,
> +                          struct parse_events_terms *head_config,
> +                          struct list_head *head_terms)
> +{
> +       int ret;
> +
> +       ret =3D add_cfg_chg(pmu, head_config, head_terms,
> +                         PERF_PMU_FORMAT_VALUE_CONFIG,
> +                         PARSE_EVENTS__TERM_TYPE_CONFIG,
> +                         EVSEL__CONFIG_TERM_USR_CHG_CONFIG);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D add_cfg_chg(pmu, head_config, head_terms,
> +                         PERF_PMU_FORMAT_VALUE_CONFIG1,
> +                         PARSE_EVENTS__TERM_TYPE_CONFIG1,
> +                         EVSEL__CONFIG_TERM_USR_CHG_CONFIG1);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D add_cfg_chg(pmu, head_config, head_terms,
> +                         PERF_PMU_FORMAT_VALUE_CONFIG2,
> +                         PARSE_EVENTS__TERM_TYPE_CONFIG2,
> +                         EVSEL__CONFIG_TERM_USR_CHG_CONFIG2);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D add_cfg_chg(pmu, head_config, head_terms,
> +                         PERF_PMU_FORMAT_VALUE_CONFIG3,
> +                         PARSE_EVENTS__TERM_TYPE_CONFIG3,
> +                         EVSEL__CONFIG_TERM_USR_CHG_CONFIG3);
> +       if (ret)
> +               return ret;
> +
> +       return add_cfg_chg(pmu, head_config, head_terms,
> +                          PERF_PMU_FORMAT_VALUE_CONFIG4,
> +                          PARSE_EVENTS__TERM_TYPE_CONFIG4,
> +                          EVSEL__CONFIG_TERM_USR_CHG_CONFIG4);
> +}
> +
>  int parse_events_add_tracepoint(struct parse_events_state *parse_state,
>                                 struct list_head *list,
>                                 const char *sys, const char *event,
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index 2c26c8d76bed920c7b5b43beb867e4d1bcaa2970..e02f74d4020c151082ecc434c=
29c0ec4c2c9b2c8 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1387,7 +1387,7 @@ void evsel__set_config_if_unset(struct perf_pmu *pm=
u, struct evsel *evsel,
>                                 const char *config_name, u64 val)
>  {
>         u64 user_bits =3D 0, bits;
> -       struct evsel_config_term *term =3D evsel__get_config_term(evsel, =
CFG_CHG);
> +       struct evsel_config_term *term =3D evsel__get_config_term(evsel, =
USR_CHG_CONFIG);
>
>         if (term)
>                 user_bits =3D term->val.cfg_chg;
>
> --
> 2.34.1
>

