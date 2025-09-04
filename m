Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9FBCA101C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEWsfe2YY56Y0NYA602LXIe3dsPA7RKn4VfScJVc2bs=; b=dO2ZSEyLUgw+PbVhC3oaAh0Dej
	KTMw3qBGR0a/OAN6x9FjifyKeWWyNDVSjWO80o4xcjYRh9McscCBH+OTGVCe0P0KimJ8WwKER+Ccu
	l6X/wF53zb1J35Tz2c+vZoeVQIUHmdtqmuHwU0SYV/VWBWIk9HR9MricTzrlwREr7gAECW2Sx+Pf/
	BxgYruxe4hw1PiKPUlc6bL2wyO2vEOP1hPZgPhky63uP9uybZqJqjEiJadHPkBtpTOaMQYDDoI5R6
	BGeWOr2iEDV06fJ/L2HVmHiS09rduyJsP7DHe+rlZlHI5KIf1T9jDFSF/cqldnXFUy9xlO1jONPLL
	zccoOBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkk-0000000Db6a-14KD;
	Thu, 04 Sep 2025 18:32:10 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAcN-0000000C5gD-48Uy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:07:17 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4b2f0660a7bso10015071cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 07:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756994835; x=1757599635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pEWsfe2YY56Y0NYA602LXIe3dsPA7RKn4VfScJVc2bs=;
        b=ONVp07TOB7guUSjw/37/HAwf90V7R5KDn4ZM3oNWG1UwPKePtAFWcl3E7Pq30wcRI4
         8c9C2MyWAapFli/Lm3aY/oDCm+Uxk2+7dZ4pW4iZjyXEDtigMjNS0kCyVX/SxO6iR+XD
         9Ey07m4PewEubxl3cpzx6S7k3OUFr8PtHiGp6+NjBZqmAsFB2rCVgxW0gH556gOwrXoe
         /2vM7hdZE19Z9inSVC76BH8U5R43C/gpJLkdTqWWcZnXGQbe2uvyIwmrxF/PHhAt9tNS
         XISzTL9bICFZQwK4ZvI7ayBJ8stqOpUNwJElxbIVG4swnGjnsYs35CSqJtNpEkqOPMeq
         xsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756994835; x=1757599635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEWsfe2YY56Y0NYA602LXIe3dsPA7RKn4VfScJVc2bs=;
        b=dzCHh7lAh7VwXlMb/u7PkN9ffFBDfoKabxMEH1KSlA2jjjdLzbBREp1ebWb9k9Dn+F
         4wBKHvctCkEQ5PfnpkJVC6PP8L/MntpcIUXE2D6wMG4ygpmk0in50p/m5I0iDLc65wsT
         lBZyUkZkPgnlViSKsnB37YpAsk2Iczyy2teMn7VSQX3KKOOjDE6gO/n9EiztmF1lq8f0
         QNjqj/S+GzIriYClbyNrYMMw7B696ATx0Ff5PE3tP7GxjqFHInbDYmVF6gWvmdoFtPAb
         e8CK+Yp+wJM0lIVL96/YsygqlIEFWDVlcYDXeTH6L+qyCg1voLI02KyqdMlJGrFF7YsA
         bluA==
X-Forwarded-Encrypted: i=1; AJvYcCV0fFdsIIRiSnL+cOPbytqPo2GUtqky65uf2WVXJ5l6fauorajFgw9e6T3oXYUg6Crq0AhjPjUkbYzLNC1KvJie@lists.infradead.org
X-Gm-Message-State: AOJu0YzgJRwUAli0VkCJF73lj7RG4OtvhZ4Z9+65U0z+hoYU5nNQy/dM
	XefkZT5R+lA9kgcEgbKogHn6Qf+1ZrfiP74dw+KYCv8WbVDgReC4/Wln
X-Gm-Gg: ASbGncv9Y+TnL9HLVv/2rsX0LK5VM2W47g3E/y0kvVGZp2EFO1hH0BYFAhTiG1BAxtM
	SAPGezgodjQdan76nDjSTNOR49pQaS+TKb9JiB+RsgU1oLf8oz/XhjLl/pQCbLyq3myzV0bP/Qr
	DGWhBX6E2nTp+qpnyZLjI3LKKjxC5P+adUSOK0kSJG6DuYLvDxtigCaDz/A6NrqNxmuwKDDTdt+
	RJSgxnV9XUozAuMh+b00BknloZuoDxqbthLE7MMa4+JZ2kSzjtyXMb3MFr35lL0q3VBRNO+tqn6
	u125pS3B6Hu65ePUjzy0KsI4QlSD0WTx+fznbvkCGHNexPDjGlc1SDVr36bMipWIcgi7fRsB8kx
	0BjzCLzd+Ca+4mw+kn1FQRpWUM/RbTS5qTVnZQ+A=
X-Google-Smtp-Source: AGHT+IFSn3RGIh9Vo9ZpAm8JD24yupRBSRlNS1hxRaXiIPj2Z064y2yu8lRKzq97ApwGEYc9lzPw1A==
X-Received: by 2002:a05:622a:28d:b0:4b5:e175:eadb with SMTP id d75a77b69052e-4b5e175ee17mr13666051cf.57.1756994834553;
        Thu, 04 Sep 2025 07:07:14 -0700 (PDT)
Received: from [127.0.0.1] ([74.249.85.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80bdedfeaedsm212280285a.70.2025.09.04.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 07:07:14 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Thu, 04 Sep 2025 14:07:11 +0000
Subject: [PATCH v3 1/4] dt-bindings: clock: exynos990: Add PERIC0 and
 PERIC1 clock units
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-perics-usi-v3-1-3ea109705cb6@gmail.com>
References: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
In-Reply-To: <20250904-perics-usi-v3-0-3ea109705cb6@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756994833; l=9680;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=FWfkf2K/As/HY295WWG/h7wnSFwEcmpa3ryJTLAMao0=;
 b=gE/El9JO4DhQ8WfqRu+Cst8I2FxPHHt0V/SY5EhIK4V6kGjue5i9Q9DVKdEqhHPiUkJTyTjxD
 h33A/t2LiKtDb1522f3bO4FjSfRr4OONOskoL+a2TrdCmTAEGngPFSf
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_070716_034230_3D1AB3C8 
X-CRM114-Status: GOOD (  10.99  )
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

Add clock management unit bindings for PERIC0 and PERIC1 blocks
which provide clocks for USI, I2C and UART peripherals.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 .../bindings/clock/samsung,exynos990-clock.yaml    |  24 +++
 include/dt-bindings/clock/samsung,exynos990.h      | 176 +++++++++++++++++++++
 2 files changed, 200 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
index c15cc1752b026231d8d9c3c07bdab201016b6078..5cd2d80b8ed667af2b44e3686aacbe3de31e3e2d 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
@@ -30,6 +30,8 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,exynos990-cmu-peric1
+      - samsung,exynos990-cmu-peric0
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
index c60f15503d5b18b11ca9bdce86466512dc933901..47540307cb52ead9c8f82a99957cdb2f1b0633e8 100644
--- a/include/dt-bindings/clock/samsung,exynos990.h
+++ b/include/dt-bindings/clock/samsung,exynos990.h
@@ -238,6 +238,182 @@
 #define CLK_GOUT_HSI0_XIU_D_HSI0_ACLK			22
 #define CLK_GOUT_HSI0_LHS_ACEL_D_HSI0_CLK		23
 
+/* CMU_PERIC0 */
+#define CLK_MOUT_PERIC0_BUS_USER		1
+#define CLK_MOUT_PERIC0_UART_DBG		2
+#define CLK_MOUT_PERIC0_USI00_USI_USER		3
+#define CLK_MOUT_PERIC0_USI01_USI_USER		4
+#define CLK_MOUT_PERIC0_USI02_USI_USER		5
+#define CLK_MOUT_PERIC0_USI03_USI_USER		6
+#define CLK_MOUT_PERIC0_USI04_USI_USER		7
+#define CLK_MOUT_PERIC0_USI05_USI_USER		8
+#define CLK_MOUT_PERIC0_USI13_USI_USER		9
+#define CLK_MOUT_PERIC0_USI14_USI_USER		10
+#define CLK_MOUT_PERIC0_USI15_USI_USER		11
+#define CLK_MOUT_PERIC0_USI_I2C_USER		12
+#define CLK_DOUT_PERIC0_UART_DBG		13
+#define CLK_DOUT_PERIC0_USI00_USI		14
+#define CLK_DOUT_PERIC0_USI01_USI		15
+#define CLK_DOUT_PERIC0_USI02_USI		16
+#define CLK_DOUT_PERIC0_USI03_USI		17
+#define CLK_DOUT_PERIC0_USI04_USI		18
+#define CLK_DOUT_PERIC0_USI05_USI		19
+#define CLK_DOUT_PERIC0_USI13_USI		20
+#define CLK_DOUT_PERIC0_USI14_USI		21
+#define CLK_DOUT_PERIC0_USI15_USI		22
+#define CLK_DOUT_PERIC0_USI_I2C			23
+#define CLK_GOUT_PERIC0_CMU_PCLK		24
+#define CLK_GOUT_PERIC0_OSCCLK_CLK		25
+#define CLK_GOUT_PERIC0_D_TZPC_PCLK		26
+#define CLK_GOUT_PERIC0_GPIO_PCLK		27
+#define CLK_GOUT_PERIC0_LHM_AXI_P_CLK		28
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_10		29
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_11		30
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_12		31
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_13		32
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_14		33
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_15		34
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_4		35
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_5		36
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_6		37
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_7		38
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_8		39
+#define CLK_GOUT_PERIC0_TOP0_IPCLK_9		40
+#define CLK_GOUT_PERIC0_TOP0_PCLK_10		41
+#define CLK_GOUT_PERIC0_TOP0_PCLK_11		42
+#define CLK_GOUT_PERIC0_TOP0_PCLK_12		43
+#define CLK_GOUT_PERIC0_TOP0_PCLK_13		44
+#define CLK_GOUT_PERIC0_TOP0_PCLK_14		45
+#define CLK_GOUT_PERIC0_TOP0_PCLK_15		46
+#define CLK_GOUT_PERIC0_TOP0_PCLK_4		47
+#define CLK_GOUT_PERIC0_TOP0_PCLK_5		48
+#define CLK_GOUT_PERIC0_TOP0_PCLK_6		49
+#define CLK_GOUT_PERIC0_TOP0_PCLK_7		50
+#define CLK_GOUT_PERIC0_TOP0_PCLK_8		51
+#define CLK_GOUT_PERIC0_TOP0_PCLK_9		52
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_0		53
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_3		54
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_4		55
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_5		56
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_6		57
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_7		58
+#define CLK_GOUT_PERIC0_TOP1_IPCLK_8		59
+#define CLK_GOUT_PERIC0_TOP1_PCLK_0		60
+#define CLK_GOUT_PERIC0_TOP1_PCLK_15		61
+#define CLK_GOUT_PERIC0_TOP1_PCLK_3		62
+#define CLK_GOUT_PERIC0_TOP1_PCLK_4		63
+#define CLK_GOUT_PERIC0_TOP1_PCLK_5		64
+#define CLK_GOUT_PERIC0_TOP1_PCLK_6		65
+#define CLK_GOUT_PERIC0_TOP1_PCLK_7		66
+#define CLK_GOUT_PERIC0_TOP1_PCLK_8		67
+#define CLK_GOUT_PERIC0_BUSP_CLK		68
+#define CLK_GOUT_PERIC0_UART_DBG_CLK		69
+#define CLK_GOUT_PERIC0_USI00_USI_CLK		70
+#define CLK_GOUT_PERIC0_USI01_USI_CLK		71
+#define CLK_GOUT_PERIC0_USI02_USI_CLK		72
+#define CLK_GOUT_PERIC0_USI03_USI_CLK		73
+#define CLK_GOUT_PERIC0_USI04_USI_CLK		74
+#define CLK_GOUT_PERIC0_USI05_USI_CLK		75
+#define CLK_GOUT_PERIC0_USI13_USI_CLK		76
+#define CLK_GOUT_PERIC0_USI14_USI_CLK		77
+#define CLK_GOUT_PERIC0_USI15_USI_CLK		78
+#define CLK_GOUT_PERIC0_USI_I2C_CLK		79
+#define CLK_GOUT_PERIC0_SYSREG_PCLK		80
+
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER		1
+#define CLK_MOUT_PERIC1_UART_BT_USER		2
+#define CLK_MOUT_PERIC1_USI06_USI_USER		3
+#define CLK_MOUT_PERIC1_USI07_USI_USER		4
+#define CLK_MOUT_PERIC1_USI08_USI_USER		5
+#define CLK_MOUT_PERIC1_USI09_USI_USER		6
+#define CLK_MOUT_PERIC1_USI10_USI_USER		7
+#define CLK_MOUT_PERIC1_USI11_USI_USER		8
+#define CLK_MOUT_PERIC1_USI12_USI_USER		9
+#define CLK_MOUT_PERIC1_USI18_USI_USER		10
+#define CLK_MOUT_PERIC1_USI16_USI_USER		11
+#define CLK_MOUT_PERIC1_USI17_USI_USER		12
+#define CLK_MOUT_PERIC1_USI_I2C_USER            13
+#define CLK_DOUT_PERIC1_UART_BT			14
+#define CLK_DOUT_PERIC1_USI06_USI		15
+#define CLK_DOUT_PERIC1_USI07_USI		16
+#define CLK_DOUT_PERIC1_USI08_USI		17
+#define CLK_DOUT_PERIC1_USI18_USI		18
+#define CLK_DOUT_PERIC1_USI12_USI		19
+#define CLK_DOUT_PERIC1_USI09_USI		20
+#define CLK_DOUT_PERIC1_USI10_USI		21
+#define CLK_DOUT_PERIC1_USI11_USI		22
+#define CLK_DOUT_PERIC1_USI16_USI		23
+#define CLK_DOUT_PERIC1_USI17_USI		24
+#define CLK_DOUT_PERIC1_USI_I2C			25
+#define CLK_GOUT_PERIC1_CMU_PCLK		26
+#define CLK_GOUT_PERIC1_UART_BT_CLK		27
+#define CLK_GOUT_PERIC1_USI12_USI_CLK		28
+#define CLK_GOUT_PERIC1_USI18_USI_CLK		29
+#define CLK_GOUT_PERIC1_D_TZPC_PCLK		30
+#define CLK_GOUT_PERIC1_GPIO_PCLK		31
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CSIS_CLK	32
+#define CLK_GOUT_PERIC1_LHM_AXI_P_CLK		33
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_10		34
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_11		35
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_12		36
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_13		37
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_14		38
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_15		39
+#define CLK_GOUT_PERIC1_TOP0_IPCLK_4		40
+#define CLK_GOUT_PERIC1_TOP0_PCLK_10		41
+#define CLK_GOUT_PERIC1_TOP0_PCLK_11		42
+#define CLK_GOUT_PERIC1_TOP0_PCLK_12		43
+#define CLK_GOUT_PERIC1_TOP0_PCLK_13		44
+#define CLK_GOUT_PERIC1_TOP0_PCLK_14		45
+#define CLK_GOUT_PERIC1_TOP0_PCLK_15		46
+#define CLK_GOUT_PERIC1_TOP0_PCLK_4		47
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_0		48
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_1		49
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_10		50
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_12		51
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_13		52
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_14		53
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_15		54
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_2		55
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_3		56
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_4		57
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_5		58
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_6		59
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_7		60
+#define CLK_GOUT_PERIC1_TOP1_IPCLK_9		61
+#define CLK_GOUT_PERIC1_TOP1_PCLK_0		62
+#define CLK_GOUT_PERIC1_TOP1_PCLK_1		63
+#define CLK_GOUT_PERIC1_TOP1_PCLK_10		64
+#define CLK_GOUT_PERIC1_TOP1_PCLK_12		65
+#define CLK_GOUT_PERIC1_TOP1_PCLK_13		66
+#define CLK_GOUT_PERIC1_TOP1_PCLK_14		67
+#define CLK_GOUT_PERIC1_TOP1_PCLK_15		68
+#define CLK_GOUT_PERIC1_TOP1_PCLK_2		69
+#define CLK_GOUT_PERIC1_TOP1_PCLK_3		70
+#define CLK_GOUT_PERIC1_TOP1_PCLK_4		71
+#define CLK_GOUT_PERIC1_TOP1_PCLK_5		72
+#define CLK_GOUT_PERIC1_TOP1_PCLK_6		73
+#define CLK_GOUT_PERIC1_TOP1_PCLK_7		74
+#define CLK_GOUT_PERIC1_TOP1_PCLK_9		75
+#define CLK_GOUT_PERIC1_BUSP_CLK		76
+#define CLK_GOUT_PERIC1_OSCCLK_CLK		77
+#define CLK_GOUT_PERIC1_USI06_USI_CLK		78
+#define CLK_GOUT_PERIC1_USI07_USI_CLK		79
+#define CLK_GOUT_PERIC1_USI08_USI_CLK		80
+#define CLK_GOUT_PERIC1_USI09_USI_CLK		81
+#define CLK_GOUT_PERIC1_USI10_USI_CLK		82
+#define CLK_GOUT_PERIC1_USI11_USI_CLK		83
+#define CLK_GOUT_PERIC1_USI16_USI_CLK		84
+#define CLK_GOUT_PERIC1_USI17_USI_CLK		85
+#define CLK_GOUT_PERIC1_USI_I2C_CLK		86
+#define CLK_GOUT_PERIC1_SYSREG_PCLK		87
+#define CLK_GOUT_PERIC1_USI16_I3C_PCLK		88
+#define CLK_GOUT_PERIC1_USI16_I3C_SCLK		89
+#define CLK_GOUT_PERIC1_USI17_I3C_PCLK		90
+#define CLK_GOUT_PERIC1_USI17_I3C_SCLK		91
+#define CLK_GOUT_PERIC1_XIU_P_ACLK		92
+
 /* CMU_PERIS */
 #define CLK_MOUT_PERIS_BUS_USER			1
 #define CLK_MOUT_PERIS_CLK_PERIS_GIC		2

-- 
2.50.1


