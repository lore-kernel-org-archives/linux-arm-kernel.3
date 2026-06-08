Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0DDCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGTKa5ZDbrqE8PBt++HRT37Y2HMbYqrX7rou7DzMfEk=; b=eB8fegMqbz2CIkwwqo9z89ndJm
	XYnr53ob4k9GGcUBbvGLYMRXzhQPyb3vu+Z6u926VpaMYUcseh5twCZidjqky0zq9agbVF6TD5NaF
	tMUVuESNImiVfaKiGVtdIMxhgo7MUwEIHb56Lg1OVLforQ8XCIhgr09PL7L/ed22bnHwsFb9Nol2O
	CyavALt9Seyy67FNHH1TKavHrqcQm+U7B3CYp6zEN7S24i8impPv46Bn8juIrgV/NiaZRMrII6i7O
	z9yp7Q5G1YnZ4p4+6GyRIyDPtJKnYdU8uIHAVmykhiTXrCz0ajLFIpedQYvP54TnhlaYv2wW2Xeea
	5eeYzPrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAW-00000003oF7-3W6x;
	Mon, 08 Jun 2026 14:41:36 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbAS-00000003o7u-3Ery
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:41:33 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-45f3cf907ceso2074217f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929691; x=1781534491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGTKa5ZDbrqE8PBt++HRT37Y2HMbYqrX7rou7DzMfEk=;
        b=OT17y4N4w4UsRXCj50yCdLaTlXMaZR2utJABWVS4R+wrNf13Q+fZrQmZ4I18Cu8JIB
         FqjGWFz0bO9/GxYxCqOkhv5r7SNXPWxCpfXVzM/ml+ZTmfabVlIDvMbFFAlQmJYvoXb/
         KhwkUXnO3n6pzn9aT1ha8EgInD6zHLFiao/KDyFlSKkNJob8ql+OzeI/6McztDh4t6wn
         iMtBI05uyTAUNIDxjQ61jDKAERBKbvFerNGRniKKp+FhSgi2Nqbr3YoWSY2/01+lfNTh
         6zUnaTUJMI5T+IHcM0MN1KatP9w8DY92xPV+18vOOi4S5btNb1bAl0I8hDX9r33YKo5r
         aAtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929691; x=1781534491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jGTKa5ZDbrqE8PBt++HRT37Y2HMbYqrX7rou7DzMfEk=;
        b=R3KF0M51YQmd2YTU+qQLluapaurAC/veHwNdkLysrEpZkkjUTxHv60ybnS8xA1WnCZ
         E8b8oq7oscUMe7zG1FAHqJvRgsEukEjc4ArDLBN0sIATO/gsxksB5mZNtkXZZJ8UWGtP
         LwilQtGLJyJp9EmG1OLyt0TEb7hLgoxzxeZTP2UC8AT15YHRiRY9YHNaavGvfRuvVHmq
         8xgv+OK4Uude3B+Wg4/6lxTS8G36ESkhVi0xFBAB5DUJn0aQ5jA+xHPc/I/nFC34WpJr
         +gyYtbX1l6wleGoivc1TeqqNPSjcb35W7z80ZzIDLSkbgZMwW0rT+Td5wpIr7zrm03P7
         rMEw==
X-Forwarded-Encrypted: i=1; AFNElJ+r+eaZtJTtoiSgr/d13ObPSULndbYCBJr24WEP95KiXpQFjrYuT1qcah24sloQLtgwHAvEYOEmDdDZb0nNtKLy@lists.infradead.org
X-Gm-Message-State: AOJu0YztzaWmPoBuSSSMXvyPCsweXRA87SvmNGufvp4M1YtCtAdUDWWd
	14a00APBf5SzejPNqlsRaQG/JiaAJHtRj6spf7joAq7vs/zTPX12OYm6
X-Gm-Gg: Acq92OFvmPTaV+NIzpaalfAJQX1zEJ9pAC0ZHqOnVOdvuUaYHWq146FOGm1l+hqfBrz
	fNPLnZ0yDflWrldIot+NF5/4DquV8Yg6QbZpzxYEgT7x93VpkxjaGA63XY9pqJf5IZ+lk0lz0XV
	p9tU+ak17mzf6CNvlIsM/OWyu11llAMwasGKwL6fkzWcKNLoWMtI7TH/kP4FjkdYzBcK/AnmxYT
	+8oHUnWbFVkBa5BCarcPCeHbXh9lV0drldIYxCEkmUxDfswCDw7AouX99RJ8PhR5iXfcABB9EXd
	4if0xlG16DlkSDH+lFIR1YNH1itHPdnHiiWLHMgBdK0hNgr5n3MgxdMWpEcj5Fh9ff+lq1kfQNV
	Wwg++Wh6jzIqtA1uWAvAQ0Gl2kupyR7IXYfz9voBq/ZI1h7D5QlYLKUqv4a9+KE3L8r3ZdIBZDM
	b6FlF0sJyvUGT5nFnOfM/MP//MCiohbjIqnusm3EuV40zVMGu44++7NBsRQlxQMiJRdLfpfASUC
	KYsmnnm2lS3nXa/302jq8lrkG8X5yTh8mreiGqMzJZQ2k/d
X-Received: by 2002:adf:fcc6:0:b0:45e:8866:e58d with SMTP id ffacd0b85a97d-460302ed4c7mr17961168f8f.11.1780929690742;
        Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:30 -0700 (PDT)
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
Subject: [PATCH v5 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Mon,  8 Jun 2026 16:41:08 +0200
Message-ID: <173d32d3a4e28fa3c7678b1e2566d9da3a477488.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074132_885634_E516611E 
X-CRM114-Status: GOOD (  12.29  )
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

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - Add HDMI HPD support

v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 698f02fc39a5..0beaee5f81c9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,15 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3


