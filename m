Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93738D3B7FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; b=MTAIJOC63kOEPW0YxDDS34IUDJ
	BdDQZ1oDkTSua9Ar2mJScDYUJVl29RXaw31+ZM01viscibPU+baOCTd0JUvgUh9bOn19OaF38HNar
	Ty5IBwRKf87skGJzXXI5uw0fcktVGF4b4PuWs3HMjp4Rlkz0qhCtf1oI1FYgyESMxVptWz/H3bb8I
	YlCIzsWHyRcqPU80fwp+eMP7MBY8wNdmibSz6WBE9cooIeO1/9/dxh1ivyKRqONo+2A69q9avieWb
	UvDyZ/BxfuHQVC/EfBEpuCBjaKnU/lyHYwlgU2KKHEwrKDAQY83qq23aTZLwHWCnxLWkifAx/srWL
	b5rvJG6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvM4-0000000E8BD-25WB;
	Tue, 09 Dec 2025 10:54:04 +0000
Received: from mx-relay48-hz3.antispameurope.com ([94.100.134.237])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSvLv-0000000E865-3lWs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:53:57 +0000
ARC-Authentication-Results: i=1; mx-gate48-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1765277622;
 b=L1UstfSBI+WeCzBSFWkmBU7Gh+3fTPPZmUTJzAAdSPNmQURYEcNc2xQPbc9uLRxHAFPSS+dj
 kp8SwdNLqTHK3AuwFVDK5c49g+UsUfc1Pf9Se21CNOINOivIEvJOoaUmk/us8OsAguCPABqTlj+
 gABbTh8fX1NnLeoqF6PR4QL0fRgzf+TRgIQZCzs/TskPns00wBVhn1PC0Rgfpj4AK4pKx3t666f
 e1oEjXVs2bunzqZzJ5EZMeB3D87sOvPPXx9NLohSBwEbZ35Vr3eD1xsTqDMjn3GvsHhanfWLsEp
 fpv6IR4pj9cCK1uW6ITq89v2OOPmK7R0I67KWMkTL/EqA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1765277622;
 b=ByKO9mMqN16ZE/W527+j2nlm84CCClISMDu7HolHI73gAj8wsEqfTUss6gyB9TjyeUkwq6K7
 dMgsvX+d3kTalPv4UY+LYmU9YMptl+/qL63deMzbCTgylGySe7cVki5uhEdIUQOG5GAZM91WLVi
 opshiFkSHTV+Y/PK7DAnsuFSWSPvtg0ymADrPy4kJ+er4Cq5jFIplGRZU6QXGP1hd2P87FSk3o2
 2IkAZzORprkGKUmBBKNqj9wEXnHSoJMR/65gI4mYK6DsaRHjDYIRqBM9cK6xs6v5sIOmN+9ekvU
 pU3F5VAGjWeMNOzGGoP5e6FUOPCwd9910WuyU/Ax+dPEw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay48-hz3.antispameurope.com;
 Tue, 09 Dec 2025 11:53:42 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A604ACC0E94;
	Tue,  9 Dec 2025 11:53:27 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
Date: Tue,  9 Dec 2025 11:53:12 +0100
Message-ID: <20251209105318.977102-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
References: <20251209105318.977102-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay48-hz3.antispameurope.com with 4dQbLJ2sfpz1kNh56
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ebb7bfe29a23ea3b3ca2efd1a9894abd
X-cloud-security: scantime:1.801
DKIM-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1765277622; v=1;
 b=ZftTCpNGyJtvbzdi11vhl+aqQatAranGkniwpQrwDypaszEgFBEDAQIFQZviFqImaYEGJ2eX
 RMOWzIfJY2br6m/yabYKDP6fu3eFvu/xcDEHp1+rEHJpNclpL95Lvp8jbaM3NM7sJazggJ2GiXk
 dMhmlWu5PXwXqs8gz8SRkkVSOotq6WwWUAWJIm0z508sbGAtecjpUeydsib08j2QXn8ZSCaGM6U
 gtejtrmcMpdcVfMqGo7gW4RDude6okSHaBrxOzyA8WiHhuEauspC5g5PBMtbnq9yhKI8njhG4yp
 0xmU6qoKEWTMUjKnd4b5ufveOGD1B+jQ39QXd/exMtbvw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_025356_077723_67C80DFA 
X-CRM114-Status: GOOD (  12.21  )
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

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index f7346b3d35fe5..67fe1f63fd93c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -190,7 +190,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -222,7 +222,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-- 
2.43.0


