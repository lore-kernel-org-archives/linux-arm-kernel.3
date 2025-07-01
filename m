Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC68C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UgRjLg1bANNvxWkIL2D0B4OzAbnbrdTRnXpfNQyHPk=; b=lgDG4VtLI5rBp6hJ+oluDwchoO
	VkQRtYanQc2nTVLUBHNAAqsm9gY2ha5hmQS2eqRO5dDVe2Yzn1Wa+FJANgkVrxZ9gr7FzBZRQtJ6k
	7NpC0Wgm8o9/IMFXwMeakLNiHv3xA3JA8L8pDaKo5XOvs+ihRFdg3txIipfsXbTOuMyPG9cuiZZkE
	byJIpCIozOY1IYfIhSDE85qAk9r1+Cvz0eAydXLZV+TGzNI9YSuwkjlARXBVhULuNt0TKV+MAAkFb
	PVethxRBY4CMRzQYSjHajfgx67vYkGGGilVBI9GxUVp54jXoukRwIrne7yOsSpXO3km+aCDb2lYeE
	pxF1gtDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgI1-00000006Qh8-43n5;
	Tue, 01 Jul 2025 19:05:09 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeLt-000000069Eh-0WhZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 17:01:02 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so266595ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 10:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751389260; x=1751994060; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UgRjLg1bANNvxWkIL2D0B4OzAbnbrdTRnXpfNQyHPk=;
        b=TswozpGx6m441DoqWR68sE94QBkD/qZ7Q4I7QENLVqFXtQ/C+kQQVE3INsGsngoUgs
         we7ie4A72M4469Zz437ksAZh7qGHZuwQ80adpy4PVi+DXU0Pd0R4FF/majq6Hzg2GiYb
         ifqorjSDDlwuk1y+jCpaPAQwO4qaVgg4jisK8A+P5CrWo66UNb9oPLMSfGxYBNNiinEE
         yPsOWv0Kn1C2lFzjLH3mtoKpmTVTrAgyFDswfYqB7zUA7f7B4HMmLYNj6BXMgBzrQGtu
         cuVMLrqwITeKzvpnzRyqHjvPKBmSCxOEII6DoQveMEOVrJEwkxK4AzdFkLrnXqTTUpxI
         gMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389260; x=1751994060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UgRjLg1bANNvxWkIL2D0B4OzAbnbrdTRnXpfNQyHPk=;
        b=w23iKedXDg6hfj2ISkN8clkVA1JtA0ZYzoGhneNntq0LOGHKcTXRWIbddf/yfdPVCG
         l/enkG6X0nXZvW7KYSVZ2ZDYM52izzhP8dXKv126QyR4FZJ7FTtMbq3CwIWO4n9Q0XLO
         hFhBQ1NzUBu9Y1J8TQSAx9eu34CCi/QFGQOG24oeZgXYmZVO2GgTda/lsgrOnwGk2xJh
         KoiPFXpPcvLP0/oM5AP7DLHUlLnBpRjz7MGGjtR845dsRm0axfmB+l8k91WAF9DKAgjb
         iYli0jm/7LimB2HW51VxTHhapdHxiB1rubIYE0diWeVZGpaS3akQxTrRIAlR5DEv4o0/
         a16Q==
X-Forwarded-Encrypted: i=1; AJvYcCXr45ZBNg9/z2WSFHWaxWsngacMdAAvxm89HkM2h30gvA5E1Yn8oR2w7gqq6LJHF+sOr9URsth78yWGqbYxwDPg@lists.infradead.org
X-Gm-Message-State: AOJu0YxtYCn+0CZ8/VjY/X3hCmMsK3CLwDF5GeLNL+0Qwowvgf4McoaY
	UANXkcXVUWv+rsvjkX8+lVtPhqAe2AiWZjKgMyBGB2Dr6dy1OqX7HqKvIe8K1DuSPEVW9F9ekrv
	68N5HlU16XMGN9vS2HPpRuWB7e43Y1/hoUxHx+r7I
X-Gm-Gg: ASbGncviyBuwEsIh/V3nw9OWjMsEDbmKD5gJEdIty6C0nFQotYc/7py3NaffEfrhpUi
	/fi335yEFcOu4zCxdiLYnjjnOgT62Hd0tdXqzJGh9qBKp+kFIWb6Iv7qy9CsnyP//hzn4tb12l/
	tgIkpgs59YrhzEJUyH6FmzbW3k3pwNLsVbZpQnoxtnpCwyKf5mLpIgy9IIHsYt1UfG9JSBcgo=
X-Google-Smtp-Source: AGHT+IEAhz64e+5NmGN5DM9cSM9FAys6CW3b3NwAestgSJtBnITuejAnC/VvbJqmG/3u6aIr/6ecA3b9nT+k3h8kfT8=
X-Received: by 2002:a05:6e02:4610:b0:3e0:51fc:6e8 with SMTP id
 e9e14a558f8ab-3e051fc0c97mr1053115ab.15.1751389259861; Tue, 01 Jul 2025
 10:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250628045017.1361563-1-irogers@google.com> <20250628045017.1361563-11-irogers@google.com>
 <aGN_wBXVt6YN4Itb@google.com>
In-Reply-To: <aGN_wBXVt6YN4Itb@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 1 Jul 2025 10:00:48 -0700
X-Gm-Features: Ac12FXz_X_5IipKr8vd50gwfTiNlhqt4RWPZaW22n1cB2CNPPqiGwCwVNqiqJs4
Message-ID: <CAP-5=fXVxykN_pyydC_8LtNO0wAOz2yZPhwYsThQhgR0QeSP+A@mail.gmail.com>
Subject: Re: [PATCH v5 10/23] perf session: Add an env pointer for the current perf_env
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Li Huafei <lihuafei1@huawei.com>, 
	"Steinar H. Gunderson" <sesse@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Chun-Tse Shao <ctshao@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Levi Yun <yeoreum.yun@arm.com>, 
	Howard Chu <howardchu95@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Thomas Falcon <thomas.falcon@intel.com>, Matt Fleming <matt@readmodwrite.com>, 
	Veronika Molnarova <vmolnaro@redhat.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Zixian Cai <fzczx123@gmail.com>, Steve Clevenger <scclevenger@os.amperecomputing.com>, 
	Ben Gainey <ben.gainey@arm.com>, Chaitanya S Prakash <chaitanyas.prakash@arm.com>, 
	Martin Liska <martin.liska@hey.com>, =?UTF-8?Q?Martin_Li=C5=A1ka?= <m.liska@foxlink.cz>, 
	Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_100101_184333_89FE1B15 
X-CRM114-Status: GOOD (  25.37  )
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

On Mon, Jun 30, 2025 at 11:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Fri, Jun 27, 2025 at 09:50:04PM -0700, Ian Rogers wrote:
> > Initialize to `&header.env`. This will later allow the env value to be
> > changed.
>
> I'm curious when it is changed.

Thanks for the reviews! I'll dig into them for v6. Looking at this one
I don't see a current use of the changed perf_session__env so I
suspect we can drop the change. I need to think about the lifetime of
header.env, use cases where have >1 env like perf inject (in vs out),
perf diff and what's going on with TUI in patch:
https://lore.kernel.org/lkml/20250628045017.1361563-12-irogers@google.com/

Thanks,
Ian

> Thanks,
> Namhyung
>
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/util/session.c | 3 ++-
> >  tools/perf/util/session.h | 2 ++
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
> > index b09d157f7d04..e39a1df7c044 100644
> > --- a/tools/perf/util/session.c
> > +++ b/tools/perf/util/session.c
> > @@ -156,6 +156,7 @@ struct perf_session *__perf_session__new(struct per=
f_data *data,
> >                            ordered_events__deliver_event, NULL);
> >
> >       perf_env__init(&session->header.env);
> > +     session->env =3D &session->header.env;
> >       if (data) {
> >               ret =3D perf_data__open(data);
> >               if (ret < 0)
> > @@ -2750,5 +2751,5 @@ int perf_session__dsos_hit_all(struct perf_sessio=
n *session)
> >
> >  struct perf_env *perf_session__env(struct perf_session *session)
> >  {
> > -     return &session->header.env;
> > +     return session->env;
> >  }
> > diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
> > index e7f7464b838f..088868f1004a 100644
> > --- a/tools/perf/util/session.h
> > +++ b/tools/perf/util/session.h
> > @@ -45,6 +45,8 @@ struct perf_session {
> >       struct perf_header      header;
> >       /** @machines: Machines within the session a host and 0 or more g=
uests. */
> >       struct machines         machines;
> > +     /** @env: The perf_env being worked with, either from a data file=
 or the host's. */
> > +     struct perf_env         *env;
> >       /** @evlist: List of evsels/events of the session. */
> >       struct evlist   *evlist;
> >       /** @auxtrace: callbacks to allow AUX area data decoding. */
> > --
> > 2.50.0.727.gbf7dc18ff4-goog
> >

