Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A48C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 03:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKFxldesfAj8FdEDKAwfFPd/txX/9A+5mA0y6fZJndM=; b=cXM1Xhmxead4vwp7pGpqP+I8sS
	Bchpzvd5Zq9kXOiU4QNPfUTNFjGBz8Sw8ngEVe7ygNuLEgdGSzCCuuwTo2gARtrfbxMEbw/kf/Gcs
	RGbN7t4Q8XFcaCXS1uiDlu/E5uL+ypBge+lQ2a0vJLaNovM78mFiXGqD+bXkT7YEbZL2mZ1fw+RSr
	cUxltT+D2Tdcm17FEDA0CAUH1kSo1yF6NP1NejrGZ9mLf4Tv3Z0SY0ZpbwNk7nlAZ/0JoDULtQaiv
	kMDIGTMKNeSTx51AxDtVnjos7xd/50K60/oiMaIqipB+ww4NLRckuLlLs6fw5pB7kcINElx3lTKIN
	71ulaMuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7P2j-0000000DNJg-0Y7D;
	Fri, 18 Sep 2026 03:13:41 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7P2g-0000000DNIw-3FGE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 03:13:39 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so265254a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 20:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789701217; x=1790306017; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKFxldesfAj8FdEDKAwfFPd/txX/9A+5mA0y6fZJndM=;
        b=MI3BISjXiXCDurTxpfF4GPfBZgCE+cr/ijN3nuZpbC8quMi0YxPQRam0JtrNFdtngw
         mvB7HrZTiiE459KAl7+0Y9VO1N2l/B8epge2KapUPSeEkqFtka+KMbq1XJUGvYcmm2zJ
         9DaEzkqh4IQT65cbTCpZUJvuH/n1EvwB/Cr1UciQoEkqak5o/5dgb2pQ1/4TWsulDJAG
         tKqX/L54XWJust+QHHVGr9RNVxwxs/sovllD5UL+iJ+0Tq9gWlKIHdYWDKRrXpnRcjCf
         NJ1/ZFGCAdPlzqWCLMRtZ9aLEPPH8tn0DJZeDxJ5bVY2kp+uRYIEvCdj73MQ3BLISTbo
         MvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701217; x=1790306017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKFxldesfAj8FdEDKAwfFPd/txX/9A+5mA0y6fZJndM=;
        b=eqDWPEsqFVj0M8Y6VbSe3MhuE3qcHlqbDZNAPxkFisv7+zQ7x9yyx8/p+EFr0Nqoim
         AH+40k5Ai+5ri+/Zmqyo5Scm8Py/CPJVsXeQVbxXHZVZasJSWzHlRwT8aequZpbbS69L
         FTLwvuU+rDYX1YQ6VyblAxLBnQ2PAvyLgI40K2k2+P6KPSElzDUdhb01Z5gb1vDt49Ux
         e5HpTO2unB58TASNKzB8WWj8vg1nNCuxYLOtK7e+IkhZc/3IlOojgOQldymxjsq3mcHY
         JWdC1wcMlctJ7y5ZmTdxyvQVCCMli7FBEJf3kCeMZn9bYriDPRnOf6ZSkwVXdJQ5ZzmN
         s0VQ==
X-Forwarded-Encrypted: i=1; AKwUvByiUH9PIqeOK5o+who+ehIs5h6VIdsp2X3CVaZwtiYxM0zqpZD3zBloWGSwJlbEE/yNLJ5waGIrNpns/36dGZc8@lists.infradead.org
X-Gm-Message-State: AFuF++nE/6WL5zt/mdoz7rV5qh/OLgc2A4xZ68QuhwRQCOGC4hcsLWfe
	5B+kpvf3HID/V4eRDxqbPAI9iUgq/m33uMDz4zVgnmomZhV9KeXLHmvc
X-Gm-Gg: AYBFou2QFdLXDbzIWUrGX/PsXaDWab3wwyY/zYhyg4CIp2m+9OqNw3IT8oN/yXS7Gqd
	bYG7aPaEe73hRBw0fbizcGetIznPmMjgO4UHyN3bZsfiOK+u4wvoEw46pmwPfVJ9px3sSTaur7T
	+9OaGS2pj5M2Q/8GTcIDT16i2HZA1HQez4Vhklje4sdMK3sbVhzHIyrGVgvuNz1wNCPYrmQsz0q
	sGJLWtqFMTvPjkmcDndHPOXKy605yrk/+rnGIOfl9xwEVFDqmiGR+vE1MqBzIO3jCNbIyThuwlp
	k4HvCp2qPh23YKNeTYtrb+yfr3PqHPU86jg8mjAqbe52NIM8+h7WuRFCUT1XRiCKA5iZy2Mjzru
	FAZISD6UG8n6CGhIO3XdJ/wDnKXFVN7LCzpehrpd44pR7tpuJ2cjVtSQMGk5HMOK0gJxvj0asHu
	hSZYpRst5+42ERTRJQyhvz8IDiq3AdCWVWYZpqApcbmgeNtGWT29/BtQ==
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-39e55071981mr2385940a91.31.1789701217262;
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a0e860asm827971a91.1.2026.09.17.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Miaoqian Lin <linmq006@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
Date: Fri, 18 Sep 2026 11:13:22 +0800
Message-ID: <20260918031323.3376849-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201338_836482_7266B9B7 
X-CRM114-Status: GOOD (  14.68  )
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

imx_gpc_old_dt_init() initializes all power domains described by
of_id_data->num_domains. Its probe failure path removes all of these
domains, but imx_gpc_remove() only removes the PU and ARM domains.

On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
additional DISPLAY and PCI generic power domains can remain registered
after the GPC driver is removed.

Remove all initialized power domains in reverse order. Keep releasing
the PU clocks immediately after the PU domain has been successfully
removed.

This issue was found by manual code inspection.

Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regression")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pmdomain/imx/gpc.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a22..5766e3b40470 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -502,8 +502,10 @@ static int imx_gpc_probe(struct platform_device *pdev)
 
 static void imx_gpc_remove(struct platform_device *pdev)
 {
+	const struct imx_gpc_dt_data *of_id_data =
+		device_get_match_data(&pdev->dev);
 	struct device_node *pgc_node;
-	int ret;
+	int i, ret;
 
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
 
@@ -519,19 +521,18 @@ static void imx_gpc_remove(struct platform_device *pdev)
 	if (!pgc_node) {
 		of_genpd_del_provider(pdev->dev.of_node);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove PU power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
-		}
-		imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
+		for (i = of_id_data->num_domains - 1; i >= 0; i--) {
+			ret = pm_genpd_remove(&imx_gpc_domains[i].base);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to remove %s power domain (%pe)\n",
+					imx_gpc_domains[i].base.name,
+					ERR_PTR(ret));
+				return;
+			}
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove ARM power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
+			if (i == GPC_PGC_DOMAIN_PU)
+				imx_pgc_put_clocks(&imx_gpc_domains[i]);
 		}
 	}
 
-- 
2.43.0


