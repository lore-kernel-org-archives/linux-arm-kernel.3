Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05747D37E33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YO5IPtO5cdGkzvneXRvi+dlXdyTwC85OfiFr6xfp5RY=; b=m9PaUn/ARg3z41qSU81Zfe5CmQ
	W76pBmMn2Xq3CygatQhJtMdMx1VIW8PAvr4IYO6WQ3NYQqLwX7krj4w0av6jwicFWPWzjkRXR8XGV
	q+YPHHIFXsHxT0v/8HEwFiz/pMa4KkUcg6caJ28AsJWUCE55tKqiqDH0Ukx+Xi3GoICO6eeucXz/R
	6gReCxNCFHnzpfe+p7lA34WSpEV6TYFKglCxIFOKpnJUdtluinTdIWOfJfezAh9fjJP2gdaC5amOi
	w47G0uYfuFdDAX/3wesj9SsktK7B6kpQtNLQYfmFjevZfiyV/v3rR0xN5bDATbd9QKp+cuznTHjrq
	2huI3eGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gP-00000009UMx-3vkH;
	Wed, 14 Jan 2026 14:17:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg1gM-00000009UJb-2goo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 14:17:11 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4775895d69cso43943945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768400229; x=1769005029; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO5IPtO5cdGkzvneXRvi+dlXdyTwC85OfiFr6xfp5RY=;
        b=ZarzNo7WKzuswVMmLNNCWejr5VixuSu2LRSyecX8rerZvzSP5KgdHIJFoN00lZRL2w
         oDOY8VqxQNIQLOIvBSJKnvWoiznIwYdrNNxbcCMGAj9uI+9bUbRJwtir9NBYLikm1Msb
         l6cYuRfTDixPVfrsUm9Je5IXL2LQaa7T6UKifau8AybG8V/v1KmiepTSPVrm1EM23EhG
         GzzckEQ7YmwIGTelCOKcIu8WS9KHkTA9gTG8iXzWEdk7ZawqCapJOmn3cdIv05uiV1v2
         e0p3+onvBLUD9fdpZB/TNwld+P79x2wsSY65eEtUiuzrm9+oc0rlyL6BS5w9w/hQSwSX
         iZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768400229; x=1769005029;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YO5IPtO5cdGkzvneXRvi+dlXdyTwC85OfiFr6xfp5RY=;
        b=o1NFsnBPK6kc2eTNLnAaJBIzCrDKTZ4wQJTDjlAcMzcn9MDK9HOsl25K8D8KThsK5S
         hjZf9SnBKcVhqRho+LZybRB8hi93NknCh1mPrkCA88ZfrEUB2TSBPa8tMOX9j2RGCJ+v
         +wWwL8V/SKhwBHWCC0+QcoRF0nbfI+dr1kp7v44MKnzgGKM4DllyEQB6AdO6Xm2Dht3/
         04BtTihW+JNNyI0js3/kBo+AYVK0ZBRzfoz3Fik/UK3deZUF2DXJ5ervXus1YhWaVoOJ
         oo1OG40+UM2EFdQW/tnVJ9ePw5gfSGTOv+SgjFgcb76g5RTYBILyQ8yXj7LWwDMB2zr0
         C7ow==
X-Forwarded-Encrypted: i=1; AJvYcCWhz+HeG+wOMCTYS/mm4ppjmTb7AuCPmRaQhhrDIDROH3txmuniSrDPufnIZgMAU44de14SjRiCKHF7vzTXnDtJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyocG5G6A39TitifG+6HwOX/wCahTjGREXypVONEl3qUuAs4XX4
	HRR064/8M5+E1nY1YP3nV16LgqpmN9/0ZGA+RaCN8FMzIPU4Rr+57D7gTj8X7MfEt00=
X-Gm-Gg: AY/fxX5yDXI0MXw54l8WOAKPLkV9Qx43uE7BPo86B2NSVPlx0XuArr6fQPY9jbubqT1
	MsVssKvppXt88NGJPL9DWwfY2FQW7X05ffmAPp5+e6BmkZ5fDNNX2XbmkzvO/47r3eazAUpZjXS
	KXDATDY02c+IHGzWEYc1YyDf6mmq6sz9hyRg9e726iuWmw8WcTbq+kfYuQQV/EZApfa0rgbmhUn
	wJugRJYdnqmzMSm/zjDqARXdeivmlcMoiyj/D4Bj9qjGzynY3qKsqVWSIgnVcgPPhS57u5FBhY+
	GKNRRwESc21URnmX4yQJIu+mtdJeoPSY6fBVuOasYaJDYdsW09xXXqzrL7qon9YRpLeZX0V8e5d
	S2EUrJ7KghAk1b2PBqiGE3oWp8lOZR/m+c0hQ1Dma3umKH5I+MrQKI0a204J2aJb+EL/yX2QSM6
	uh06hIWAZ25J/sKTRPQ7t5dE6sBpVSfxthjmwdLwUjKVhz6ErSfKSvGKn5ITZTh1mtwNHBmg==
X-Received: by 2002:a05:600c:3555:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-47ee3363c12mr38044285e9.19.1768400228580;
        Wed, 14 Jan 2026 06:17:08 -0800 (PST)
Received: from ta2.c.googlers.com (164.102.240.35.bc.googleusercontent.com. [35.240.102.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee57a2613sm29595445e9.6.2026.01.14.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 06:17:07 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 14 Jan 2026 14:16:30 +0000
Subject: [PATCH 2/8] dt-bindings: firmware: google,gs101-acpm-ipc: Add TMU
 child node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-acpm-tmu-v1-2-cfe56d93e90f@linaro.org>
References: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
In-Reply-To: <20260114-acpm-tmu-v1-0-cfe56d93e90f@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768400224; l=1633;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=Y+qelmK4bAlyv/krT1u3T7mbMOZyLus+NJ7siKthjMI=;
 b=C+ZHlnpywyNkQkIYeZeMHaDsZBGpz38Vgp8+GMBcn0/FwlaNnjHtHkxAETXB7iXLe1n+GG1Bf
 Y6UwZZFTUyAB9FjKozYqzSJoOTCshklD/jjZIt4actl242H/wICUhN9
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_061710_704587_CDD0A2A3 
X-CRM114-Status: GOOD (  10.55  )
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

The Google GS101 Thermal Management Unit (TMU) is a child device of the
ACPM (Alive Clock and Power Manager) block, as it relies on the ACPM
protocol for configuration and initialization.

Update the ACPM binding to include the thermal-sensor child node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
index d3bca6088d128485618bb2b538ed8596b4ba14f0..4043a6453a9897b9e1d0e618489f79c19f32f247 100644
--- a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -52,6 +52,15 @@ properties:
       are used for passing messages to/from the ACPM firmware.
     maxItems: 1
 
+  thermal-sensor:
+    description: Child node describing a Thermal Management Unit instance.
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: google,gs101-tmu-top
+
 required:
   - compatible
   - "#clock-cells"
@@ -93,4 +102,12 @@ examples:
                 };
             };
         };
+
+        thermal-sensor {
+            compatible = "google,gs101-tmu-top";
+            clocks = <&cmu_misc 71>;
+            interrupts = <0 769 4 0>;
+            syscon = <&tmu_top_syscon>;
+            #thermal-sensor-cells = <1>;
+        };
     };

-- 
2.52.0.457.g6b5491de43-goog


