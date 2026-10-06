Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ED9CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBX7y9Dvx0JYFE1OtZUYqD4Au/PXvpJQYPvyzoWixqg=; b=vsH7HQIwzq8leKnTUzSm7cbfNt
	gLmC1lE+I/aqNRJFqaIX0vXDXc4wrTH0Vr3EMGvZ7yk0mE6xOySdxkA+cs7wKqKiF/LxkV7u2K6mX
	MSBh2kyt2MfxU8GridrKWU5Y1F15SuZXkbVQiak1MYjJxF0+QLqv6KexR2wcBErqoLRdo/geLTn2l
	SatlehNzYBICu6EyrlDOjGxO+qWc5vAqsXrBMquL1udQrMtujD3f/FrQv5uKLM12R2jmucc1J5b+/
	jWPDW8aCi7DX0dDmbmTuhsm4mwiBh23LpBINlTzP+bRERWIziG2gNOinV4xOnu1jKTtNLa30fmYUX
	lxcmnfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Be-00000000SzG-3Z8h;
	Tue, 06 Oct 2026 10:14:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2BY-00000000Suy-1YJx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:14:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=fBX7y9Dvx0JYFE1OtZUYqD4Au/PXvpJQYPvyzoWixqg=; b=YmP1+h5uPnQbsxlOVLIkoJG3vb
	ABj8pZSxFtSUGaBDfRj+NxJeisIc+dx5vTTF3nDFXMscpUvBZfZLQZzevCIAsag0zsZOthBDhZSQV
	EKjo6+wiBZUk507NL4D5uLIFR7wDZfcT+/chXKxb8GwLArLIWdCFj+wId/HYi5rc7fZZ2isS+309G
	DlCFwtE31jCD6eHNvti0FsRoRpgWbjwShDgHjNU+D9CmrvNu7Ta2c9RMA3YHX1IvuLm+QZuzwenGI
	CjnVIXW+ymmnrR6fL/DOBjEQ9yn4RIeDnWkwZBZbI5BtzoFREAhDF2IrOoIAAUj1S9Xryrq+QWr2y
	9bK3P6Lg==;
Received: from sslproxy08.your-server.de ([78.47.166.52])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2BR-000EzG-3D;
	Tue, 06 Oct 2026 12:14:06 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy08.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xE2Au-000Bni-05;
	Tue, 06 Oct 2026 12:14:05 +0200
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
Subject: [PATCH 5/6] arm64: dts: imx93-tqma9352-mba93xxla-mini: remove pullup from CAN pins
Date: Tue,  6 Oct 2026 12:13:49 +0200
Message-ID: <20261006101358.2189639-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
References: <20261006101358.2189639-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28145/Tue Oct  6 08:26:12 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031412_412586_CBE0E2BC 
X-CRM114-Status: UNSURE (   9.95  )
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

Fixes: 20288505481c ("arm64: dts: freescale: add initial device tree for TQMa93xx/MBa93xxLA-MINI")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../freescale/imx93-tqma9352-mba93xxla-mini.dts  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
index 0d553a8da7135..d1f63aa9312ee 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts
@@ -477,17 +477,17 @@ pinctrl_fec_phy: fecphygrp {
 	};
 
 	pinctrl_flexcan1: flexcan1grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX93_PAD_PDM_CLK__CAN1_TX			0x039e>;
+		fsl,pins = /* HYS | FSEL_0 | DSE no drive */
+			   <MX93_PAD_PDM_BIT_STREAM0__CAN1_RX		0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX93_PAD_PDM_CLK__CAN1_TX			0x019e>;
 	};
 
 	pinctrl_flexcan2: flexcan2grp {
-		fsl,pins = /* HYS | PU | FSEL_0 | DSE no drive */
-			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1200>,
-			   /* PU | FSEL_3 | DSE X4 */
-			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x039e>;
+		fsl,pins = /* HYS FSEL_0 | DSE no drive */
+			   <MX93_PAD_GPIO_IO27__CAN2_RX			0x1000>,
+			   /* FSEL_3 | DSE X4 */
+			   <MX93_PAD_GPIO_IO25__CAN2_TX			0x019e>;
 	};
 
 	pinctrl_gpio2: gpio2grp {
-- 
2.55.0


