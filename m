Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48A6D73EA2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 21:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrjvfPAL3tXfptUlhv+qnEz1FXecFAlX5wk+pdibjo8=; b=yae9+BZDp9/99nrmX+pM6FsLH2
	J/E1zMjEi+Yefenjz1DIMryXLtRXwmwL7C5/DUMy9K4Aw4mTGcxUqw73YxNzXvFGBuXck/LRvHN+g
	tGoST/7Dxb66xHuKKY1w2Gl4TkO62GFKsTkbPOcPQDLnpKvo6my5QiK58NRmzlInSQNSaKZ6zBAvI
	jH93BnxrgPcyJqZhZ3hPF2cgQmN4yekluDilaDiCb0KfMLuquoqg6WDfyeHLd9b18V0UuzSWacrga
	ibmfDdKQx2EtwNuYDF5mD6TcJzD+j1FeJytptyHHUxOJnM4mXYlHjYaN/RZMhLGHi3B6TDRFeZFXq
	++DOz9JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnf-00000000gvc-1In1;
	Thu, 29 Jan 2026 21:43:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlZnT-00000000gqE-2IKx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 21:43:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 00FD7444A7;
	Thu, 29 Jan 2026 21:43:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCED8C19425;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769723005;
	bh=brx5w1sBoP4rgYEbfgYXX3fyk016qy1FYk3BSETc+Z8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CLViJ3O8BuTJDeerrtus6D+JUA5jjUQ/kVFC44PsLzZN9DghX1D0NslbVHS9OesJR
	 9Zg518kHU2EZREGg4KnHpazEkys45FUgujXTRT2nzQ6QFMQvCwSqsymahxxneMKjIz
	 FOD8rD9SUrPaB2q+snlbZbI7V/U13oKMsd+875H5oJgefRxV1Zm/jes5Tmd/KZCVOa
	 Q7QprnNZZWy6JrIgEg7Z6uNCubtG/PijoRcQ/HTSUDI5glgcoLtb9ASxeKNs4sd4O3
	 Yb0FLDM0Uuy8/2+0PFhWp3DYTPQf8gTpq3lzlMp0ZnExnIzsaPSwu33F+Fiu6IsRgP
	 ILu9bjs2akP+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA09D73E9E;
	Thu, 29 Jan 2026 21:43:25 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Thu, 29 Jan 2026 21:43:14 +0000
Subject: [PATCH v7 2/6] i2c: xiic: switch to devres managed APIs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-i2c-xiic-v7-2-727e434897ef@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
In-Reply-To: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769723005; l=2599;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=zykN6ZbMH9Nn+LViqCFPQScoNBhSq6F1OqapwVemGvw=;
 b=zZpDJ7/w7XL3qTy2Z5St/mPn622Dpk7ZY0mmDnZ0wNVsVuRjmUCJkuz6rpxNaaTQi0xuqpAiv
 ND5S89Q0NlvCkscEhooEHlZYXxQtsN2mujwJGv7F1lWvbIne90QrRFn
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_134327_631529_2198A540 
X-CRM114-Status: GOOD (  13.05  )
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

Simplify the error code paths by switching to devres managed helper
functions.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 912a94d4d080..a480cbb86d93 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1462,7 +1462,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
-	mutex_init(&i2c->lock);
+	ret = devm_mutex_init(dev, &i2c->lock);
+	if (ret)
+		return ret;
+
 	spin_lock_init(&i2c->atomic_lock);
 
 	if (is_of_node(dev->fwnode)) {
@@ -1475,8 +1478,9 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	i2c->dev = &pdev->dev;
 	pm_runtime_set_autosuspend_delay(i2c->dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(i2c->dev);
-	pm_runtime_set_active(i2c->dev);
-	pm_runtime_enable(i2c->dev);
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return ret;
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1492,7 +1496,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "Cannot claim IRQ\n");
-		goto err_pm_disable;
+		return ret;
 	}
 
 	i2c->singlemaster =
@@ -1511,16 +1515,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		i2c->endianness = BIG;
 
 	ret = xiic_reinit(i2c);
-	if (ret < 0) {
-		dev_err_probe(&pdev->dev, ret, "Cannot xiic_reinit\n");
-		goto err_pm_disable;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		goto err_pm_disable;
+		return ret;
 	}
 
 	if (pdata) {
@@ -1532,12 +1534,6 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	dev_dbg(&pdev->dev, "mmio %08lx irq %d scl clock frequency %d\n",
 		(unsigned long)res->start, irq, i2c->i2c_clk);
 
-	return 0;
-
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
-
 	return ret;
 }
 
@@ -1558,8 +1554,6 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(i2c->dev);
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 }
 

-- 
2.52.0



