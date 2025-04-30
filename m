Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44961C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDF8Z3RJZY5FcXZfk/EqiMQX/cKRyGAP1fzBEqQurz8=; b=qN1RO8RfVvohCCOeaS1N2M3YBE
	8tmS6ZTSqOeQs0lJ8MOY6dY1RVeIpF+65bJ1mjE8wnVFFzKO9k+w1QxDDLJWB1dDh847ha4rxsnwv
	fMndn7vDi6JRUZsYJfCLpIK415zDzS3cOOS8oThDyHe4xwIqEpXrpWfhMN+aMX5dZJ24YsC5IMg66
	qcvYFPomEfg+TYsvgteJbEK9PJc1GZ2mjlut2aULoMLedGcBQP/h4xNW+jIuc4OdF+VNLgcEqQXoQ
	TWDTUJtDXRumFXa9pBCcOLsd6Kh7kAhsK4f81rE56osXtOBzgP5ZselU63ABhG6j1eeCvxulK9sLq
	Hpm/1d4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4Oo-0000000CTwm-1aWI;
	Wed, 30 Apr 2025 10:10:42 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x3-0000000CPJ2-14L4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:03 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5A2781FC12;
	Wed, 30 Apr 2025 11:41:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006119;
	bh=BDF8Z3RJZY5FcXZfk/EqiMQX/cKRyGAP1fzBEqQurz8=; h=From:To:Subject;
	b=pCpo3arAcXqLGP+7qpvoxOq5GWTB0NR5nTdNKIHbkx4GXYmPO64QZQU/Kj4pdWMWO
	 x2OZ6VreGd6g+f1OyID5sNPedzR+NfFqRJY9P6PwxHjBlreHMBgbh+NZNNB12z2Jh+
	 YA+lZNZucnqFBeJvwjBhsoEISeCcev6p2mRREPINXaFR35d3N6PugzbXyBe3mH092Y
	 0I/g+JIRaxv/EGXEG8RRLYtTu+juk1Z3OG8qQbtZjOY6PiRT/7V4OeUVh+z43vx2bZ
	 4HGVx0HyTC7/CFHx1x6A6HAgr4XlPGgwA/e6QOPmOh/b7nrRcmn1BnjSxa9+eX1dor
	 E8igKrGaBTMkA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [PATCH v2 2/5] arm64: dts: freescale: imx8mp-toradex-smarc: add embedded controller
Date: Wed, 30 Apr 2025 11:41:48 +0200
Message-Id: <20250430094151.98079-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024201_452443_31962A52 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

Add the embedded controller node to the device tree, this is required
for reset and power-off functionalities.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
index 0a8b9eee5ed9..c4ca01ce60d0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc.dtsi
@@ -534,6 +534,11 @@ reg_sd_3v3_1v8: LDO5 {
 		};
 	};
 
+	embedded-controller@28 {
+		compatible = "toradex,smarc-imx8mp-ec", "toradex,smarc-ec";
+		reg = <0x28>;
+	};
+
 	rtc_i2c: rtc@32 {
 		compatible = "epson,rx8130";
 		reg = <0x32>;
-- 
2.39.5


