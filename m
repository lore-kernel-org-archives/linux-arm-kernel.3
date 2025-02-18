Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A86C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B/cgij1lFdZqKfhJzvdkh7LmAc2T325VXWYvJrhG6fY=; b=moDWJ6ma0zw1b+84OrYtn3Fmun
	yWp2I7WQ8MOF34C8BPeKNZCRTyjoEy3Tokeio1TZwTcO41XHk5/C5aoibC4C7r5L7diFEZA+x8/L6
	ZNJU0UCWTT4mzJolVWAmx0wPBcheZBVDOYIGQLrTxKpq+SOI8yfUWuq5MKaYyeqxOHExpCLZUMO6j
	xuWE3HE4DJQMgcSYuZ23sV3Mkob6f257QYlZoYRTWfMhhV4J6I0CeQXWAPzOGHBnF6qaELI4+wifT
	StRDTdHP7HbTyl3aknNhDGKmz5MAZNLsU395zH2BU3+Q00AOI3YmNLuKwIHvVVjKbwlDnxvZA4o1W
	XWc7sGZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWCl-0000000A9gD-3Y6M;
	Tue, 18 Feb 2025 22:36:39 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkWAC-0000000A9K1-2zTG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 22:34:02 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d2ad29f630so175915ab.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 14:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739918040; x=1740522840; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/cgij1lFdZqKfhJzvdkh7LmAc2T325VXWYvJrhG6fY=;
        b=dBpu3AXPsuV8Mnwqlra1fweL9rEAHerZPjlJaBzWN8wcfQE49zgAzWB7INwhGSvEsa
         KU7sVuBE9rEewJRDTkz/Le+uikpTGij8uDcW3I0UH8dHGbkvSzz/8lQBbtfvZvbKtM+2
         bY6C7HTSQlQxNG22/7aTDiE3igZO5Xeg74TvlG5ePSOoFiPLV3b5L7GYxlkQ70UKN8ib
         hzdhYhZR2PJ65zjD/VndXsKHv50wzGBwQx6qQE5bOW72VmM3EwyoN5wqUfIPbOORTAZo
         ZEDJ8JIve7gMICECPfkoAw8km5bw4k/3rTOQ4R7Wlzqa17g0o02dvmR4GVBM5Fotwldm
         wvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739918040; x=1740522840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/cgij1lFdZqKfhJzvdkh7LmAc2T325VXWYvJrhG6fY=;
        b=sZhoI1NLSD4DBbDYl+S9QWSYTLCBHzhMtyDvp0QcOwkmxuMAa4cIlbGHDw4IKoi6zZ
         ZTBmBp5f64NbbTQeptycWVYKA5njWFA6Fauy6oPOMux5OL6GaC/XyXErsSIWbbdHHOzy
         O26QFZK19bdisE1dXojPjbEpYd6FBt4Ven9BoG4B7NQRIm1JRdhHCa+czJ7xGJ1iw8qN
         fjTwdFGfWpO9xTUhj438dfKrO2Y6Wx5lpdz6eDuEk20nPZbuAFv1+PD8NTKqbr9Jz031
         kL5JMdQd0oujAhASqHChCY0beUoe7UNmVZHnygTXlWu92/zKclIykKfJr1whzN1srJzk
         i5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCW8mejkau9VoiWVeEELH9DSQ4FNsUe8a8Y/EvymY4MoxRibagzMTGBnI+7I27BR8AH1aj/JIrFCpvbzRl2JMaY0@lists.infradead.org
X-Gm-Message-State: AOJu0YweAB5/Ngxs02FWTPuU9KKS+am/ikoxJpr+1atBui6SkslQJxKl
	9+RS0c75zzsIAQDkZgpyi1icklHg07lNvT8uclWWYEWcdNmzmv5pBAEdPJ2jL37WJBVY21Kr/6H
	4fxTCpAiF79oO7Y576hboHuqlB43zXN+nmJwS
X-Gm-Gg: ASbGncv2PGBjVYc3HgYqGg+8ijgiAF+18crH8qiWxj6lKfODnA0R6b8/u3vJmAuOZJU
	fJKdFnBlgG02NuzOZksXfx1vW3n37lkVa46nlfonceR+CLwJPk3Crxs/swooMS+75QQV9PQ2B9Y
	Ha5+FO8mxVv+OH3M6pYjk0Y3xI
X-Google-Smtp-Source: AGHT+IHw3DoO4qf0xpi1Amzv3pmc+X9SJTYSaoh3aiUz35JKe6rXdAzYIXkiqfdS7Bg/GHnOCWs6r2oDH8RnN6nJDDg=
X-Received: by 2002:a05:6e02:3287:b0:3d1:7971:e6d5 with SMTP id
 e9e14a558f8ab-3d2b6236f8amr1406365ab.0.1739918039639; Tue, 18 Feb 2025
 14:33:59 -0800 (PST)
MIME-Version: 1.0
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com> <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org> <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
 <fe46069e-c52e-45ee-b4b3-8b929fb83b31@linaro.org> <Z7UHieRRnvRb5_oU@google.com>
In-Reply-To: <Z7UHieRRnvRb5_oU@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 18 Feb 2025 14:33:47 -0800
X-Gm-Features: AWEUYZnCIRZ8gA78AOy7d6LlsQyiSAxYf8f5kf90YgWTOUXfQDLRg9JD7T1vwFY
Message-ID: <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520 events/metrics
To: Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@linaro.org>, Yangyu Chen <cyy@cyyself.name>, 
	linux-perf-users@vger.kernel.org, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Yoshihiro Furudera <fj5100bi@fujitsu.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_143400_758717_C5648E13 
X-CRM114-Status: GOOD (  33.11  )
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

On Tue, Feb 18, 2025 at 2:19=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Tue, Feb 18, 2025 at 09:30:23AM +0000, James Clark wrote:
> >
> >
> > On 18/02/2025 12:41 am, Ian Rogers wrote:
> > > On Fri, Feb 14, 2025 at 2:02=E2=80=AFAM James Clark <james.clark@lina=
ro.org> wrote:
> > > >
> > > >
> > > >
> > > > On 14/02/2025 5:49 am, Yangyu Chen wrote:
> > > > >
> > > > >
> > > > > > On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wr=
ote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
> > > > > > > This patchset adds the perf JSON files for the Cortex-A720 an=
d Cortex-A520
> > > > > > > processors. Some events have been tested on Raxda Orion 6 wit=
h Cix P1 SoC
> > > > > > > (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
> > > > > >
> > > > > > I'm curious how the name of PMUs look like.  It is cortex_a720 =
(or a520)?
> > > > >
> > > > > The name of PMUs comes from Arm's documentation. I have included =
these
> > > > > links in each patch.
> > > > >
> > > > > > I remember there's a logic to check the length of hex digits at=
 the end.
> > > > > >
> > > > >
> > > > > Could you provide more details about this?
> > > > >
> > > > > > Ian, are you ok with this?
> > > > > >
> > > >
> > > > I think they wouldn't be merged because they're core PMUs, so shoul=
d be
> > > > fine? Even though they would otherwise be merged because they're mo=
re
> > > > than 3 hex digits.
> > >
> > > Do we know the PMU names? If they are cortex_a520 and cortex_a720 the=
n
> >
> > It will be "armv9_cortex_a720" from this line:
> >
> >   PMUV3_INIT_SIMPLE(armv9_cortex_a720)
>
> I see, thanks!
>
> >
> > > this comment at least reads a little stale:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.=
git/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n76
> > > ```
> > > /*
> > > * There is a '_{num}' suffix. For decimal suffixes any length
> > > * will do, for hexadecimal ensure more than 2 hex digits so
> > > * that S390's cpum_cf PMU doesn't match.
> > > */
> > > ```
> > > James is right that core PMUs aren't put on the same list as uncore/o=
ther PMUs.
>
> Ok, then I guess we're good.

I think you may be able to do things that look odd, like today the
"i915" PMU can be called just "i", I think the a520/a720 naming will
allow "armv9_cortex/cycles/" as an event name, then open it on two
PMUs if they are present. We may only show one PMU in perf list as
that code I think assumes they're the same PMU as they only differ by
suffix:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/pmus.c?h=3Dperf-tools-next#n384
I can imagine aggregation possibly being broken, but I think that
works off the number of PMUs not the names of the PMUs, so it should
be okay. Probably the only thing broken that matter is perf list when
you have a BIG.little system with a520 and a720, this may be broken
with say a a53 and a72 today as both of those suffix lengths are >2,
but maybe they use the "armv8._pmuv3_0", "armv8._pmuv3_1", etc. naming
convention. I suspect the >2 here:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/tools/perf/util/pmus.c?h=3Dperf-tools-next#n80
would still work and be correct if it were >4. If that changes then
this will also need to change:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/Documentation/ABI/testing/sysfs-bus-event_source-devices?h=3Dperf-tools-=
next#n12

Thanks,
Ian

>
> Thanks,
> Namhyung
>

