Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E0EC1436
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 12:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gqNb2+lvfz7Zcwb57rdSTxDdzqT6Z0aXOwyE7epiZnM=; b=SqV8OzJj82DzBzizvLNqXJJNmE
	fSPtJuav7pFriJ/3Nf2QeSpQqFh2votHgFS2GtFfTHqgC8w02b4/jslmVtuLEmEk8nq9F+F07e16x
	xPgg2Gd8k8td6+WGdUvUDfb5FlCX+JNCCeBB2fhyq1lG9FTLDkU++QbsDCZm9adOApJZ3KmZeTf5f
	0VYD58D4gDFDEt811EfymqlYgwvXxWluYJEdSQcDhZMBlpFsh6wE/4zoFngekB3SclN7vtwBT0lDV
	sBLDU5qwAfo+Ip1wjqO7KLMIsXz0PMN8+n4KnuMR6eVSlMeelmhSyGTOD7nQP9qxDWSowoA0Kp4ru
	hy2tap/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOdQ-0000000F86E-0Kl7;
	Tue, 03 Mar 2026 12:13:56 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxOdN-0000000F851-3bdW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 12:13:55 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso47688435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772540031; x=1773144831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqNb2+lvfz7Zcwb57rdSTxDdzqT6Z0aXOwyE7epiZnM=;
        b=exyLQ4HiGP+jSHvIG6Lm6C3Jj90BjkT2cpdo22/PfXGsm3xrJ9ajTZym+zBtYjepNf
         slrCIzczB+xXtL8hVfGZZ+ZqCjnwiinW9DlPCDtFxxxswPWboLPCmiL1URLKIw9L6tFf
         DDGJYRU/42C4hfVQHfxk+5PB+ZibsFiiHg0pr3N7pnXyPG6awP6s6H29O1l4xnAJniUc
         31O+aOkQ1HysTYsde35eZQNqaRV6cVgQ0APxecwVV9rcCFKZmMVLWtzkAovP3GqcIMGt
         OvJPkQRXVxY/O4nsI46+UZ011mTqZX2YGGGKw7SwiTYAuK64Bj05TgF2S1itf5p+VBIM
         7cVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540031; x=1773144831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqNb2+lvfz7Zcwb57rdSTxDdzqT6Z0aXOwyE7epiZnM=;
        b=W0Mu8tvYxI9ZKUr3cKMMjlXvZBlBBzxT553RH321rtlVUr1P9Akgy+2iMeQANsxnUS
         njZSQ8n2JAokJHv4ccdz9cNHdxe3cuntQL78DPxYuQzfH84curikcPwQE4ar8L0lZUOn
         SUoZNFgSLIbL8FJ7bLT1LOrZS0mXisnsyddVzKFsUnbhZhwxQNb7SjihSK0ARvJoqkHS
         MD6ePlhC2ngNTPpbgoonO7X6N3TbTIBvfr86waIqJkZO7MLoZhju5wzN+4PaqQe/Kv6p
         5tPKOzx8LR9/XZbYfcu8KGSC3L10+xGwshrNjOABoH2WzWdSzPc6wNrfrKm2jp4uZpwq
         WsPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjDoNlPb0SOchP7o6cdkagcBoOHPbvrvbRcU0KKqCo70zrkhtwHgs+rc4ZP1rJRViwMUZFg+LqU6EEmkSqkx3Q@lists.infradead.org
X-Gm-Message-State: AOJu0YyAPbCjDcpMKHz9lii4HESGu0pqNJRwIjJRaAtyEKhDVAjnNBW+
	FVbsdXPRYKugWMRtmTFNvFqCb5H9wAhBtz+zsRfzkoitZAV0njcqc+CE
X-Gm-Gg: ATEYQzwk5JPTHkHcDBs0nW24LH7gyZink1EiZh/av8c1I6RdiFl45QJ7TY7ysa8T7lV
	9K0I51LQrI+y5Hel6gR3x3BgRl+GDGSUU8sSq5Je9V4WZZbtZ6jvPS2OXRGk20iP4NwCkYStKT3
	CL1WVrTUaIDjGG2O4JUEexQRh3vI2AbmFrjGS+VjY6WaDCvx9GGg+dM+VgGYCm+aKKqjHd09z2q
	VZyYDIjV5o5J1S+vlZ656UqgcdiOlPUBD943WxB854XH9a97d80zsqM+omxuSCoXpG+xSYx8xKz
	/uNdz5dbqwa5BVpFcZHV5SI78+toSz/ToImins2rmj3WNivf8FuRhhKdHZpm+C+VSlr3L3jVMDM
	XQZRaXfKto7T7pYyfymdyHRyeFvhPaAG9ivpXxk/X4dbFh8OcEhzx3/B4F++8AqvOHP8/cxsA3l
	0lq/lYJicrgYTslnRKjKgB7IeARxeMMn5uOzC82SNDc8Dapl/XOPF1thN/tWzBNk918vf+cDI1r
	yvOk/BrUvtxznQt
X-Received: by 2002:a05:600c:4fc8:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c9beaca0mr330124105e9.19.1772540031180;
        Tue, 03 Mar 2026 04:13:51 -0800 (PST)
Received: from emanueleg-nb.corp.toradex.int (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm33572593f8f.24.2026.03.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:13:50 -0800 (PST)
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
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Tue,  3 Mar 2026 13:13:06 +0100
Message-ID: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_041353_922298_3374C52A 
X-CRM114-Status: GOOD (  10.81  )
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
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..77c4a6dee098 100644
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
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@88020000 {
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


