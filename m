Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5655DCA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FbKbg4FBgNACxQCiWRBCS88BMophoZHsoTkq08Nb1K4=; b=V+fmJwO7YZOqKy/oknmXVMlMwZ
	K9pweUjn2Re8ZaGnXDxwEywP7KEBotBNK0qY4r2MyW8sbesMq9iMeA/zTwzHujmimHiSm8zZHcBpQ
	BRPh9/zxuo7O61QQQ+i2/Q8cUBGAMeAh+P2vJmJVpkGcStqf7uYppUF+IqjxdikoIphx4MYIgP7Fe
	C6irGFg2musqwtP4TtjqmBJYNkkXu1ki5bta6PcG4Tye/Hw5lB9uqBwbC0cTTKA4hFRWyAMWcMvh5
	72Uypc9JJUTnxkGRwhiIQNuia2OJF7RcJxzpwEHdlt1ffnfodmF/qU9nLdiBxC3/kPMiwWd5zoDWP
	0O/SV1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKhz-00000009sU1-1BE2;
	Thu, 01 Oct 2026 17:36:39 +0000
Received: from out-76.mta1.migadu.com ([95.215.58.76] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKhw-00000009sSA-1YyN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:36:38 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3q9hkY6d+6TpF0+232lr0z77rEQqbqqKqfmC0Qvs/Qs=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876194; v=1; x=1791480994;
 b=cTz9miQ4ycBVTc1cjtYvm5bXA7DeDx+Ua2ylGPR02uo15KHqJ2GsA3G7ZTk9qgXWi8ItoHjq
 f7P3IDWP4WcEoSH2K1AR8EdHLy3XabYEkXQeDniQdceQ/bKtbG2b0h+Zo8p7eYBcHf/Kpo1Sq4G
 vaB6whsEnJvB4V356zqLw4YfMTUtyPTofWF6hg6yYnxVi+gM0L39cSHtubbAfrv+KA94FRWh+FW
 tetbq2vhFvOV9IbuUhREKyNylclxvEnOkuXgd3BBopELOdNBxygYEM+HSRA+hDfUpv5OmDNZXMe
 x+W2bll0gD3K8ErMn/lCCF5F5r2wQUsHtL7YlhZmuZ5BQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2a51c1c8e8fa7f37;
	Thu, 01 Oct 2026 17:36:34 +0000
X-Mizu-Trace-ID: 2a51c1c8e8fa7f37
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 1/3] media: rkvdec: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:51 +0200
Message-ID: <20261001173610.158931-2-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_103636_941396_3578A1B4 
X-CRM114-Status: GOOD (  14.25  )
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

A new set of modern PM_OPS macros got defined in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Switch to those new macros so that the PM callbacks are always seen by the
compiler, but discarded if not used. This lets us drop the check for
CONFIG_PM.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 061281f903f3..936abd92f703 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1877,7 +1877,6 @@ static void rkvdec_remove(struct platform_device *pdev)
 		iommu_domain_free(rkvdec->empty_domain);
 }
 
-#ifdef CONFIG_PM
 static int rkvdec_runtime_resume(struct device *dev)
 {
 	struct rkvdec_dev *rkvdec = dev_get_drvdata(dev);
@@ -1892,12 +1891,10 @@ static int rkvdec_runtime_suspend(struct device *dev)
 	clk_bulk_disable_unprepare(rkvdec->num_clocks, rkvdec->clocks);
 	return 0;
 }
-#endif
 
 static const struct dev_pm_ops rkvdec_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(rkvdec_runtime_suspend, rkvdec_runtime_resume, NULL)
 };
 
 static struct platform_driver rkvdec_driver = {
@@ -1906,7 +1903,7 @@ static struct platform_driver rkvdec_driver = {
 	.driver = {
 		   .name = "rkvdec",
 		   .of_match_table = of_rkvdec_match,
-		   .pm = &rkvdec_pm_ops,
+		   .pm = pm_ptr(&rkvdec_pm_ops),
 	},
 };
 module_platform_driver(rkvdec_driver);
-- 
2.55.0


