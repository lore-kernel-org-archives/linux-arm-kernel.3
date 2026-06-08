Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EDDCD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=; b=1PmB8VgvMJEAhIeFh9xnwmVTWa
	CRT4ugFnJAeBsifig0/JGI7nXG6n3Ct2fcEhUR/43DUEzpZRmLJD8YiOQNnwOquzqn9VeX3+nxIos
	FuuQUHbxLMAJdzhTdae7CC5kTo2wAqaMq9VBLI5+iMws08jMjSoArOywQL/GDxql26ZKn3nLnbNY4
	ud8w1UIpV477cb+MzV1Fow4GNsLHLdvTiZ+LD93CAF4VJplVCuS11wCO43sVOvAF/UNgDGLxGX2RE
	mwoqiu8qhvsfoPJNu82ennQpehfsEYIuzfs/yetNPqPSvIcgzdWgJ7uPK715z4+9+kE7exWDjxCcH
	yvV6w0vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvX-00000003HjH-3pfj;
	Mon, 08 Jun 2026 10:09:51 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvR-00000003HaI-1BYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490b613a17bso39952415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913384; x=1781518184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=Gp+L5TuxXgNDuobuUYSJQ5i2qXVKpzOE3gEaINRQhHjDji/dfAinm4EANiSYEXhqCr
         dDTQRWMzazKWn4O4atbIWcyEdYcBZswEKAQQKAuWATChOz4rOE+6UMp9Ude9nYoaxadT
         KZt/JswF8ki6xarfsScxLY8MaHfHt68Bh/W/5e3l9wk9yWmBfj66VR7wMU0lKrTf8tLO
         hhEEh9A+vtMYU1Y/IiMy0JFCwohvuG1lqArl5EfRsppC2F345xbM61oWu0dMk33bQpD9
         XYLJGV+RoWAR+Ws69Qa6EBfJHUwOUE+eMPDmy/w4AzIoEm3zeb2oWnYGVnur9gGv5BYf
         vtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913384; x=1781518184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htOQd3VjAWSz0jlDfrcFVj0cUTt8KsHKf1+f8ShpfBg=;
        b=XcAVCNwEwUEogbiYws7GKdAgJybkbcFDGo44DpRTsR8RE76bcZTtvRnfPNwtOtdjad
         uXzsetG85W3Cul52GmeQrEjs+Hhe3WH1oycedIDqA4Pz86AvuHgDsE0TT4eFNnZj1uxh
         VbUsY7Z4EopPTGaVKR2qxfidRA1DADVtoIMaoRScGWCpppr7KBABqksSZUvcUD75Y1DQ
         YAP8qDyew5JqUGm9yod2kdPWGxMxSrZSRi27C8HE08VDActoRSRfEPXv2UYIgerS9J5E
         Qb22DbqjEa2qdUQlSTqw4oY3NV4EyCoPpmbbVGXzu0kS/58Ew1v5PLKtOj8jpEdkJ5Kw
         03Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/V9pg15JZZ18mR8/wAA06NVgw0kp0Xv2XVA5W5TuCKuYO4Oy50RWKF9JrM+eI7d00rpQc9J96+W1l+cexk4BbI@lists.infradead.org
X-Gm-Message-State: AOJu0YyeeqvQzxgVCbhAeEPsikIAlRVxCSmPLdUaOine36hMzPIIIbjy
	30l2bQxMzXGYJskomA844GGIWvc6/WpOh/6+NuNGs2rNrW/odbDz1yxd
X-Gm-Gg: Acq92OFIfo2yxRqh8h31JY85R5LzO1ypgRcZTv6DtTPzCVVrc/WCBkKnsbyJwIM99ob
	8Z8mBqTcIrHCqg6H/xF0kr/NXWO6R/PvjmAAZuuHHaP1ZO4IO5R8d2wBYef7BqzW/zEzFFi74HN
	48UBUPDy8Iva3tfkQzu1RpuJWjRNiZ7RxsNwQzgl/dfA6EK+G723Q7q9mAMXoP9y9xb1W1KTflV
	Bi/TMrcRPZDlcjgNTkJBTx/8dUg+48PF0owV/2bhBUX62ylnJRxcECzwhXLtyQ6/GrgGb4NMfTv
	1VJFD9lxEMH+nMkox1Mp9Nv9erLq4q8SlMHq/XqeEJEh0ANbqNEq9Ld3FB0jEiDj3l+dxeSt5RH
	hlIR9DHt6QQXS2OY2VtnIdh5ACQmcmmWRR2gvTRbfzS6rSf6lJ1IJrbnPeSX67rRCpVFriNtTRM
	6z4CRNDH+VjKsFxWVEK0zzNR6ZaI3m9mRnM/Yy6TjTCt2k5U9PY4CMBG3JtTlSM7t3hsWviC/sx
	GV9fiiKZOv0zDzX0U9veFXOMKt4Gjm6tQiEdCtwFf/jEy5k
X-Received: by 2002:a05:600c:4e47:b0:490:9bc2:bf8b with SMTP id 5b1f17b1804b1-490c25acd68mr249144475e9.5.1780913383529;
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:43 -0700 (PDT)
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
Subject: [PATCH v4 06/14] arm64: dts: imx8mp-var-som-symphony: enable PCIe
Date: Mon,  8 Jun 2026 12:09:24 +0200
Message-ID: <46f059124fc039b83ff3b8d9efb2fe3da55dc7ac.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030945_343168_6695F252 
X-CRM114-Status: GOOD (  11.02  )
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

Describe the PERST# reset GPIO and configure the PHY to use an external
reference clock input.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Add pcie reset-gpios instead of deprecated one

v2->v3:
 - 

v1->v2:
 - Adjust PCIe controller configuration

 .../dts/freescale/imx8mp-var-som-symphony.dts  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 34a956c98635..a2becf5409cf 100644
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
+	reset-gpios = <&pcal6408 1 GPIO_ACTIVE_LOW>;
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


