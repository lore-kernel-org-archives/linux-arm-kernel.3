Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61771D1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNJhPIPEiJk5jJt9Fj46kWk/oRJwxEHTScGG9O5MDk8=; b=IJIEJUeq35OmIyodK0cPnj8Wp4
	7hSF4YIQ2Oe+Nt67VCVquyrnxN++2BK6izlp4EkHDt8xu2M9+b4o8FXP0w8GUk0Zu+NLgBk69Dt+8
	Iz16EsfydZUD/zqBXQlmqlritIYWyz/CHlZbBgspndy3fbbQTAz/EUudjk6PV0UFsdQEPiwhhUSzI
	BEWVfPlI634SVz9eEaGBlPpZ7vg0Pi4M2O116b4UjmQCFx0jd4nqsoZey49rc7Gpowlyk+ntkoHyh
	lXeJgkT0IJPi51Hs9j5y82luM7z2NMJFjlcuZXt1IbVbSxtq4rRF74xxgAndbzjjHieXVgqXqUPi7
	6/ftZ2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82bB-0000000EsPb-09PE;
	Mon, 04 Nov 2024 19:18:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82QX-0000000Er4A-2jxv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5AA0C5C4D4C;
	Mon,  4 Nov 2024 19:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADDBFC4CECE;
	Mon,  4 Nov 2024 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730747268;
	bh=gYLDAt04WnrT85oSS6ETp+kMVsstlk0+hVvLhCGiug4=;
	h=From:To:Cc:Subject:Date:From;
	b=Db5+VECPLXzzuwMFVO6vSzqRUlsWwzVEcLT+CeNlyse6u/6ByY6/jSwCq5vp10bGg
	 GT5R05uZMIjqYp3DAmeKJGsQxmTHjZrk8Ok+S6EiLwQ8H7XxjimtILhGk9PlKSHble
	 o6hKAA1ul3X9DCsQYfOA/hbhwBUCC6tgZV+D37IF/kmPdEIbR8UjytxRBGQCOR8+Qn
	 tUHY1wQ45XiTvLATyNUwrMbNf5zfn2aSoQpmgUZqBwYgZzGL4WsWkq/iB/ABQVgqYb
	 AyyuiVi5wAX/HSqrY0ZSnSHZszMZVThQCWA27zKddwC4Tc3zVnKW/UCGl26nboKisH
	 2n3ObSUtqwx5g==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: imx: Use of_property_present() for non-boolean properties
Date: Mon,  4 Nov 2024 13:07:42 -0600
Message-ID: <20241104190742.276710-1-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_110749_760916_B087FF9C 
X-CRM114-Status: GOOD (  11.19  )
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

The use of of_property_read_bool() for non-boolean properties is
deprecated in favor of of_property_present() when testing for property
presence.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/pmdomain/imx/gpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 80a4dcc77199..fbb4c90b72c4 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -411,7 +411,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
 
 	/* bail out if DT too old and doesn't provide the necessary info */
-	if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
+	if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
 	    !pgc_node)
 		return 0;
 
@@ -511,7 +511,7 @@ static void imx_gpc_remove(struct platform_device *pdev)
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
 
 	/* bail out if DT too old and doesn't provide the necessary info */
-	if (!of_property_read_bool(pdev->dev.of_node, "#power-domain-cells") &&
+	if (!of_property_present(pdev->dev.of_node, "#power-domain-cells") &&
 	    !pgc_node)
 		return;
 
-- 
2.45.2


