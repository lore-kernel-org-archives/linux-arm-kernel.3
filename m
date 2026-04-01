Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCBE10FCAD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 20:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qItXOIPrlOJqWrbJliKI/xUeFEFgaVo0zObBoX/Mh/8=; b=wUepsyr4IUfpZTbBE4cRZUuOQo
	pQd1Fh660RFyhoKi2G/I1ghyN8RFz703ijReWn1xfViAo6waWmatrUbK1jTKXqsiAL2soM1qp114D
	gFgE4ziUCKGDhmCXD4A/6MH4FmJg2lgd/A3brcLLypvBiIsMmxq1J8OmcjhXG64SDl23N+sT8R7hh
	7a1FGBN90lHlwNLXD/DNMWdYk/1jM4PaHY8xcHIBZoz2Gm/wZiz0qdHtvIcyAsEmXaqhil+Doei1p
	wcHmBT3siXvwK0aotQ/Asfg/sjG6YpazFniG4WGhFWc9JZmeikzypIYyzwISY2Y+PMx5vob0lFKsh
	kJKGq8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w82Yf-0000000G4v5-49B3;
	Wed, 01 Apr 2026 20:53:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w82Yc-0000000G4ui-2u3c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 20:53:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b243198058so6525ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 13:52:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775076777; cv=none;
        d=google.com; s=arc-20240605;
        b=Ttf80W+nF/ycxoGIUl+gIwR2qXUgNT+p3qPHhK/GZ5hl2len5LyVDkSzc7hQrlhGnl
         U/MxgGRwdUp+HQMh3IQYs/dXkvsNohPZj76XKUlYh8viv0lQQpssExAsLAzi3VDJuKQR
         5yqKlD7fv3DoPTAxtsaP4jXVntG30buDOgFjlHeaD0/fd8z6evKWnl5Wkg6szLndY+AE
         u91J0h90mh2LOFoF3OK9nAv9SP8UQdbWlUF7pcNsSD7jylYhjnePG3vyyOPGu+IKhpAv
         CY1j/e9cZm9pHkMeR603Bk2vGbanx0pfWXnbRdbvVr3D8bfwOBzWbmJ1jF+/2TkvBEsI
         C/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qItXOIPrlOJqWrbJliKI/xUeFEFgaVo0zObBoX/Mh/8=;
        fh=YiLdkOiDplzHDPayaX7jh7ahXQnLBHlU67Otk/agvdk=;
        b=iuAoKWF5ZiCb4SLvkiiK/8r+hX742FTb95E8IeqC0tWh6rM7HTewzLjS+D99m7+FHy
         3O2dLhpZ6vHncTBmVfsfIF+bu9ydxtJVm4DKVkxrv7hjz6S/PyBNQe5m7xJTZstzg/Pc
         V/r2LflVKWYkTlm1WN9iYlFl7OMRnk2QqcW/LNqj7cMp/RW42JmnE+VO1QEdlM+BkDJt
         jf0iUMO0FVhXoLyGxI2FTfOfv8laP9IFLsIZqIQl/MUMgnKAq4yXbej8PfNVAlYca0ix
         PeD9RHTSNSPn431hWikjGZ2fgu89RUEgo0I48hPrGSwAyQlzlSXoT9TmtEku/odP3q8/
         NLaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775076777; x=1775681577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qItXOIPrlOJqWrbJliKI/xUeFEFgaVo0zObBoX/Mh/8=;
        b=LDHh1/Dn2oeJnupMqoL6cSinX3f5UO9UMWHnRoC3XaYHz49/9U3YBMrGIXUH+doTdJ
         wqG2Zj385SOs7tK/wmozwDM4gDh5Ai1woiwgonwSDLUL+FQAlF9YU9wcs7x3KEhPlL8A
         BEEmp5EBzO0fWBc0XOZ33jRE0llcu0bVOXzgl+o3YmLi2z7bpUMNoc7P+eCra+WSzt4k
         ABPS8kDEwuFeXTMzwceqIbQcyIFae8gguggIDIV5O0MRePSwAWsbVUoRLhk3JrDIVGPH
         VmF+V4G05r0kKLFkzWgljWyc5usl/hycKWOmQCJlJoN876JGQvXXozaaFJg3cYAdA1HF
         Coag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775076777; x=1775681577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qItXOIPrlOJqWrbJliKI/xUeFEFgaVo0zObBoX/Mh/8=;
        b=NRlpJKRMxW3FutLw4JG9SbfZPlwJ3GysGkOJ+cv4Grwmvm1aU97ZKiGOsuBfgAxG3S
         BFB/ucOlRqY+EYHyr7IZ4NASrSh1YEz4Pb74PJUPn6fEqYcriGYmk0H3CoJrP1jhuc4g
         GWrONef5x2NiT62gI9s8W13hkmXwI9qXPCXkPErKpiyNkNOltEPVbR6iCMfaP1D+4zgt
         Fvruf9apBEFyfrF8RLIlAY9KGo7ERpxv9m+Zspi4p5ZhTcVsxKk6ItdWFiVo00WhFbdN
         /3XAc5HBrNBAyJ9MLNSm35lbta2750ptWFDYZEWjGNg3NzFdC3cRdlm0Zdd/kQtXuZgR
         CgKg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ9+KbdDDWy0ansxKVyeZ8z5H7B16YpxV6NMz8D1CmsZ+OoP+lonMgyVfnRONHDcPTG4OCQWNyEQTwH6uHixqa@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc4XoQsKC5HQd/KoM1mxSkMDFvlOOC6WzDC3w4oDqIk6pZlxjm
	9Uc0TaDzmU7DmrlbWDkZvRdvwlVLkP8tT4GwV6fEuCCuCArAcgtm1aoB85Byd5EU/MvV8TBLqE8
	3h0LOzslPQxzcJmmdSaTy8q/MDL8QBKK81Dz5L7WY
X-Gm-Gg: ATEYQzy+AgmerYb2C6gk69HO0H86S2riXDk9iHNL9yUX3nox+zxuzy/iz9zb9ShTG+o
	WAMcY/pdnqQGzH9czXdvfug/XinFNRRT+fKQWCpdo9I1tniVYconsyq8+vRrfSmfo6sMHTYPXMJ
	XCIpq6/lhOKhP6vv/GF90JMZVrlLt/zcK1NVqRYWoUeeWGsARobdhAf/wEesK1dzt4DbK7FIB/s
	CNQPPPGPSjfy1cT8B8sZ4KZ+j96ejsPjJSePd2J39OLJrb5cxwb0lZ9OS8yWTnLL8gRRJQ9o2fU
	c+tBJeRv9J540Vmc0ISgBa4rzoNps1/vY96i
X-Received: by 2002:a17:902:e788:b0:2ae:575b:2345 with SMTP id
 d9443c01a7336-2b276af630fmr347195ad.9.1775076776423; Wed, 01 Apr 2026
 13:52:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260126123514.3238425-1-wangyushan12@huawei.com>
 <CAP-5=fWkBjJy2i=e+zn1Ou5g3J8rapGKi8O7ryQ-ic2vXFEOoQ@mail.gmail.com> <d8639ed9-63d9-4a61-8cce-72f4b7fcb872@huawei.com>
In-Reply-To: <d8639ed9-63d9-4a61-8cce-72f4b7fcb872@huawei.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 1 Apr 2026 13:52:44 -0700
X-Gm-Features: AQROBzB-RkizY5trQwsbMUj3yzVWTc2iQyH6pdEcyLX7bSLsHyFCYxZPcVGRMIQ
Message-ID: <CAP-5=fUmozPRDgms0QxHS5G3O8csrhyak9TWGGXeYE+QwiSHQA@mail.gmail.com>
Subject: Re: [RFT PATCH 0/7] perf tool: Support iostat for multiple platforms
To: wangyushan <wangyushan12@huawei.com>
Cc: mike.leach@linaro.org, mingo@redhat.com, acme@kernel.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, peterz@infradead.org, 
	john.g.garry@oracle.com, Jonathan.Cameron@huawei.com, shiju.jose@huawei.com, 
	will@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com, 
	liuyonglong@huawei.com, prime.zeng@hisilicon.com, fanghao11@huawei.com, 
	wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_135258_740053_00B628AC 
X-CRM114-Status: GOOD (  49.38  )
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

On Thu, Jan 29, 2026 at 7:15=E2=80=AFAM wangyushan <wangyushan12@huawei.com=
> wrote:
>
>
>
> On 1/27/2026 1:01 AM, Ian Rogers wrote:
> > On Mon, Jan 26, 2026 at 4:35=E2=80=AFAM Yushan Wang <wangyushan12@huawe=
i.com> wrote:
> >> Currently, platform-specific iostat code for PMUs is implemented as a
> >> common iostat callback interface and invoked based on what is being
> >> built. This approach limits support for iostat across different types =
of
> >> PMUs.
> >>
> >> Support of HiSilicon PCIe PMU iostat was raised at [1], which uses the
> >> similar approach.
> >>
> >> To extend support of iostat across platforms, change common iostat
> >> interface to framework to allow perf to probe PMU capabilities during
> >> runtime and route iostat request to the correct PMU-specific functions=
.
> >> Then HiSilicon PCIe PMU iostat is supported with the new framework.
> >>
> >> Request For Test:
> >> Refactors has been made to x86 iostat to adapt the iostat framework, t=
he
> >> probe function that checks if there's any PMU's name contains 'x86-iio=
'
> >> may not work properly, tests of that would be appreciated.
> >>
> >> [1] https://lore.kernel.org/all/4688a613-c94a-49b0-9d0f-09173c64082d@a=
rm.com/
> >>
> >> Shiju Jose (2):
> >>   perf-iostat: Extend iostat interface to support different iostat PMU=
s
> >>   perf-iostat: Make x86 iostat compatible with new iostat framework
> >>
> >> Yicong Yang (1):
> >>   perf-iostat: Enable iostat mode for HiSilicon PCIe PMU
> >>
> >> Yushan Wang (4):
> >>   perf stat: Check color's length instead of the pointer
> >>   perf stat: Save unnecessary print_metric() call
> >>   perf-x86: iostat: Change iostat_prefix() to static
> >>   perf-iostat: Support wilder wildcard-match for pmus
> > Hi,
> >
> > Thanks for the changes! Given the iostat code is display code, it'd be
> > great if we could avoid the arch directory usage. For example, I may
> > record data on a machine with a HiSilicon PCIe PMU but then want to
> > look at the data on an x86 laptop, as the code is under arch/arm64 it
> > won't get built.Given the PMU name is unique, is it possible to put
> > this code into tools/perf/util and determine whether to use it or not
> > by seeing if the PMU is present by its name? I know that means
> > refactoring the x86 code that hasn't done this.
>
> Yes, iostat itself didn't do much more than rearrange the display
> format. I can try to refactor that to the util directory, though x86
> iostat may need even more testing :)
>
> > A thought that is away from the iostat code and may simplify the code
> > base is that we could introduce system PMU, rather than CPU, dependent
> > metrics. Perhaps the iostat code could be replaced by a particular
> > metric group like Default or TopdownL1, so `perf iostat` becomes
> > something of a synonym for `perf stat -M iostat`. An example of what
> > this may look like is (unmerged):
> > https://lore.kernel.org/lkml/20260108191105.695131-34-irogers@google.co=
m/
> > where I introduce a memory bandwidth saturation metric dependent on
> > uncore PMUs (either cbox or cha) on Intel. There is a metric
> > "have_event" function that can be used to make a metric conditional.
> > If you `perf stat record` a metric today and then look at the
> > perf.data with `perf script --fields metric` (IIRC) then every metric
> > that has the recorded events within it will be computed, although the
> > code needs better testing, etc. I suspect the biggest downside to this
> > approach is in how the output looks, but perhaps that can be tweaked.
> > For example, the `ilist.py` command:
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-nex=
t.git/tree/tools/perf/python/ilist.py?h=3Dperf-tools-next
> > supports regular metrics.
> Since iostat is a small sub-command with not many events involved,
> it is great to have some events extracted as system metrics, like PCIe
> bandwidth etc.
>
> But the variety of bdf filtering and display may be difficult to adapt
> to the way metric does it. What do you think if we leave the iostat as
> is for now and maybe merge it to system metric infrastructure later?
>
> > That said, I'm not against the changes, the arch directory usage, not
> > using json metrics, etc. and this change is doing clean up, following
> > existing patterns, etc. Sometimes the codebase has evolved but certain
> > commands haven't kept up. I think `perf iostat` is a command like
> > that.
>
> And we are trying to make it follow up!

Hi Yushan, thanks for your effort on iostat! Did you have chance to
work on follow up?

Thanks,
Ian

> > Thanks,
> > Ian
>
> Thanks for the feedback!
> Yushan
> >>  tools/perf/arch/arm64/util/Build         |   1 +
> >>  tools/perf/arch/arm64/util/hisi-iostat.c | 479 ++++++++++++++++++++++=
+
> >>  tools/perf/arch/x86/util/iostat.c        | 105 +++--
> >>  tools/perf/builtin-script.c              |   2 +-
> >>  tools/perf/util/iostat.c                 |  79 ++--
> >>  tools/perf/util/iostat.h                 |  21 +-
> >>  tools/perf/util/pmus.c                   |  12 +-
> >>  tools/perf/util/pmus.h                   |   3 +
> >>  tools/perf/util/stat-display.c           |   4 +-
> >>  tools/perf/util/stat-shadow.c            |   4 +-
> >>  10 files changed, 638 insertions(+), 72 deletions(-)
> >>  create mode 100644 tools/perf/arch/arm64/util/hisi-iostat.c
> >>
> >> --
> >> 2.33.0
> >>
>

