Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28636C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aq5UWqCDWZg2jUBruTrKCignhLetlhTEoSWLRFlBvKY=; b=cjo7nyVWy1U2AY8oyPz9kKEglj
	oc1ztXOC0aFufEURcQN+IMqcl3/Bmjs3FRlDIBhU7ocZMK+aBSrV9XkeSLJiB2+u6Jy4pdVPk5Fm0
	4UP6joVWNpf2joA2/qnUyJV+lXN5KPdp4GRREYkth8L8C0Dm8gIQeBMaF7y1OmHieBYqK7wpvA0nZ
	M6o/TZulJYzkhYs/mGNcy/gYyTqeIFKyFbzQKbwQ8+3ufbD2hCN1oIrwfBlrUrbsjc8SjymV/BPaz
	4XP8dbzx0+UNGklzh/tDUhHYD+VfTN27+TT4qT3Kc6UvoVIFFm+A4k8o2oeRY9YLq4jM4taDi0WeE
	LaactM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh2V-0000000GHZq-04xZ;
	Thu, 29 May 2025 17:27:35 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKh0N-0000000GHKf-0HDJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 17:25:24 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so6385ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748539522; x=1749144322; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq5UWqCDWZg2jUBruTrKCignhLetlhTEoSWLRFlBvKY=;
        b=f6wtw87B+WmEZHtK4iqdGQgl2qKp2taxZ9whhoh32ZKZlKkjQiyxXvY0eWhvR0bb7U
         jAWfkcJAR/8jWFjo7quRKuJIre2LRYu6pfX+Rfh5XGIcgVpUwtUNaCKrsa5JHRoBIkdZ
         1wiI/smHm1Ugy1ZnvoyCs+qMOKTZ5Wd4Z57YIeYZGutm9MSJ6lQo7pvpZH1U381vjngP
         U8joEqSGySPNfDp0wJSVfONw5wKzqt05FRYf6y6BUDS+uAdD/PgJO8j+ex7cGdHR8377
         UmbX0MUpptA7neuX33ei/Wm0447HULRXnfbvB3cFoDqTCRKObuytvLHAP4JJf5tIl8YU
         gq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539522; x=1749144322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq5UWqCDWZg2jUBruTrKCignhLetlhTEoSWLRFlBvKY=;
        b=Y6ovnACThwqereFk2Dt/gS2b7t+J9n0D82E0G+hZUAVuJzq6Qz5ai2Z/AwjqYSjqkQ
         2eKf452bey7823LOZBF3O0LvILL/A8029tP38wz/RQdhFU98McevPrFvJcsoS5L/UUUI
         6azq3/95edA6pcYXF9bbyqTjbP6IpEXwO0CGe+xiuGIanBpS+r/YOq8VEBeYfvoriIyS
         9jQsUCY8zBlFV+PRTCg0Zam/Cu4E+r/tjtn0SOsBmm4xw8QvKbhGuFlZJ2kcq6rFb8SZ
         r4VHiI8WTsIxo8zs+/vpx/X7qkbmpMcdaPt+kDFggaS0u2ln0wzFYvCbUF+r1uqwuPup
         RuFg==
X-Forwarded-Encrypted: i=1; AJvYcCX0g7HKp/rCs7ykzPmgJn2IPGrZGCTjgu2BiS8+Hy1xAh00y2fIe6TeO71YLQ1/RDI7VKmJEifH2ERKHYhz+l8H@lists.infradead.org
X-Gm-Message-State: AOJu0Ywowmz85GsBjjQDLwft7LTWMr5xf6V1WEcOvTEY/vazD4/lpHDR
	HkWOIvIe3g77s4CrHa5vbXPQ696SDrciH4QpUq8LybCH9sVRpOy5aPGXy5Cje7Brd6C7NOHiGEi
	ukiF7HhULjLHzu4YHJ/yt1OOITRYo2mg9xJ5ABfLl
X-Gm-Gg: ASbGncvsXlaT3lNIraLBhqosI9mgF4zdgz8X9MWQ0E30u4Wa+9LLROlQqossUHVuEFN
	GO6U7n66TYlRXU9RNXv0Xel6Z7OdJc8snt4+MfjcjyTMLQO4jB2o+ez2Tv4hSZNHLRKEDfQbBeD
	v22pn2/0jKwlyIj6BwFFcgvakQQ1V/6ZhEjaXcMmx4cp0a4TK+ejvI9RLvXKSxfWIN7Ta1qICfZ
	ZoNk8OYkAs=
X-Google-Smtp-Source: AGHT+IEieB0z/jaUQ85p0bxGKF/BsfxceTJbHzW2dlAAgUo/3U0hH7+izTddIgjUp6yv6WeWDg6P6NOKrSVA54Daxp0=
X-Received: by 2002:a05:6e02:b4e:b0:3dc:8041:235b with SMTP id
 e9e14a558f8ab-3dd93102438mr3785775ab.5.1748539521790; Thu, 29 May 2025
 10:25:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org> <20250529-james-perf-feat_spe_eft-v2-10-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-10-a01a9baad06a@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 10:25:09 -0700
X-Gm-Features: AX0GCFsMi0PuJSkUZIq3glS5t7yiPh54_nxoMbLwC4oi0UtVw-ij7ss9J0KioO4
Message-ID: <CAP-5=fUOfEskPp_5myy167bpZ47NjavWU_8vAMpPo4TSWJRs-w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] perf tools: Add support for perf_event_attr::config4
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_102523_129823_3F4B016D 
X-CRM114-Status: GOOD (  24.54  )
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

On Thu, May 29, 2025 at 4:33=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> perf_event_attr has gained a new field, config4, so add support for it
> extending the existing configN support.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/parse-events.c | 14 +++++++++++++-
>  tools/perf/util/parse-events.c  | 11 +++++++++++
>  tools/perf/util/parse-events.h  |  1 +
>  tools/perf/util/parse-events.l  |  1 +
>  tools/perf/util/pmu.c           |  8 ++++++++
>  tools/perf/util/pmu.h           |  1 +
>  6 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-eve=
nts.c
> index 5ec2e5607987..5f624a63d550 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -615,6 +615,8 @@ static int test__checkevent_pmu(struct evlist *evlist=
)
>         TEST_ASSERT_VAL("wrong config1",    1 =3D=3D evsel->core.attr.con=
fig1);
>         TEST_ASSERT_VAL("wrong config2",    3 =3D=3D evsel->core.attr.con=
fig2);
>         TEST_ASSERT_VAL("wrong config3",    0 =3D=3D evsel->core.attr.con=
fig3);
> +       TEST_ASSERT_VAL("wrong config4",    0 =3D=3D evsel->core.attr.con=
fig4);
> +
>         /*
>          * The period value gets configured within evlist__config,
>          * while this test executes only parse events method.
> @@ -637,6 +639,7 @@ static int test__checkevent_list(struct evlist *evlis=
t)
>                 TEST_ASSERT_VAL("wrong config1", 0 =3D=3D evsel->core.att=
r.config1);
>                 TEST_ASSERT_VAL("wrong config2", 0 =3D=3D evsel->core.att=
r.config2);
>                 TEST_ASSERT_VAL("wrong config3", 0 =3D=3D evsel->core.att=
r.config3);
> +               TEST_ASSERT_VAL("wrong config4", 0 =3D=3D evsel->core.att=
r.config4);
>                 TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.e=
xclude_user);
>                 TEST_ASSERT_VAL("wrong exclude_kernel", !evsel->core.attr=
.exclude_kernel);
>                 TEST_ASSERT_VAL("wrong exclude_hv", !evsel->core.attr.exc=
lude_hv);
> @@ -813,6 +816,15 @@ static int test__checkterms_simple(struct parse_even=
ts_terms *terms)
>         TEST_ASSERT_VAL("wrong val", term->val.num =3D=3D 4);
>         TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config3"))=
;
>
> +       /* config4=3D5 */
> +       term =3D list_entry(term->list.next, struct parse_events_term, li=
st);
> +       TEST_ASSERT_VAL("wrong type term",
> +                       term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_CO=
NFIG4);
> +       TEST_ASSERT_VAL("wrong type val",
> +                       term->type_val =3D=3D PARSE_EVENTS__TERM_TYPE_NUM=
);
> +       TEST_ASSERT_VAL("wrong val", term->val.num =3D=3D 5);
> +       TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config4"))=
;
> +
>         /* umask=3D1*/
>         term =3D list_entry(term->list.next, struct parse_events_term, li=
st);
>         TEST_ASSERT_VAL("wrong type term",
> @@ -2451,7 +2463,7 @@ struct terms_test {
>
>  static const struct terms_test test__terms[] =3D {
>         [0] =3D {
> -               .str   =3D "config=3D10,config1,config2=3D3,config3=3D4,u=
mask=3D1,read,r0xead",
> +               .str   =3D "config=3D10,config1,config2=3D3,config3=3D4,c=
onfig4=3D5,umask=3D1,read,r0xead",
>                 .check =3D test__checkterms_simple,
>         },
>  };
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index 5152fd5a6ead..7e37f91e7b49 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -247,6 +247,8 @@ __add_event(struct list_head *list, int *idx,
>                                               PERF_PMU_FORMAT_VALUE_CONFI=
G2, "config2");
>                 perf_pmu__warn_invalid_config(pmu, attr->config3, name,
>                                               PERF_PMU_FORMAT_VALUE_CONFI=
G3, "config3");
> +               perf_pmu__warn_invalid_config(pmu, attr->config4, name,
> +                                             PERF_PMU_FORMAT_VALUE_CONFI=
G4, "config4");
>         }
>         if (init_attr)
>                 event_attr_init(attr);
> @@ -783,6 +785,7 @@ const char *parse_events__term_type_str(enum parse_ev=
ents__term_type term_type)
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG1]               =3D "conf=
ig1",
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG2]               =3D "conf=
ig2",
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG3]               =3D "conf=
ig3",
> +               [PARSE_EVENTS__TERM_TYPE_CONFIG4]               =3D "conf=
ig4",
>                 [PARSE_EVENTS__TERM_TYPE_NAME]                  =3D "name=
",
>                 [PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]         =3D "peri=
od",
>                 [PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]           =3D "freq=
",
> @@ -830,6 +833,7 @@ config_term_avail(enum parse_events__term_type term_t=
ype, struct parse_events_er
>         case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>         case PARSE_EVENTS__TERM_TYPE_NAME:
>         case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> @@ -898,6 +902,10 @@ do {                                                =
                          \
>                 CHECK_TYPE_VAL(NUM);
>                 attr->config3 =3D term->val.num;
>                 break;
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +               CHECK_TYPE_VAL(NUM);
> +               attr->config4 =3D term->val.num;
> +               break;
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>                 CHECK_TYPE_VAL(NUM);
>                 break;
> @@ -1097,6 +1105,7 @@ static int config_term_tracepoint(struct perf_event=
_attr *attr,
>         case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>         case PARSE_EVENTS__TERM_TYPE_NAME:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> @@ -1237,6 +1246,7 @@ do {                                               =
               \
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>                 case PARSE_EVENTS__TERM_TYPE_NAME:
>                 case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>                 case PARSE_EVENTS__TERM_TYPE_RAW:
> @@ -1274,6 +1284,7 @@ static int get_config_chgs(struct perf_pmu *pmu, st=
ruct parse_events_terms *head
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>                 case PARSE_EVENTS__TERM_TYPE_NAME:
>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-event=
s.h
> index e176a34ab088..6e90c26066d4 100644
> --- a/tools/perf/util/parse-events.h
> +++ b/tools/perf/util/parse-events.h
> @@ -58,6 +58,7 @@ enum parse_events__term_type {
>         PARSE_EVENTS__TERM_TYPE_CONFIG1,
>         PARSE_EVENTS__TERM_TYPE_CONFIG2,
>         PARSE_EVENTS__TERM_TYPE_CONFIG3,
> +       PARSE_EVENTS__TERM_TYPE_CONFIG4,
>         PARSE_EVENTS__TERM_TYPE_NAME,
>         PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
>         PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
> diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-event=
s.l
> index 7ed86e3e34e3..8e2986d55bc4 100644
> --- a/tools/perf/util/parse-events.l
> +++ b/tools/perf/util/parse-events.l
> @@ -317,6 +317,7 @@ config                      { return term(yyscanner, =
PARSE_EVENTS__TERM_TYPE_CONFIG); }
>  config1                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG1); }
>  config2                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG2); }
>  config3                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG3); }
> +config4                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG4); }
>  name                   { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
NAME); }
>  period                 { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
SAMPLE_PERIOD); }
>  freq                   { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
SAMPLE_FREQ); }
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index b7ebac5ab1d1..fc50df65d540 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1427,6 +1427,10 @@ static int pmu_config_term(const struct perf_pmu *=
pmu,
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
>                         pmu_format_value(bits, term->val.num, &attr->conf=
ig3, zero);
>                         break;
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +                       assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> +                       pmu_format_value(bits, term->val.num, &attr->conf=
ig4, zero);
> +                       break;
>                 case PARSE_EVENTS__TERM_TYPE_USER: /* Not hardcoded. */
>                         return -EINVAL;
>                 case PARSE_EVENTS__TERM_TYPE_NAME ... PARSE_EVENTS__TERM_=
TYPE_HARDWARE:
> @@ -1474,6 +1478,9 @@ static int pmu_config_term(const struct perf_pmu *p=
mu,
>         case PERF_PMU_FORMAT_VALUE_CONFIG3:
>                 vp =3D &attr->config3;
>                 break;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG4:
> +               vp =3D &attr->config4;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -1787,6 +1794,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu,=
 void *state, pmu_format_call
>                 "config1=3D0..0xffffffffffffffff",
>                 "config2=3D0..0xffffffffffffffff",
>                 "config3=3D0..0xffffffffffffffff",
> +               "config4=3D0..0xffffffffffffffff",
>                 "name=3Dstring",
>                 "period=3Dnumber",
>                 "freq=3Dnumber",
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index b93014cc3670..1ce5377935db 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -22,6 +22,7 @@ enum {
>         PERF_PMU_FORMAT_VALUE_CONFIG1,
>         PERF_PMU_FORMAT_VALUE_CONFIG2,
>         PERF_PMU_FORMAT_VALUE_CONFIG3,
> +       PERF_PMU_FORMAT_VALUE_CONFIG4,
>         PERF_PMU_FORMAT_VALUE_CONFIG_END,
>  };
>
>
> --
> 2.34.1
>

