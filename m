Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A38C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+nlBq5UdgVIUTs785HzCl/oYDRAOZ9I08lv0VtlQk+w=; b=BztVDEtrcsHjLTpbD3oIGs/HKk
	QGs405o8X9BJDMxe2/T8pUGKilHYBJaG++Nv5rBfIipFC/sMpp8+FZt0YViUS+w4vOjb8cR4inI67
	SWgtrwT7Zg3jgGVBktQyziIwRH55iKLVbFyjy8mnkOy58fgtkG3f9FKRhPrGcsIRBWQabi8u0nlIG
	S8pE/xET5gNRk2c5wVwl1j9aSBECyhLAa0U/y/oaIPSxQqXLMaqLrDrDCb1EJPecdFSZZR3zLuBMp
	pVGCwW0lxZXoc13g2DwmCc+5werssAzb4HdRve1jnhZl0uLTNZunnORIK6fVG61bX1t7RfrlVai7I
	eJFWe2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjSA-0000000ADdt-09SV;
	Wed, 19 Aug 2026 16:47:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjS5-0000000ADcx-0Q7O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 16:47:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1122971a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787158064; x=1787762864; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+nlBq5UdgVIUTs785HzCl/oYDRAOZ9I08lv0VtlQk+w=;
        b=V2LGNir/asmhGNA4lWpURkztOLhh/quwYtge0/cToJvH3YcdQh8euvyivsseYA8MUs
         2TXS3OJUMMMcWNvy5WjAhFERAlTYdEO+vU1/qLqpUFME/pVQEW352hWxk2CCzveSSXE3
         +FFV/ypXmWABt5QHwFOs4aoSBzrqcq2OMNh/8ULDAREm9dwqRf0BUozjFR35CLAX5IpF
         4sHtuVmFin3zRKw8RNioa3+jeTnTMwww1kUzBNRt7Ehc3AY4rZXo9GchoNFAa2fVCNlc
         YmSjm3pZH3zBpFYh7fRhe/9XTZO7taEZwMdY4ilBJdsRxivuCAKpg8IA8+Asouf3rSVZ
         baaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787158064; x=1787762864;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+nlBq5UdgVIUTs785HzCl/oYDRAOZ9I08lv0VtlQk+w=;
        b=k7qMZRU/xUFi30m0ebJxF9wIcI2jhOMW5SHDFDqI8sje4R+GNDUYJ2mdjxbyMrSTM7
         qkLagsHHtsSJqjkoAxUytvQ01DY/RZiquCL8w0iBgKcTzTpAG+3rgbXL+B5Jv5thmHa8
         o0m/GZqMzAHXlDlQ3EAkBNnyMnLQjEo4oetGdGDWVqbbyy0i4tP11rsnRensGkk/zt67
         NNxyQNI0p+VmhMDaCoKr2JxJWHQsLlue3TdNBEHBVXpPalIX/bt7oZkOuowRZtTkXNxJ
         7TNx+15AZB1he+icXdQrbm+VYKXFunQsYyamHHKLx1iLfWPI884KxExrYPLBSpKjprFk
         +hCA==
X-Gm-Message-State: AFuF++kh+Q0VovJEXw9kjdGNBI0rqAO/C+nKVBhw2zUTTeYYXuRiz0ZS
	b9f0YSBlHmOJww+OkRODNDXB8UmCcoLn5220zAy575ZdfqXU0eUHt6fyskiCy0sp1RQ=
X-Gm-Gg: AR+sD10wBofpfXuffB6MbMUpCV5JS/gFswnQbWyd9JREEnUp8jCy5Xq+GKOF0ZyDXvM
	Qk9fK7tJP64s4IgpanFWHgWyJJ/jxIQRg+JD5J4R+tGZeEZ3TMPfvbo1jayn774j4YDBjAxNog+
	m596fPHHcPv2zqDcEeP/62/O7tzOPgGHGCfcMD1CPHyQrtFo5LuPhQUWOp53US8ED1PgqJCQ7IP
	Il07f5G0D4iMjNypCmHcKxWU7ORYsspHj/VZuYcCm7FwvE79aZ9bvLFCKLAYzKUJxAx04/I91US
	UiK0nOybGxbgJudMSvRM9K82YqqdQ349gmSm18lh8dKnFBgtQweB71EghNqgZdNY/SSY/oa3may
	w3DG8wW4RUqA4wgqN6VovCjQRPedSP7U19G6uf7wwl1yFh285hVtEBDjiCGpw4bSoxkj2HjLYNk
	87guz3KE/0sxHXzqOwhcA0F4SU7mN3nvmYQlY2Ra5rJpOG1omXSnFw58XKDF74nog=
X-Received: by 2002:a17:90b:4a46:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-3958083fc60mr10940911a91.4.1787158060779;
        Wed, 19 Aug 2026 09:47:40 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957faf596fsm3184128a91.11.2026.08.19.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 09:47:39 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 19 Aug 2026 09:47:37 -0700
Subject: [PATCH v4] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260819-i2c-xiic-restore-runtime-pm-teardown-v4-1-6999eb434d1c@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOzU7DMBAE4FepfGbR2m6awIn3QD34Z00WqU5ku
 yFVlXfHLpciLuU40uibuYpMiSmL191VJFo48xRr2D/thBtN/CBgX7NQqA44SA2sHKzMDhLlMiW
 CdI6FTwTzCQqZ5KevCN6jsdJb5VCJSs2JAq+3mffjT85n+0muNLs1Rm7a5fZjka33z8lFggSk3
 ger8NC/4FuktYzT/GxYtM1F3av7B1VV1d5Q59FpDEH9UfW9Ojyo6qp2wWvZWewHkr/Ubdu+Aec
 pUkOXAQAA
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787158059; l=6356;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=M8vBSbuA8VI2DOK1kxP8WB42QTX2GzsUgR6WmbobO8c=;
 b=bDi1TK6LLCQWJEOOxLNfPaCR2kU7PLBpyloOuASAxvRp4naHPgNsgBElSDaXl7THv2vDPwmR/
 2U7PjotYbNuBLe7oFVGlgoHgdscLNNzeCALnwdstI8fKYnoVCQRxF3t
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_094746_355574_1A0E8AEC 
X-CRM114-Status: GOOD (  22.19  )
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

Restore the non-managed IRQ request as well. The probe error paths now
unwind runtime PM by hand via goto, and a devm-registered handler is only
freed later during devres unwind, so it would stay live across the manual
teardown (and across any future failing step added after it). Request the
IRQ with request_threaded_irq() and free it explicitly in the probe error
path and in remove.

Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
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
 drivers/i2c/busses/i2c-xiic.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..bafae1cc44aa 100644
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
@@ -1526,6 +1538,14 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		res, irq, i2c->i2c_clk);
 
 	return 0;
+
+err_free_irq:
+	free_irq(irq, i2c);
+err_pm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+
+	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
@@ -1537,6 +1557,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
+	free_irq(i2c->irq, i2c);
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
@@ -1545,6 +1567,9 @@ static void xiic_i2c_remove(struct platform_device *pdev)
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


