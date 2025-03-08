Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF01C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 18:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=; b=1jitX7nO5ZcEf1SZx1nOUhUl5A
	20MUWsAVRO3ULrmycifxKo3WfcXuH2xRvziiG0Jnl42BcbG13K8psinc0ugehZyHXFPBg+uoyvn9G
	glXvPNLyJFAfbHwc80xw/gwZq57hTznC/8UAtpOp0GO75rqqn55T3MD1jp+Hq5GanhTt/8NlBu45d
	5xBYCfEXrrYemJAxgr+iavgY+ZCUilXk/KpYVNKDCH03meaSEq7CkZ14wRmvlvaTUPNtNsVsQ7Ial
	uM1EtZX+HdJ16xGcwHhvwE8bxT8kPfdNQ/Cxp1x91otfdzlCkiZXhXXpiKPi4QKbcpXKvmVRMwXZU
	s51uFlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqzL8-0000000H3rV-2CIo;
	Sat, 08 Mar 2025 18:56:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqz11-0000000H0Kc-1OK3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 18:35:16 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac25520a289so299913266b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Mar 2025 10:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741458914; x=1742063714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=jH/4RB+AwXz7qAkW4JJrIJFqsNCQuVLfKQV4HvIV/aZceh4Z8uXWUmjWOc35ULXhvv
         5vwc9ZLy1rBwm38L87VsDX2LwRa0R58nZdQQ4LyavBxf+L/F8m0fAsAsWTAksa6KnHOB
         L/28OTfxtpE5m3CY+0/DD2h5Ff+1IPNpjrghFn/RksAxuitw3h9J4ufkTlDcq2ghyFGD
         ekYc5mjZEfMwsaPTioJabYsqDKF10fuPtDEEQTbi+Z2RLrSNe3629T0dxHn840cSlPdA
         kSZ3wsWr1sOGHVUa3AaJpcp1MzGmnLejLXJZRkOI3yNa1k4yEjgXk7ATsEgP91eHInzV
         pPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741458914; x=1742063714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6+z5mwvOpLxFkXjmRmdjGwPnNX9qEV+1prpbhSFJtE=;
        b=ICvBUh7rpMSIl/wo4QORwBQDSEh2eV8johbs7WdC5FGvrIFlnC/BF0fVE6AadNUayE
         wH+5sK1k1yVL4TCSYDjNzZn+HjexhLJ/27OM4A+dcJVdWatzwwJQBz+POlLAX9oCDc9D
         F7/CDyhwH26PR61EVUzQ5VmLILi3CFFg5kxchM0+vqWBYtLO5FSc/2MhaqYEnAyasHib
         qjjASi5XA/3OseyXvrGJLTvKKL7u26CY5//MIAMJiSeQgTLYLZS8qOe85whO6hqck5Bd
         Ct3GJwcQcm1QX+SqrnJrhxfy+xcMTT784rPB08lDIMluSmgltN0ebYe8kH63LtG7ZAy+
         kqqw==
X-Forwarded-Encrypted: i=1; AJvYcCXCdmXWWv7U650MvBPjpQGY9zVPtYu2xH6p6buJRIpv2yOFzVQL5qSIXypSQ/X0AffaMWiDJdJC7ZulVWN0MLWX@lists.infradead.org
X-Gm-Message-State: AOJu0YzUbGkQtfC5GQ78LUzdffh+ewzT/ZWkBBZb0mT5iBfmMwln4pHX
	RFB47fbmouOxa21XR3OSrk+9jzW++ZsLIoY9fnyX1tYVaehQxxDL
X-Gm-Gg: ASbGncvRLm3s4dtNyXGIcoRVKUAJkmLMsWPLJNHIzv4AXlOuEw3fDR0N36pafvUYen5
	cAMss6xwD89jqqcCeHE/EdLWSYFPeEGUPWBd+hs4HS968K+gVOCGfOjeMlMwgSPpjDbBJ1T5+82
	24RBBR0/DltM+vG27X1DBIdEoR9EwlXApqV1SXQvavAdjA8LRjNfOZ4r2VBIrM88r00gtFK0SDG
	iPhb8Y9y+4t+ZvhES5hpLQfyv1PdhwBgl6TSpGAHAt+V5VW2LWPI2IKRoikV7zLGbtBHJLQOIMc
	Zrp+XqCTfbGtAT57lyjvIhz0V9UI+3PIpxmCpHcgtpP+g8cmMc5nE64vVw==
X-Google-Smtp-Source: AGHT+IFh4qSdAc0ziZwtQFqR3gB3PLHeMZTKtpDvQwy/JOvsAtBLR6l0SztItz/m5ITqfugVt1AvgQ==
X-Received: by 2002:a17:907:3f9b:b0:abf:c20d:501a with SMTP id a640c23a62f3a-ac25264ca27mr967872266b.16.1741458913731;
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
Received: from demon-pc.localdomain ([188.27.130.21])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac24a84397fsm379693666b.96.2025.03.08.10.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Mar 2025 10:35:13 -0800 (PST)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Eric Biggers <ebiggers@google.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Ross Burton <ross.burton@arm.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Ihor Matushchak <ihor.matushchak@foobox.net>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [RFC PATCH 12/24] dt-bindings: media: i2c: max96714: add support for MAX9296A
Date: Sat,  8 Mar 2025 20:33:41 +0200
Message-ID: <20250308183410.3013996-13-demonsingur@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250308183410.3013996-1-demonsingur@gmail.com>
References: <20250308183410.3013996-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_103515_371409_3805200F 
X-CRM114-Status: GOOD (  12.35  )
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

MAX9296A is an older variant of the MAX96714 which doesn't support
tunnel mode, but has two GMSL2 links.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../bindings/media/i2c/maxim,max96714.yaml    | 87 +++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
index 5bbd36c55ab4..9c6c79a770ed 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96714.yaml
@@ -22,11 +22,14 @@ description:
 
   The GMSL2 serial link operates at a fixed rate of 3Gbps or 6Gbps in the
   forward direction and 187.5Mbps in the reverse direction.
+
   MAX96714F only supports a fixed rate of 3Gbps in the forward direction.
+  MAX9296A only supports pixel mode, and has two GMSL2 links.
 
 properties:
   compatible:
     oneOf:
+      - const: maxim,max9296a
       - const: maxim,max96714f
       - items:
           - enum:
@@ -109,6 +112,90 @@ allOf:
           required:
             - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      allOf:
+        - $ref: /schemas/i2c/i2c-atr.yaml#
+
+      properties:
+        i2c-alias-pool:
+          maxItems: 2
+
+        i2c-atr:
+          patternProperties:
+            '^i2c@[0-1]$':
+              $ref: /schemas/i2c/i2c-controller.yaml#
+              properties:
+                reg:
+                  items:
+                    min: 0
+                    max: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max9296a
+    then:
+      properties:
+        port0-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 0
+
+        port1-poc-supply:
+          description: Regulator providing Power over Coax for GMSL port 1
+
+        ports:
+          $ref: /schemas/graph.yaml#/properties/ports
+
+          patternProperties:
+            port@[0-1]:
+              $ref: /schemas/graph.yaml#/properties/port
+              unevaluatedProperties: false
+              description: GMSL Input
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+                  description:
+                    Endpoint for GMSL2-Link port.
+
+            port@[2-3]:
+              $ref: /schemas/graph.yaml#/$defs/port-base
+              unevaluatedProperties: false
+              description: CSI-2 Output port
+
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      minItems: 1
+                      maxItems: 4
+
+                    lane-polarities:
+                      minItems: 1
+                      maxItems: 5
+
+                    link-frequencies:
+                      maxItems: 1
+
+                  required:
+                    - data-lanes
+
+          anyOf:
+            - required:
+                - port@2
+            - required:
+                - port@3
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-- 
2.48.1


