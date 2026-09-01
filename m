Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DD67C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 20:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=01IkyQRQG/lSUmqdbouqV6kPDaesEhGkw7qS1Uqjgdk=; b=qp+MS+1qctmFjv1WmesYmWmJve
	9YJc30DmW5DCWL1UYfYJ9FpYPQFoJAm48VgHkthAyFLYrVbYVryWf8hApAoL3ZALbe0cKGmVnFjvs
	Iv0rnBGiv8QTW/Purvgb6ne+PBdbFq3ZNbJZCJWmxqcAaCPsJr/9O3t/TZMnaZFAoouF0ma5NAVB9
	liVO3o3DvX5O2sLok0kPyyqy4t4j6rMv7RMlPU7OSj4YcxglmftJQUNSB0X9fj0Jof73IZ5gd5yGE
	jSsxX2AirLWlmVIUxGriFXqvjHQvWr2wAS/cVTyBndIVm3FssXmNYmHgD6Djj5u6wR5fc725UCRwD
	U+y+zE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Uj9-0000000DHze-1sF9;
	Tue, 01 Sep 2026 20:05:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Uj8-0000000DHzV-1Sd6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 20:05:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63248600D9;
	Tue,  1 Sep 2026 20:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F362CC2BCF4;
	Tue,  1 Sep 2026 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788293101;
	bh=Qvg96r1uqRi7ZsIahTd0vxEuEUAxLGPkPnDx+jmOuQs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=TnzEUrOnWeKc2IJhDqDEHr24D1ZpYZJTysb91o2LXRfFMdLZJD8mon8H9TFI1JY+g
	 wHBs3NQfp/kNUO8unmeJXu9FFgc1ywOzd8wd8R6KsCjGi5+oOk+xXooNI6waXpRBPT
	 2W2dJA8Pcon9slfvjKvGaa/Kg9MZLGSOBq4btFOzzOIHiaEwDoKsG5XRRvq1mVWmk3
	 f4SK+nIxxW8UkkzcWPyH0g8mRQTtt3sZK2lTX7YK1dAKyRCEVq27puthHw8f5vTe+i
	 0RoJG/1mMSvdGe7mmO1fK/sMGU+FF7ByXgL2fBH+62ePRjQ/LR50qBeKVlNC2qevZa
	 85k4kYnncJzZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC85DC61DD6;
	Tue,  1 Sep 2026 20:05:00 +0000 (UTC)
From: Vincent Jardin via B4 Relay <devnull+vjardin.free.fr@kernel.org>
Date: Tue, 01 Sep 2026 22:04:37 +0200
Subject: [PATCH] bus: fsl-mc: register the object drivers after misc_class
 exists
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-for-upstream-fsl-mc-initcall-order-v1-1-36ffe48f767d@free.fr>
X-B4-Tracking: v=1; b=H4sIANQvl2oC/x3NwQrCMAyA4VcZORtoU5jMVxEPtUs10LUj2UQYe
 3eLx+/y/wcYq7DBbThA+SMmrXb4ywDpHeuLUeZuIEejm4gwN8V9tU05Lpit4JJQqmwploJNZ1b
 kEPwYJnf19IQeWpWzfP+T++M8f6bGI1F0AAAA
To: Ioana Ciornei <ioana.ciornei@nxp.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable+noautosel@kernel.org, 
 Vincent Jardin <vjardin@free.fr>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788293080; l=2613;
 i=vjardin@free.fr; s=20260525; h=from:subject:message-id;
 bh=SXlMvnAA+Yv9aOr3bof+GHsV/62VSrRffjRMXK6jUP8=;
 b=Q0DNQlW6k/74/YvmvMnm7KR6URJ1LrX/mfYfTlKrZ73dg+vhupeXaUuRo+NA7LhYlLA4RULEh
 Bl42jSLrySdALA0c54lYp2NUpW7m/nPrOleoqbafewj1sO6QtpbR7ZC
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

Cc: stable+noautosel@kernel.org # niche: root DPRC unbind/rebind only
Fixes: 2cf1e703f066 ("bus: fsl-mc: add fsl-mc userspace support")
Signed-off-by: Vincent Jardin <vjardin@free.fr>
---
Issue found when unbinding/rebinding the root DPRC on an LX2160A.

The failure is silent at bind time and only shows up as a
duplicate /dev/char entry on the second bind.
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



