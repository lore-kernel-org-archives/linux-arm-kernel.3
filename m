Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45ABFD39410
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 10:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RwpJzCL7Lr8TkyLgWHg7Ghg5pZTTcT+TXyI+ra8kLE=; b=n/XmZbVtu2lNolxrfUpPrIW39p
	/B4WYFILQRXR+4oI6rRUi9uEpcl4LTA326kbWNBMQe7+lebGTdIbmsoifmzQAWdt86z/DfTD8+U/K
	3m/Hj3YzR3wjpqiM88L1zKMUe1k1CQi0pxaaKC5FxjkWNq+SiAjkhDL9bywfdQdqkyib/gFJCvpAj
	m68C0pj0qep5DqoGngA2WvynhvdlhJktv45d3YnHBLak3dbFnH9Zog3LyFJdKu3Rp/Rk1nUOLJXi5
	8vGZC3+gpwkBs2RUhmLGjMDG13GkpoGaRRag7j7gczUu1hn4uHZPrZSmd+wbzbFL9Cbz3toP2D4yR
	SuKMLdCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjZ-0000000HSm7-1YZH;
	Thu, 02 Apr 2026 10:57:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjV-0000000HSfW-1foC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 10:57:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5RwpJzCL7Lr8TkyLgWHg7Ghg5pZTTcT+TXyI+ra8kLE=; b=qo6C+J5w9AtnmIKURHXlSchs4z
	VFS2RhX5Wk2mCCID/w3eYzWuXQiVu1HAoZDm+A1UXiWiQd7z0Ko4W2q3J03hr3lxx9/cQ8eO7JHr1
	nVL87fP9SLj3bkEyfQUkwCbLzTvRoHr8Y1gGbKjSLWKJhoboTNLSi6wlg7uDaWnkuswgZS9g+w0/Z
	4dhy4S0Ty0Dp+PdosUCZZ3pYR/2sDciiRPO3CsM3to6ABFG4u7yaWuWUAUAuWs3AZD65ZJT9pVcO5
	azvhoqgAyhCTw+zJazRdjO09qjmtFpROh9qO7Vs6UQMf6tUETiM1KG9sW54+b8HJzC6LWbd5JH3HV
	QxahLftw==;
Received: from cp2.siel.si ([46.19.12.180])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FjQ-0000000CADf-2IFi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 10:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5RwpJzCL7Lr8TkyLgWHg7Ghg5pZTTcT+TXyI+ra8kLE=; b=NmdUmx9ffuL67TRnDP7u3xL+Ha
	bUwNWOvlGC51sQbp0PYMekm/hPQXbISKec9JLYKNIjETyqqLSOfno7/FPc9P1DXAhZPLmipZnBqET
	pXVCvUVuw/YaPFe3jJte3UecdAtQujQ3YrH6fXmUDFX97LI64yJRgDVcgSOrAfT2orfWQkuz5Hm3n
	5l1tpPQvrwbAOhoyjx0giJ1NJWg0N7UGxW0itjmCYu4jIbKUJNGpJTy2nKObwal5bZAuik/CMdou8
	GNzJiALVtHqYUiAMd/oe52+cc0dOsHSP5+FoXXci7aS4YjJVsmy1KVSgTAlWnMy8cP1AR8BWWXQRA
	r8Gcf+BA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52086 helo=florijan-nb..)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <florijan.plohl@norik.com>)
	id 1w8Fig-00000009fYO-3IPa;
	Thu, 02 Apr 2026 12:56:14 +0200
From: Florijan Plohl <florijan.plohl@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 3/5] arm64: dts: freescale: imx93-phycore-som: Add gpio-line-names
Date: Thu,  2 Apr 2026 12:56:11 +0200
Message-ID: <20260402105613.1303871-3-florijan.plohl@norik.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402105613.1303871-1-florijan.plohl@norik.com>
References: <20260402105613.1303871-1-florijan.plohl@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: florijan.plohl@norik.com
X-Authenticated-Sender: cp2.siel.si: florijan.plohl@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_115700_888991_8B72DFDE 
X-CRM114-Status: UNSURE (   4.49  )
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

Add gpio-line-names for GPIOs with a defined board-level
function on the PHYTEC phyCORE-i.MX93 SoM.

Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
---
 .../boot/dts/freescale/imx93-phycore-som.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
index ebc57841f27f..94eb04ace96e 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
@@ -90,6 +90,28 @@ ethphy1: ethernet-phy@1 {
 	};
 };
 
+&gpio1 {
+	gpio-line-names = "", "USER_LED";
+};
+
+&gpio2 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "I2C3_SDA", "I2C3_SCL";
+};
+
+&gpio4 {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "", "RESET_PHY", "",
+			  "", "", "PMIC_IRQ_B";
+};
+
 /* I2C3 */
 &lpi2c3 {
 	clock-frequency = <400000>;
-- 
2.43.0


