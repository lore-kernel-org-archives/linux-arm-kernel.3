Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E4AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pt8gLOs/lX9JpW7G1tEA24EG+UwTZRLlrOBDdLjBIn8=; b=ycrEkKp8wbTgOiPIHk3ue7qa9c
	yauOGdAj+X1yBDNXvUCNCNRn9GERXynnoRpWqPzzLHP2/PGkJQrngnJO7Y+HLoH+qeiAXoHM5IKEj
	teK/Xym+T+aaXGWx34j5F1v8GoiNIVhs+P3stoOF+tc8vTkRaDPaHxi864SgzWJ2prJl4zkybhIsI
	9HHdV3rddVlcDObJb4v51DnCqPcKc90y5SpZ6/onxetR4JoIxjE6eHkCJtcT7YDy3F8oDuZ8O4qoJ
	syXC1qwjPoLsn8+aD1Uc8FxirV0VXsvCU7WQ4LvUqrlirTwgsNVUxuQeCGqgtio4c/qCgOa4mXmwH
	ChC30hxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpin-00000001uSM-3U0n;
	Mon, 06 Jan 2025 16:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdD-00000001tWu-2gZB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jan 2025 16:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pt8gLOs/lX9JpW7G1tEA24EG+UwTZRLlrOBDdLjBIn8=; b=Tq08PbMIZOYvFsllSezt0TUPRU
	BjFamBBzhJvMla9sgffKpiadXhnnjxbE9I8KaKOHKiioBCGxK1IOe86uYLrDsBqdYt1y6T7oH0aiu
	hYTCPebJOBahBFuUg+N1cOxN+Bdtw43JdI1Xw/id/NuN0kG6vnpO4JGbMwLrbIJXW/78Zn7tckHxl
	tImiH8f3TACFUDWekD7oJLBLfI2XhwmKrn8nN1QCeqKPyMEO6KTzk3KkYGcHS7z2Rc/BM7FebpyRA
	7+8QBCglP/BV7GfPAGGF0IOV9h78qzkoNgx4dqy/ckojO6WcTAvQcemPpyiuRMlWcwcdNXEXplWcH
	dXEWFBmg==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUpdA-00000008xpT-2pdj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 16:07:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcx-0000C4-KB; Mon, 06 Jan 2025 17:06:51 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-007C9m-0u;
	Mon, 06 Jan 2025 17:06:51 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUpcw-009dVc-33;
	Mon, 06 Jan 2025 17:06:50 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 17:06:37 +0100
Subject: [PATCH v2 02/10] arm64: dts: imx8mp-skov: operate CPU at 850 mV by
 default
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-skov-dt-updates-v2-2-4504d3f00ecb@pengutronix.de>
References: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
In-Reply-To: <20250106-skov-dt-updates-v2-0-4504d3f00ecb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Frank Li <Frank.li@nxp.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_160705_044178_879F2B44 
X-CRM114-Status: GOOD (  12.27  )
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

The Skov i.MX8MP boards are passively cooled and heatsink is specced for
continuous operation at 1.2 GHz only. Short bouts of 1.6 GHz are ok,
but these should be invoked intentionally, not as part of
suspend/resume cycles.

Therefore, configure RUN frequency as 850 mV and remove the higher
voltage operating points from those permissible for suspend.

Fixes: 6d382d51d979 ("arm64: dts: freescale: Add SKOV IMX8MP CPU revB board")
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - no change
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index ae82166b5c266a96441809958c56b6c8a7ef5e3d..7ae686d37ddaca7a323e2cb1ec7d807c2e3bd3f5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -163,6 +163,19 @@ reg_vsd_3v3: regulator-vsd-3v3 {
 	};
 };
 
+/*
+ * Board is passively cooled and heatsink is specced for continuous operation
+ * at 1.2 GHz only. Short bouts of 1.6 GHz are ok, but these should be done
+ * intentionally, not as part of suspend/resume cycles.
+ */
+&{/opp-table/opp-1600000000} {
+	/delete-property/ opp-suspend;
+};
+
+&{/opp-table/opp-1800000000} {
+	/delete-property/ opp-suspend;
+};
+
 &A53_0 {
 	cpu-supply = <&reg_vdd_arm>;
 };
@@ -253,7 +266,7 @@ reg_vdd_arm: BUCK2 {
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
-				nxp,dvs-run-voltage = <950000>;
+				nxp,dvs-run-voltage = <850000>;
 				nxp,dvs-standby-voltage = <850000>;
 			};
 

-- 
2.39.5


