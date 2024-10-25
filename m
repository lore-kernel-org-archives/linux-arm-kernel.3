Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD8AD0C600
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXrTKO29i+9riFKtMDpzC5dJ0oRASlg4ZqcDveSTxxk=; b=Ev5e5v1XJfOV6SlraUXhPEgSVh
	GgfLut4YUX0fdJIx7UlKzdZYxYP9bd6VM6Iz1enQurbDzT+EaT6S8z8Q9un3pKLNAzG4GNiSBPd1L
	2Ax4AS48kmbcC/yAD2B+KrdtEJXF5q7bpqtLwaYRTQeV3A0c+owR8KpH0Hn4FaiVZ+vNfeCiNmZGH
	HvdfxNSZW71HNi0DMn9UD3UWmEHrB7UCioKizA2xxsuTsUrvNINtIuer6cMfKPWJG8dV9iVQw7tyl
	7veERpl/XNI65gxcZ+fB9dGA72rdnTjuucKgyFGgF8YVsHUZurcZbjhswDH+VSdPY3Hk1AleIkUVr
	alhFtxhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IQ1-00000003Uom-3ORd;
	Fri, 25 Oct 2024 11:23:49 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4I51-00000003RoF-1C0l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 11:02:09 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20c803787abso14652695ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 04:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729854126; x=1730458926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXrTKO29i+9riFKtMDpzC5dJ0oRASlg4ZqcDveSTxxk=;
        b=YKLaWYYyt+uhd5u8J/ZuS3RCPoQbzu1pYv+e+R8inSHp7dJoLx1zY7VOy1Sye9fZiR
         eUpUtVQuXM+eNCdQq7GOk0eOG2d5utPiOu8/IxaTqTy7T8tTmiwNeGCHtaeFhMbfQ56x
         LbHxk5iBVZsVUcTeDhxTdlsJgIe+fg64WJSVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854126; x=1730458926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXrTKO29i+9riFKtMDpzC5dJ0oRASlg4ZqcDveSTxxk=;
        b=fnNoWKZduOOsGeT/OuPUB88TPXMsPFxq5yFLHw4WqTmDHlTrD+Vn+2j9QMyzD0eng0
         F+50gI7PxmzE0jSITt4BCX8gHEhvB5naKQ3mejmKbYdOZwWoXJJ6jX974HAOhPxE2fCX
         rTW2BHUJm/yaNBbLGe3IdS85A3IdMfeev2u7aJmyUKtXR7PpkO2SYiL6xlSu9km17rmC
         OH6SElOlAA7LO7ekCx5JWqetWPr94v+J7j5ThxZuOmWAfOrdA0UrN3PpcNS6bzXciRz7
         LFdj8XjpACCQr4BV/dxzVkPZkVC3Qt8kFmE/pv1xdEUWu7JPnW3xkv6hXNw97WhNpyT3
         n/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVa2Ubwa7yhv3jdoq7JDUDJVvEcC0iKHHrFbOXkvA7gbu2ptYjAvYZD8EDEu7RFiXSZpGbbRAykvPZ5L/libL4b@lists.infradead.org
X-Gm-Message-State: AOJu0YzTrSLZzTeFkOIkC7oWmIedOeq1AzZB2l2ROxYVJrKqQxTd3ESL
	cA+Te1en2LG7RRak0nkkWRBCzo+/sZJ/B57LnEYQOZmWlto4qE+tS3jcp19Trg==
X-Google-Smtp-Source: AGHT+IG4TIqfgI8FWglIjkgZ6paBZxepL1z+0e2SainqCz9RlgYpyONGoQZzrlCGu/COKAqZwdWOEw==
X-Received: by 2002:a17:903:32ce:b0:20c:5990:897c with SMTP id d9443c01a7336-20fb8a5b3c2mr71630985ad.27.1729854126393;
        Fri, 25 Oct 2024 04:02:06 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:ebe1:dd63:343d:8a4c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf4472dsm7588595ad.13.2024.10.25.04.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:02:06 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fei Shao <fshao@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
Date: Fri, 25 Oct 2024 18:59:35 +0800
Message-ID: <20241025110111.1321704-2-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025110111.1321704-1-fshao@chromium.org>
References: <20241025110111.1321704-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_040207_356151_CEA5B33D 
X-CRM114-Status: GOOD (  10.82  )
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

Add entries for the MT8188-based Chromebook "Ciri", also known as
Lenovo Chromebook Duet (11", 9).

This device features a detachable design with touchscreen, detachable
keyboard and USI 2.0 Stylus support, and has 8 SKUs to accommodate the
combinations of second-source components.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..4b68f0baf010 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -307,6 +307,19 @@ properties:
           - enum:
               - mediatek,mt8186-evb
           - const: mediatek,mt8186
+      - description: Google Ciri (Lenovo Chromebook Duet (11", 9))
+        items:
+          - enum:
+              - google,ciri-sku0
+              - google,ciri-sku1
+              - google,ciri-sku2
+              - google,ciri-sku3
+              - google,ciri-sku4
+              - google,ciri-sku5
+              - google,ciri-sku6
+              - google,ciri-sku7
+          - const: google,ciri
+          - const: mediatek,mt8188
       - items:
           - enum:
               - mediatek,mt8188-evb
-- 
2.47.0.163.g1226f6d8fa-goog


