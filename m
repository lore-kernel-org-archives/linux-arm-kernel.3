Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9A1D35687
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=; b=KGMa4aEy6D7tB9sFW9girNtHuE
	F+QDNiXSg97utfcSEW4EnxeunZLdqqJSaVdkBNkaLfkcwUacUsMa83DAH4/e0AKcMa7MfDgxU5r3g
	X8m6BbpIG+3b+Wq/sPv4vn3dAj6xOUM3dILirrXJD2ZCd0sGnXOy2XPDlk6PWdqTq3T0z2zy2Tk5O
	bOlUH/IG3zeKf/b3Jt5iOtgmXYQa24O2UE6XAPrUJSeR139XFiBRASXAIa6n0c04eSBA6Cf2FrokF
	/VX+mxpK+a+nhtbyX8DzWKucXTKAq3VJ57ig09lGkUKMCwUeaD+r7vju9oFMNb2b14AspGSJ2jhiS
	hIkL4GZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Wp-0000000Fdac-3Ruv;
	Wed, 28 Jan 2026 08:03:55 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0Wm-0000000Fda9-43XW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:03:54 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d06cfa93so47095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 00:03:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769587432; cv=none;
        d=google.com; s=arc-20240605;
        b=MwHTdMoOrD3fw6sogYPZnSuSrtzAOp9y7QkkV1JylNbIMGZVilkgpAWsblaTAs1YSz
         xlAYSLw1RMvVwdjngIdLARsxBxzCB55CSflowsQtbnbvhA5uZfMyluU1UZGI4DJiu2lq
         6x2+0sWi6yZuz9gD5duZYLwTr61Ims4Lsal1DpLpr+8Msr+LztITW9OHRB6jw+es/J5m
         hTuegHuPzhVRC+dIUIIaA60+fpJbEYJsDXxwKmmTSIhn+soNACGguyLx28NpZTVF3PRm
         uNK4Yu6VfytUeEiW0FGa7RGpupeUz+KtJrtocXSRs2n+iKHP6KPWbnmIHScKjIqkG7fH
         RTFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        fh=mI1PkMCCDuvwNIByl4dhepg+sy1bYHRmGg+zhSIDK94=;
        b=MJTRSi9eEf801KbiklX+lAsbEelCGzPU48kycFFYRNh7B40JnsocUZXu+AtE9qqcbA
         hjAa/8eqA67/m+NA08GyAHroEXqHf7V6HBYe+elP9EpQZfGjI1heDg96ktxDPix+UVy+
         lzWsQirg9Ty/MvhcmYCggrBXTLE2KybzpYG30a7pMfxsIXcnLkiPW2fT3vlxICgdpVPL
         4IFUCpjX8moHqSTQoMjay+SIicsoqSPqdbzylhpvCxRvBJIOIo8z+YEKPIjRiuvhLwyp
         y4D3qXrTtFJElukdGp6RVTed0+NlIQfeAxaMBfySaj3nFwQ6O2YeeT51OBsHO0mczUbY
         LFag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769587432; x=1770192232; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        b=L3KXNx970u+lQ6ReXRj4itJj0DYRNTJa1JfBfUIL0QTcXR1Yft3PgjospBcuAqDsKY
         zsTrsAo+rUNBWEREgrlPiVS/D4N7slV9K/V2Of9mHLqw1825rahLwDH6XjqnPF/S95gQ
         FyNAEUm6EMv/a6fdBQWv1NqE3GFACBGC1FUXCMxCLGF3V3dov5y4ZGSDTEttigirh7Y7
         NFC9E47sxmYZ6VPeDo87Sm7D6cwvbhZOdv66qjn9nWdhQy6caldORXR1d7rbo9JUGAFG
         oE75Ibr0AEhTFVckyxaWqWieWk4/ySaInsbd3wFDG/ACxUYRJyKprbJM5r055yxgTkJ7
         PXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769587432; x=1770192232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kwxqyPY7kwvh1qYq0RNe4lMNJMkXau1MJhNry6YmLss=;
        b=KtOoxmZOMI3ovgPpp11E8rYVhtlPSxqc2spicdcaMH2MJRTFaAiAMGQJlPGRAO0VFX
         A53fRPRL4VBDfPjcU6480kAl/n+JI4maXlMzmZzqRNCkYUaldwxneigVT/yz7yd8rXuw
         +CH9lTTIU0Ucowln9vtZMeDB8OTewcG/8a4Mhhpfj+seq6ZzVP2a2q3dwA30A5hHOVdp
         +88xgbkv/P2e9q3LvV7l25EdP5tlCQVUd7eH/qfDnhVtTozLOY+MXwXL/kGJht8TcVwz
         R6mVZBAv5g/D6KJhRs8G7xd/QPlIMKna3HWc52YjlUrauPUdNCZqccO77u+iHeUQhUO1
         T1qA==
X-Forwarded-Encrypted: i=1; AJvYcCWLrf18Adjzc7ilOqrrMFzVJELf+uwKehKqIZxdlmDLC7booHd61mswXi9PrsCwFbawWBFePH0iUxuGq+Tvp95R@lists.infradead.org
X-Gm-Message-State: AOJu0YzxZ4jD+c7JqDHceui+lb97ZRWrr+tWb6lRA83g6EX/BFBxXgLt
	vf64U/UiYr10eqyisS2Khb9bV5QbdH1LZ1hWuuYXdunofwTwhG6+bCCLX1ojZAzcIVD6vzo/t3z
	r7WCxGsyJhx3R1YkwPLr4O9N04GdEwaFEqGqMhDnC
X-Gm-Gg: AZuq6aKa5PRn/mcGOs/zlycT5B9d6wX8t1rkKLEFfEGMqK0nl10KQHOw6MtnjTTs3Fv
	r5TfnXA3WWtABBTc65SvGVkHPdcIrQlZ0jFhU68V+YnZy6/p1X7VIRCh1qf0pvboLwEzAvavIKk
	2Ioi6JXRipHtzMrZBdaDVzvMusp8g+OpMmLYmrj8SqEgvvS2YYem0zaCfTIxQUW2gGKh7oLJ1Yh
	8hheEktOA/344lEofRduty+n6U8/ZSAxvki494n3+yL49ANQgfA/RMgCJxIeeSPdu8WVHXo
X-Received: by 2002:a17:903:3c2d:b0:26d:72f8:8cfa with SMTP id
 d9443c01a7336-2a870b49cd1mr4464695ad.13.1769587431647; Wed, 28 Jan 2026
 00:03:51 -0800 (PST)
MIME-Version: 1.0
References: <20260127225909.3296202-1-bwicaksono@nvidia.com>
In-Reply-To: <20260127225909.3296202-1-bwicaksono@nvidia.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Jan 2026 00:03:40 -0800
X-Gm-Features: AZwV_Qh52YOdWkzhjqwDKEE_iLJJ8-fVjQ4au_Elxnl29BT84Z16fQ67obstxk8
Message-ID: <CAP-5=fUxhbR1xs1f9mrkcUXZZNLrVqDG0ebhwW--WtgVRnNxNw@mail.gmail.com>
Subject: Re: [PATCH] perf vendor events arm64: Add Tegra410 Olympus PMU events
To: Besar Wicaksono <bwicaksono@nvidia.com>
Cc: john.g.garry@oracle.com, will@kernel.org, james.clark@linaro.org, 
	mike.leach@linaro.org, leo.yan@linux.dev, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	peterz@infradead.org, mingo@redhat.com, acme@kernel.org, namhyung@kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tmakin@nvidia.com, vsethi@nvidia.com, rwiley@nvidia.com, skelley@nvidia.com, 
	ywan@nvidia.com, treding@nvidia.com, jonathanh@nvidia.com, mochs@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_000353_016448_10897BAD 
X-CRM114-Status: GOOD (  19.45  )
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

On Tue, Jan 27, 2026 at 3:00=E2=80=AFPM Besar Wicaksono <bwicaksono@nvidia.=
com> wrote:
>
> Add JSON files for NVIDIA Tegra410 Olympus core PMU events.
> Also updated the common-and-microarch.json.
>
> Signed-off-by: Besar Wicaksono <bwicaksono@nvidia.com>
> ---
>  .../arch/arm64/common-and-microarch.json      |  90 +++
>  tools/perf/pmu-events/arch/arm64/mapfile.csv  |   1 +
>  .../arch/arm64/nvidia/t410/branch.json        |  45 ++
>  .../arch/arm64/nvidia/t410/brbe.json          |   6 +
>  .../arch/arm64/nvidia/t410/bus.json           |  48 ++
>  .../arch/arm64/nvidia/t410/exception.json     |  62 ++
>  .../arch/arm64/nvidia/t410/fp_operation.json  |  78 ++
>  .../arch/arm64/nvidia/t410/general.json       |  15 +
>  .../arch/arm64/nvidia/t410/l1d_cache.json     | 122 +++
>  .../arch/arm64/nvidia/t410/l1i_cache.json     | 114 +++
>  .../arch/arm64/nvidia/t410/l2d_cache.json     | 134 ++++
>  .../arch/arm64/nvidia/t410/ll_cache.json      | 107 +++
>  .../arch/arm64/nvidia/t410/memory.json        |  46 ++
>  .../arch/arm64/nvidia/t410/metrics.json       | 722 ++++++++++++++++++
>  .../arch/arm64/nvidia/t410/misc.json          | 646 ++++++++++++++++
>  .../arch/arm64/nvidia/t410/retired.json       |  94 +++
>  .../arch/arm64/nvidia/t410/spe.json           |  42 +
>  .../arm64/nvidia/t410/spec_operation.json     | 230 ++++++
>  .../arch/arm64/nvidia/t410/stall.json         | 145 ++++
>  .../arch/arm64/nvidia/t410/tlb.json           | 158 ++++
>  20 files changed, 2905 insertions(+)
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/brbe.jso=
n
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/bus.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/exceptio=
n.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/fp_opera=
tion.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/general.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1d_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l1i_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/l2d_cach=
e.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/ll_cache=
.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/memory.j=
son
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/misc.jso=
n
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/retired.=
json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spe.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/spec_ope=
ration.json
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/stall.js=
on
>  create mode 100644 tools/perf/pmu-events/arch/arm64/nvidia/t410/tlb.json
>
> diff --git a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json b=
/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> index 468cb085d879..6af15776ff17 100644
> --- a/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> +++ b/tools/perf/pmu-events/arch/arm64/common-and-microarch.json
> @@ -179,6 +179,11 @@
>          "EventName": "BUS_CYCLES",
>          "BriefDescription": "Bus cycle"
>      },
> +    {
> +        "EventCode": "0x001E",
> +        "EventName": "CHAIN",
> +        "BriefDescription": "Chain a pair of event counters."
> +    },

Cool stuff :-)

For wider counters AMD does something similar, but should this be an
implementation detail rather than an exposed event? How does it
operate as an event?

[snip]
> diff --git a/tools/perf/pmu-events/arch/arm64/mapfile.csv b/tools/perf/pm=
u-events/arch/arm64/mapfile.csv
> index bb3fa8a33496..7f0eaa702048 100644
> --- a/tools/perf/pmu-events/arch/arm64/mapfile.csv
> +++ b/tools/perf/pmu-events/arch/arm64/mapfile.csv
> @@ -46,3 +46,4 @@
>  0x00000000500f0000,v1,ampere/emag,core
>  0x00000000c00fac30,v1,ampere/ampereone,core
>  0x00000000c00fac40,v1,ampere/ampereonex,core
> +0x000000004e0f0100,v1,nvidia/t410,core
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json b/t=
ools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> new file mode 100644
> index 000000000000..532bc59dc573
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/branch.json
> @@ -0,0 +1,45 @@
> +[
> +    {
> +        "ArchStdEvent": "BR_MIS_PRED",
> +        "PublicDescription": "The Event counts Branches which are specul=
atively executed and mis-predicted."

nit: The capitalization on Event and Branches, as well as other words,
is a little unusual.

[snip]
> diff --git a/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json b/=
tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> new file mode 100644
> index 000000000000..18c2fd58ee9e
> --- /dev/null
> +++ b/tools/perf/pmu-events/arch/arm64/nvidia/t410/metrics.json
> @@ -0,0 +1,722 @@
> +[
> +    {
> +        "MetricName": "backend_bound",
> +        "MetricExpr": "100 * (STALL_SLOT_BACKEND / CPU_SLOT)",
> +        "BriefDescription": "This metric is the percentage of total slot=
s that were stalled due to resource constraints in the backend of the proce=
ssor.",
> +        "ScaleUnit": "1percent of slots",
> +        "MetricGroup": "TopdownL1"

Note, on x86 we place TopdownL1 in the Default metric group so it is
shown by `perf stat` when it isn't given events or metrics to compute.
Perhaps you want to do something similar?
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/arch/x86/icelake/icl-metrics.json?h=3Dtmp.perf=
-tools-next#n116

Thanks,
Ian

