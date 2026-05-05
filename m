Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC34CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=; b=zW4DnnsF07/352oZIRfCDsKr8b
	rtLWKPOZcgToPQnctk3syLkoM3/dgofNAy84WqHF0+oa5DrZi34L9IkoV/L7rZIVV8e9KgweAtE/5
	HSz3OMKXDQP8TeAwQ4mdA0EPf5TgWPCgXOd94KqMqcNrRufKxq2HGkyVUTv12kmHFPALe6OCdif6K
	u1IOkCbLufeTtsCJF8dAlKM558BKRZWE5qupu4w5USRfB5z52czUjA3gMPIP+ajRsxrLtv4Pp6U/6
	CnuHQWWPxfeuZXEni3XgSsPRxKiprtue3uvL4TIZ5NxoOTEVqTXo88vHOk4YkvMnLz/mO22FNlBms
	4ogDhRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnG-0000000FqeY-1BYH;
	Tue, 05 May 2026 10:14:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnD-0000000FqdW-2ZUi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:21 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-835386ff122so2251701b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976058; x=1778580858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=E6ErJeQvXTXzy4m8ugPqNbyW8WatYuVKFqE/BYDp59c75fusMfQfF5KJFu8/JHc6Ig
         Ob0GDsUzbcH02kq1W1AEz35pqwV5PzbgSezQbQ20UITR17T5GNUkXzXcWCRn2U4H+HtV
         p4VKz06SHDy6kPJnM3RsU+VAnxBQmWVec/mSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976058; x=1778580858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ytUABekc5RrdYiXa04ZEShkxwLJERJBYHoA0rFWO/Y=;
        b=l069TgG7YOX41cKMfSQlwPcuuOo8h9UOYaaZi5kKw+83GVNsEl2QnjiO790hU1C4Sk
         HO5hPVdNyqwxuuTb3Hvz0UoU+AmV5qXIvIXI4Qeh949jkbdZkz9GuVkBnSRdpZQ4JBgy
         CFxqSIbiAe9fwoV73uJuspeUt7cYq4R9QDyFxiaQyfy6XKwEKShdVHj7/gAPms4vwYfy
         xXQE/7eDg3HhB0LvwKnfAeymxg2PnwAbd7tBYoh2sT6BKRyXXGseoCuAl3+vxNORyni/
         8XHH8zIzXoi7HDWC7A6qDv0frOdhf0hlHvmgHOg06ks6uZ4jivjWTQC0vt+DY2DQ/P14
         pzBA==
X-Forwarded-Encrypted: i=1; AFNElJ/PjQFWeigWlu2odNbS6pgG33X6JH+NgLMZ98Dt/TsP0aKX+y1cAn3060oUakqU7OSXKKdepyZoBsCi6Bbd3kfd@lists.infradead.org
X-Gm-Message-State: AOJu0YwhUitqU9DzB3thLhCKbVSATTCt4Pe4h0BPrF1KpR0y8LfC/gGk
	HX2G01gcPlfbbZoa3VwdNxu2NZHvbbHzl4vR8J6BI+nrZPs4iVAbp7oFUb5S0L153Q==
X-Gm-Gg: AeBDiesO9B0zVY/nQ/r2qSv+tF6cvy83Q+wLnDbVltzNkIivIs4TqkB0Kt6o0tCq/10
	EeBnqTeaZEuZBy/qXX+LwJuHL7BHfDWF7oHCqam56JT0HHPogNql4oX5ENWWRVm2l+VXzkEKjdf
	FLP6A+n4jPNGL32o4n3+eUafztK8TlyCaoltcJu3vb88bvCVl2i147tkvOMMUKDFHXFsTY6Cp2f
	DsHMbCO0rRh6G1B5/obsjGnMoIvkqdPvoYEiVQn72y/TQpD3S4068YDRrl1e6nk/96/ub1dA91t
	e/dHRKNg+DfEQTlAfZ+pNWpqpH5fVvHH5T3xSdLqxZnGqBXh8FlGAxNLoKud1xR8Z2jrElUbJv0
	oo8zthbQX2BaqobbMmVZaGmTmRI9wpFzDkLXW3GnNHc1FFi5Ka5hrD4c3GRN8mIqqHWYXjpd0wE
	cqacyJD/dhN8KbzuA9KjUJ63KckdcXdddhbbuWI/WTAZxVMIs2RPrX+3zbHbu0qxaWYmGTbSoZr
	wWAkPefKhihuvt0taE=
X-Received: by 2002:a05:6a00:4b10:b0:82c:247b:ffdc with SMTP id d2e1a72fcca58-83923e9857cmr2413115b3a.29.1777976058038;
        Tue, 05 May 2026 03:14:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:14 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/16] arm64: dts: mediatek: Regulator cleanup for Chromebooks
Date: Tue,  5 May 2026 18:13:50 +0800
Message-ID: <20260505101408.1796563-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031419_718599_CF2688F2 
X-CRM114-Status: GOOD (  15.77  )
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

This is v2 of my MediaTek Chromebook regulator cleanup series.

Changes since v1:
- Switch to properly named vcn33_[12] regulator nodes for MT6359, and
  converted existing users
- Moved PMIC regulator supply properties to PMIC top-level node
- Dropped "mt6359: Add label for regulator sub-node"
- Added all supplies for MT6315, even for unused regulator outputs
- Added missing peripheral supplies on MT8195 Cherry
- Added missing supplies for ChromeOS EC regulators on MT8195 Cherry
- Fixed pp_4200_g regulator name
- Link to v1: 
  https://lore.kernel.org/all/20260320084351.2461060-1-wenst@chromium.org/

This series contains the device tree bits for the collection of regulator
related cleanups for MediaTek Chromebooks. The device tree binding and
driver changes are:

MT6315
- https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
  (merged)
MT6359
- https://lore.kernel.org/all/20260429074113.3720271-1-wenst@chromium.org/
cros-ec-regulator
- https://lore.kernel.org/all/20260320083135.2455444-1-wenst@chromium.org/
  (merged)

The goal is to complete the regulator tree so that there are no orphan
regulators, and there are no devices that are missing supplies.

Patch 1, 4 and 10 add supplies for the MT6315 PMIC in various Chromebook
designs.

Patch 2 converts the vcn33_[12]_(wifi|bt) regulator nodes to vcn33_[12].

Patch 3, 9, and 15 add supplies for the MT6359 PMIC in various
Chromebook designs.

Patch 5 and 11 add supplies for the ChromeOS EC controlled regulators.

Patch 6 and 16 add power supplies for the CPU cores.

Patch 7 and 13 add power supplies for the SPI NOR flash chips.

Patch 8 and 12 fix up load switch descriptions.

Patch 14 adds missing supplies for the USB controllers on the Cherry
design.

Obviously the 3 dependency series need to be merged before this series,
or we will get a bunch of new DT validation errors.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (16):
  arm64: dts: mediatek: mt8186-corsola-voltorb: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12]
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
  arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
  arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
  arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
  arm64: dts: mediatek: mt8195-cherry: Add supply for SPI NOR flash
  arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI
    controllers
  arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8188-geralt: Add little core CPU power
    supplies

 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 +-----
 .../dts/mediatek/mt8186-corsola-voltorb.dtsi  |  4 +
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 41 ++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 74 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 50 +++++++++++--
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 +-
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 +-
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 +-
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 +-
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 11 files changed, 178 insertions(+), 37 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


