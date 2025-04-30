Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A3FC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntln+YOGpHmhFRt+vk8RW2Ng5oNX6WD2cK51HZdX7ck=; b=jkE9bLdYwUBxRQeZakgKSznBSi
	oe1ImuZnJdfGiMe2Ss21YT3ja+5rxhxysf6Hq7ziopV7yEnKK6Sp7wcn/jqIjeQqVjP6UQXCgmjWJ
	7UYGT4oX8+eJ7FyOf0EAJKdzLWfQDf+NlDf/A5HGHDQ/42Zw7atPvSF51JVetjIbRXXBq4oKXfNcK
	DmrszFbTy4IPy9l81ZC2qjWRqzdfwUjI1pA6vvhHlV2yO23oxOQmucLOuHXoaxtQ5kPQyXePo23h/
	xTZ5Q5MsQ//oJ9wmgu/yJewVcGF+xPxlXz6QMOTjGwKLjcbTl095uV3PnvLeeEjkTfsd3NYUTyV1r
	aNhrGq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4L0-0000000CTU1-3sLo;
	Wed, 30 Apr 2025 10:06:46 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3x2-0000000CPIx-37BH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 09:42:01 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A2F231FC2D;
	Wed, 30 Apr 2025 11:41:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746006119;
	bh=ntln+YOGpHmhFRt+vk8RW2Ng5oNX6WD2cK51HZdX7ck=; h=From:To:Subject;
	b=GD4bpCivljCnPyud/dxbHRcmv3iRa5N2NOk5X+AZ0/LAgNHPPDTQO0+u/u5ZQAUUj
	 X8ySqMlB7gJWLQ26lFyOWLzSuV/wQFPnOPnYY6E2lXCZiUzW6sThDOHuW8gNIPQ834
	 9Xn5zoRMjnN3EsVcKQO+TjzaYwU+kWQQOao3SFMc11O8DEXjV6EVjKKxn0A66wL9tT
	 ar8JqaN5iaLjuMEoj3sluzqPfwRVa/MHOBL/pc88ekepxGahCOSjmb0KEpAfca2JXI
	 bEO6C2c1SbD+jlOpXmXwzNiA6TE0SxvmrVjloPgcg8ReNSKDvgBNWw2Jombmta9EKu
	 dPyMWUR2EZMsA==
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
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mp-toradex-smarc: add fan PWM configuration
Date: Wed, 30 Apr 2025 11:41:47 +0200
Message-Id: <20250430094151.98079-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430094151.98079-1-francesco@dolcini.it>
References: <20250430094151.98079-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_024200_937603_14294C7E 
X-CRM114-Status: UNSURE (   8.87  )
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

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
v2: add r-b peng
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


