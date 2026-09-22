Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E9C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtOljOPtT9KqzUyMo9Iln83r6P59j8ygO/AOk2Cp/Yo=; b=Mhm0poqccF0edxxlNCpST4HvIZ
	w5piFtCX2d9d3vcLE1ZcHoSOKKg5/KJ6JfA0jT8bcjuF9BzU6Cf5m8aVFrvYCbxQxVPUT094kCptH
	P0YWM77XlBZpTKvvzW55ebqR5NA5JlwheuaqalB5mvIfjoreu7qvk/4mluQQJS1zLMQfoGWLCQsJR
	2BHU0nUxTVzBQPkP0ANu9njrMovHIoWEpi26Uz+yodEosLrDz3715VQyZkfVhKCEe2cp32oBhKoAU
	octEHZ7PZF6EpLVnk1OdHS7jtBvC6JybrCR61TDRT+WmabO3VthQzly+eCRn8cy8Os/ZiWuHxctwS
	vw301Wxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouH-00000003qbr-2Fs4;
	Tue, 22 Sep 2026 01:02:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouG-00000003qbO-0DLh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86BBB43996;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6937EC2BCF7;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038967;
	bh=TM+0ObWQfhhHPat2obBpT3dqypsYaaFwAL9LhDuJcHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DeGKs7aebqd2RTTP4l2osk0FTy6sUTMVSx2597LZxnhSLuqItwQeHpR3bD4NGAm/B
	 zv4qys7DorR3no0CiKxRM7CoLbvsY/mChbdoMnMl/4ado77TDR+2NdxVwk1mQTaiWb
	 Sts7nkKuzFPqoRiKDr5XBwJC17fHVXMIM0mqSLzXW4nvPw35RJkgkNZzO8IY6W92nR
	 mdCpdq3GROKKSA5OkGkiycCQHBev2meGDZkFzq8WB+HgfFEhgTUzfhgHuKJ88GOysh
	 0kw8t1NuhFczauu920K1kD4S0uJcIOgWAGFTRgfg8eUcvelkqDd0TDh8SiiazAV6KX
	 aFGkmRbBg7fjQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB8FC982F7;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:02:34 -0400
Subject: [PATCH 2/2] soc: xilinx: zynqmp_power: publish the callback work
 pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-zynqmp-power-v1-2-de6f2eee3f23@vt.edu>
References: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
In-Reply-To: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038966; l=6033;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=0uFwOEgfx+bTjdXpAltvGbFWsfZ9c49O4ntEFzooMNQ=;
 b=FmGyGDP+KUhaDDix5Yik+2dumPHb2k2w3eICtjtgBv7LZr7TRZ3tbItmkoG4lZicMsi/meM8c
 xSfpXC5RZuTDF8hcxbI1dRkrfbvzC6F89HVBACwWpckro5CMC2UD5zb
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

zynqmp_pm_probe() allocates and initialises the suspend and restart work
structures and stores their addresses to the file-scope pointers with
plain stores, before it registers the event manager callbacks and the
mailbox channel. suspend_event_callback(),
subsystem_restart_event_callback() and ipi_receive_callback() read the
pointers with plain loads from the firmware notification path, on any
CPU.

Keep the pointers in locals, publish them with smp_store_release() once
the work is initialised and read them once with smp_load_acquire() in
the callbacks.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/soc/xilinx/zynqmp_power.c | 61 ++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index a7c1befc5..54c1a40e1 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -77,28 +77,32 @@ static void zynqmp_pm_get_callback_data(u32 *buf)
 
 static void subsystem_restart_event_callback(const u32 *payload, void *data)
 {
+	/* Pairs with the smp_store_release() in zynqmp_pm_probe(). */
+	struct zynqmp_pm_work_struct *work = smp_load_acquire(&zynqmp_pm_init_restart_work);
+
 	/* First element is callback API ID, others are callback arguments */
-	if (work_pending(&zynqmp_pm_init_restart_work->callback_work))
+	if (work_pending(&work->callback_work))
 		return;
 
 	/* Copy callback arguments into work's structure */
-	memcpy(zynqmp_pm_init_restart_work->args, &payload[0],
-	       sizeof(zynqmp_pm_init_restart_work->args));
+	memcpy(work->args, &payload[0], sizeof(work->args));
 
-	queue_work(system_dfl_wq, &zynqmp_pm_init_restart_work->callback_work);
+	queue_work(system_dfl_wq, &work->callback_work);
 }
 
 static void suspend_event_callback(const u32 *payload, void *data)
 {
+	/* Pairs with the smp_store_release() in zynqmp_pm_probe(). */
+	struct zynqmp_pm_work_struct *work = smp_load_acquire(&zynqmp_pm_init_suspend_work);
+
 	/* First element is callback API ID, others are callback arguments */
-	if (work_pending(&zynqmp_pm_init_suspend_work->callback_work))
+	if (work_pending(&work->callback_work))
 		return;
 
 	/* Copy callback arguments into work's structure */
-	memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
-	       sizeof(zynqmp_pm_init_suspend_work->args));
+	memcpy(work->args, &payload[1], sizeof(work->args));
 
-	queue_work(system_dfl_wq, &zynqmp_pm_init_suspend_work->callback_work);
+	queue_work(system_dfl_wq, &work->callback_work);
 }
 
 static irqreturn_t zynqmp_pm_isr(int irq, void *data)
@@ -137,15 +141,17 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 	memcpy(payload, msg->data, sizeof(msg->len));
 	/* First element is callback API ID, others are callback arguments */
 	if (payload[0] == PM_INIT_SUSPEND_CB) {
-		if (work_pending(&zynqmp_pm_init_suspend_work->callback_work))
+		struct zynqmp_pm_work_struct *work;
+
+		/* Pairs with the smp_store_release() in zynqmp_pm_probe(). */
+		work = smp_load_acquire(&zynqmp_pm_init_suspend_work);
+		if (work_pending(&work->callback_work))
 			return;
 
 		/* Copy callback arguments into work's structure */
-		memcpy(zynqmp_pm_init_suspend_work->args, &payload[1],
-		       sizeof(zynqmp_pm_init_suspend_work->args));
+		memcpy(work->args, &payload[1], sizeof(work->args));
 
-		queue_work(system_dfl_wq,
-			   &zynqmp_pm_init_suspend_work->callback_work);
+		queue_work(system_dfl_wq, &work->callback_work);
 
 		/*
 		 * Send NULL message to mbox controller to ack the message. The
@@ -299,6 +305,7 @@ static int register_event(struct device *dev, const enum pm_api_cb_id cb_type, c
 
 static int zynqmp_pm_probe(struct platform_device *pdev)
 {
+	struct zynqmp_pm_work_struct *suspend_work, *restart_work;
 	int ret, irq;
 	u32 pm_api_version, pm_family_code, node_id;
 	struct mbox_client *client;
@@ -320,14 +327,20 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 	 * is not available to use) or -ENODEV(Xilinx Event Manager not compiled),
 	 * then use ipi-mailbox or interrupt method.
 	 */
-	zynqmp_pm_init_suspend_work = devm_kzalloc(&pdev->dev,
-						   sizeof(struct zynqmp_pm_work_struct),
-						   GFP_KERNEL);
-	if (!zynqmp_pm_init_suspend_work)
+	suspend_work = devm_kzalloc(&pdev->dev,
+				    sizeof(struct zynqmp_pm_work_struct),
+				    GFP_KERNEL);
+	if (!suspend_work)
 		return -ENOMEM;
 
-	INIT_WORK(&zynqmp_pm_init_suspend_work->callback_work,
+	INIT_WORK(&suspend_work->callback_work,
 		  zynqmp_pm_init_suspend_work_fn);
+	/*
+	 * The event manager and mailbox callbacks registered below
+	 * dereference the work pointer as soon as they run. Publish it with
+	 * release semantics; pairs with the smp_load_acquire() there.
+	 */
+	smp_store_release(&zynqmp_pm_init_suspend_work, suspend_work);
 
 	ret = register_event(&pdev->dev, PM_INIT_SUSPEND_CB, 0, 0, false,
 			     suspend_event_callback);
@@ -343,14 +356,16 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 		else
 			return -ENODEV;
 
-		zynqmp_pm_init_restart_work = devm_kzalloc(&pdev->dev,
-							   sizeof(struct zynqmp_pm_work_struct),
-							   GFP_KERNEL);
-		if (!zynqmp_pm_init_restart_work)
+		restart_work = devm_kzalloc(&pdev->dev,
+					    sizeof(struct zynqmp_pm_work_struct),
+					    GFP_KERNEL);
+		if (!restart_work)
 			return -ENOMEM;
 
-		INIT_WORK(&zynqmp_pm_init_restart_work->callback_work,
+		INIT_WORK(&restart_work->callback_work,
 			  zynqmp_pm_subsystem_restart_work_fn);
+		/* Pairs with the smp_load_acquire() in the event callbacks. */
+		smp_store_release(&zynqmp_pm_init_restart_work, restart_work);
 
 		ret = register_event(&pdev->dev, PM_NOTIFY_CB, node_id, EVENT_SUBSYSTEM_RESTART,
 				     false, subsystem_restart_event_callback);

-- 
2.43.0



