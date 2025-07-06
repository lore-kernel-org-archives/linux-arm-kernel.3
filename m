Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4D5C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rLJzcUMiXBad4V8OJNPvhYHlVWs0EasjPm7tIFAml9w=; b=zzVhiZ2yqG9bLYTa/bGZqWxMDp
	x9zJRoif2yXB8XyjiaVQrLkjTXBwS37YhjhAzUJufC19h3QSFY/nm2qThedeAtNKMdrBnmYZLxOE1
	ktjUV7MKbrMffFz3aLbMrJG374KmAivcPoT6HZ1eLEhSwDrJEUBx5BvOuB+VYLKICfhT4O6jj//dQ
	BeQF7K2i7f4+vWPQe9GWXIoLvyCBaKEzVPsOkpcxvBUVT8k5RixQyUCebno7hQdUDyb961z/dHp2u
	9DHz1RDTHb4xaysF10iwqnFXXT/4gcmwPGPk2wdUt/Tf2+ujRzhVBmwFi7KYnnsxeZdcTQPmhHFw2
	02GDiNvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMAq-000000005zZ-2Hpy;
	Sun, 06 Jul 2025 10:00:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYM8W-000000005e5-3O5n
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 09:58:17 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso273921f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Jul 2025 02:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751795895; x=1752400695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rLJzcUMiXBad4V8OJNPvhYHlVWs0EasjPm7tIFAml9w=;
        b=CMf51uYaq5aWLd8tiBZelmZNQJA7IlsfHW+NHM2z+CNhflYV4g1KP/yOZjzJf1fEME
         NrM+ZXddjQB4HhyGUoMPHHurwkGeHY1RfOiu6g/Erl8sn0+zpDtKko0OQRWVOOoY6NkX
         DfXfuxPB6TfvmY+qWuwlwKst8v1ocOsLs3BIk6jQt3F/DQcHXfZmOewj4+AnA9Bt9b6S
         8EH6JgDZvHdXZwdIyVsiuqbi+8raAPhOR91Z/PD5dyfO4G73Eo5SsPouLdaxrihcltLF
         ESKoLPeJW6Tlu7+qu8dhkcLKf1WJt2mlX/XzVNs7e6gVxaVAzW9kwzN25OaeIKjYC5VU
         1q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751795895; x=1752400695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLJzcUMiXBad4V8OJNPvhYHlVWs0EasjPm7tIFAml9w=;
        b=ss3ns3VMDfOb8Q0MMhhjZzLM2rhX/cde0FkGU82b3AC1bGyqUT1eOk74UslvtawSUt
         38LkbfSskto48LLen3onVe2UaoQYbe8dZIv5pu22Y9s3D6PozIkZ7V6wSTtxFTaZOdT5
         06w7QbfQFvqRgTCG3WMoSg3TyUO00imTlmAlBnR/tZRolhuCpivFK7Tnn/nZjNUouSGs
         n0tj+Eu1R/csTEvLbMy3P1+PP8k9ue3hQZkPsX4x4ElMhms88UUi1tSunBqi+p5B8fGV
         eFO7nC46A0YmQkBE4TEcpcQA9MirT1f5CRfATfMq1zXqa3lOCVEMwsAMCyJAbd8k8Nrl
         BW5w==
X-Forwarded-Encrypted: i=1; AJvYcCUpR22GaJF9TXzwL5r2f2S6ouB9GB7KpbZzcQzh9CJOwllu0LC08FiBdE7i7v+Fy1FuUfS7jtqZA/2lZ/WHQRNR@lists.infradead.org
X-Gm-Message-State: AOJu0YzNm8vDA2JyK+MBTWkaJrW785iSwO1teTkvLUoL4oAjlXs6J+G/
	YIuM+Kug9VwtgFdOOzRcyw+jyHmqy0o/fyEmM+IWbgoAr/aN9a1DrELzslADmBU656U=
X-Gm-Gg: ASbGnctw82oMkOzwvkpO/NTM2ATaU24C6GsMTmvkqFtkPc1agiLOZh4qQ0b9VB9aUQs
	xzLzFyYNvpw5w5XMNI5ZIym6XHSTyDDxSKfQzHwnhNC2jKr5FOMdE1leF53K+4Yh+tc8YpaoADv
	kkcAxtx+DNiBK9evAckxjYn9pVGLyQzzlFH8geDE/cEjW8tpraqDkTmpOULlxNekqJZGMS9QBR2
	WfogWJheBnFMR0CN73kWsZ6VbxkiGZ46W0Qc1iIIu4H+pa3s/latZP4X63UTxIjuDaAgFUwxlmX
	GlIGJv/5S0v5avBEcSC4XYiqg90EM78ntWTj15sSq0sZg0zwP10bFMWLheQQeQNMnFtzfg5VlzA
	=
X-Google-Smtp-Source: AGHT+IF4Ul/n9fVhzwVBg+BkNmoc/enxNYd0kHRns4nCK3XCzT0Bu7DVEcYAKqiVo/IOvxaJHXGIXg==
X-Received: by 2002:a05:600c:1d1d:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-454b35ee163mr29792145e9.1.1751795894893;
        Sun, 06 Jul 2025 02:58:14 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225a642sm6999179f8f.80.2025.07.06.02.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 02:58:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	lukas.schmid@netcube.li
Subject: [PATCH] dt-bindings: arm: sunxi: Combine board variants into enums
Date: Sun,  6 Jul 2025 11:58:05 +0200
Message-ID: <20250706095804.50475-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2657; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=xEkFef12nFlLIernh+CF1AUuIuQaso5KF89j0Sbippw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoakisY7M+9sD/W82rRJY9pnJ5W32Esc4uTl7gm
 diY585f+f+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGpIrAAKCRDBN2bmhouD
 13dcEACUhoM6D4bSGQjt2Ey7hYNh3NNu0aL3b1bop290qElz/yIWyx/Ed7e0ir4nWCGwfsSep/M
 q2UTunPLsBVwyCrIMDKY2gbsSwXz4i1KRfYeyRvBgMnsju7yaMGTJ2mjuNYexZ8XshvNg2DruMC
 ku1hpslsC3Sl1kfBnUWNWh6qyp0ujEltp7l0nV1usgwgDJU/FmgIgdQN586f7kQz07gc52epvKJ
 sOJqc7NYwntKKe2x9K18tPjcbX91tm4tpymuj756Fmw0waFuj5kfWxcvYUXTsOdXJHQ2Tgef+9u
 BqDLdnRYNnYXKjZ7RXernj+KGF3tWbDRk1+y+gTc0omR0gN6EFNL/9LzMn1imJj8umAs3ckxsMg
 nPFM+rHKIJ69dhINz47oVGYY3U7wG92WOVeNbDHHqDofmE2d0r4H6JhTpyL6xWuFyUX19Uk9YQa
 D/lhMQDim1MckV+sJ6durjiVvlKZAfqyanVh1mQJ6vK3j0NtqPaaEJTRRAgmVLin0Z0vrnVPVzb
 eyXdwKOEG7mv98I6Mt4t0g9ygbLmFUGb4bxjyfc9CVAyDIshCvT+JhEpL94RrP5HZ/3fwt6Riub
 pXjVbsVl+tGtDeeGemxDwWQ9y/QUwA1GqYpgnRo0QG5bgczyBU/3uy46LYEncGTnv1vjlxzuzKS 0O1UQ0NuNdsN6KQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_025816_853998_B396DB43 
X-CRM114-Status: GOOD (  10.29  )
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

The common style in all bindings for enumerating similar variants is to
use 'enum', not 'oneOf', so all boards of same variant or using same SoM
should be grouped under enum.  It is more readable, more compact and
makes easier to find actual devices from the same family/type.  Also
there is completely no point to repeat the compatible in the description
(incircuit,icnova-a20-adb4006 implies this is "ICnova A20 ADB4006" and
pine64,pinephone-1.2 implies "Pine64 PinePhone (1.2)").

Combine two easily visible cases: ICnova A20 and Pine64 PinePhone.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: lukas.schmid@netcube.li
---
 .../devicetree/bindings/arm/sunxi.yaml        | 31 ++++++-------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 7807ea613258..f10c6ee6a0aa 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -341,15 +341,11 @@ properties:
           - const: allwinner,i12-tvbox
           - const: allwinner,sun7i-a20
 
-      - description: ICnova A20 ADB4006
+      - description: ICnova A20
         items:
-          - const: incircuit,icnova-a20-adb4006
-          - const: incircuit,icnova-a20
-          - const: allwinner,sun7i-a20
-
-      - description: ICNova A20 SWAC
-        items:
-          - const: incircuit,icnova-a20-swac
+          - enum:
+              - incircuit,icnova-a20-adb4006
+              - incircuit,icnova-a20-swac
           - const: incircuit,icnova-a20
           - const: allwinner,sun7i-a20
 
@@ -760,21 +756,12 @@ properties:
           - const: pine64,pinebook
           - const: allwinner,sun50i-a64
 
-      - description: Pine64 PinePhone Developer Batch (1.0)
+      - description: Pine64 PinePhone
         items:
-          - const: pine64,pinephone-1.0
-          - const: pine64,pinephone
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 PinePhone Braveheart (1.1)
-        items:
-          - const: pine64,pinephone-1.1
-          - const: pine64,pinephone
-          - const: allwinner,sun50i-a64
-
-      - description: Pine64 PinePhone (1.2)
-        items:
-          - const: pine64,pinephone-1.2
+          - enum:
+              - pine64,pinephone-1.0 # Developer Batch (1.0)
+              - pine64,pinephone-1.1 # Braveheart (1.1)
+              - pine64,pinephone-1.2
           - const: pine64,pinephone
           - const: allwinner,sun50i-a64
 
-- 
2.43.0


