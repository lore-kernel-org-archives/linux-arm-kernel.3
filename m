Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B22CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 23:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MXtvsMWEZDszE2uQQOHilHK7ejv7jH66bQFcbnUr/Yc=; b=ngZmrDfVLSW1q+ccavQhqw0RHV
	uC4vBlfcf6KqXYEY1FZ/DzWnLQ2pFbDVMMCl8S0wYNIE4kO5nDfZ/M1EfaBFpeNPslu30BpcCG4GD
	wZHRub5Jln5eimlw+2nv9/xo6cYbZYS5VPmx//DLLz1KyJLUPslh1TrOUYuF913Bvn3Sv/jMukJWr
	JXbteT2gIjX3ECRBBKTYmqXLhDW0KIuJIbr6xrONMGF5zZJtHnlWbObMW4Oe2ABT31LaabLkJwIw3
	EMI8D88u97jzKGnwaAKD/tv7RxWlelgccWRig+iMxgOaVViUTKK22Wow8aER8+noZ2BsJeo/2AgwP
	Q2tslvCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8qF-0000000GTu8-2Ert;
	Wed, 14 Oct 2026 23:57:03 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH8qD-0000000GTtY-0Mgo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 23:57:02 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-35c76e9614aso2867360eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792022220; x=1792627020; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MXtvsMWEZDszE2uQQOHilHK7ejv7jH66bQFcbnUr/Yc=;
        b=c0ZEiZq1ezFPHBRWVTsQbpfqcbtR4NFjbAve+TJnx8Sf74sQWe8awhbZqCEVpMXfxc
         Ea6pVe9PVDH3qgTzuhatIqWG9jzJvSAakfp36obtUDntLY6+jKfskGBHWBS8CQeOq3/0
         2foDMVHmT9mGOhxByWxMbVpprKMKTXyJtjygf5R7Pu7F5HePK+34oUzjSYj7nhOet2zH
         Xek2P4gjv7kx3biAwnM5glIZuBrheZ+U8rrEMPr7mphPkwodVRZEtffEV0XNgYy+lsqG
         m++lbc5PN/hybfv7v9ymeD3KLQutUqytDVtalCvsbvn1SNF7zWCmMC6AHGrxOn3zASD9
         68wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022220; x=1792627020;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MXtvsMWEZDszE2uQQOHilHK7ejv7jH66bQFcbnUr/Yc=;
        b=h7f9ZdnuCsV1dsf0WkLS8i6LUzbc5ahMwYyjucNouEKjWQflNWR7L6yjSSRbNh0siW
         JRETNVfTWeE5ghwDdK7cA7Mqjn7jddWr5rruRN49gFoWSx21+ecZHFfde0wX1g1xkMmu
         7FepjoiJ+pMbItyEIIV9FmbkoSRPk5i9oLAyWFuRYnwH3VjwPSCExYgnwwzFWsOgpLEv
         W5DTo0jDEP3yYr90EfReCszUkIi4WCDZ4bwexxE/mYaSOs0YCa0ZxSe6JenO4tX+5wet
         ATNtPPbR+bRHiEJkYmJtP7GjI54/ph+cKJeApDYy72yX3QicQl8Kjar8X/Q88pinXhhL
         ASmw==
X-Gm-Message-State: AFq9FYKn9BI9zLQ0wHOX8ZlSVBG5J0bfw1YTIjw2WwRsw/VWUYw6/q0A
	iw0bpt0pZZowYsmFAelu6AIfxTlcz9p5F9vudSgExjSJT2irf2BhYzkQEH4qBx2mqd8=
X-Gm-Gg: AYBFou3CFPK7Rt916dROOLu++24UYOO6bsIkUVJXtUg+NwSaz9yQgY7M4vAD6Tp++Hy
	VJq9ENLHshG9j4f8WBQfQPlLcMSol/cRHB08RN0nbkxBst7gGSXxOvpZ9jh5kvd2XZ1NonG3Fdj
	N93NUdED23gXNU2bzG7vMm/iYO1xsztng6U8DymXileKyKsvvtwiglG1/e+ihaPZTc2v8HXRHRa
	3yGYlkA/fCkvMKJIKen4sS5XL/3Iq+nFCnQWKwv6956zf47la+FMdL7Xc6S7ux81VwQwPonU/oV
	RAOXPE1tL/uqVnn1/xRKMxV6HHr1gg7Ag2e0XxZtaNao/ZnjF4Ov6e8yY5gpI2gqBnthsqz7soP
	DUIj4agf9wT6USvJpxNGYTgVzIyfeeJ8Crlp+hoG3/3W2LZwooNyv41K+vEf3Zqm8HrZRDO6H0q
	P8upAdWNLBGJ2nAHyiTToUrJQjlBYB/HZfzQYXJh3Y9gru+kwqofmkYK7aX7eoVHepe+4vQO8gr
	Q==
X-Received: by 2002:a05:7301:fc18:b0:341:2466:2d68 with SMTP id 5a478bee46e88-3537e0cf2a1mr23131820eec.38.1792022219535;
        Wed, 14 Oct 2026 16:56:59 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35f0c3bcf80sm1759673eec.7.2026.10.14.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:56:59 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:56:55 -0700
Subject: [PATCH v8] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53Sy07DMBAF0F+pvMZo/I674j8QCz8m1EhNIicNQ
 VX+HbtsgrIJLK80Otea8Z2MmBOO5Hy6k4xzGlPfldA8nUi4uO4daYolEw5cQ8METTzQJaVAM45
 Tn5HmWzelK9LhSid0OfafHY0RnGfR8wCcFGrI2KblUfP69pPHm//AMFW7TlxS1b4e75hZnftj5
 cwoo4Amtp6DNhZeOlymSz88u0Rq58y3qjyo8qIahypCENC2fKeKrdocVEVRVRsFUx5Mg2ynyq1
 qD6qyqNpai14KGVnYqWqjcjioqqIGp6K3GpSCZqfq/6i6biB6FYQBgW5/LbNV2UHVFNUqieUDa
 MWk/KWu6/oNFtlSLe8CAAA=
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792022218; l=9498;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=hLZglLUb6/M8avFMUY4DETPKC/OcQ8W4VsuJaizRjlY=;
 b=tpyXJ1ADpdKBPrfXJEAu9joPXTZvN4++AGGay4Ep8CFo5zPvNg4bE/SI9tQGCFiSZIT5pfpl/
 H+q5KqnEojGCJWNCUh94ZZnw/h5skhh+0v/mAUPdKBZC10KRgoXBmu6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_165701_155811_D7777079 
X-CRM114-Status: GOOD (  28.97  )
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
Andy, you said v7 looked okay to you [1]. If you are still happy with
it, a Reviewed-by would help it along.

[1] https://lore.kernel.org/all/aqJQ8Qm_nhBaWR-s@ashevche-desk.local/

Changes in v8:
- Resend. The code is identical to v7; only the base moved, to v7.3-rc7.
- v7 has been on the list since 21 August with no maintainer reply.
  Andy Shevchenko was happy with it on 10 September [1]. Pinged on
  21 and 24 September.
- Still a regression from 50c63491ff26 ("i2c: xiic: switch to devres
  managed APIs"), which shipped in 7.1 and is still in 7.2 and 7.3:
  every unbind/rmmod WARNs "clkN already disabled".
- Link to v7: https://patch.msgid.link/20260821-i2c-xiic-restore-runtime-pm-teardown-v7-1-954e06765144@nexthop.ai

Changes in v7:
- Add the missing kernel-doc entry for the new @irq member of struct
  xiic_i2c (the non-managed IRQ request added in v4 introduced the field
  but not its doc), fixing a "struct member 'irq' not described" W=1
  kernel-doc warning. No functional change.
- Link to v6: https://patch.msgid.link/20260820-i2c-xiic-restore-runtime-pm-teardown-v6-1-5db5c3703ea0@nexthop.ai

Changes in v6:
- probe: check the pm_runtime_set_active() return value and unwind on
  failure (undo pm_runtime_use_autosuspend()) instead of ignoring it.
  On failure runtime PM would stay suspended while the clock is left
  enabled, and remove()'s pm_runtime_get_sync() would then resume, enable
  the clock a second time and leak the enable across the manual teardown
  (Sashiko).
- Link to v5: https://patch.msgid.link/20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508@nexthop.ai

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
 drivers/i2c/busses/i2c-xiic.c | 49 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..ba560462d451 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -67,6 +67,7 @@ enum i2c_scl_freq {
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
  * @clk: Pointer to AXI4-lite input clock
+ * @irq: Interrupt number
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
@@ -95,6 +96,7 @@ struct xiic_i2c {
 	int rx_pos;
 	enum xiic_endian endianness;
 	struct clk *clk;
+	int irq;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
 	bool dynamic;
@@ -1506,9 +1508,17 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_set_active_enabled(dev);
-	if (ret)
+	/*
+	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
+	 * tears down in an order that races the devm-enabled clock release and
+	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
+	 */
+	ret = pm_runtime_set_active(dev);
+	if (ret) {
+		pm_runtime_dont_use_autosuspend(dev);
 		return ret;
+	}
+	pm_runtime_enable(dev);
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1517,10 +1527,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
 
@@ -1537,14 +1552,16 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1557,6 +1574,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1568,6 +1594,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
+	free_irq(i2c->irq, i2c);
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
@@ -1575,7 +1603,10 @@ static void xiic_i2c_remove(struct platform_device *pdev)
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
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>


