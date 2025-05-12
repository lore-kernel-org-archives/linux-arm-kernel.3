Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C86FC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 19:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Azf6t9lF8YGj1nwYXP2uxYqJhH+jrHZ4tidk+Nnije8=; b=Y5B5Cweo8RK1+LmI7dOv6yzuH1
	KzxFFf1k/qUu6ArQksV3OeaZODuExj9vpvyC8qaANJvTDh7vAnep5fUnLSRdZNPheq357+inji6Jx
	3J//s2lWUocLGQwy95SfziU1m2ogPZYFFfg3KvCyl+UK35lLqCW4H/FTsvNRfZ5vn9q2kAmfq8+Db
	7jbMmN7HLCHumLDHGhGxyf5qw7nH0fDGSw7aP8vG7NU/gmNsgpdjqbmZHkzLTFYpwUumI03Z2ubib
	zd9RZAz9Y2+0zk3uQwdclXIagasx1KX5I1DNyE3DZBd2SMi/b8JJQE0jXGBxx4sPstgOO8T0y0CAE
	GpKppP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYU6-0000000AUJU-0SJa;
	Mon, 12 May 2025 19:06:42 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYLF-0000000AT6I-2pWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 18:57:35 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIvSK42098516
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 13:57:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747076248;
	bh=Azf6t9lF8YGj1nwYXP2uxYqJhH+jrHZ4tidk+Nnije8=;
	h=From:To:CC:Subject:Date;
	b=rMgxsB8gc8siM/0VHDiLFaMXxJCH6JnMt6D/TOsWZ8TsGALb6T4aAtAnlcz6u72tH
	 wrarc5dM5s4TruJXZyh3cFvgmjk1YhBkv8jlz6g/ZsZxcCotgZ+GAnPABu6hqQGLVA
	 zwEzb+GuJG3RsbRXX+g0guWa/H7gmvE9EUOXiyxE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54CIvSsQ018055
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 May 2025 13:57:28 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 May 2025 13:57:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 May 2025 13:57:28 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54CIvSZA072749;
	Mon, 12 May 2025 13:57:28 -0500
From: Nishanth Menon <nm@ti.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Nishanth Menon <nm@ti.com>
Subject: [PATCH] regulator: gpio: Use dev_err_probe
Date: Mon, 12 May 2025 13:57:27 -0500
Message-ID: <20250512185727.2907411-1-nm@ti.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_115733_803987_1FB1C545 
X-CRM114-Status: GOOD (  12.75  )
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

During probe the gpio driver may not yet be available. Use
dev_err_probe to provide just the pertinent log.

Since dev_err_probe takes care of reporting the error value,
drop the redundant ret variable while at it.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Testing based on next-20250512 (includes additional patch) on AM62a7-sk
Before: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-before-L851
After: https://gist.github.com/nmenon/be94f21e83b4260ad3f89e1ae8f0d188#file-after-L806

 drivers/regulator/gpio-regulator.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/regulator/gpio-regulator.c b/drivers/regulator/gpio-regulator.c
index 65927fa2ef16..75bd53445ba7 100644
--- a/drivers/regulator/gpio-regulator.c
+++ b/drivers/regulator/gpio-regulator.c
@@ -240,7 +240,7 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 	struct regulator_config cfg = { };
 	struct regulator_dev *rdev;
 	enum gpiod_flags gflags;
-	int ptr, ret, state, i;
+	int ptr, state, i;
 
 	drvdata = devm_kzalloc(dev, sizeof(struct gpio_regulator_data),
 			       GFP_KERNEL);
@@ -345,11 +345,9 @@ static int gpio_regulator_probe(struct platform_device *pdev)
 		return PTR_ERR(cfg.ena_gpiod);
 
 	rdev = devm_regulator_register(dev, &drvdata->desc, &cfg);
-	if (IS_ERR(rdev)) {
-		ret = PTR_ERR(rdev);
-		dev_err(dev, "Failed to register regulator: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(rdev))
+		return dev_err_probe(dev, PTR_ERR(rdev),
+				     "Failed to register regulator\n");
 
 	platform_set_drvdata(pdev, drvdata);
 
-- 
2.47.0


