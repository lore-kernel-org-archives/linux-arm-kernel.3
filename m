Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C030CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 06:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=; b=lh7Ylyvj9AXltif2sOrWdECcFz
	6lsxuD5yPyiDGROi5r+HkfOdS/ZAfz0enRIC5/RfFRRtcALDkympBOZmEURUJ03CnG7727Bg7G44k
	JRKTgc8onnPs47yl7xS+84M5WDBgqTNBBI008umfZswEcMr/AImdsR7GSxW084/14nB/eB1DhQEak
	/hh/GTdf48OCwG2bKeAEkOrxwV7e6ESwYmS4K1H4LOAWJY2W2LLlpvOeAPNTSYBiYUTpY/7DGQoUA
	mfkQ4Jf/7J0cNBM3jT2Rh6nrgxxKgSSypylBwRg+GS5CIgG1jia2qOrW3gFqGdB8GEby/ZV2Eyujh
	LAZRzyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3J-000000009U0-41GD;
	Fri, 05 Jun 2026 06:29:09 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVO3I-000000009TP-0b2t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 06:29:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso779166f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 23:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640946; x=1781245746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
        b=o2RksKUHrF2/lLppkeemt71d+wygqsOGVkaiTHtDL1K8gC3/c7JDrw59RAWCWTi4G1
         UF1Hb1MgS1CUuiBbdEaZD3Y8KxbadnXnHJVqckvTQd902dKxcBeJpK+myaL7s4K6anaB
         NPvszxqe2bb28meytyxvfPrQd7lolRGHoDZ7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640946; x=1781245746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lejUpnv31Ki2j4Ud4YtaN/+X332KUHa0P0BjhrqFno=;
        b=A65/fudmj0NVTc6W+0KXdcAicv+VfCt6pj7Z+7Z7lG2WIoQ3wtaYOc0dfsYmhsnpkt
         Uk2dQNoqtEnrxPBWoUgO6ZQq96jqD/MaZpMfAy52plHqz829w16TP+FPOTNYQLpSmKYT
         VjF+fjoZfgmpPaIEp23CpNGiLhoEfbdKyFfRArlsqkVJcghJUBdxEz6Sm8gx4fE9jsb1
         KVlLh0kL10p6ldRBvhDL4nIvxVRo/89cR5fzFn6udvbT3NjTg6mgHxKez4adn29APFFf
         o+OVLd34F8oOoA3s7CCz+D6KiJHKpdzyu3hf1R3gGCX+Aj+a9sJj4ZNA8uBJQb7n08ec
         nmag==
X-Forwarded-Encrypted: i=1; AFNElJ9BKC2oJJ02gi+6L7JjU/EIXifwiw4EUwqsEj/tO3YSO6pXiIkeu/ObC0UPVJf+nYpoRa4H5aJo455mRvTm10Q1@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJZa3ZYkoRQO/JuiN0DmDTh4KBv+iCcsbxlT0CIChQIOCGMW4
	JJXo2XdnZSUP0P39fT/fjosHFeRUj1BANf6q1guxRg8daFidcXb8aYr4JfTPbQGXcvo=
X-Gm-Gg: Acq92OHrasfuq7yyZ7o/j++rjCQ+ZYvRqAINwzPAmMYHodmS1Z6BCbhGSUb3zMBJgEI
	CO4cc3laxC560UevHFCvI3ul7kIGefEqKHvFZOltOKE9yzmjJfEoC1h76jg3fW9f5sbfQTlOAtT
	BQpDtlWaLFq76Nw1Wb25co13dFrG2YInLyyR/TuxowwS+VtM9Ie+nj2JlT79YNfPPLWLf3RMzoO
	y+HqlZpYuNnUdcdirHkZAczt4hR5dCpuaX/jXl43HQu7Zac2NHKaVlyjYJmPbKxO6v8xox9v8tA
	XmAR8jKui0UkyuartRJaBRLRhjVSCMAXDMQP69IONh/usHpn+dZaQ7bfOZdIzuP5g6sRe7XM9RO
	/T+c6NoFE1FBsha91+EIjXxsJXXpqfZ1rr/FEfQCzWhqonxKAj6pUkubz6vQ10w0C05bKHHFUUh
	5Xd3XrIMhygSa6NkLJWmnMU/5w1HK/2XQZOUunxtMBKxkD9rtXB2+lvk/xrchw0ULMnWpCHYp6u
	lqevQrG/ap1ftkQ9NPNjF8g/QkI2GkeLcRO30ePS4qq10piadKQShW0380SyOyZrrI5Y8hJL6zO
	FAcezjZJzspmFJOuyhG89hHWL8qkD0MJb2Q=
X-Received: by 2002:a05:6000:298e:10b0:45e:93ac:769e with SMTP id ffacd0b85a97d-460302dc502mr2224770f8f.6.1780640945279;
        Thu, 04 Jun 2026 23:29:05 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:04 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christophe Parant <c.parant@phytec.fr>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
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
Subject: [PATCH v3 00/14] arm64: support Engicam MicroGEA-STM32MP257-RMM board
Date: Fri,  5 Jun 2026 08:27:28 +0200
Message-ID: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_232908_239218_8DF704AC 
X-CRM114-Status: GOOD (  13.46  )
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
 .../dts/st/stm32mp257-engicam-microgea.dtsi   |  64 ++++
 arch/arm64/configs/defconfig                  |   4 +
 8 files changed, 755 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea.dtsi

-- 
2.43.0

base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
branch: stm32mp257d-microgea-v3

