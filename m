Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E20C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 05:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vNe4voG+HZy312HYXWqdw6yd5RvG7d5KZ0iSA+8nUEo=; b=kciI4YzVYrdVBbkKXBUS4IejF8
	UznAYKNGaJ0W/UPx8xe+jlluDDl6XxAs9F826N2w8mSXnm7mFaTQ6x7MLcpbYaF3OgMdSU6qwRrk4
	NidGFtdCUG2Bu6ZtvMnWP47eD7vW1PjIH3EYBYwzucK3cY3LCJB6GBYo1ofP139E1peOLUzGkgPoZ
	sDwp7ZHm4LazYeOILiA/yOrJuJKI4/x3ehUPcIUFjYB7DE0UlzPtxDN2BIZH9oUp877pIkfvEus5K
	dDPUniQVKCJ8jctGw4UUbqKD99H6Kh9ik1t6x4cb3GX3KZmFWuYe4ul48qN8j0BK2aER3oFwSYAwm
	+VGC1ZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUQg-000000020tz-4ABT;
	Tue, 01 Apr 2025 05:44:55 +0000
Received: from mail-m3289.qiye.163.com ([220.197.32.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUOs-000000020o1-0mDV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 05:43:04 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10467efe9;
	Tue, 1 Apr 2025 13:42:53 +0800 (GMT+08:00)
From: Hongbo Yao <andy.xu@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andy.xu@hj-micro.com,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH] perf: arm-ni: Fix missing platform_set_drvdata()
Date: Tue,  1 Apr 2025 13:42:48 +0800
Message-ID: <20250401054248.3985814-1-andy.xu@hj-micro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSE9LVh0aTx9JSRpOGU9KTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-HM-Tid: 0a95efdfc08603afkunm10467efe9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6Thw6OjIMHxQXHgIONU0e
	CBxPFDRVSlVKTE9IT0NNSkxPSUhCVTMWGhIXVRoVHwJVAw47ExFWFhIYCRRVGBQWRVlXWRILWUFZ
	SklJVUlJT1VKT0xVSk5DWVdZCAFZQUpITkg3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_224302_390681_69C12023 
X-CRM114-Status: UNSURE (   7.68  )
X-CRM114-Notice: Please train this message.
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

Add missing platform_set_drvdata in arm_ni_probe(), otherwise
calling platform_get_drvdata() in remove returns NULL.

Fixes: 4d5a7680f2b4 ("perf: Add driver for Arm NI-700 interconnect PMU")
Signed-off-by: Hongbo Yao <andy.xu@hj-micro.com>
---
 drivers/perf/arm-ni.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index ee85577e86b9..da1907b7391d 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -666,6 +666,7 @@ static int arm_ni_probe(struct platform_device *pdev)
 	ni->num_cds = num_cds;
 	ni->part = part;
 	ni->id = atomic_fetch_inc(&id);
+	platform_set_drvdata(pdev, ni);
 
 	for (int v = 0; v < cfg.num_components; v++) {
 		reg = readl_relaxed(cfg.base + NI_CHILD_PTR(v));
-- 
2.43.0


