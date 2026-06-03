Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B290CD6E6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=; b=KoR1NqhTDmlIUSKwdQgqQTdqHh
	Jvxv6inQovPKUyGk6trLCGJlZSqIif7BWR/IgCimIZwpN2j5zOE49DhXfDPEWQr1ExW15LWOBJVZr
	5xw52WhmtF9pUrHBARz3syap3t4mOP76yaCmMAo9JEZSmDivqI2jvO127jMCjWhbu0xSaq0f6SWCI
	DfvkWZ8VF7XoWQn4I1vO9cSBaOzaZVMz24667bp+GGgrMxWTmm770K/LXxhp6hr1uuPoyvdLU75sa
	2B/+ADrhN8Jr8mEA3I3lxv1LR4eYza4UWPXde9Jv2W2KQMnyIjnG3ilUcXJidw9f2wD1jeWuxMiPa
	R9M/UULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGa-0000000F0QO-3lkA;
	Wed, 03 Jun 2026 12:00:12 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkGW-0000000F0Kc-2WYx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 12:00:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45eea68dd6fso3509380f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488007; x=1781092807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=DSIa6sYuz5TpHfrSu5jrHvPliFmtWS28drfsoqN2TL/kgeBlkn4fR4Alavbtf6plGq
         UGc7eh0MdCekalbXieo6r+UvQEIgRMdSxec+ryZcvpX8Y+wteNAnrSN3UnHrR9220QSF
         gRsXLnY+Bzxwa95t7pJ7NJvXeAQr5dMQBffCEYvwCqA8WxQ2U+Lh45QeUKbhamwJT/EI
         TJeKnlhJdYwimt/xybmRyDNoQ34VYXpcUc3x+Z4lwXwn6EwNHd/2fwEcgZoQA+ES//SY
         fvpyl5qB44ZLaZ7uqNUifKzR6tM/fr782RDEbY215xVHTrAym47FHD780s5tTBoz8uLe
         sqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488007; x=1781092807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QfXFBSjJ7Bso/9NLwnzNY1klrNWUGJZSNA6NwHWFfa4=;
        b=NQOB81r7PcEGN7dIbqU8f2lWPAduwfjZCuFKfI7eO85gPjqvtKtDOeymVIjsskb/T1
         gDFpmb11iA4P96maSJSntyXJ7AOkXKc/t6eszeOaOkXYir0/r+eQ/YiNUNA24Nnq5a9T
         wdMNaqFTbbJFnXTHDT4n0CWWGwsd49UeKsm7vRH4KzYKccwMTdEulfQGxSySun9pLPq4
         7HlFhmHPc91kqAs/8LZx/xXVDiPVd4jATUuiK5E6hmssm8h1bDIXi3krWENOMnK/zZVp
         8Cf18l92i3xGUZO1YkfSZiiiv98jInldBeA51lTFOpyE/yxDT02jTdKOjrLBT4TIHhLq
         Cjzw==
X-Forwarded-Encrypted: i=1; AFNElJ8CQvsQ6ulhXCMj3fXmu+AIpJok6zba2Cis7EOnwgawQI2xsEAAi8rWZDxsMY5enQSG83EjudCC/lA1GJlnvk4d@lists.infradead.org
X-Gm-Message-State: AOJu0YxSrNUbMpescCq/IBmAyRdMrf0bIXQGXMhkmbOjAkbvlAr+6zgl
	6mFTjBVFPVTr3mdlDapjU6xMCu6jb/aLKoUXrFEUMGka1QHHySsp7FaL
X-Gm-Gg: Acq92OFph/M87VZktAYfKY3XGHtwjYyd16wpOw2U+o5l/JXqk8HPJSGIjDS/igw0wB7
	7qdd6ZW4boplQi0vj68smgPaDlNj4erziDgRfMVDd6PpWATNSetEac6BiA+ZPb97PxXiwPb7o8w
	0Ve4XyBndFRVJRq7u47xIUfgLD3fu2f5Vk9XeMB3yq/znDKSPps7QqxOu/umEEPQBx94xfyhkM9
	cCTXqhd/U8O8dVVSSaAqZnRCU71WbIQVwJaXPDDsiEIjm7C4ZMwowADXq68vZEEKRNBQQ0wBBEG
	H3BWVmnvqu5AMttDWY7eHWp4iRpHma0gfrUaW9Xsioa49COFftfZNwKW2Va4gyIG/SjIcSemu6u
	l+wljBEdnJkLOFrWm6wvi8KOiAOr2QIe9gjWXcYPhJHj2q4HSY6zUtrusyaW0aVLyDe63+27J4K
	qJ4MDxi7KRuUVlOSdWpNAL7AE2C1SNJwqUC3NVa0gfgw/2fcAQ3r2as6oZdg2ghbIO8N7J6SrwQ
	WzKZAEOIcYKGgt40duRC7LuN8HenQ2O1o+LLgtYERuYMojF
X-Received: by 2002:adf:f247:0:b0:45f:f142:d571 with SMTP id ffacd0b85a97d-460217a50fbmr2915483f8f.13.1780488006448;
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:06 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 06/12] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Wed,  3 Jun 2026 13:55:44 +0200
Message-ID: <8b56416fbc765373643dfb0300c3661564e68ba4.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050008_674925_845C8538 
X-CRM114-Status: GOOD (  10.93  )
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

Add the PCIe reference clock and enable the PCIe controller and PHY on
the Symphony carrier board.

Describe the reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 3dda28be92f8..fe1699649414 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,12 @@ led-0 {
 		};
 	};
 
+	pcie0_refclk: pcie0-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "VSD_3V3";
@@ -146,6 +152,18 @@ rtc@68 {
 	};
 };
 
+&pcie {
+	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
+&pcie_phy {
+	clocks = <&pcie0_refclk>;
+	clock-names = "ref";
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_INPUT>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
-- 
2.47.3


