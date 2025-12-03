Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD9BD1BDDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=; b=n6sSV3Vk21qBj5icbZEr7qJGsg
	Vz4O+63jnT5REbcs8iqmGRYxFx9m5zvVOBrPy4jl0og7yD0ccrMyCT+lL23ClRBeQuM6oBgP67bxJ
	R4K3pZHSsjq1IkvAdf1mwlMsAnqlUMM3/nYMYU6iLCFGcU8ityowdEA2bF+gcZ4pY6YJZbD6GlfHu
	sMAiznp9qiyWYWjaPhntMarmSr4I+KAOdjFhrYOwxAqYNvIbaILuXqLjyZ2GxmucRYof1H17GNv39
	5H90rPmIxqW7UHPKfCCkkaoyKlPofbppG4rRUCwO2ZeNsePNWwh/bXvO+/CfcHH+vwlF6DgtAq4v1
	QFCpUmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHo-000000077Xi-35lE;
	Wed, 03 Dec 2025 21:21:20 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHk-000000077Ro-2jam
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:19 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42e2e239ec0so176788f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 13:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796875; x=1765401675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=;
        b=GT1ArxWm8fKWjF/O3T0xk76ex+HwIpvY4v81yGdXj12iadpinuASLeA23usBL/MwFH
         OPSMbk8pK3VjbjKO6h3smoL15m80nNh8F0QvHhrjpx4rcxeSGXayyj+6JfKmSF5bRNdU
         FZii72+P6J6Ym+hjvAxeu1lYtLPPkMojTCCAVJe8arhPMj1SE5GbyqaVnhShdtA/W4nX
         hiuiS+vYHECQPJVhnoSgaXPUpdP1WVIsNbmkJBs1cfUEzrILKZTuIvMvISmOAXZ2MDS1
         1pMmnMG6n1/Kxh8uk4zkBA61fYXXlhEWVJY/8i/y+WOQ41X0OK8JHFTmXB7v0JvE4l+2
         Kjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796875; x=1765401675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yP/l8JGC5vYhIjT7IhD8+eR57N9ujutEJJaapNR46/U=;
        b=bTkrY/AY2L8NXdNcMh0gIGtT+xffjJU1UQbWiDPXfi6u9wEdzSTrVi+H0vusYiZsD0
         W2EyLsC6pUj14e/Bryru5ibqpmL6kzQvdpnfMINcprfovgXnDKXc3BQGBNy0Xz99g+EX
         0T6VP5lBx5nldDYqHsxjAKG+PILv2QFOKGDXeHXzvutmR/HBmuiQNkm2TJGs8Uv8E1Xh
         oisNalz8rwG4cm5PYsbNZ7VgEogFeKtC2Hw9mrQ2zpgXGgEVzEs8pFfd6W9Cl697E0RQ
         kSCuTWJCGuk5pfGquYZJZF7k/OZO/hvisEmwL0zE7iTpxX0GPuS3yvGCkJn3FnAy9zCr
         kIMg==
X-Forwarded-Encrypted: i=1; AJvYcCXwlsaX6IS33HezpodjiLEObFOKguL+bq3cAqqyPHjCr2huiQMCrxeNp9Pf1wGUpazmpHmSv8FUyxH4x5hBNXGs@lists.infradead.org
X-Gm-Message-State: AOJu0YxqJ3W9wAeAdIdX6nRyln6EN8f+bTSGAkwiOeLsd8n9tGzk8x0g
	IqK1we3pUKuOKWJzP9cMDrKZIQ4sYbtpcB/CyQtNo56kiuk7oHVLWBmy
X-Gm-Gg: ASbGncsJQYy3gBTzGxMGHUcm/JsqJMoVy+IDA+X2Do5KrMq0CtILX7CoJyYrkV1ltvh
	sJlNFvEqWZ7h3rcbqHvUqgwM8eTANw5Fr5Mvj+AJyQaDm1ItvLJmgB0+BjHVX8EBn90t5vA2+YZ
	d5QMfpfFsgeRAeyaUmtj/QMxtLGnpjboPv7VA662hgQlYRx3jCbumO14RCsa3vApbTLSwzAHn3T
	2KwqAd3j0LC/VeKPq5GTv1O3spMbWzb5/k4CwOfAS8w5E9Ww5q/1OAj6o93L2LJqEpPxrWIhzCR
	9fCNlWw0O9OVZeafkx+TV4M6mTVZ3Uezd2uInxg6GeivBHwhBDQxa6f+7JGAF3BzPTvOKAYzprQ
	+xHDYEBWVk83Ia1Uf1aW+O1iQcusCx0QhBJvyOHCTSoGqdilwywGAcoq0ZDU=
X-Google-Smtp-Source: AGHT+IGxZWzNDUX3hiHjNQKBnSxzzAZx7twXbp1EgxC0jGUK5ezYoXbz0OptPL3GJLKU9ZswN+2RqA==
X-Received: by 2002:a05:6000:420a:b0:42b:3680:3567 with SMTP id ffacd0b85a97d-42f73172b34mr3840601f8f.18.1764796874721;
        Wed, 03 Dec 2025 13:21:14 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:14 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Wed, 03 Dec 2025 22:20:38 +0100
Subject: [PATCH v5 2/5] dt-bindings: arm: mediatek: Add Ezurio Tungsten
 entries
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-review-v5-2-b26d5512c6af@gmail.com>
References: <20251203-review-v5-0-b26d5512c6af@gmail.com>
In-Reply-To: <20251203-review-v5-0-b26d5512c6af@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=1590;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=2O02A46urVE1HA8sKir61mogltLD52eOnfpgtmwDo64=;
 b=usZKRfG7to0jkWap1PRigfzy8V6LxDPmF1ruY8y1wPJGnYhpRNrOythsELbDISgNwwOFTQZ8T
 J2mSZumKXODAWVJBDfzBBqrPgrb1LIsDqWTEuyH89pK4OXKDYznH6m7
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132116_714852_0EAE3912 
X-CRM114-Status: GOOD (  10.50  )
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

Add device tree bindings support for the Ezurio Tungsten 510 (MT8370)
SMARC [1] / Ezurio Tungsten 700 (MT8390) SMARC [2] + Universal SMARC
carrier board [3].

[1] https://www.ezurio.com/product/tungsten510-smarc
[2] https://www.ezurio.com/product/tungsten700-smarc
[3] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Changes in v2:
- Squashed both entries into 1 commit
Changed in v3:
- None
Changes in v4:
- None
Changes in v5:
- None
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index f04277873694..cffb0f6ac690 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -431,12 +431,14 @@ properties:
           - const: mediatek,mt8365
       - items:
           - enum:
+              - ezurio,mt8370-tungsten-smarc
               - grinn,genio-510-sbc
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
       - items:
           - enum:
+              - ezurio,mt8390-tungsten-smarc
               - grinn,genio-700-sbc
               - mediatek,mt8390-evk
           - const: mediatek,mt8390

-- 
2.43.0


