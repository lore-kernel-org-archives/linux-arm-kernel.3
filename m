Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4228DCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=; b=QM3vvz/ZcuG55Db/dGptPYc+A2
	vjX9T1uFcsMd7tl/nhWSPxJuqED8F9NzHfjXFZQfIxw/n5+3P21GOUpyolRgTaDfwKamsyXJClqkz
	DGRLbckm+tqD3xT5BeTT94rRAchcPj9CgI6bXu4s1yHGbWlhIpOP1TZzsCnww1hxhhTTbGL0pwP6R
	CPkMB5djoTtvFfUeviY9cB5kW/Rf7zccuEPW07gSWRy67AgNKBuVEO2bDKnWVm1Rga/LrtnnSmlZH
	XDw5DMAlsqsgGa6Kz5tnmxCa+lGEdIjLmW3TP3rhADJqrfBrK9a8yfZcw1ombpz/kustfnEACxuFw
	qFHhFtAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0j-0000000Fz3K-3PvU;
	Mon, 18 May 2026 14:32:01 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOz0h-0000000Fz2V-2Bp9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:32:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-44a044cb827so1634448f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 07:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114717; x=1779719517; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
        b=ZM7ikyqv0AcDf2/MO8ABUlBMH4ngKPHZJ1qOJPDjDYCuJgrcWrPN6dObVJyY+flNA9
         MhutDk4HHpqtllJt65HLx5P7VSmqgg42dqmTrXrArPWTzF/jsU6LJrKPTfijfs5ns00S
         ffeMJGXEqc21XYclBECHyukh5TR/xcfelE720=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114717; x=1779719517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4gGcghC8/VjxZsUokcHk3DMALbk4ZgwiZSR2n7JFnI=;
        b=lE0iRX5Iz+XH5olua09WukGepzKs67RBzM/h30+/pJLYwdOUPzNpXt0UwvXcMoBmWM
         hw3+rw6YUH9vZOS5fa7VCCjWgFrhcviIs8Tpc+oGpnfhjgIiF87egJQiNMt/aZRtZ8Hb
         k+3OIgovbOATDuMoUc/+4bdGmgXIRSZAuPbEehe9IH85Ety8szjF+RWF291icGNCzRWs
         Yfwizu0Ux4MXu4sI33Ms7fYGv1mhG0cOTS4N6Ir/ynNCJMgBQ4I7YASmF2Hxut36RDML
         5YZGey7BIZrnTt5vj46fHl/Q1SKrx8Bt9ahOP5QWWqZtIaxXbnoFjz6+LA+8m7VU5LFd
         uxrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7CUT4vlh52paCpDctFJfTo5mpFcPmVtHLFvFWi/iCbYUVkT/Oq76ZhtaYgCDzffUXuqtKWzQ73hXXENypG22o@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+WUrYw8cFb0LK3GuurAW4T8Ma0w1zMjyBUotzp769W7d+oHCl
	4V2HIfDBjBFW5IodU43GvkOE9TRPdGXaRQewIAMfAOejkuEHjv8Uum0uLdWhlExMa2U=
X-Gm-Gg: Acq92OGPc7RNSj3QWjqAjc32TjT8FpkhegOH4q1YrBJVRuLfrUna2cf9o1f8/QQkmiY
	udpKUNRkwR6+baW5ZovFdQmv0nVMNRJOsm8wp0YOyKhkqu9BFCAStip9lW0QuLkpysqQYkFHvBB
	i9chFTCPlSMATZUi4MXBPWAZff5DPjR9AIIOJHt9gC0OnH2tTdEpbjd5C8L8OV9L3fk5hCFMWcb
	EOcTJ6HiekPmpLPBU4B0P8sKGoyVYjeG1QSIgspbf6uB+Psg1NqPcR9gE9cVj3pm7s7C52PNRI0
	sBK5acLA5RUUhrFzHn6D7ETbhcEjixaa5OzKBN959qwYi/9snu6EhvirkPYc3EpYr5s4U9VAWH4
	JGkMZtYXseyHNtSx0x7qJcVmKWB1a/RuCXjO5A3C4ncaLQFG41Zu6Ihopp9ef8HAbCfS3ME4nnx
	dFvCr97cFA6K/OqzBKeELTaxgI2sPU4b9mJKnEodVjoKL0GTR1Rmf8yOxtuWzVcy+T6n+ANWclK
	ob1hIlIsBUwMI2n9dGecyxlAyQ+HIIlmCSFI3E4wCsCuTjS
X-Received: by 2002:a05:6000:2383:b0:449:9aee:4575 with SMTP id ffacd0b85a97d-45e5c5ccbf6mr24920170f8f.30.1779114717015;
        Mon, 18 May 2026 07:31:57 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:31:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
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
Subject: [PATCH 00/15] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon, 18 May 2026 16:31:15 +0200
Message-ID: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_073159_598813_3B0C2F19 
X-CRM114-Status: GOOD (  11.75  )
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

The series also updates the arm64 defconfig accordingly and performs a
small cleanup to keep it consistent with the newly added configurations.


Dario Binacchi (15):
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
  arm64: defconfig: cleanup the defconfig
  arm64: defconfig: enable configs for Engicam MicroGEA-STM32MP257-RMM

 .../devicetree/bindings/arm/stm32/stm32.yaml  |   7 +
 arch/arm64/boot/dts/st/Makefile               |   1 +
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 328 ++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp251.dtsi        |  15 +
 arch/arm64/boot/dts/st/stm32mp253.dtsi        |  15 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 321 +++++++++++++++++
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  | 293 ++++++----------
 8 files changed, 862 insertions(+), 182 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: 70eda68668d1476b459b64e69b8f36659fa9dfa8
branch: stm32mp257d-microgea

