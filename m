Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A39B8C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 10:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=; b=czPGqYSCTz3t4RwlbkO7HAiyTu
	ikcyY8xVWvRZEhP1ftLUaijHvddAkwB2t4/5o+hQnFJHkfqfURI0Aao9nE2czondajpm5SP1EWzYm
	XDOD1BpboKS849Msw8UiQf2y4HPHb7evQEmVsg6BVZSOAp7RWiM+SsZApzZ0TOMVtfV23vpB6oEXy
	EbtEns3mHP0al2oX7mXk947F458qHFlwshN46giMPssfuTo7naR6L4sWnGlOVWyZkjKMGKq3qttxL
	ji5vEMB8C1GBLhWimgGJtitlRndM0c6sa9mFJePKRV0t/hu7BabhEMnqo3eSVgqAfRYmYuk3und6w
	AbVArtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJmi-00000008BrU-1GMq;
	Wed, 12 Mar 2025 10:58:00 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJZ4-000000088eV-1R1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 10:43:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2ff80290e44so11127439a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741776232; x=1742381032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=K98Oh5/gRl8ULQTaW24uJVmQrRB++pe7Z0cnl1CxUnJzMtRLVBU8eyEeji5sW/OKyR
         CqgRbZCeRR2QwI8imWKSH8Fuf5mSwoTi6T34NEXAnwPrrSoyxU5LKKLoOrcGujODk4qM
         7b928RE0WtP81/eUV0CGff33YuMPkfTiaEW8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741776232; x=1742381032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L51FLDBP/NVINxb14cO3l0go6Z1l639IzpDfowui3bI=;
        b=umhYtlaU/0Z8NnLhLMeuOY2ka65wMlusdiw93oNj/wyNYTOke/BXB4Iw0c5jTs9Rmp
         2cU/N5FHfoor8nZnpkmWNx+iu3lsleZA2LDYML910k54mf6/yEmRyfUMXa7AOVdIrLu6
         lLcAJKgkGfXCIXLHXBohg8IksLtDK4m0wRXUElmjoiMg+Kmjm3icJrLjYbMqnMSfgUwf
         E6HNR2WrecXYuGLVQ8xJ7Y+AW7qLXJ1Y0KnEfzLP0jEtVKOr3QYBNoHB7uL49eiCWrlS
         iWuNH6BfYe30DHieqP+/hHLmJede6troQ7p0E+jvJnaExefJN76iokCYIZ3+uzfkolfI
         7uGg==
X-Forwarded-Encrypted: i=1; AJvYcCXE+TCvnF9OAIcyaz1d2ef1zJAP3auW1MdYiwcSkPJIUVtZta11QFZaYHroq3hlK/lKl2wuzDRsPiKzZq46gvbv@lists.infradead.org
X-Gm-Message-State: AOJu0YytEp8Bc72CBTnm1BEUkccXnfouR+83H3oNc1SxQPbQc70aP/WF
	1cGWv+V5OeGnbJzrxY7ryJZECf0SnLp1Fe8NvVTmYRtuztgG9jqsXlF+Fo9mqw==
X-Gm-Gg: ASbGncsxs4MNQ7fQRiOIakdlmeUnKkLDg4qmdMoUFRw3gHAkhMo5cOjHh8d/zmUpzjk
	ppB6L8yIiCeIKtgnWl0uGddFxC/nt2FPqAIwJOTV46F6ymgjWpNAS42grW+ZLcHHosw88Ct6uJe
	So3KbY86a+VduGZ4K/R/II6E8qhbFWhGxa+z6pSis9BbefcB8Prrtj79zefIDc9Y823c/KDAygB
	0ysEhJUf9k+vQ9g52DmVxrQMKp79vf+7YJ5F6nfAxouBjnNnTmKiNAydA7KJwVyeCoDtvNBRh8s
	mTeEOLV05CSW3g6bvGXDpxXjoZt1Cj5A2f7Cqiua4VobYx8VgZqoasCV+v7cLfM=
X-Google-Smtp-Source: AGHT+IFwYKsuYFk05Yb2ZLG7oOnOSu3sTQBXUECA3daxKB2RdxKe0gDbN37+1iCGZOUpVOTrPKRIXQ==
X-Received: by 2002:a17:90b:4f87:b0:2fe:b774:3ec8 with SMTP id 98e67ed59e1d1-2ff7cf13a91mr25942847a91.23.1741776232319;
        Wed, 12 Mar 2025 03:43:52 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:b5ed:b71c:fb14:a696])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3011926599csm1405675a91.35.2025.03.12.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 03:43:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/8] arm64: mediatek: mt8186-corsola: Consolidate and add new devices
Date: Wed, 12 Mar 2025 18:43:34 +0800
Message-ID: <20250312104344.3084425-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_034354_410057_85DF9C49 
X-CRM114-Status: GOOD (  15.82  )
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

Here's a follow up series of the I2C component probers for Chromebooks.
This series enables the component prober for the Corsola series of
devices, combines the two existing Voltorb SKUs, and adds a new
device, codename Squirtle.

Patch 1 adds a new HID-over-I2C touchscreen from Elan.

Patch 2 merges the Voltorb entries in the device tree bindings into one.

Patch 3 adds a new entry for the Squirtle device to the bindings.

Patch 4 fixes up the existing device trees for the component prober to
be active.

Patch 5 merges the device trees for the Voltorb device.

Patch 6 adds a device tree file for the Squirtle device, with I2C
components ready to be probed by the prober.

Patch 7 enables the prober to probe trackpads on some devices in the
Corsola family.

Patch 8 enables the prober to probe touchscreens on Squirtle.

Please take a look.


Thanks
ChenYu


Chen-Yu Tsai (8):
  dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
  dt-bindings: arm: mediatek: Merge MT8186 Voltorb entries
  dt-bindings: arm: mediatek: Add MT8186 Squirtle Chromebooks
  arm64: dts: mediatek: mt8186-steelix: Mark second source components
    for probing
  arm64: dts: mediatek: mt8186: Merge Voltorb device trees
  arm64: dts: mediatek: mt8186: Add Squirtle Chromebooks
  platform/chrome: of_hw_prober: Support trackpad probing on Corsola
    family
  platform/chrome: of_hw_prober: Support touchscreen probing on Squirtle

 .../devicetree/bindings/arm/mediatek.yaml     |   7 +-
 .../bindings/input/elan,ekth6915.yaml         |  29 ++++-
 arch/arm64/boot/dts/mediatek/Makefile         |   4 +-
 .../dts/mediatek/mt8186-corsola-squirtle.dts  | 107 ++++++++++++++++++
 .../dts/mediatek/mt8186-corsola-steelix.dtsi  |   9 +-
 .../mt8186-corsola-tentacool-sku327683.dts    |   2 +
 .../mt8186-corsola-tentacruel-sku262148.dts   |   2 +
 .../mt8186-corsola-voltorb-sku589824.dts      |  13 ---
 ...u589825.dts => mt8186-corsola-voltorb.dts} |   5 +-
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |  10 +-
 .../platform/chrome/chromeos_of_hw_prober.c   |  29 +++++
 11 files changed, 185 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-squirtle.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

-- 
2.49.0.rc0.332.g42c0ae87b1-goog


