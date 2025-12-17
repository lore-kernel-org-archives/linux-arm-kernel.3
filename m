Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A731D65C7B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 17:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3Ko/hho2NEuBGRwpht9SoeOp9JXc1NFBJ1xbGToksM=; b=reburnk2yk00IrzC3WcDC9P+94
	mRX0Qks/GIRT4x34YJkkwDOJ6n2MTfMCYjuXpjdq7rcnmfT5D+Zg7XMltE+fQbtEAaEPeqwAXXDpA
	pVp9Wg+gefznihVA5HxTEN7rg5PO33rBxz1UYMbCInqKv9MoymvpshH7QgEBPVQ0QrVz0oIvPoJ7t
	X/Yz2gEmcZ69wwPjq1LH3IP3I/QC5Ur2okvxom1pkgURxow2Yb3WzqgrPquNUHoUMVFXedK7WP/jr
	9yBLD7pyI7oE58bwu+of221BjUqxeQoonWLyrB5OPKdvv4pZT9ZefXMVg59aTej9J17+iT3bmvbqM
	s15zrLbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvXv-00000007Ch0-0m7j;
	Wed, 17 Dec 2025 17:42:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVvXZ-00000007CEz-3snH;
	Wed, 17 Dec 2025 17:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765993339;
	bh=8TXVTg4eUC99XcZbYLNYfqlAjxV3itLtwsdCHBdEN2c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UgY+Uq2BNTB022vu/CEhLHKYTBhUdD8sk36KUdvHF2qgOw9QqoMAqHUlQ+0+kHpGt
	 I+tCVXp2egcZZ/LfWgUy1mPmcrlsogNG40Y90plWjxfNgO01eShCvYDdqMKZiShsmV
	 Fo7A85MHF6X4WL5FFPWbYgB+W3iLjvofe4uUCod3k0bN7wHntZVtJM+Bth9sk/UqIo
	 ZQAF/oMKCWp1gHWN4gCcjCWf7Q8Hvps5sA4/zslYJDinua3n/jhPuq0q8SQ8A7XRBF
	 v2dXfOdWq4gmVoO4FK2LXMJt6HxMXzfaWlVCarJyJKALfoHjZH/1TSAFfxGZ56EFJi
	 hNSiQhofa7k/w==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 299E117E1523;
	Wed, 17 Dec 2025 18:42:17 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v6 12/17] media: rkvdec: Enable all clocks without naming them
Date: Wed, 17 Dec 2025 12:40:49 -0500
Message-ID: <20251217174059.1341784-13-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217174059.1341784-1-detlev.casanova@collabora.com>
References: <20251217174059.1341784-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_094222_176719_73172F88 
X-CRM114-Status: GOOD (  17.22  )
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

For other variants, the clock names and number will differ.

There is no need to keep track of the clock names in the driver so drop
them to avoid having a list for each variant.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/rkvdec.c   | 26 +++++--------------
 .../media/platform/rockchip/rkvdec/rkvdec.h   |  1 +
 2 files changed, 7 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 87373a6d9573..9bd98b6a6be7 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1315,15 +1315,10 @@ static const struct of_device_id of_rkvdec_match[] = {
 };
 MODULE_DEVICE_TABLE(of, of_rkvdec_match);
 
-static const char * const rkvdec_clk_names[] = {
-	"axi", "ahb", "cabac", "core"
-};
-
 static int rkvdec_probe(struct platform_device *pdev)
 {
 	const struct rkvdec_variant *variant;
 	struct rkvdec_dev *rkvdec;
-	unsigned int i;
 	int ret, irq;
 
 	variant = of_device_get_match_data(&pdev->dev);
@@ -1340,19 +1335,12 @@ static int rkvdec_probe(struct platform_device *pdev)
 	mutex_init(&rkvdec->vdev_lock);
 	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
 
-	rkvdec->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				      sizeof(*rkvdec->clocks), GFP_KERNEL);
-	if (!rkvdec->clocks)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(rkvdec_clk_names); i++)
-		rkvdec->clocks[i].id = rkvdec_clk_names[i];
-
-	ret = devm_clk_bulk_get(&pdev->dev, ARRAY_SIZE(rkvdec_clk_names),
-				rkvdec->clocks);
-	if (ret)
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &rkvdec->clocks);
+	if (ret < 0)
 		return ret;
 
+	rkvdec->num_clocks = ret;
+
 	rkvdec->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rkvdec->regs))
 		return PTR_ERR(rkvdec->regs);
@@ -1430,16 +1418,14 @@ static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	return clk_bulk_prepare_enable(ARRAY_SIZE(rkvdec_clk_names),
-				       rkvdec->clocks);
+	return clk_bulk_prepare_enable(rkvdec->num_clocks, rkvdec->clocks);
 }
 
 static int rkvdec_runtime_suspend(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
 
-	clk_bulk_disable_unprepare(ARRAY_SIZE(rkvdec_clk_names),
-				   rkvdec->clocks);
+	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
 	return 0;
 }
 #endif
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 12e53d591362..75a9ba988794 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -131,6 +131,7 @@ struct rkvdec_dev {
 	struct v4l2_m2m_dev *m2m_dev;
 	struct device *dev;
 	struct clk_bulk_data *clocks;
+	unsigned int num_clocks;
 	void __iomem *regs;
 	struct mutex vdev_lock; /* serializes ioctls */
 	struct delayed_work watchdog_work;
-- 
2.52.0


