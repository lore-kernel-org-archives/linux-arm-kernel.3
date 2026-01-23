Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D2AD77882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBIshKT9pcDK4upOo+KLCLwDUUbMAOT4pL6Hqds/Jmw=; b=EWEVsURMAADYUwtDj9n5XSQA1V
	bsNt0GidjyXHtzNiOYbk1uycPQ6KHmHuYybyqmtc+QdwnSBWF+hcdvu/KZqILAshdxdqSLM8p9J8k
	KW7ZhnZqEdZOyT8Op0zfkKykRtH6ynI+wXbisXMPKPk43nz1BDwLex/yzSyl2h9MiET3b49RlGLvP
	h3xoy7ESp5w3KZnNPgdo6Rj5pF9CVu2KR90M9YpGxrLcvpwr67hMeG2aps2w1sKoUjCCP7GoyddyU
	EXlmitrLCL3QZJbF25DVzzMY/wh1D5IJdIqjT8H1oBVnTi0zHPte/sHBXAZXrFiFuIX6Y0LSxVMiW
	gDJgx48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK71-00000009Csw-3AMd;
	Fri, 23 Jan 2026 16:34:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjK70-00000009Crd-0jXO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:34:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 531B960135;
	Fri, 23 Jan 2026 16:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA5DAC19424;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186057;
	bh=/kZ+kma1og4vRIL1r88KYLIWI/ylSgoxJtILoW3MkpQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bVi/QwtIw8uqTnKTsXNGme0jiBrWH4bvY4Sx7oJFH+8f1yWf5sM1sPScZgOCyMs4P
	 LNY1u0cP4zLS9u86fuaKM3kYVfJMxsqgiEL/OJqPmo4IvpN0WNoPXlvMDwEAiA+A2h
	 REcR9DOVBiV6nVVevUJ+m05MVhQE3wsKxlvzg4DI29DlbBtrjHdVV8VFY8R2V7LkY2
	 PkMow6Y1MU4m9dBkzjdW4GeDlzu2bBANtTOc8Rtp7wY1OZ5BN76Uzt7DEyt8p2jGr2
	 FKIWh9/KtC97qgHZI+bwXtk0heCR5RtgRUz/t3yg5mLAcYYx+lQxEuRzczBLLrh653
	 EjLKM7Ffmi13g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0BA7D72371;
	Fri, 23 Jan 2026 16:34:16 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 16:34:16 +0000
Subject: [PATCH v4 3/5] i2c: xiic: switch to devm_ managed apis to simplify
 the error code paths
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v4-3-4a3eba3510ce@nexthop.ai>
References: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v4-0-4a3eba3510ce@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769186056; l=2482;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=XbK+CsMc3APHOOXbUz+q5n+IsW+oIYdY5pzCy9rqMqo=;
 b=k35E0GXsoob5esmQwD9M0HPEhmsWR+DRjgaOdoF/JhihDiy794tnusnmsq940m+6M9wGWHHay
 2cN6x42rEPtBYXqH/cx6X7+8g/k4VecVLBqBzOnFeps5v/ri4qOyyur
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Simplify the error code paths by switching devm_mutex_init() and
devm_pm_runtime_set_active_enabled().

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 2da7e9d1d5ca..6d47c9972719 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1462,7 +1462,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
-	mutex_init(&i2c->lock);
+	ret = devm_mutex_init(&pdev->dev, &i2c->lock);
+	if (ret < 0)
+		return ret;
+
 	spin_lock_init(&i2c->atomic_lock);
 
 	i2c->clk = devm_clk_get_optional_enabled(dev, NULL);
@@ -1473,8 +1476,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->dev = dev;
 	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret < 0)
+		return ret;
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1489,7 +1493,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Cannot claim IRQ\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	i2c->singlemaster =
@@ -1510,14 +1514,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = xiic_reinit(i2c);
 	if (ret < 0) {
 		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	if (pdata) {
@@ -1529,12 +1533,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	dev_dbg(dev, "mmio %08lx irq %d scl clock frequency %d\n",
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
-	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
-
 	return ret;
 }
 
@@ -1556,8 +1554,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(dev);
-	pm_runtime_disable(dev);
-	pm_runtime_set_suspended(dev);
 	pm_runtime_dont_use_autosuspend(dev);
 }
 

-- 
2.52.0



