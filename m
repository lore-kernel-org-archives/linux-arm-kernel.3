Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9D6D1266F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5NJ1FycqfnpK3mvOipRZB2Wgu6vFNoR8bmZUzO4ewgA=; b=W28X7P3t3mCPKj9fcZiJC7rLNO
	wuf35toac70PZCHzXD9BRMKcs5/pjw9MuVd71hPtamNaIHODr/tygEf99Bj1Sb49ZBFBtxoTSucQG
	8ru48Ezug5HZSHhEco1NEXRxEYq7zGNNJoyyylldHAS5Wv8x9U6LqU6k5XnSZsw+ebrv7yAe6xHdH
	/c9ghsmpvf1ZyrgewMdgVU0/mHUbcCAzgYbtNvd4qXVzLZxl3zRi6Yl4WLDddnCDrlKsaWyNnFaJS
	achbBg51ZxNQ50QUqw6BXRLWhLEriJrEkkpsGb1rZx+V47/GOEPBj9jg/8XMeRNpXkQa7SFuE3fRs
	fdft/BjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FxR-0000000GWx1-2HqG;
	Tue, 05 Nov 2024 09:34:41 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FvP-0000000GW7p-3vgt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:32:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c8c50fdd9so40869625ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730799155; x=1731403955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5NJ1FycqfnpK3mvOipRZB2Wgu6vFNoR8bmZUzO4ewgA=;
        b=hxFga3O7/1h3byfgABeNZj3tV9A6DywWtFfMm1sM+G6e2IZLafnyk0+hO90NSn3pg2
         Aq02OGyTgTI1bHZnv8S3zfKvsfAugjw8aNYTrMTlyjNmv/b2QCP0OGYIsNEII9ARANM9
         vYGooAU9BffoH69TrGBProgfDbx1r43HNOtuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730799155; x=1731403955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5NJ1FycqfnpK3mvOipRZB2Wgu6vFNoR8bmZUzO4ewgA=;
        b=Z+lR1R9MAo8b1JiFNWoS+985qRxxSARj2esbDk6B5ebHKvVAP2Gw2qmYU0Ne0ra40j
         jkQLOjD5cOiqjd8h6ea+WPR7fvmOZHTTObtcq985RVhChpNHHZIF9HiF8/OTlc+s7Sen
         3/SFfuS7B8vPryj/j5KbkN8G5jQ6eBmpwuK7Iy/gD5yg7aexTDrI4nPGLwa6J10l0cn3
         wpyDiMarmsMhMjM9qXO67Cah3gR8lmQ3YUt0iKIp51ASCeZNs0vceNDjsVnshrNpGP4y
         dX+39MqlXNHHrfhBTCEjBdMYDhmFrJRhTd62nP47p+MPPwGxEeLdZoHXohn34W6cgK8M
         rZsg==
X-Forwarded-Encrypted: i=1; AJvYcCXUOlTOnmvK0/6axqU7raf9RWB48BKP8iSTOS8xeVcdNkY8UxlsoTA9LY9adGRevHZCpov28kawJb26jw+ns/6o@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk4UyNKspVNA3pICNky2HfunKrdRdc8vvC0jROof862yycSunP
	Na+7/qfptPxBdbFZe/IkxHcQN7DsvJxW4N6jwZPaDbvzNmmj371rt+WaBtrnIA==
X-Google-Smtp-Source: AGHT+IG46JeaaF/aIOCM62h2ubeubJsG0K3ZjKqXqh5YpnynpwPJdLS/uaQTv6LXqXO+Itd423FI5w==
X-Received: by 2002:a17:902:e74e:b0:20c:76a1:604b with SMTP id d9443c01a7336-211056ee4a3mr280044135ad.12.1730799154778;
        Tue, 05 Nov 2024 01:32:34 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ed8fbsm74149565ad.6.2024.11.05.01.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:32:34 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] Add device tree for MT8188-based Chromebook "Ciri"
Date: Tue,  5 Nov 2024 17:30:11 +0800
Message-ID: <20241105093222.4055774-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_013236_069952_5DFDC74E 
X-CRM114-Status: GOOD (  23.60  )
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

Hi maintainers,

This is the v2 series to introduce the device trees for Ciri, a
MT8188-based Chromebook, commercially known as the Lenovo Chromebook
Duet (11", 9).

Ciri is a detachable device based on the ChromeOS Geralt reference
design, where Geralt is the codename for the MT8188 platform. Ciri has 8
SKUs to accommodate the combinations of second-source components,
including audio codecs, speaker amplifiers, and MIPI-DSI panels.

The Geralt design is not used in any actual products, so its device tree
is not included.

The device trees are taken from the ChromeOS downstream v6.1 kernel,
ported to the mainline kernel and with cleanups. This series aims to
provide a basic device tree with the enabled components and features.
Additional support will be added in the future after validation with
the mainline kernel.

This series has been tested on top of the next-20241018 branch.

Patch 1 adds entries for Ciri in the MediaTek DT binding.
Patch 2 adds the dtsi files for Geralt and Ciri, followed by 8 dts files
for all the available Ciri SKUs at this moment.

Note that there are some known dtbs_check warnings:
- sound: Unevaluated 'mediatek,adsp' property
    >> see [1] for the fix
- amplifier: '#sound-dai-cells' does not match any of the regexes
    >> see [2] for the fix
- dp-tx: '#sound-dai-cells' does not match any of the regexes
    >> see [3] for the fix
- audio-codec: 'interrupts-extended' does not match any of the regexes
    >> see [4] for the fix
- pmic: 'compatible' is a required property; 'adc', 'mt6359codec',
  'mt6359rtc' do not match any of the regexes
    >> see [5] for the fix
- amplifier@4f: reg:0:0: 79 is greater than the maximum of 63
    >> ti,tas2781 binding specifies that ti,tas2563 register range is
       0x4c-0x4f. The DT follows what the binding literally suggests.
       I tried changing the binding locally but didn't help.

[1]:
https://lore.kernel.org/all/20241105091246.3944946-1-fshao@chromium.org/
[2]:
https://lore.kernel.org/all/20241105091513.3963102-1-fshao@chromium.org/
[3]:
https://lore.kernel.org/all/20241105090207.3892242-1-fshao@chromium.org/
[4]:
https://lore.kernel.org/all/20241105091910.3984381-1-fshao@chromium.org/
[5]:
https://lore.kernel.org/all/20241004030148.13366-2-macpaul.lin@mediatek.com/

[v1]:
https://lore.kernel.org/all/20241025110111.1321704-1-fshao@chromium.org/

Regards,
Fei

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
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   11 +
 .../dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   60 +
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   56 +
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   15 +
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   43 +
 .../dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   73 +
 .../dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   69 +
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   47 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi |  397 +++++
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 1492 +++++++++++++++++
 12 files changed, 2284 insertions(+)
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
2.47.0.277.g8800431eea-goog


