Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8646B606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 13:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AMLsVgNO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NkyoRqoBmfBgCM55UmNfodUHU+sKzojvgE1fX4kVPRw=; b=AMLsVgNODWQvE4
	XjAECIbtiQR6M1SSJVOz3l6O+dTibCGqeJSI4SzkXEAjhwVSEWJNNAU1C0FBchhRGgdYs2GqebDFu
	hXsxCPAsC9AWa/xyPyzg3OxDIboUGf8q/hRzceZqcHycxBpf9ItSRBS022dPZeE5MRjIN+NpxE77e
	yXq02kcJuWVznYGWvi/ZQv7S9MsIMNfSUDfw6EwcTE7KvYkO1bbRT7UW944LLWLjZrU4a4MmjyGDw
	BNF1rNuf1ltph1DnZJTTSFxZlvkBviuSAEBC76ey8hjdviB/4wtKGffHoCe49YWAgQpginsoB6N5c
	PfX/Z6egUjowqFrY4BPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPup-00000009IGw-2VEX;
	Thu, 29 Oct 2026 13:11:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPui-00000009ICy-3Zf2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 13:11:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CBC0601F8;
	Thu, 29 Oct 2026 13:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A60A1F031E7;
	Thu, 29 Oct 2026 13:11:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Biju Das <biju.das.au@gmail.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/9] can: rcar_canfd: Add Runtime PM support
Date: Thu, 29 Oct 2026 14:11:03 +0100
Message-ID: <011735aa3a7568229db473a7ff92681176338db0.1793278754.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793278754.git.geert+renesas@glider.be>
References: <cover.1793278754.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On R-Car X5H, the CAN-FD module is part of a power domain.  This means
Runtime PM must be used to make sure the domain is powered when needed.
The CAN-FD module is part of a Clock Domain on all supported SoCs.
Hence remove explicit management of the functional clock, as this is
handled automatically by Runtime PM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/net/can/rcar/rcar_canfd.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index 4d805df5ff9e8933..74d9ffd2790587b9 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -37,6 +37,7 @@
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <linux/types.h>
 
@@ -2004,9 +2005,9 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 	int err;
 
 	/* Enable peripheral clock for register access */
-	err = clk_prepare_enable(gpriv->clkp);
+	err = pm_runtime_resume_and_get(dev);
 	if (err) {
-		dev_err(dev, "failed to enable peripheral clock: %pe\n",
+		dev_err(dev, "pm_runtime_resume_and_get() failed: %pe\n",
 			ERR_PTR(err));
 		return err;
 	}
@@ -2016,7 +2017,7 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 	if (err) {
 		dev_err(dev,
 			"failed to enable RAM clock, error %d\n", err);
-		goto fail_clk;
+		goto fail_rpm;
 	}
 
 	err = reset_control_reset(gpriv->rstc1);
@@ -2074,8 +2075,8 @@ static int rcar_canfd_global_init(struct rcar_canfd_global *gpriv)
 	reset_control_assert(gpriv->rstc1);
 fail_ram_clk:
 	clk_disable_unprepare(gpriv->clk_ram);
-fail_clk:
-	clk_disable_unprepare(gpriv->clkp);
+fail_rpm:
+	pm_runtime_put(dev);
 	return err;
 }
 
@@ -2093,7 +2094,7 @@ static void rcar_canfd_global_deinit(struct rcar_canfd_global *gpriv, bool full)
 	reset_control_assert(gpriv->rstc2);
 	reset_control_assert(gpriv->rstc1);
 	clk_disable_unprepare(gpriv->clk_ram);
-	clk_disable_unprepare(gpriv->clkp);
+	pm_runtime_put(&gpriv->pdev->dev);
 }
 
 static int rcar_canfd_probe(struct platform_device *pdev)
@@ -2254,6 +2255,10 @@ static int rcar_canfd_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = devm_pm_runtime_enable(dev);
+	if (err)
+		goto fail_dev;
+
 	err = rcar_canfd_global_init(gpriv);
 	if (err)
 		goto fail_mode;
-- 
2.43.0


