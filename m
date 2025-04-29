Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB35C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PokJSTOG5zd/anxcd7uUPUPOQ4Vx+sK8YVmDh339/pY=; b=i40ftj1KwF3HSQTk7IQdhH6rg1
	WCSplur0QbJjyJuT53Z3u+WmpyPGFe73gAdZLm2CeiihsiLfOH7GchkyG20wK2UyLrK/QtIj2VMve
	9UFF5qvZlZaJTeFcuUxw6M6weGXKj67NFtABHBq8H8gL2tUbIxH40H6wOZ0/1e3ezVywVhm/VAyLt
	xFLj6ccUTu6E9i7TJpLwbaQ8laiVMdxVWS97FmXJptD+9lSKEiaJ4h5ROQcErisnip63QHPheff/V
	KcDExHb5r5g2dqoJjpThJ+sS9cAX5WnTggnrJj2nMGN0Hr+GZUuqo/ERbP74j+ADvcp5scBNrQWJ3
	dhP2PUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jL8-00000009Vcn-00e8;
	Tue, 29 Apr 2025 11:41:30 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jBX-00000009SHA-154a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 11:31:39 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 4946E1F980;
	Tue, 29 Apr 2025 13:31:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1745926288;
	bh=PokJSTOG5zd/anxcd7uUPUPOQ4Vx+sK8YVmDh339/pY=; h=From:To:Subject;
	b=WfF4t72MyB0RQPREbaMmZFNQZfzj8tZA3cxe/ZJIFfmGU+/sALtXegLHgSTFGvjEy
	 bdt0k+2FVdhUV+vv8xLzzxWRS+9JsNJV1eL1/gLORKCMwxRAQz2LBboGH4WTk8tTlq
	 nESJ99jgT8Er6u3L0uutpjfaQofOR3WzK37hLNG9p3FvsbJmZV4laE8jDIj9khNcg4
	 iMViZfj7I5SLBTq1Rasi/b53ptQ0LOMRKe7qnUa3oRBG73zui2TwBdDZmOifDam3q6
	 fsqxonpsl5EZqPu+Yl0M9ElaeJH7pYoX7EQVHvyImWtLHBZHFc2cn67ClyUJCEPl5d
	 hWMBae0VEmL4A==
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
Date: Tue, 29 Apr 2025 13:31:16 +0200
Message-Id: <20250429113119.124427-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429113119.124427-1-francesco@dolcini.it>
References: <20250429113119.124427-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_043136_326199_FB8EA6C9 
X-CRM114-Status: UNSURE (   8.85  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Configure correctly the FAN pwm output (inverted).

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/freescale/imx8mp-toradex-smarc-dev.dts      | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index 581f221323b7..55b8c5c14fb4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -3,6 +3,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/pwm/pwm.h>
+
 #include "imx8mp-toradex-smarc.dtsi"
 
 / {
@@ -205,9 +207,14 @@ &i2c6 {
 	status = "okay";
 
 	/* Fan controller */
-	fan@18 {
+	fan_controller: fan@18 {
 		compatible = "ti,amc6821";
 		reg = <0x18>;
+		#pwm-cells = <2>;
+
+		fan {
+			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED>;
+		};
 	};
 
 	/* Current measurement into module VDD */
-- 
2.39.5


