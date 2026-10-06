Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E19DCA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LB/84ZVCwL47WTvxzYSv1yNeUPWFliBH/yRbyUFkjVY=; b=VSX9rtQ95hErgH7ZCtBGvEkFdQ
	m+IB6cVcp6biHzq9AO5XVPCQBI8e+cJKtjVaDwbplPxE+STonxplJyT8BufjO9vfDKDCMHJ1kicF5
	+8/MCQC1qMVWncmAMYHgrKrq7PFSXtwgaqqh3J6Z77hpz0Vho8MHIz6Lfj8bNdLakkfuBm6BfgAF2
	XVG5XJVSgyQ83/DvC5Q/SZ8DA9p+3/OtY3oK7LWDQfW4CV2O/JZlhNITsNWN7O5d/cd/LV3hRu97A
	xzdgarMyMVHgKBvnJWnZJAUu+BRPNrYQ9FlvP9tmmFdUfZhq1WYiE3QoRqn26r3bA8tCrhspFV9Iz
	fxHD9wog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5AZ-00000000r4z-1PFC;
	Tue, 06 Oct 2026 13:25:23 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE5AW-00000000r3t-1hQe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:25:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=LB/84ZVCwL47WTvxzYSv1yNeUPWFliBH/yRbyUFkjVY=; b=APJFysTOBS98WDqg7ECxiTD/yS
	tkt3ZY/DywWzFUaQjYHE7e2uOpPZVroPMoVe2V3YTgp8KN3uYjtMuMcrxicMWSohfpwlSOe+kPfiq
	pgbJl6ga9VZzNkaDhP30W95ZPPf/F99uYUK5hoSzbKzrOBrLuf82RFxxahOYmbvfJCs32PYdSZDou
	5+wmkWam9I7Kv1mW9tHq8hPYQ9SjcG+Q43c5q76O79HpnC+ozvMqcBwgBZ+rmVQZvVtZFAuUprAgT
	pn15t+q0ckqOOa2j9AU60jRElPLL0VghoJQ0gHUf+ZG0gm2kzc3crtNNBfV7DQ8rQHR+kQp0jpWdN
	dSwAUbnA==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AU-0009Tm-0j;
	Tue, 06 Oct 2026 15:25:18 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE5AT-0000rD-1r;
	Tue, 06 Oct 2026 15:25:17 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 3/3] arm64: dts: imx8mp-tqma8mpql: restrict clock for SPI-NOR flash
Date: Tue,  6 Oct 2026 15:25:11 +0200
Message-ID: <20261006132512.2246196-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_062520_991411_98B233B5 
X-CRM114-Status: GOOD (  10.75  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

The FlexSPI controller uses quad SPI with internal clock recovery.
The clock is therefore restricted to 66.666666 MHz according to
data sheet.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
index 9716f24f7c6ed..0593bcb450a57 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi
@@ -47,7 +47,7 @@ &flexspi {
 	flash0: flash@0 {
 		reg = <0>;
 		compatible = "jedec,spi-nor";
-		spi-max-frequency = <80000000>;
+		spi-max-frequency = <66666666>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
 		vcc-supply = <&buck5_reg>;
-- 
2.55.0


