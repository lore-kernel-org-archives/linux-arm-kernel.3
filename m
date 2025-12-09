Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90268D3B7F8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 15:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDgse4smKZRxWXFHykbYNCZxcA+/jW1sukp85CRj1yk=; b=1aSe6dxl/6Cmol9kJ+rTjhv5fd
	xTzgBVrX1IRZ3TfKZ2rjp1iV1wBO+/rUrB3oF1U7/c4+k4jDHvkASxFGJcACbjgM9pv+RNcx1NwxK
	3n3qtMRJD31HsqOtnSCoy7uCqU/dRel8r5e4h0N80gx9k21UYb0Je0S93rZA+M1JXqsDGcWuTevOO
	UwZqxZEYq+XR+jFnm3/53mrSjTi3kOwnKGM//NwLhDwdX88RYeBPAl4mNKoSKR6HcBdvdPrmiv447
	m0jhN2hQIjIz64IdcoVIC6EVOWP9g0LLOgVHoULwIko/UzF13bm1wI1A/9uiEbqX1rit0CuWM+Vpp
	2T9OPh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT06x-0000000EU9y-0zpb;
	Tue, 09 Dec 2025 15:58:47 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT06u-0000000EU9d-13X3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 15:58:45 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29e0753e5d8so174125ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 07:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765295923; x=1765900723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDgse4smKZRxWXFHykbYNCZxcA+/jW1sukp85CRj1yk=;
        b=I3ZC6X8B/Sn4GzjT3aEQNCO2hEvlvmMRzLYgkIhxgyBVhlOlWojNmHf8w+biXIVrxY
         TYa3acAdaKMriO5OvniYD36UuKjPYXIh86qNWaQxuBUh1nUmehW1fBDQZ7VpUImXicMW
         zXHtgQ+XQyGLy2ebnBFhjvr7TBrj+CnTGGpWOEmmmYERzFwyct9xHobtA+8EpmEPaFwt
         e+07JMGoSA4ZM2GFZ0rp91YaXYRHgecoPrCc4plN29k87e27Jm3twJnLrIXJ+ODaVAFp
         tVfsL6q1Mm4xXjBwI4xV9seqbyR6FVF7jzbdbBHfmfUyL0sJHSgnItKC96wYCquUAg+q
         FOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765295923; x=1765900723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lDgse4smKZRxWXFHykbYNCZxcA+/jW1sukp85CRj1yk=;
        b=uwTprdp4wIEb6QRC1OVOx1KP2uSZfv4DJobqVdiePk5iD4h7q4PhqraoYA4qH6Yf69
         hI4QP7McAzXW6NhJwO7m/uXJOp0Sp/logNcG/kh151FDqXARTbgecJVNy30dNspzsNkJ
         iNSqirJ0RyCrQlgPGpwBrTiiq+6DnETxChoov95auCGuVh9QtPUgucJh9B9lZZIFwl9n
         QHC4BKS3B2uCGY+r/bq5tmeHGgEQblFoiwRx14QZkdaJNbtxScWIC7CBD8rez0Lt1MOi
         Vq09ysXJUPW1qpn1fCFPcI9f4HYUEeLkbzHR4k6Os3Y8gQnassNxeOaVT2XtV/Y8R/YD
         j9qg==
X-Forwarded-Encrypted: i=1; AJvYcCXH7KrI5/lLBEZOtOa/yJbVN2SIcrw9B9z8dpf2hSytF+xluf6PETD4MmSuN4luaCpXPQbFx3exrSJHJSKlKANX@lists.infradead.org
X-Gm-Message-State: AOJu0YzwG5XNdWQv4ifc0VAptsthSSCnDiCcwL474XhIUCYwbpruUgP+
	qbeNW1sYksLqIDXiXcmVDwt8S3wPbkvl4jHP88Y0DHHzTz8jPZFkA0QZN4heEvtml2hM5GW5oVf
	dMc/ihDd06XSTc4zS35vkX3zkcU7Z6rGKXApvEUmn
X-Gm-Gg: AY/fxX4BCbdLfkr8VaMcqWjoSNow7ZrS+LOOVJbDlPA+w521JmuBp7nhuLbI5ooAepf
	xyu2kgqLqH9vFGlKw02/F8h3P4lDDdhCc2WeSdQZneGZi75hFaJgHtZMATFeMufIXLXPbrPm5BQ
	/4/qJ5zRYbOKs+1zarlqwBuWB67kWNQQOgRtA4lrGRR9ntXni1Q//9bnBa2tlYZCIwhtYTztSzI
	hH4dLFO3P5K+KYqTuNQ//SlpJ/SUXbE8DJKFJvvVCzywWsG38uIU51bzb20d4CazadVHqEubf89
	zI+AKqi8W0kYazlH32KjvEtj
X-Google-Smtp-Source: AGHT+IEZGJ2IBQ2j1MbdGq5XaIfuVItXVgOQ0Dn63+iXclg+rEg/7JRhz9Q9g5d8crMx5xPTS07qDWbS+y/SSIFNDuE=
X-Received: by 2002:a17:903:1c8:b0:265:e66:6c10 with SMTP id
 d9443c01a7336-29e9417f3c2mr3300855ad.4.1765295922533; Tue, 09 Dec 2025
 07:58:42 -0800 (PST)
MIME-Version: 1.0
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
 <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org> <6ba6bde3-f56b-4354-b336-4739cb1edb71@linaro.org>
In-Reply-To: <6ba6bde3-f56b-4354-b336-4739cb1edb71@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 9 Dec 2025 07:58:31 -0800
X-Gm-Features: AQt7F2py_yb8y5sEdWL_sj5dKYcliEu1dCmZ7RHB13qbHpYjiU2r9ka3GKUHG9w
Message-ID: <CAP-5=fV_Y5W2RyJhBgnk49JuTf8EsyisY-LfL3sVhC4TVRC_gg@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] perf parse-events: Refactor get_config_terms()
 to remove macros
To: James Clark <james.clark@linaro.org>
Cc: Linux perf Profiling <linux-perf-users@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, leo.yan@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_075844_323893_111580E5 
X-CRM114-Status: GOOD (  29.52  )
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

On Tue, Dec 9, 2025 at 4:48=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> On 08/12/2025 2:22 pm, James Clark wrote:
> > The ADD_CONFIG_TERM() macros build the __type argument out of a partial
> > EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
> > from a function where __type is a variable and it's also impossible to
> > grep the codebase to find usages of these enums as they're never typed
> > in full.
> >
> > Fix this by removing the macros and replacing them with an
> > add_config_term() function. It seems the main reason these existed in
> > the first place was to avoid type punning and to write to a specific
> > field in the union, but the same thing can be achieved with a single
> > write to a u64 'val' field.
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
> > ---
> >   tools/perf/util/evsel_config.h |   1 +
> >   tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++--------=
---------
> >   2 files changed, 86 insertions(+), 61 deletions(-)
> >
> > diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_con=
fig.h
> > index bcd3a978f0c4..685fd8d5c4a8 100644
> > --- a/tools/perf/util/evsel_config.h
> > +++ b/tools/perf/util/evsel_config.h
> > @@ -50,6 +50,7 @@ struct evsel_config_term {
> >               u64           cfg_chg;
> >               char          *str;
> >               int           cpu;
> > +             u64           val;
> >       } val;
> >       bool weak;
> >   };
> > diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-eve=
nts.c
> > index 17c1c36a7bf9..d5b009b4ebab 100644
> > --- a/tools/perf/util/parse-events.c
> > +++ b/tools/perf/util/parse-events.c
> > @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_attr=
 *attr,
> >       return 0;
> >   }
> >
> > -static int get_config_terms(const struct parse_events_terms *head_conf=
ig,
> > -                         struct list_head *head_terms)
> > +static struct evsel_config_term *add_config_term(enum evsel_term_type =
type,
> > +                                              struct list_head *head_t=
erms,
> > +                                              bool weak)
> >   {
> > -#define ADD_CONFIG_TERM(__type, __weak)                              \
> > -     struct evsel_config_term *__t;                  \
> > -                                                             \
> > -     __t =3D zalloc(sizeof(*__t));                             \
> > -     if (!__t)                                               \
> > -             return -ENOMEM;                                 \
> > -                                                             \
> > -     INIT_LIST_HEAD(&__t->list);                             \
> > -     __t->type       =3D EVSEL__CONFIG_TERM_ ## __type;        \
> > -     __t->weak       =3D __weak;                               \
> > -     list_add_tail(&__t->list, head_terms)
> > -
> > -#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)   \
> > -do {                                                         \
> > -     ADD_CONFIG_TERM(__type, __weak);                        \
> > -     __t->val.__name =3D __val;                                \
> > -} while (0)
> > +     struct evsel_config_term *t;
> >
> > -#define ADD_CONFIG_TERM_STR(__type, __val, __weak)           \
> > -do {                                                         \
> > -     ADD_CONFIG_TERM(__type, __weak);                        \
> > -     __t->val.str =3D strdup(__val);                           \
> > -     if (!__t->val.str) {                                    \
> > -             zfree(&__t);                                    \
> > -             return -ENOMEM;                                 \
> > -     }                                                       \
> > -     __t->free_str =3D true;                                   \
> > -} while (0)
> > +     t =3D zalloc(sizeof(*t));
> > +     if (!t)
> > +             return NULL;
> > +
> > +     INIT_LIST_HEAD(&t->list);
> > +     t->type =3D type;
> > +     t->weak =3D weak;
> > +     list_add_tail(&t->list, head_terms);
> >
> > +     return t;
> > +}
> > +
> > +static int get_config_terms(const struct parse_events_terms *head_conf=
ig,
> > +                         struct list_head *head_terms)
> > +{
> >       struct parse_events_term *term;
> >
> >       list_for_each_entry(term, &head_config->terms, list) {
> > +             struct evsel_config_term *new_term;
> > +             enum evsel_term_type new_type;
> > +             char *str =3D NULL;
> > +             u64 val;
> > +
> >               switch (term->type_term) {
> >               case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> > -                     ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.num=
, term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_PERIOD;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> > -                     ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, te=
rm->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_FREQ;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_TIME:
> > -                     ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, te=
rm->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_TIME;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
> > -                     ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, ter=
m->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_CALLGRAPH;
> > +                     str =3D term->val.str;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
> > -                     ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_BRANCH;
> > +                     str =3D term->val.str;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
> > -                     ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
> > -                                         term->val.num, term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_STACK_USER;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_INHERIT:
> > -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> > -                                         term->val.num ? 1 : 0, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_INHERIT;
> > +                     val =3D term->val.num ? 1 : 0;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
> > -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> > -                                         term->val.num ? 0 : 1, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_INHERIT;
> > +                     val =3D term->val.num ? 0 : 1;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
> > -                     ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
> > -                                         term->val.num, term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_MAX_STACK;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
> > -                     ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
> > -                                         term->val.num, term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_MAX_EVENTS;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
> > -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> > -                                         term->val.num ? 1 : 0, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_OVERWRITE;
> > +                     val =3D term->val.num ? 1 : 0;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
> > -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> > -                                         term->val.num ? 0 : 1, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_OVERWRITE;
> > +                     val =3D term->val.num ? 0 : 1;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
> > -                     ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, term-=
>weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_DRV_CFG;
> > +                     str =3D term->val.str;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_PERCORE:
> > -                     ADD_CONFIG_TERM_VAL(PERCORE, percore,
> > -                                         term->val.num ? true : false,=
 term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_PERCORE;
> > +                     val =3D term->val.num ? true : false;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
> > -                     ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
> > -                                         term->val.num ? 1 : 0, term->=
weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_AUX_OUTPUT;
> > +                     val =3D term->val.num ? 1 : 0;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
> > -                     ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, te=
rm->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_AUX_ACTION;
> > +                     str =3D term->val.str;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
> > -                     ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample_s=
ize,
> > -                                         term->val.num, term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE;
> > +                     val =3D term->val.num;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
> > -                     ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.str,=
 term->weak);
> > +                     new_type =3D EVSEL__CONFIG_TERM_RATIO_TO_PREV;
> > +                     str =3D term->val.str;
> >                       break;
> >               case PARSE_EVENTS__TERM_TYPE_USER:
> >               case PARSE_EVENTS__TERM_TYPE_CONFIG:
> > @@ -1229,7 +1231,23 @@ do {                                            =
               \
> >               case PARSE_EVENTS__TERM_TYPE_RAW:
> >               case PARSE_EVENTS__TERM_TYPE_CPU:
> >               default:
> > -                     break;
> > +                     /* Don't add a new term for these ones */
> > +                     continue;
> > +             }
> > +
> > +             new_term =3D add_config_term(new_type, head_terms, term->=
weak);
> > +             if (!new_term)
> > +                     return -ENOMEM;
> > +
> > +             if (str) {
> > +                     new_term->val.str =3D strdup(str);
> > +                     if (!new_term->val.str) {
> > +                             zfree(&new_term);
> > +                             return -ENOMEM;
> > +                     }
> > +                     new_term->free_str =3D true;
> > +             } else {
>
> This will incorrectly hit the else if term->val.str is NULL. Not sure if
> that can happen but will fix anyway.
>
> > +                     new_term->val.val =3D val;
>
> There's an uninitialized variable warning for val here on release
> builds. Will fix too

I'm not sure how I feel about the change, but did you check that it is
ubsan clean? I worry it is introducing writes to "val" and then reads
from say "period" in the evsel_config_term val union. I believe ubsan
will flag this as:
https://en.cppreference.com/w/cpp/language/union.html
"It is undefined behavior to read from the member of the union that
wasn't most recently written."

Thanks,
Ian

> >               }
> >       }
> >       return 0;
> > @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *pmu=
, struct parse_events_terms *head
> >               }
> >       }
> >
> > -     if (bits)
> > -             ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
> > +     if (bits) {
> > +             struct evsel_config_term *new_term;
> > +
> > +             new_term =3D add_config_term(EVSEL__CONFIG_TERM_CFG_CHG,
> > +                                        head_terms, false);
> > +             if (!new_term)
> > +                     return -ENOMEM;
> > +             new_term->val.cfg_chg =3D bits;
> > +     }
> >
> > -#undef ADD_CONFIG_TERM
> >       return 0;
> >   }
> >
> >
>

