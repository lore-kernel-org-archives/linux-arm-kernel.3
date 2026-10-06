Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D8D5CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XG7Uzqb/cGh4cv/ryeLB0/ol/yWUyoRCcQPjjdhCmfg=; b=Nu/VjU1gYlNNZDH05ZEVcwpFp3
	fg3YWkAxylqNW0xzpwkAPQZWwbgKvVOPeLiCC+1DLZNLbuW76S+ZAUR2WeEwH4dC6cfd6S8XSj7iA
	DZ1argtG8apQ6cYUtZBSZlJ2VdDZRgjB1jPfPjpErgkDD0XGVOWIe0Cvfk/QP7CVIUOnV1KPKbVeF
	btJws8GK+QEx7HbxHOlzlO+GFONbnYQv+IK4uq3KbQbmevPAsKYPMgEtVl5wBxJL46Q31/VPmVKdw
	UDWWF8kS8Jok+jPAotbXWfJbx6y4KvezjAOOuBxHAeR3iPzzNZOYTimsXkt7GOZmqZaq9eb3qRNUv
	hi+hWI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Ba-00000000Sww-4A7B;
	Tue, 06 Oct 2026 10:14:14 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2BY-00000000Suv-0aOS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:14:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=XG7Uzqb/cGh4cv/ryeLB0/ol/yWUyoRCcQPjjdhCmfg=; b=P9k/zOG5Qbl2hbbCmKxYlCHEBR
	KX+I2q6FPcVVkQLnrFnalvNNXm3fwbsqtPqPa7dRPDxd7ufJrXsCNNXtnqgovUSsBbUt0JSJADn6t
	T9qsoIlKRPs3qAHtEwxsvBlllneZLxejwgTbx169ACmF60JSQBk7mjYDs+zGkyaCViGNs0kBAXAxX
	TWzNkS2p5AWvKEZhlUI0R3aiWdcnlDySeaivKSgk1UziiuyGYRaiGzCgqYMIwnqIMe1inV3hUdRFE
	AKFLnC+NK/3WHHUTRFfPK14CpUYS/QON6B6kIsxH0GNzMTv6x2AwuMqcYCEs1iyGw6XZv8qzf/X8G
	OdUEbFsg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BR-000Ez7-1o;
	Tue, 06 Oct 2026 12:14:05 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2At-000Bni-1b;
	Tue, 06 Oct 2026 12:14:04 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] arm64: dts: imx93-tqma9352-mba93xxca: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:48 +0200
Message-ID: <20261006101358.2189639-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031412_289252_4E8AE133 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Board has external PU, so internal PU are not needed.

Fixes: ed02d0b9d979 ("arm64: dts: freescale: imx93-tqma9352-mba93xxca: improve pad configuration")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 39a8742de1da4..c4336af3ef1be 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -735,19 +735,19 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x1000
 
 	pinctrl_flexcan1: flexcan1grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX93_PAD_PDM_CLK__CAN1_TX			0x039e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000
+			/* FSEL_3 | DSE X4 */
+			MX93_PAD_PDM_CLK__CAN1_TX			0x019e
 		>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
 		fsl,pins = <
-			/* HYS | PU | FSEL_0 | DSE no drive */
-			MX93_PAD_GPIO_IO27__CAN2_RX			0x1200
-			/* PU | FSEL_3 | DSE X4 */
-			MX93_PAD_GPIO_IO25__CAN2_TX			0x039e
+			/* HYS | FSEL_0 | DSE no drive */
+			MX93_PAD_GPIO_IO27__CAN2_RX			0x1000
+			/* FSEL_3 | DSE X4 */
+			MX93_PAD_GPIO_IO25__CAN2_TX			0x019e
 		>;
 	};
 
-- 
2.55.0


