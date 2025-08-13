Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF45CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSNYE0+8wGItL53UywO960XlXbzNXz6cVLTWx6ycvcQ=; b=j/L/7ZDQKnT5Hk4sp1xcgNs34h
	84Abn0g0JbEKM6wa1BvbrP7dHPAoEmP3rcwbMBjeg5AcgbS49w/bS7A+QWfGxsIZuLW8ld2WxAJyi
	h6tlL43QHVq86Tv6xtYKp/g0z2grlaMT8ziuih8npQTHfNvTni9P+UwM1W1iIUBQhDL4fhyYYAeEr
	Cj5LrXXxiW+oPJFQESjEatvdkZbQqqQkeeM1YMoct8ZnngqMt2MJffDj4ZpBXJ9CsuNdTOlvjUWJl
	o/imC2rQRW7oF/AIX5E+vXdb3WgrTESteq+JMB65hI0kT4Dvy7w/cKrtUFUMcl3WXWJ3cKQskkcko
	SuCMezCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umG1F-0000000EhVF-2ptC;
	Wed, 13 Aug 2025 18:16:14 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umE9X-0000000ELlZ-40me
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:16:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rSNYE0+8wGItL53UywO960XlXbzNXz6cVLTWx6ycvcQ=; b=ISvYTg
	WhDGx+Wy35plAXwYUFhPtCCl8PJ7ohyke+YARSl/rdaBMTQW3aCYHG03tjxQ3RL5
	lS+Qt6fczyFDZiUyiSsLcOqjcPnHweE45GquDtv3yDwOOfJeYqX+FO04280N2not
	qNchAZ5650rZh7EQu6rRzKGoSADIcpQhBz80xUCVduS4Du5I+EMJhGuv8Yq0Z39i
	5J72ESW08BF/zWZ9VMrTzGrzFYsdgA8xRK1ieDgD1AMY0mQvc1NIvwMO8n3wT90R
	7v2ibIbmJc/R/xdY1JWKehrd2NVpNVmXDKcn9IwCnPHabtpqVE+Y8XbYFgnTkCz+
	TRfrV52Gre5fOrPA==
Received: (qmail 695845 invoked from network); 13 Aug 2025 18:16:32 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2025 18:16:32 +0200
X-UD-Smtp-Session: l3s3148p1@1HHeekE8Er1tKLKq
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 20/21] thermal: remove unneeded 'fast_io' parameter in regmap_config
Date: Wed, 13 Aug 2025 18:15:06 +0200
Message-ID: <20250813161517.4746-21-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_091640_267996_2CB6DCC8 
X-CRM114-Status: GOOD (  10.93  )
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

When using MMIO with regmap, fast_io is implied. No need to set it
again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
No dependencies, can be applied directly to the subsystem tree. Buildbot is
happy, too.

 drivers/thermal/armada_thermal.c | 1 -
 drivers/thermal/sun8i_thermal.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/thermal/armada_thermal.c b/drivers/thermal/armada_thermal.c
index c2fbdb534f61..252d5afecea1 100644
--- a/drivers/thermal/armada_thermal.c
+++ b/drivers/thermal/armada_thermal.c
@@ -722,7 +722,6 @@ static const struct regmap_config armada_thermal_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
-	.fast_io = true,
 };
 
 static int armada_thermal_probe_legacy(struct platform_device *pdev,
diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 22674790629a..284684137c43 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -149,7 +149,6 @@ static const struct regmap_config config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.fast_io = true,
 	.max_register = 0xfc,
 };
 
-- 
2.47.2


