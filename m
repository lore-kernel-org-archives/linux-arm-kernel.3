Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CAAC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=; b=jn6I+lJxsfkxPPEoMOqxHwzGtH
	EuASPg1i+oaWmVz7OwUUuKzlmlra4X2CtHF2oO9JwsYGIg1CwGDveNY3WDMCFHYbr834OldWS1uAV
	mfAi1dAqI9UELRlBwTjv3lF4rIR8F1kClYz1uLnesyQs01gnE/Xrl4o2rz2WYe3PaBePt17Dk55oi
	VeZpMnBxxZPUbJ848IpNanGPzKbHNYckDRDQcHMbvQj95T4vr4m8QszmzcCWQEMfCL8k6Wc8V1fwF
	z28hQDA8O1gcR1/8EI9D9jVkuHUPNVMgOAkfN3pbykiZ4x2XlMNfKe4Chmb2RlwpdNSfE8EB3+lSs
	Rzsy96kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EFC-0000000BjBm-3FFo;
	Thu, 17 Sep 2026 15:41:50 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7EF7-0000000Bj8m-282n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:41:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e8185e037so5693595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659704; x=1790264504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=iNyk7bZXwx6ggAt78uRmARigwM060+hkJEklJSdvcsG6XKspRaesDd9jQYFo0K4tpZ
         6YorK9y/bnoR2+arnCJNutAaolsNPXu/NvsQRuYoimqSsKqanvhnLoBuRToI7RCeSiXL
         7+8vJqn5OcxhYKtf/SwmcloItCy4zSK14hhAC1J9QuZX8cPvsVn7Ta3SCZL0f6aFOHkx
         4yxKCVyyduDJiAIbTgmKlXpzEYXfdq8J/Pt8UysbSVV9Z10vgkzbLXCGcTjcuLVMfmwj
         6EzhLUAnVSdCaVrvR5/YyHUXFrgUVn2ZzEwfqqN3dGhh8JYlPe03PsHfzcaDit+z5/yB
         P2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659704; x=1790264504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ogUWVPuPz4Wv0AWXXjemfDDswNqsh12xy3+UrN+ebnA=;
        b=KTYmfnURhZSxOFvwbapHMO/rn/rbIy0HOaSFMrIRkMhBys6pvYyq/v9KItwJDoPD+D
         zTZvtxrq7NfDurUo/msE2hE840dXXBpOXeES56JZqXu0CYBHudkMpXH4EepMUYPLelCZ
         6XKhd6KeOPLnoHbBbiX95MEHuVr6CnSUvUEgEyVCeboZB9g1/hFPddhUlW9sNmW0Lu7r
         4kGr2h8mW99+MkMj9fqLOE7oUYakBTzCfqJi99jGisc1q5L7Bwtnz1UfL3/n77fAd10L
         uRDoN2x69N+WEkIvF3ttcuGWyaBOqhzDrzzHNxFJ3MO9Rg8Yi3TACqdtYq+pJ1gx+q1e
         K/9A==
X-Forwarded-Encrypted: i=1; AKwUvBwbLzq2ZOoIKDz8gCUQ+/p/yiwQedoCdGQ7wh3jT+WeoSHUORg+PMY8Ow6oGDZTWg9w+ccx801MHL7YJNgGG37o@lists.infradead.org
X-Gm-Message-State: AFuF++l7iKm/nnFbysKNBK+aJe2Ry6q0r2M8nvojxGtztPXcRjUz0WnW
	GG31i36E7Ff4K4ywbMLs3ILwdY96Gcpsuvu0aivckjTiKOM8rkMRjJFR
X-Gm-Gg: AYBFou3OMijayi0SIdZ9QmQM0rBjX3x4RIdDI43pnIgCWvQ0ZvYmGwfirT4k6xTN/eO
	3YN34qZTc70DSV78SdSvFL1pGqLy7ilkMDMUhKPYjzTCvmde9/4PLb2dnNUdndHIsFpPHSMwYJ4
	Rjsf2mphl+Md7QOEMMEK1w6ISNbZcbGG1p6MuhoCLmZD4gfLclIcAOc/i5EnLXZZP54qstDBjiJ
	VnjdIH3c9XCmXX3zICenHiz1iqN+hVnkObv3L6WJtWMOyrPq1v/g4dLZLhrexMJ+o3EZ6CbrZGI
	FnhZhJnmNaDMcXHXAWPOcQYycFyD1mTzcqtJUXDlVZBHpJLiwTEYP0qLg1yoCUillH0YNdgPZQJ
	sZtuicw0daN0ylnEESIzPkYE5aahpxIxwH3/rvIVHdzhmaCU494DKWJWObpqFXoy6SisM6pV+zp
	QystWHdZ1EPyXjVlqMp0rm6xZTANknwtyX3UoBlQhfok41NdA/mMIrlMGmxczoviYUPhQnipfJg
	g4mC3Kqk3QhfsH7UOvJscJz7zYVAJz8fRTWWKqPDb6tk6/cg2go/6xMnU9gnqALaO6e3K7Gjrum
	xKcwocq/A0LftI4mMQ4kTA==
X-Received: by 2002:a05:600c:8b81:b0:49e:69e3:884d with SMTP id 5b1f17b1804b1-49eac45ba21mr81456555e9.4.1789659702746;
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:42 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Nate Drude <nate.d@variscite.com>
Subject: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Date: Thu, 17 Sep 2026 17:41:29 +0200
Message-ID: <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789659585.git.stefano.r@variscite.com>
References: <cover.1789659585.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_084145_576425_04996E28 
X-CRM114-Status: GOOD (  11.01  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM available on the Variscite DART-MX8M-MINI SOM.

Co-developed-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Nate Drude <nate.d@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

 .../boot/dts/freescale/imx8mm-var-dart.dtsi      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
index c7a9eb23e5e8..953950e55bf9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi
@@ -138,6 +138,16 @@ &i2c1 {
 	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
+	st33ktpm2xi2c_som: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_tpm_reset>;
+		label = "tpm";
+		/* active-low TPM reset line. */
+		reset-gpios = <&gpio4 31 GPIO_ACTIVE_HIGH>;
+	};
+
 	pmic@4b {
 		compatible = "rohm,bd71847";
 		reg = <0x4b>;
@@ -452,6 +462,12 @@ MX8MM_IOMUXC_SAI3_MCLK_SAI3_MCLK		0xd6
 		>;
 	};
 
+	pinctrl_tpm_reset: tpm-resetgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_TXFS_GPIO4_IO31		0x19
+		>;
+	};
+
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_ECSPI2_SCLK_UART4_DCE_RX		0x140
-- 
2.47.3


