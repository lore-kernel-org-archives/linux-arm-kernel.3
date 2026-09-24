Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE89C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaWkFoUOQ+u9WS91tjqMuEOPGp9Db2ThXslkCbREcik=; b=38F0Km0lpHa1cUGcW/hIXBX8iI
	nLlLuvuI7WAKz+ODSIrnO6QIzhhBvrtpt9IAwaWA/bwwTXx8r+K5L5O4SzeN8I9372k1uLVYt2vIc
	nZHVNocaXwAWNyOhv3COh2nxp7mwbNXwoKr8KmYHkFQyqFR4yqs7yXBfLV8M/ivhIyLgm6Yns+y+T
	QTHUNhroNFBC6YsX4axLJ73LRn7ZIYtXvLKBPXQQtpNivmR8Y//yYXbVJfkT1u3RKWCIRQwYIwPrr
	g62bVmMpH96gJyKtrvMaOEp+j2TOg4BSq6Hrdp/X0WYNZeXiepYFWNpWXnlANqMkGPZR2d76ECY9u
	sEdakEZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kOD-0000000BFxL-0zoG;
	Thu, 24 Sep 2026 14:25:33 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9kOB-0000000BFwi-1uLc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 14:25:32 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so473697a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790259930; x=1790864730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaWkFoUOQ+u9WS91tjqMuEOPGp9Db2ThXslkCbREcik=;
        b=ki9JS6BHjbu1w31udXOQtVeYhgZcI9luQulI8uw61iGVv0gklk6eJ2jYluPIDgwmAW
         xAP7o76yO/P77vIpfXWb6JWhR31QZEBaLlWI+g8nleqdAvU+Wd3F3pX3N5ML9HC04zYI
         DNd5meCKgELyIA5QqW4SPKEX7yKj/EbQrSEMUJnmHvzuUuRMpfAD/+som7yTwvsjVuCT
         vrqWoiyCWD3wVdsSXEjkj/lKs9F1hVJSX0wvaDVcisziIISrJW8mvEhoQu476jxg+yYz
         V/HfU/zaPbSRD3HOErcniJIL8XjW3UD9V/BxqD4YRZj+aVgUHjBghSLI3EWKX/GbrLji
         G3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790259930; x=1790864730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaWkFoUOQ+u9WS91tjqMuEOPGp9Db2ThXslkCbREcik=;
        b=wtNe8rZi/JrnEpF5U2B7UW2TlC0DjmiVsw+ARVCdVicWk81hJuO4pW5CUU42WR14cI
         /QJf8D9LliyqrdTF5jguDeHVDoRUixEOhHXRTJ7VRxHD5Jdd7P+A126UJTWgGuiY3jW6
         fcBg/wCnEQa+fntr1n/CBDi3xcaQsUofjzmFU24yJ9FfDjGAwnObE8NrlMpyLRaaZUEg
         Bpm3f4J66i/Wr0ll1GALszLxpnlyHdPDr7PTgSjayLGc218rmO5Sny/EKYe6PDIba4q1
         ALA2POHX6SJtIyYwPW9ldXx2y0ucrPK5KCCjtyBuVC+LUzzhWTURf3DFFDn1VcRrCxET
         7Srg==
X-Forwarded-Encrypted: i=1; AKwUvBzcR28Z9g0+ItcGRN2iM3kbjZJGbvro2mSAXHiUS2zr9rNepMFxmq4qS+zSnUG8rGyVGU9vdpPm6nk2rCWQxgmK@lists.infradead.org
X-Gm-Message-State: AFuF++n2aO8haWgq51AWdxVspqb30uRkO8t3x20sEhMfMSuqyYyL/yCK
	SqzRZ9cO7vxoEgor15nw3O0t5MCY3rp3wlQV8VhtZ4Ql8mbC4rJMr1TT
X-Gm-Gg: AYBFou2icR7GxXOlNnZJXFDn+spOpJmz0nPdsE6kJyWVWHyZ6z5oy1CjqNXR905iXrI
	SpAOkNh8W5zxlccw0cNj7VggWScUVG95ElZ+a792E8QdrOts7EToo71ylmNAT8F21oQoOWfrGwL
	uJTZY7fCyTNlnquwGJQCCAfAZSNEqVihi2C8ZKJNOJpmYVPcRhN3SXXFlnkYtDFwvs+TeOc9Gjb
	sNWZqCg1q0EUzgQq7G6wH3U0o9uV0F5BY73VuKME5JHzihDjjJ4bM69h3PCS8i+cxNzl1KW5942
	ibSMl/wYzaRi2t6++ybxpG+SIE2Q1suUWDXyeXW45uD5vYzhyt4A80Jy1gL6QbovbPRc+DtK5Z3
	1XWLShU2bZpgNF7tJ+u3r3c4yqyqL24PbpNW2ktw/vRQbgQyIK6HVxoKtNyiPEe56yMz3LHRuLy
	SdNMLdHQhhcMf/vyC4dJRahh5cMNQb5GGOQfyoQaez07SBYoitYZEDdg==
X-Received: by 2002:a05:6a00:1c8a:b0:87c:f3e5:ebda with SMTP id d2e1a72fcca58-87e99e3efcemr1451856b3a.0.1790259930408;
        Thu, 24 Sep 2026 07:25:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1afb99f0sm3157310b3a.6.2026.09.24.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:25:29 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miaoqian Lin <linmq006@gmail.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Shawn Guo <shawnguo@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2] pmdomain: imx: gpc: remove all initialized power domains
Date: Thu, 24 Sep 2026 22:25:20 +0800
Message-ID: <20260924142520.1594149-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_072531_501252_7D60AFA1 
X-CRM114-Status: GOOD (  14.45  )
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
of_id_data->num_domains, while imx_gpc_remove() only removes the PU and
ARM domains.

Use the match data to remove all initialized power domains in reverse
order. Release the PU clocks after the PU domain is removed.

This issue was found by manual code inspection.

Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regression")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v2:
  - Check the result of device_get_match_data() before using it.
  - Use an unsigned num_domains variable and a decrementing while loop,
    as suggested by Andy Shevchenko.

 drivers/pmdomain/imx/gpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a22..d83fb37e2297 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -502,7 +502,9 @@ static int imx_gpc_probe(struct platform_device *pdev)
 
 static void imx_gpc_remove(struct platform_device *pdev)
 {
+	const struct imx_gpc_dt_data *of_id_data;
 	struct device_node *pgc_node;
+	unsigned int num_domains;
 	int ret;
 
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
@@ -519,20 +521,23 @@ static void imx_gpc_remove(struct platform_device *pdev)
 	if (!pgc_node) {
 		of_genpd_del_provider(pdev->dev.of_node);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove PU power domain (%pe)\n",
-				ERR_PTR(ret));
+		of_id_data = device_get_match_data(&pdev->dev);
+		if (!of_id_data)
 			return;
-		}
-		imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove ARM power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
-		}
+		num_domains = of_id_data->num_domains;
+		while (num_domains--) {
+			ret = pm_genpd_remove(&imx_gpc_domains[num_domains].base);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to remove %s power domain (%pe)\n",
+					imx_gpc_domains[num_domains].base.name,
+					ERR_PTR(ret));
+				return;
+			}
+
+		if (num_domains == GPC_PGC_DOMAIN_PU)
+			imx_pgc_put_clocks(&imx_gpc_domains[num_domains]);
 	}
 
 	of_node_put(pgc_node);
-- 
2.43.0


