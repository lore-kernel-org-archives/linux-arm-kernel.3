Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5FBCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0z+5oHpQTRQspcRGTh9XM1CoadJN2ADm1m9N7KDp00=; b=afF2JDHxJIdGlP1/LC67hhKsdP
	N+bb5AqBoTKUaWFtitUbZ6G3TbsCmcyV253rhd5dZDRumeDVGmXr3WmP0va19xLT6ZPZn+gaww3p0
	alTAEDi+/DnKnplDQQIwKfVtHKgI2+6ImIDFjFdUUOnjyiuUmoVnK4iEtBNXfuEMfUs3O+ZW8a2wE
	rDQIQBM34jW8+RaXrooiwAWT6z7qlkIKF3TCEK9wIsqo5fDDeLpSZxQTUie7VgIuru3NblHzQoPXk
	ysB0l70US53EBLIgM22HbZ+8LcqIfubSfp+FO/5fi5rNltn7jGrF7nR12frFAqLdkC+Djnpd8yWeK
	Mx+2B4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIizP-00000006tXF-2L07;
	Mon, 19 Oct 2026 08:45:03 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIizM-00000006tW7-26R0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 08:45:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=E0
	z+5oHpQTRQspcRGTh9XM1CoadJN2ADm1m9N7KDp00=; b=COrgKVXBHlFU0hy5Ts
	5tyQusbheb0GBgm9O+3h7b1/pAiNQnp+7+FlBxFgg8aXaidtOTfpf3iNwvOuYtaJ
	kswSZdRkhylSPYYxWb5FLYXyXNOhzpysaU9p4h4gLnHlkMuXHkE1xcmt7u/nFIg4
	fj5ehMj5mztjpJpSM88yOWNho=
Received: from pc.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgBnaJF82NVqrQQEAw--.30772S3;
	Mon, 19 Oct 2026 16:44:46 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Felix Gu <ustc.gu@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] spi: stm32-ospi: handle runtime resume failure in remove
Date: Mon, 19 Oct 2026 16:44:42 +0800
Message-Id: <20261019084443.1824122-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019084443.1824122-1-yaojiale02@163.com>
References: <20261019084443.1824122-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgBnaJF82NVqrQQEAw--.30772S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw13CrWrGr4xJF4kXryxZrb_yoW8WFW8pa
	1UXa17Cr4kJa1rt3ZrZrW09FyY9a4ftrWDX3s7K3WxZ3s5Aryvqa95JryjvFs3JFykJa1k
	KF47tw4fZF4qvF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_4E_tUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B5ln2rV2H7GFgAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_014500_912974_1FE21B1B 
X-CRM114-Status: GOOD (  12.76  )
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

stm32_ospi_remove() continues with the controller teardown when runtime
resume fails. The register write can then access an unavailable device,
and the final runtime PM put does not match an acquired reference.

Keep the resource cleanup, but skip the register access and matching
runtime PM put when the resume operation fails.

Fixes: 73cd1f97946a ("spi: stm32-ospi: Fix resource leak in remove() callback")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/spi/spi-stm32-ospi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-stm32-ospi.c b/drivers/spi/spi-stm32-ospi.c
index fa0e8e83cb1b..1340e62ebe1b 100644
--- a/drivers/spi/spi-stm32-ospi.c
+++ b/drivers/spi/spi-stm32-ospi.c
@@ -986,12 +986,15 @@ static int stm32_ospi_probe(struct platform_device *pdev)
 static void stm32_ospi_remove(struct platform_device *pdev)
 {
 	struct stm32_ospi *ospi = platform_get_drvdata(pdev);
+	int ret;
 
-	pm_runtime_resume_and_get(ospi->dev);
+	ret = pm_runtime_resume_and_get(ospi->dev);
 
 	spi_unregister_controller(ospi->ctrl);
-	/* Disable ospi */
-	writel_relaxed(0, ospi->regs_base + OSPI_CR);
+	if (ret >= 0) {
+		/* Disable ospi */
+		writel_relaxed(0, ospi->regs_base + OSPI_CR);
+	}
 	mutex_destroy(&ospi->lock);
 
 	if (ospi->dma_chtx)
@@ -1001,7 +1004,8 @@ static void stm32_ospi_remove(struct platform_device *pdev)
 
 	reset_control_release(ospi->rstc);
 
-	pm_runtime_put_sync_suspend(ospi->dev);
+	if (ret >= 0)
+		pm_runtime_put_sync_suspend(ospi->dev);
 	pm_runtime_force_suspend(ospi->dev);
 }
 
-- 
2.34.1


