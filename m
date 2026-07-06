Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AE2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=; b=cV683X7NwMO4kl
	aXLXnGJboVFbguLiOV8ZFWjBOZw9iihqvNLjfJbBH9AWLqdJr7RS6VYQ2QmbSqufOioTm0hNVjcqB
	qLsbDHjW0ReBA+nWQy8czMb1ACjQbiAvRcHAh58C8oSmsFW4hyVjVs+3Yum1bNuy6EPpJ6zDLi449
	VwV1vBBvfJZLdDq/0QbXxBypjdtwueo2SxPvTPz+8kWeD73xRyW02hT3ev8RynjHhiq22lhUgOnTY
	QbfbcKlrfCMyHLRXYi6j/1HI1OpzUTf6TQN6aXSWluS0FA/xV0PkOKK36sL+7w5xHQaBRmkXXvlYL
	umf3WGk3Jl8YLnYtf/Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgm-0000000C1pd-1gpB;
	Mon, 06 Jul 2026 09:32:32 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfgi-0000000C1oy-318N
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:32:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-47d6c634f45so848618f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783330347; x=1783935147; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=pQB3YLhy0kYtB0F4lirwxFRKGlSjGV6rtwwlNhMssh6BkVqrB7dfNcLb+l20vqbw/v
         Pdyz3K5sLkAPLnik7dtc2ToG/WZbJi7b1KPWNGAM4h66V6r5ZNHifRKvmoZENO2b2VBG
         bjxPYTc0D9oaP0QEK28fl5hMg9AYLCXXOOgWJbxILB9luut2ghKX7OHG57ca8a4AEycW
         9BPG52ues/1dV9xBVH8p8B1vWQQyV13NqOXnsTqstgGlWu/fQnDyS4cnsmp3RgerwiHM
         I5WqwveoJqg5baF2EdEzCvWF/TvLKAa2je0qU8gT/1lNdkvHz5VQWVHxS5FQYWWW4h9w
         /11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330347; x=1783935147;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGWHjLvseR49oiYZ4VJv8W2FD9SlQLrFTs2lm2K5pds=;
        b=YcZU0vddsB63SfVe53sRjAwH9+YNayLJH1TwMnMcDUu+gQ99Duq1mOWO5ETQEbxlDU
         02pU9lLAR0Uav/TywjMQ4NtEsSntvCmr+5Q8XCdXf5f/TQL+AEAOB/kD3rmWgp8r98n/
         D9lJnssStlND8QPwYIjXP/JtCV3APw8wF/XmqFTRm/v6f0spJ4HKF4aiJTWiQxuhsRSG
         erC2/vfjE0eI1O+4hKe7SwZ/YWb+rcYVUNIWwzeyZjZD0uVBpvG02tv02qadAY5/40v8
         B/ZgI3h5DDy5ek+dzaxCr9DaraPVUNp2kG6uIGbuZyqjiwyEvi+6Q4/kk07mUMLhu36o
         7Svw==
X-Forwarded-Encrypted: i=1; AHgh+RpckbCMfhde1inpSkQrFUWhmolHf9V7d5z41p6eAdi2MBeclzC9RpzIyJqGD0QhWFnE4xjceM2Xy7FpfRq8GyGs@lists.infradead.org
X-Gm-Message-State: AOJu0YzmrB+danqJ16XInx35J3H11GBcmPZ3uoB6AuVGEsEiqMeF6A1S
	3e2pRXkdWX+p1ZWzgCb6+xKy3X8NjMgFimOhrdVQzOYEYKgf0Gq/jcBJ3RaSJdVK3ak=
X-Gm-Gg: AfdE7cnzBa/KgCcQUcXtf4dG7CSIhzPhHcvAAgrYn2k1O4Lqd5ZVTXYWU9S6eS4xD6R
	e8cvWejXuJmfQr0FoNnQx0s1tSbDY9ez039d+Q3tXVd6QWAhjdtsRFhVJDBFXcdleRvilVr8qoU
	4cYaE/PhKvz6VXUEImmxXYfhYU9fsr3u9pTJMxel2AMp5Xzw1qGiEEN8qm5rX5O3X4c0lP/L/fZ
	il1hf/NKxFG54rUV+Yg9RXLoFePHNEOksHDLBHhjOnXjv7q4VGBuAiW9fM5VW6hOsr/cQXRe8rJ
	0ZVOsVxjdktt/axVldTwkv8tkTzInbgKg7XO8RAM9EFfoFxUgi2hfBZXH6S06KhDzgosuc8ro2Q
	vBNl16MIadvDysLNmhQWHzCLPqp+/GtG84J83jbndsHpknBJm8NILc57ksZpbogtAiVjKWOZSVE
	d51tuxWjxh6GE=
X-Received: by 2002:a05:6000:4288:b0:462:6aa1:4393 with SMTP id ffacd0b85a97d-47aaa60fb9emr9104104f8f.4.1783330346835;
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1495:8c97:96f4:dff8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d91bsm27289985f8f.4.2026.07.06.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:32:26 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v4 0/9] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 06 Jul 2026 11:32:08 +0200
Message-Id: <20260706-a733-rtc-v4-0-f330728db3d3@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl2S2oC/12MwQ6CMBAFf4X0bE27LS168j+MB1oW2USBtKSRE
 P7dwgXjcV7ezMIiBsLIrsXCAiaKNPQZ9Klgvqv7J3JqMjMQUEoAw2urFA+T576Uxjat1GiQ5fs
 YsKXPnro/MncUpyHMeznBtm4RIwxcjkgCLrh1FqQEW+m2url6fpELePbDm22dpA7XCvhxVXbRQ
 VkJZXWD5s9d1/UL1Jg0Qt8AAAA=
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=7r6e0BxSzZOlBZqjxDeJNnpI3oGS8Amus0XcLy8TcCE=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqS3Yc0UHOfsE1Xd7pmqULYPfQpfhgD9Q5xOmEN
 5uHJa5XDD6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakt2HAAKCRDm/A8cN/La
 hYKDD/43rfDQ7Hhrw7gxzzrVsf1tZVz4a7BRQskWh9hyhtC2hSRxXyIZWkwuVHLY5ADWStB5wqu
 J8ZdQoEyZ3h7XAW1X49mRdaOQNwtXrI7tBgpAE1diKd23we1YKiala5pNFLlz54QG6q/h22M7zh
 tUt0eX+na3K+FvaOQq78QJyoMC3+egZZ+szZdBu5DdbwxoFwM4bw5TgfNQ6pLO5h/sPpDv4nAtS
 /Se293weQK5PdqjxPKtEqThTC5H8G5tLkxNj9cQr9/VT0c1Ix+5H/wyrBWpxrHs5FyO10BKp9Xf
 zogld4MWweZ17X8TsyHqcT/DnUmvgMHze520cGE7pliJYnv9cwlZfMy2hYwFh+a6KSUyYUWB7pH
 +KR4ju6NGz5rrad0bKpFXuc53E1KG34PwP/N4fAjnT6c9vTat4VOrwLZMGACEzCS0bnv1ecEfKw
 PTCfEeJVG7FYr6SXJzdBoEjm5gsy4DYWk2PBq+23Oid71hbBjv2nCnkwLOM2SOPLOuLjvNfx3gd
 71+MnfTMoI8RDBbl487hTBn4i66guUOJ+uOL61VDlcVdtPPzYTIH5rx/GrnNTGL0NxA5+25+uvE
 rVpm4ZQXHLxU3w/IVvdTUaNw/igOiuR1bqg+pmGW5bSQBbNlvghzwsHg1JNwDu5ohWx+c5gvS0G
 RBMfGm+SxJt4caQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023228_808725_5750DEBE 
X-CRM114-Status: GOOD (  14.59  )
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

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v4:
- Remove unneeded export of mux prediv helpers
- Link to v3: https://patch.msgid.link/20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com

Changes in v3:
- Disallow clock-output-names DT property for h616/r329 chips
- Fix ccu probe helper to properly unregister clocks on error
- Implement .determine_rate for ccu divider RO ops
- Drop unused DCXO_CTRL_REG_EN define
- Link to v2: https://patch.msgid.link/20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (8):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: mux: remove unneeded export
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |  13 +++
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 123 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  12 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  42 +++++++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   3 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   4 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 10 files changed, 162 insertions(+), 44 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


