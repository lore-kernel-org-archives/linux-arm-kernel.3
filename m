Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD8ECA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=; b=pZnQ4LqDI+1m+6+8UNqLAa159f
	iCzm2yXKFtJjJLHI1S0JkOiTbEsuW7B6OC/ctonOZUwZbZoKDZIka8NV+coBd1FH1OEw0FY1LZd3I
	+VlmfEWAO+X8vVYxDOqDdWMMyhdxGtHZeSYSWMCWcdzaf/FtgHgkitXVoI/fTb8XV34AEfpR9oiC5
	4TKDK4/z+aRqAXAiMhIVCsQzCs7PZs1EGeqivyYM/EaHQ/Dv/kYfaP9aMin6bS5De2cCki5KFXaYk
	q1F1a6fANsvqieWcPGOYhLP+boULtyb/ZwX3GyxkBDRFyAQU5t5XawCdYvV4RBWHX0MCG3wwi9IdG
	g9qKF2Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNv-00000008E9j-3WA7;
	Thu, 01 Oct 2026 08:43:23 +0000
Received: from mail-wm2-f13.google.com ([74.125.225.141])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCNs-00000008E1h-0FWX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:43:21 +0000
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so39049005e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 01:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790844198; x=1791448998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=XVhjUMjKCkI1mKDZTBInWJwbRkOO9NhZ2fb/cl6YmAqdrjzBzAHjJmTa0vcAo1JZMX
         q6uKeY4KObhIQ2qVSEsEc40garkZy4fOsKzuUGsSpYeo0uPdw5mRnZWDps5YtZfPTe5z
         v8CpgsvaH9CUbVl9nisJKDO8h/not0Yrzy116G0LnU0+FvI0kewdEErr+hXv+RUCJkKd
         NO2E5DUuz09KSaHi+H4Oko+xzq4BjHQApoV01n5HQmDtGf9M3rNqzb74psnScI00xak1
         fB2O0pcv4ejswYbAq5f8qxaQ68HKwH63XBZRWAZJnuomQZrCP+H6QW+5mvCKtRp87CK8
         17iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844198; x=1791448998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Atuw9lBz57e/hUpSiZ8WQ/Sj4OSIXL2+X4pHB8jkTYs=;
        b=DYO9QzhMZ/AGPueUBcPuj5eAe5M6w+kNGDTSco3yeRNeeQRDhcV6zZ4P4RnfSu/ZN4
         Jccpwvy7uMtDfHPiN4HRPIzUT29vU4In7Qt7WHu11sah7IVq8osDfhaeIEuq9OuT8d2d
         vQiUj3TAsQuANVLyh/OdyEP8xLQemihIKtk1r3mHvohAN4VmsnQTgIr1Op8iYERTngCG
         +/hez+RKAvPcI0kz7ejZVgrsYQg0wPlD8qhI/b2eFE/PhjyB1Em5JBZUZ6JBIrIUaXon
         h95zIB3XFqMdNUmx2B+ElKQ9HQKv6A8BXuUy/kTdpELvSGsKRhePoUw+p7i1TKVTighP
         HfZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSX0oo7MXA8cJAv7v0NAYRdfYokbsWx/i9QySVaVe8Xo6pXX457M1E++K2C+zjcXkMFvbVLt3YCuFFr7dTryMC@lists.infradead.org
X-Gm-Message-State: AFuF++n9kltOZwxdivHDTbSrDQOuo91vIUbx3X6f9xxTSeZKqoMcvyG9
	g7jYLArRwvMFGKmrPaJ+DxIi8d7lzKq9VGxv+M2QKvarufMZq4GhHST3
X-Gm-Gg: AYBFou3snHUzalKnjzEOxLxI6bKf5HY+CdoORhp0jCrN5+yGJYUobVD5KX9d7KIzfkD
	qIaQKyiDBNRksDWhHtZdKjcmY1ByzAtuEklPfbel8wnOw4fKZYoRpFWTninnDE4S6v1aczP5dN9
	8vJOAHVOHwa5aptreE4c93Oiyztgd0PAmg3/Iy4uIEFSKD7JZbvjdU0YWqA4bLtxqLJ2sdSJkgI
	oyazQ5u9OPCVAokhIZ+1/W5e7RzdhGqtjZpncGq3YOCOwljUNe2JmShN3pH+3yZiBbfoVYM3wUX
	t+Fc2MgxNTMQl3zut/4u2pdmrPzifgxzgOErW6b33EE7zIBtrUeCgAl2zjVonum0EkTpbgXD678
	ITSRDhwwEhuK9EyrtW9irVwqUDaPQhTp17gR5TRwymg7rg2uiMRrlRwA+3N/WdvCvK0hLD0iUqs
	S240uVJ56giNZZ+ui6FOyc04LxYVa/+A8kV3NMVrjli3HYrrTTH8C0DaC2txutygkPkKhuW6p7O
	w/uRg+ItMuaat3dc+4A/kAWNxWQq+Qy1JqcTWs64gvpoJgEd2YDE5sgXQEO6+yTxbsNeTyprw==
X-Received: by 2002:a05:600c:4445:b0:4a0:1b14:e845 with SMTP id 5b1f17b1804b1-4a01b14e85dmr65548535e9.2.1790844197683;
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f949709sm78177885e9.12.2026.10.01.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:43:17 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 10:43:11 +0200
Subject: [PATCH 2/3] arm64: dts: freescale: imx8x-colibri: Add Cortex-M4
 remoteproc support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v1-apalis-colibri-imx8-dtsos-v1-2-21881dc324c1@toradex.com>
References: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
In-Reply-To: <20261001-v1-apalis-colibri-imx8-dtsos-v1-0-21881dc324c1@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_014320_167618_AA39A21F 
X-CRM114-Status: GOOD (  11.13  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4 remote processor available on the Colibri iMX8X.
Use the same entry address and memory layout as the iMX8QXP MEK.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 47 ++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 2415487d3a5d..b71bffb9dad4 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -86,6 +86,18 @@ reg_usbh_vbus: regulator-usbh-vbus {
 		regulator-name = "usbh_vbus";
 	};
 
+	imx8x_cm4: remoteproc-cm4 {
+		compatible = "fsl,imx8qxp-cm4";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&lsio_mu5 0 1>, <&lsio_mu5 1 1>, <&lsio_mu5 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+		power-domains = <&pd IMX_SC_R_M4_0_PID0>,
+				<&pd IMX_SC_R_M4_0_MU_1A>;
+		fsl,entry-address = <0x34fe0000>;
+		fsl,resource-id = <IMX_SC_R_M4_0_PID0>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -97,6 +109,37 @@ linux,cma {
 			reusable;
 			size = <0 0x1a000000>;
 		};
+
+		vdev0vring0: vdev0vring0@90000000 {
+			reg = <0 0x90000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@90008000 {
+			reg = <0 0x90008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@90010000 {
+			reg = <0 0x90010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@90018000 {
+			reg = <0 0x90018000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@900ff000 {
+			reg = <0 0x900ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@90400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90400000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	sound-card {
@@ -487,6 +530,10 @@ &lsio_pwm2 {
 	pinctrl-names = "default";
 };
 
+&lsio_mu5 {
+	status = "okay";
+};
+
 /* VPU Mailboxes */
 &mu_m0 {
 	status = "okay";

-- 
2.43.0


