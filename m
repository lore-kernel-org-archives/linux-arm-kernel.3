Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A3DE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 05:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=; b=w4In904OCBQNe+4JGZCS2XYZ1u
	E8jiPNpVM6zBjuXY1Z7+S56WTcGRaklU0zonN7a1KUn2lLQOM5vUFp0Vcp6asEPWGHiJMyJnocg09
	5h3mmsgXKCsgy6UsG1ZKgOv1QI8JIYvx4SNYAKeYhb1HzTHTw8W4BMdIBWFKhl0eZc366e29wakgU
	LozNSOGA+efufnUj28T/aKxd8Wx5saBRDdRRq2b1lRgwNWMl4YPGDM1gi7D0ajPOSiqoB2cWpJlSJ
	4rlKzpSLwisnzQE3aM8LkPxPkwyQof7xncsjDmo5IXFbolxvLcnfoN6guDgfEXXikphJD2j3pvyS+
	1/oidSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFED-0000000DpMT-47Jt;
	Wed, 11 Dec 2024 05:25:41 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFD9-0000000Dp2D-3XEi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:37 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-728e729562fso1044107b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 21:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894674; x=1734499474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=;
        b=eJj2vQJQcvU42OIYXx/iJLbuK5PCD7SS0dwzqRkr6znmgbXsGp5P0VS/aruGO5jlzF
         Fve6mWrLeMSXrZxCcKqoNvVtrcxovSasXf8C3fgrPBa6YZuHavu6ypIRriOhyniCSBV6
         ZKLAabx6JAOShkq58jBs7EMa0tddnQKT62rQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894674; x=1734499474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9rNAO84080ar9QYUBnFcj+nugyjxelBE79eeObQSfkg=;
        b=dWiETgjHZ9JHUwWwS8ynCI5xSZuzW8DVYYwAn/87Dz4VglciakLSaYXEuNn6ZxXvNy
         G2o7W1MGv8MOOQ4jyMUs6kxBJ/1HH11w1Lm/GVtinB5+fMo5sw7ugCNFSTblQCQ4JRc9
         X25UStPfZyvmBCuEo13bZpUav+itp4RWmho9b8r21r1CEaJ8Cx8v0IL1NuRGuygqZEX5
         7CS137EfoA+/riu+Yafsvum57+xoUkeZqqRPplwsw6K5YpyxAXExcJpN4ARwmbGW/ncG
         P1tSQXdbXjQ+wTQUAVmCJcChJJOucKTzt/XaIRFVHaT+YCyrvjl2nVIxPXV7gQ/CjHCn
         RdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6bwv33BBFdtnTZ3MWunbvkFdNknI0vnz15qZwYHq/OPSczGCDcVNjayxZ1uzyfCNKIEYLOCxdrA07GFu5aIgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0bpHEr8f9zxdAyQ1Isl4IDT3IzfSdzUq6dradEPdTunGIpBac
	Yu61N7cOn7Td/V9DX2ehpAWe2vD+mEtp52QRR35110BZF9kRHqjJR2W6mW5XlqySalDeXqBpBLA
	=
X-Gm-Gg: ASbGncu5oHeXnFID3nc/ZyEMSDD7NTCJn/T+TqNaAOYzHPr28ApjGiTJVpvVZCJ6mWJ
	FzwTnKAqXv6eDT424hDVuCwudfeZrxQo6V4jpmQy0bskB/nX/0Lohi2yz9rs0K7Js/i/w62nmaK
	4LqV+Qxhp9ZPNKa0M9mjgNh5TDXO3IuxprvYtJTfwm4+7hvyyp42fEkAuShpPR/TayvCFdJdREc
	ZlTcwtrmWlopeugceQZ6ZYSXhWd0mIkSotdYGuX5odL8sqDCOl5sBxu6qyUeoYkdoUHRMdA
X-Google-Smtp-Source: AGHT+IGRXZyCR9vBPnWrRkfxCl9FFb1KFJmcBVsUf9/kW06iS0cwlLUslN7QIGTATGDeY32DTij/Zg==
X-Received: by 2002:a05:6a00:1915:b0:728:e969:d4b7 with SMTP id d2e1a72fcca58-728ed3e8533mr2451508b3a.12.1733894674483;
        Tue, 10 Dec 2024 21:24:34 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] arm64: dts: mediatek: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:18 +0800
Message-ID: <20241211052427.4178367-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212435_910027_95A10488 
X-CRM114-Status: GOOD (  10.77  )
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

Hi folks,

This series drops usage of the long deprecated "regulator-compatible"
property from MediaTek device tree files. The property was introduced
in 2012, and then subsequently deprecated after two months. It was
never carried over during the binding YAML conversion.

Drop the property from the MT6315 regulator binding, and all MediaTek
device tree files. IMO it should never have been used to begin with.
This also gets rid of any validation errors [1] related to them.

Please have a look.


Thanks
ChenYu

[1] https://lore.kernel.org/all/173386568696.497617.3727087837255802552.robh@kernel.org/

Chen-Yu Tsai (8):
  regulator: dt-bindings: mt6315: Drop regulator-compatible property
  arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
  arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
  arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
  arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible
    property
  arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible
    property

 .../bindings/regulator/mt6315-regulator.yaml  |  6 -----
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 23 -------------------
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   | 23 -------------------
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  3 ---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  2 --
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  9 --------
 .../dts/mediatek/mt8395-genio-1200-evk.dts    |  2 --
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 --
 8 files changed, 70 deletions(-)

-- 
2.47.0.338.g60cca15819-goog


