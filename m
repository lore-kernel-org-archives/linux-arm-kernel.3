Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439B9CCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 10:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=; b=Cub4a+L67BMlJ7yccpAVOpOd2u
	abqIXPqk683tWazUncTtFDoaGNs78JFTKopjFa6EK/uYjLAcFtDFAHHrLK+zN+cIpz17xuan5qjVM
	Kw0y5lMsbPNgM+QC+QTJOKizdgMqBFkXH9frBRnseewa4WV0yvAU/CyzyGb6YJtc6x3VDaO1OiRae
	dKfx9ncSrOkiLu8OrCt+gL6PKPS0gMB7NOntqMqS2Cq7GILClCgIxS37JWdYZ9GtDuVijmEwZjQr+
	iOUnolFsomscjyFu7NoU5xyM6ZOpwhv9Wmf2GgS3TVTs/ZQ8/O0G6rEuDMyIFC0Q8ypHGHVCzeDRf
	OAQjrv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkTw-00000007A1S-2bDF;
	Mon, 19 Oct 2026 10:20:40 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIkTs-00000007A0d-3lHX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 10:20:38 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-157fe9d771bso500268c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 03:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405236; x=1793010036; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=eX0wu2Wb95OSG6tas6jabNPo7XFNb7vNvhrbqLNgpsybznP7IpLUGGHxuhCRjMTmzy
         78+GjdZ8rM2si6mqoDKg2KNRVX8jeWVXtBgMbXDuWHOcMaldkyhyKGb+XvPiS/lbwRen
         +ZvTm7ZBp/ptp47jsrXpqBbBkKHuMFqHyaEMvs5xk0pBxVoPULSTmZphMxWaofFVgzdX
         YbzBEYD/cWt+oFpc8/DL9lmDfjCIHeyDGm04kfOOKusm5MYDJDx4oAEvOdZcDAhUuhz7
         V3cXXETuZxNXvmAAiG1kFyqtPXo/OExHszr6H5PBzebSaaSRwsUDVjACvux01Xf4BRnY
         Y/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405236; x=1793010036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5cb5xsu/Ek8DjIcHOFj6xTziW0Tc8RenZR8/LpBW7iE=;
        b=BqXbUJHt7qc8DCqJXdr7l8ETxP9iBY9qqqB3QXnSKxnB6Vk1vPRkeiWMs4JWj9VLqg
         6AVShZSB/vubpvuufXyZ+QYi4RZgIMtrQjWUQaVoyFcD7ZJogd00zDXW44F2Jv4ASa44
         bYYaFFcRzPs6F1dKvtpIBFOntG6s8Ah8+RjsmV9W9FsiNrL0BAou8nXK/upyFz9W9hR3
         msfvAIj2+vyRnMBbF1sy5TfjptzgUU/+3VnPFEjfZ12K48N5kyeAQNli1HI1E+nWFx4m
         nCAQT+1erGWalN855f8GJDtsswHfaJxXdZe45ehzkGmygqXi55K7ip3thg2sRqWAYeNu
         syVA==
X-Forwarded-Encrypted: i=1; AKwUvBxoIGgIoFz9f7DHkwp91c/1myM8OO+1VTfMOcfsyANlTkct1LMmxtkTkbLOqwqfeIUrPQexhwW69W8MoBE+hEO5@lists.infradead.org
X-Gm-Message-State: AFq9FYJ3TO2V5KHRSyXesvfb7fLWbn+UvnNqGFoDwFENX6L8nS5oxCJI
	wwYN8RXr7jMLjO5TWHE73xNRHJ6aTofmBDXsNMI5pX553CiJYQykW7HK
X-Gm-Gg: AYBFou3WnlyeJ7cg/AYSX14DKA8tahX1mPo7WTvPpkZ+RWoC/yexBBLSSkrwpijzOe3
	aybYpIqXPrB2kgPRhlI/e9hDZKrMHw4fLUHpYGOab3Q1nhreMWw7uKrFucloSIWjc6BL+LBBgq6
	0QcBfXyQ1YX8zpL/6RHJZ3Zs4rrFnOiLDTPaiDr5z+5TncpQy2iWXQJ3bwkV/ZcOvC48XubmU0i
	aFNIAhckiY32e7Ke7uabwp3AR1c6v7Xneb58N5c4oReuQpPj516GZVvej1Nxq7obTLu028Mul6j
	qfMtqhUblHvVDkrVkaajq/ntWVbOsCtEx0iC+3EQCGamRtGGpScuNVIb7wNOVS1Asw92WdgzUmm
	BsxUiGjLpahKrZB59tKizPhjv0TR9c2kOF42Ovk9Prf3bLgpbIV0zlTW5SUplspABrQ+3wNhH5z
	fLRkJIC15AsYjKg0XB4om14unJAOhbrzHTxF3w2bd8kOsx6tdNXOdg7o8Z9g+D9SKkhLcqzZNq6
	7k=
X-Received: by 2002:a05:701b:4348:b0:14c:96a4:b631 with SMTP id a92af1059eb24-1851453fc8dmr10504406c88.30.1792405235442;
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:35 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:14 -0300
Subject: [PATCH v2 1/3] dt-bindings: display: bridge: simple: Add
 data-enable-active to dumb-vga-dac
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-1-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=1828;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=PF05NXBIDireg6ZUuKSrsvk0d/GOH3dnTBdN38H+03I=;
 b=HD53baHT8u8/D5pbXuDGQl16Aht+8414McxB843sMyEC12qLowhQ0jc1HnfAvNB3zgF23VEb/
 NDRwdc+iyH3BM2jB6dL4/ITgsqWwfg90tizY7oL/Djh99ux42ruW1MI
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_032036_940653_1ECC4BE3 
X-CRM114-Status: GOOD (  11.05  )
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

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple VGA DACs may include a data-enable input that must be driven
at a specific polarity. Add the data-enable-active property from
video-interfaces to the input endpoint to describe that polarity.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 .../bindings/display/bridge/simple-bridge.yaml     | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 7636c24906ba..b1b23d41245d 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -43,9 +43,18 @@ properties:
 
     properties:
       port@0:
-        $ref: /schemas/graph.yaml#/properties/port
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
         description: The bridge input
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml
+            unevaluatedProperties: false
+
+            properties:
+              data-enable-active: true
+
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description: The bridge output
@@ -65,6 +74,23 @@ required:
   - compatible
   - ports
 
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: dumb-vga-dac
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              properties:
+                endpoint:
+                  properties:
+                    data-enable-active: false
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


