Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E155AC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXTuSMGd8l6xiETy9iL51EGAd3jYYjaKHb2pYQs4FuM=; b=khmUcBBKwXC7CCHo2WL1O1wUyT
	lPt5pQ6kyRYzlbETW1ZJUL9oBQCpZVL2E9BWAze5LH2zux2jzbnZeaSfVV3MDYvw08JIiOW5A/hit
	S5qkgZAk5+Nq2b1GuflEhrqo78EzJRpWwPWrZTQsoX7JMFMMBGsI1u2TI6/QISb1OnsflYxjkev+a
	sLQolEJoDJmLpK8NQ3rz4xUzWivdm0WoIeeZTzJvrTUAsPXzl1D4U0XyuOdOArYMPQr7iklVNCgyr
	ONuqOFjxeOyWEeEINiCKLoLMUzeSdtk/38lu1GrNujNUf8mD5csvSWHb8fSEYZsG7msOAWhk5dTns
	VPmzZNHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KTU-00000002INd-1aPI;
	Mon, 14 Apr 2025 14:07:48 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4KNu-00000002H4Y-2Pxh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 14:02:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 565A51026CEBB;
	Mon, 14 Apr 2025 16:01:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744639320; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QXTuSMGd8l6xiETy9iL51EGAd3jYYjaKHb2pYQs4FuM=;
	b=T2TNgdWL2jZmm3JmJwXML/fNGxKmHPgrge3k3vWPzw+j4ghl5qtLXZtL9ZmNjf94b9cvrd
	FVNtA/DPqKz5RsZjHZJ5BBadOLWCNdVkLj9iE7zN+MFDwUhaEFsy98FiGlRo5bAcM2gFbz
	u/CuSApJIEXf4SX2uITj5TjdvO6KBfIkbWmPP3R5xNt+8YJPOG7d1vCpF4Y1PcdsEVl2lT
	NAaKXwJtAf3TlYJEYZphH+AWrhnns0BVAc8/Mw8I9oX0uloE3TgKM9O/0u+mjrFzlqW8xm
	tRzyyKRR7MwUrOsAjxTaPCRM9Qa39fIERjD3w68UT4V3IRxDH1TnS/YHRmQNkQ==
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
	Stefan Wahren <wahrenst@gmx.net>,
	Simon Horman <horms@kernel.org>,
	Lukasz Majewski <lukma@denx.de>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next v5 2/6] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Mon, 14 Apr 2025 16:01:24 +0200
Message-Id: <20250414140128.390400-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414140128.390400-1-lukma@denx.de>
References: <20250414140128.390400-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_070202_754448_4C682CF0 
X-CRM114-Status: GOOD (  10.17  )
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

---
Changes for v2:
- adding extra properties (like compatible, clocks, interupts)

Changes for v3:
- None

Changes for v4:
- Rename imx287 with imx28 (as the former is not used in kernel anymore)

Changes for v5:
- None
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..a0b565ffc83d 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,12 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			compatible = "nxp,imx28-mtip-switch";
+			reg = <0x800f0000 0x20000>;
+			interrupts = <100>, <101>, <102>;
+			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+			clock-names = "ipg", "ahb", "enet_out", "ptp";
 			status = "disabled";
 		};
 	};
-- 
2.39.5


