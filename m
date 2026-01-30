Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EF3E6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=; b=LblkV8ct47bv5IUXkod1d2xlRz
	Gm7lrr6XyOYTUwNldAa8VxM5AuLwXfHRnLB/XnmcO2D2qlwy+xZ9lU4CXCtfFqs2VcPZQg4vE9r/x
	ABFtqHqAGXWNqbydH6SoIzraA/ATyd6LnhKH2wNxkCfOG+JagIVrVwkNwDasuc+Po5tkFUQf01nTK
	//F8MhCKAy5gMolJmbeMW8zXAYMxrMH1SXrl4jD+sCvJxURHXadcU9TdNjkPkiJZSSgmP3NhDgqTF
	IURRXNQZFW6uRrZ7Mf3sMgRZb+jg/DWidPlY9VB/GZBZgEBTaY24zv+cNHCp9/8uSZYoE8+N9mlGR
	oie97nwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlumR-00000001utF-1Bom;
	Fri, 30 Jan 2026 20:07:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlumO-00000001usu-0khr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:07:45 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a8e4ae61a0so15355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769803663; cv=none;
        d=google.com; s=arc-20240605;
        b=h4F1tr/j3fEjq9x4oXEhieG4lR6nD5wKky6cVUyPu+DKWLJDlxVLL0udxm7Z2EspsB
         Q+g5TPnAG7GWDuqPXtAcae8WgT7ES867Z1KQBeB5WNNgozdnahpFn8wm+45tFJ172U/p
         ZUmT2oM+Vg1hfnUZy215zmYNe7vuDGefJX1AY3hqtNXONj6tn6AQI8IpJiyTCSyqKEFc
         UvXk7es/OM+j19KLTHB+vA1AIqml3q7MCBltmr3paII4TZgkfnWZgG8LKCR3c25YW6pU
         hujBPY/yArVxHEiCqNO9ULYkhO8GmTVSIWOgr7yHQXo/U54smgsPPQAr0YYFX3UrIErX
         tR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        fh=jnTF4f5b0QcV3BzQ40yzW2G0aQi4TX+3XRc3NZBfM7g=;
        b=Eba7kX/4sJJ+anIj4cSVxTHp2c4Zr+iECIwQrQkCeSbZoW98ba/k8zFzsDHUzDLMv/
         g05JLHVYifmQ0t6lFb5fbI3iAgdtNlURZOOW57G9t3WHJO06KtG3nh4cAOXHOnPRAY0N
         p1a4L4QYjkavHs8vHKECFlD/hDnias+5VXEAY+1+Ibnwzrsy/XFAFvJ2poNTM5yxiufe
         JmYgi2Y6ORlg1jQTt2yeO9LtNfNeJt8uGwQjbMN8WrsP4FExsb7J5BJyEAUtuy6k0fb2
         VatYnNwdZQgHG125m40KNK85y7cHVZ3/0I7+JL+6tS4ISQXg4zMJnq+IdsD6TZ9Z26sI
         5ECA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769803663; x=1770408463; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        b=N0QSz84AE5ipsNJIID0Pg9lp8b6TCgQ0nQcsuOxK1lkUXflTmqmzC029LU0ks8Qw1r
         +0RtN+lyjJcfTGKZnk8q3NjzWc2IQKHTkJno7Y8V3TBcOV0OhjVN068XZD85lG27/OO3
         rAjayjckcHWChDGE2fDN6uqJDbtMGcvBUdVrKv12WAoSNvklazWTVf+RXs+pox4B0X9f
         ed8f90T0hym68iJ9kDKcC4a5KHpWmKFo0D36ycTzwH2AG+pEgVCEC1j4GDZiUXq4GHm3
         RlSM5ZUJGMP7GgQm7kxEcZbLZRoCtPiQI57sn2iW6euPgWXkh3Uh8EbETY2TjOpqM0LE
         gVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769803663; x=1770408463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xfZ/yn2sX+8CvDNrIoBnhlU34L/OaV7M5POjaoUPrSs=;
        b=b2aJ3iiIn7f+R6ubu8DWyx06irw0rtSQYFfrVm6Zujxs3KzyP6tblXmo6vUkhEX2xK
         y3gAI8gaK8kj4ixh2p+euzc+i/L7fXmbAbC92ubtwrtVEk3xsJO5cNdvzh1C+aduuRqP
         iF4g9efOhyWtZo8tPNG9MANR7zPg6E3+gx9aLCMrPRdOw/ZkujF3dYEy1hj+FQFQJrbP
         BkbDW5Jlx1CFBUc3d17rQ84cGMmbreqjr5CKz0hAkEQhp6ZJ/DHgTR/tNruonkNY7lFB
         AG4SzXBbHIFXBP9b4INKi5lf0FNQE1OLSBWxyt3YCn2DEd0fPohHbr8wW8+A7t7pCJdo
         92gw==
X-Forwarded-Encrypted: i=1; AJvYcCUWg2CVSW0MxfN1mePITwb7PEVfU3UbZcsEJU56WuwFthFrhKAbUT/wWy0NRbhk8fJRKCNdUS94YBfIiaFf+k86@lists.infradead.org
X-Gm-Message-State: AOJu0YzaKnMPPMJU6qciHME3byZg2nOfxcevB2uf3dcN3GqZo1zi9MN8
	169AKrcZetQ2j+Vs8uKJsIgIWiDnXYfR5YcgSpUCmZtad4KrnU65VEiC7UNXbSW638ruuoGU13m
	rx4sZxc64Xn/M8sfobF+yfMMyRpUbLGHpxkMRpRZc
X-Gm-Gg: AZuq6aIwD4vnisPO3KmJ9UUe+vpD5qPRFdZjISF9cUtCG1wtYAMzo9wUSQt1vq64yOY
	Prwl+lFrtMtoonF5h2C7QuBGY9B+/xtPuqRfs9Yxtma6bgMuS/ul97jyusFgtN+jjR25HlK4fT0
	vph64tRriis3j0ybJIl0u1N84spW9PNmhg0QSJ4McZngaom8dHIDY5KDADGzPr/JfRHJMzjUOSA
	xlgUpnJioK4xssFFh/joIGmHdQHQrXzKik3gOjgVtrrZ7rQJ8h/GejksTGl91fXURJUbsgWwwmZ
	mJ1u1F4qS6eJ2jZ5gqLxzCi4
X-Received: by 2002:a17:903:3d07:b0:2a7:4151:2c74 with SMTP id
 d9443c01a7336-2a8f32da681mr397915ad.16.1769803662323; Fri, 30 Jan 2026
 12:07:42 -0800 (PST)
MIME-Version: 1.0
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
 <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
 <40988c57-ee6f-4693-afe4-2615dc43f395@linaro.org> <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
In-Reply-To: <MW5PR12MB5681E958BDDCEB137E65CE54A09FA@MW5PR12MB5681.namprd12.prod.outlook.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 30 Jan 2026 12:07:31 -0800
X-Gm-Features: AZwV_QgiJyUG5mr0pnscOQIDv9TtdTed9GqfFQg3UrXw3XStpF8ShZ6gj_R5UHg
Message-ID: <CAP-5=fWB_nbnc6W9X-6iJH-ZasFriASOtduLjFLgY_exRKCqnQ@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: James Clark <james.clark@linaro.org>, 
	"john.g.garry@oracle.com" <john.g.garry@oracle.com>, "will@kernel.org" <will@kernel.org>, 
	"mike.leach@linaro.org" <mike.leach@linaro.org>, "leo.yan@linux.dev" <leo.yan@linux.dev>, 
	"mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"mingo@redhat.com" <mingo@redhat.com>, "acme@kernel.org" <acme@kernel.org>, 
	"namhyung@kernel.org" <namhyung@kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thomas Makin <tmakin@nvidia.com>, 
	Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>, Sean Kelley <skelley@nvidia.com>, 
	Yifei Wan <YWan@nvidia.com>, Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Matt Ochs <mochs@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_120744_322925_EB994BD0 
X-CRM114-Status: GOOD (  46.91  )
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

On Fri, Jan 30, 2026 at 10:08=E2=80=AFAM Besar Wicaksono <bwicaksono@nvidia=
.com> wrote:
>
> Thank you James and Ian for the comments.
> I will try to address the spelling mistakes on v2.
>
> Please see my other comments inline.
>
> > -----Original Message-----
> > From: James Clark <james.clark@linaro.org>
> > Sent: Wednesday, January 28, 2026 3:37 AM
> > To: Ian Rogers <irogers@google.com>; Besar Wicaksono
> > <bwicaksono@nvidia.com>
> > Cc: john.g.garry@oracle.com; will@kernel.org; mike.leach@linaro.org;
> > leo.yan@linux.dev; mark.rutland@arm.com;
> > alexander.shishkin@linux.intel.com; jolsa@kernel.org;
> > adrian.hunter@intel.com; peterz@infradead.org; mingo@redhat.com;
> > acme@kernel.org; namhyung@kernel.org; linux-tegra@vger.kernel.org; linu=
x-
> > arm-kernel@lists.infradead.org; linux-perf-users@vger.kernel.org; linux=
-
> > kernel@vger.kernel.org; Thomas Makin <tmakin@nvidia.com>; Vikram Sethi
> > <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Sean Kelley
> > <skelley@nvidia.com>; Yifei Wan <ywan@nvidia.com>; Thierry Reding
> > <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Matt Ochs
> > <mochs@nvidia.com>
> > Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU
> > events
> >
> > External email: Use caution opening links or attachments
> >
> >
> > On 28/01/2026 8:03 am, Ian Rogers wrote:
> > > On Tue, Jan 27, 2026 at 3:00=E2=80=AFPM Besar Wicaksono
> > <bwicaksono@nvidia.com> wrote:
> > >>
> > >> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> > >> Also updated the common-and-microarch.json.
> > >>
> > >> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> > >> ---
> > >>   .../arch/arm64/common-and-microarch.json      |  90 +++
> > >>   tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
> > >>   .../arch/arm64/nvidia/t410/branch.json        |  45 ++
> > >>   .../arch/arm64/nvidia/t410/brbe.json          |   6 +
> > >>   .../arch/arm64/nvidia/t410/bus.json           |  48 ++
> > >>   .../arch/arm64/nvidia/t410/exception.json     |  62 ++
> > >>   .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
> > >>   .../arch/arm64/nvidia/t410/general.json       |  15 +
> > >>   .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
> > >>   .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
> > >>   .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
> > >>   .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
> > >>   .../arch/arm64/nvidia/t410/memory.json        |  46 ++
> > >>   .../arch/arm64/nvidia/t410/metrics.json       | 722
> > ++++++++++++++++++
> > >>   .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++=
++
> > >>   .../arch/arm64/nvidia/t410/retired.json       |  94 +++
> > >>   .../arch/arm64/nvidia/t410/spe.json           |  42 +
> > >>   .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
> > >>   .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
> > >>   .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
> > >>   20 files changed, 2905 insertions(+)
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/branch.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/brbe.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/bus.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/exception.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/fp_operation.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/general.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l1d_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l1i_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/l2d_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/ll_cache.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/memory.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/metrics.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/misc.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/retired.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/spe.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/spec_operation.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/stall.json
> > >>   create mode 100644 tools/perf/pmu-
> > events/arch/arm64/nvidia/t410/tlb.json
> > >>
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-
> > microarch.json b/tools/perf/pmu-events/arch/arm64/common-and-
> > microarch.json
> > >> index 468cb085d879..6af15776ff17 100644
> > >> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> > >> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> > >> @@ -179,6 +179,11 @@
> > >>           "EventName": "BUS_CYCLES",
> > >>           "BriefDescription": "Bus cycle"
> > >>       },
> > >> +    {
> > >> +        "EventCode": "0x001E",
> > >> +        "EventName": "CHAIN",
> > >> +        "BriefDescription": "Chain a pair of event counters."
> > >> +    },
> > >
> > > Cool stuff :-)
> > >
> > > For wider counters AMD does something similar, but should this be an
> > > implementation detail rather than an exposed event? How does it
> > > operate as an event?
> > >
> >
> > CHAIN should be excluded from the json, it's used internally by the
> > driver when you want 64 bit counters. Userspace can't use it because it
> > can't control where counters are placed to make sure they're adjacent.
> >
>
> Sure, will address this in V2.
>
> > > [snip]
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> index bb3fa8a33496..7f0eaa702048 100644
> > >> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> > >> @@ -46,3 +46,4 @@
> > >>   0x00000000500f0000,v1,ampere/emag,core
> > >>   0x00000000c00fac30,v1,ampere/ampereone,core
> > >>   0x00000000c00fac40,v1,ampere/ampereonex,core
> > >> +0x000000004e0f0100,v1,nvidia/t410,core
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.jso=
n
> > b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> > >> new file mode 100644
> > >> index 000000000000..532bc59dc573
> > >> --- /dev/null
> > >> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> > >> @@ -0,0 +1,45 @@
> > >> +[
> > >> +    {
> > >> +        "ArchStdEvent": "BR_MIS_PRED",
> > >> +        "PublicDescription": "The Event counts Branches which are
> > speculatively executed and mis-predicted."
> > >
> > > nit: The capitalization on Event and Branches, as well as other words=
,
> > > is a little unusual.
> > >
> >
> > If there's nothing specific to this CPU then the public description
> > could be left out entierly. The common strings already say the same
> > thing as this:
> >
> >      {
> >          "PublicDescription": "Mispredicted or not predicted branch
> >                                speculatively executed",
> >          "EventCode": "0x10",
> >          "EventName": "BR_MIS_PRED",
> >          "BriefDescription": "Mispredicted or not predicted branch
> >                               speculatively executed"
> >      },
> >
> >
>
> I will check on this and other events.
>
> > > [snip]
> > >> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.js=
on
> > b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> > >> new file mode 100644
> > >> index 000000000000..18c2fd58ee9e
> > >> --- /dev/null
> > >> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> > >> @@ -0,0 +1,722 @@
> > >> +[
> > >> +    {
> > >> +        "MetricName": "backend_bound",
> > >> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
> > >> +        "BriefDescription": "This metric is the percentage of total=
 slots that
> > were stalled due to resource constraints in the backend of the processo=
r.",
> > >> +        "ScaleUnit": "1percent of slots",
> > >> +        "MetricGroup": "TopdownL1"
> > >
> > > Note, on x86 we place TopdownL1 in the Default metric group so it is
> > > shown by `perf stat` when it isn't given events or metrics to compute=
.
> > > Perhaps you want to do something similar?
> > > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-
> > next.git/tree/tools/perf/pmu-events/arch/x86/icelake/icl-
> > metrics.json?h=3Dtmp.perf-tools-next#n116
> > >
> > > Thanks,
> > > Ian
> >
> > That's currently true for the Arm topdown metrics in sbsa.json, but we
> > probably don't actually want this because there aren't enough counters
> > for the perf stat defaults plus topdown and it results in multiplexing
> > and bad results.
> >
> > I was planning to change it but we also don't currently expose the
> > number of counters available either...
> >
>
> Agree with James, we may not be able to cover all the events in
> Default + TopdownL1 group.
>
> Ian, James, in general, is it fine to put some metrics in a same group be=
cause
> they are actually correlating even though it may cause multiplexing?
> For example, "Miss_Ratio" group in this patch provides miss ratio from L1=
, L2, TLB, etc.
> It's convenient to have this and get the miss ratio from all cache levels=
.
> There are many events needed for this group and it might not be accurate =
due to
> multiplexing, but user can get a (rough) broad view in the beginning.

These things are strings so there's no real rules for how they get
organized other than Default being a special name. For Intel topdown
there's a convention of having a _group as a suffix to allow some kind
of drill down. There's even some support in ilist.py for this:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/python/ilist.py?h=3Dperf-tools-next#n477
As writing json is painful there's code for generating metrics from
Python and that tries to structure metrics inside groups of groups:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/intel_metrics.py?h=3Dperf-tools-next#n264
My hope is that at some point this will allow some kind of pretty
printing of headers and the like.

Thanks,
Ian

> Thanks,
> Besar

