Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC52C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6fDsiLwyjpnl6JWNmHm275HpNKLFXRnMNuwpTDF9Avg=; b=d2p4tJbyZZvmWlWEyV3r7z43qg
	aFKvP0DWXxGF0kAwuxOQI+auyPQzlPdss/4S5Y/CVvPKm52/wAcHx4Hjjrz5O2q1dwpGjpLj4nTz3
	Ka86b+VfdMP4x79CIDjW1mZ2mumJhJF+ucbfXF+7o5FEyArFpWdiuX4jYsbS1J0+E2ah60W7waNC9
	Eok/fE2FwWbJel5cLIiJLC+vCWnMsfG5FLtdyV6KQC7lBjWqVXVdqRGP/8iERiikdPxccVHXhpFhE
	wg4BcTq1jszallCgfBWjWh1Iak0xuadaXyvLXSOtINn8712/fSsGxQ43MGCncJXXvycewB8+YuD4g
	i1BEVKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTrc-00000009h17-3mnR;
	Tue, 18 Feb 2025 20:06:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkT76-00000009Xj0-11DO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:18:37 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkT74-0001AE-PV; Tue, 18 Feb 2025 20:18:34 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkT74-001dvB-0y;
	Tue, 18 Feb 2025 20:18:34 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkT74-00BCDr-0m;
	Tue, 18 Feb 2025 20:18:34 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 18 Feb 2025 20:18:32 +0100
Subject: [PATCH] pmdomain: imx: gpcv2: use proper helper for property
 detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-gpcv2-of-property-present-v1-1-3bb1a9789654@pengutronix.de>
X-B4-Tracking: v=1; b=H4sIAAfdtGcC/x2MQQqAMAwEvyI5G7ABofgV8aBtqrm0pRVRpH83e
 JsZ2H2hchGuMHUvFL6kSooqpu/AHWvcGcWrAw00DmQs7tldhClgLilzOR8FrhxPNKMN1m+ByTv
 QvfYg9/89L6194i/+OmsAAAA=
X-Change-ID: 20250218-gpcv2-of-property-present-158f8dbfe2dc
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_111836_282644_DC850279 
X-CRM114-Status: GOOD (  12.23  )
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

Starting with commit c141ecc3cecd7 ("of: Warn when of_property_read_bool()
is used on non-boolean properties"), probing the gpcv2 device on i.MX8M
SoCs leads to warnings when LOCKDEP is enabled.

Fix this by checking property presence with of_property_present as
intended.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 958d34d4821b1be68d730ad345037b8f0a56c45a..105fcaf13a34c787b2d568bc64e7fee9bfc23393 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1361,7 +1361,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 	}
 
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
-	    of_property_read_bool(domain->dev->of_node, "power-domains"))
+	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
 
 	ret = of_genpd_add_provider_simple(domain->dev->of_node,

---
base-commit: 0ad2507d5d93f39619fc42372c347d6006b64319
change-id: 20250218-gpcv2-of-property-present-158f8dbfe2dc

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>


