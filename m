Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E64CD6E7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=; b=3+vzfWgwmAUgFeI+nh+2ksNm0v
	o1/uqHihansfQL2enmWYhD2GQKpwiQ2i3Wu+W5Y9eL06e1JHgSwWgmBIG5ocoIoiaea0uSQ+lR8VY
	aUTrWpmnsL/7PRiWAPfAPw4rnsCIeRraIkpoq8w8G/LjikPS1oXvmqffiR8QcslrxDeU/TR0o0X6W
	JhG6EW+6MMuKF5FrOcCYNVybsFD3iSgXo4g99cBcGPkfapC+93f1DviHBT9abMlcURKoi5FaZ8/b8
	ncCBbjsknnFitcGJp5VxrVohL2fJKwG3L93kMReUCDyg2Bxv5GYkMdSA8V3xjU7OfFajoUnflPC+m
	P82pBZfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTWz-00000000bVb-0IAk;
	Fri, 05 Jun 2026 12:20:09 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTWw-00000000bV0-1Vxc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:20:07 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-45ef82204c6so1030624f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662004; x=1781266804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
        b=hSrdjuloFXCbNxnRgSA5NycuwXEA8Ql9uaIrU/EH/0zyY3o6Dq8WUufusFRsXVXAuq
         Z3mmjLjIb1kwOA+4nkho9/WF+fG31Bw+TZccIC8tgPoe+pNhzwwYAG1YN1IdZpXOr4H0
         oK90UanPiqvctDJGU2exWSAYc7BdZe/XJKnRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662004; x=1781266804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j3xkv0HBViwXM4G89v0xA3hOcnT05xWI/0dQ5Wz6JfU=;
        b=OfLpCht0DX8kEZGA9hMYD6fmGObHVt4inqpYf5fv/9+yphF9dtr9ICmazKmfAQbryt
         +MVtnikiIsrE3QdwUtsm8RIcbh7PmO+4y4jlCBhYR3vQC48eY/3Ux521pqFcsFgjxU9z
         VYB4gnzMrRcMql/5OaOl9lvtwLQMOhV2vq/uXfLFugwlkMyIaahgOrENVNtN14Y3yKgB
         /6tKGQzjqdqdMC9c5scUgD/urEo9qoCyI0Pm2PoUTrqi8ZK+MpYhagdi8BIVOPCYWLTv
         uGuP9vjEYEg7P+lg3O/F3wlznWaMxsWyX18jkVAtD8QuyzM1UjsIrN+rqMdvJxqky2f9
         aaKw==
X-Forwarded-Encrypted: i=1; AFNElJ/QdH/AYZoa4bfQiuNkCMtyNT+QsiN8uc4YGDM2cArZ1L5rcipas+0YsinYkanc+zFw7H72257jBkn36N12ZRQ+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd6zSyPG/1SYYJxHjip4kzzr+FBeiV6g+YljKKG8Iz67/uZXxH
	ampzY7ZQFGHwmVwFdbmifweUPlkWTMKKiLQUyVDGqau0qDC1sDtS2R5bh/EkUmG2H7Q=
X-Gm-Gg: Acq92OE6IVQewNifzLfroNoTmU5omzKCNxVL/y9L2MjkzUni2MFcsTaoRqfzDgmX56x
	+AK7bXOKvH4FsI7hXdq76MaO/4xYPQIrqdmrTNVLo5dihzjDy2zEa0Rfg43hDuxaKo5bUSQk96K
	+qb+6XnGOlNeVxbzgFCFgYXr7fh9HV93NIUoiNoMdGMKowfs+demQewM8facGBzwG62mIKQf49d
	Q0YokkRCz2HDQW57Q9JVUntVuKaQ5bv2lPiFMbZwXt0puxLyyULboTPAWZC45heUKIoa83tN5hh
	UtRC+hQ9qYT6MRbuXzyc7eBBQ38J8ryrBaoXGuG9IIxwiF4uoNlBbYRNP33p1nHOwbYJPHkMjj/
	9GcjvPkyMS8slZTtu4kGD0YFBTeoqYez02H+9bKiN9UVc8tJemNLAp4z7AqAwprxjzjeA4fpT75
	hO1tAcluxlsp5g0B518FokKfshR3B2my5n5ZoWh+lqAwcm/UowxDLOCz3sh3wxqwG7zBAQa8+Uv
	z+glUKWO2QWf8RI2pZHpp7gIFMLOnAPyAKoBQMoUfmg8MFQbAto3CQpJM3VDqCtM0rQExQdIH17
	N+O0BeXdAaS6dN7WFcCsomshIOJh7rG0O9g=
X-Received: by 2002:a05:6000:41d5:b0:460:3210:b6e9 with SMTP id ffacd0b85a97d-4603210b750mr4636959f8f.41.1780662004574;
        Fri, 05 Jun 2026 05:20:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Sven Peter <sven@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v4 00/14] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 14:18:11 +0200
Message-ID: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_052006_431979_541C9F0A 
X-CRM114-Status: GOOD (  13.57  )
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

This series adds initial support for the Engicam MicroGEA-STM32MP257-RMM
board based on the MicroGEA-STM32MP257 SoM.

The support includes device tree descriptions for both the SoM and the
carrier board, together with the required pinctrl definitions for the
peripherals used.

The series also updates the arm64 defconfig accordingly.

Changes in v4:
- Drop inclusion of stm32mp25xf.dtsi from stm32mp257-engicam-microgea.dtsi

Changes in v3:
- Add power-domains property in the SDMMC2 node.
- Drop patch "arm64: defconfig: cleanup the defconfig"

Changes in v2:
- Add Acked-by of Conor Dooley for patch 0/1 "dt-bindings: arm: stm32:
  support Engicam MicroGEA-STM32MP257-RMM board"
- Add resets property to dts CAN node. Suggested by Sashiko.
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

Dario Binacchi (14):
  dt-bindings: arm: stm32: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: dts: st: add SDMMC2 support on stm32mp25
  arm64: dts: st: add CAN1 support on stm32mp25
  arm64: dts: st: add i2c1 pins for stm32mp25
  arm64: dts: st: add ltdc pins for stm32mp25
  arm64: dts: st: add can1 pins for stm32mp25
  arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
  arm64: dts: st: add sai1 pins for stm32mp25
  arm64: dts: st: add sdmmc2 pins for stm32mp25
  arm64: dts: st: add spi1 pins for stm32mp25
  arm64: dts: st: add usart1 pins for stm32mp25
  arm64: dts: st: support Engicam MicroGEA-STM32MP257 SoM
  arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
  arm64: defconfig: enable configs for Engicam  MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  16 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  16 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  63 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 754 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ddd664bbff63e09e7a7f9acae9c43605d4cf185f
branch: stm32mp257d-microgea

