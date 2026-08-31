Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71191C61DE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 05:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LNImmFjip9P/lpVaILAS3dMs8hBJA59yRwTTGV2O6BM=; b=NVULnrqYh0AB1Ju89l0T0td/Iw
	2XZQ5SJ8IyJaS2sVNI6fXd8ZZjpTa/rva4uh/sxkcKsWiYsq9G5TWubUSFqKbz4rXvy4hVjQ+376+
	q5hqD8brnBMuUUAMfPLocL8g2o5T+IQ8vbvpILDedF8ewR7UGvd3EyxXrk3Esa7h+kqqEoPWWqyhE
	KA7Wtf90EcgM1ldOMch58VqLxrzv2rK9g4WRUHGaqVVo9QhTC3IGvaC33bIhbYammbd2rd3SZfUUd
	mA+1PgNvEKZB/NQSwUzqUOt4oSXEjbGv/8D9q7Z3Qx8EjLD/P/BY205Dt3E2KMnYbnl7AYzALLSpo
	3aAhckVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0ube-00000008Woe-0ZLf;
	Mon, 31 Aug 2026 05:30:54 +0000
Received: from cp2.siel.si ([46.19.12.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0uba-00000008WnV-3OXp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 05:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=LNImmFjip9P/lpVaILAS3dMs8hBJA59yRwTTGV2O6BM=; b=JjCkre5+7Ng6EJJDYTNraLsDVS
	ZWR2oLP146b1aJTftdwZbzJiRzw3NqXVEaHSj5JcK7J9STTpsZCxyLXlGhS6Ute/HkFice9+/g6NG
	zLmeqkLjqXY1yskw0atRyN+iGDTONfDyeAi1tVXC3wsdJF0AMdI39x1WmWAZGVk3pXY9FRe+yU0kO
	vwjQYLkdU/JECoX9vqFwbVpThBAd2BKOU3XerpuYAsFv1qZKZafu/79F3sKEz8+u71wgfXqJrezpN
	Y+aIWfXeflSp2XCxtSzagEhNwo38vE7nF7Fk1Le/P0+Xjh2TaNHZkHnOshOwz/oq4F2q+58SpHTJP
	jaVSdfmw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37886 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x0uJl-0000000E3Ph-210B;
	Mon, 31 Aug 2026 07:12:24 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Yannic Moog <y.moog@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2] arm64: dts: imx8mp-phyboard-pollux-peb-av-10: Fix SAI master assignment
Date: Mon, 31 Aug 2026 07:12:22 +0200
Message-Id: <20260831051222.3298730-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_223051_324982_17D5FC10 
X-CRM114-Status: UNSURE (   7.74  )
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

The dailink_master label was placed on the codec sub-node instead of
the CPU sub-node, configuring the codec as I2S bitclock/frame master
with SAI2 as slave. On this board, BCLK and LRCLK are wired the other
way around: SAI2 must be bus master, with the codec as I2S slave.

Move dailink_master to the CPU sub-node so SAI2 drives BCLK and LRCLK,
fixing broken audio on the PHYTEC phyBOARD-Pollux-i.MX8MP board with
PEB-AV-10 Audio/Video expansion board. Also remove the spurious clocks
property from the codec sub-node, which had no effect in this topology.

Fixes: 7012f551081f ("arm64: dts: imx8mp pollux: add expansion board overlay")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- reword commit message to avoid topology confusion

Link to v1: https://lore.kernel.org/all/20260827065556.2326079-1-primoz.fiser@norik.com/

 .../boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
index bb740f845855..8957b24a7ad2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-av-10.dtsi
@@ -77,13 +77,12 @@ sound {
 			"MIC3R", "Microphone Jack",
 			"Microphone Jack", "Mic Bias";
 
-		simple-audio-card,cpu {
+		dailink_master: simple-audio-card,cpu {
 			sound-dai = <&sai2>;
 		};
 
-		dailink_master: simple-audio-card,codec {
+		simple-audio-card,codec {
 			sound-dai = <&codec>;
-			clocks = <&clk IMX8MP_CLK_SAI2>;
 		};
 	};
 };
-- 
2.34.1


