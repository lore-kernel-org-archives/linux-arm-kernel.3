Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9B1C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 12:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y4E8aOwQAaUdRX1dyEnehNt0cEoTdcyb+vzWwLzLf9I=; b=lVCtk3BmnOifPPCEQP7UD7uKY8
	Dmw5htgn+uGW6fWD1qRLXeO7ofNeKxUcUunZQouG1uqXn/lmsQF0eKRz7vS7ozJ8WP0Ogu+F0vf2C
	wucgfuBN2tHf7kywFUQUsXLnesFFQh5C3GBELdbHrcyCKksTsPMRmnNeivB/jqiMCKbO0hyWViiyj
	801806c6ACSDH/WPMuTfWnsngmdtuK+TBuB1El8LDUduOtzoYQUlg2LdtV8Mdm92YIbwrNqugm106
	rUU7gb3jLrRO45zbC0KzJfacK1kt7QjuDX/1mL9tqINM5vo56iwrNoB9K8e/ZZ/JG0LxRFhQjqFlg
	rrsQ2S8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBbk-0000000F8en-08DY;
	Wed, 14 May 2025 12:53:12 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF9nU-0000000EqK5-3y7s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 10:57:14 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a0b201faedso603153f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747220231; x=1747825031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4E8aOwQAaUdRX1dyEnehNt0cEoTdcyb+vzWwLzLf9I=;
        b=UUVO3WqQjKKMbZKcrLsZqsH+Pe2JDI+xIdb9ykYXXtJq4cz9liUkrJT9+wl/LG1/wn
         U0WC717a9SZC0iGOpwt3UdzaZQWGnoaADY7F1Lq6xKgpzxzCD7UOM6yOf4VchmXiatZO
         qXL18TbnVfDY8gPnyrNJkYeGH0hBjH7BX7YOwhzZnaJQajFPoltYSRq0VM5rdTjVvVCF
         iz+EG0dc/TzKXdROR3cKnZHFEBoviBRSWHzVdVV1qWSZFeY/G5u4yNUywxOPMOuN0guW
         VJ7+d3lGRHWf0uv3cWfLLSoXYGPbY9jiABBY4typ0cWNAx71dvvO9CtdBPJesmAswbXc
         1GMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747220231; x=1747825031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4E8aOwQAaUdRX1dyEnehNt0cEoTdcyb+vzWwLzLf9I=;
        b=pCrNTUH0dqgs9kOhG+zDfKNI1F6ldlYhyIHRcKBYhV0Pi0v85uLQ7SmErPlj0Lcmd/
         8/hdFo7LVvlhJZ7QsR/HTbQ1MhLS7B7HF3et8Knxy90J9NViabfz957HeXmqrLNgqvXy
         YFXrblAgsLKADQjr65uUetiad5HaevuDJnrqK96wmj5IJlRktWEFD3P9wrPlRlnZ66gF
         rCxqOf0dJJdNkglvzIJ1D34UAzCpVbbPo0WZg3Q1MxUQ/GVgFWIvZUH71DL1aKUsevs5
         URuDblXTZ2bpyysFVy2BuRN3PsF6B1S4BQmqIDwjnmz3Dhk2CHNYb/LvfZLHSowsWWWl
         lizQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzscqc4GfrROkzZdRncNlYQdo3FaTDDbx83lS1YM8RWmgjn3UkdK8kITCPaDd+sZpmtjeySQ+1RDKeMXR3cGSi@lists.infradead.org
X-Gm-Message-State: AOJu0YyQFkxfhugTKl4Kjhwv1AFF7J/RDBnnlDUuA1DxJtu99s28GlIu
	ZGiYZ1dIiY2it91b5a1+UP3l5OPzIyw3VtiDQXRvgxkC6JU1Tb87Dxdmq+ok76E=
X-Gm-Gg: ASbGncslkibYl1dexFh2BkQulqHsMB4zNONrECafwy1K1iYrbBmXhqInaN6PfXuEyAq
	0zfmyIbGMH7tXr573nMiMx3Mra/f4C2Uls/80C+8xW+pnVhxu6JtYb8I/ueLKzvenYQVYW4jGD1
	QbE73K2iv/OdVc9+K86hX59OvK3E4QA8Ga8wcnS/kGSas1gVB1gktHzUkbJpNoWCppfTIKLVvnF
	Hjpwq5YzJBd4hFjUGidrFYa6UcKr+VPdqumiPT9uOuUbtyG9ioMqoqmcqOTgmTDQb/y+N81uJQ2
	zsePCA60I1Hj3u93CgVvQGAi+aXxMqQYkKgVd04bYpl392ij9pXSphUpNpSylv32qLP6kM5U5yg
	TPuQEgEuYXMKCDGiS8NFS2BqKiQxYLsrZWTSlfyGDELizVt9Sxg==
X-Google-Smtp-Source: AGHT+IFtksBMN8N0y1ipHv0ssNQ0FUDjeBMyouJ1A0vX+2sBsa+p6vm/UIeQxO60xKTk6b6EFmeb6w==
X-Received: by 2002:a05:6000:2207:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3a34991c966mr848096f8f.10.1747220231062;
        Wed, 14 May 2025 03:57:11 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f36sm27362985e9.1.2025.05.14.03.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:57:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider
Date: Wed, 14 May 2025 12:57:03 +0200
Message-ID: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Io3JrD/y03dOQPQAcqJF5SS7b20bby4BHdbd1e9wLMA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJHb+RsGueHOitBQYXiszb3Mpl2m/RCzDn6fka
 rPIPq97lmOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCR2/gAKCRDBN2bmhouD
 11y6D/9EcflOTi1PXfiKHcWkO2TQd8AiHmKdLSSurf7WcaMBXn8Fbwo73+EJ/2olcQAcj7XZf9D
 8JwECXhe1ztAZeht1jIcW49QiQRkkUoTkN2KRL4dooNvkTgUY3vgNyA87MXPGPjLmL/JcvJsnsW
 Jry1/y+WGGXJTxvj453+yAfKNDgE2FtURccAdIPzhniUnS4RmnYp2nABLMgdTYv0aBqZbV20rqq
 jOWXfCbRAbLEWCIeZ+nQerpgM8fHM0eTYOuV5MHzhs27OoJkYOLMLAny5qoLl7Zpm7QIs6Sf0TQ
 411wb3xmZHUvPljW+odA5kp7vNu74ORgeg4sifz8NSK3UY7wfPBnAVDcUwbazT4UPZjVlvd6oJB
 M/oQZ5PI5OZXBBFcvbfNpTspmnlUpx2dl92iNd+EU3tV1ULUHEe7fMMDPmDWuya2uC0byBeV+NX
 KHdBSm5X6JTGBik2vPT29CmY9aUOtWDqcOvbX9/mXZDAkw7FrXY3gbcj83aIpGUxHsXct9+Fp1D
 jjQE9JCq4VNnydAnG14Q7NBEgujHn3urNMS5sHe0sb456zjEw7cQsrs0W6/JmpSTxRQ6N6UrSJU
 AUkb7dxGDDDx+k5ZgmIRFW0TnxfwnBQbiJBYrXSPQny28+3lgQEWgXSN8AGE4cuB9MzdnPo8ura jtDQQXfb+Vlto8A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_035712_988991_C83C79A4 
X-CRM114-Status: GOOD (  10.61  )
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

"mediatek,clk-provider" property is a string, not an string array, thus
"items" is not really correct.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 7 +++----
 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml      | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 76d5a437dc8f..7ba2ea2dfa0b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -96,10 +96,9 @@ patternProperties:
       mediatek,clk-provider:
         $ref: /schemas/types.yaml#/definitions/string
         description: Indicates dai-link clock master.
-        items:
-          enum:
-            - cpu
-            - codec
+        enum:
+          - cpu
+          - codec
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index cbc641ecbe94..037f21443ad1 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -124,10 +124,9 @@ patternProperties:
       mediatek,clk-provider:
         $ref: /schemas/types.yaml#/definitions/string
         description: Indicates dai-link clock master.
-        items:
-          enum:
-            - cpu
-            - codec
+        enum:
+          - cpu
+          - codec
 
     required:
       - link-name
-- 
2.45.2


