Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18AD5CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=absgbM/LagsR81VTr9YW+eGimVEtdVPICEXyNcDYF+E=; b=UVmnivKnCv1GbqXM8QW3WHK7o6
	3DrSM+ynbvEHNEAGabtQJ8q9Q7wOt81EJtO3+VnWxr9AXUAc3lUMluvoJlRAsWITawRy/nLZgh4ST
	qqzC5sIBUH5huXoT7xPiPCNwoos/RspKIENk/Ie0FejQqU3arEunycktCu0AVUhQ96V+0K31isZOi
	kwVGpv4odWGzZyDnbep4pcEsvVy35kTDbXm2rtpCcU4bIhwXAjwRwty/uVCM9MoJSNWswd3t7kLmb
	BaUPoAKGh97w2BaFxWLCr/NTPfjq8KqjY56YOotWojgUXvbx8wZIdNjvgDBef413316GFe8q/J09m
	tTCxczcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPQn-00000003ufj-1iDO;
	Thu, 30 Oct 2025 09:58:57 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPQk-00000003ufE-43Xa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:58:56 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-89f07fee490so100073685a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761818333; x=1762423133; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=absgbM/LagsR81VTr9YW+eGimVEtdVPICEXyNcDYF+E=;
        b=InxvBA54BDCMLg/kNKvkGXv2M8GvHoM3vzE5Bg+NezMf9kVGDxvbIEoUsO4/RXBBVK
         ZyIGERrAR24waG5BIfR3o8SQ9Lj09LZnWShxBTCG6ULuvLbirC5PUdOLheUbr2jjhKg9
         Oa83+VNJAlMsdhKpBj1h6PRUoFu69NDVLSUAv5Remh1xXFzlbC0NcJ4fHV4/MEQTzk3p
         5kzm2LTaHdnZNbG1m4jzBoYGElKB/F5I+DY/xGWt/u/k+7b5Le1b0QPrIqL4Gfxsxwh6
         UukNouPTRB/bsj46RleUmEfl6k6cfd7YttdeCT2Cg/dxHbuQp5XN9m/0xmmS9yYkQPTx
         HOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761818333; x=1762423133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=absgbM/LagsR81VTr9YW+eGimVEtdVPICEXyNcDYF+E=;
        b=DRU3UWytbP1ErKC/yY/U+mzeohTSgyWYeyuUZODTBjBKlik60X3ycLYlw1To//ZYe3
         SbW0O5LN7NAHxmnq8iqUmva+GcEo+ieYig8dNSwh7ICTVAwZL285goa5MBWuyYd3fX7R
         P3OBSbCotFV70uSSI7/4hFrTTx4Y5z03h5uRh11rcH1w9J5h+UrTg7oKuyVrAcbwy9LI
         XtKYZubyCaVSoD7125A5J/DVdcNgxXBI8tw/FDxXyWdSWWzYu/lCTzIYJ7OSU4V6L82B
         NlSJ1F4BezTuaUY7lcBcXLyAzKRh+Lptg/cu9u4XtiR/eeID4wfrY7UKFR7u8/iJiCSu
         qZaA==
X-Forwarded-Encrypted: i=1; AJvYcCU5nkYSoqlgnkDmxJdinVfj0Q9XauG1laSE8+1C6BfgQCPKwAn5pvJoUuePzstBtuu0XGaSRLr4tC/LIgFXH/aR@lists.infradead.org
X-Gm-Message-State: AOJu0YwprvCmk1snIjjqIt+eTR2TuGcr2YSN2X7DFG6wKOdy5aCD9OGx
	uEYyMM4ZX9pBWh+8Q9S3g78H4bqmd/EIrLyvoLOtMNQIfvGy2IU9ynVUyHIibDeZR8jRMKwWl4F
	PyuTVof3g/Qb2ZHaNVgK3G/Sv1wwfRIYa8Vr+lVPeBg==
X-Gm-Gg: ASbGncu0uZMW7iU6KOeb+eSV11nXMfmy77xThq9efJT4g0J50TIUviPWjMxrmjXz372
	A8DFtdBVG+/vc3iv9OyDuYmTQECbIWNgPOmiQO/90e1qo1lTufsrqe1XQlW8KcxRXtF6pdfXaMK
	g8vKuPrTQO+3gtXEY6bbDx7T1DKx63PKvk+DmuqHQFoEMKeGd4HLH0zrYYhC986C8WWCFfu++jf
	RCa4sw3IOYABqxq98+zQzzerazC9YvCpIE7tBH+ZYY1wc16U/u10sR76CK/VjuHmDmJbh6E83AX
	T/mQEqt/USpdsna23w==
X-Google-Smtp-Source: AGHT+IFUqnazSY7z2FvEnJeUXVSF4JyDn7tHHUK1IgsgMoaK9NxJ/ZQbLMAQh5fAN6xuof8Hnoac1Yfo6fFL9g5N6Eo=
X-Received: by 2002:a05:620a:290b:b0:8a3:cd9e:e3f6 with SMTP id
 af79cd13be357-8a8e30e4888mr842034085a.7.1761818333214; Thu, 30 Oct 2025
 02:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
 <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com> <7451a3ae-2b3f-4e07-b93c-0507436d0f33@oss.qualcomm.com>
In-Reply-To: <7451a3ae-2b3f-4e07-b93c-0507436d0f33@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 30 Oct 2025 09:58:41 +0000
X-Gm-Features: AWmQ_bl6dSnsH1lqrV1OCHFJI3NpjO7q1p6vQItR60dxg6XPfOvLS9hTosbgaMs
Message-ID: <CAJ9a7VgxpQ5gTXpaW5pBb+dpZZhXAkrOtxkkiK-KUmvipPm5UQ@mail.gmail.com>
Subject: Re: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
To: yuanfang zhang <yuanfang.zhang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025855_048958_A7ED24AB 
X-CRM114-Status: GOOD (  42.03  )
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

Hi,

On Thu, 30 Oct 2025 at 07:51, yuanfang zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
>
>
> On 10/29/2025 7:01 PM, Mike Leach wrote:
> > Hi,
> >
> > This entire set seems to initially check the generic power domain for
> > a list of associated CPUs, then check CPU state for all other
> > operations.
> >
> > Why not simply use the generic power domain state itself, along with
> > the power up / down notifiers to determine if the registers are safe
> > to access? If the genpd is powered up then the registers must be safe
> > to access?
> >
> > Regards
> >
> > Mike
> >
>
> Hi Mike,
>
> Hi,
>
> yes, when genpd is powered up then register can be accessed. but have blo=
w problems:
>

The point I was making is to use genpd / notifications for determine
if the device is powered so you know if it is safe to use registers.
This is different from the faults you mention below in your power
infrastructure.
You are reading the dev->pm_domain to extract the cpu map then the
notfiers and state must also be available. If you could use CPUHP
notifiers then genpd notifiers would also work.
However, one issue I do see with this is that there is no code added
to the driver to associate the dev with the pm_domain which would
normally be there so I am unclear how this actually works.

Associating a none CPU device with a bunch of CPUs does not seem
correct. You are altering a generic coresight driver to solve a
specific platform problem, when other solutions should be used.

> 1. pm_runtime_sync can trigger cluster power domian power up notifier but=
 not really
> power up the cluster, and not able to distinguish whether it is a real po=
wer up notifier
> or triggered by pm_runtime_sync.
> 2. Using the power up/down notifier cannot actively wake up the cluster p=
ower,
> which results in the components related to this cluster failing to be ena=
bled when the cluster
> power off.
> 3. Using the power up/down notifier for register access does not guarante=
e
> the correct path enablement sequence.
>

Does all this not simply mean that you need to fix your power
management drivers / configuration so that it works correctly, rather
than create a poor workaround in unrelated drivers such as the
coresight devices?

Thanks and  Regards



Mike

> thanks,
> yuanfang
>
> > On Tue, 28 Oct 2025 at 06:28, Yuanfang Zhang
> > <yuanfang.zhang@oss.qualcomm.com> wrote:
> >>
> >> This patch series introduces support for CPU cluster local CoreSight c=
omponents,
> >> including funnel, replicator, and TMC, which reside inside CPU cluster
> >> power domains. These components require special handling due to power
> >> domain constraints.
> >>
> >> Unlike system-level CoreSight devices, CPU cluster local components sh=
are the
> >> power domain of the CPU cluster. When the cluster enters low-power mod=
e (LPM),
> >> the registers of these components become inaccessible. Importantly, `p=
m_runtime_get`
> >> calls alone are insufficient to bring the CPU cluster out of LPM, maki=
ng
> >> standard register access unreliable in such cases.
> >>
> >> To address this, the series introduces:
> >> - Device tree bindings for CPU cluster local funnel, replicator, and T=
MC.
> >> - Introduce a cpumask to record the CPUs belonging to the cluster wher=
e the
> >>   cpu cluster local component resides.
> >> - Safe register access via smp_call_function_single() on CPUs within t=
he
> >>   associated cpumask, ensuring the cluster is power-resident during ac=
cess.
> >> - Delayed probe support for CPU cluster local components when all CPUs=
 of
> >>   this CPU cluster are offline, re-probe the component when any CPU in=
 the
> >>   cluster comes online.
> >> - Introduce `cs_mode` to link enable interfaces to avoid the use
> >>   smp_call_function_single() under perf mode.
> >>
> >> Patch summary:
> >> Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/T=
MC devices.
> >> Patches 2=E2=80=933: Add support for CPU cluster funnel.
> >> Patches 4-6: Add support for CPU cluster replicator.
> >> Patches 7-10: Add support for CPU cluster TMC.
> >> Patch 11: Add 'cs_mode' to link enable functions.
> >> Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 a=
nd
> >> fix build issue.
> >>
> >> Verification:
> >>
> >> This series has been verified on sm8750.
> >>
> >> Test steps for delay probe:
> >>
> >> 1. limit the system to enable at most 6 CPU cores during boot.
> >> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
> >> 3. check whether ETM6 and ETM7 have been probed.
> >>
> >> Test steps for sysfs mode:
> >>
> >> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> >> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
> >> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> >> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> >> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
> >> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> >>
> >> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> >> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
> >> cat /dev/tmc_etf1 >/tmp/etf1.bin
> >> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> >> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> >>
> >> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> >> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> >> cat /dev/tmc_etf2 >/tmp/etf2.bin
> >> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
> >> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> >>
> >> Test steps for sysfs node:
> >>
> >> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
> >>
> >> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
> >>
> >> cat /sys/bus/coresight/devices/replicator*/mgmt/*
> >>
> >> Test steps for perf mode:
> >>
> >> perf record -a -e cs_etm//k -- sleep 5
> >>
> >> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> >> ---
> >> Yuanfang Zhang (12):
> >>       dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicat=
or support
> >>       coresight-funnel: Add support for CPU cluster funnel
> >>       coresight-funnel: Handle delay probe for CPU cluster funnel
> >>       coresight-replicator: Add support for CPU cluster replicator
> >>       coresight-replicator: Handle delayed probe for CPU cluster repli=
cator
> >>       coresight-replicator: Update mgmt_attrs for CPU cluster replicat=
or compatibility
> >>       coresight-tmc: Add support for CPU cluster ETF and refactor prob=
e flow
> >>       coresight-tmc-etf: Refactor enable function for CPU cluster ETF =
support
> >>       coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compati=
bility
> >>       coresight-tmc: Handle delayed probe for CPU cluster TMC
> >>       coresight: add 'cs_mode' to link enable functions
> >>       arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug b=
lock
> >>
> >>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
> >>  .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
> >>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
> >>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 ++++++++++++=
+++++++++
> >>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
> >>  drivers/hwtracing/coresight/coresight-core.c       |   7 +-
> >>  drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
> >>  drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
> >>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
> >>  drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
> >>  drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
> >>  drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
> >>  drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
> >>  include/linux/coresight.h                          |   3 +-
> >>  14 files changed, 1912 insertions(+), 182 deletions(-)
> >> ---
> >> base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
> >> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
> >>
> >> Best regards,
> >> --
> >> Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> >>
> >
> >
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

