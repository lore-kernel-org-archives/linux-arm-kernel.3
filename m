Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFF6D0C5FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 10:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=; b=HwOJ67aTUvwo9hFi0/b0Me+vwX
	7W+GbkOTZvrje8pUrBR7ffe0gr6hQH0Sd/3OGBdyB7i9RvyqOIaARzTmrpjghD9TOhIMSAm+LxnYs
	jEeiCIIgSG8YmG2CwetpOyrRk9KoEMd30lP/EXRae+bRnZgy3oji6chVHbf7EXGYfW139SkC4lF08
	hu8p968Q4tJ0IgU+rxOUTFFoyYGWoaXfGqNDZA4GWifZLBM/kq9Y67lCCvoCdksFyAqvgArNIpQrI
	P0xgBjCAlQ2mfoMIV/eBu8hg3b2n0XcoHO01mRy/0w4SV/3mYpOsYmty1ospJFspzfSVM/fKeR5f2
	M7pz5cTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HzZ-00000003Qqz-1UB3;
	Fri, 25 Oct 2024 10:56:29 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4HpP-00000003Ojc-3vJu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:46:01 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7163489149eso1309595a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 03:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729853159; x=1730457959; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=hWP4fZABZPMnngcd4oC36gkXj4W8G5EwX7nqfwrsTVSYFAKj96HHUkpt5J/CB2egUh
         T4YszFnGvzpvYMhIUGsT+o5nGGd6U+Ma+Xe5PTJEsIKQOmG+CUJ+qjJI4DSfTEINgrB3
         9bgr4crOCbOWetndJXG5WJKpiDZaHG0ynjPt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729853159; x=1730457959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qYdMoYNHEEjU8R4jRwxYNDvg+V+aPZxty5Pm7LhAwc=;
        b=TFoopmEtvLCZonmXhx4yvduMF1+ZnXA/WMwZi2ln9uSS6qotsQHON8Yb0reoznvaer
         RoNA51AdwsrbHXau7InBoWUOPkiP6lHislvyrVMcdtmAS/RkwmPcJs26sQBqZv19JxjD
         6A1gk0KZAr37Q1U+i/xQKveIKc8Q92y2chbthEPlL9qt1VstSAd2Cq0xlTL7FxNddWot
         uHyd/J2dA8sD1L3OGtCalVJlds1Zou4g8dTd2ea7ie2E4urreSegjfpLt4J6a0A8MN7X
         46yOzl9fPwKz9hY7o3+K6rsngVLV6egohaaKlb5ql203Xni2AUROpjNV9wEr7SAVp8xJ
         dY8w==
X-Forwarded-Encrypted: i=1; AJvYcCW5QDSPF64O87hVesWOg5BB4yHN0BvfUnnSF+uPwSiGgB9+e5dni2HMx0/8CXmn7pWnKxyUybCO76HwHTAVBBdA@lists.infradead.org
X-Gm-Message-State: AOJu0YzIb96ehBPar2gL4HJjlk2oQWgOvTLK9oVQKdtNLWz0K0f0hRy/
	XOmrdnT6x3b1fxXrmmwIr303IX88qFvurGJGuCH2iflmZ3/qqJAhsahJbvcqzgFQAh0XAAwdS1s
	=
X-Google-Smtp-Source: AGHT+IE/jF3qeEh2sSM6HPYBIUpFWAzndUsngpMsqXOHaVXBbGKPEsKfMjMtDshVaZr1AnM6b0wOrw==
X-Received: by 2002:a05:6a21:31c8:b0:1d8:b962:6087 with SMTP id adf61e73a8af0-1d978ad70efmr11190210637.10.1729853158931;
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d089sm829548b3a.99.2024.10.25.03.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 03:45:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Steve Lee <steves.lee@maximintegrated.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 0/4] Update properties in two ASoC DT bindings
Date: Fri, 25 Oct 2024 18:44:40 +0800
Message-ID: <20241025104548.1220076-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_034600_001706_B9FF1A5D 
X-CRM114-Status: GOOD (  12.03  )
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

This series includes four patches to update two ASoC DT bindings. The
goal is to fix dtbs_check warnings found with DAI links and audio
routing configuration on some MediaTek SoCs (MT8195 and MT8188).

This series doesn't introduce new properties - all are either commonly
described in existing bindings or are available but undocumented.

Patches 1 and 2 focus on mediatek,mt8188-mt6359.yaml, adding two
vendor-specific properties and updating the DAI link pattern to be more
generic.

Patches 3 and 4 focus on maxim,max98390.yaml, referencing
dai-common.yaml and documenting a hidden vendor-specific property.

Regards,
Fei


Fei Shao (4):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Add adsp and dai-link
    properties
  ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI link node
    pattern
  ASoC: dt-bindings: maxim,max98390: Refernce common DAI properties
  ASoC: dt-bindings: maxim,max98390: Document maxim,dsm_param_name
    property

 .../devicetree/bindings/sound/maxim,max98390.yaml  |  9 ++++++++-
 .../bindings/sound/mediatek,mt8188-mt6359.yaml     | 14 ++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


