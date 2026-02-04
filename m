Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1865BE83EF4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPTM0HmXrYNazv5+kyisaj3v8r/4RebBdezhh+nEyJQ=; b=aEgz+VD2IopoBx37Blw83nRrcd
	6Unk0ElvxHvqXrUjlWpSG1bHpReiprPgBdmrXmC5MKFTVtMZv716dpL0qNJWe2HyVJZMBX4v7R152
	rp4r3T22Tdcgy1ZGA+h5rqIuYodUTHrPj+jo4tD2W34/7kmHhwoLLtJhmrtUrWG0LcfVvGqMgLVeE
	2s3zCtIKGaY8qZw8zFx8uE5bvp5tpC9HYG4M1LDDHsiU8DKL4nwgKGHZs0VJiBoXQPeXKGxS9pHv2
	NsPL6+P3L+xktscnqym8iOkUCp77eV211gogukyhlQ9TKFdmM+sAl4qyv/JE0G0DidNUDCDuNbuPo
	QgpgpGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYfu-000000089F3-2RfS;
	Wed, 04 Feb 2026 08:55:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnYfs-000000089Ef-0fii;
	Wed, 04 Feb 2026 08:55:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E83340A60;
	Wed,  4 Feb 2026 08:55:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 953B8C4CEF7;
	Wed,  4 Feb 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770195347;
	bh=dc2pDQlje1TpaNRVrS3ErZEz9RPQs03Rk8N+eEL5ybw=;
	h=From:To:Cc:Subject:Date:From;
	b=p+1kiDEo+GImuELw6M/ciamJR/XwnorEXfsn64N9Da5bZpqqC2FNvOV8KjPj3822r
	 x1k0FEc7WLtJZb0dxTQ5644XqoxRiXpYCBNSx3EnDWuqVXu4AbAHE842D5JaUygQyE
	 OTi0XlzMpjhDDgJk6WVzG/qkPAZMs8ayIg2ePTcNEkxQ7HId1ysWqjHzuE5YXRgkQR
	 W05gik34LqWcD4dwJ/BXLnf67EERGXuqbrnVwINRsaZ9RUTCYbtVLw9fSPrJAzqoR+
	 5RgC6zkbdXOV7+Qxef4R9+ruLssY6jprOQ6N/YtMm79byZg/YZh3rVcOx1XyGcYiIk
	 lj7Th0Afvl6Xw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	tzungbi@kernel.org
Subject: [PATCH] remoteproc: mediatek: Unprepare SCP clock during system suspend
Date: Wed,  4 Feb 2026 08:54:42 +0000
Message-ID: <20260204085442.1822123-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_005548_220105_E67F6224 
X-CRM114-Status: GOOD (  15.35  )
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

Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
dependency to prepare_lock"), `scp->clk` was prepared and enabled only
when it needs to communicate with the SCP.  The commit d935187cfb27
moved the prepare operation to remoteproc's prepare(), keeping the clock
prepared as long as the SCP is running.

The power consumption due to the prolonged clock preparation can be
negligible when the system is running, as SCP is designed to be a very
power efficient processor.

However, the clock remains prepared even when the system enters system
suspend.  This prevents the underlying clock controller (and potentially
the parent PLLs) from shutting down, which increases power consumption
and may block the system from entering deep sleep states.

Add suspend and resume callbacks.  Unprepare the clock in suspend() if
it was active and re-prepare it in resume() to ensure the clock is
properly disabled during system suspend, while maintaining the "always
prepared" semantics while the system is active.

Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/remoteproc/mtk_scp.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 4651311aeb07..6200c687e232 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1592,12 +1592,40 @@ static const struct of_device_id mtk_scp_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mtk_scp_of_match);
 
+#ifdef CONFIG_PM_SLEEP
+static int scp_suspend(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	/* Only unprepare if the SCP is running and holding the clock */
+	if (rproc->state == RPROC_RUNNING)
+		clk_unprepare(scp->clk);
+	return 0;
+}
+
+static int scp_resume(struct device *dev)
+{
+	struct mtk_scp *scp = dev_get_drvdata(dev);
+	struct rproc *rproc = scp->rproc;
+
+	if (rproc->state == RPROC_RUNNING)
+		return clk_prepare(scp->clk);
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops scp_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(scp_suspend, scp_resume)
+};
+
 static struct platform_driver mtk_scp_driver = {
 	.probe = scp_probe,
 	.remove = scp_remove,
 	.driver = {
 		.name = "mtk-scp",
 		.of_match_table = mtk_scp_of_match,
+		.pm = &scp_pm_ops,
 	},
 };
 
-- 
2.53.0.rc2.204.g2597b5adb4-goog


