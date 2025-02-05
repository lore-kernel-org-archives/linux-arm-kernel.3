Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB30AC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 22:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJTKfLilyHPLx3eObPNpy3DS6ZtIlktsSD9MZI8c8bs=; b=r0M2cGJEYGtgCIrTwZYv8NQlmJ
	yT0mWulhOSINwes4EdSmWlciK/tS5KBZ1L6Zj9nk+bk5APTPea2HU02YiNRhZY8oOH+KRWE4JhfZN
	HtSyY+f3Mp75IEv19MJQdZw/FPR+u/vOFNSD/THTCSGDiFwN1nUUk8Z1OpPZ1SZF5pMfP0cX2fIj0
	0y+okQ8oheF2vn5O5I7d+z2ErIT9ENjbrfMFv2YXZNAEBGtkvO4L4w8I5DB4li8qD0mGXTG693dGe
	t0pkX0c0kZjXSur1Uff6kPZ1+B97YOzjtnxl3tZCex9IbTHWD69t+caNzzb9sOQMRFOwJ3Ho1XtxX
	NW+u0DMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfns2-00000004jYE-3FEQ;
	Wed, 05 Feb 2025 22:27:46 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfnph-00000004j1q-39hJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 22:25:22 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-866e57ec274so101981241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 14:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738794320; x=1739399120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gJTKfLilyHPLx3eObPNpy3DS6ZtIlktsSD9MZI8c8bs=;
        b=S73NTudRnlABpRObwp0wtYXWyihqHSkBiV1cTr+lhycdZbs2kzb55doM9NfoD2Zkvx
         +4eymz5t/K2aVHHj2hHMH7IBYZoPncZIaQcZS/EynRjm1LKdfwozLWcXnz1S/t654tFy
         S5miL9K2jzg3fisV3o9hoFwlOxz3g7jZm/eh3MPJ+pZV0vqxeS2LQoWMNWz3E9fiSv7+
         VpYCqlZ7a7wNijBksiUomLFc/MPeO5PvjlOCQ5befY7RJ1c9EqFe3YplDFOjMP9VZXt3
         +BDV4Qg3lGk06HXm5dETaaLX8YS2bOjoI3KpFx7OtYgE+qgiq3yBkeT3qIsXMCI8TCi6
         g5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738794320; x=1739399120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gJTKfLilyHPLx3eObPNpy3DS6ZtIlktsSD9MZI8c8bs=;
        b=jOHTHszC2y6m7cQ3EWA7Yd3LPLZtOd0ACE7+RBiv2kAfWdnj4WtRgP43/TQx8WkFmL
         WWv2HfwDvae/pGoYq0Xs8duesiyEqoaaWKahN209WX8+u1nugImgX2zVLeKrczxnsMqA
         ZCNHepsmeefHYmbBIp5FkcCsH5ke6Desp4wLe3Dw8o2eZ5IAnM6qrJA7i8WMvoU3p0FX
         /FDLIjKvzTxVmezsWjavAeUFLrnoQAO6PVvCI9Ou1/bzrJvMNmaokqk3ryMVnZChoabY
         oq9Y5n7jrsDnJA9TydgSxPfggPbwI/YYLC9nGH8GJbWELfw0kPK5eIh3nLvvbnH+mfiR
         +eEg==
X-Forwarded-Encrypted: i=1; AJvYcCURSRxK04FR34BeVBGXA2DUV1aKSmEvDb3T7/6PpMF+9jotGJ1KrSRXbsHC22duOMs7xQilu2rr46zosmfLL6fP@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx7/Xe4EQCSrRCdtcUOYyAnh7Ueu5Qa6/oZoCeboEAxglVXBaZ
	kOFvN3gEhWJMWZVOn1wbWUVHah2TmfKDY0ir48sVCeSR6VCSeMJiKxm0I1xv
X-Gm-Gg: ASbGncvN7NBVF6ztb0IhqpqXFfvKe30XlHoOIrMTtnYnhVP2hZsbfgBfnn1eB+Rv8JJ
	AuUH34FHeu81LcKGLe/nEVIIdGZ4terv2tjM+Orm9VF/LwUMyHfiA+kG5f5kkTADhis6wiYTHLF
	89qtZurCiHPL4z4fCOg3cRFekS+CINl/ciVXUlDHnmaeyu2T+4xfO4TXQpq+cU952n7s65xbBQU
	+dtTiFS92N8IzRpOxHUakz+uQbjdO5ih/4l4U2B74i5SW2de5VYRL9CNE2IGsmM80oabKD+B4fA
	g/7a4REECi0wlS37bHJVWpEkKW0fVPm60xJlQzyWl7KpU7CucnP7Q9mWMYWFCHBJs6tgrE/UgnC
	5Gw==
X-Google-Smtp-Source: AGHT+IETBHJFgsxv08BokD07Ze3sD9qMnzxrSwYE0FIosYhyygsNEboJYxXQI1epDJdsv5iLBBxyfA==
X-Received: by 2002:a05:6102:5e89:b0:4b6:d108:cac0 with SMTP id ada2fe7eead31-4ba478b11d3mr3790967137.3.1738794320247;
        Wed, 05 Feb 2025 14:25:20 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941edbefsm2475354241.28.2025.02.05.14.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 14:25:19 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v1 1/9] dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock management unit
Date: Wed,  5 Feb 2025 22:22:15 +0000
Message-Id: <20250205222223.613-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205222223.613-1-wachiturroxd150@gmail.com>
References: <20250205222223.613-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_142521_790271_D682E1E2 
X-CRM114-Status: GOOD (  11.11  )
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

Add dt-schema documentation for
the Connectivity Peripheral 0 / 1 (PERIC0/1) clock management unit.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../clock/samsung,exynos990-clock.yaml        |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h | 178 +++++++++++++++++-
 2 files changed, 201 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index 9e7944b5f..6b053d1bc 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric1
+      - samsung,exynos990-cmu-peric0
       - samsung,exynos990-cmu-hsi0
       - samsung,exynos990-cmu-top
 
@@ -55,6 +57,28 @@ required:
   - reg
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos990-cmu-peric1
+              - samsung,exynos990-cmu-peric0
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: bus
+            - const: ip
+
   - if:
       properties:
         compatible:
diff --git a/include/dt-bindings/clock/samsung,exynos990.h b/include/dt-bindings/clock/samsung,exynos990.h
index 307215a3f..97cb5e8d2 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -233,4 +233,180 @@
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 
-#endif
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER			1
+#define CLK_MOUT_PERIC0_USI00_USI_USER			2
+#define CLK_MOUT_PERIC0_USI01_USI_USER			3
+#define CLK_MOUT_PERIC0_USI02_USI_USER			4
+#define CLK_MOUT_PERIC0_USI03_USI_USER			5
+#define CLK_MOUT_PERIC0_USI04_USI_USER			6
+#define CLK_MOUT_PERIC0_USI05_USI_USER			7
+#define CLK_MOUT_PERIC0_USI_I2C_USER			8
+#define CLK_MOUT_PERIC0_UART_DBG			9
+#define CLK_MOUT_PERIC0_USI13_USI_USER			10
+#define CLK_MOUT_PERIC0_USI14_USI_USER			11
+#define CLK_MOUT_PERIC0_USI15_USI_USER			12
+#define CLK_DOUT_PERIC0_USI00_USI			13
+#define CLK_DOUT_PERIC0_USI01_USI			14
+#define CLK_DOUT_PERIC0_USI02_USI			15
+#define CLK_DOUT_PERIC0_USI03_USI			16
+#define CLK_DOUT_PERIC0_USI04_USI			17
+#define CLK_DOUT_PERIC0_USI05_USI			18
+#define CLK_DOUT_PERIC0_USI_I2C				19
+#define CLK_DOUT_PERIC0_UART_DBG			20
+#define CLK_DOUT_PERIC0_USI13_USI			21
+#define CLK_DOUT_PERIC0_USI14_USI			22
+#define CLK_DOUT_PERIC0_USI15_USI			23
+#define CLK_GOUT_PERIC0_GPIO_PCLK			24
+#define CLK_GOUT_PERIC0_SYSREG_PCLK			25
+#define CLK_GOUT_PERIC0_CMU_PCLK			26
+#define CLK_GOUT_PERIC0_BUSP_CLK			27
+#define CLK_GOUT_PERIC0_OSCCLK_CLK			28
+#define CLK_GOUT_PERIC0_USI00_USI_CLK			29
+#define CLK_GOUT_PERIC0_USI_I2C_CLK			30
+#define CLK_GOUT_PERIC0_USI01_USI_CLK			31
+#define CLK_GOUT_PERIC0_USI02_USI_CLK			32
+#define CLK_GOUT_PERIC0_USI03_USI_CLK			33
+#define CLK_GOUT_PERIC0_USI04_USI_CLK			34
+#define CLK_GOUT_PERIC0_USI05_USI_CLK			35
+#define CLK_GOUT_PERIC0_UART_DBG_CLK			36
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK			37
+#define CLK_GOUT_PERIC0_USI13_USI_CLK			38
+#define CLK_GOUT_PERIC0_USI14_USI_CLK			39
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK			40
+#define CLK_GOUT_PERIC0_USI15_USI_CLK			41
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4			42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4			43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5			44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6			45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7			46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8			47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9			48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10			49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11			50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12			51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13			52
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14			53
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15			54
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5			55
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6			56
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7			57
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8			58
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9			59
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10			60
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11			61
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12			62
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13			63
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14			64
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15			65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0			66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3			67
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4			68
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5			69
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6			70
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7			71
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8			72
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15			73
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0			74
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3			75
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4			76
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5			77
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6			78
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7			79
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8			80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER			1
+#define CLK_MOUT_PERIC1_UART_BT_USER			2
+#define CLK_MOUT_PERIC1_USI_I2C_USER			3
+#define CLK_MOUT_PERIC1_USI06_USI_USER			4
+#define CLK_MOUT_PERIC1_USI07_USI_USER			5
+#define CLK_MOUT_PERIC1_USI08_USI_USER			6
+#define CLK_MOUT_PERIC1_USI09_USI_USER			7
+#define CLK_MOUT_PERIC1_USI10_USI_USER			8
+#define CLK_MOUT_PERIC1_USI11_USI_USER			9
+#define CLK_MOUT_PERIC1_USI12_USI_USER			10
+#define CLK_MOUT_PERIC1_USI18_USI_USER			11
+#define CLK_MOUT_PERIC1_USI16_USI_USER			12
+#define CLK_MOUT_PERIC1_USI17_USI_USER			13
+#define CLK_DOUT_PERIC1_UART_BT				14
+#define CLK_DOUT_PERIC1_USI_I2C				15
+#define CLK_DOUT_PERIC1_USI06_USI			16
+#define CLK_DOUT_PERIC1_USI07_USI			17
+#define CLK_DOUT_PERIC1_USI08_USI			18
+#define CLK_DOUT_PERIC1_USI18_USI			19
+#define CLK_DOUT_PERIC1_USI12_USI			20
+#define CLK_DOUT_PERIC1_USI09_USI			21
+#define CLK_DOUT_PERIC1_USI10_USI			22
+#define CLK_DOUT_PERIC1_USI11_USI			23
+#define CLK_DOUT_PERIC1_USI16_USI			24
+#define CLK_DOUT_PERIC1_USI17_USI			25
+#define CLK_GOUT_PERIC1_GPIO_PCLK			26
+#define CLK_GOUT_PERIC1_SYSREG_PCLK			27
+#define CLK_GOUT_PERIC1_CMU_PCLK			28
+#define CLK_GOUT_PERIC1_BUSP_CLK			29
+#define CLK_GOUT_PERIC1_USI06_USI_CLK			30
+#define CLK_GOUT_PERIC1_USI07_USI_CLK			31
+#define CLK_GOUT_PERIC1_USI08_USI_CLK			32
+#define CLK_GOUT_PERIC1_USI09_USI_CLK			33
+#define CLK_GOUT_PERIC1_USI10_USI_CLK			34
+#define CLK_GOUT_PERIC1_USI_I2C_CLK			35
+#define CLK_GOUT_PERIC1_UART_BT_CLK			36
+#define CLK_GOUT_PERIC1_USI12_USI_CLK			37
+#define CLK_GOUT_PERIC1_USI18_USI_CLK			38
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK			39
+#define CLK_GOUT_PERIC1_USI11_USI_CLK			40
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK			41
+#define CLK_GOUT_PERIC1_USI16_USI_CLK			42
+#define CLK_GOUT_PERIC1_USI17_USI_CLK			43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4			44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10			45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11			46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12			47
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13			48
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14			49
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15			50
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4			51
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10			52
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11			53
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12			54
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13			55
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14			56
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15			57
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1			58
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0			59
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2			60
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3			61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4			62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5			63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6			64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7			65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9			66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10			67
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0			68
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1			69
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2			70
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3			71
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4			72
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5			73
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6			74
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7			75
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9			76
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10			77
+#define CLK_GOUT_PERIC1_OSCCLK_CLK			78
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK		79
+#define CLK_GOUT_PERIC1_XIU_P_ACLK			80
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12			81
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12			82
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13			83
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14			84
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15			85
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13			86
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14			87
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15			88
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK			89
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK			90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK			91
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK			92
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS990_H */
-- 
2.47.1


