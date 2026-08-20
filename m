Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB1E5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OyXdngKokkNNzIHrBbg7P8oeDiJFCinDSiokluhjKGY=; b=DJnbYS4Db2eI/SVCnu7yu8X47H
	cWDhQbnCla52xuvrhiLI7dmG9pRjPm41sFgNM4cVq+eyeW4QeBNF5Mn/M6ZT57JWJWzDejcpmOJeq
	jRL7TTA+qq+bCJBHlA5JT3M1XoSeCvlR9RX9tVtHGTNjWVp95V+wnSpiY4boZaJsWuY+KdIYpsGC+
	Ds/yL8N4zL0LxYU7tr6vR1UtRkYRzAp1myvkp9iqPVvQYIcWRZ4j6dQKB4SpkXThF4mnqcxh6boqf
	UQx4XYJ3LcJMJZ+JVE3CwXXJaU1Oxu112ndFQ5NzeKtsGv1T5cjbexWYyOcDjOwOLpbAlwSTCV/HP
	KdbHBH8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1pe-0000000BWjc-0Id5;
	Thu, 20 Aug 2026 12:25:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1pb-0000000BWip-18jV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:25:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ceab75934dso25621135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787228714; x=1787833514; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OyXdngKokkNNzIHrBbg7P8oeDiJFCinDSiokluhjKGY=;
        b=JbusRRHwRaeqI4wiGYyAOQPTFgaDqKJrewm4uKCeUnY/B43Hte4gQfrBt1+3M8WWuU
         tkM4GoFkkE7TRvzU2EmrOLpcauz67wVUcWK4jBlEWvHJ1MZnQfFpYKwAKu/sarOsvRpJ
         z7NoIqeSzFEalLx7bT4TjR7R6Kzpa4xlm3CIhaoMlPlGTvzZVe2dFu3fizG+EjPX4HJ/
         TBy6NuKtuzjN/4PiafqhmDYtA7pUkM4XwXUD3I702NSeoDmQi3GRUcefWjkFTswCDtTA
         OgQbxyi1an6NHj0GuParLpXlFBES1r2abFGVaQU6LONfpJh3srrGrDgce1E+UPZMyhJ0
         IFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228714; x=1787833514;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OyXdngKokkNNzIHrBbg7P8oeDiJFCinDSiokluhjKGY=;
        b=ZbQimvaHMvA6KfjCLfdR7KWDvNB8KFaKs7Az9tZmGyghYWdQCXQJN4YrGQD5atE5Y/
         61vrsk/rknhRcnvhk3incpI+PHZz/Q9j9E0A2RCazIhQmoSDNau8AcRT4jN8hWt5/Clx
         i6C0FqY4C1Sf23ZAJHKxcwtCI+DA0DyiubnpjPRm7oJew1ecfSjN83aqEB4rI/khPK6K
         tNfQWJv2+pYnLlB5UnILYPjDOhohWNBezcOTtfNegVw+ZhgrCwGvMnys6b7KsvENWK7k
         6H04Sf6quqWK/87+P6hB8oNSxSpQIOFnWMEcAsLzHvXY6ZfScTSc/6QBW1bNPMsL7sta
         4bvw==
X-Gm-Message-State: AFuF++ng+0RZm9VpmUKC+sbWx+h3c3xSFawKk6klVOI3PwYOac2N8s+k
	yHHvhtcVzUb33nL/lISCxlsAuEdC41y+NeE5nODUpIEl60Xi/e47hZK7jdLMnZczI74=
X-Gm-Gg: AR+sD10GchpvcOerNwGq9FWiWo5ndxfgZb6kKz6zf6ZVfbzdFCrnDQ7vbom3q6g40cu
	FcSfpaK3MrngGi/oE5wD+tV2Yc6GxGB/uMk6ITXfSZ2wH8ml8MZ2T9HA67nnKVBwOnGvLeR7VX0
	VVfY+H1IimQ3IZE3pyn1lScu4KIOWd2o5jbk8/FqMTLLwfEhz99b48ITOB7NEhT6XIeowSK+87q
	m+qI5jKAmdwYAxXlK/nh5AkbdU9lAIh8e3/g3Jyx43ob0+NedRuclUzqFvu9tkEFjL2cYdgn5r+
	W1E9J7RcJy+3ZfCgyM6yutJa9FL++AnFM9LGPlfQ9s3ZqlMpJNYmPYN0OGeVDqbO3Wn1UoHSGk7
	fsdgyfK7egNjfx/et80/C23SXtyZHIW1t8V3c8Qzl50ABtDcAumAmobPNAamy5+9h6uu/M9bOC6
	Z/luFauF2wjH+7HS1ZnY0cJn260GzgIPxaAFgHowfgQaC04KuIxA1qN4i/WXIOVH0=
X-Received: by 2002:a17:903:120f:b0:2c9:c991:3bf0 with SMTP id d9443c01a7336-2d5fd62101bmr202658635ad.8.1787228714188;
        Thu, 20 Aug 2026 05:25:14 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e3a231fsm6182765ad.63.2026.08.20.05.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:25:12 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 20 Aug 2026 05:25:07 -0700
Subject: [PATCH v5] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOOW7DMBQE0KsYrMOAmxamyj0CF1w+ox/AkkDSi
 gxDdw/pNArcKOUAgzdzJwkiQiJvpzuJsGDCaSyheTkRN5jxEyj6kolgomU9lxSFoyuioxFSniL
 QeB0zXoDOF5rBRD99j9R7Ziz3VjgmSKHmCAHXx8zH+Tenq/0Cl6tdGwNW7fb4sfDa++fkwimnD
 DofrGBtp9n7CGsepvnVIKmbi9ir6qAqitoZaDxzkoUgnlS5V/uDqixqE7zkjWVdD/xJVXtVH1R
 VUVutNVgllefuj7pt2w81WtEy7QEAAA==
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787228712; l=7470;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=dmkm/yOT+VGwmCEIl36qnFbW0buHfut/9COHetD6ULw=;
 b=G1VAeO5pYDbOoFCVwcs89ktZblgSs9zHSq32LEA3fD+Y0v0/SJnqwGrQUpHnphgA+Rmc0r3h+
 rruLu4UA3PfDr5FN9GS+e8yb3hbChRa4/GcFu5igLKZ0/WiYpaP306y
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052515_332416_20784D41 
X-CRM114-Status: GOOD (  24.82  )
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

Order the remove teardown so runtime PM is disabled before the usage
count is dropped: pm_runtime_disable() followed by pm_runtime_put_noidle()
instead of pm_runtime_put_sync(). Dropping the count first with autosuspend
still enabled arms the autosuspend timer, and a preemption before
pm_runtime_disable() lets it expire, suspend the device and clk_disable()
the clock, which the devm release then disables again - the same WARN.

Restore the non-managed IRQ request as well. The probe error paths now
unwind runtime PM by hand via goto, and a devm-registered handler is only
freed later during devres unwind, so it would stay live across the manual
teardown (and across any future failing step added after it). Request the
IRQ with request_threaded_irq() and free it explicitly in the probe error
path and in remove. The probe error path also clears use_autosuspend, to
match the teardown in remove().

Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Changes in v5:
- remove(): disable runtime PM before dropping the usage count
  (pm_runtime_disable() + pm_runtime_put_noidle() instead of
  pm_runtime_put_sync()), so the armed autosuspend timer can no longer
  race pm_runtime_disable() and re-trigger the clk double-disable.
- probe error path: also call pm_runtime_dont_use_autosuspend() so it
  mirrors the teardown in remove().
- Link to v4: https://patch.msgid.link/20260819-i2c-xiic-restore-runtime-pm-teardown-v4-1-6999eb434d1c@nexthop.ai

Changes in v4:
- Request the IRQ non-managed (request_threaded_irq/free_irq) and free it
  in the probe error path and in remove(), instead of a devm handler that
  would only be released during devres unwind and so stay live across the
  manual runtime PM teardown in the goto error paths (Andy).
- Link to v3: https://patch.msgid.link/20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai

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
 drivers/i2c/busses/i2c-xiic.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..ece6d4f2cc6d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -92,6 +92,7 @@ struct xiic_i2c {
 	int rx_pos;
 	enum xiic_endian endianness;
 	struct clk *clk;
+	int irq;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
 	bool dynamic;
@@ -1475,9 +1476,13 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
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
@@ -1486,10 +1491,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
-					IRQF_ONESHOT, pdev->name, i2c);
+	/*
+	 * Request the IRQ non-managed: later probe steps unwind manually via
+	 * goto, so a devm handler could still be live after that teardown runs.
+	 */
+	i2c->irq = irq;
+	ret = request_threaded_irq(irq, NULL, xiic_process, IRQF_ONESHOT,
+				   pdev->name, i2c);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
@@ -1506,14 +1516,16 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		i2c->endianness = BIG;
 
 	ret = xiic_reinit(i2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+		goto err_free_irq;
+	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		return ret;
+		goto err_free_irq;
 	}
 
 	if (pdata) {
@@ -1526,6 +1538,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		res, irq, i2c->i2c_clk);
 
 	return 0;
+
+err_free_irq:
+	free_irq(irq, i2c);
+err_pm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
@@ -1537,6 +1558,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
+	free_irq(i2c->irq, i2c);
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
@@ -1544,7 +1567,10 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
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


