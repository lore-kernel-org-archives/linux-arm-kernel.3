Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90027C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH6gCwcBfooV/1R4mxoSj5XvySZqaE4EBHJnx789OnA=; b=f0uorvpMKvdD77e2m5hsj8YDHh
	+D74vCXkPVSuU+iGhw44w27efvmughh2M8AY4hF6oWACHLk5Noavy14/kmk/DrcT3i2Chk1rA0sSl
	M+YIyZxrPs5an+xob+f9gZukRnRZF89C1CCdkcVY5Ira5LVIVGBEuH8X2vUE70A+XbJnnoNk4zGjC
	uqhYu0i7W+SewcK4emCJaUr801dpoXwe5yKp/k+d2ul/NwDKvYoPNZ5xApHgo/Dl6P/tkA1IZfMZs
	S+ZVsHZJ+5+OZ7/SnhiMkEw/+W37ktlrmVRQ2ECU4EyuuFMPyK6JuI5j/sfP8kC4+EcOhhC9DWY6q
	A0DNlW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoyy-0000000EPnB-4Bqr;
	Wed, 19 Feb 2025 18:39:41 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoxU-0000000EPNn-2nar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 18:38:10 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3d19702f977so10605ab.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 10:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739990287; x=1740595087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SH6gCwcBfooV/1R4mxoSj5XvySZqaE4EBHJnx789OnA=;
        b=Y2pOdUDQ6dYt+iXMuxPjuuxHDwMcPqkiGcXq6K9RdTWkF7fxvJyw5j3m8IC2ZL97Dj
         iK+HU09Dxkp7Lbznr8HzSRQus93fkfmsWliWoKeDlLcDjM7E1GG8A5lA9e1wbVOINEAu
         bRkRgQGMdJlG1+Nf8RaN7NeFMAigZREwvPBx1gBshiojGsuXp7PmiVI82DaZlOV7GIRf
         IbhMxQsTgGiaPmyjNCYMUhiQJVb4T8KG+xtPL5xTJrbbx0X0ZQy5+bXY7r+ssegiFtsY
         67pI3EcmxSvI2nMjeG52IKmRTuV5WVSepOkUp2wASt7FOUE2AKR064wYPmDrhAguAIoh
         /Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739990287; x=1740595087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SH6gCwcBfooV/1R4mxoSj5XvySZqaE4EBHJnx789OnA=;
        b=HaO/CUWuCmB9X5BiZphCA4xffk+CWqSVuLDkh4lYFYXY6RFKWJO4ESBOCiQOXsW2gM
         RNT5F7vOxag97dkumTraZ3MA87vg/6SmK882vPs6SqCDa3YZv2P6LvD7/C4tYzd7Djc/
         1PPzkqzc0lwh4kqSpRkS+6jsejsdnA0eCSQz/BuzyBGMWcBKxnmhbvpkArDFJm3N0Zsn
         8qMmvM2spUFcNlE1n0A7UAY+l0FkHNz/hj/4g8CjHA8wDkOtNWSRy4aDEHvtLgNOxRE9
         VoFtTQK8xrP8Qcr8wZu7a89b/UxECcv0lkIQF0kEyxHwK0Cjc4p0PfjD1ETPQzjaDCkM
         Cocg==
X-Forwarded-Encrypted: i=1; AJvYcCWs+l9p99rtHgdHBYmdSvU8ijHOJD6SBLKhc1wuSng2dEXWtZgg41zzULpPOgXCgrMKCgiDN2yVbRUslSxpJqJn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh2Ip56UUeYkyfV3+mEt9RfoZXVEeM1zUstNVmdvOeuUNYVz67
	RfMpw4zQke7O1GbMZglmKi+hWFjaxNe47G/mCjgsQz9XeN2UQDMG3+sDKEFraWXZ/aoGbiMFZuf
	iT7n4IvfXiq3Lng06SoMSZuS+BupRj0ILGrmD
X-Gm-Gg: ASbGncumVpZCxSFMTT9dXw4cVe+G7+Y4PkXfWnvEt6CSsNJL+TKaYV72DE8QW2qC+Ll
	TIoIzg12TmdHTVcbh6WTV9edhUCKs8QfEls7HOZZnSmpFJ2wLzrtUmVXzlwfY5pXbgeBV7v3XFE
	Oi5tVpVfY/zUdFJiJfsQpQp841ow==
X-Google-Smtp-Source: AGHT+IEkPdMwZ8WcM0NCVDBRKNBfRF3H5QjAYRWB9xGokTDyk0HbI2IP6QgSQCQIroSqKz5jQL30tQKsNIXmV5emA5M=
X-Received: by 2002:a05:6e02:170f:b0:3ce:7852:1e9 with SMTP id
 e9e14a558f8ab-3d2b7622218mr3867015ab.17.1739990286725; Wed, 19 Feb 2025
 10:38:06 -0800 (PST)
MIME-Version: 1.0
References: <tencent_5360DA048EE5B8CF3104213F8D037C698208@qq.com>
 <Z66YjGvjD_yzEHUg@google.com> <tencent_45B4E91CA370C563D6420A1A25F992056D09@qq.com>
 <1b8b234f-6435-45cf-83e7-8e86c84f075f@linaro.org> <CAP-5=fVAhLLH-a0_wLo8dPoMLOb6rOJiTgGh-OFZJJoaLFE-8Q@mail.gmail.com>
 <fe46069e-c52e-45ee-b4b3-8b929fb83b31@linaro.org> <Z7UHieRRnvRb5_oU@google.com>
 <CAP-5=fWXmNoFLyWv+vo7hhLSqTDy7hf+-huKRD9OUWnO-GESRw@mail.gmail.com> <2834c9d7-f401-4b29-8f92-22193eb9ce31@linaro.org>
In-Reply-To: <2834c9d7-f401-4b29-8f92-22193eb9ce31@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Wed, 19 Feb 2025 10:37:54 -0800
X-Gm-Features: AWEUYZmb7ZDC7Xg-vuEYcAR-MFR4dQhVVLJv_XLUmWBSLQWG90K_v4rSjZP5nUo
Message-ID: <CAP-5=fW_Sq4iFxoWPWuixz9fMLBPyPUO0RG0KPbYa-5T0DZbTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] perf vendor events arm64: Add A720/A520 events/metrics
To: James Clark <james.clark@linaro.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
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
X-CRM114-CacheID: sfid-20250219_103808_707141_9F9B1857 
X-CRM114-Status: GOOD (  49.17  )
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

On Wed, Feb 19, 2025 at 7:25=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
>
>
> On 18/02/2025 10:33 pm, Ian Rogers wrote:
> > On Tue, Feb 18, 2025 at 2:19=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> >>
> >> On Tue, Feb 18, 2025 at 09:30:23AM +0000, James Clark wrote:
> >>>
> >>>
> >>> On 18/02/2025 12:41 am, Ian Rogers wrote:
> >>>> On Fri, Feb 14, 2025 at 2:02=E2=80=AFAM James Clark <james.clark@lin=
aro.org> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 14/02/2025 5:49 am, Yangyu Chen wrote:
> >>>>>>
> >>>>>>
> >>>>>>> On 14 Feb 2025, at 09:12, Namhyung Kim <namhyung@kernel.org> wrot=
e:
> >>>>>>>
> >>>>>>> Hello,
> >>>>>>>
> >>>>>>> On Thu, Feb 13, 2025 at 11:11:01PM +0800, Yangyu Chen wrote:
> >>>>>>>> This patchset adds the perf JSON files for the Cortex-A720 and C=
ortex-A520
> >>>>>>>> processors. Some events have been tested on Raxda Orion 6 with C=
ix P1 SoC
> >>>>>>>> (8xA720 + 4xA520) running mainline Kernel with ACPI mode.
> >>>>>>>
> >>>>>>> I'm curious how the name of PMUs look like.  It is cortex_a720 (o=
r a520)?
> >>>>>>
> >>>>>> The name of PMUs comes from Arm's documentation. I have included t=
hese
> >>>>>> links in each patch.
> >>>>>>
> >>>>>>> I remember there's a logic to check the length of hex digits at t=
he end.
> >>>>>>>
> >>>>>>
> >>>>>> Could you provide more details about this?
> >>>>>>
> >>>>>>> Ian, are you ok with this?
> >>>>>>>
> >>>>>
> >>>>> I think they wouldn't be merged because they're core PMUs, so shoul=
d be
> >>>>> fine? Even though they would otherwise be merged because they're mo=
re
> >>>>> than 3 hex digits.
> >>>>
> >>>> Do we know the PMU names? If they are cortex_a520 and cortex_a720 th=
en
> >>>
> >>> It will be "armv9_cortex_a720" from this line:
> >>>
> >>>    PMUV3_INIT_SIMPLE(armv9_cortex_a720)
> >>
> >> I see, thanks!
> >>
> >>>
> >>>> this comment at least reads a little stale:
> >>>> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next=
.git/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n76
> >>>> ```
> >>>> /*
> >>>> * There is a '_{num}' suffix. For decimal suffixes any length
> >>>> * will do, for hexadecimal ensure more than 2 hex digits so
> >>>> * that S390's cpum_cf PMU doesn't match.
> >>>> */
> >>>> ```
> >>>> James is right that core PMUs aren't put on the same list as uncore/=
other PMUs.
> >>
> >> Ok, then I guess we're good.
> >
> > I think you may be able to do things that look odd, like today the
> > "i915" PMU can be called just "i", I think the a520/a720 naming will
> > allow "armv9_cortex/cycles/" as an event name, then open it on two
> > PMUs if they are present.
>
> I assumed that was the intended behavior. It seems fairly useful to be
> able to open on ones with common prefixes.
>
> > We may only show one PMU in perf list as
> > that code I think assumes they're the same PMU as they only differ by
> > suffix:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n384
>
> Yeah that is the case. I didn't realise it when looking at the previous
> fixes to keep the suffixes in perf stat output.
>
> > I can imagine aggregation possibly being broken, but I think that
> > works off the number of PMUs not the names of the PMUs, so it should
> > be okay. Probably the only thing broken that matter is perf list when
> > you have a BIG.little system with a520 and a720, this may be broken
> > with say a a53 and a72 today as both of those suffix lengths are >2,
> > but maybe they use the "armv8._pmuv3_0", "armv8._pmuv3_1", etc. naming
> > convention. I suspect the >2 here:
>
> Also the case for a53 and a72 right now. Even "perf list --unit
> armv8_cortex_a57" doesn't work because we deduplicate before filtering.
> Adding -v fixes it though because that disables deduplication. Perhaps
> we can change it to disable it with the --unit argument?
>
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/pmus.c?h=3Dperf-tools-next#n80
> > would still work and be correct if it were >4. If that changes then
> > this will also need to change:
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/Documentation/ABI/testing/sysfs-bus-event_source-devices?h=3Dperf-to=
ols-next#n12
>
> That could be an easy fix. If >4 is enough to still get rid of all the
> uncore duplicates I can make the change?

The change would be great. I think it is sufficient and doesn't break
the suffix:
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/drivers/perf/arm_dmc620_pmu.c?h=3Dperf-tools-next#n710
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/drivers/perf/arm_smmuv3_pmu.c?h=3Dperf-tools-next#n921
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/tr=
ee/drivers/perf/marvell_cn10k_ddr_pmu.c?h=3Dperf-tools-next#n1062
it is hard to tell as it is going to depend on the memory addresses
placed in the PMU names. Perhaps you can clear this up and add zero
padding in the drivers if the suffix is <=3D4 ?

No documentation here:
https://www.kernel.org/doc/Documentation/admin-guide/perf/mrvl-odyssey-ddr-=
pmu.rst

On a test machine I see in /sys/devices :
..
arm_dmc620_10008c400
..
on a different one I see:
..
smmuv3_pmcg_20528a2
..

so >4 but this is an ARM specific issue as far as I can tell, so you'd
be better placed to judge correctness than me.

Thanks,
Ian

> >
> > Thanks,
> > Ian
> >
> >>
> >> Thanks,
> >> Namhyung
> >>
>

