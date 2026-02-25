Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C7EFEFD215
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JUFJSs1zsKPKpOkxNe8/58rHDrU080NdKRFNrTkjsFQ=; b=NvABAREklbMqbdMgLfnJ4+36f6
	DkbKuj4ViKXQm2DjxgyFt3slvL2fpHhlMCyRtZlCguTwU/kxJKikUIQMtwJw5V5roxnoe7XazLbSG
	uVDu9EDjPXy05BKKwwckF/6iev6Fgj4gAgDe0pt3zhvGkwYH0/1qw6Z+u78nByOB7D4KjBxnV2q2a
	weW/ERvdVkeHIKzEpdAchNcXh+u96PyTFV2QMe9Qk/KtDCv5q8rHZJ3T/A8Zvn4ymHBoFG53oLrXk
	Sta7Mf9WzehtebALOaf4srx7mu0SEelU5xJ1gZCHnGgCqIO5foN+p6YlO/dWouemcMmpz/fzDdW/8
	dwY6CaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4t-00000003eh5-14eu;
	Wed, 25 Feb 2026 09:21:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvB4j-00000003ecu-2tR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:20:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 544AE44515;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2987DC19422;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011256;
	bh=b7OeA4KhwKe+Tab7OWbAmiXlOwqbvolyKda+AJsmyh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=id1KmUUHLAeRjFvOmiIc94Y+n/2Kj6c860IYPiSloYdinZqGa8QT7j7d+2zE/ITZy
	 a0WRyLNGrDIJlwKjNgA12VMnRWpKocOnIM5hyINNrbHBXPZ0lj9YOLNZHxjerUBJPF
	 0+G+U36UT51jnjh87NFITsNUhxzFUSAo3rWWyEz5R42K/PbfGOdKygm2vP9VRQi3Gv
	 tQ1/60viePDrtn9LdTRXI5nddMeGK3HWx4sYqm7zxNWIZfDLvVVBBTUfBP8Uzx96ea
	 5NNFnPOEV8MU/g39tkYdsJjPhjs8fESgHjUUHNY7GE3n3j+CouIe0EfpSQduJoDACm
	 g8YpxPGCWZSLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A23CEFD216;
	Wed, 25 Feb 2026 09:20:56 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 25 Feb 2026 10:20:34 +0100
Subject: [PATCH v6 2/5] net: stmmac: platform: read channels irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-dwmac_multi_irq-v6-2-245bf1d7110c@oss.nxp.com>
References: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
In-Reply-To: <20260225-dwmac_multi_irq-v6-0-245bf1d7110c@oss.nxp.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, rmk+kernel@armlinux.org.uk, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772011254; l=2347;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=hkEc+ztC/1Comap0YKLwRQWHoHmNRZY6meilNIXQiBo=;
 b=NbMwj1+x1NxPYwBuh1K175Y6YZEBtyVq0UTNDXkp7y7qFtUeC7uzV98+jbnP9iMFe+RWc3OWz
 IR3tCHAf6g9AeKlrJG4M0dTDBM+hlKfdsF25AFW+bkV4FhvViHdxoEC
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_012057_782197_87C53CB3 
X-CRM114-Status: GOOD (  13.09  )
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
Reply-To: jan.petrous@oss.nxp.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Read IRQ resources for all rx/tx channels, to allow Multi-IRQ mode
for platform glue drivers.

Reviewed-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..64cb8751b327 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -700,6 +700,9 @@ EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char name[16];
+	int i;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -735,7 +738,42 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
-	return PTR_ERR_OR_ZERO(stmmac_res->addr);
+	if (IS_ERR(stmmac_res->addr))
+		return PTR_ERR(stmmac_res->addr);
+
+	/* RX channels irq */
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES) {
+		scnprintf(name, sizeof(name), "rx-queue-%d", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev,
+									 name);
+		if (stmmac_res->rx_irq[i] <= 0) {
+			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			dev_dbg(&pdev->dev, "IRQ rx-queue-%d not found\n", i);
+
+			/* Stop on first unset rx-queue-%i property member */
+			stmmac_res->rx_irq[i] = 0;
+			break;
+		}
+	}
+
+	/* TX channels irq */
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_TX_QUEUES) {
+		scnprintf(name, sizeof(name), "tx-queue-%d", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev,
+									 name);
+		if (stmmac_res->tx_irq[i] <= 0) {
+			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			dev_dbg(&pdev->dev, "IRQ tx-queue-%d not found\n", i);
+
+			/* Stop on first unset tx-queue-%i property member */
+			stmmac_res->tx_irq[i] = 0;
+			break;
+		}
+	}
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 

-- 
2.47.0



