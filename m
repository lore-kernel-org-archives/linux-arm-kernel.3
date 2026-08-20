Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F54C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 19:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcCE6qlc50qWmg1m/bQqEwbDw08j9kuZZKKtuHo15dA=; b=pQi3fwoYWYCbjpTdPvYXIBLWKd
	nToRAuB+wjVD/fNgLHOsg/dc+uFENrsH86BxfTuSXQBst+r3gZwUDGRhuQph+sgpc8Ca7eivK+psl
	3oIOMvaAu7CuP8flWQnh3PCkqx/BqQjY88/EdsCy8pkKgi25AxXyO+HHSKG28LOsUeLTEVq7TH2eT
	C64mFP+2FIbXqx9HP/JBj/Yf6bh+qqKzwy8MpsWvk9lEY2n5ivmsuxAE8Jg3JEbeghbkyJowphvuQ
	qRFxPLPlIxsBN7a8HlxfLAHyeQMd7jh6K+JQS1RuUv2hb8l/3MI057H+8/Juux+zw42khZyQbl1K0
	tk3SNuGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8cN-0000000C854-3yEb;
	Thu, 20 Aug 2026 19:40:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx8cL-0000000C84N-3dqB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 19:40:03 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cc61541f8cso15886565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 12:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1787254800; x=1787859600; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZcCE6qlc50qWmg1m/bQqEwbDw08j9kuZZKKtuHo15dA=;
        b=Vz5ijA5Wm3b8M0z+Sd3fPJAKFtpQ02Qck01K99xu1Vj/kWg6g/PWKocLNCZ2PljjnX
         Oe15FpFMnqanJx0Zf174Mz7PdZ+S8fmbm9nllRt9KleIwGieucXEFcX+wznjytYAfMR9
         eibB9Vu8ndLLikcL/YZ4DhasKcL9TU9/KTPv22I8fLVmZlTcr/24UHrpSphbvxdoQ38o
         nwbRBr/rbcMG0AX69ulX9ITiFUXet4ShkI9v4M3ignkj6afnekrQ7Ak9Cbu1Hxg4nQZ9
         rwKIhAK7knH6hitKAPfJ5stkJtSPM0D6ScSUziofk0V+AfRlt/QgGGtKI79Q3HkGuRst
         bpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787254800; x=1787859600;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZcCE6qlc50qWmg1m/bQqEwbDw08j9kuZZKKtuHo15dA=;
        b=iI/nft0un7EeVq3uVh/AFm+aXiyDHzDr1YhbLWSeTkP/+lWoIfeumqOsyIqmTO8b0d
         UXIm7dRkYrz0I/BPF2AyUAwxT4AhFM7iJph8JHfxB8ulfqugHvOQpIx+lMtb3lqSNM8W
         6m+axN5sTMcFfG5CbWnn2BB8GKRBge5r8BzLavuqF7K4bV2Ed7FjGAeYJ98JRHA4J/u2
         VWN/ww10mv2fYat41PUdhICjPbA3gU7NV8lbCtu6nGAvYqJpg4I1Es8qVqK9xfTJLmaU
         qvhzZEAs3cWAsUNHJuSPNZ+sIKl0RXrNXWII1OoFkQiqBI3pqe6jBOtlvT4DSsCxaeyD
         pE/w==
X-Gm-Message-State: AFuF++kRd+EnVKwCbjj+1gn26yjU1l7UQv/wV9+KK81yBn7DrVB1GJyg
	apBu+9UGcMSK8q4AkM5slnktmSxtJUNFilrFAEaL0v3SMmQlJWilbmRTtJ3Jefc9daY=
X-Gm-Gg: AR+sD11pGx3UGz+sZfVprg5xirDokpaSGsaWcw9FDwaUJYOP6pBsL8ChIDOiQjlQkGq
	TDvUMgAaJptPet31hv4DMsOFNemNN2k0uSo069sYybfE9QLT8KPU8yZ0Nk5Z1az1yVbDCtezqeg
	PN/oz2mLAXXqtyCR5gMCG42WMdtEG958VBMJqByNvVoQvNifUcVrZcIYKqDCuReFzyYqoObLTTG
	voewqJT1+Z9zLLaGzQIIgNG3ywSrcLnlGcGRlQbjU9oEBxXGnRRobItfh2Vcsvx3J+/7DCK+23J
	Oo3/GJX7cSEWa6tfn3uiBSuZzD4xXzGZUoy/KWAEf3HI1sKNOgJlW3cmGjYGuXM/bu3tvMu/dvW
	MOtTiA59Cy20UWLNPsbVao1InrN5wwz9JSd9t7igr5TB+qlENa4ZWFWP/hcYVJ4yY172YTTYZqH
	ddmVzNjGR2kPEE4dVzJuIj11dIUYChKpT1ZahSlxf7Ro47mTDpCUSQcotiUgxewr8=
X-Received: by 2002:a17:902:ce0d:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2d619d47dfamr114795725ad.0.1787254800300;
        Thu, 20 Aug 2026 12:40:00 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf14376asm19543822eec.24.2026.08.20.12.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:39:59 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Thu, 20 Aug 2026 12:39:56 -0700
Subject: [PATCH v6] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-i2c-xiic-restore-runtime-pm-teardown-v6-1-5db5c3703ea0@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XOzU6EMBQF4FeZdG3NbUuBuvI9jIv+3Mo1GSCFQ
 cyEd7cdNxg2uDzJyXfOnU2YCCf2crmzhAtNNPQ51E8X5jvbfyCnkDOTIGtoheIkPV+JPE84zUN
 Cnm79TFfk45XPaFMYvnoeAlgngpMeJMvUmDDS+ph5e//N0819op+LXRodFe378WMRpffPyUVww
 QGbEJ2EujHw2uM6d8P4bImVzUXu1eqkKrPaWNQBvIIY5UFVe7U9qaqs6hiU0A6aFsVBrfaqOal
 WWa2NMegqVQXhD6reqRJOqjqr3urgTA1aQ/tH3bbtB/Nj7ixDAgAA
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787254799; l=8044;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=2VY9MXDjK9yzik9Rg0IadfnDzQtNAmpccieQpDEqoRA=;
 b=zmlZ/jh+vJ9Ved5kvwlUN1/FjmVcYt5PXN0MSjfimc3sGeYYCRzy8OVImTmtbE+RAKJkVvjwP
 sOGeRxiXjfQANRvxlwD/MRYRuFoqFa31xrsYzgpe6xCydIMita5Dqyz
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_124001_936961_BBF3D67F 
X-CRM114-Status: GOOD (  26.51  )
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
 drivers/i2c/busses/i2c-xiic.c | 48 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 3e7735e1dae0..0f19bca8ea17 100644
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
@@ -1475,9 +1476,17 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
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
@@ -1486,10 +1495,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
 
@@ -1506,14 +1520,16 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1526,6 +1542,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
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
@@ -1537,6 +1562,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
+	free_irq(i2c->irq, i2c);
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
@@ -1544,7 +1571,10 @@ static void xiic_i2c_remove(struct platform_device *pdev)
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


