Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BDFC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rhKm2X7pjgoKgoH15/yfKCP0mtCLBxv0oDI/yTMOl5M=; b=woS57C9WKMq5/gUCz5ml5AdM5q
	OmqDlsDCa23+Emwf7ghNhfsauGpzm3dXF8ioNJDkZVR9NXxjqO9SYdZdqAI+fdYh8tm+3M2FgW7AI
	xkBzk91KsSnMMjlj62HP4rpG14UIaxQayxB9fRBZ8bGUwza1HIEaYo5cx+kblKzTFeOqoEznsJB+1
	vv8o8W/Dgv2z4skeceiRPajieFO0OYB7yayw+5jApeq4N8xR9uWKtecJN1wVYDuQw7C4gGUbefngM
	tWbFoXEIMhLpxeMZd8eITDnc2G1rvSbIr8K0UqLCvWm4IKixCPCHJkpO4rEX5o9/ldb5uDnARpOJk
	dMx9852w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8p5z-00000003s0F-3w2t;
	Tue, 22 Sep 2026 01:14:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8p5z-00000003s07-0soU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A0C3A42E31;
	Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82C0BC2BCB3;
	Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790039694;
	bh=m3LsZOYKXpBxu2jAlB5YJTHDy68xjmQ8m4RqAnY7buc=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OshD3BQfh9BhJu5uNQp2FG3/KqPInw+5i8WTKaJ43CSjwpWEPppk+JHwKLD0tV2DK
	 WXO0iN3LmPo0mA7JMoLS1p/28CSZeD6A5yg6pk+GsaaICj5V/uiahLdjodn4FXKrkz
	 rWkV8Fl66NWLd38Pk7Ek98gf97OqNm82xcqM+3EsoHnClZRC8u2cJN660XLz/ErUvU
	 +Ks9wMJjqOkbBz74Z3af6x7EB3aUxKIlXypXYt0CgwvCuMUPl99pgshozZQ/QJVFzl
	 SYdPYY/U/vXye+/ACk5m5r9cm8aQLhE3fuCoNMmc8mriV7rGF8fI1g9dciTFd1zOSe
	 w50U7GrIVY+MQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E744C982FB;
	Tue, 22 Sep 2026 01:14:54 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:14:52 -0400
Subject: [PATCH] firmware: arm_sdei: publish sdei_entry_point with release
 semantics
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-arm-sdei-v1-1-6d12d12a7cba@vt.edu>
X-B4-Tracking: v=1; b=H4sIAIvWsWoC/yXMzQrCMBAE4Fcpe3YljVKNryIe8rOxKzTKrhah9
 N1N6vEbZmYBJWFSuHQLCM2s/CwV/a6DOPpyJ+RUDdbYwTjb4xTQy4SaiDEPLjtjw7k3CeriJZT
 5u71db3/rJzwovttFawSvhEF8iWOLNs6n/QElHmFdf6MD9r+PAAAA
X-Change-ID: 20260921-mb-arm-sdei-f69f902b810d
To: James Morse <james.morse@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790039693; l=3316;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=kwRV/aHBCufpjFjA3xGTlvIAqmYK7kG+Dzi8qsvpfdU=;
 b=Fgbe9A5j8oOXTX+D4bvOXfcOfpfGlHrCYiIHUVy5lzThSYDd/gVtl2n+KkwU/cSS5swWUe4rz
 cfIXERHDaG2CXS+vG1wOV/wF4ctaKXQuHdeBN2m3d9IcRLLINEGmlme
X-Developer-Key: i=jaidevshastri@vt.edu; a=ed25519;
 pk=J7+xYJRlTPds+pv5hbqFFRqGCpDeJDzmZT1ggRwj7/0=
X-Endpoint-Received: by B4 Relay for jaidevshastri@vt.edu/20260921 with
 auth_id=1044
X-Original-From: Jaidev Shastri <jaidevshastri@vt.edu>
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
Reply-To: jaidevshastri@vt.edu
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jaidev Shastri <jaidevshastri@vt.edu>

sdei_probe() stores the SDEI entry point to the file-scope
sdei_entry_point with a plain store after the platform reset.
sdei_event_register(), the cross-call helper _local_event_register() and
the re-registration path pass it to the firmware with plain loads.

Keep it in a local and publish it with smp_store_release(). Read it
through a new sdei_get_entry_point() accessor at the three call sites.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/firmware/arm_sdei.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
index e8dd2f0f3..a75203469 100644
--- a/drivers/firmware/arm_sdei.c
+++ b/drivers/firmware/arm_sdei.c
@@ -43,6 +43,12 @@ static asmlinkage void (*sdei_firmware_call)(unsigned long function_id,
 /* entry point from firmware to arch asm code */
 static unsigned long sdei_entry_point;
 
+static unsigned long sdei_get_entry_point(void)
+{
+	/* Pairs with the smp_store_release() in sdei_probe(). */
+	return smp_load_acquire(&sdei_entry_point);
+}
+
 static int sdei_hp_state;
 
 struct sdei_event {
@@ -582,7 +588,7 @@ static void _local_event_register(void *data)
 	struct sdei_crosscall_args *arg = data;
 
 	reg = per_cpu_ptr(arg->event->private_registered, smp_processor_id());
-	err = sdei_api_event_register(arg->event->event_num, sdei_entry_point,
+	err = sdei_api_event_register(arg->event->event_num, sdei_get_entry_point(),
 				      reg, 0, 0);
 
 	sdei_cross_call_return(arg, err);
@@ -612,7 +618,7 @@ int sdei_event_register(u32 event_num, sdei_event_callback *cb, void *arg)
 	cpus_read_lock();
 	if (event->type == SDEI_EVENT_TYPE_SHARED) {
 		err = sdei_api_event_register(event->event_num,
-					      sdei_entry_point,
+					      sdei_get_entry_point(),
 					      event->registered,
 					      SDEI_EVENT_REGISTER_RM_ANY, 0);
 	} else {
@@ -650,7 +656,7 @@ static int sdei_reregister_shared(void)
 
 		if (event->reregister) {
 			err = sdei_api_event_register(event->event_num,
-					sdei_entry_point, event->registered,
+					sdei_get_entry_point(), event->registered,
 					SDEI_EVENT_REGISTER_RM_ANY, 0);
 			if (err) {
 				pr_err("Failed to re-register event %u\n",
@@ -978,6 +984,7 @@ static int sdei_get_conduit(struct platform_device *pdev)
 
 static int sdei_probe(struct platform_device *pdev)
 {
+	unsigned long entry_point;
 	int err;
 	u64 ver = 0;
 	int conduit;
@@ -1007,12 +1014,14 @@ static int sdei_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	sdei_entry_point = sdei_arch_get_entry_point(conduit);
-	if (!sdei_entry_point) {
+	entry_point = sdei_arch_get_entry_point(conduit);
+	if (!entry_point) {
 		/* Not supported due to hardware or boot configuration */
 		sdei_mark_interface_broken();
 		return 0;
 	}
+	/* Pairs with the smp_load_acquire() in sdei_get_entry_point(). */
+	smp_store_release(&sdei_entry_point, entry_point);
 
 	err = cpu_pm_register_notifier(&sdei_pm_nb);
 	if (err) {

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-mb-arm-sdei-f69f902b810d

Best regards,
--  
Jaidev Shastri <jaidevshastri@vt.edu>



