Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B0DC98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WmtXd6HMOJLyqBLQPARl/EDOwACbRXQKfis2Q4MFfo=; b=T3sr/AgNhwMSD1qLG9VWKF9H9U
	GK5IJSnljXpfAUqHSHXv2LRErQGC9y3XZaRPKe9EDMDD3SDTg3TWl407RI34ytL6Hh3V+vzqeXtAZ
	8VYL3WdJQJb66W6eSz7gtBvQFP9+GyBzEOz3a1spCg4sYJnzRN8fVEeVXFtrKgH0TxMOVemE64v6h
	vWk0UFiKUdi5LWO0s73CfM5l2f6jgzqiqH6NoDJQWfKAAZuE1Vw2HXOzQaNg9475GWPlue7R+EKpM
	F5VeY6zNy/z6Fd/SgnssF89zIZpjD8h/b+HSgmc2HkiOKe3sJfTt3XkRHHX2w8yfXgvt9hRK9bTiQ
	yisb8Onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fvB-0000000AbHL-2zHd;
	Thu, 24 Sep 2026 09:39:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9fv9-0000000AbFX-3jxL;
	Thu, 24 Sep 2026 09:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C75A43E5D;
	Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC637C2BCFC;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790242754;
	bh=LhBf7uyvNWdc+1o7fNc8Pq/2LIhba4ntyJokJmrlauQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Y8+ag2xyT5Ik8isUvlaiIiyKJSkZT0+eqaNL1mM3Qtssv3moeUVT2C4lQzA3GrHln
	 hUTzDnRjuLRA1wogT4C1gtUgtzjCq5pHPGOSJi6xQl5ncuS+RBFUy6uYNVX72cjDx2
	 lnFzk0RyloAXZuCItTrVurAQwz7DrIRiUgW3Wkc05MYfeXLQeZzWYiDFEA4sRA/f5N
	 rov6D2t5FakG1w8vI0aSelqJe7YJvNSi5l6ID5xMoqCHhcP4I8gGyp5lrxC3Voj5r/
	 H4cftD+PjiwbDr6KYd1l2KzUDWs4dQmhxNH5HmKlcU7nOAx+vbAIPWoNpnQY7a5EPm
	 WkSfObHaL04wA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30D7C98317;
	Thu, 24 Sep 2026 09:39:14 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 24 Sep 2026 12:38:31 +0300
Subject: [PATCH v3 2/3] soc: mediatek: pwrap: use correct log level
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-6572-pwrap-v3-2-64769b6446ac@protonmail.com>
References: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
In-Reply-To: <20260924-6572-pwrap-v3-0-64769b6446ac@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790242752; l=3556;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=aBJoby976DV0fnBJYf0Tm1Mpi+SpQNQMduSmydmf8uw=;
 b=+Mav+ZxvifWc322AWdI4+wK84IHSoI7II6Bl7jqFWPZXNysQtvF403/OX3jbztBCHnqn28Ygg
 w+lmcis1De/CssAl3Xuk5jDsaGY550GRtlLD2oRihXOQtjKHZsV7in0
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Error paths should be dev_err, not dev_dbg. Replace all dev_dbg in error
branches to have the correct log level. Also simplify dev_err and return
with dev_err_probe.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 45 ++++++++++++++----------------------
 1 file changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..a4b10b0a97cb 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2475,10 +2475,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (np->child)
 		of_slave_id = of_match_node(of_slave_match_tbl, np->child);
 
-	if (!of_slave_id) {
-		dev_dbg(&pdev->dev, "slave pmic should be defined in dts\n");
-		return -EINVAL;
-	}
+	if (!of_slave_id)
+		return dev_err_probe(&pdev->dev, -EINVAL,
+				     "slave pmic should be defined in dts\n");
 
 	wrp = devm_kzalloc(&pdev->dev, sizeof(*wrp), GFP_KERNEL);
 	if (!wrp)
@@ -2496,11 +2495,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_RESET)) {
 		wrp->rstc = devm_reset_control_get(wrp->dev, "pwrap");
-		if (IS_ERR(wrp->rstc)) {
-			ret = PTR_ERR(wrp->rstc);
-			dev_dbg(wrp->dev, "cannot get pwrap reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc),
+					     "cannot get pwrap reset\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_BRIDGE)) {
@@ -2510,12 +2507,9 @@ static int pwrap_probe(struct platform_device *pdev)
 
 		wrp->rstc_bridge = devm_reset_control_get(wrp->dev,
 							  "pwrap-bridge");
-		if (IS_ERR(wrp->rstc_bridge)) {
-			ret = PTR_ERR(wrp->rstc_bridge);
-			dev_dbg(wrp->dev,
-				"cannot get pwrap-bridge reset: %d\n", ret);
-			return ret;
-		}
+		if (IS_ERR(wrp->rstc_bridge))
+			return dev_err_probe(wrp->dev, PTR_ERR(wrp->rstc_bridge),
+					     "cannot get pwrap-bridge reset\n");
 	}
 
 	ret = devm_clk_bulk_get_all_enabled(wrp->dev, &clk);
@@ -2535,10 +2529,8 @@ static int pwrap_probe(struct platform_device *pdev)
 	 */
 	if (!pwrap_readl(wrp, PWRAP_INIT_DONE2)) {
 		ret = pwrap_init(wrp);
-		if (ret) {
-			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(wrp->dev, ret, "init failed\n");
 	}
 
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2548,10 +2540,9 @@ static int pwrap_probe(struct platform_device *pdev)
 	else
 		mask_done = PWRAP_STATE_INIT_DONE0;
 
-	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
-		dev_dbg(wrp->dev, "initialization isn't finished\n");
-		return -ENODEV;
-	}
+	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done))
+		return dev_err_probe(wrp->dev, -ENODEV,
+				     "initialization isn't finished\n");
 
 	/* Initialize watchdog, may not be done by the bootloader */
 	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
@@ -2593,11 +2584,9 @@ static int pwrap_probe(struct platform_device *pdev)
 		return PTR_ERR(wrp->regmap);
 
 	ret = of_platform_populate(np, NULL, NULL, wrp->dev);
-	if (ret) {
-		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
-				np);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(wrp->dev, ret,
+				     "failed to create child devices at %pOF\n", np);
 
 	return 0;
 }

-- 
2.55.0



