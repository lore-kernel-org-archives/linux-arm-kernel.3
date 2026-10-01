Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C5ACA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUL8PI2Wqn4SxCBj+TBXKSDvO45OwYCfVDKBoF9Al6E=; b=vVygd4c5TZp6ahyX+e3dHH6qHf
	x9OGc2B/GPjivbHTQQMRFGHAnZdDKifB6YSBKg7ZE9JC8A5tw/LIiQ2s3jOM4qJrsdf9GH5LbTn03
	H8PEzT6MugK3lzczcvFNKczQrbgMA3rVTYPeA1xIR0P9tmlhAF3o6zLeyECRmo1MsSX2m/n7NB40R
	waNGeIBMNBNoJS1N/7SGiqOwyDA7HQ85WTC9lb9gT5zMxEY6BodOpnWnvBZJtxmLljuRgnnuJKDZO
	ostmKZc/Sfj6kGFL/ILKPaFF4aPzFiD0eG3h/b7WviRGAT9mQnK998kQfNt+Ay8XDIqgij+baPyYk
	VRnQk/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKi5-00000009sZj-45e1;
	Thu, 01 Oct 2026 17:36:45 +0000
Received: from out-6.mta0.migadu.com ([91.218.175.6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKi3-00000009sW4-3gAO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:36:45 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=SoALhT7ctD/Ofq5oEPYAXAkgPEKatIJv6UIilwTDtfw=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876201; v=1; x=1791481001;
 b=kNnE23VMQUox9UleXFY4PNjn7rrveHEZaklWe3JIC+p0zRHUJ6HokdlBNuZ4jiVY+4MfZlQT
 z524uyUVnXHwC8OhWLIK3y1bCuYTwppQgwB13mU7AOMBWnkcduQgoxSN8ZFnaHdfKLo3m9OrME8
 VpsYKGlMcX88ZrdhtUWHSd2k8xASY42Q0tMgKgBgltJGovtLIuqNUwuZzBz91MAAe7F8qjrc3Za
 mTPQF8rDQmEQnxJ4rvf5HjMuIKo+llhoWVQ5mfS8Cdxmfk/nkP4g/s67Q4JOJfoLN5tX/rxACBG
 X/S81yc61Se6niAHcjjZh3s0yz0XIykiXzsNMDFQZPSRw==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 0533d356648de116;
	Thu, 01 Oct 2026 17:36:40 +0000
X-Mizu-Trace-ID: 0533d356648de116
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
Subject: [PATCH 3/3] media: rkisp1: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:53 +0200
Message-ID: <20261001173610.158931-4-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_103644_055492_81CDB7DE 
X-CRM114-Status: GOOD (  13.10  )
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
compiler, but discarded if not used. This lets us drop the __maybe_unused
annotation from the callback functions.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index f90e01301943..e619a949dbc9 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -305,7 +305,7 @@ static int rkisp1_subdev_notifier_register(struct rkisp1_device *rkisp1)
  * Power
  */
 
-static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
+static int rkisp1_runtime_suspend(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 
@@ -331,7 +331,7 @@ static int __maybe_unused rkisp1_runtime_suspend(struct device *dev)
 	return pinctrl_pm_select_sleep_state(dev);
 }
 
-static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
+static int rkisp1_runtime_resume(struct device *dev)
 {
 	struct rkisp1_device *rkisp1 = dev_get_drvdata(dev);
 	int ret;
@@ -351,9 +351,8 @@ static int __maybe_unused rkisp1_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rkisp1_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
-	SET_RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+	RUNTIME_PM_OPS(rkisp1_runtime_suspend, rkisp1_runtime_resume, NULL)
 };
 
 /* ----------------------------------------------------------------------------
@@ -815,7 +814,7 @@ static struct platform_driver rkisp1_drv = {
 	.driver = {
 		.name = RKISP1_DRIVER_NAME,
 		.of_match_table = of_match_ptr(rkisp1_of_match),
-		.pm = &rkisp1_pm_ops,
+		.pm = pm_ptr(&rkisp1_pm_ops),
 	},
 	.probe = rkisp1_probe,
 	.remove = rkisp1_remove,
-- 
2.55.0


