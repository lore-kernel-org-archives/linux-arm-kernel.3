Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 479ACCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 11:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQWDpVejCHNnm4EwaVB6drbJOWDW2V1Yh8yBgxJN8YA=; b=uQW0luLlORIb7qJg1DGzoN8vKm
	zXSqhCMZE7/P7TULNVDnhoYijkU8YL46SIp3K6q8yxFMzV0ksgrdNNbJqxmj+3NBHfPT/7KLenVTo
	aQ/OWY++zhhwj6e6RLPN1pLu18fzssirVW57xWvImIOwWDjht+I3KltAG5WjcfQdfrJwWL6wzL5uf
	54/FdKi7lkqCMj+eToggzREcRi34OTU82k+UgKLr/+gvMbwpwn49a5QbgwE2LmuCkUIitzXjLShvo
	tqmnTRZ+3LPlm8B7V9C+uHhQaK9LRmoowciWC4abGpA9rUR85dMPxk4PSlA7tbMPvs+5d4qNLqOBc
	BV+Es/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3va-00000000sOl-2hIW;
	Wed, 29 Oct 2025 11:01:18 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3vY-00000000sNN-0L3W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 11:01:18 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-88f2aebce7fso730381885a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Oct 2025 04:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761735675; x=1762340475; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQWDpVejCHNnm4EwaVB6drbJOWDW2V1Yh8yBgxJN8YA=;
        b=ZfXKOxtX8OuCXCH2TawbDwtiX+Vf9olNDvuyr0PGt16HKiHRz5Q6I96bbMr2E1D6Zr
         aF2HsqN8NG4qU+/2LJ3M6bZd5/VqcTm6t3uFD4w6G7PV9YCc73rvfYbNbl+IB0Y3L7c5
         tgj2ix/CN6OFtgIV48uzzwxYzgXPGkDEL8eKsq14FPTV7xc2K3cYCJ71ZwWnO4ef5/Ng
         zsvJpka1zW9VAHQK/Sk67K/SjkXXDCZ/bsrbLozp7hvco8vmgjSgCUEsvwgjB1PIdzOm
         GHdRe5Ovgs6xT4Av9X0PwLYL1IF3uatpbmqXQb47K8wa4jQBEuvLB/L4Yz95OkdMlBL8
         JJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735675; x=1762340475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQWDpVejCHNnm4EwaVB6drbJOWDW2V1Yh8yBgxJN8YA=;
        b=urLfVa78OpCKrYd9RQxZZDg6t+8P1FUtHY0le4WAG/beJc6uFcYOjp1dR6fj0319nB
         xMrtk8jFjSTn1zW8LLAoMFL+BBUXG6DkLHhVtOUIbEhOLrCnx6iFRkeN7OpbArFxWacf
         GoUwoKXV85Abi+ZbWNuVg6iKLUIRRpK7Xyi5PjUZnfmTU8brRS6ZwHm3gRAriN8fuFTB
         qsLg4A+XXLS9x/SSyrwr86Aov6aDlfcS7BYX9m5BQuGbJXpgJRStMGW3uZ98w2Y8Jfvi
         P4w8/BHAOp3KkcAY1glE9htE6HBZ2jp3bdN6GPITfXm7LAyM83S2RqmBdeqlp8KwwTdr
         VDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVdnjW36cHwNN2JpUqB4ZLy322yDNWasagPR5jlGzIlVSmgI7JqC1I/OzQ3ul9ekRF5QzTz0woDBKTeHGVBi+3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5GCtnVKa3fgiq4gknRn4p5ZjuWA+LqiYx6UHzh07hproyZu2g
	jQuwvMdmufzxw24sveS8/1cW2F8XrQ3ktM5yHc7xOwIkZ9dhjfHlWan6lKTryDFr2TvLBe/n14Y
	gD7co3zHQMCtR97xLfByB03EGHopG+S6/wfrW6OWC8g==
X-Gm-Gg: ASbGncv1TrYhSeZZmnvt6rTFXj3dnagWfEvimbi/smkNxly4BpjtVyVUVvPQ0JwoNmR
	23W8AM+l9KCBato/fhR+RkIdWNdenwgnXa2qTqVcOeGJUjdbsPKNmLWd5dJLMAE9eu/97NMVi7Q
	VDdzntS65scXUcq9acUtXxnpdEGgE1gaA7i7WKiq/0Jx+VBibCdmJQ+7bsm7ttMTC6l0uDaHMDS
	Rc89Silmhy9vF2Yf4dZ4GwwWVx8PFNZABsNp9X2uCtLENxCyVaaDStNfzhaybHuq2+Hjhi9FmQj
	TOV5Oo9qBmk53iUJoQ==
X-Google-Smtp-Source: AGHT+IHWP5Cbc3G4W0Ik0NLLQcf3Rmww0dInCJA9bBcxiEAnG512YgHlmnNkFU3hoCfwOl86Kin1pgVlI3IyVxMDBkU=
X-Received: by 2002:a05:620a:7019:b0:829:fa5d:6f0d with SMTP id
 af79cd13be357-8a8efb03ddfmr306069985a.82.1761735674490; Wed, 29 Oct 2025
 04:01:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 29 Oct 2025 11:01:03 +0000
X-Gm-Features: AWmQ_bmBZ4u6Nr5AkhU0uSKV2P-I149L6WKOoDdLwfOOqdcc5hyzFz1zWOkxIwc
Message-ID: <CAJ9a7VipQh=y0o+6k=fLMMK408E5eGD6vhY2TKBMm+q63NUiWA@mail.gmail.com>
Subject: Re: [PATCH 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
To: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
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
X-CRM114-CacheID: sfid-20251029_040116_167531_B5429FAF 
X-CRM114-Status: GOOD (  22.92  )
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

This entire set seems to initially check the generic power domain for
a list of associated CPUs, then check CPU state for all other
operations.

Why not simply use the generic power domain state itself, along with
the power up / down notifiers to determine if the registers are safe
to access? If the genpd is powered up then the registers must be safe
to access?

Regards

Mike

On Tue, 28 Oct 2025 at 06:28, Yuanfang Zhang
<yuanfang.zhang@oss.qualcomm.com> wrote:
>
> This patch series introduces support for CPU cluster local CoreSight comp=
onents,
> including funnel, replicator, and TMC, which reside inside CPU cluster
> power domains. These components require special handling due to power
> domain constraints.
>
> Unlike system-level CoreSight devices, CPU cluster local components share=
 the
> power domain of the CPU cluster. When the cluster enters low-power mode (=
LPM),
> the registers of these components become inaccessible. Importantly, `pm_r=
untime_get`
> calls alone are insufficient to bring the CPU cluster out of LPM, making
> standard register access unreliable in such cases.
>
> To address this, the series introduces:
> - Device tree bindings for CPU cluster local funnel, replicator, and TMC.
> - Introduce a cpumask to record the CPUs belonging to the cluster where t=
he
>   cpu cluster local component resides.
> - Safe register access via smp_call_function_single() on CPUs within the
>   associated cpumask, ensuring the cluster is power-resident during acces=
s.
> - Delayed probe support for CPU cluster local components when all CPUs of
>   this CPU cluster are offline, re-probe the component when any CPU in th=
e
>   cluster comes online.
> - Introduce `cs_mode` to link enable interfaces to avoid the use
>   smp_call_function_single() under perf mode.
>
> Patch summary:
> Patch 1: Adds device tree bindings for CPU cluster funnel/replicator/TMC =
devices.
> Patches 2=E2=80=933: Add support for CPU cluster funnel.
> Patches 4-6: Add support for CPU cluster replicator.
> Patches 7-10: Add support for CPU cluster TMC.
> Patch 11: Add 'cs_mode' to link enable functions.
> Patches 12-13: Add Coresight nodes for APSS debug block for x1e80100 and
> fix build issue.
>
> Verification:
>
> This series has been verified on sm8750.
>
> Test steps for delay probe:
>
> 1. limit the system to enable at most 6 CPU cores during boot.
> 2. echo 1 >/sys/bus/cpu/devices/cpu6/online.
> 3. check whether ETM6 and ETM7 have been probed.
>
> Test steps for sysfs mode:
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm0/enable_source
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devicse/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf0/enable_sink
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
> echo 1 >/sys/bus/coresight/devcies/etm0/enable_source
> cat /dev/tmc_etf1 >/tmp/etf1.bin
> echo 0 >/sys/bus/coresight/devices/etm0/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf1/enable_sink
>
> echo 1 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
> echo 1 >/sys/bus/coresight/devices/etm6/enable_source
> cat /dev/tmc_etf2 >/tmp/etf2.bin
> echo 0 >/sys/bus/coresight/devices/etm6/enable_source
> echo 0 >/sys/bus/coresight/devices/tmc_etf2/enable_sink
>
> Test steps for sysfs node:
>
> cat /sys/bus/coresight/devices/tmc_etf*/mgmt/*
>
> cat /sys/bus/coresight/devices/funnel*/funnel_ctrl
>
> cat /sys/bus/coresight/devices/replicator*/mgmt/*
>
> Test steps for perf mode:
>
> perf record -a -e cs_etm//k -- sleep 5
>
> Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
> ---
> Yuanfang Zhang (12):
>       dt-bindings: arm: coresight: Add cpu cluster tmc/funnel/replicator =
support
>       coresight-funnel: Add support for CPU cluster funnel
>       coresight-funnel: Handle delay probe for CPU cluster funnel
>       coresight-replicator: Add support for CPU cluster replicator
>       coresight-replicator: Handle delayed probe for CPU cluster replicat=
or
>       coresight-replicator: Update mgmt_attrs for CPU cluster replicator =
compatibility
>       coresight-tmc: Add support for CPU cluster ETF and refactor probe f=
low
>       coresight-tmc-etf: Refactor enable function for CPU cluster ETF sup=
port
>       coresight-tmc: Update tmc_mgmt_attrs for CPU cluster TMC compatibil=
ity
>       coresight-tmc: Handle delayed probe for CPU cluster TMC
>       coresight: add 'cs_mode' to link enable functions
>       arm64: dts: qcom: x1e80100: add Coresight nodes for APSS debug bloc=
k
>
>  .../bindings/arm/arm,coresight-dynamic-funnel.yaml |  23 +-
>  .../arm/arm,coresight-dynamic-replicator.yaml      |  22 +-
>  .../devicetree/bindings/arm/arm,coresight-tmc.yaml |  22 +-
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 885 +++++++++++++++=
++++++
>  arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  12 +
>  drivers/hwtracing/coresight/coresight-core.c       |   7 +-
>  drivers/hwtracing/coresight/coresight-funnel.c     | 260 +++++-
>  drivers/hwtracing/coresight/coresight-replicator.c | 343 +++++++-
>  drivers/hwtracing/coresight/coresight-tmc-core.c   | 396 +++++++--
>  drivers/hwtracing/coresight/coresight-tmc-etf.c    | 105 ++-
>  drivers/hwtracing/coresight/coresight-tmc.h        |  10 +
>  drivers/hwtracing/coresight/coresight-tnoc.c       |   3 +-
>  drivers/hwtracing/coresight/coresight-tpda.c       |   3 +-
>  include/linux/coresight.h                          |   3 +-
>  14 files changed, 1912 insertions(+), 182 deletions(-)
> ---
> base-commit: 01f96b812526a2c8dcd5c0e510dda37e09ec8bcd
> change-id: 20251016-cpu_cluster_component_pm-ce518f510433
>
> Best regards,
> --
> Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
>


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

