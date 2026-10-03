Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16909CA5FE3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 08:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cix4msqcfYVv2/RRfXCskI530PrFprT29dvCwItO168=; b=lXApzRJ64atn/FcYMALcK63uaw
	eOpH8bOpcK9tOaGsWSViK5NPG+ntx5CCVloT46PZFduipz+ro6088JbULehCoGKraM9xeUYyj4OU2
	FaJ1hPx2M0yCAlHhHTHOb7xM1+R9eRGrkrO+twOuMFcagKc8B7UVwdHIpp5rBPYMV8z47rpYWWGz/
	Zoq+rzzkEaUKbzr1pkFMwbk8xTklhMGK4EIOrTS0mkEQ5eMhcZFb70GfeHSN0BrjDmZt5UOtbxqsr
	q5qthJCGbR6Zrcg9gHY/bqfeqOsthC54Ym6b3KV7l1b2U4dhIj1XoEoBVp9CvhfBRKFRX+Th43WxM
	CGgcP0ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvAb-0000000DBL1-3jor;
	Sat, 03 Oct 2026 08:32:37 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvAX-0000000DBJz-3srH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 08:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Ci
	x4msqcfYVv2/RRfXCskI530PrFprT29dvCwItO168=; b=kwPa6m3DwPYSmXluy2
	0/PqfQsbYJeRXaxzRXqmG5OieA+gu5Ox7ll8xUqgwrsfqG9qAZysMef3x5fbbw1n
	9H+tUnPiq/mZ7XjCcUdGtGYw7xwA6hOIhywalJ0s6qN2Y8Pv+4U3LfiihVMwJBWq
	xUGSqSlicY4jWIUt8+ry1vQ1M=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3dzGDvcBqKMk7CA--.47308S6;
	Sat, 03 Oct 2026 16:32:13 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH v2 4/4] pinctrl: samsung: free maps on DT map failure
Date: Sat,  3 Oct 2026 16:31:57 +0800
Message-Id: <20261003083200.459705-5-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261003083200.459705-1-yaojiale02@163.com>
References: <20261003083200.459705-1-yaojiale02@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3dzGDvcBqKMk7CA--.47308S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kw1rurWrXF1rZF18tryUGFg_yoW8ArWxpr
	s3WFsxJF4rJ3Z3GFWft345Zry3Aan3JryUWayjg348ZFs8AFsru34UKFyUZF1DKrZ5Wr4S
	9rZxCFyYkayYq3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRy5l8UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzg1dl2rAvY0SVwAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_013235_661486_43894639 
X-CRM114-Status: GOOD (  13.49  )
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

samsung_dt_subnode_to_map() can reserve map storage before adding
configuration entries.  The no-child path returns its error directly, and
the child path frees mappings on failure.

Use one error path that frees the accumulated map in both cases.  The
caller ignores the output parameters when the mapping callback returns an
error, so they do not need to be reset after freeing the map.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 24 ++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index 5ecc9ed4c44d..0a1e6063fb5f 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -259,22 +259,28 @@ static int samsung_dt_node_to_map(struct pinctrl_dev *pctldev,
 	*map = NULL;
 	*num_maps = 0;
 
-	if (!of_get_child_count(np_config))
-		return samsung_dt_subnode_to_map(drvdata, pctldev->dev,
-							np_config, map,
-							&reserved_maps,
-							num_maps);
+	if (!of_get_child_count(np_config)) {
+		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev,
+						np_config, map, &reserved_maps,
+						num_maps);
+		if (ret < 0)
+			goto err_free_map;
+
+		return 0;
+	}
 
 	for_each_child_of_node_scoped(np_config, np) {
 		ret = samsung_dt_subnode_to_map(drvdata, pctldev->dev, np, map,
 						&reserved_maps, num_maps);
-		if (ret < 0) {
-			samsung_dt_free_map(pctldev, *map, *num_maps);
-			return ret;
-		}
+		if (ret < 0)
+			goto err_free_map;
 	}
 
 	return 0;
+
+err_free_map:
+	samsung_dt_free_map(pctldev, *map, *num_maps);
+	return ret;
 }
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.34.1


