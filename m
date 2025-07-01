Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482F0C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 13:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6GW9qgBuo4yZqE7BJ8SsLe74Zc4+WBZC4gedVEpYg0=; b=JPJIy2o5gpUacS1K1wCh1ldrkL
	wkG64GHjT35Vz3DN9cVaQCcsUz2vHf0zCsYvDS3WM2DJhBfQvXds5cGXfDNxySfD0M/uYHYxXi8lT
	BxCUyDwcYDofjKAvYDzQgJmZHzqIEB8ZeORGFigENajkxlIaYE17bIBS5X2UWAumdyGLDlt2cZWtl
	M6D9e9b5TQhIQ7ou7flSqKqq6CaAWI/HdOZQuur9n+1EZIoXS49LUPwDaqP433g8o2GEb7F9OdO1r
	jbXgovZEn+WUeay+LBLbFuHNiwKBy3Ou5qnvNEEBis2C8Ra8A94XXsHZ7jCR+mCJVgRPxfwzSdJ3f
	ZojKclkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWanr-00000005TJP-3JB8;
	Tue, 01 Jul 2025 13:13:39 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWZVM-00000004vSx-0ADS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 11:50:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7B9D103972A9;
	Tue,  1 Jul 2025 13:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1751370625; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=P6GW9qgBuo4yZqE7BJ8SsLe74Zc4+WBZC4gedVEpYg0=;
	b=QHFS9BvCNUHMoXKHwgfbIe9VOS78vXXrKjG8eAqwbQf4Z+XPauNxYTaK9k04n+iiaOMZ2E
	iwSAxqcJvS0eBlhVGZ3i2m2zM/PAdzvk64sxfvxMaXT2PQ1lKcYOq49nHTjkIVZD8AOTbv
	lL5R7RA+6DjCfbq30hCC10X2JOYlx6pXv/VxecEjkXc2esr+Wrt6LULfRkgmYjqrNKgAgP
	fnsxX91fnv1eoYgEi9/HhQiUq6MaxKdx6Toqj5msFu5nXMK8mVH9uqEtLwtHH8+ieEhD2X
	8pIkESkxOBOEwE2soAY6ESXlQNX/SvpfvZEbxnaRwvpi1usi879tYtlzGE5NMQ==
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
Subject: [net-next v14 02/12] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Tue,  1 Jul 2025 13:49:47 +0200
Message-Id: <20250701114957.2492486-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701114957.2492486-1-lukma@denx.de>
References: <20250701114957.2492486-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_045028_222084_8D0FEDE4 
X-CRM114-Status: GOOD (  10.70  )
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
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

---
Changes for v2:
- adding extra properties (like compatible, clocks, interupts)

Changes for v3:
- None

Changes for v4:
- Rename imx287 with imx28 (as the former is not used in kernel anymore)

Changes for v5:
- None

Changes for v6:
- Add interrupt-names property

Changes for v7:
- Change switch interrupt name from 'mtipl2sw' to 'enet_switch'

Changes for v8:
- None

Changes for v9:
- None

Changes for v10:
- None

Changes for v11:
- None

Changes for v12:
- None

Changes for v13:
- None

Changes for v14:
- None
---
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..8aff2e87980e 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -1321,8 +1321,13 @@ mac1: ethernet@800f4000 {
 			status = "disabled";
 		};
 
-		eth_switch: switch@800f8000 {
-			reg = <0x800f8000 0x8000>;
+		eth_switch: switch@800f0000 {
+			compatible = "nxp,imx28-mtip-switch";
+			reg = <0x800f0000 0x20000>;
+			interrupts = <100>, <101>, <102>;
+			interrupt-names = "enet_switch", "enet0", "enet1";
+			clocks = <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
+			clock-names = "ipg", "ahb", "enet_out", "ptp";
 			status = "disabled";
 		};
 	};
-- 
2.39.5


