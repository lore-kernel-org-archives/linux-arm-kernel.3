Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC721049527
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j13v2Qxbcrhyi5s6XenU5OvTOnjjK64uIjL+lU8fYrQ=; b=Bm2MRAc61y96/LZ37BFu5qK4w/
	GknBy/osvHSKB0owAQ/IQ1k/xGWGuxueKHeKGWPAzxNFcpFOa4A1Hg5MAkUbI8yofagWuBmNHUwOq
	GWtzBMv4s7XegdJHeeng5fZNR8IfnDZToyE1eNEN3m/jW+m9GNIhlT4vvOySAs52oorlYvB+h6Rgr
	bvBkhpxP9nY/vL6IzonQfevSWcSOCL35qgjS0UZ8nn6W3o7bDSAowiH4YVkXeGXML5ZLm0jmGgLWo
	jjyLr0zG0dqHzY55fdBomNBHAhMNn35imkib+tQkIzgdUZWJjX7O50//6ZJIrUDi6tFQeRDODMQsS
	hz29X9BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gdw-0000000BOZQ-3aa9;
	Wed, 11 Mar 2026 10:18:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gdq-0000000BOUB-2B0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:18:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFF2C6132F;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36134C2BCB0;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773224292;
	bh=KLueA/c6Dz81/C8ynUU6RVHQqxMTLTUtghgfet0J2Ow=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mTEosz+porOROi16F15hqrBFVAoMVHypgQ2OATZOFvrYnrW1r8vvqO/jqyt3kjRgn
	 AIq+KhWUTCwu1jw6S1/z+QqLz0pA38LPPAmjAKHbfd2Xww1NH5XA38rHFcRg6TnKkJ
	 u0D7bO+uOvSTXcUzWJ0dIef+FQLCPm8w7EEz25tKRujR+RluMab4IV7t+liEqa60j8
	 5950+NvpVaGxzTVejsH8oAXZ9yhJ202L/Cmx9IU+z4w2e4SQrAnzOu5P29kTsE5w9I
	 NSxQSMmH/FUDs5Hc5raKm6zMHspBPO0UMy022Ai74hvNkm7kSe5/QnvLiibvj0NQA6
	 08Ch1D352MrYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 281271049527;
	Wed, 11 Mar 2026 10:18:12 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Wed, 11 Mar 2026 11:17:59 +0100
Subject: [PATCH v10 2/5] net: stmmac: platform: read channels irq
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dwmac_multi_irq-v10-2-7ab1669759b5@oss.nxp.com>
References: <20260311-dwmac_multi_irq-v10-0-7ab1669759b5@oss.nxp.com>
In-Reply-To: <20260311-dwmac_multi_irq-v10-0-7ab1669759b5@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773224290; l=2726;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=/ncF81mYqriMzIkXDHCjmpdMkczIZjJbkswTEDIvT3Y=;
 b=bm5gtvhweXyuMN7zIx3xAqcxJZj6Ixg3v6ty41EZIAlSzdOUny2h+SMlwnULvokzSuV17til/
 CFDKd5xFoz1D2CGNgGGAuQ+LwKs62AnUhVTnLZI2FF4M/OYyg8quuEb
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
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
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 57 +++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 5c9fd91a1db9..7c299e47ff14 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -697,9 +697,47 @@ struct clk *stmmac_pltfr_find_clk(struct plat_stmmacenet_data *plat_dat,
 }
 EXPORT_SYMBOL_GPL(stmmac_pltfr_find_clk);
 
+/**
+ * stmmac_pltfr_get_irq_array - Read per-channel IRQs from platform device
+ * @pdev: platform device
+ * @fmt: IRQ name format string (e.g., "tx-queue-%d")
+ * @irqs: array to store IRQ numbers
+ * @num: maximum number of IRQs to read
+ *
+ * Return: 0 on success, -EPROBE_DEFER if IRQ is deferred, -EINVAL on error.
+ * Missing IRQs are set to 0 and iteration stops at first missing IRQ.
+ */
+static int stmmac_pltfr_get_irq_array(struct platform_device *pdev,
+				      const char *fmt, int *irqs, size_t num)
+{
+	char name[16];
+	int i;
+
+	STMMAC_FOREACH_MTL_QUEUE(i, num) {
+		if (snprintf(name, sizeof(name), fmt, i) >= sizeof(name))
+			return -EINVAL;
+
+		irqs[i] = platform_get_irq_byname_optional(pdev, name);
+		if (irqs[i] == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		if (irqs[i] <= 0) {
+			dev_dbg(&pdev->dev, "IRQ %s not found\n", name);
+
+			/* Stop on first unset irq */
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
@@ -735,7 +773,24 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
-	return PTR_ERR_OR_ZERO(stmmac_res->addr);
+	if (IS_ERR(stmmac_res->addr))
+		return PTR_ERR(stmmac_res->addr);
+
+	/* TX channels irq */
+	ret = stmmac_pltfr_get_irq_array(pdev, "tx-queue-%d",
+					 stmmac_res->tx_irq,
+					 MTL_MAX_TX_QUEUES);
+	if (ret)
+		return ret;
+
+	/* RX channels irq */
+	ret = stmmac_pltfr_get_irq_array(pdev, "rx-queue-%d",
+					 stmmac_res->rx_irq,
+					 MTL_MAX_RX_QUEUES);
+	if (ret)
+		return ret;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(stmmac_get_platform_resources);
 

-- 
2.47.0



