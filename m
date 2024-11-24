Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC515E668A0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 09:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EF6KAe0aJXErRNe2gIgSW1j08V4k2/044lY06SL09oI=; b=qXiIr6RDuLHlESyG4G09cf9hna
	MUPV6USRS0tkkGwzylAtLUwtksvRWuzQdfX3S6QQNptYypIdQ+H3LIGxrvAduFiZuWdDhNvO657Kp
	/gVJ46MAipRT0aEjkxa8uGVbYnZzLKMK1klpdg99X9YjmhYpP9iuzwxVH99w9Y5q6oCkWrb7QOpv6
	FCrUh2q56hw94FPWBjk1aurjPRYyenO+RMtnAE6uaGv0iqyhRDgXW9CU5rNQe1ZYHzfYtcjaVihED
	7EgVe/fyZeGeDwOEQ+m2ntqAKEpunLPUhesR7AfjGj3rFuzsDyZJKXVG/DZRC4B2vOrzpXrHwi3mr
	7CyM/Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8Tb-00000005WJ4-0Zvt;
	Sun, 24 Nov 2024 09:00:19 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF8Sd-00000005VvK-1XET
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 08:59:20 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7ea8c4ce232so3171641a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Nov 2024 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732438758; x=1733043558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EF6KAe0aJXErRNe2gIgSW1j08V4k2/044lY06SL09oI=;
        b=Z9aCCSiYCfdSrEAHSrxlYd7+LyTa+TF96a+9D0YIkTjRVzZ150XYCXGhMWqey9+mm5
         QMAbExhgIVXJQFFmIiez1iRexjHy0ovQpbMvOVPOrTv81x39C7JnAiK6N3qBm9OvNEhD
         9X7kjukJXwAocdIfpjRLqNwyyuu21APl3kkOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732438758; x=1733043558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EF6KAe0aJXErRNe2gIgSW1j08V4k2/044lY06SL09oI=;
        b=hDWst1e3Bog87jtphHJyL8Rjglsc8ZWBSXNg303C3g1qvVpIvvNCDsZ7aMQrxdnVa5
         ciNJYQvBOocoqXhAMb4yGY4KI+w7+0hmhQRlatdZqprVo7Kd5U5VpY63bdMxo4kT8sw1
         wH+KrSbg86ujdUW7QVY7qg09HdOEwupHelnnuIcSZ1krCtIm+U5t0oKTkVMiM1btIwvh
         aF/dfMnUx/u4fknzHjZxvXX0f33MrcmV82YF29Kr0FCwmvFAoY7xQZRGBGcTlMwlWi17
         DqDoE62gEM+g4P8dqeCsPrnKQP7j46H7s8DVQzc/VSM8EGHkOI3riAWdyDmVVl2vYxTS
         9/hw==
X-Forwarded-Encrypted: i=1; AJvYcCUwMh9VUM2ShSk80Z58JqjyHEtdFo9xsFePn12zOA8NBn1p/rfk+FRH2Or0D7Zmtjy+RiVL52ZVsce8ypUQHG9t@lists.infradead.org
X-Gm-Message-State: AOJu0YxEIwuGHOL/e4YUCoN8YZrgcwkDWWZaxW/QUrZbH8YRtnR1DiY0
	n0geJtqEiFy5k5HtowIsGWZ2k5PtTipp3Zu2F7QoNliWgX+g3Q+hAwYflXwwwg==
X-Gm-Gg: ASbGncuPWRgV+RFVVTqUiH++1u0v8hgJRvJdmiEKqK3VoeY1m7/jK3TO+2wdTe759I6
	8IC97Nkh/isnu+RGo9w0R/OJ4QJfQ+sJzLAdPErsZnYCcMEE8dQwR7DCSJnrbfen2EjKK/kDooE
	xNufSprDGqsGKYYf+wDl0PaLrnD8cb0+aTbzjHKcsmL7ukPooKiJRKHUYDrS3IpLlKKrtSyVDSL
	XjOvwPKo8ZzLy+OXkGPMDhDAom6W4brYlIVa3jE1irr7p1gVpTtpIN+FV+lWTuA6z0xHQ==
X-Google-Smtp-Source: AGHT+IFXc7VvlP/3gYWKOjTV8+v6xQUtU+qQkhGAveyBwDGTGonrlWWpAiyBkTbiDpTB33S9/XAxUg==
X-Received: by 2002:a05:6a21:778f:b0:1e0:b51b:ac22 with SMTP id adf61e73a8af0-1e0b51bad66mr4211481637.30.1732438758063;
        Sun, 24 Nov 2024 00:59:18 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:f699:9cb9:f928:9a14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcbfc4c28sm4465890a12.3.2024.11.24.00.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 00:59:17 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/2] Add device tree for MT8188-based Chromebook "Ciri"
Date: Sun, 24 Nov 2024 16:52:36 +0800
Message-ID: <20241124085739.290556-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_005919_582164_3CA5F582 
X-CRM114-Status: GOOD (  14.98  )
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

This is the v3 series to introduce the device trees for Ciri. Please
refer to [v1] and [v2] cover letter for the detail introduction of Ciri
if needed.

Note that there are patches for some known dtbs_check warnings:
- sound: Unevaluated 'mediatek,adsp' property
  https://lore.kernel.org/all/20241105091246.3944946-1-fshao@chromium.org/

- amplifier: '#sound-dai-cells' does not match any of the regexes
  https://lore.kernel.org/all/20241105091513.3963102-1-fshao@chromium.org/

- dp-tx: '#sound-dai-cells' does not match any of the regexes
  https://lore.kernel.org/all/20241105090207.3892242-1-fshao@chromium.org/

- audio-codec: 'interrupts-extended' does not match any of the regexes
  https://lore.kernel.org/all/20241105091910.3984381-1-fshao@chromium.org/

- pmic: 'compatible' is a required property; 'adc', 'mt6359codec',
  'mt6359rtc' do not match any of the regexes
  https://lore.kernel.org/all/20241004030148.13366-2-macpaul.lin@mediatek.com/

- power-controller: Unevaluated properties are not allowed
  ('power-domain@31', 'power-domain@32' were unexpected)
  https://lore.kernel.org/all/20241001113052.3124869-2-fshao@chromium.org/

- mailbox: 'clock-names' is a required property
  https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com/

- jpeg-decoder: iommus: [[141, 685], [141, 686], [141, 690], [141, 691],
  [141, 692], [141, 693]] is too long
  https://lore.kernel.org/all/20241001113052.3124869-4-fshao@chromium.org/

- amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
    >> ti,tas2781 binding specifies that ti,tas2563 register range is
       0x4c-0x4f. The DT follows what the binding literally suggests.
       I tried changing the binding locally but didn't help.

[v1]:
https://lore.kernel.org/all/20241025110111.1321704-1-fshao@chromium.org/
[v2]:
https://lore.kernel.org/all/20241105093222.4055774-1-fshao@chromium.org/

Regards,
Fei

Changes in v3:
- Multiple DT changes, refer to Patch 2/2 for all details

Changes in v2:
- remove invalid or undocumented properties
    e.g. mediatek,dai-link, maxim,dsm_param_name etc.
- remove touchscreen as the driver is not yet accepted in upstream
- update sound DAI link node name to match the binding
- add missing pinctrls in audio codec nodes

Fei Shao (2):
  dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
  arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri

 .../devicetree/bindings/arm/mediatek.yaml     |   13 +
 arch/arm64/boot/dts/mediatek/Makefile         |    8 +
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   32 +
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   59 +
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   59 +
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   32 +
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   48 +
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   72 +
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   72 +
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   48 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  316 +++++
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1156 +++++++++++++++++
 12 files changed, 1915 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi

-- 
2.47.0.371.ga323438b13-goog


