Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F82D35177
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz26XmtLPh8Q2Btds6GvvjYzsY1TXEbe251OyLODAwU=; b=PRknD4ILLGo6bATi/RtmYOgB2B
	udHcizT2r7XN5VDUHwfOfuNIbRwYMNBdKP9B/jv9CR6NwGFETJaFg+hNuW0Ajd+Vj08RIls8S3yXu
	j20gQ0cON6ZTHAWc4I/hpSrLXLyqSjFV2T1yalTg26CohbDEgoadIH+Sg3LQjhXsNVKw319/HiFk1
	sPyas4gH5NR1FT8lkLnsfgHZQNQK7jVijYY9sUVxmo4AXyASRhyIqw/jB2H5O5r1MqdFXvtrnhg8y
	x9TScTzBeW752lzXtjs1kVl0rYrczm7vkIATrJWJrs0vXtrH0xcB36VJmF2eMGPGDcucI/mkH0trr
	WA+n/MHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7unR-0000000FAoF-2SGF;
	Wed, 01 Apr 2026 12:35:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uLV-0000000Epn4-2fYv
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 12:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Xz26XmtLPh8Q2Btds6GvvjYzsY1TXEbe251OyLODAwU=; b=Rks/msBUoPQn3ZKtiXGBnm6VXQ
	Yay7T6oPt6tlYAbDrk9wbA6smDVZ3h2xGWLZZMuB/W4++p0YkuOF2hrUG4F5XBqtICJYwni3Rb1Qq
	sB7J8kga98d6cCTlr6WGDiYnGhCnfAiA96aCk//FeC0IXVMXmAutxjtgnDW19c/d0Nz6+prIG8GPS
	ZYlJTy0KtdiVHZbkQdQPCy8mDKP4XQJo7BdetSckZ9kGSXa7Ndwr9TIkK1CtleEhGXqz+cTwKkNAZ
	yvuBE/Y0wSGOcBXJptpHTWkO+81Gjza8vuhmOneGHDhlLedEhws3fZmznrIRi0bOTchhnqvdHkRuA
	SvkJaSUA==;
Received: from www537.your-server.de ([188.40.3.216])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7uLR-00000000IDa-0nMn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 12:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Xz26XmtLPh8Q2Btds6GvvjYzsY1TXEbe251OyLODAwU=; b=brDjBLXn/qdmzEzVOCUUZqcQ8B
	c611c7W5boiORR/heLJgtZPx6iK6ej3Us/6D6DYXUcf0IyxHpvL+oO06G8TftLKTmSNCKpaicdGFy
	vFoYZUT0/p4Wi8QxuTGq5bzG74yD6uqP4U+8rJP0oWSnLYvKt+VeQNriSavl8mClgZsCJ0akiT+wT
	45yR5Ryp31PxjE13ahZbJW1MTryHgFplznyycLTUAgrgvJ/A07qltrnrANgR4O+0ZkAA5/oO7D26v
	lTtjibK1ts6JIu8+E+hvRcAXw2fYNVMu1zEogQvCWGY6bOZhk1DuyRuZxdC/DDrhSvDRHnHFYU4SH
	d2x0PA8A==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7uLI-000FD0-13;
	Wed, 01 Apr 2026 14:06:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nora.schiffer@ew.tq-group.com>)
	id 1w7uLH-000JGT-2r;
	Wed, 01 Apr 2026 14:06:39 +0200
From: Nora Schiffer <nora.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Nora Schiffer <nora.schiffer@ew.tq-group.com>
Subject: [PATCH net-next v3 2/2] net: ethernet: ti: am65-cpsw: add support for J722S SoC family
Date: Wed,  1 Apr 2026 14:05:43 +0200
Message-ID: <a6e31f3bf2f540d3c97574fbfdc0f2a4c1db72ce.1774958552.git.nora.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e7ec1b928357d1240a962a88dc6ac67fd2c92357.1774958552.git.nora.schiffer@ew.tq-group.com>
References: <e7ec1b928357d1240a962a88dc6ac67fd2c92357.1774958552.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27958/Wed Apr  1 08:24:34 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_130649_325561_44E9A663 
X-CRM114-Status: GOOD (  11.04  )
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

The J722S CPSW3G is mostly identical to the AM64's, but additionally
supports SGMII.

Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
---

v2: drop AM64_CPSW_QUIRK_CUT_THRU flag, which is a downstream ti-linux feature
v3: resubmission for net-next, no changes

SGMII operation also requires changes to the phy-j721e-wiz and gmii-sel drivers.
The full series was previously posted here:
https://lore.kernel.org/lkml/cover.1774354734.git.nora.schiffer@ew.tq-group.com/

 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index d9400599e80a4..7ac75fc8cdcf4 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -3468,6 +3468,13 @@ static const struct am65_cpsw_pdata am64x_cpswxg_pdata = {
 	.fdqring_mode = K3_RINGACC_RING_MODE_RING,
 };
 
+static const struct am65_cpsw_pdata j722s_cpswxg_pdata = {
+	.quirks = AM64_CPSW_QUIRK_DMA_RX_TDOWN_IRQ,
+	.ale_dev_id = "am64-cpswxg",
+	.fdqring_mode = K3_RINGACC_RING_MODE_RING,
+	.extra_modes = BIT(PHY_INTERFACE_MODE_SGMII),
+};
+
 static const struct am65_cpsw_pdata j7200_cpswxg_pdata = {
 	.quirks = 0,
 	.ale_dev_id = "am64-cpswxg",
@@ -3495,6 +3502,7 @@ static const struct of_device_id am65_cpsw_nuss_of_mtable[] = {
 	{ .compatible = "ti,am654-cpsw-nuss", .data = &am65x_sr1_0},
 	{ .compatible = "ti,j721e-cpsw-nuss", .data = &j721e_pdata},
 	{ .compatible = "ti,am642-cpsw-nuss", .data = &am64x_cpswxg_pdata},
+	{ .compatible = "ti,j722s-cpsw-nuss", .data = &j722s_cpswxg_pdata},
 	{ .compatible = "ti,j7200-cpswxg-nuss", .data = &j7200_cpswxg_pdata},
 	{ .compatible = "ti,j721e-cpswxg-nuss", .data = &j721e_cpswxg_pdata},
 	{ .compatible = "ti,j784s4-cpswxg-nuss", .data = &j784s4_cpswxg_pdata},
-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/

