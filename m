Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAA7E81A40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYr4kH26Cd3kQ0Yi5Y6B01aBIxSE1jviWCAWWKW+n5w=; b=JRuMr807IaPGIq5QaBZTITQhvv
	y1JiX/tHydjNhvhzNIvY4SRMXrWtgTonpekLhJmndejGcfbR3cBY1eCXc3FhInT8/w2vpQbHJJIG8
	zmNIfyYXlp4ihyTA3Et4wohyqTzg7tMu5yrxF7x4BSH+I5yEqlRJXLiS/I+kqoiXa/QeVGJM6oQbZ
	S24C/l8IN0hHJlMKQdHDYk4FqU9QX9eODKFbHtk8VSm7dYhRB3mPNeisfMBIYkz2kaatAHilUg05u
	7PZH7bi6qhlDpCj0Ld0gL76OKy+45a4E7UbM82D52KKi/+Xy4so5QaxT+JTF3V2D8ubQIh9S8ESqt
	ycNxN+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1PD-000000070wX-2olC;
	Mon, 16 Feb 2026 16:25:03 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1P6-000000070mX-0jEJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:24:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4359228b7c6so2533106f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771259094; x=1771863894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYr4kH26Cd3kQ0Yi5Y6B01aBIxSE1jviWCAWWKW+n5w=;
        b=ZzDXFkyDve/tD9sOnt5GZqTBsCZSFQkl2328Ug2Cd03dg5OR1tjtLjLkYA0a23RoK2
         UWp1Hgeg/jHQdE5sAAEmNWtujM/lWAVA50tcGzRva9qSgkJrenaxlS3CjPhY1poFnUmw
         r2SgcQKW1RTaX9++wYBneO++Bla/z5/UKGFxV69Xl6216dZFB9LLGBbnHOuC3TXt42ay
         Ye8GtPINCqJ+ySk8XwvkUQEWPJL4GJmixhmMrtspy6bVNRu42UWYnNkUpA0sz7E14YXj
         MtvsS66PqfAYTF17lob+5XlmpHfzr1BN3XrzmWwJSX2CtUZIBLzyTAYOEzxVNf7Gqqke
         kNXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771259094; x=1771863894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sYr4kH26Cd3kQ0Yi5Y6B01aBIxSE1jviWCAWWKW+n5w=;
        b=SwnsOvPFuPr5hVSO+4QZoy9OpocnfNzInOsVM35htRCzurEqzdHUp9g2u5/moeT0zz
         XRINAcpV5hH1T+jsX5H2CcTwfAIOBkCO7LeWk7So4KqiRf8MvIyXIgbaQ/br+DGy1vBm
         /k5FwN289XKQhKjgc0Kc3YI+08gmiBCPgazrDVM1ozmCiK+7LrGtdudxKWJOKh4Ps+Sw
         Ev+FyVkzViXScYveI3/IeurjFNV1cZ5DwITb+rEk73ASpME/w7WfhG1grVCFmCjThbnB
         YE3DPW7lsdjYW+fOubzhlTbZL3o5sJBAcbG0NRF6TNuwdE9VDnbg2mrR32/LQ8TtYsNi
         jbjg==
X-Forwarded-Encrypted: i=1; AJvYcCWU1luOWk4dZftQn7MHO267R7NkGmfJWnXyGknevdjvxum7gAB47jFd8fQReC+GJxm5zKGoJ3bIpDKUXTZVErAs@lists.infradead.org
X-Gm-Message-State: AOJu0YyC+/fK7i4tKWRKxqg39wts6sYu8rd2R9SuKPJS+57cos+GPkwy
	+lteLGIWw8nroOoLjYYXodNQ/N/P89OByxKj3nV2OveTyUgNVL62ZfMm
X-Gm-Gg: AZuq6aLQSIs78d5cRQLgMPh/Y3ZiGuP08nN/iLgLEIJg4PcuqWN4g35MNszq1tAy4gV
	ZVr89khXM7JXwZTK8oyZrh282F04uDO09RhAmLsDXaoeQHTVpOZ44FaSyHJuH7PsChvzn45knDR
	RI3VS4uhjVsXR7qn8M81qlg5F+UtwRhCgIjlU4rWrdwx2SWY7dXFrus9Z46GPkFiKON3SWd2Dni
	P9THOsZcQWTJQbKyZyvItOD4WpX1anrgSdMTw3L70xTFUg/V0kOVoMwuE1RQ6CqQxl8vEiLAGE3
	DXFuyN6dnZsmezBPV0fUR6bOO5TjFKZ1SnvQsHTY1q22wYjALMCtE2S4PDShzeMxTxNOZfzpJVO
	P64Z5bLg+23duwKDTnpu+6/NRNOmKRrokpa0ZSA/gsuHqobblpOl/R3Mcq7VzK9gL/BHRIYMvYi
	+pquMkMsidQuBZ7gV/Vh+mLq8/2Xl9SA==
X-Received: by 2002:a5d:64e7:0:b0:437:8f98:8c91 with SMTP id ffacd0b85a97d-4379db34172mr14117696f8f.3.1771259094415;
        Mon, 16 Feb 2026 08:24:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 08:24:54 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 2/6] dt-bindings: display: mediatek: Add compatibles for MediaTek mt8167
Date: Mon, 16 Feb 2026 16:22:13 +0000
Message-ID: <8f86f229e564723b424b4d621244cfbe158c0f08.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_082456_243334_4DE994E1 
X-CRM114-Status: GOOD (  11.84  )
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

Add compatibles for various display-related blocks of MediaTek mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 +++-
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml   | 4 +++-
 7 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index daf90ebb39bf..4bbea72b292a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - mediatek,mt2712-disp-aal
               - mediatek,mt6795-disp-aal
+              - mediatek,mt8167-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index fca8e7bb0cbc..5c5068128d0c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -25,7 +25,9 @@ properties:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
       - items:
-          - const: mediatek,mt8365-disp-ccorr
+          - enum:
+              - mediatek,mt8167-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index abaf27916d13..891c95be15b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8183-disp-dither
       - items:
           - enum:
+              - mediatek,mt8167-disp-dither
               - mediatek,mt8186-disp-dither
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 48542dc7e784..ec1054bb06d4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6795-disp-gamma
+              - mediatek,mt8167-disp-gamma
           - const: mediatek,mt8173-disp-gamma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..679f731f0f15 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt2701-disp-ovl
+          - mediatek,mt8167-disp-ovl
           - mediatek,mt8173-disp-ovl
           - mediatek,mt8183-disp-ovl
           - mediatek,mt8192-disp-ovl
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..cb187a95c11e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
+              - mediatek,mt8167-disp-rdma
           - const: mediatek,mt2701-disp-rdma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..816841a96133 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -24,7 +24,9 @@ properties:
       - enum:
           - mediatek,mt8173-disp-wdma
       - items:
-          - const: mediatek,mt6795-disp-wdma
+          - enum:
+              - mediatek,mt6795-disp-wdma
+              - mediatek,mt8167-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.43.0


