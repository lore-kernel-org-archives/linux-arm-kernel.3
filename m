Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EFAC87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=di78dVDeocXrSxpeS3C1YC1V6dqZc5zTkITE3OoV06s=; b=YuT4yoq39D0NFLxHLmEmI5OCsP
	XS/OjdYJygNiAIldIZKs4HPIoaUPC5yum5hXJQYpODOFXrhYqFVGy2Wfs0WuO79SXt5CrxfAnEH/p
	4aufno4RFpkRmP7K3GKqlCAU8SncS0EzEUYbPHIZMJ0rVbLal6muGYrcaayYkBagLpvOl6/qLMz+3
	CdaevOcEmcUrBjcHzAx/Bgb0aW26E4OzIopsm9k6C75hki6+xYOVYkNBc/qfEtnL3ZEPSjQUpQTvz
	hNoQviGqF9lNzXRKJ4z8oq/5+QfqwmXeRk+tY0yjpbcYN2si4wusjWSnbIB0CkMnHD7Hz/1Qy6QEy
	c2QJHMPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf57K-00000008f4r-3iW2;
	Thu, 24 Jul 2025 23:12:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Vj-00000008bat-41Wa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Jul 2025 22:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=di78dVDeocXrSxpeS3C1YC1V6dqZc5zTkITE3OoV06s=; b=W+/0iRFAHBBzh5p2ewk/hwZ+QB
	MnLahROf65Q9KP4pdygZ8U6xuL05pUfiyjY2M+dZAJT4vxwdeUbPgGsKWvZwpj3w+bcLPpeG1PMW5
	3PV6cjAk59o/x0NTkLiRXRbSizoxjqv3vrYHHQ/BRFrnhSDaQPKFTDFtd/GtTTD78ALMNAkXdPBRA
	sVGFyaKkPKnmLjvjbL5uMvF5kKvalhNkijz/+JAMTBd4vBsUc69iKmNVqNOJMsOZYDofObgEIEFH8
	tUCeO1uTmv1uJX29WlnsqnE1Kp7W4x/1bA1Sx1Ob5Rt73OatnIB5LA6p3YRDWrt1hal1+Vv1LPmbH
	s/COnRiw==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf4Vg-0000000BiGC-31ZJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 22:33:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7E9910391E84;
	Fri, 25 Jul 2025 00:33:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1753396429; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=di78dVDeocXrSxpeS3C1YC1V6dqZc5zTkITE3OoV06s=;
	b=ewym4jQYKcDaWNKsKpEfqL+K94jcEUwWKHPLaN3WSWSwj0AP5xE1TkKhUyUb05JfJ+DRal
	Vsyis/lqL4MouLKYzvc3tdBhxKi9pbkx6UbbNfXxGNny3PoTF2uwloo87qPgeawtDdoRJl
	m1RZyZgg1asT9d09vR+JSkQ0tb9jeCwtsPUbrgfyiCSWP30is3x1rEpGSZZSl1cF6vezem
	9UYvKO+LrhKNJQH3pAEuROXkE1dzRIjQB0ChCZdBijRYWtopdBmgNVT4lLO6gl6SdDXrOe
	0aYD5fFSgYDM09va4NxSrhqCsR9I578QGDEkJWpxEsj7y9scKChyFg8ezgKYxg==
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
Subject: [net-next v16 02/12] ARM: dts: nxp: mxs: Adjust the imx28.dtsi L2 switch description
Date: Fri, 25 Jul 2025 00:33:08 +0200
Message-Id: <20250724223318.3068984-3-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250724223318.3068984-1-lukma@denx.de>
References: <20250724223318.3068984-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_233357_010696_6533F482 
X-CRM114-Status: GOOD (  10.82  )
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

Changes for v8 - v16:
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


