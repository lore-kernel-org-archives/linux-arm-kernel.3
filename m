Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9DFC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 08:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=; b=mankYg3OeWktJclVzGdKpiBH5p
	Nj1Cf/IqG+dxZswq3rLin28F/rtr4YyFTEa6ZRxD85xMwzQqvrXehwhR80YtVp6CqCblrKP4adBDH
	2X4kw30ch4Byr7TrJmyhMo74OeIiIfe4dZiGPmMQK1+Ur4ruuacnejy6a7S7fZjbZlS/+EfLubeED
	VonOPvixs3Q0jmDS7M4dJSF+zyGt6BAMHZkqiijNsNJPrUfY39HL037xA2VL0L1m5HV9O3YpJKqWN
	nHrxSMSd9VnCOlsdQVbHKd2ChzbdQuevDEc2A57kFmsWVMK9TUg0Y/nEJiCnN+wJGuoJo7pQGodm8
	sWmap9TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRf4-00000006bAo-0kfU;
	Tue, 17 Jun 2025 08:27:18 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYA-00000006Ztw-1IcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:11 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-311bd8ce7e4so4470647a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148409; x=1750753209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=VlfXOd1h/EeiNl2ZDig+lW5cQDJqVW2b36B3gZovof5455MqMm9fGeU0HiGsixOnU6
         RS2VZHyWavVTZT0s8xvnZy21nSU+K6HaDg9zFf2yUXyDGbnSoPnkjOLDDBc/jU7UAEKo
         d4Dp7QbZ1t6t0y5winE9/VhT5VIH/DrsYsDVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148409; x=1750753209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fCgu0WUEcOwg7fCAIzSjiLXxg/4EglOh3d2upcp8Yto=;
        b=QYnLoHey07RzCXp9aFB+YbxSTWo/zPeOhRCEcpMYu+zCl0APCAaqG9cSpr/dr0tZKE
         JMSGjBV8arDVslCcoMm1AP7x/yXSOhdEFoOEOmKPwT8tc+KispTDRO5sVUdTzFCrKWv1
         OkxtZ9pPeBi2GGA4aRgA14bMnV/rz+YoRzNOpX5tKd4QLKP6uKOj5hZP2NLaqpJrlBnS
         JOpAEW+10D48uKRYX1XBdN7eO7cV+LT1nUXHtnb3akULJs+THbaYdGTQjfjIpaqHLuPX
         ellUKzbrXuMDva5/xQr344eKBHvrBU+9KYnaCF5Pnm43WASNDATaa64z8ukhansaNBM+
         570g==
X-Forwarded-Encrypted: i=1; AJvYcCVLC9rs2DLMaFZPkrwJTzZLMQm/E0OMtNzqQ7RODO8EiFwO5SNOOpyadloSRThU33vurB6O5lCB0Z+roacE7sx4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2JJGtst1cAzH/H4O1LUD1MmiMIxET2/YRhONtu1OFBw2eGvoB
	k9698Rkibp48KVojiVn7x/tW41OhwX/2bjSY5JfXIU6mWifOw+ZorXJxs75q2NPqKQ==
X-Gm-Gg: ASbGncv4s99DbxRUh9jxFu77eLhVAtfZhfUyUd7nUsPtOSQqk7sRIwIHTW56NtHPiPP
	lCQbj2mlyVqOe65u4jvIRXygCCeCJHTAl5uNdiztUf++2lwUwVPQVq7xdSd1F7ZFcaJze8F/yW3
	0tSYN8cp+hsz28vGqPBkC1pfvnAkgjaRsOTTA2skaxt75cyA5fVlglyytcITKTpeHNe/s2Sb0Iy
	NKTYDZrfImtP1N6XUkZ+vxLHuGPXeTw0lOZFmZ6ANSMs0ou9o1u293JVxEbXWp3K3Ac3b5Pm94K
	mli8XfrjJ6u30QF4E6t8WmYGcSMIEzYrPa4COwi166VQNHJT92HCFY3v3r5Ur3cOZ5T0A9SPK3w
	XBmXi
X-Google-Smtp-Source: AGHT+IGD8SOS4o5xDhrfWM54iSlJEPR1fjzyAoug43lUG4UEBLvt1iAqZCg4HuIsK4C60TSEQU1JaQ==
X-Received: by 2002:a17:90b:5847:b0:312:1dc9:9f67 with SMTP id 98e67ed59e1d1-313f1c7c54amr19445589a91.2.1750148409049;
        Tue, 17 Jun 2025 01:20:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:08 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 0/6] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Tue, 17 Jun 2025 16:19:57 +0800
Message-ID: <20250617082004.1653492-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_012010_375650_8E120136 
X-CRM114-Status: GOOD (  17.35  )
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

Hi everyone,

This is v3 of my "component probe for Corsola devices" series.

Changes since v2:
- Rebased onto next-20250616
- Collected reviewed-by tags
- Dropped driver changes that are already in v6.16-rc1

Changes since v1:
- Reworded commit message for Elan I2C-HID binding change
- Dropped I2C address constraint from Elan I2C-HID binding completely
- Dropped enum from new compatible string entry in Elan I2C-HID binding
- Picked up Rob's ack on two binding changes
- Rebased onto next-20250417, resolving conflicts with "spherion
  component prober" changes
- Link to v1:
  https://lore.kernel.org/all/20250312104344.3084425-1-wenst@chromium.org/

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new entry for the Squirtle device to the bindings.

Patch 2 fixes up the existing device trees for the component prober to
be active.

Patch 3 merges the device trees for the Voltorb device.

Patch 4 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 5 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 6 enables the prober to probe touchscreens on Squirtle.


Everything has been reviewed. Dmitry, please give an Ack so we can merge
everything through the soc tree.


Thanks
ChenYu

Chen-Yu Tsai (6):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  12 +-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 10 files changed, 138 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.50.0.rc2.692.g299adb8693-goog


