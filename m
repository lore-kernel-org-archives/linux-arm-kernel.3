Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60DE9D6CFBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 03:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGCHKV0UnLtxPrp1o4XgfPZMeWnD2F0Sj7TSTZVgkgI=; b=iaBsN3aHbfMV9F7pCY57uXN/QG
	MV6y7gaXC/KkTf9FFZCSqEo2nBBQjeqzo0E0PnX1DZhGykMXgu5PZ44PxRHfTDG1T6fsAErhSIzfO
	0ecD3MKHBnZA/57FqQ0Ux2CHY/s/cMrrymwVPfz1weggup0qjQGWGbPUbt5X9sxuiK8zWSVtFmPNe
	OEw0Ak+vFFWnBDuI7ZjPkIVV38eTPEQpXMPVHhBymVlHwI4KuR7Efkr4HHEVqHc8k6D6R5VXOkKB7
	LZTKQyc++ntT4xmHcc8vy6FdLXD+4UI8QIOEi8NwvrpAqdYHhmmolBje5wzbGtFnlNJXRBUJoPwKk
	lfXRGdNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj83G-000000088z7-2fxF;
	Fri, 23 Jan 2026 03:41:38 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj83C-000000088wH-18bV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 03:41:35 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 23 Jan
 2026 11:41:23 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 23 Jan 2026 11:41:23 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 23 Jan 2026 11:41:24 +0800
Subject: [PATCH v2 2/3] pinctrl: single: Allow probe to continue if mem
 region busy
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260123-upstream_pinctrl_single-v2-2-40f8063cc5a2@aspeedtech.com>
References: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
In-Reply-To: <20260123-upstream_pinctrl_single-v2-0-40f8063cc5a2@aspeedtech.com>
To: Tony Lindgren <tony@atomide.com>, Haojian Zhuang
	<haojian.zhuang@linaro.org>, Linus Walleij <linusw@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<andrew@codeconstruct.com.au>, <BMC-SW@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769139683; l=1297;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=9aHMGO/anwtWi10C7W8Ai9OrN9GsPC2DEymoczNF6rQ=;
 b=aC26hM/5lK5cZSG9V/1e7i3Y0dO21BHJzfl10I20XP7hc0ehyPeSZt/1D/st4qqOUGDNQWeMq
 /oGQrN5J3Z5C+IVl3NQ2gKiShy7VO6IaH+Mw0O9EP/TyyyV5QxTUJLB
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_194134_317041_A18ECAB0 
X-CRM114-Status: GOOD (  10.12  )
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

Skip exclusive memory region reservation failure during probe and
continue initialization with a warning. This enables support for
systems where the memory region may already be reserved, improving
probe robustness.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/pinctrl/pinctrl-single.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 757c22cc09f3..e65ae737b4c5 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1910,13 +1910,13 @@ static int pcs_probe(struct platform_device *pdev)
 
 	pcs->res = devm_request_mem_region(pcs->dev, res->start,
 			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
+	if (!pcs->res)
+		dev_warn(pcs->dev, "mem_region busy, continuing without reservation\n");
+	else
+		res = pcs->res;
 
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
+	pcs->size = resource_size(res);
+	pcs->base = devm_ioremap(pcs->dev, res->start, pcs->size);
 	if (!pcs->base) {
 		dev_err(pcs->dev, "could not ioremap\n");
 		return -ENODEV;

-- 
2.34.1


