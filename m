Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0982D637A8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yPUIbOva92yuy+QEnGdpUmLYR+csAbyNvcDkxMU7mB8=; b=UDohfdZRNABXR9eAs0XfWhcYZ5
	PhW4RVWI93DR7PSQ/840nKYv9Gj2V6y1dwS6jqKhVv0T4HA146RczntFWDFo//rnXrr0rwnjCKnt8
	VT/o0Jv/wU97XQuVcV+bTjJx/Xhl0X9xLqZn4zsxx+gB37/VXuPy++r4O2T/B2UNcu0Gx5rbpRFKf
	U26lU29yoXUZ73QvlLrggsZZKBjUXFJ+dBH8MqmOZKqc4avQoMwS3MMrpFY8NE57QIDMKl/wcLae+
	nxGDGZQwONZa0vca3NBfIgKpF7fsfxHSLBwGsf9auh5TW6x9HKWyvG8SDL/dA0n4HK9STdI5G2H/1
	aq09fjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJCD-00000007rO3-0KNc;
	Wed, 13 Nov 2024 19:38:33 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBJAL-00000007rF7-2CND
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 19:36:38 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6cbf340fccaso10155046d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 11:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731526596; x=1732131396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yPUIbOva92yuy+QEnGdpUmLYR+csAbyNvcDkxMU7mB8=;
        b=ig9KgN9jq5U7G/u2m5XSitFPCfl/+ZEWS0MqsSTDW8ho8Dg/x0LLwlzhIStY/MCGx0
         aW53kNlU1URNAlXOx6kARX+jnuWSrM3uTW/CQpDAY2PZMsmou4uqArMghq761ld5nLTD
         j5yRq/nuHVV0SB9goOdMWRfXVVz8s5RORNEDsLLAauCYt6BjCVL6IEodt6aGAkz4XORq
         LHHQhjx4jGG0B8zA9dfpuCNfcNaCcPYoPDOpO2D41p+53OnGH4KgxKgV14zQ7McCyjX6
         GN12ladf3BqKQPBxfmIwkx/g+CrMC72RoPSX058l26zLSuyENGC/Tz7bcSn+6LA8bjWc
         4tsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731526596; x=1732131396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPUIbOva92yuy+QEnGdpUmLYR+csAbyNvcDkxMU7mB8=;
        b=kb+HjwYbEIuBdmlzSOsJm4Mfd6X6KSzR1nDTiEySBIuvqHGW2yrsqw5SZHWA9Gexpa
         m9fSUm00X2ZhZwwe530qFlnhvHSFvjLNlF/wcaeAwSqmR3ka6DCFMyJZTzrY6JTOXcwt
         SO7SK92uGYFXHhy/HrFkOyWP+9E1s01tXPyXIlnbrH9hXlK9LNaUzbuzjqLyymtEhtIq
         s0Vpms5DvIc628KpLsesQCZGifZC7yM4yHw6UoNxaLFLO29SXfJWTkMB/OfmFiVsFrTv
         dvUvE7ZIr7p53gJtw0ucaq5QCrY+4ahpvZnujHU+oWkUr2x3cjurGxrXPFXtCWmPgL5+
         dTWw==
X-Forwarded-Encrypted: i=1; AJvYcCXC8re+DAA0js2acbDrIdzrY0jwPFbAAOy7kxaPwvnsbYgO/Q1aHSVekA05bnFVeYnoJVSxc2Swg149WPM9u057@lists.infradead.org
X-Gm-Message-State: AOJu0YyTiHmXp1bjvCzLG2VAG0Z0KPqyQ5qHw6tLIi2FJuXTLTH8PLGI
	OWk/Wav2Pc7fl8pY3Z7a0m2r1SIM8xaeLKxBPlkMs99tCEVc923r
X-Google-Smtp-Source: AGHT+IEXIbvpmlTDbC2bSNCbht+Om4jIXJBqxIODGdhf7X9uH4GIqKJbkG4rhCTNXSRhGJ+I2f+eGQ==
X-Received: by 2002:a05:6214:3f84:b0:6d3:4453:6a48 with SMTP id 6a1803df08f44-6d3e90c5620mr10408276d6.13.1731526595643;
        Wed, 13 Nov 2024 11:36:35 -0800 (PST)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961defdasm88421796d6.24.2024.11.13.11.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:36:35 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <jesse@rivosinc.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jesse Taube <Mr.Bossman075@gmail.com>
Subject: [PATCH] ARM: dts: imxrt1050: Fix clocks for mmc
Date: Wed, 13 Nov 2024 14:36:34 -0500
Message-ID: <20241113193634.3487554-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_113637_591371_DAC7B1AF 
X-CRM114-Status: GOOD (  10.76  )
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

From: Jesse Taube <Mr.Bossman075@gmail.com>

One of the usdhc1 controller's clocks should be
IMXRT1050_CLK_AHB_PODF not IMXRT1050_CLK_OSC.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
index dd714d235d5f..b0bad0d1ba36 100644
--- a/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi
@@ -87,7 +87,7 @@ usdhc1: mmc@402c0000 {
 			reg = <0x402c0000 0x4000>;
 			interrupts = <110>;
 			clocks = <&clks IMXRT1050_CLK_IPG_PDOF>,
-				<&clks IMXRT1050_CLK_OSC>,
+				<&clks IMXRT1050_CLK_AHB_PODF>,
 				<&clks IMXRT1050_CLK_USDHC1>;
 			clock-names = "ipg", "ahb", "per";
 			bus-width = <4>;
-- 
2.45.2


