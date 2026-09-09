Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F070C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V55Vy6qlE51TuDXRPnlBmr4WZ0tBNiL6HCMdQkuXoL8=; b=4kAvw/6ebM9u3YSQaXrf/s8CJG
	u24oi+KMem3WA9TTqLWUN2FBjlbGVkfJ1DaY8/HxOZBXGwctGUQo4fw+wczmAjzdPjX+Kj9lDy/BP
	vX7pj/SVmjRhV8M7tafigCWFtitw/mBB8snKLxLRR9y988TiJGINXGGl/QSH1ty4XTIexfkDp2Q8Z
	wuXEZ5kFun3pw74vOBMMtTI8I8zmC8TUs7R5BX3tXGwO979W6NSknw8Uv8OIXtdn7SfRyukoaI8z2
	6yTqiofKC2gZOXMj53XnRQOhc8aKlVzNzlQEwny8ELKFIdyvuj6maZaFvYf6VfUeiZOUE6ZU45+1w
	AU/qHSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lj6-0000000CQNu-3dPn;
	Wed, 09 Sep 2026 17:04:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Lj5-0000000CQNl-2SXy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 17:04:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B37E4195E;
	Wed,  9 Sep 2026 17:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 345F8C2BCF4;
	Wed,  9 Sep 2026 17:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788973487;
	bh=LpKlJiaVIsQKsTlyaIZbqHjsJ9yGKW71aQcyPqxS5to=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=VFB6zFOXxeYqx/x5OYlOcN6MKkmkPrjbOAZVw/dHIyn5e7N106G9+6xYU1GMK7/Fs
	 8EHMZXOHg6gDFjgvsAIUCjHlwqeJuBXNFb0poUpElNRi1soabtllxgU+uMLuQ2vm51
	 ufI/6iAUPXkc26k+qRs9rQenCTvtU7a48+S51sFt9MY+QObiqOrh9sVh5DDjKzAcQJ
	 uBZlNZ9vy07ez/ZP/fef6gOAqcNbEPTwPMHCGGoq+B7gqqTn+ODbWF+Ybt30up0Tb1
	 8IF5wvwbYiUkLtBRTMw9+j4SH1Dn3K/UHqAqmLifJ8Z3CCUac8qpOsoY6clPc0If8D
	 2LlNgGvxq7yVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB0C79FBD;
	Wed,  9 Sep 2026 17:04:47 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Wed, 09 Sep 2026 19:04:40 +0200
Subject: [PATCH v2] bus: fsl-mc: register the object drivers after
 misc_class exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-for-upstream-fsl-mc-initcall-order-v2-1-b7a04634fcf1@free.fr>
X-B4-Tracking: v=1; b=H4sIAKeRoWoC/42NSw6CMBBAr0K6dkw/pogr72FYIMzIJEDJFBsN4
 e5W4gFcvrd4b1URhTGqS7EqwcSRw5TBHgrV9s30QOAus7Lael1ZCxQEnnNcBJsRKA4wtsATL20
 zDBCkQwF0znhX6dLYu8qhWZD4tU9udeae4xLkvT+T+dpfXpt/8smAAeeJ8HSm0pfdlQTxSKLqb
 ds+MEjWltIAAAA=
To: Ioana Ciornei <ioana.ciornei@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable+noautosel@kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788973486; l=3680;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=4w8EyLodWYbpAxy4IdhaZ8kc0Y8HbWHFCMkpK6NuPbI=;
 b=Rid5LvQoK9miq+gA7+YL1kd3AUGRJD8FeSxJ1xg5zimcVvmU64GZjtoDj5sORC46X9N1xjtkj
 HACM4entDAGAiqmRKDC0kGr5rSInrkDPfoIfd+y7zLR9ubxcwGErk7M
X-Developer-Key: i=vjardin@free.fr; a=ed25519;
 pk=hppgLeFpGpKOi7LNwGEZ4jOYofJCoGd4Jf1ltAabiLw=
X-Endpoint-Received: by B4 Relay for vjardin@free.fr/20260525 with
 auth_id=871
X-Original-From: Vincent Jardin <vjardin@free.fr>
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
Reply-To: vjardin@free.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vincent Jardin <vjardin@free.fr>

Unbinding and re-binding the root DPRC fails with:

  sysfs: cannot create duplicate filename '/dev/char/10:256'
    misc_register / fsl_mc_uapi_create_device_file /
    dprc_setup / dprc_probe

It happens when the fsl-mc bus probe is not deferred, without SMMU:
- the dprc driver is registered at postcore_initcall,
- the DT node is populated at arch_initcall_sync,
- the root DPRC probes right there, before misc_init() has
  registered misc_class at subsys_initcall.

misc_register() still succeeds but the device gets
no class, so misc_deregister() at unbind cannot find it:
the minor is freed while the device and its /sys/dev/char/ link leak,
and then the next bind collides on the same minor.

Let's move the dprc and allocator drivers registration, and
platform_driver_register(), to subsys_initcall_sync, after misc_init()
at subsys_initcall.
bus_register() and the platform-bus notifier stay at postcore_initcall
so that fsl_mc_bus_notifier() still pauses the MC before the SMMU is probed.

Cc: stable+noautosel@kernel.org # niche: root DPRC unbind/rebind only
Fixes: 2cf1e703f066 ("bus: fsl-mc: add fsl-mc userspace support")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Issue found when unbinding/rebinding the root DPRC on an LX2160A.

The failure is silent at bind time and only shows up as a
duplicate /dev/char entry on the second bind.
---
Changes in v2:
- Commit message: the bug needs a non-deferred fsl-mc bus
  probe (no SMMU) - Ioana Ciornei
- No code change
- Link to v1: https://lore.kernel.org/r/20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr
---
 drivers/bus/fsl-mc/fsl-mc-bus.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 66a4fa73c5b86..7f283844e4500 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -1264,35 +1264,43 @@ static int __init fsl_mc_bus_driver_init(void)
 	error = bus_register(&fsl_mc_bus_type);
 	if (error < 0) {
 		pr_err("bus type registration failed: %d\n", error);
-		goto error_cleanup_cache;
+		return error;
 	}
 
-	error = platform_driver_register(&fsl_mc_bus_driver);
-	if (error < 0) {
-		pr_err("platform_driver_register() failed: %d\n", error);
+	error = bus_register_notifier(&platform_bus_type, &fsl_mc_nb);
+	if (error < 0)
 		goto error_cleanup_bus;
-	}
+
+	return 0;
+
+error_cleanup_bus:
+	bus_unregister(&fsl_mc_bus_type);
+	return error;
+}
+postcore_initcall(fsl_mc_bus_driver_init);
+
+static int __init fsl_mc_bus_drivers_init(void)
+{
+	int error;
 
 	error = dprc_driver_init();
 	if (error < 0)
-		goto error_cleanup_driver;
+		return error;
 
 	error = fsl_mc_allocator_driver_init();
 	if (error < 0)
 		goto error_cleanup_dprc_driver;
 
-	return bus_register_notifier(&platform_bus_type, &fsl_mc_nb);
+	error = platform_driver_register(&fsl_mc_bus_driver);
+	if (error < 0) {
+		pr_err("platform_driver_register() failed: %d\n", error);
+		goto error_cleanup_dprc_driver;
+	}
+
+	return 0;
 
 error_cleanup_dprc_driver:
 	dprc_driver_exit();
-
-error_cleanup_driver:
-	platform_driver_unregister(&fsl_mc_bus_driver);
-
-error_cleanup_bus:
-	bus_unregister(&fsl_mc_bus_type);
-
-error_cleanup_cache:
 	return error;
 }
-postcore_initcall(fsl_mc_bus_driver_init);
+subsys_initcall_sync(fsl_mc_bus_drivers_init);

---
base-commit: 786262be6048deab760f68c8acc2c85607165894
change-id: 20260922-for-upstream-fsl-mc-initcall-order-e3316390712b

Best regards,
-- 
Vincent Jardin <vjardin@free.fr>



