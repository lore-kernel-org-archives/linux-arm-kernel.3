Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028E6FC5918
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyGbGn3tmB6b9q2W2PekJSVt7LhyZ98WaVIdGF9m91Q=; b=3zpWJKtYFr53Z4OfDXIf0qFaP8
	iyG2t31vP6pOKVWFOhRhBJUiOpyj7dktv9/Bf8Bb8MrICfYRIeimMFHdvOUGwgJlvkxn3WphCLySK
	UummQcPKFrqU8m5EQ7LTFNWwXnjQOFDF8Xu/ItJtRmvlIvifdRnvCWnW36j1xW9D+2ES0rqrX97lN
	YCy87F3GXMM7DtpzHnUtiIFqoMph0/SNBezMw4FirkbKTia39lSrwDh+BjyJVy72LyFstIJn5BIED
	Evi9xhxE9zOitFC3yzxFsA2KWjr4ImvvzEyvEFm1ze8H1+fHYSVNMOIACoKvTwJGBIJHUHeuvfc2t
	mqlQNG0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8f-00000005iPX-0cgt;
	Thu, 26 Feb 2026 08:54:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvX8R-00000005iKr-40DI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 587A844493;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 297E0C2BC87;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772096055;
	bh=acK55HUEgUlYs3NA6am84XEhZn54fFFJoFsVffPPOu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JbWLH3cy0ujfAt5EGN+yK9a/6D295YSMQHj5z0WyS4EMUf94rHTXOwcXK2CU4vRvH
	 ZCI9Rbz7vVs93LcgZiHBZAPrWr146Z6poTxLfS/7/v1trp4Xh0PfpYCv29ISm8Vlb/
	 Ee0u77S7WngUKaXLw5ER3bAawwXasvuTTs1h7SMqumNUEYOwfVoAOxWjjLWm28YDGO
	 zm39NE880+jWm2ZZ+4u38d4560QYNX1FA4SfwwZeZxDV1t7aR3QwOGmcsghZpzNYz0
	 2VXnuik7ncLDkuIeOSPHD/LwuPHuRbvVGXekaVAPR6BD8yh5z4WeIjZHpY93KGTHQI
	 KbTUvEfUBrflA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A8AFC590F;
	Thu, 26 Feb 2026 08:54:15 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 26 Feb 2026 09:54:07 +0100
Subject: [PATCH v7 2/5] net: stmmac: platform: read channels irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-dwmac_multi_irq-v7-2-f8fe3b945bb4@oss.nxp.com>
References: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
In-Reply-To: <20260226-dwmac_multi_irq-v7-0-f8fe3b945bb4@oss.nxp.com>
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
 vladimir.oltean@nxp.com, boon.khai.ng@altera.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772096053; l=2366;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=B8c7aRywEeVNEcViOxgmKHLxUkmd8vB8bY3PlIZqha4=;
 b=nyhyzPI1D0afCBmRHglDGqjiujEUV363kenRORGy0ZtLu65WQkn+154GaEcVDysPIpFaont+e
 bJn7AI8bHxUA4VnxSpuYmF2wK09phvW/u3tYVvS7En+hvpFj63S0NJZ
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_005416_057596_01441D06 
X-CRM114-Status: GOOD (  13.43  )
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
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 46 +++++++++++++++++++++-
 1 file changed, 45 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..93bd915ab6eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -697,9 +697,40 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 
+static int stmmac_pltfr_get_queue_irqs(struct platform_device *pdev,
+				       struct stmmac_resources *stmmac_res,
+				       bool tx)
+{
+	int *irqs = tx ? &stmmac_res->tx_irq[0] : &stmmac_res->rx_irq[0];
+	char name[16];
+	int i;
+
+	/* RX channels irq */
+	STMMAC_FOREACH_MTL_QUEUE(i, MTL_MAX_RX_QUEUES) {
+		scnprintf(name, sizeof(name), "%cx-queue-%d",
+			  tx ? 't' : 'r', i);
+
+		irqs[i] = platform_get_irq_byname_optional(pdev, name);
+		if (irqs[i] <= 0) {
+			if (irqs[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+
+			dev_dbg(&pdev->dev, "IRQ %s not found\n", name);
+
+			/* Stop on first unset rx/tx-queue-%i property member */
+			irqs[i] = 0;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	int ret;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -735,7 +766,20 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
-	return PTR_ERR_OR_ZERO(stmmac_res->addr);
+	if (IS_ERR(stmmac_res->addr))
+		return PTR_ERR(stmmac_res->addr);
+
+	/* TX channels irq */
+	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, true);
+	if (ret)
+		return ret;
+
+	/* RX channels irq */
+	ret = stmmac_pltfr_get_queue_irqs(pdev, stmmac_res, false);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 

-- 
2.47.0



