Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04B6CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=; b=oQkFP5elvYxp4T/F03HLQz/mUc
	owGCkIrnG1XeDrR23LzUd3kO7ur5B5kGjMIqJ2+iAolXC2DVnVOzCY6//cEQz7aCmCHxSqVXXGTRd
	A1eYIe4RxjxYOzXh/bTTEoVzcsH1qwMCkqDDSLDJSAi8ng78rtdRGQVU47bdS59MH01pTpSwC204J
	BaDt/rlMMrKk5BOUznFy+l9XyRpKzHY+DfO7Y7BnVgE4WS0wqPLeKLzM2IDYlewSnMHid4Kmxr6OG
	zTgCaze9B5t/2utTj7VKYgoRF65YM+0yqcfMf+xXUjmCSPuq/FZfMy/Txsbt9m+D0WEpA4GJyn46x
	4n7WmX7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRV-00000009z4U-37Os;
	Mon, 22 Sep 2025 10:06:45 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0dRE-00000009yqW-1vhr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 10:06:29 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso2210321f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 03:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758535587; x=1759140387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=aGKC2wCqbGEX4jHeDbUR6+/MKjcv77g2opM1mvHNx9hhhWLMGgNnY0LIztreRT2ZAg
         aUV0h1IvV1G+8/o4afAlANyVmJ5HvdKI7LiqWBQH8+xUZ2KUV5jYk/B+KcUY080jXWrr
         iynvBrTCEh82+P8bt1E5hL5DDlH8IDLHQfzJP5IeJqY3ytssJBhfKfOrq7p4PNBGgjj5
         Ol14jZkGWMUteOOz+2nLOFn6iP6VB3vASYu+6W+AePFhMs+dZ0zZTMJWiz+SeKmUDxNx
         KOVe3x5qDtSzQFQnYh8LLMnDEh6kmIcCyoU1wozc46xgBQs/jw44DmRwZMeBEBsfaMHl
         /MZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758535587; x=1759140387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zz313f5+9XsH5+Eb3Bh9XStxpTdiNn9ua8EWNmWWJg0=;
        b=jxP+XyQm+ckM6105OsNEBbdkGVIGgjMUu+XZSkU6735km4KXZm+DNVJFGCSRnBl7Tn
         GESwXVikvg6a0006HofACg/YFM1CV9CEYiNU/xzer+uaEw24sxEY5Mu+52rB8S0ijp5R
         l2xc6UQa/EN2PAOyO+qZpB62c7evi8/Mptt/ENOJrANuPLfUYBSaN4Ws5MB0p2WU3yk8
         iL9UpXQenNIpT3hm1XA/M/9mebOFDemo97qyYxMSUBDbNNsT1h7s/h3KyazDWSsSAbod
         FkvfIfhysj3LOhtAyeWxx+c1m237olatqO/C5mSVSlTycqTO9XSNxoGhkXa7sb4XSDcY
         ksUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMn0W22tACBq8OlYJl0RpF7BXcS5I1yC/n/7nMHQNGO3Z5CM4V185j9jUy10Fuq7r550FJQ5T39NSdNsMYu+7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9GVNjJIJExq/4Rb/pDo79WK8sO48nOsht0D5hnAQLkNu3RyFr
	TYHxRkh5h5lz9aVAgG13vi5fiq/qmgAz3oJt4Xy9KrKmJ5SpFWWsijUX
X-Gm-Gg: ASbGncuv+u6u/6soFagfliH+5jc1FvZaLCBaHFfSjQGVXLcfBpVpHW/cXfGxFwgSd1D
	d3czdrU0JtRFCOzpLNzbF8s+4O1PI3ArSpPbjrveZMsEcDhYCmvznXq9My8muyeVPjv3X3rsnb1
	vWnTgIIvMO6xrmNGDJbjcDdZ+p5oi29gyibec+NADIPt4lziOvkbr7ltcv0WO5k+6FYcfRWl0uN
	TacTsg+u0pEmZGHiiCbBOomGnM0w+HdilWnqshWFd7VvzWVh/pUZ+BB5xAWh7zKHv3b3/De29d8
	ucBe3eQTPlniAP+L906aqpLyrT/58ojXCNi68QXsjkC2USBWM+s8r7U4NSEOIa40e9FcmMRyUAk
	0VGebWBbzuHnqyeGnR4F0LeHpI93voyRzgB+4rbOS4DiWzHGDMfhw1neV59TKa9YU+cjJmaA2K5
	oRN6+HfQn+jswR7hS0M3oi50HRUUQ=
X-Google-Smtp-Source: AGHT+IG5CaKIu1s56p3TpWS5l1RWL/b3CenMfj9WhML69rXhvqLaZjx6Zs78DXIYN5FpHbWguxd0TA==
X-Received: by 2002:a05:6000:2902:b0:402:71e6:5e12 with SMTP id ffacd0b85a97d-40271e6616emr918355f8f.46.1758535586492;
        Mon, 22 Sep 2025 03:06:26 -0700 (PDT)
Received: from localhost (2a02-8440-750d-3377-171e-75f8-f2d4-2af8.rev.sfr.net. [2a02:8440:750d:3377:171e:75f8:f2d4:2af8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1f3e1b03sm40913405e9.23.2025.09.22.03.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 03:06:26 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Mon, 22 Sep 2025 12:06:18 +0200
Subject: [PATCH v7 5/7] dt-bindings: memory: SDRAM channel: standardise
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250922-b4-ddr-bindings-v7-5-b3dd20e54db6@gmail.com>
References: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
In-Reply-To: <20250922-b4-ddr-bindings-v7-0-b3dd20e54db6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_030628_514873_7E3E1A79 
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add a pattern for sdram channel node name.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 .../bindings/memory-controllers/ddr/jedec,sdram-channel.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
index 866af40b654d..5cdd8ef45100 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,sdram-channel.yaml
@@ -17,6 +17,9 @@ maintainers:
   - Julius Werner <jwerner@chromium.org>
 
 properties:
+  $nodename:
+    pattern: "sdram-channel-[0-9]+$"
+
   compatible:
     enum:
       - jedec,ddr4-channel
@@ -118,7 +121,7 @@ additionalProperties: false
 
 examples:
   - |
-    lpddr-channel0 {
+    sdram-channel-0 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr3-channel";
@@ -133,7 +136,7 @@ examples:
       };
     };
 
-    lpddr-channel1 {
+    sdram-channel-1 {
       #address-cells = <1>;
       #size-cells = <0>;
       compatible = "jedec,lpddr4-channel";

-- 
2.43.0


