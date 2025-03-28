Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EA1C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 14:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1CHUT7A8svC7k0JjC+awC5nlDgALOXd9WqES3LP0q38=; b=AQXc795sh5AvnQ3GEMFvYajEw5
	zidICBODiU3IAGMPKWK0tb59l2TBWAm98avPDxntXugFvKdMevzcJh6GT7GZU8mtyCDSzy9CoPXsM
	nfTka8wqKf482KQ+caND4EdZrB9q0pmKU5tOaA7Lm+yzuQuz5bHVJ/XPpbP2CsxsfU0fjDtRKOSIM
	Tq/EQHkKr3yj6okuH1UZLNnvzRX3ds83j7F40G6Nra0Sj7vwMsXveOCd5hFGL+UkciEd28detmUYr
	H583lyiLJJBWH13rdDCf71ZMETzdMVW9rcCyTqVxWHgrjA+2NFcGkDlaPxw6Z7GHGwtUAqyG/qzxy
	flJieCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyAnC-0000000DcGj-3b2h;
	Fri, 28 Mar 2025 14:34:42 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty9sd-0000000DRsF-2sDh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 13:36:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A2C38101DC311;
	Fri, 28 Mar 2025 14:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743168974; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1CHUT7A8svC7k0JjC+awC5nlDgALOXd9WqES3LP0q38=;
	b=D2iBLSLyr2iCrhoabMd1l+A1wK3dUONF0pLxs2Dpurcz7pjmk8nDlspiyUHTNAKPAGujzp
	Qb1QORs08SkYrTjilzbD6KjepIGVZp2AFoBmEiIICtvFe8+FRFjM3MF/vwaUWtqL2wEwxN
	I7hoCY5vUAuMMbt1vwtNkmnmf8THnMzF6JA0Y8RVgqpfX9GENDnuQzo6sShRLXlZ1VjJek
	1COBmjobWILmJbJXHIaQ0rwTQ4BPc4GIV2z2hoB7/JPR7xwOJqWmFOmJjPBWk3upV8e6Sb
	hj/ILcN9+8JN0rGuIIMLaM+hoAc8i57gPh6mFzIRhLXCRk/pOFQm0S+jkZ+CLA==
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
Subject: [PATCH v2 2/4] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Fri, 28 Mar 2025 14:35:42 +0100
Message-Id: <20250328133544.4149716-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250328133544.4149716-1-lukma@denx.de>
References: <20250328133544.4149716-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_063615_870884_97141831 
X-CRM114-Status: GOOD (  11.16  )
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


