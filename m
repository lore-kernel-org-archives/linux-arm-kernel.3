Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A7FD5CC99
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VkWLa1FF6BzDGEOlRo45xTi9HEweUx52IMDZUJC3W3A=; b=uOQMkdwbdhN22QSsIMW51IoVU/
	LEyKYEFPa8hlNUl4a8JHoEC2SbVG5RoWPPTUdaWopN03acopbmQFZncIgnbp1KWpaatx4pkNT9V4G
	gpkVhicyVb2Xn2s96OlIOgFRpJljd+7Rf9L1rjss+6kYyb5Fa0iBb4dWKW4jEcSeKnjkqn3lsBauX
	faVezLUITo8y4u9FH/XWqEZ610BzMXCqfuakDlx9uZlu5MmMEBzZS6gHByyep79uStig9MNWj6r8C
	deiv/g2X6gyUjVfYwcIthTZOXcEZIxaAKaR/uOP3ulYQA3Xs2y/XZHGJCs0jlkJRtxlhHF7XoDNgV
	wAI8Jpyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oRA-00000006TmF-3x2Z;
	Fri, 01 Nov 2024 09:59:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6oPS-00000006TJj-0o1J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:57:40 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso2369491a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730455056; x=1731059856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VkWLa1FF6BzDGEOlRo45xTi9HEweUx52IMDZUJC3W3A=;
        b=RfX97e8zARY43TGDvQiMa+W9fUu9sgJjeBamFDjRRVx84HN/o/scRGIuQeefxpdoKG
         vvvb57g86xb9oQ0YIR8+z6d6mRO0DbVutOdarWN47+c1dgYeKaPKfxXO00mae9P/HrhA
         m8IWNOtj65pbLTKYuo00tJSBPltfPmB7b9135k1Yk7hxCNHvpOP6h5K2c0RqCzrtKzyz
         ME8r9/xBjVWFR2LlwOcUvVG/ihAiXpbobmpMsBLThmn0ZjqpwtsNffiRfFlSVjPU8lpu
         qhDRA5r3ukxTEVE4Jum3+kKSnf1Vo+5dG9nGq7ShgtmuRZoKRqrQ3bt0YO0yzRSRIC+D
         0Mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730455056; x=1731059856;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VkWLa1FF6BzDGEOlRo45xTi9HEweUx52IMDZUJC3W3A=;
        b=RQxG8YW5lgGQI+ImiHUE2y1XWh45Su6StbsF0cpk63JtSJt0fzzRj5VEWn/tGmtMxr
         emGZqO1s+alhWUNVcpBtZvIp0pnLbCkkEPbfOJ1vhcmw72TpYqCaPHNPlwnt/ktu+nid
         70wOG/jQKfHuD4kcOwjDz6awkr3xykK/4/MnVrQ4joIGcRNEb+udJnDz+F2vpdvOES0e
         60dWvaZr5sDMHzni1dduBJsuhRDW3OiS1I+2n0Hf/DAOXJ/dklgz8GZwhGffz2DzxJ5N
         B6eZZKYUMB3BV+6tZKbHsP760ZHXHJKUPl1VjvNx++eKsKhSfK0dW+U6CEB46IjOPfyb
         hMIQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/fQPZZ0fVM8ZniNbjR3zDEzmpwbkB28w9ZEbPs96Zg1p6wvGyufYnGeMlgsYFbOqhMUqX4F4AsD7hF6M4rtGv@lists.infradead.org
X-Gm-Message-State: AOJu0YxmdurmDPOWsdG9P2I/CA36M4nr5Y2A2LLXHpH2R2ayB0Jt/oOP
	R0Sx0gLFKmMJ8mKNo26PchRyz32ox1JCeNlYJFssURABXtk06EammCAPd9L8j00=
X-Google-Smtp-Source: AGHT+IGRtBYD1dOUvQuIQlQLj2pdPegx5k8lcdT/lJDx4obsDzdA8gaMq9JOwdMxgv+GTXcS3XRj5g==
X-Received: by 2002:a05:6402:40cf:b0:5cb:acb4:8f2b with SMTP id 4fb4d7f45d1cf-5cbbf876412mr14451734a12.4.1730455056199;
        Fri, 01 Nov 2024 02:57:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceac7c8d87sm1364136a12.76.2024.11.01.02.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 02:57:35 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v6 0/9] Add RTC support for the Renesas RZ/G3S SoC
Date: Fri,  1 Nov 2024 11:57:11 +0200
Message-Id: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_025738_263177_1D84F94D 
X-CRM114-Status: GOOD (  25.49  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

On the Renesas RZ/G3S SoC the RTC clock is provided by the VBATTB
IP. A 32 KHz crystall oscillator could be connected to the VBATTB
input pins. The logic to control this clock (and pass it to RTC)
is inside the VBATTB IP. For this, the clk-vbattb driver was added
(patches 01-03/09).

Patches:
- 01-03/09: add VBATTB support that provides the RTC clock
-    04/09: fixes compilation error for RTCA3 when building for RISC-V
- 05-08/09: update the device trees with proper nodes to enable RTC
-    09/09: enable proper config flags for RTC to work on RZ/G3S SoC

Merge strategy, if any:
- clock patches (01-03/09) need to go though the same tree because of
  patch 03/09 using the devm_clk_hw_register_gate_parent_hw() introduced
  in patch 02/09
- RTC patch can go though RTC tree
- DTS and defconfig patches can go though Renesas tree

Thank you,
Claudiu Beznea

Changes in v4:
- select VBATTB and RTCA3 as module and adjusted the VBATTB Kconfig
- fixed compilation error for RTCA3 when building for RISC-V
- collected tags
- dropped patches already applied

Changes in v5:
- dropped patches already applied
- fixed build on rtc yaml file
- fixed indentation in patch 01/10 description
- collected tags
- per patch changes are listed in individual patches

Changes in v4:
- added patches
  "dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC"
  "clk: renesas: r9a08g045: Add power domain for RTC"
- squashed the following patches from v3:
  "Add clock IDs for the VBATTB controller"
  "dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB"
- fixed typos in commit description
- moved assigned-clocks, assigned-clock-parents from the RTC
  documentation to the VBATTB documentation; same adjustment has been
  done on the device tree patches
- renamed include/dt-bindings/clock/r9a08g045-vbattb.h to
  include/dt-bindings/clock/renesas,r9a08g045-vbattb.h
- used quartz-load-femtofarads
- used RTC_TIMESTAMP_BEGIN_2000 and RTC_TIMESTAMP_BEGIN_2099 in the RTC
  driver and added a comment in remove API to mention RTC cannot power
  on the system
- squashed defconfig patches
- collected tags
- per patch changes are listed in individual patches

Changes in v3:
- dropped patches "mfd: renesas-vbattb: Add a MFD driver for the Renesas
  VBATTB IP"
- added patches:
-- dt-bindings: clock: r9a08g045-vbattb: Add clock IDs for
   the VBATTB controller
-- clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
- moved Documentation/devicetree/bindings/mfd/renesas,r9a08g045-vbattb.yaml
  to Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
- addressed review comments
- per patch changes are listed in individual patches

Changes in v2:
- dropped patch "clk: renesas: r9a08g045: Add clock, reset and power domain
  support for the VBATTB IP" as it was already integrated
- kept only a documentation file for both VBATT MFD and clock drivers as
  suggested
- addressed review comments
- used cleanup.h lock helpers
- update startup sequence for the RTC driver
- switch to 24 hours mode on the RTC driver
- fixed range for the RTC driver
- added a generic compatible for the RTC driver as this will also be
  used by RZ/V2H
- used clkin/xin clock names for the VBATTB clock driver to determine
  if bypass should be configured on registers instead of having
  dedicated DT property
- added mfd driver for VBATTB
- updated Kconfig flag names to include vendor name
- removed DT node labels from Documentation files
- used items to describe the interrupts and clocks


Claudiu Beznea (9):
  dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
  clk: linux/clk-provider.h: Add devm_clk_hw_register_gate_parent_hw()
  clk: renesas: clk-vbattb: Add VBATTB clock driver
  rtc: renesas-rtca3: Fix compilation error on RISC-V
  arm64: dts: renesas: r9a08g045: Add VBATTB node
  arm64: dts: renesas: r9a08g045: Add RTC node
  arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 flags

 .../clock/renesas,r9a08g045-vbattb.yaml       |  84 +++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  34 +++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  16 ++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/clk-vbattb.c              | 205 ++++++++++++++++++
 drivers/rtc/rtc-renesas-rtca3.c               |   1 +
 .../clock/renesas,r9a08g045-vbattb.h          |  13 ++
 include/linux/clk-provider.h                  |  18 ++
 10 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 drivers/clk/renesas/clk-vbattb.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

-- 
2.39.2


