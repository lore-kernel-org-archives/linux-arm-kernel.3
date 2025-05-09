Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C04AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MdQh7LT8W4RzJzp1eDyrsDrfrxqK5LM5LuKtE8YNB2c=; b=QaW9C5F1qQakkg
	H5STwIAO1R3kynekvkLg+qdSsDVOtTem2iUZJHpUIdPYKxN+AkOuO+qekQ2Uw1ATAdSA5a8dmS3WB
	25Oj3OMfn7znaDg3UxlPYAvkxmY1QtX8SRqbM4YAIHpqpoqaQj/fxn8cliyEMqwcu9i3chMO1NuNP
	wwMYHfht5eRQ2C9RJ7RkFtlKP2M6QtZ9r8I16M4hQqj9Nik7YaNTrXSwyV+R2fT0SsTFVQr4ML7fW
	guSOYwHrIDeqTZfoIcc4eUsENx75b0mfzEevfcgGzX4V0GfveMStPfQqAliF74g8usDrPFCxOV0PT
	WFCS/Hv7kTUeOQlR2J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMGO-00000003UGc-2zI4;
	Fri, 09 May 2025 11:51:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLZA-00000003NZI-33hZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 11:06:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so1726498f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 04:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788814; x=1747393614; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MdQh7LT8W4RzJzp1eDyrsDrfrxqK5LM5LuKtE8YNB2c=;
        b=WYAHmxCioAGzmB2j1KSz9AEO6ZdchOQtnZnpV74MITTXNNo+PhhKqI3Vi5QJRP6fFI
         81+G1Sc7iu+WtWTcmRxXwNvQcwFxldXviHuAkhzvTVRcFmOiEJXj/DLq6Hrkrps50myj
         qoAPL5X0BS7iFnY3cXmSB8ITDIgpRJssrcRlBu2OEqCvHLdrVi6nzl9NN5n8Fd0GgNje
         iOIWelI3wFxWJP4Z8JsDbXKAIQ21Nz+jJtLJ0o/NJlvGd5svk+JqGQ9EjPYpf4OdG7ia
         R3cc3brqw/mpnbGp8IygQ12WVsP7UERrO7lJoVv89VuaorXqpm80+q6hQ3NHOIqAmBA7
         yA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788814; x=1747393614;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdQh7LT8W4RzJzp1eDyrsDrfrxqK5LM5LuKtE8YNB2c=;
        b=ON6BZMx/Ec4pr82IaD/Fu3kxhKHnJOkE/XGaya0zubsThKQQQGKzv0seDBm74JIp+r
         E4fHM/hu6VR0z3X7J/xy84iN55TqCwN3toZi7CRoXkvYrpHa31CEQ5NRkcxsEp26na8O
         ThQFJcLDIVX2lUXjatp99Hy5rqkk6b4DXeo4rXx3g1tS8590m/PSiZS5P9hC8wTJi6s5
         BqaTfuwQhFKbmOIpBsBl5X17zbg4ewviJUsKmCQiekn//Lhj5IUBkikOsUqfpqVfi0y0
         7cgwc9/NL3Qqn1MdbyJ9ygyK2aSJ7shAtqPKRSQ7fnHLUDRdcWzSzoGd3F6CH0mbGDpr
         K0Og==
X-Forwarded-Encrypted: i=1; AJvYcCXUCqDhCgLt+J1ce45BgWmslxtUfs2RqLMCTnzuKsX6/TH1xRe2OBCDczAYkpOkOEwoQr9vrtOdzIJ06XAk+S7H@lists.infradead.org
X-Gm-Message-State: AOJu0YxlWyE5MhI1RrOrIi+9pJ5dyihRV9uSstl8Xs4GdgH95FeodpF9
	TjK6vdezp4yRhHBrTEzev3vv5IFfD+KChEMRezwi2GH0BI5+m7Sl3QwrpGlhi9c=
X-Gm-Gg: ASbGncvnwybLEV77z9QJzPtkLx32kIT8fmza85d5u5g272TBAVazNvBTzsZOdsqFSWS
	fDtuhag7bhsg9G/8Dy2dE+5RqXYneVpeO65otM+DmGoJQmo9jaAC42hcEqotpVqvJz7p/n5Otu7
	QHUGRHcUHlneHuhAtIFXyPORGy1FBN/KZ66GgTxv1fDnfz6VrA2ioQh1reQpbM65yAO2Tl3szLH
	LAUSWV+F4iU/x5O//lgqzAkXqhwVKJvA6eIjnk/7B3L79F4upyM28BynTWdT1YAsg5A0gieWpSB
	YV0Y8SO2MjzHH6rUJEG4sBf/h+I7QVv0Yrlnpyo7SLnxA/w=
X-Google-Smtp-Source: AGHT+IF8zf0HZ+jIS52ar661eUuXC/rKe9WCfGGwcqpO6GEcFF49TaMuxQRQxMt3K3cGjEyD0Y8O6g==
X-Received: by 2002:adf:8b1c:0:b0:3a0:8712:4f51 with SMTP id ffacd0b85a97d-3a1f64b5a97mr1959695f8f.40.1746788814469;
        Fri, 09 May 2025 04:06:54 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:06:54 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH 00/14] spi: spi-fsl-dspi: DSPI support for NXP S32G
 platforms
Date: Fri, 09 May 2025 12:05:47 +0100
Message-Id: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIvhHWgC/x3MMQqAMAxA0atIZgNtxEGvIg5Fo0awlkZEkd7d6
 viG/x9QjsIKbfFA5FNUdp9hywKGxfmZUcZsIEO1qajG1W2s6K+AGgQHN1km0zRUWchNiDzJ9f+
 6PnsRPfZ4f/uU0gslR/0vbgAAAA==
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, James Clark <james.clark@linaro.org>, 
 Xulin Sun <xulin.sun@windriver.com>, Marius Trifu <marius.trifu@nxp.com>, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 Andra-Teodora Ilie <andra.ilie@nxp.com>, 
 Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>, 
 Stoica Cosmin-Stefan <cosmin.stoica@nxp.com>, Dan Nica <dan.nica@nxp.com>, 
 Larisa Grigore <Larisa.Grigore@nxp.com>, 
 Stefan-Gabriel Mirea <stefan-gabriel.mirea@nxp.com>, 
 "Radu Pirea (NXP OSS)" <radu-nicolae.pirea@oss.nxp.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_040656_774661_C946D419 
X-CRM114-Status: GOOD (  10.65  )
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

DT and driver changes for DSPI on S32G platforms. First 4 commits add
new S32G registers and device settings along with restricting userspace
register access properly for all devices. Then some DMA mode fixes along
with adding support for target mode, which uses DMA. Followed by some
other minor bug fixes and then finally add the DT compatibles and
binding docs.

---
Andra-Teodora Ilie (1):
      spi: spi-fsl-dspi: Enable modified transfer protocol

Bogdan-Gabriel Roman (1):
      spi: spi-fsl-dspi: Halt the module after a new message transfer

Ciprian Marian Costea (2):
      dt-bindings: spi: dspi: Add S32G support
      spi: spi-fsl-dspi: Enable support for S32G platforms

James Clark (2):
      spi: spi-fsl-dspi: Define regmaps per device
      spi: spi-fsl-dspi: Re-use one volatile regmap for both device types

Larisa Grigore (7):
      spi: spi-fsl-dspi: restrict register range for regmap access
      spi: spi-fsl-dspi: Add config and regmaps for S32G platforms
      spi: spi-fsl-dspi: Avoid setup_accel logic for DMA transfers
      spi: spi-fsl-dspi: Reset SR flags before sending a new message
      spi: spi-fsl-dspi: Use DMA for S32G controller in target mode
      spi: spi-fsl-dspi: Reinitialize DSPI regs after resuming for S32G
      arm64: dts: Add DSPI entries for S32G platforms

Marius Trifu (1):
      spi: spi-fsl-dspi: Use spi_alloc_target for target

 .../devicetree/bindings/spi/fsl,dspi.yaml          |  18 ++
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  78 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  87 +++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  77 +++++
 drivers/spi/Kconfig                                |   4 +-
 drivers/spi/spi-fsl-dspi.c                         | 356 +++++++++++++++------
 7 files changed, 592 insertions(+), 106 deletions(-)
---
base-commit: 9c69f88849045499e8ad114e5e13dbb3c85f4443
change-id: 20250325-james-nxp-spi-caf1e2099231

Best regards,
-- 
James Clark <james.clark@linaro.org>


