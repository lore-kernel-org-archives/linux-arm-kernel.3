Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA6EC5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BJxkO70MopchWEw+ENjoFGNji5+cFc80kc/rYib2sLU=; b=D8RJxGWVQR5KxxRn+jEpnktIqC
	yqrIi5F/B5zY/7iIcYn/Tgr6F2Aa+Npto60HhrUn5JWlkc25iZ8093lf0kZlMiw3J6pZ8+gSAwNg0
	/xm43sB82h2HeCOjdJk61LJUXA4J2dwQiUBTyIBZw5q7WAB1PQE9XhL+8+XUMueYhIlGhUbKWS2P9
	NSpGbQp+t38eHajPAG4TZjnzELc011i5E6R95G7K5HN684KikkciVxO0XN9ttIiKQOLq+mLj60t8I
	GykfrXrRDRkX3BQMgdA20dldIzMyzLjDSJR/ux87LUBseCelCx8Pb+XVK75zK85Bz3wOwaMGNRPAr
	lHTxXDuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLqP-00000008HMH-2hw8;
	Tue, 18 Aug 2026 15:35:17 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwLqN-00000008HLL-1VX3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 15:35:16 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca80d708489so935049a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 08:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787067314; x=1787672114; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BJxkO70MopchWEw+ENjoFGNji5+cFc80kc/rYib2sLU=;
        b=do8MkAtAiZJBIg3ECnv7T2KtXKBtK6B4CfBU1vF5gBk3ByPy49P8HUbpuEVbuVlgOY
         gIv/gqIDuzfgN3Ox2157ukfE+L0KZ0WQ6/83MNlrrg4FkwpruHOYhLshSDaPeemzofuz
         QokGv/EYhu/PqcJcwGMiPRGqT0HsrIsJ+VCs9EUqP+houUQlbHvkdCDKcvcNovSIEiO3
         1lSJkJbYkQ3VG6uB9OpLjochxfMxzx8s/VwFK7MBURak4hQRsi7wvY8BBQk80d7Eoyxu
         /AeJa2wR5kkkC9AlV5YAhm5JBlYVlX7LLi5zaY/lPpnjH35PZRftO9Rp4SY/VZZbDUqx
         f8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787067314; x=1787672114;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BJxkO70MopchWEw+ENjoFGNji5+cFc80kc/rYib2sLU=;
        b=jvcnTCN+1DiA4Qu6bIXJ8fYRVgWJFgdPal2hBWxXfAy8KWbU3WqzbDKve+Pr3eu4AO
         PrBsSV4AcIU9+xYZvrfN/9hS4ZO22KVWS9UbtGm66MgAc5KInIdn4O+pIR3bvoCcVCc0
         4kpM0Mm9ElRvxBBbpezSDNjmmguTi2MiYXwU0UNhGv/3J2HlRak6seqVt0+gQKOubK63
         So8u7eI/pLJuo+0f1RUf1gUTz83X8DevU219Gl8P5qWYDD9MWqlDc564436c3Iqx4a2v
         FANtmAhijIGoaQSisE2SfPJg0G3umMpSEwyphuqFUaGIEeAI583JW30fid9x9ouEhJwi
         fCIQ==
X-Gm-Message-State: AOJu0Ywa4hx/RNnC1zYcMLoYYPNZtJ9atNYsE3mLjZfaS/jW9A0f1/si
	eDrkCEKDRFDksj5/inGghzeYBoapOtnQdBLOpVVDlen9sPI5Dwz2SwLtgYZou4xPALZ8rVzx7zJ
	0k01YiHQ=
X-Gm-Gg: AR+sD13Wm4nt9C7Lso7S1sFGL5KsTxikpjni/FqJybf2bw4/IKmhu1rAnqs7i6JllW9
	ZHFqJffYVKUjbd4Tbhg86eUNFftvEC5IVdrMlLOJ47IxFyrvBZOVr7ZGj1lBXQCYB1+YpeCWPB7
	c9nMfZJ8aJniVR56XSio5F2lkS65QepZ3Hzve6ddupkT9z0idDb2AyShCo45Wo37fLjnuW9UUNg
	sOe8HF7qEcLfJNRR6W9Of4b2FdddLlHc763ULGrzTc+dzrTwkI6O88XgmHHq8ynxQskECaROxON
	2u1Ky1zSPqrzzuzZKugYLKwMZ3pBw230JybZL5aLz93pDueuSu67Cc6yYf1Qa76f2rVtGOmzgEW
	YJtnKgOGB4WtEfciPDHIv88JkJ5Qpkl4blMhWxmzeYMxRB+Jb6UxzJjVC2+CyuwwTZ2ESZxiMF6
	ZwPoF9/Q6PjJixurslUEyxibbsSXVFtoPc0NX2buJ33tBmvJm5XCg1Bfmbie8hFaE=
X-Received: by 2002:a17:90b:5404:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-3955f0c0364mr8515980a91.3.1787067313991;
        Tue, 18 Aug 2026 08:35:13 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415315900csm18033268c88.11.2026.08.18.08.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:35:13 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 18 Aug 2026 08:35:10 -0700
Subject: [PATCH v3] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOsQ7CMAwE0F9BmTFyXKDAxH8ghjRxqZFIqySUI
 tR/p4EFNhhPOr27h4ochKPazR4qcC9RWj+FYj5TtjH+xCBuyoqQ1rjRBQhZGEQsBI6pDQzh6pN
 cGLoLJDbBtTcPzqGptKvIIqmJ6gLXMrxmDsd3jtfqzDZlOzcaydr99aPXuffnZK9BA3Lp6opwX
 W5x73lITdstjKi82dOnuvxRpUktDa8c2gLrmr7UcRyfG8Vws0EBAAA=
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787067313; l=4647;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=g80eYQhKz7g1873uZRKJPXvkY5aQW0Hozvxpfa+GqI0=;
 b=Po0ZSxvDkegPgxo3O3Ziz9EKRCqbDqeHczclmEEE6BlxsYDrLbtWrdfc504VO8Q8rITosSdtl
 ixHRWZAL3/7C7Z2FhAFcUAV8ePng7/wTwvC8EpSzojnY5swq2dPjTtW
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_083515_426848_85DDB399 
X-CRM114-Status: GOOD (  17.27  )
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

The devres conversion replaced manual pm_runtime_enable()/disable() with
devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
PM teardown. The managed release tears runtime PM down in the wrong
order: it calls pm_runtime_dont_use_autosuspend() before
pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
is LIFO so the devm_clk_get_enabled() release runs afterwards.

At remove(), pm_runtime_put_sync() leaves the device active with the
autosuspend timer armed. Clearing use_autosuspend then makes rpm_idle()
suspend immediately, and xiic_i2c_runtime_suspend() clk_disable()s the
clock. The later devm_clk_get_enabled() release clk_disable_unprepare()s
the already-disabled clock, so clk_core_disable() WARNs ("clkN already
disabled") on every teardown.

Drop the managed helper and restore the non-managed runtime PM setup and
teardown, so runtime PM is enabled once in probe and disabled once in
remove and the clock enable count stays balanced.

Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v3:
- Drop the managed devm_pm_runtime_set_active_enabled() helper entirely
  and restore the non-managed runtime PM setup (pm_runtime_set_active +
  pm_runtime_enable, with probe error unwinding) and teardown
  (pm_runtime_disable + set_suspended + dont_use_autosuspend), so the
  disable depth stays balanced rather than being disabled twice (Andi).
- Link to v2: https://patch.msgid.link/20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai

Changes in v2:
- Move the Signed-off-by into the commit message proper (Andy).
- Link to v1: https://patch.msgid.link/20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai

To: Michal Simek <michal.simek@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-xiic.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..85f3c322b1a2 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1475,9 +1475,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_set_active_enabled(dev);
-	if (ret)
-		return ret;
+	/*
+	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
+	 * tears down in an order that races the devm-enabled clock release and
+	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1489,7 +1493,7 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
 					IRQF_ONESHOT, pdev->name, i2c);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
@@ -1506,14 +1510,16 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		i2c->endianness = BIG;
 
 	ret = xiic_reinit(i2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+		goto err_pm_disable;
+	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		return ret;
+		goto err_pm_disable;
 	}
 
 	if (pdata) {
@@ -1526,6 +1532,12 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		res, irq, i2c->i2c_clk);
 
 	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+
+	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
@@ -1545,6 +1557,9 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 		xiic_deinit(i2c);
 
 	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


