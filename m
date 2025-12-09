Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B15BD3B98A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SncDcrBJsXhqfqOv9Q+sDuBjEHJt7USdvQKEHHZ/k90=; b=Nq16CCGHuMcE+pjO6+BQOrd5NY
	HkimkHhqjDPaufteHDuOu3A536uBUdQNenKIj0gi833aRMgLNhB0NENqpY1MHQEo5disyJpEGdNO1
	i52JDd2BFusgVdTA2cv0uIIA0TcFeRFSsOnVO29vYvXBZDcBX9+uhRho7VQkKsdhy1dYK6bKeLNbc
	gdgTlvYCabBfwCpx2kJNXAF21hd/UIpWPhIdzOlSvCVLycHYl4BHmp9ucPml828ILWsZHx+eorwx4
	l04vkjCebs8Sg4NkOLusb7324V1ospwv5Y8HUGk6jskt+DPZuNG+B573iS/ihJDVOe+tWyew40Tan
	tWcXy1GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT29o-0000000EdW0-46I9;
	Tue, 09 Dec 2025 18:09:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT29l-0000000EdVY-3vJS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 18:09:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29e0753e5d8so7215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 10:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765303789; x=1765908589; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SncDcrBJsXhqfqOv9Q+sDuBjEHJt7USdvQKEHHZ/k90=;
        b=hT6IEFDSL3zvCUt5oc3Jg1hDOE3OqMziqm/kPGLCcPtj6U4SuR0EHchlSsavKGlNx+
         fcrZUATQVM8rOeJ7dOJBtVElk3jcN3ME1tUN1IEbNaUhm58/mgxqFq+dzwW9N34lZSlT
         S1ynF0Zy4TxLhc0ybVlqFb0aelRTLlcRcLVzb7/EAqqgPlRrsX8NW2FFY6IPAywLvp5r
         0agORSl557sFjVHQJ35ZvQwL6J2W5EklCQ2je88wgRu/OLcjOvnW5sgJQqUaW/hqRVO7
         pHTBASfTCk43x8WwpPJ5jFrFjn2tdUnDwlJ4Kkg04NOjbsh/7RtiEmYLciY3GKtRWUBA
         5jlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765303789; x=1765908589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SncDcrBJsXhqfqOv9Q+sDuBjEHJt7USdvQKEHHZ/k90=;
        b=AZUjNLSbVPdceJRtaYXuZZUahMmTGnOppPR7bsNbMkPY0rwmLKxVBLkxK0q3MfFgJO
         yV7MVIwEpuqELEBUKM0ancY7arACXwGOqqkfXvNTN3tyHKWtsd7wWN9bp+79SVsICqJQ
         nvIBTVQ3LEsKTleT+xIN/3zuJjbOSAG0TY93JCzxPLd6XVyzbHYq+et9xyj/PKj8ZTKX
         +zdfTwVyuUpBo+QAeHsC5egMkXmq9h29Qtss3+qHJJdsRCxTbGQflj9n4aJ49jYMEN4N
         sghJkt3Kc1GiAb39FGm46wvZoqbqL2rW8ZR0clEYlPsZCKlDtjef0na5NadK2J/VvgiX
         gF5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXFhTrlh55D+wD5RIDnpk2f35P6Dos7hk99h+dHTeTEJ6IoKUipsMdfLPIJH39MzQQKhW8ZN94csaV745eTnZS2@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy6Y/W8hGPYQEXRQ6RlUxU2UavjQeHDaxtFrTjVFw+eytr45DP
	0+QZbQp7npgPngIDqbsJ5Fl3QWATrmNgviqDzkbK5II5+aEQbNcfTBC8U6q9IMyARXScs/4YKcV
	bTcOUXUblagRr1+gSlqN/hNbfLU8QexHmqWUioR6H
X-Gm-Gg: AY/fxX6A2pQUblZBObRWUTEvRk7W2R53fWSGxEanzTx138dLe9fP5ub/EumJjZs0xrz
	YYwQeMaa47XaoDQwAz6s9Z9Lr8yHTxsBeDk5KfW12gQ3dSajjmaDkAX5mg6/1W/knKpGP6oWf5A
	frJJsNflZZbDv06pgM+OhDp4flWxXtB5H3JBoZb21oQVzWYWBOgfG0OTVLfgsrBZo+ZpnDJIlDT
	/YahTOXk9M4sYxGV7WUR0ecMM1ebdEyGRyT899XFUf6dQbU4CEVDceHxh3dse7/O70WxZ3TKbZU
	1eDre349NKESLWwRaBtDMxQ0
X-Google-Smtp-Source: AGHT+IEiMkHnErFY3xSEYPzNrt11GTEx6o4mPddiQfiRo0+bAE6QQr1kKqsnVNSst008HDptI5o+Bfx8pq7ktiA8ot8=
X-Received: by 2002:a17:903:181:b0:294:d42c:ca0f with SMTP id
 d9443c01a7336-29ebf7db6b8mr61265ad.2.1765303788613; Tue, 09 Dec 2025 10:09:48
 -0800 (PST)
MIME-Version: 1.0
References: <20251208-james-perf-config-bits-v2-0-4ac0281993b0@linaro.org>
 <20251208-james-perf-config-bits-v2-1-4ac0281993b0@linaro.org>
 <6ba6bde3-f56b-4354-b336-4739cb1edb71@linaro.org> <CAP-5=fV_Y5W2RyJhBgnk49JuTf8EsyisY-LfL3sVhC4TVRC_gg@mail.gmail.com>
 <d275d2fb-8670-4832-b9c4-de98376e58ad@linaro.org>
In-Reply-To: <d275d2fb-8670-4832-b9c4-de98376e58ad@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 9 Dec 2025 10:09:37 -0800
X-Gm-Features: AQt7F2onDRc5S89BorZiT7l1vpPuHViidV4AHe_AXt8lCoNFqyrn_fJfCfHKiZo
Message-ID: <CAP-5=fW6_MVrezxT6ssjhWnYtF_51nvuFCCSPaHzqwYw9EK4Wg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251209_100950_026848_6A526311 
X-CRM114-Status: GOOD (  24.05  )
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

On Tue, Dec 9, 2025 at 9:55=E2=80=AFAM James Clark <james.clark@linaro.org>=
 wrote:
>
> On 09/12/2025 15:58, Ian Rogers wrote:
> > On Tue, Dec 9, 2025 at 4:48=E2=80=AFAM James Clark <james.clark@linaro.=
org> wrote:
> >>
> >> On 08/12/2025 2:22 pm, James Clark wrote:
> >>> The ADD_CONFIG_TERM() macros build the __type argument out of a parti=
al
> >>> EVSEL__CONFIG_TERM_x enum name. This means that they can't be called
> >>> from a function where __type is a variable and it's also impossible t=
o
> >>> grep the codebase to find usages of these enums as they're never type=
d
> >>> in full.
> >>>
> >>> Fix this by removing the macros and replacing them with an
> >>> add_config_term() function. It seems the main reason these existed in
> >>> the first place was to avoid type punning and to write to a specific
> >>> field in the union, but the same thing can be achieved with a single
> >>> write to a u64 'val' field.
> >>>
> >>> Signed-off-by: James Clark <james.clark@linaro.org>
> >>> ---
> >>>    tools/perf/util/evsel_config.h |   1 +
> >>>    tools/perf/util/parse-events.c | 146 ++++++++++++++++++++++++-----=
------------
> >>>    2 files changed, 86 insertions(+), 61 deletions(-)
> >>>
> >>> diff --git a/tools/perf/util/evsel_config.h b/tools/perf/util/evsel_c=
onfig.h
> >>> index bcd3a978f0c4..685fd8d5c4a8 100644
> >>> --- a/tools/perf/util/evsel_config.h
> >>> +++ b/tools/perf/util/evsel_config.h
> >>> @@ -50,6 +50,7 @@ struct evsel_config_term {
> >>>                u64           cfg_chg;
> >>>                char          *str;
> >>>                int           cpu;
> >>> +             u64           val;
> >>>        } val;
> >>>        bool weak;
> >>>    };
> >>> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-e=
vents.c
> >>> index 17c1c36a7bf9..d5b009b4ebab 100644
> >>> --- a/tools/perf/util/parse-events.c
> >>> +++ b/tools/perf/util/parse-events.c
> >>> @@ -1116,105 +1116,107 @@ static int config_attr(struct perf_event_at=
tr *attr,
> >>>        return 0;
> >>>    }
> >>>
> >>> -static int get_config_terms(const struct parse_events_terms *head_co=
nfig,
> >>> -                         struct list_head *head_terms)
> >>> +static struct evsel_config_term *add_config_term(enum evsel_term_typ=
e type,
> >>> +                                              struct list_head *head=
_terms,
> >>> +                                              bool weak)
> >>>    {
> >>> -#define ADD_CONFIG_TERM(__type, __weak)                             =
 \
> >>> -     struct evsel_config_term *__t;                  \
> >>> -                                                             \
> >>> -     __t =3D zalloc(sizeof(*__t));                             \
> >>> -     if (!__t)                                               \
> >>> -             return -ENOMEM;                                 \
> >>> -                                                             \
> >>> -     INIT_LIST_HEAD(&__t->list);                             \
> >>> -     __t->type       =3D EVSEL__CONFIG_TERM_ ## __type;        \
> >>> -     __t->weak       =3D __weak;                               \
> >>> -     list_add_tail(&__t->list, head_terms)
> >>> -
> >>> -#define ADD_CONFIG_TERM_VAL(__type, __name, __val, __weak)   \
> >>> -do {                                                         \
> >>> -     ADD_CONFIG_TERM(__type, __weak);                        \
> >>> -     __t->val.__name =3D __val;                                \
> >>> -} while (0)
> >>> +     struct evsel_config_term *t;
> >>>
> >>> -#define ADD_CONFIG_TERM_STR(__type, __val, __weak)           \
> >>> -do {                                                         \
> >>> -     ADD_CONFIG_TERM(__type, __weak);                        \
> >>> -     __t->val.str =3D strdup(__val);                           \
> >>> -     if (!__t->val.str) {                                    \
> >>> -             zfree(&__t);                                    \
> >>> -             return -ENOMEM;                                 \
> >>> -     }                                                       \
> >>> -     __t->free_str =3D true;                                   \
> >>> -} while (0)
> >>> +     t =3D zalloc(sizeof(*t));
> >>> +     if (!t)
> >>> +             return NULL;
> >>> +
> >>> +     INIT_LIST_HEAD(&t->list);
> >>> +     t->type =3D type;
> >>> +     t->weak =3D weak;
> >>> +     list_add_tail(&t->list, head_terms);
> >>>
> >>> +     return t;
> >>> +}
> >>> +
> >>> +static int get_config_terms(const struct parse_events_terms *head_co=
nfig,
> >>> +                         struct list_head *head_terms)
> >>> +{
> >>>        struct parse_events_term *term;
> >>>
> >>>        list_for_each_entry(term, &head_config->terms, list) {
> >>> +             struct evsel_config_term *new_term;
> >>> +             enum evsel_term_type new_type;
> >>> +             char *str =3D NULL;
> >>> +             u64 val;
> >>> +
> >>>                switch (term->type_term) {
> >>>                case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> >>> -                     ADD_CONFIG_TERM_VAL(PERIOD, period, term->val.n=
um, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_PERIOD;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> >>> -                     ADD_CONFIG_TERM_VAL(FREQ, freq, term->val.num, =
term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_FREQ;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_TIME:
> >>> -                     ADD_CONFIG_TERM_VAL(TIME, time, term->val.num, =
term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_TIME;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_CALLGRAPH:
> >>> -                     ADD_CONFIG_TERM_STR(CALLGRAPH, term->val.str, t=
erm->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_CALLGRAPH;
> >>> +                     str =3D term->val.str;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_BRANCH_SAMPLE_TYPE:
> >>> -                     ADD_CONFIG_TERM_STR(BRANCH, term->val.str, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_BRANCH;
> >>> +                     str =3D term->val.str;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_STACKSIZE:
> >>> -                     ADD_CONFIG_TERM_VAL(STACK_USER, stack_user,
> >>> -                                         term->val.num, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_STACK_USER;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_INHERIT:
> >>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> >>> -                                         term->val.num ? 1 : 0, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_INHERIT;
> >>> +                     val =3D term->val.num ? 1 : 0;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_NOINHERIT:
> >>> -                     ADD_CONFIG_TERM_VAL(INHERIT, inherit,
> >>> -                                         term->val.num ? 0 : 1, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_INHERIT;
> >>> +                     val =3D term->val.num ? 0 : 1;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_MAX_STACK:
> >>> -                     ADD_CONFIG_TERM_VAL(MAX_STACK, max_stack,
> >>> -                                         term->val.num, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_MAX_STACK;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_MAX_EVENTS:
> >>> -                     ADD_CONFIG_TERM_VAL(MAX_EVENTS, max_events,
> >>> -                                         term->val.num, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_MAX_EVENTS;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_OVERWRITE:
> >>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> >>> -                                         term->val.num ? 1 : 0, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_OVERWRITE;
> >>> +                     val =3D term->val.num ? 1 : 0;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_NOOVERWRITE:
> >>> -                     ADD_CONFIG_TERM_VAL(OVERWRITE, overwrite,
> >>> -                                         term->val.num ? 0 : 1, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_OVERWRITE;
> >>> +                     val =3D term->val.num ? 0 : 1;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_DRV_CFG:
> >>> -                     ADD_CONFIG_TERM_STR(DRV_CFG, term->val.str, ter=
m->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_DRV_CFG;
> >>> +                     str =3D term->val.str;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_PERCORE:
> >>> -                     ADD_CONFIG_TERM_VAL(PERCORE, percore,
> >>> -                                         term->val.num ? true : fals=
e, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_PERCORE;
> >>> +                     val =3D term->val.num ? true : false;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT:
> >>> -                     ADD_CONFIG_TERM_VAL(AUX_OUTPUT, aux_output,
> >>> -                                         term->val.num ? 1 : 0, term=
->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_AUX_OUTPUT;
> >>> +                     val =3D term->val.num ? 1 : 0;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_AUX_ACTION:
> >>> -                     ADD_CONFIG_TERM_STR(AUX_ACTION, term->val.str, =
term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_AUX_ACTION;
> >>> +                     str =3D term->val.str;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE:
> >>> -                     ADD_CONFIG_TERM_VAL(AUX_SAMPLE_SIZE, aux_sample=
_size,
> >>> -                                         term->val.num, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_AUX_SAMPLE_SIZE=
;
> >>> +                     val =3D term->val.num;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_RATIO_TO_PREV:
> >>> -                     ADD_CONFIG_TERM_STR(RATIO_TO_PREV, term->val.st=
r, term->weak);
> >>> +                     new_type =3D EVSEL__CONFIG_TERM_RATIO_TO_PREV;
> >>> +                     str =3D term->val.str;
> >>>                        break;
> >>>                case PARSE_EVENTS__TERM_TYPE_USER:
> >>>                case PARSE_EVENTS__TERM_TYPE_CONFIG:
> >>> @@ -1229,7 +1231,23 @@ do {                                          =
                 \
> >>>                case PARSE_EVENTS__TERM_TYPE_RAW:
> >>>                case PARSE_EVENTS__TERM_TYPE_CPU:
> >>>                default:
> >>> -                     break;
> >>> +                     /* Don't add a new term for these ones */
> >>> +                     continue;
> >>> +             }
> >>> +
> >>> +             new_term =3D add_config_term(new_type, head_terms, term=
->weak);
> >>> +             if (!new_term)
> >>> +                     return -ENOMEM;
> >>> +
> >>> +             if (str) {
> >>> +                     new_term->val.str =3D strdup(str);
> >>> +                     if (!new_term->val.str) {
> >>> +                             zfree(&new_term);
> >>> +                             return -ENOMEM;
> >>> +                     }
> >>> +                     new_term->free_str =3D true;
> >>> +             } else {
> >>
> >> This will incorrectly hit the else if term->val.str is NULL. Not sure =
if
> >> that can happen but will fix anyway.
> >>
> >>> +                     new_term->val.val =3D val;
> >>
> >> There's an uninitialized variable warning for val here on release
> >> builds. Will fix too
> >
> > I'm not sure how I feel about the change, but did you check that it is
> > ubsan clean? I worry it is introducing writes to "val" and then reads
> > from say "period" in the evsel_config_term val union. I believe ubsan
> > will flag this as:
> > https://en.cppreference.com/w/cpp/language/union.html
> > "It is undefined behavior to read from the member of the union that
> > wasn't most recently written."
> >
> > Thanks,
> > Ian
> >
>
> Maybe for C++, but not for C [1]:
>
>    Accessing my_union.i after most recently writing to the other member,
>    my_union.d, is an allowed form of type-punning in C, provided that the
>    member read is not larger than the one whose value was set
>
> Type punning with unions is widely used in the kernel and there are a
> couple of instances in Perf. There are tons of discussions about it on
> the mailing lists too. I can check it with ubsan though.

Thanks. I'm mostly worried about ubsan being clean. One of those
mailing list discussions, or sadly outside the usual trolls lack of
discussion, is my trying to remove a prevalent source of type punning:
https://lore.kernel.org/lkml/20251016205126.2882625-1-irogers@google.com/

Ian

> [1]: https://en.wikipedia.org/wiki/Type_punning#C_and_C++
>
> >>>                }
> >>>        }
> >>>        return 0;
> >>> @@ -1290,10 +1308,16 @@ static int get_config_chgs(struct perf_pmu *p=
mu, struct parse_events_terms *head
> >>>                }
> >>>        }
> >>>
> >>> -     if (bits)
> >>> -             ADD_CONFIG_TERM_VAL(CFG_CHG, cfg_chg, bits, false);
> >>> +     if (bits) {
> >>> +             struct evsel_config_term *new_term;
> >>> +
> >>> +             new_term =3D add_config_term(EVSEL__CONFIG_TERM_CFG_CHG=
,
> >>> +                                        head_terms, false);
> >>> +             if (!new_term)
> >>> +                     return -ENOMEM;
> >>> +             new_term->val.cfg_chg =3D bits;
> >>> +     }
> >>>
> >>> -#undef ADD_CONFIG_TERM
> >>>        return 0;
> >>>    }
> >>>
> >>>
> >>
>

