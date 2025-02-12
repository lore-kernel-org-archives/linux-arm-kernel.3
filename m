Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D920C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=isfA0SNs+wfkilPmRRKeVTcQKuXYPXL/vBWgpcfK6EI=; b=tRq1NNTxPE1lhhDf0GObePNPqT
	JEPfuJuCq25eDFmFGuIHjffsB7aXfbw2Uj2gnonNJjvbQ9mpOlDW+4hMFivR2tpFV9yNQfHno8Lp5
	U9JxUfBCyH9o/93SBCXC8zKceLYIpFV5kqSNDHl/8fzS3KQ8CSJwUOa3NFJB4ld9mXznQKHGdVBAr
	mPZKxwFqQDHGiP0Y3pSUFoNIrkupA4BrlPUav+ZI2/6hQww485kQDu3GrNpbr7MhMmexq/lP6x6nS
	eAvBPdzXYye/Q7VAgUqlQ3ooE0gbPBkyKIs3EyaF8DEBqdntegIyDQ035EbP5R6BtbIo5XSo3mzqS
	q5g9uflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0zZ-00000005lOv-3izn;
	Wed, 12 Feb 2025 00:52:41 +0000
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0vr-00000005kW2-3WOo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:48:52 +0000
Received: by mail-ua1-x933.google.com with SMTP id a1e0cc1a2514c-866e924f735so1785964241.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 16:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739321331; x=1739926131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isfA0SNs+wfkilPmRRKeVTcQKuXYPXL/vBWgpcfK6EI=;
        b=DdhfuQ+KuFfvQ73Z5xG8tj/ZrfQdn4SvKpXWStbVn4lNcU7Xr8OCADlldsBD56flhN
         M3Fb8eKCFpU+XjOw9/9l1NSNRe6onXLwA7MVRy1l2rdi/tUBKoy56/QS95olRmRn72p1
         HtYyX01GljBjfDQ8Z7wPY8sF/8ewReNFqutx/BKCOEcFxgLBpGYkMY8MfiBTqRUzVIIg
         mxBWCPILgrTdJbG31fFSw6q2fHTd3Y/Q24PJNA2WU/betOMoECqIb0d/XOVacGrZ8PxA
         KDVDLrBdJMYsqQi8uAqrBSZku/CosQhxbZF+emojn3dN/zb1N/folxBt0HDrSFtdYeqm
         Dp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739321331; x=1739926131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isfA0SNs+wfkilPmRRKeVTcQKuXYPXL/vBWgpcfK6EI=;
        b=inkI+LWVYOx78j3tMi8dLBgo7v6rn4U7ncqm553ndO0y+ZTkg30ZnsRdzEEAQiih9z
         hyO3muFs38NHklmszK6k4+zUFXcvrZP+VtroqTSjLjEFC3Hqlj6bYQGbbf7E3yZThu2u
         mkEAb/swaPwkK1IIf4/v9JtZXka+4pPyGQA3dGahgbbk2Q2W3XMP4evMndas6dq8MCAw
         OkDxZnNlUxkSvv3KW7FBw/kTQ1S0StDjC1FB4LhfVha/q4X/5Be0PK8+hdcyiv8+6pVH
         /RFqp/2PJnuPtYvgR0b0MrqOs8pSKCZAgF3/VZDDLlUKjZPyIDiN3wtdRiB7pecCO/U0
         qseg==
X-Forwarded-Encrypted: i=1; AJvYcCVUtpFIRLvDe8OljWFtaiB+pB4/FTL9HSK8tH5X/75AWs4qirURm59S4fsefN3f48O/zEzTH7949XA3ySkgrrX3@lists.infradead.org
X-Gm-Message-State: AOJu0YxjYQjxp9hg+pyRnpUUObMcn1/evSBvJtnPjf2g6UhTNvjTceZE
	2768P2Vp1RZ+iXbCExeB9CDPXwPB7/Qfxy8he0ZW3kWM/mDy4yIz
X-Gm-Gg: ASbGncuIXtd1nakS9/rw4WWDU9AxY3+qptIvKjXSAYGBKlla8xiwtoY6L7T8MDcySGQ
	y++l0+/vQQB86kuncqukPTzrZYBCdaB5I6zPw0JiN0CoRDpPet9TbGUJt2zhTJfpoowrXpmNJ5V
	Y0hX07DuwHVTTJ7/w8KwOi/rTZ7taXpOsr57vFUU6v6dNzRn+cQR9FLE4OS4SLtNhQy0qaA0ouN
	zLvNr0VXMybfZXtfva9pywiZa/okKeTrsJ39N6qG0WlCwUZUB8tiV5gBWMh0CTHfU4FfKfu7a8C
	AtlUY9jE3rofrL8U1pOqRTk/vR30L4gqcp8vgsdHdX3+ycpC69oM+de6Tkc3dspX9tuA4m8TDR5
	YxA==
X-Google-Smtp-Source: AGHT+IG4uCU+APGBvxqLpuH1ja/IYygMakhsrEWy+UTE1O6RH0zqZyOcucVuJtVsB1n0p23lIUsmwg==
X-Received: by 2002:a05:6102:2ad4:b0:4bb:c9bd:8dc5 with SMTP id ada2fe7eead31-4bbf216cce7mr1387460137.3.1739321330555;
        Tue, 11 Feb 2025 16:48:50 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bbce4c6fcfsm823832137.23.2025.02.11.16.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 16:48:50 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: krzk@kernel.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	igor.belwon@mentallysanemainliners.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: samsung,exynos990-clock: add PERIC0/1 clock management unit
Date: Wed, 12 Feb 2025 00:48:21 +0000
Message-Id: <20250212004824.1011-2-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212004824.1011-1-wachiturroxd150@gmail.com>
References: <20250212004824.1011-1-wachiturroxd150@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_164851_880228_246141C0 
X-CRM114-Status: GOOD (  10.33  )
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

Add dt-schema documentation for the Connectivity Peripheral 0 / 1
(PERIC0/1) clock management unit.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../clock/samsung,exynos990-clock.yaml        |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h | 176 ++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index c15cc1752..dd301deda 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric0
+      - samsung,exynos990-cmu-peric1
       - samsung,exynos990-cmu-hsi0
       - samsung,exynos990-cmu-peris
       - samsung,exynos990-cmu-top
@@ -56,6 +58,28 @@ required:
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
index 6b9df09d2..e94bdcc7b 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -233,6 +233,182 @@
 #define CLK_GOUT_HSI0_CMU_HSI0_PCLK			21
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER		1
+#define CLK_MOUT_PERIC0_USI00_USI_USER		2
+#define CLK_MOUT_PERIC0_USI01_USI_USER		3
+#define CLK_MOUT_PERIC0_USI02_USI_USER		4
+#define CLK_MOUT_PERIC0_USI03_USI_USER		5
+#define CLK_MOUT_PERIC0_USI04_USI_USER		6
+#define CLK_MOUT_PERIC0_USI05_USI_USER		7
+#define CLK_MOUT_PERIC0_USI_I2C_USER		8
+#define CLK_MOUT_PERIC0_UART_DBG		9
+#define CLK_MOUT_PERIC0_USI13_USI_USER		10
+#define CLK_MOUT_PERIC0_USI14_USI_USER		11
+#define CLK_MOUT_PERIC0_USI15_USI_USER		12
+#define CLK_DOUT_PERIC0_USI00_USI		13
+#define CLK_DOUT_PERIC0_USI01_USI		14
+#define CLK_DOUT_PERIC0_USI02_USI		15
+#define CLK_DOUT_PERIC0_USI03_USI		16
+#define CLK_DOUT_PERIC0_USI04_USI		17
+#define CLK_DOUT_PERIC0_USI05_USI		18
+#define CLK_DOUT_PERIC0_USI_I2C			19
+#define CLK_DOUT_PERIC0_UART_DBG		20
+#define CLK_DOUT_PERIC0_USI13_USI		21
+#define CLK_DOUT_PERIC0_USI14_USI		22
+#define CLK_DOUT_PERIC0_USI15_USI		23
+#define CLK_GOUT_PERIC0_GPIO_PCLK		24
+#define CLK_GOUT_PERIC0_SYSREG_PCLK		25
+#define CLK_GOUT_PERIC0_CMU_PCLK		26
+#define CLK_GOUT_PERIC0_BUSP_CLK		27
+#define CLK_GOUT_PERIC0_OSCCLK_CLK		28
+#define CLK_GOUT_PERIC0_USI00_USI_CLK		29
+#define CLK_GOUT_PERIC0_USI_I2C_CLK		30
+#define CLK_GOUT_PERIC0_USI01_USI_CLK		31
+#define CLK_GOUT_PERIC0_USI02_USI_CLK		32
+#define CLK_GOUT_PERIC0_USI03_USI_CLK		33
+#define CLK_GOUT_PERIC0_USI04_USI_CLK		34
+#define CLK_GOUT_PERIC0_USI05_USI_CLK		35
+#define CLK_GOUT_PERIC0_UART_DBG_CLK		36
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK		37
+#define CLK_GOUT_PERIC0_USI13_USI_CLK		38
+#define CLK_GOUT_PERIC0_USI14_USI_CLK		39
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK		40
+#define CLK_GOUT_PERIC0_USI15_USI_CLK		41
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4		42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4		43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5		44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6		45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7		46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8		47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9		48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10		49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11		50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12		51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13		52
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14		53
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15		54
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5		55
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6		56
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7		57
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8		58
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9		59
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10		60
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11		61
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12		62
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13		63
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14		64
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15		65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0		66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3		67
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4		68
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5		69
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6		70
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7		71
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8		72
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15		73
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0		74
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3		75
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4		76
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5		77
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6		78
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7		79
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8		80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER		1
+#define CLK_MOUT_PERIC1_UART_BT_USER		2
+#define CLK_MOUT_PERIC1_USI_I2C_USER		3
+#define CLK_MOUT_PERIC1_USI06_USI_USER		4
+#define CLK_MOUT_PERIC1_USI07_USI_USER		5
+#define CLK_MOUT_PERIC1_USI08_USI_USER		6
+#define CLK_MOUT_PERIC1_USI09_USI_USER		7
+#define CLK_MOUT_PERIC1_USI10_USI_USER		8
+#define CLK_MOUT_PERIC1_USI11_USI_USER		9
+#define CLK_MOUT_PERIC1_USI12_USI_USER		10
+#define CLK_MOUT_PERIC1_USI18_USI_USER		11
+#define CLK_MOUT_PERIC1_USI16_USI_USER		12
+#define CLK_MOUT_PERIC1_USI17_USI_USER		13
+#define CLK_DOUT_PERIC1_UART_BT			14
+#define CLK_DOUT_PERIC1_USI_I2C			15
+#define CLK_DOUT_PERIC1_USI06_USI		16
+#define CLK_DOUT_PERIC1_USI07_USI		17
+#define CLK_DOUT_PERIC1_USI08_USI		18
+#define CLK_DOUT_PERIC1_USI18_USI		19
+#define CLK_DOUT_PERIC1_USI12_USI		20
+#define CLK_DOUT_PERIC1_USI09_USI		21
+#define CLK_DOUT_PERIC1_USI10_USI		22
+#define CLK_DOUT_PERIC1_USI11_USI		23
+#define CLK_DOUT_PERIC1_USI16_USI		24
+#define CLK_DOUT_PERIC1_USI17_USI		25
+#define CLK_GOUT_PERIC1_GPIO_PCLK		26
+#define CLK_GOUT_PERIC1_SYSREG_PCLK		27
+#define CLK_GOUT_PERIC1_CMU_PCLK		28
+#define CLK_GOUT_PERIC1_BUSP_CLK		29
+#define CLK_GOUT_PERIC1_USI06_USI_CLK		30
+#define CLK_GOUT_PERIC1_USI07_USI_CLK		31
+#define CLK_GOUT_PERIC1_USI08_USI_CLK		32
+#define CLK_GOUT_PERIC1_USI09_USI_CLK		33
+#define CLK_GOUT_PERIC1_USI10_USI_CLK		34
+#define CLK_GOUT_PERIC1_USI_I2C_CLK		35
+#define CLK_GOUT_PERIC1_UART_BT_CLK		36
+#define CLK_GOUT_PERIC1_USI12_USI_CLK		37
+#define CLK_GOUT_PERIC1_USI18_USI_CLK		38
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK		39
+#define CLK_GOUT_PERIC1_USI11_USI_CLK		40
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK		41
+#define CLK_GOUT_PERIC1_USI16_USI_CLK		42
+#define CLK_GOUT_PERIC1_USI17_USI_CLK		43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4		44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10		45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11		46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12		47
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13		48
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14		49
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15		50
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4		51
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10		52
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11		53
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12		54
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13		55
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14		56
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15		57
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1		58
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0		59
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2		60
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3		61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4		62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5		63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6		64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7		65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9		66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10		67
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0		68
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1		69
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2		70
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3		71
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4		72
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5		73
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6		74
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7		75
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9		76
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10		77
+#define CLK_GOUT_PERIC1_OSCCLK_CLK		78
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK	79
+#define CLK_GOUT_PERIC1_XIU_P_ACLK		80
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12		81
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12		82
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13		83
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14		84
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15		85
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13		86
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14		87
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15		88
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK		89
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK		90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK		91
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK		92
+
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1
 #define CLK_MOUT_PERIS_CLK_PERIS_GIC		2
-- 
2.48.1


