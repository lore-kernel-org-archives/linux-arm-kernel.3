Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2C5C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=; b=ho6QkC7wO20RUS
	HmjWMZbXsHDzYwVvnyOrjRMalHDX8umBzqRyphHGEC0NG3ELvIyFxuT171t+02JuVvdqQPI/BJnTc
	y8YY2dxAXFdEAWA0Y28zPDJGN2PVlhqPJzMxhgOxN/NMNdXwIZKBtUNtWWjfAU8XH4lJfM1XhS2sN
	DgOJoHkHdJqRu45wJPF6swq5GcysQw648+VmH1WBQiv3Eu+oXjr35qyVa/miawh003FWyvceZ90vh
	gANKf7c024LSkMBFat4AppEMDpPT4Sm8sJyQh/6M9cwuZVXBqCMPHsxQCpwr6UUZVs6II/gtWLKNq
	2ekUiE5Ouay54Ee0Uojg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVU-00000003oAS-1eES;
	Thu, 02 Jul 2026 08:10:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCVR-00000003o9j-3cDU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:10:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493b77b150aso12481415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782979844; x=1783584644; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=BEOMKXVgFa2M4S4bqaQGAPymFdR6kKK5hNl0qJb8yTqzmdl3uq06W9AghQydGyVzF7
         AABHzyHk+q1JnPNpOd4BhK54CGDISQbDwfavO+qfriyHFU7AFRp43IGBDWKzCqqmaJZw
         J9TyIzDqd/mkaCxiJBFQy+cImdG07ikjgxzpvAFu11M88/xVrZxx53Oa2C14lZM/SkGt
         f68tdOqxohYh20oQQESIN3TeykPCjCxMHQjfS47XSgw95fBzi9E5LugCziRtKL4fftvc
         8c3slIJJi5UOMhBBz7HIz7/hbf4QRzY//rcP8LNswZ9VRCGBMbTHHHO/R/Ieu7MdBLh+
         4khQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782979844; x=1783584644;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TStkowbQyn476cbj7sHzFF6Id3PxboxS4zTbnsp7ckA=;
        b=ePi4ZWMH48x5tX+jXZAnkn0m46XwDAjYDbGIX9735srDQT1orMei44ADO6NTIpTAk8
         JpTmPTF1R6KdldH680wJQ9eb7hSzGYouPin3GynimXo0xfGaZVxb8QKmwN+SbJl5cbEo
         i7puADJ/0SbaKUHXR9ilKJhPP0B5n6vHTwE8FYZkGhU+582tXJmIijyFs4aU6igfYW7W
         WOh7dE6F/gC2Cddl8uFma++vGeLXlWbyuBYWC/tR93DrQdnlo04bZdIaxI2q/owUAT3J
         /GaBb9Zc/f3cuJ02q6Miknco3iTZ7xqqYRXFX7WW9f5evQQSO/PgfyHp/o8LqI0GUZng
         953A==
X-Forwarded-Encrypted: i=1; AFNElJ8Xfaouui0Wl/AFxvz41GivtiddBe1i3qINNsj4VZDM0quBCDeF7/i0Hy2MTz133Sqw5L1PpXHylWUy1hVWtIky@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6549zIwo3zLUHmltoHV5HlKTxml/MQTCvPJP9ivWK12VYcedR
	0q+jwrR65YCsDREenDXFYVYhdgydqJAHW5YlK+RsyLJ1lKVmTT5KtVJ0brYZfVLH5Bs=
X-Gm-Gg: AfdE7cmj6ppMotRbpeJtNB3vCGGH/LWJT0gEOD2vgki+kQWBm/BkR385qABJSoixWX2
	xTgaQwJ9qW9RShNkXESxEPOrqe83EdwrpghsYC3jXGSYdaUe1D2XmjnEeL7CAUymA9bbTaQxkZk
	g/tmCRcl1yVJMMia2L3OQW/IXYmoluV9Irpjy1c8WPPLuHQ60GsyzbNw+s22Ul2XPDk9pBqegcu
	4t2Jro9DRrlq7Ge686nbPAH3tl9zvIFZymuQc1cffvHOCWyZ899eWC/4n+CBEhYYTLPBCA4HSkP
	aqre4YbOrF+qLVzW9A65tcrbLDFOVT9pyY4iLVdCjgY/ISQIBwLcHEKHPIqUi5sGgWGHM1eJxyy
	K2oyK48tIKGTM5pThGCUSMg7W12XCGiK2QrHWpZ7JRq/zAKZBzpzfp4DxAWeyPB2Z/Eu0XtdgHP
	ksYMaDHaBy3fc=
X-Received: by 2002:a05:600c:6c90:b0:493:bc4a:c6b4 with SMTP id 5b1f17b1804b1-493c3df6da3mr40899765e9.38.1782979843775;
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2e3a:7dcd:d2a4:6556])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-477db8a4a09sm6872510f8f.13.2026.07.02.01.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:10:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/8] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Thu, 02 Jul 2026 10:09:59 +0200
Message-Id: <20260702-a733-rtc-v3-0-eb2580374de6@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANccRmoC/0XMQQ6CMBCF4auQWVtDp9CiK+9hWLRlkEmUkpYQC
 eHuFjYu/5eXb4NEkSnBvdgg0sKJw5hDXQrwgx1fJLjLDVhiLRG1sEYpEWcvfC216XpZkSbI9yl
 Sz9+Tera5B05ziOspL3isB6JLjbc/sqAohXEGpUTTVH3zcHZ9s4t09eED7b7vP26UFU6jAAAA
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
 Sashiko <sashiko-bot@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2898; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RpYgXqcHniaYUqWf8mxFhxB+KJLte7VM9Vj154mX5v4=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqRhzxkwEf5Bdzyd27oCSpq4h7tdHUp+tEbg4VR
 Z0jNuLTPyOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakYc8QAKCRDm/A8cN/La
 hbuHD/kB91kHGeDducer2jqe2ndIa28Z2E/EheBjt2qp2JsoIigd4k5m5R75RIFmdlinKyJ1TiI
 0/EGurhWjxnk+ROvzRKA4X1dyoQKOH64035/X3k2ok+SSTLqtV/hmsHAr28/eBd6RyIcksBX04y
 YMGQSVUt/wJ7zlKSFV4gahC/Q7tCKyXhrVMJjrC/EFBWiERd79iAssZ9VgUWoa/j72y2mN9I5NN
 MmZQcWEe5Bco3mAxuSRa2WlHyepf76qy2D/48D2kGPXWlDrMRkVoyHN0FPIcZYD1DRzFbBfaKpS
 MZSXEL2AryzIqyTsMWYnQm5volxnyscBI93VwkKgyCTqmLNt9oqqII8TcLnzuh53v1MaXb00MuF
 ZL+XBFNGVzQHeeK7Kh8/2oicQJBRTzTPDVR3UJ9GTRtPPRWB94aunseTzQRvYiZdP9s43kNKJjJ
 WBRFSQqkOr3t66a1JA7MEcp7cud4aE0ydX1GyJ+DFIbDc7jZnJRq471IlGThknIkiYVAStm1eSW
 vYLP7PJf8DHwc/gI/3aWvidnfLbTw7HFO8q/vB9zHzzAAO+CEgfmgwbQidd6TJDwXdk6KcGuZNU
 lHs4bLtfnng8szELfr2T7oUUEjtYNij6faySFglDp+Xc9eaFgVZj1QJ5+bMQayIstSANkjs35WC
 EknFlM9LkeN26kQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_011045_935829_436DF07F 
X-CRM114-Status: GOOD (  14.42  )
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
Jerome Brunet (7):
      dt-bindings: rtc: sun6i: no clock-output-names on h616/r329
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: fix ccu probe clock unregister on error
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
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
 10 files changed, 163 insertions(+), 43 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


