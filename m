Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83622D3B7E8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 07:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NyQDsChLDL6jT72ChDthaQRy9RBzZNMPITBE61ZJLnQ=; b=YMyuu4PZZXSUPxY00vwDqNrVJD
	Empxf4MqYn4TZVA2xOyrfRsf8f3OpK5ND/mWompnWXT8gWjTzZewnGIlgivTerrV4qT08UvZG6uHp
	kT+s16S97u+Joxc0H+ZMqPEBNUkYciMgHD/VaA5f9Bh5aZdv7esGXRJevhUC35e1kE4a+NhZITUxC
	4rYRkDBOY3lCqFmi3gv3dy7q3jZgWZImRZcb632MasiGgKcG6C+c4myq2QEppvSGkbTHW2WFNVyCQ
	v+IVitFUtJi+1SAGasTjVhHX+UxwoaeTg5hL60iIZVJFCOYMe1vkbcU41qecmSz0dDexUQ+esAEOA
	k0wAdUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkL-0000000ClRl-2QPw;
	Mon, 08 Dec 2025 07:33:25 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSVkI-0000000ClQS-1W4W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 07:33:23 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso6641834b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Dec 2025 23:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765179201; x=1765784001; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NyQDsChLDL6jT72ChDthaQRy9RBzZNMPITBE61ZJLnQ=;
        b=Z7O+1M7WuzEwZCtZLsqwG8bVkUNQbW5WDjP7oXsUnIdmTf55/QPK4dHc5qUhuLhoJ+
         V7Tvb07Ss663CkkE+4YuGGqk1gdXUJTdjjRg5b6KKjut5yYJC6c8agqYhNIJ/9JgMHqf
         OtXko6a19DRWqe3mIBNIsATw2/iIwTvH1DIOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179201; x=1765784001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NyQDsChLDL6jT72ChDthaQRy9RBzZNMPITBE61ZJLnQ=;
        b=NK4MKma73s8pKqtSYIwmO48md//amZlv8WixYmi5A72iWtuE2taGVV5c/tVI2B89dG
         ZMQt5sbXCdRIpfnYT7qgGbG/gF4/ywff3OzKe1yUegaNb7pDucicfcgh3jpNT5mVwTi2
         nAzuUrjT3zNRPO5a7QryE05OPcwCyinZ2UUH66FnMeiiWknZlSwec3FIpjxLFAVWUesB
         m+7w2Mg9R1vxFt0cVMzIZ26mr6IVTiGDOWpZzEJrvjZ0TFboIV3+fKtaixV1PRm3PcI8
         vwAYy8FW2kfXvEu/XvhZtGgryYUoR5DMeKUeUfBF2HWKLCx2+8ciUxvHSEajFSWL1AY9
         e7qw==
X-Forwarded-Encrypted: i=1; AJvYcCXJieWxxS7Hm4IlC9smM53h9t9TLSWEc/QnCknwShMaivCLCHGZgYsxqDtuzHpDcn6rvfOGqYSKGamk4SUH6sO9@lists.infradead.org
X-Gm-Message-State: AOJu0YwUup5HQ8krApHgVyo8AxH2ogV8JQtePNPscKiyMsohYrFFuyMM
	yKlXpeQYcigOG8qBH23cDU9ShBrFZP5HmV8qluTTMzX2tzOgktuUtPjZfMfNzowU+A==
X-Gm-Gg: ASbGncuHg6iO39jJsaia8CyBQl20BU+W1CY1Un/YpztNL3ut1gwx+1EABBHRfcAtmxT
	R3K08RPPqPMdKY08rPgkps299GFMXxtCqePmAZlW1huC+u/g02T6ic7xKar0ru89m3P1e7NRnFX
	EevKEcz2Xmd5zPmwJKa5zyQPuf+hAXQzjnRvW0hqAoMMDDyOLMEV+x0lBWvLgCmsOVSqTMVDMct
	LNPr0d3exnKJbW5L7G5IMfZHbuGbg6iPlwKH3kNlUmPraeXiv6sRe8EjpozQxfQSnGjFzdPcUe6
	Y9kFjAJ7pgTA6I3a/axpCbxJWzCvA5khUhoDdU5znKrTRy6kJ6Ag+hVJq3nczBOGRqS1ZqgyLqD
	rU6lSIh8wkXK86fVO3CoEgyxgb1YysGSbtnjJbeNHzS2/QywQxtiiY4zbcbDDJ0DmursPNyF3TQ
	NgwVJ8Sg5odMSacrxh5JaExFG1TXZwLzKMSCYn/IDMSkrc/TSTQ+3x0d7B4J4pHv+YxJYrGzLsD
	3XvI6s=
X-Google-Smtp-Source: AGHT+IEpE++3dA75IMHMKAaS3JdE4z7HPqUzGxOP5Ceo/1TnC8Mz6fZ5YZ3Fa1JU2YjE0X3fF2tBDw==
X-Received: by 2002:a05:6a00:ac9:b0:7e8:450c:6193 with SMTP id d2e1a72fcca58-7e8c6daaf97mr6721158b3a.42.1765179200901;
        Sun, 07 Dec 2025 23:33:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:d31e:c84f:5cc1:d554])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29ff6b56esm12127686b3a.20.2025.12.07.23.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 23:33:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] arm64: dts: mediatek: Split Ciri into overlays
Date: Mon,  8 Dec 2025 15:33:01 +0800
Message-ID: <20251208073306.75279-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251207_233322_468664_81631A9E 
X-CRM114-Status: GOOD (  15.18  )
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

This series intends to serve as an example on how we could reorganize
the Chromebook device trees into a common design base DTB and split-out
DTBOs for component options. There will be no SKU-specific DTBO that
handles changing the top level compatible and "model" properties. If
these are important or needed in place of the generic board strings,
the bootloader could be made to insert the correct ones.

A separate YAML file is created to keep a mapping between the composite
DTB and SKU-specific top level compatible strings. These are needed to
build a FIT image that the bootloader can then match the correct DTB
with its own known compatible strings.

I expect the last patch, which drops the SKU specifities and adds the
YAML file to be quite contentious. However I think it would greatly
reduce the number of source files we have to manage, given we have
or will have dozens of SKUs for some models.

This is related to my "Device Tree Metadata: How Bootloaders Pick DTBs
and Apply Overlays" talk at the Device Tree MC at Plumbers [1].


Thanks
ChenYu

[1] https://lpc.events/event/19/contributions/2025/ 

Chen-Yu Tsai (3):
  dt-bindings: arm: mediatek: Add generic Ciri "base" board
  arm64: dts: mt8188-ciri: Split into base and overlays based on
    components
  [EXAMPLE] arm64: dts: mediatek: ciri: Drop SKU-specific overlays

 .../devicetree/bindings/arm/mediatek.yaml     |  4 +
 arch/arm64/boot/dts/mediatek/Makefile         | 26 ++++++
 ...88-geralt-ciri-audio-max98390-es8326.dtso} | 40 ++++++---
 ...88-geralt-ciri-audio-max98390-rt5682s.dtso | 81 +++++++++++++++++++
 ...188-geralt-ciri-audio-tas2563-es8326.dtso} | 18 ++---
 ...88-geralt-ciri-audio-tas2563-rt5682s.dtso} | 46 +++++------
 .../mt8188-geralt-ciri-panel-boe.dtso         | 10 +++
 .../mt8188-geralt-ciri-panel-ivo.dtso         | 10 +++
 .../dts/mediatek/mt8188-geralt-ciri-sku0.dts  | 32 --------
 .../dts/mediatek/mt8188-geralt-ciri-sku2.dts  | 59 --------------
 .../dts/mediatek/mt8188-geralt-ciri-sku3.dts  | 32 --------
 .../dts/mediatek/mt8188-geralt-ciri-sku4.dts  | 48 -----------
 .../dts/mediatek/mt8188-geralt-ciri-sku7.dts  | 48 -----------
 ...eralt-ciri.dtsi => mt8188-geralt-ciri.dts} | 54 ++-----------
 arch/arm64/boot/dts/mediatek/mt8188.yaml      | 51 ++++++++++++
 15 files changed, 244 insertions(+), 315 deletions(-)
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku1.dts => mt8188-geralt-ciri-audio-max98390-es8326.dtso} (59%)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-audio-max98390-rt5682s.dtso
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku5.dts => mt8188-geralt-ciri-audio-tas2563-es8326.dtso} (78%)
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri-sku6.dts => mt8188-geralt-ciri-audio-tas2563-rt5682s.dtso} (52%)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-boe.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-panel-ivo.dtso
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
 rename arch/arm64/boot/dts/mediatek/{mt8188-geralt-ciri.dtsi => mt8188-geralt-ciri.dts} (81%)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188.yaml

-- 
2.52.0.223.gf5cc29aaa4-goog


