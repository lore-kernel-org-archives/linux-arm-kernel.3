Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7029FC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pPQRVC+gYXzA0BtSE8rtHH/2+eUDBChSDQmEkeHBXgE=; b=4BLC1EHfmmu8qlT5vtslSVihf3
	Z1bwIq+XTLjKpiGQdeA0sLWkfZuL+dP4L7xKW8g44jGkOGFyWTdryRYLECuoUZpgLXxZnVOES8HE2
	czZM5CFZ/NPQW9WIoTtXEhPvE6H3NGOQn2Xyfh8jIdwc3V8C7eMCjfacGkaGRGPqVlNo6XESTyuuL
	YMnfmU1nrItZdIAqAmdzLLKnTpe+vx02y4HoOj2Jyq6ayh1mSv68+P9tCwZwgFGhms9f6yoneLpV3
	v7L9saeb5Ik0wXN7CvErNsTXnPAXKjdLGvfZg+IV8Aq7B0XBbm7IQlcedamdxs2uWXYMWJ7PQET+t
	8sWSilvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaE06-0000000EvLd-0Gbx;
	Fri, 11 Jul 2025 13:41:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaDoe-0000000EslV-19Td
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 13:29:29 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so1808263a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752240567; x=1752845367; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pPQRVC+gYXzA0BtSE8rtHH/2+eUDBChSDQmEkeHBXgE=;
        b=ikodZZBFcGFyPSYzhjET0JPXe75B4mnFX3cgJaXLogHgRSFRO/UlqXmbe4tQn5pcfz
         ZXZCzU/IVeUO3jC1obfto1BPRO8LGi2Z580hWnbdj2lWhNLRYTo/0axbLRdwr9VVWn3B
         +4hLzgnUGQ6iczMRxvzCwEO7/ny8OLCf+JloZJ64ZoCgiopmu0y5XhVasabNF/NS3Qgt
         V6cilm0cL0QWsigcnAC04VQPwTqFQBvOsGelS4cE0K4UOmS1HijdBWyB6Ncy7E4w5BFk
         EhqJxEsvKlHURwlKRxygiupnKGZgLddVdWuwscDJVo/vElavnPQHEnft21V/ZkRQu1aC
         hm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752240567; x=1752845367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPQRVC+gYXzA0BtSE8rtHH/2+eUDBChSDQmEkeHBXgE=;
        b=sWkL+n0CsYn0s8oiyDmGeHb0LhmHRxj0I1Ca1NWE/oQU0rvJVT2GSB8U4wxBESFc5O
         pkLaM6ePAQNvoiEA1pTfUefNh8n70eJdj2DTAT/evGT09uIY3CJOV+WqGxjyBsiphzW0
         el1QQyfEGopFDSgX5EsXM04LTE0YPLQ6yEdVyECmnzMaS0U/2bMocAMgmQq46QnlsPVo
         h2Ijw5CzWcN8x75mfPYiHLAkTpB5kQs5ioX92KooA4XQwVoZ9sU2QEJvj6bfxZWDaNHK
         fAmTz6MlbyKeaVKY1WAJk1ryExFjuH/5ep7oWOBFvV1seuNpnmunPbJzvqlNXypNByuE
         D7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXOMwKq71BkYXZguKiRyr5h6dLShF76E8yqmXAFFpj+yXl5cpMDQVSWGMy4seixiS1fwKsxKu7quvtrblyfo2kX@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtzw4UcdEuFZIiGLXK0a8oTPD07ya9kt9yGvS8qnqa4vS+801C
	NP//0riQAbarDgTD807g/1P+VtJltOqyQu2bSB6nLPNTHbQ9aFmg5JRb427QNvofYkewsGAEQ0H
	GQBwMitl5ux5XfS8kYrbtZ2LNp71ymRvknKxqzibtGw==
X-Gm-Gg: ASbGncvmXDa/dVHJ+qFGFamfl3E0qu5Ls9W2WyrmBrUb7ZmeM4bEGGIw9Uydza7pz94
	1/atY63WdjEGpTSCD9+w/Ut2AfAQzZ4NBK7q4BuVXF6dZEG6xIxCP1hijcPV4p5Rvvgpl3f1Oya
	t5bYi6uIVSGfSZs1PYBQwaDGRcxA/YGkL25qe6irHg/pNgDFoVlKHli8xguHlIHdyobEJXiBTdB
	GYis1mHhCB9DIGzBBBqfeF8e1sCdY1GpOkMHoVL
X-Google-Smtp-Source: AGHT+IG4zXliACGrQprvEQ5wj7JsyfYLrvCmNiaEH+tMrZ+FZGuEDY+CASzdByOLlOs/WswgsUHGYzyvgG94wPmljLk=
X-Received: by 2002:a17:90b:4b8d:b0:313:b1a:3939 with SMTP id
 98e67ed59e1d1-31c50da140amr3325921a91.15.1752240566909; Fri, 11 Jul 2025
 06:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
In-Reply-To: <20250711094031.4171091-1-quic_jinlmao@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 11 Jul 2025 14:29:14 +0100
X-Gm-Features: Ac12FXz2yLkWQDmM32aTY0N8Gj1hFRU1asfRpnUpH_TzU92dKa2GOxAV8v2hkGM
Message-ID: <CAJ9a7VhmHooDpht-gU7eAA5O028Tn=CVmCNHU6Qg+UYXp6kUQg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] coresight: Add remote etm support
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_062928_316610_F7651E22 
X-CRM114-Status: GOOD (  31.66  )
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

The majority of this code should not be in the coresight drivers
directory as it is not actually coresight.

This seems to be a communications bus system for various SoC
components - one of which happens to be a remote etm. It really needs
to be in a qcom-qmi subdirectory - which would also remove your
reliance on the coresight maintainers for getting all the qmi drivers
upstreamed. I note that there is a CONFIG dependency of
QCOM_QMI_HELPERS, which implies there is already a set of QMI
functionality not in the coresight directory.

We already have  a dummy coresight driver to cover these cases where
the actual etm source or sink might be in a different subsystem. This
could be extended in a generic manner to have an associated driver /
component, with the dummy source then forwarding the enable / disable
commands and acting as the coresight device for the purposes of
enabling the trace path from source to sink.

Thus the "coresight-remote-etm" driver becomes "qmi-node-etm" driver,
with the proprietary comms info, instance IDs etc encapsulated away
from any generic coresight information, and has an associated
coresight-dummy-source to handle the connection to the coresight trace
framework. I imagine the association could easily be modeled in device
tree using a phandle reference.

This would not change your usage model, but would give better
separation between what is clearly the QMI comms subsystem, and what
is needed to handle coresight connectivity.

Moreover, having the generic coresight dummy driver extended in this
way would allow other underlying communication systems to be used on
other devices in future.

Best Regards

Mike


On Fri, 11 Jul 2025 at 10:40, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> The system on chip (SoC) consists of main APSS(Applications processor
> subsytem) and additional processors like modem, lpass. There is
> coresight-etm driver for etm trace of APSS. Coresight remote etm driver
> is for enabling and disabling the etm trace of remote processors.
> It uses QMI interface to communicate with remote processors' software
> and uses coresight framework to configure the connection from remote
> etm source to TMC sinks.
>
> Example to capture the remote etm trace:
>
> Enable source:
> echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
> echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source
>
> Capture the trace:
> cat /dev/tmc_etf0 > /data/remote_etm.bin
>
> Disable source:
> echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source
>
> Changes since V5:
> 1. Fix the warning and error when compile.
> 2. Add traceid for remote etm.
> 3. Change qcom,qmi-id tp qcom,qmi-instance-id.
>
> Changes since V4:
> 1. Add coresight QMI driver
> 2. Add coresight qmi node and qcom,qmi-id of modem-etm in msm8996 dtsi
> V5: https://lwn.net/ml/all/20250424115854.2328190-1-quic_jinlmao@quicinc.com/
>
> Changes since V3:
> 1. Use different compatible for different remote etms in dt.
> 2. Get qmi instance id from the match table data in driver.
>
> Change since V2:
> 1. Change qcom,inst-id to qcom,qmi-id
> 2. Fix the error in code for type of remote_etm_remove
> 3. Depend on QMI helper in Kconfig
>
> Changes since V1:
> 1. Remove unused content
> 2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
> 3. Use enabled instead of enable in driver data.
> 4. Validate instance id value where it's read from the DT.
>
> Mao Jinlong (5):
>   dt-bindings: arm: Add CoreSight QMI component description
>   coresight: Add coresight QMI driver
>   dt-bindings: arm: Add qcom,qmi-id for remote etm
>   coresight: Add remote etm support
>   arm64: dts: qcom: msm8996: Add coresight qmi node
>
>  .../bindings/arm/qcom,coresight-qmi.yaml      |  65 +++++
>  .../arm/qcom,coresight-remote-etm.yaml        |   9 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  11 +
>  drivers/hwtracing/coresight/Kconfig           |  23 ++
>  drivers/hwtracing/coresight/Makefile          |   2 +
>  drivers/hwtracing/coresight/coresight-qmi.c   | 198 +++++++++++++
>  drivers/hwtracing/coresight/coresight-qmi.h   | 101 +++++++
>  .../coresight/coresight-remote-etm.c          | 262 ++++++++++++++++++
>  8 files changed, 671 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-qmi.yaml
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.c
>  create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
>  create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c
>
> --
> 2.25.1
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

