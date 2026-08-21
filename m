Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B13C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=16wrpIYLOI0m5wqyuFzJT5HPywTkMkA0wd49jWhLIno=; b=nBt/fjblQfiFxK7MWAT70AnQit
	YE/IyqFUc9QM11vzj9zL34p59R5lW2vXJtsMVO/mRUVV6Pdshqta9Yk1nAtF0Xt8dy2a2lx7plyE6
	yCYlGT0cevRQ9dv9xkaD59kOXzl2Dhlifdwinh3VsV3EBicwgFcaF2a6mq2NVDj6AZhhGqa69usaj
	v5+LGIKMbr8qrtj2sVbY0OrQ9Z99npjSd/y0TYP8TsJi7OeQOwdR6ab1zvsZU6JhfP5MDIMFtBTKq
	qbcWE4q/fTWhU8DljBnyAGxmKfETgwurs31XV5vVdvhDV9WD/di9gXhamZzc3BzU+lSjRGkevRn5q
	HQtNz9Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJPk-0000000Cfm9-126N;
	Fri, 21 Aug 2026 07:11:44 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxJPh-0000000Cflm-1n0p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 07:11:42 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2cf50c6f235so8818335ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 00:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787296300; x=1787901100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=16wrpIYLOI0m5wqyuFzJT5HPywTkMkA0wd49jWhLIno=;
        b=GMTH1COFRS2IeWmeqAstMbRyeECFT0HnbkAmyUygoY4yLKU79olWwU2TfLZg6LnR3+
         q2XnCgN3LaQVb4uhAJ/IKy1NavIswL/mhZKul+Zu+SR6F6VQ9eI9Gk7KZD9n0VwI6Hep
         nA96Al4XskKyH8hZ/DssJy9p795D5uaP2zfO/HEFFViShXY8VuZmUU/r6xzkep7Uukc/
         JEEQBpKzgiw5ACehlwxMRJJZ00rplQHTVykiBLfaN6dl2Xdl4y9KgMWtNbZZUoHR/TRl
         Xis19CT77RZZMrNEeVxUlT1gUMddmR3himDWiA3DqbrXT0O9s2SMImQWHa7bbtz5Boy0
         9nZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296300; x=1787901100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=16wrpIYLOI0m5wqyuFzJT5HPywTkMkA0wd49jWhLIno=;
        b=cNOmWyu3Id9omD5yVYRnQGT52lUk+POzGTuKpfZ6zJcay3qj+eEz+xnMetml42HyTV
         jLs1uFvAyzP1YTzx2a6jbvtXbBIJpNQTPOKRD7UXi/R3lVfdmHhk6iZyWw40/geSxvDQ
         gvTHRIK9NYlqSncbBLRyDc7R0niEPA0UrUkzwGzHOviYt1/Ium8s3UrgnarYHqi46Gyb
         P5sTlyIQWl/k48o+FSfcdPcrRHr0JjklwDD/pORiXuxJ+yuWj2t/Cb0isdvupOGgys8C
         42RsV5frt/zFdID+G5xG+QvXIR284+WYpA2VQ7VDSdz7eFkrLiW1m2JIeQ9Z0OZ7Mbdq
         DtpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq44oBRJ0Iy8POGfYieB/e/RI8LTUgk6iVE5l8T4Xhb+0F3yYRWtumOVZbIfRM2vSEgb6sF+IXSL+GeQ6p+WnRi@lists.infradead.org
X-Gm-Message-State: AFuF++n2AxgLXAvOMyVEoXxE/3EbOqDGaXXE+2vF0K3DkDE4RrwEy9f2
	Dhv2kxvO4eivBG7t7hh0O4It4zoovMCNBmfad/gwlhuH5aDKWdCQjGE=
X-Gm-Gg: AR+sD11f2hvb6TOt3GvC42sQc86MrunEn9QPpiX/mMigdH5NHEqpCPqFi49tor9CPRp
	2saz/aojdao1+8tk28wKN677rtiFWhD2jfHNM1LPmKDP01Xm5QkjgXSNkTTmMI4F8iMdZ5yjVKO
	pDXpO9KxO9xtgD9Fc/80tLhjAaVafMBj9yG3dXuwytc9IXN6V1HZmJ4GAaJGcaRbo6SCIk30R8y
	ubrsVJ2ZzNKhaQK4oFI5wGAPC/ctNeDux+Dcwk7hEXxddwTe/nUfZsz6AKFhm+Geul9M3O1t29l
	C9i1ivCA/IPBaO/bV39Ha8wOh13IjtZ33GfBWresT23SWU76981/EoB8PgYyU2QjR8oyr/b/bs7
	Igsm0mlybtpo/YixRPWewyF4VNtDpccSvRU82/0WsZL7q7K6wDx6CdYT8Kmh/vW4axbN1IHtybF
	pqYKSX6OQvnKUBCGy6dAwa2O5U1RpcK+A0sDqA198umdPQIV23mDacOvAW9pTFfBih9cyewQ76S
	Q==
X-Received: by 2002:a17:902:fc4f:b0:2d5:e9d5:8ae with SMTP id d9443c01a7336-2d64adf7718mr90616605ad.5.1787296299719;
        Fri, 21 Aug 2026 00:11:39 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d5552cesm14793585ad.1.2026.08.21.00.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 00:11:39 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: laurent.pinchart@ideasonboard.com
Cc: mchehab@kernel.org,
	michal.simek@amd.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] [media] v4l: xilinx: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 14:11:24 +0700
Message-ID: <20260821071125.213335-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_001141_469807_E75182F5 
X-CRM114-Status: GOOD (  12.44  )
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

Convert the deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS
and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from its suspend and resume callbacks,
also reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/media/platform/xilinx/xilinx-tpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-tpg.c b/drivers/media/platform/xilinx/xilinx-tpg.c
index 7deec6e37edc..8bac01084605 100644
--- a/drivers/media/platform/xilinx/xilinx-tpg.c
+++ b/drivers/media/platform/xilinx/xilinx-tpg.c
@@ -686,7 +686,7 @@ static const struct media_entity_operations xtpg_media_ops = {
  * Power Management
  */
 
-static int __maybe_unused xtpg_pm_suspend(struct device *dev)
+static int xtpg_pm_suspend(struct device *dev)
 {
 	struct xtpg_device *xtpg = dev_get_drvdata(dev);
 
@@ -695,7 +695,7 @@ static int __maybe_unused xtpg_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xtpg_pm_resume(struct device *dev)
+static int xtpg_pm_resume(struct device *dev)
 {
 	struct xtpg_device *xtpg = dev_get_drvdata(dev);
 
@@ -895,7 +895,7 @@ static void xtpg_remove(struct platform_device *pdev)
 	xvip_cleanup_resources(&xtpg->xvip);
 }
 
-static SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xtpg_pm_ops, xtpg_pm_suspend, xtpg_pm_resume);
 
 static const struct of_device_id xtpg_of_id_table[] = {
 	{ .compatible = "xlnx,v-tpg-5.0" },
@@ -906,7 +906,7 @@ MODULE_DEVICE_TABLE(of, xtpg_of_id_table);
 static struct platform_driver xtpg_driver = {
 	.driver = {
 		.name		= "xilinx-tpg",
-		.pm		= &xtpg_pm_ops,
+		.pm		= pm_sleep_ptr(&xtpg_pm_ops),
 		.of_match_table	= xtpg_of_id_table,
 	},
 	.probe			= xtpg_probe,
-- 
2.53.0


