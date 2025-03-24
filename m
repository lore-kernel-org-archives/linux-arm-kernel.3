Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4ADEC36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 13:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=geHsdT1vrdpFfM6YFLK2c0Yi2DY1fN5x5Y+Dw80cp/o=; b=AiWZSb1/EOFNL4a4me/3d1Vhdf
	4+DSr8dFXZiIPogHZr2ePtEihyuv9klDmMqHBIxGi/b9FTZQPKfU932xJRor77iVC6nmIAmj0PA3i
	B4vTZJPHafVukVSjbC/ZV7MA2Vi57Ey0r093AoKd5mHxMS+clBniNgVPCiPVhDn7xvGgzC/3oflTY
	ZYmWGBZ+PQUqRaduJefj1E5zK1Q9cBjlFlOUjc36j7JbAN2gw9ZOAOryBxfgHOyWRDrNE6phKPFU2
	PNG9pMG04c1GiRgtqGMoPxRSCm+ia/iO106InESrBUDYIhskMvhh+DUr/fIFcqds1onYwsxOf+hnf
	9zbnhmuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiKQ-00000003KLV-097V;
	Mon, 24 Mar 2025 13:58:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiIg-00000003K5T-3Dxs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 13:57:12 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf680d351so32179245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 06:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1742824629; x=1743429429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=geHsdT1vrdpFfM6YFLK2c0Yi2DY1fN5x5Y+Dw80cp/o=;
        b=UG1iV3e0+StowuTX6cuZy5wtRtjuj8Jbl2xHl2rRI8py9zMUEIhTbPXmVnfdxyQyya
         a8K0f/RgNgswYzlBgMoUfxykd7tSzlxFW9xSukYOiNeu+w+iVO3OFHgq0iZo0r1dYaJZ
         1ZYoi+mVU1bgHJD0Fccs6QSWmID1BK0BSXrw6ojYhQQ2fGJ9ve8FMFh9coyaTJez8eeI
         ld/K6TgDgN846YgFCPdm+F9YkP3jW3gdBjsBjxnaxGhVyL18vfpzCorSPGqUiPOJqWXU
         sQRTRsrQxbnPtb94bx0+73MtMTvjp+QL/YCtKu+RkGeDOJiT2CffZomped6SKWg02+jG
         yuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824629; x=1743429429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=geHsdT1vrdpFfM6YFLK2c0Yi2DY1fN5x5Y+Dw80cp/o=;
        b=f22z1LCsSUTLQBkBAG4bGQSioVMIkunGwa/PV5ckcRd1ql+jqG4DSPV+uNWvs3cfny
         ur4hAbHwqCVytiyLUG/YjFDI1FTyveoknpejOh9HUhg9kBLg5bwC0DTdSuUbVzfwLATm
         2X6eadmksI1qJdh0tAJeeR7OUbjzqzT2W3pXfGLCKlUSR7OaxBYBGLgdgNUOmSHSLZwm
         Dhg3IPgFJjgSfaXOy56B7vjLnzYtarWWZ/vyVkXOg6LWxwRUHzZeK2g0fj4ltl40Jl1G
         HQSsCWxeE6BW5+Y6gO/1KsmjQxxmQIhJOBXnkzz54/oUJ17Z5M+ST8RgC3FKdr1f/Lfg
         u6Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVPWtKBrEWgCfYvySPcHutqS3Dr6cYL6E/UYSo+D0jOeJGdyk7ICTg9F7otoGcqitD9fueQrQmvr+V6n8GHtLbo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy2nAxEnDW1LJFEjdgmRm7gdXxBmkKDs6lXU54k1rFRAW+BlgM
	Etj6XrGrMeoKoLiqyYpHxIQTJ58Ttkd5LP7wlm35zlYM1ePuewcSd6AUWNNgllA=
X-Gm-Gg: ASbGncu5LHtGRdlXpacqVeCIn+CSaA1mOPBqa5brGMPhIu2m9tWZ3adDqglCIAaUv21
	2778dUsL9fLemVq8pPUw9/JUJ3qJ8EqNDHXlZC8Ccw9b0JEvlDrbdTlTDGPyAkNRjmPJQis3WKT
	mz5VJLn/3cH9yQYMf6Jh2kv6+UFwNAUuA4NO15kJ/AmTk0TA4iozs3SzLQXMBgEBN9vYurUpfFx
	skTdQ6oL2N+5Hh+sqqMbiq05cyinaQXHT50Qkj2R9Giq+31VO4xihzrmQmWrm0wuokRsWSaWGXg
	EW97xwgLkSlnGp75xqs+ydPQZWe2L+2zA6bb83Lb9Om25OeunDaTX9NkluTb4wW3f4DNIjmHtw=
	=
X-Google-Smtp-Source: AGHT+IGkbsgJvhaLoKe9hCL01Phvk9cQWomrPl7igNBxsiltgQYpsqqfKtqy6vBzpm7mTH5vwHyozg==
X-Received: by 2002:a5d:64a8:0:b0:390:ff84:532b with SMTP id ffacd0b85a97d-3997955cc22mr13735349f8f.7.1742824629087;
        Mon, 24 Mar 2025 06:57:09 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdbcfaasm120146525e9.35.2025.03.24.06.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 06:57:08 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/4] thermal: renesas: Add support for RZ/G3S
Date: Mon, 24 Mar 2025 15:56:57 +0200
Message-ID: <20250324135701.179827-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065710_807991_37C7A59F 
X-CRM114-Status: GOOD (  16.03  )
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

This series adds thermal support for the Renesas RZ/G3S SoC.

Series is organized as follows:
- patches 1-2/4:	add thermal support for RZ/G3S
- patches 3-4/5:	add device tree support

Merge strategy, if any:
- patches 1-2/4 can go through the thermal tree
- patches 3-4/4 can go through the Renesas tree

Thank you,
Claudiu Beznea

Changes in v3:
- drop runtime resume/suspend from the temperature reading function;
  this is not needed as the temperature is read with ADC; this is
  confirmed by the HW team
- use dedicated function to open the devres group in probe; in this
  way the thermal probe code is simpler

Changes in v2:
- dropped the already applied patches
- dropped patch 2/6 from v1 as the devres_open_group()/devres_release_group()
  approach was implemented in this version (similar to what was proposed in
  [1])
- collected tags
- added a passive trip point not bound to any cooling device, as proposed
  in the review process
- decreased the trip points temperature
- convert the temperature to mili degree Celsius before applying the
  computation formula to avoid losing precision
- use int variables (instead of unsigned) for temperature computation

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com/

Claudiu Beznea (4):
  dt-bindings: thermal: r9a08g045-tsu: Document the TSU unit
  thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
  arm64: dts: renesas: r9a08g045: Add TSU node
  arm64: defconfig: Enable RZ/G3S thermal

 .../thermal/renesas,r9a08g045-tsu.yaml        |  93 ++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    |  49 ++-
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |   4 -
 arch/arm64/configs/defconfig                  |   1 +
 drivers/thermal/renesas/Kconfig               |   8 +
 drivers/thermal/renesas/Makefile              |   1 +
 drivers/thermal/renesas/rzg3s_thermal.c       | 313 ++++++++++++++++++
 8 files changed, 471 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/thermal/renesas,r9a08g045-tsu.yaml
 create mode 100644 drivers/thermal/renesas/rzg3s_thermal.c

-- 
2.43.0


