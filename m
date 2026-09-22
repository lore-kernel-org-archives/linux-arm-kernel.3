Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D66FC982F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 01:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL/gysNN8zyCHcmJm6a2yxK3kq3YO9loIVvCZqr7v/k=; b=BuAIKfEQkgCuf6B+ey9SC79cki
	za0R6zV4IotsBRBAn+KTudYxgE+OU/lGfVFZHYFJozWG0x66Mjj5zJ0817nUPqURsyBvf//5VgFLZ
	8PAxyeHXUAWV8MrRsucsgl+O+8xvIowJGDXQoYza9yXuDhOoQYtSht3d54RmfRCZb+WMijITJj0qu
	EBikPATOpF+FAjNMdwu3omkCF8k+wgMzijsjp2U+jBXgoJ/Igbjt33pgnjruqctvgbJT6jwGfy97K
	7ll29MSzNNgZEMnPBoUeTFs+vPPGeMZlQEV4mksRDsbRhXvsOzBpaK3RGFRZrXphU01PV3vTM6UQx
	68DqyZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouH-00000003qbn-1onN;
	Tue, 22 Sep 2026 01:02:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ouG-00000003qbM-02x3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 01:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7749B40E01;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59524C2BCF6;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790038967;
	bh=cnw9qZpor/7zZzj0V9JEndp8DkRNdwwQ1PREcQig9B8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RP3klCGBuObKKK08w52od4217wpFsbNieucADuk9mqSIcLIYxVXga6a+uwjxwt+Hc
	 jsZCad2hAUgU3M/uVF7IxblG4QXPKhFedmYH8lkOTe8dz+NkUqi9sf7zOejnrq3KES
	 LPzoh8z5nNtL7QIyO0uHDgyKOZK75CKnKSnNyaOKTx4LuGPrIlPLVa1tCNF4Mw18hb
	 t9cszBC1vryGf02yUesggbRGQFetKaisMggzf6m9g2zMYa+/+sN6qzHurhhueNAw0H
	 21HCX6sZMPvaJTMmSYwcdaZLZUgA/WMLz/5IjuVjlmq2BtYwNJ8R2SMSGqyOY86bvd
	 9CqcBcgUrpd3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFF0C982F0;
	Tue, 22 Sep 2026 01:02:47 +0000 (UTC)
From: Jaidev Shastri via B4 Relay <devnull+jaidevshastri.vt.edu@kernel.org>
Date: Mon, 21 Sep 2026 21:02:33 -0400
Subject: [PATCH 1/2] soc: xilinx: zynqmp_power: do not use rx_chan before
 probe has stored it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-mb-zynqmp-power-v1-1-de6f2eee3f23@vt.edu>
References: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
In-Reply-To: <20260921-mb-zynqmp-power-v1-0-de6f2eee3f23@vt.edu>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jaidev Shastri <jaidevshastri@vt.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790038966; l=4268;
 i=jaidevshastri@vt.edu; s=20260921; h=from:subject:message-id;
 bh=Uq14lWjsscKy07/WiWvu53h0xObDxYzSms9WSrON0K4=;
 b=oYHE40hIKuPZQqZXEOlkwx7RCo9QIaijyVmlcR30Ub57Iv8n+Z9MdwOJKE+GDkQGvDCTrcIVL
 q6JQFO18T2rBajNL8x99Wk/05mFwfyJVNwhXs3dW9jLZ3s1josb1690
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

zynqmp_pm_probe() installs the rx callback and then requests the channel:

	client->rx_callback = ipi_receive_callback;
	rx_chan = mbox_request_channel_byname(client, "rx");

mbox_request_channel() starts the channel before it returns and the
ZynqMP IPI controller enables the remote interrupt in its startup
callback. A message the firmware already has pending is delivered at
that point, so ipi_receive_callback() runs before the return value has
been stored. It acks with rx_chan still NULL, mbox_send_message()
returns -EINVAL and the IPI is never acknowledged. The mailbox API gives
the callback no way to reach the channel from its struct mbox_client.

Store the channel under a spinlock shared with the callback and let the
callback record a pending ack when it runs before the channel is
published. Probe sends that ack once rx_chan is visible.

Found with MBCheck, a static herd7-based memory consistency checker.

Signed-off-by: Jaidev Shastri <jaidevshastri@vt.edu>
---
 drivers/soc/xilinx/zynqmp_power.c | 48 +++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/xilinx/zynqmp_power.c b/drivers/soc/xilinx/zynqmp_power.c
index 54c796afb..a7c1befc5 100644
--- a/drivers/soc/xilinx/zynqmp_power.c
+++ b/drivers/soc/xilinx/zynqmp_power.c
@@ -51,6 +51,9 @@ struct zynqmp_pm_event_info {
 
 static struct zynqmp_pm_work_struct *zynqmp_pm_init_suspend_work, *zynqmp_pm_init_restart_work;
 static struct mbox_chan *rx_chan;
+/* Serialises rx_chan and rx_ack_pending between probe and the rx callback. */
+static DEFINE_SPINLOCK(rx_chan_lock);
+static bool rx_ack_pending;
 
 enum pm_suspend_mode {
 	PM_SUSPEND_MODE_FIRST = 0,
@@ -128,6 +131,7 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 {
 	struct zynqmp_ipi_message *msg = (struct zynqmp_ipi_message *)data;
 	u32 payload[CB_PAYLOAD_SIZE];
+	unsigned long flags;
 	int ret;
 
 	memcpy(payload, msg->data, sizeof(msg->len));
@@ -143,10 +147,21 @@ static void ipi_receive_callback(struct mbox_client *cl, void *data)
 		queue_work(system_dfl_wq,
 			   &zynqmp_pm_init_suspend_work->callback_work);
 
-		/* Send NULL message to mbox controller to ack the message */
-		ret = mbox_send_message(rx_chan, NULL);
-		if (ret)
-			pr_err("IPI ack failed. Error %d\n", ret);
+		/*
+		 * Send NULL message to mbox controller to ack the message. The
+		 * mailbox core can deliver as soon as the channel is started,
+		 * before mbox_request_channel_byname() has returned the channel
+		 * to probe; in that case leave the ack to probe.
+		 */
+		spin_lock_irqsave(&rx_chan_lock, flags);
+		if (rx_chan) {
+			ret = mbox_send_message(rx_chan, NULL);
+			if (ret)
+				pr_err("IPI ack failed. Error %d\n", ret);
+		} else {
+			rx_ack_pending = true;
+		}
+		spin_unlock_irqrestore(&rx_chan_lock, flags);
 	}
 }
 
@@ -287,6 +302,8 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 pm_api_version, pm_family_code, node_id;
 	struct mbox_client *client;
+	struct mbox_chan *chan;
+	bool ack_pending;
 
 	ret = zynqmp_pm_get_api_version(&pm_api_version);
 	if (ret)
@@ -353,10 +370,27 @@ static int zynqmp_pm_probe(struct platform_device *pdev)
 		client->dev = &pdev->dev;
 		client->rx_callback = ipi_receive_callback;
 
-		rx_chan = mbox_request_channel_byname(client, "rx");
-		if (IS_ERR(rx_chan)) {
+		chan = mbox_request_channel_byname(client, "rx");
+		if (IS_ERR(chan)) {
 			dev_err(&pdev->dev, "Failed to request rx channel\n");
-			return PTR_ERR(rx_chan);
+			return PTR_ERR(chan);
+		}
+
+		/*
+		 * The channel is live from the moment the mailbox core started
+		 * it. Publish it to the rx callback and ack any message that
+		 * arrived before this point.
+		 */
+		spin_lock_irq(&rx_chan_lock);
+		rx_chan = chan;
+		ack_pending = rx_ack_pending;
+		rx_ack_pending = false;
+		spin_unlock_irq(&rx_chan_lock);
+
+		if (ack_pending) {
+			ret = mbox_send_message(chan, NULL);
+			if (ret)
+				dev_err(&pdev->dev, "IPI ack failed. Error %d\n", ret);
 		}
 	} else if (of_property_present(pdev->dev.of_node, "interrupts")) {
 		irq = platform_get_irq(pdev, 0);

-- 
2.43.0



