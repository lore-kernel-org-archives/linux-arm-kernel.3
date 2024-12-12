Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE0BE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 06:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=; b=DH3OQkfmG/kl50xXxGqm7FR+jy
	8LDjG1HxIu2Cd4pV2aTmfbrRz9c4W34EM0/amkon8LUAZ2bk5DCngcEaB4xtmgqTbdluFc+B/mHDa
	ghM3p71E9mrCVNe37Rj1Lajx6+YpXxus+Xdy7aZtyWBpMb0FlrikwxyXNdSb00ap9RE8bXGjz4khS
	NvEeTVCTHWutUzqe6hSCD+72vBoQEyeZUGXWEaX63AaE8MLGIA0J1b+wHRxeBgV/b0prerbzDthtG
	FZM+/eyFwQ4kZZZg/8ad2DfxANdCL5UT0wgctVABA35QqkCsPSazM7t7eXK7L5O69ekfj9GCjkwY1
	QoOhRS1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcaH-0000000H1lB-04Ss;
	Thu, 12 Dec 2024 06:22:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLcZC-0000000H1Vt-3XUb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 06:20:56 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2161d4b820bso417865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 22:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733984453; x=1734589253; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=;
        b=ejPxaq1jfWzIaBFtAs5fx8kjwOWsyDErKJc6ZwMF3y8/lKrqaWYK/RaiBTIIl+pQia
         jVfmGGKarovEDpbm0PIVIkrtvHT7+6K4MVVolbQGpxxaoSwf59aPov8uSiBNZ1TYgsBE
         fJbZoESIqGfXN0v1qIgynYrbwKWtP9eOxqHkhfIZ0IXKnDPQqCkRHzlC9D/pd58vlVvT
         KkEWQwkGrW9ffbW9RiTQ6hLYA4A2z16PNOe2jEh2wIihe57GvcD34cxP7mYMM1K5uoio
         w0+39kmoDG4A7LFSFF6TvPecveopz6gRICRSc9ZHLwEm3+JAaWxzSZ43EgfBWo6bzR2o
         icng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984453; x=1734589253;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sOU/zN1rnDAJHK7mSCpddQhh7N81+Tto3qj5XwbKbU=;
        b=cEleYZCOTfwbtebej/DAwHRZCCXuJsA97ZzOBlAf3bar2XXqAH8mM3bArfhGUaKpWg
         +8CJxjWWy24fn0RP4W4lwSJwg8ht5JDzEtyN3V3PRN/znP5dyTdwH6PSz0+QoVkd8aR5
         1GSiYEP9ZwU7EIGGSWgsUFZ3bk3riRiqZGkCr6Xy/LLqfGLJHmwquZ33huLPiPN/pP5S
         +L3NQtACRdpfEjUEck6uzNnkuTsJd54Z+fNlfVnOjfRDHCE6IyJIgaKnvm/amnlHdj6q
         z46H7JDRYitLoVRuLs8D8TB6DY5qCP2DCg0UF1quQkHrfDAwfFs6fjE1vO2bF+vH/xvJ
         /vgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4wUgu75k/B/FmDeMOHN5Y4bnHbdce8j2jOUVUQmcpUpZCMSirU4egaBjbhZao+zo27RVxlv3SIhhJvCvhIHLx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg4PAmAO8av1XxJ2lbELmFDg+MiiNh5HwULhln+U9JEEoDdOQo
	3aDspr9F30Db/4e+3bO6xydGTIth6RVKWfE/IL8ZP29WSn08lXBb25hPwcfcrNw=
X-Gm-Gg: ASbGncvNMPwOIiomiKGP5hF4UeS07S8JGkydyGfv/BPsyloB17ivp/EfOkzk6AEGYw0
	5OvB5DGmhW9C15c5WqVZ9pgFlcrT4m++pwxf89TCeLUclNoRF+jIcWkv+X4B10TgBvfxcxIvYbF
	oe/NwcA1bpyWmph36GIpaYgS1WZRrNvADfoT4sdI2LSBJw5HTG3eTnOOaHvneoclWH3zsyszp8D
	AxiRjeA2e4Krvmublt4qrQjSO0XOGtlM9mPpIleycMwNSD/WgdnxZdU6qKWJBXEEShf9v0FDqW0
	z4M3ZN18XP4mbCOPVSVV
X-Google-Smtp-Source: AGHT+IHLQqfTE6S33rXaKex6v5/nL8RuEZqh0jZ1l97VEOxPKBfxg+FVj8Clw/rAjJE+bNggu1IJ0w==
X-Received: by 2002:a17:902:dacb:b0:216:6590:d477 with SMTP id d9443c01a7336-21778397962mr36786945ad.2.1733984453430;
        Wed, 11 Dec 2024 22:20:53 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2162c278668sm83579165ad.81.2024.12.11.22.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:20:53 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
Date: Thu, 12 Dec 2024 14:20:42 +0800
Message-Id: <20241212062046.22509-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_222055_140141_DC78752E 
X-CRM114-Status: GOOD (  13.15  )
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

This is v5 of the MT8186 Chromebook device tree series to support
MT8186 chinchou platform. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Changes in v5:
- move sku17 here to keep alphabetical order.
- do not use the MTK_DRIVE_xxx definitions.
- Modify exton to extcon
- Link to v4: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v4:
- modify 'rt1019p_pins_default' to 'speaker_codec_pins_default'
- Move usbc_extcon out of typec
- Link to v3: https://patchwork.kernel.org/project/linux-arm-kernel/cover/20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-codec
- Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v2:
- Modify location of "const: google,chinchou-sku17" in mediatek.yaml
- rename "pin-report" to "pin-report-pins"
- add "vcc33-supply" and "vcc33-supply" 
- rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
- modify subnode of sound 
- Link to v1: https://lore.kernel.org/all/172900161180.733089.8963543745385219831.robh@kernel.org/


Zhengqiao Xia (4):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add extcon node for DP bridge
  arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
 7 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


