Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C35EDEBF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 21:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RUhLRAvy5gTHbtCFY778UgEyKl5bwdCfMR/gJ9Hus64=; b=Dh13JbSZhoi1SAllV0BK1WKS2W
	t3ZjjdVc8J6wc4fpSRU17cc2dAMwGrIpiKQH6LzeUOEcz6npb2h214dtvIpcRsR9kFUR+Hz49gpls
	BULddhSTMzOPDiy7NFv3c4zoLaaJ6q+rxTevqJ/txEpn+TPQKPvA9NrEICiRSetdxgmVJbfif4p8W
	5cD8Y1O4MsaBM55v4EHAkx0c1adV3AAlvPGPPRvejtlSLxL9qUIvJKDLYBIkopp70y8BxZ7bYXi+X
	UfSSqbRa5ixCH5o/csEi+OqiVn0cjfDBZ2pE4PVsIM/bGHsv2zMUFllKI96ahqSO5LOM2U2vTs8Te
	Iq33huZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWsD-0000000FwL2-3OS8;
	Tue, 03 Mar 2026 21:01:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWsB-0000000FwKQ-3dIs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 21:01:45 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-48371bb515eso92322585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 13:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772571702; x=1773176502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RUhLRAvy5gTHbtCFY778UgEyKl5bwdCfMR/gJ9Hus64=;
        b=C1rAyxiAIpOuicF5NMYAlVLXApWSIK9dQ+IY9ST22yRnv1TRDjia4OhwzoanYRaT+1
         gdoIwYZ2kBEVVLu4owCx1trSCnsF/c5ctqFt9QXw+JRA3UIEfuJyGTTlWCt0O2kitjSW
         Dv/vs/K2g9Kr08JO/lRczWYmc//GyW0S2n1sOlznxq52C1hzZGMX/fWdndFYlmQA056F
         OuWDpLpUUCwFjIniLCSBxbwlCViym/fXM4UNqimqj4ZlhICeO0J0OxikHrhHkB5j1qbc
         vjCKUcii1H73E06ttBR+iFscnAv+izzXCz1cUfgf3bR1esj48gYXFVEX1kIqb1JXksn1
         vCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772571702; x=1773176502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUhLRAvy5gTHbtCFY778UgEyKl5bwdCfMR/gJ9Hus64=;
        b=MGDCHZ5lgMmTEQ2D/Z899qeVx9YM6YuJF3ReYiorna/JWxSHsGFGuSkK3HLn63if3V
         Q79tSWsZgjc2SmcXItdGnby0ov8Ldwf4O0EkP8+kA89uqscFIlxFbZX9iPi38/KJRU5z
         g+ihTGR7fZKE3whwoQZoKB3OsJAgBCtlsi7WUam5Cxq7KO8ZFW5YzPAIYN6UWZlgGeL/
         YaQipQEdSvJRCgJk88jMsNyFS4vWnWKKnDctqKjXEPKcftZnlB1V5329qidK6MiUf5XG
         M6DFgxld1Mo/afF13UMBGa7AegoIngUILUGC4P+07oek3Uf7HGHL/vyPo43WQ+ZF2gPw
         61BA==
X-Forwarded-Encrypted: i=1; AJvYcCVniVeTtOcft7+gmLq2Vd3WDLi3rmHrqU/9OKKg1X+FvTN5q/y9waSuCouh62zePlOZR6UdMKyLN7eTEbHG38eU@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ8ESk1+YlYZErlzFc2aU4sSf5NEAilhQVyAxfvn5zLAraLqNS
	vbzFRuPwFg65aH9VYlLYKCaUHWYoeZwUWt3GlqaW4QjTvai2/nOVLDJB
X-Gm-Gg: ATEYQzzEniahXMvTJg/7Oj+DBVZ+8maLFjet1JDJTxSgbfHPzfgp9uz+OA2GRb5qUgV
	KoFQHqvnUtfPY1a4XIzUZhc03aelOXw+nAbb52C8NmRQHeO5CfWAgPpgIv9Fszs1pW2Y7Ahedgc
	IGHPXB7+FG3VzhYAuS8gj968i050br2dpwpkkwwecK7koeKBpe+OvIW5P3ZhrLUz2tZxHSZbyCB
	kRGGlL+iAEhORbD3OB57ZKbwYeDDVRHqnPO3bOTp0E19BATQWb4o4dPsYQSOfu8zqdupAqfkamh
	gCBMpNq1sizJxM9Jn6e8FLmSP1j0uHsbTAuldDl+T5rV6XsUrWrBsPSGV6rFnI0CUBD+ge4/WwT
	e2PctYtg6v7Xg0eVQQDcHyPPjMRzxgntycqozl2lsGGhML6qRZb4GHcv/cIZ8+nhL45Nnwnh3Ee
	a8zshWWv+EWgu0Si1bVHQPkPcpjR/1ouonDEfDKNPPSqra57UUdOUgUgo+MmqmyxRjUVp/gK0rK
	Ow0VXNp2GnqpKCZXuqB6/ffB5I=
X-Received: by 2002:a05:600c:4f8b:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-483c9c205a6mr306337205e9.27.1772571701881;
        Tue, 03 Mar 2026 13:01:41 -0800 (PST)
Received: from emanueleg-nb.corp.toradex.int (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851884224fsm3155035e9.4.2026.03.03.13.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:01:41 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Tue,  3 Mar 2026 22:01:07 +0100
Message-ID: <20260303210125.1781197-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_130143_920767_B5C373A2 
X-CRM114-Status: GOOD (  10.86  )
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

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
the M7. The remoteproc framework is so capable to load and run the M7
firmware.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
Changes in v2:
- Use necessary node names (rsc-table, vdev*)

v1: https://lore.kernel.org/lkml/20260303121324.1576841-1-ghidoliemanuele@gmail.com/

 .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..748fd7d9e7e0 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -42,6 +42,16 @@ clk_serdes_eth_ref: clock-eth-ref {
 		enable-gpios = <&som_gpio_expander_1 13 GPIO_ACTIVE_HIGH>;
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	connector {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		/* SMARC P64 - USB0_OTG_ID */
@@ -156,6 +166,42 @@ linux_cma: linux,cma {
 			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			linux,cma-default;
 		};
+
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: vdev0vring0@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: vdev1vring0@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: vdev1vring1@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: vdevbuffer@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -572,6 +618,10 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+&mu7 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	pinctrl-names = "default";
-- 
2.43.0


