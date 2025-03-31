Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D824C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 10:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGShjO7hQBTExt7fUgvPLyYsosFKagGzgAx5eN0hYW0=; b=WXHeoKzHkHQx1m+5AbeszWIiOT
	2ycF7ciIJFCOnDJuTBC9Qb3eT3mkLHkQlHL//MW2jf0tFC9m0Oggf56rrO/c9mLT4QEYUGZTuGSlX
	rHrBjFIzmIZs8VXMkwtB1wCfe0WN8eQxvKCxBPRgq3Pn3834Tvda0qS26JDTvq9jdreEdWSiqSBN6
	ak/jEqb7/J6xl8UeSavHe/fhjwtBPtGrOJCUoM6oy8HlzjtdbV/d51X+k8fcalTQCTMfwf/FROv7N
	ieHx6byfbMRunrE3aJfoo4V5c7gfqNv2IbTEZJ4FRFsX1urWeytC73bfHTrZMQoOQG7c1DzIcStts
	u81Js19w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCVt-000000005UU-3eQn;
	Mon, 31 Mar 2025 10:37:05 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzCQq-000000004L7-3vuS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 10:31:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 006DF10252BEC;
	Mon, 31 Mar 2025 12:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743417111; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GGShjO7hQBTExt7fUgvPLyYsosFKagGzgAx5eN0hYW0=;
	b=QM4gKkGmU6yXvGHLNPrt5YEh9frQsi1OIipC19nIMlu/7DaST98znafx2pXwYt67Q7qXze
	vqRz3GLwua1n1bI2c/wzPK34K9HYO46Eb+Brvi4KBHfC9B7/i0Ne0bbx3UsOQmOx8d2dO0
	Pr7moHo+G/2cuRkg9QdVdLZj4KYHYh8w9NGWd3S5lXcBuwM/rPAHW1qi529AOYe6VC9wZ4
	BY3PCREQUT4XRX6+1bsyb3dBVyj5Y9qh5KBV+jIxz766+Pix24Q+YVp67jEXBL5c8NdE+l
	2aICupGZ2KjkyhBObiZRe/OwSLXMUQjqU5GjNv/uPjFSriB1SsVBr4TuqVO+7w==
From: Lukasz Majewski <lukma@denx.de>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v3 2/4] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Mon, 31 Mar 2025 12:31:14 +0200
Message-Id: <20250331103116.2223899-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331103116.2223899-1-lukma@denx.de>
References: <20250331103116.2223899-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_033153_120708_3169FC2B 
X-CRM114-Status: GOOD (  10.11  )
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

The current range of 'reg' property is too small to allow full control
of the L2 switch on imx287.

As this IP block also uses ENET-MAC blocks for its operation, the address
range for it must be included as well.

Moreover, some SoC common properties (like compatible, clocks, interrupts
numbers) have been moved to this node.

Signed-off-by: Lukasz Majewski <lukma@denx.de>

---
Changes for v2:
- adding extra properties (like compatible, clocks, interupts)

Changes for v3:
- None
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..4117a5003b36 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,12 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			compatible = "nxp,imx287-mtip-switch";
+			reg = <0x800f0000 0x20000>;
+			interrupts = <100>, <101>, <102>;
+			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+			clock-names = "ipg", "ahb", "enet_out", "ptp";
 			status = "disabled";
 		};
 	};
-- 
2.39.5


