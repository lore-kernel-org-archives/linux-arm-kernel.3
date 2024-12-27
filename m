Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510D0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1+nHUcJaaX6M73EGiytD1ePmgcQwk8+iLSU7mDpJs1M=; b=vU7P7Vi9+dDG9cwJ7zSVkK1iFM
	Tt/mOgV88bz3nesyuvLhWaNLsPnMNwc9QhxkcKURDnG2p2w3iGogkUoC2rvIW9iszrHYiDb4//kxK
	Q2kXq0jDHLE1Mn6D0ueIa09JWMJASFOxSGRrFrpjP8tLnepulSG4RdYsU09QCAl32z+HedC+cHqir
	4Af3yCEEt/O1CRWnvvONTCV6cmS+vEWHgnMgVvEwsYsHqmg3lilJrtB+KlrgAGhlHXG3DAn71SzRZ
	ywhtztzt8Drilaw1A8k7qrT8F3Hmh96+59w4MPGOGC7r0U76XyVajarlFob/krl9ypUJ2ysdENEhC
	6/qeS5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHrE-00000000yDJ-0XfW;
	Fri, 27 Dec 2024 21:26:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRHq0-00000000xrd-2SWz;
	Fri, 27 Dec 2024 21:25:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so10478651a12.1;
        Fri, 27 Dec 2024 13:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1735334738; x=1735939538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1+nHUcJaaX6M73EGiytD1ePmgcQwk8+iLSU7mDpJs1M=;
        b=KGBHt4TuR1UR2ei0Z3AZyJXxOXqVouhIQVRh9HcsUJCpYyIo3+0jiHm96ZIXFuIyzo
         Sbx1jsOuC46C3swpORxh4L4tx3j7+PaM41birCnyvg44tfG9ew2IGNpecKztpzeF30CI
         XdiI1BWDBWMGmcyQ0BnXUsreKz9Gjo+EJ8dJ6nUjqcIGLqZNbiVCOfebsvVc24KtMKNb
         I6gwD6Bft/8ggTFU/+VHOPFqV6m9gZKpdqFkzABo/tOOMABYBS3skan+ktJcvNCDYq/t
         JwaZQn/3zVDdnAjTH5PFP121TV36getwwpIf+LyclaekvPwSMj3OY9mZXI6QOpnOfbBZ
         vkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735334738; x=1735939538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+nHUcJaaX6M73EGiytD1ePmgcQwk8+iLSU7mDpJs1M=;
        b=j88aBa+jFRjGyyzavinA/sCwxWhAg74XRWnNcmxxQ9n4un7/G8urjme2JiqILWl8W1
         vZZdu4ruV3EnWTqMMNad/+8j7bPZuHR9GN1MZWkE/HCFAL3D5BvcRQ+Aric5M/Q11NF3
         Y/fbSyyYPcjmqaCejRgxmILN5juImi5CbLYx4B7E+U4Q1k/UljKdwNSWxjj52pj3wbf3
         Z95914L7mfuzHy4LWxCJwXrc+KLoTOVRCZbZCNwCdBbEIp6yVa7LM5ujRoNt+7plvkje
         3EBGIFIscdiCfvqJ8/eMNYvd/sr0rnobP9ES3L/m5IW4DIofAFM2tHjTBy+W6ODn4KFt
         r8Dg==
X-Gm-Message-State: AOJu0Yym2PfpmVoNPDvAUgwmKNKCi5+S6FpcT8I0XGbTaPG5mAr/XEOm
	NwHjv7cB+Ivb9j68PUz/6Uc6pi+3Ieen2UzgEzio9curtw+evkTGgRJzZg==
X-Gm-Gg: ASbGnct3YB3OogDmzpfCEE8g/sHRX54MAdc7xNylulTUfwZWiId8jCGMFK2F5BnrRre
	AkMT3dj0fvKlGBZOGiGgOMeytbIsNOpsQALdiaCoz02YYQ54FW6Gxxo9vJsozInLtHNBCR364F2
	bkqmXIojlq0mCeIwOUAscMq+s782Nv/pmDIHE/WcNT+0qoubEmxFb0LKYuN+sqAaAI1ib4VkNLx
	mXLB1a8dCvTt1PNDwsWiXkq1a4iysvyLFkfE7kzVWgOQt8Y/+0NXj8rw3xBBajKAjqBHq4oV1Gp
	g8grNpm+CuNDflgPagArAjnsgrQPyl/tl4cNspuDg4JXdxjNgCtZkNXkC3Hlf64+A6epi9lWSn/
	2nTXbao+HEp9d6VrlaUm+RepYmg==
X-Google-Smtp-Source: AGHT+IHnBN3F2L0kezSr3mHmow56nVHGn9/SFKxqsMbsLj1fbSuW+qlfmL5RgbD0R3tdmsF1U83hrw==
X-Received: by 2002:a05:6402:254f:b0:5cf:e71c:ff97 with SMTP id 4fb4d7f45d1cf-5d81ddfbe45mr19864210a12.24.1735334737456;
        Fri, 27 Dec 2024 13:25:37 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b2be-ba00-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:b2be:ba00:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806fedbc5sm11627950a12.60.2024.12.27.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 13:25:35 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 0/5] dts: amlogic: switch to the new PWM controller binding
Date: Fri, 27 Dec 2024 22:25:09 +0100
Message-ID: <20241227212514.1376682-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_132540_633992_9221C744 
X-CRM114-Status: GOOD (  14.09  )
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

This series switches all Amlogic SoCs to use the new PWM controller
binding. The main benefits of the new binding are:
- the pwm controller driver now picks the best possible clock to
  achieve the most accurate pwm output
- board.dts don't have to know about the pwm clock inputs anymore (as
  the driver picks the best one automatically)
- new SoCs only need a new compatible string but no pwm-meson driver
  changes, assuming only the clock inputs differ from older IP
  revisions

This silences the following warning(s) at boot (for each pwm
controller instance):
  using obsolete compatible, please consider updating dt

I have tested this on two devices:
- meson8b: odroidc1 (boots fine and cycling through all CPU
  frequencies and thus voltages works fine)
- meson-sm1: x96-air-gbit (boots and the rtw8822cs SDIO card is
  detected, so the 32kHz clock for the SDIO card works)

Since I cannot test all devices I'm asking for this series to be
applied so the Kernel CI board farm can help verify it works on all
boards available there.


Martin Blumenstingl (5):
  ARM: dts: amlogic: meson8: switch to the new PWM controller binding
  ARM: dts: amlogic: meson8b: switch to the new PWM controller binding
  arm64: dts: amlogic: gx: switch to the new PWM controller binding
  arm64: dts: amlogic: axg: switch to the new PWM controller binding
  arm64: dts: amlogic: g12: switch to the new PWM controller binding

 arch/arm/boot/dts/amlogic/meson8.dtsi         | 18 ++++++++--
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts   |  2 --
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts     |  2 --
 .../arm/boot/dts/amlogic/meson8b-odroidc1.dts |  2 --
 arch/arm/boot/dts/amlogic/meson8b.dtsi        | 18 ++++++++--
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 24 +++++++++++---
 .../boot/dts/amlogic/meson-g12-common.dtsi    | 33 ++++++++++++++++---
 .../boot/dts/amlogic/meson-g12a-fbx8am.dts    |  4 ---
 .../dts/amlogic/meson-g12a-radxa-zero.dts     |  4 ---
 .../boot/dts/amlogic/meson-g12a-sei510.dts    |  4 ---
 .../boot/dts/amlogic/meson-g12a-u200.dts      |  2 --
 .../boot/dts/amlogic/meson-g12a-x96-max.dts   |  4 ---
 .../amlogic/meson-g12b-a311d-libretech-cc.dts |  2 --
 .../dts/amlogic/meson-g12b-bananapi-cm4.dtsi  |  4 ---
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi |  4 ---
 .../dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  4 ---
 .../boot/dts/amlogic/meson-g12b-odroid.dtsi   |  4 ---
 .../dts/amlogic/meson-g12b-radxa-zero2.dts    |  8 -----
 .../boot/dts/amlogic/meson-g12b-w400.dtsi     |  6 ----
 .../dts/amlogic/meson-gx-libretech-pc.dtsi    |  6 ----
 .../boot/dts/amlogic/meson-gx-p23x-q20x.dtsi  |  2 --
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi     |  8 ++---
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts |  2 --
 .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  2 --
 .../boot/dts/amlogic/meson-gxbb-p20x.dtsi     |  2 --
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi |  2 --
 .../boot/dts/amlogic/meson-gxbb-wetek.dtsi    |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi   | 25 ++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts |  2 --
 .../meson-gxl-s905w-jethome-jethub-j80.dts    |  2 --
 .../meson-gxl-s905x-hwacom-amazetv.dts        |  2 --
 .../amlogic/meson-gxl-s905x-khadas-vim.dts    |  2 --
 .../amlogic/meson-gxl-s905x-nexbox-a95x.dts   |  2 --
 .../dts/amlogic/meson-gxl-s905x-p212.dtsi     |  2 --
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi    | 25 ++++++++++++++
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     |  4 ---
 .../boot/dts/amlogic/meson-gxm-rbox-pro.dts   |  2 --
 .../amlogic/meson-libretech-cottonwood.dtsi   |  6 ----
 .../boot/dts/amlogic/meson-sm1-ac2xx.dtsi     |  6 ----
 .../boot/dts/amlogic/meson-sm1-bananapi.dtsi  |  2 --
 .../dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 --
 .../boot/dts/amlogic/meson-sm1-odroid.dtsi    |  2 --
 .../boot/dts/amlogic/meson-sm1-sei610.dts     |  6 ----
 43 files changed, 132 insertions(+), 135 deletions(-)

-- 
2.47.1


