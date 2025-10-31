Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3BACCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJwGo9O3DfJNe9e1R+sRaq2KNdSCT6+lxK365czEaHo=; b=pGZ5n+wjDBZYmtEZvbAbbAFXIP
	naCbLUi9YFU2KrlKzPOaA/bh8J/gfO8WC8mrFZeQmQOMd5JBgDDShu5uJp2ppMho2Mh9N2q2OLnLq
	kU8Gzc1AsEZRvw+jvinHhzWU8AeX0s9WDJpmtMVxyKuJK+pBNYJGyh+zPyqZgDuPAsKuRntkYThgF
	0nbGQL3Wxf5/J75pFdTu7NSlrvP7bk2shokNsr38F48/240lrzKnx4qedOCYRf6OBKLbsv9knVU+5
	a3H23dkkMN54unp3SnKzBIpBJfDDw128BOuUQsinjhvB+qXhQghhj8/rsPtuWMfGYwCmHOtcIdLjr
	mnt5wmqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3b-00000006Y6o-11Q9;
	Fri, 31 Oct 2025 17:36:59 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEt3V-00000006Y3H-3Ocg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:36:56 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBD53A2;
	Fri, 31 Oct 2025 18:26:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931618;
	bh=M82WFeZ7VFa/oUdRBWdKzF41B/nKaOXYBrqQT4FuP9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=n1ZforE8se6yQpa1hRW6XeuqOfbEzxy2X8H17+hRobxK0Df31mofoTg5HKQTbORTz
	 RuTJxS3j0j89pvaiKcXAC5kORXkBq2Fu+FzQhzY1pkgtb7DBs07SAzyZXNgbubemza
	 PgSABl02s8tQDG5/+0rXjkuSgBVJwhCF2QgxU2nA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:28 +0530
Subject: [PATCH 08/13] platform/raspberrypi: vchiq-mmal: Fix memory leak in
 error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-8-0dd5c0ec3f5c@ideasonboard.com>
References: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
In-Reply-To: <20251031-b4-vc-sm-cma-v1-0-0dd5c0ec3f5c@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 bcm-kernel-feedback-list@broadcom.com
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Phil Elwell <phil@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2672;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=El+RK8d9+LHdrGvU0xUfqJDBZbtRjVDpARQlhUyJjtE=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGbBw5eStZhVv0NTK+DUkgbbUDFcFgFCQzwh
 /meHGhP0DyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxmwAKCRBD3pH5JJpx
 RTgdD/9zIM/KFkyFaHgf7omYZbb8OUtQlRrw5U6e4jASYThQKOYjYQozZ/e0QFlE5QIuTQLkGKs
 Lf5em85iM90WSXjhL8WXk9dFKx3v36Ii1ySuAwwv21VwLYIwSpt6fGclGqomJEc39CFtsOEbkvp
 PIqEs46sZn5a6pUPAYNus9x6P36DG5tHSf9oaVKW8DPiKPUv/iww5ocvJgyfN4JfDedWDOYvpGJ
 /GWx+Xe+Kj4HyCLor+2GMI/A0RNpCEw9vQdAPdM5PcXgwyJoYbSkAbvAXY/xmPVRXLMOJIaW3ZJ
 A2cgtiXLcUCB9dJrIc6GuAQJ4jxVLUA9LrmU+rpI8yAZSnY/mQyTEa8AJUtaG7RuxQG1mC9cf9r
 R3MO1/gMxrEsulEEZs4BgxAQndIR1X0W5iQNPZoHBpBOq+dRI3XUHWYvdWioKhZZyBQutcPHY74
 Uw/l0kFz1DF32kKYwqzkB4ytmnjmzCEOOlYvvk/wZ05+kipQK0twK51xHw+jfDcB857M7gURltw
 Tx8APgPaab7T5cdmMS+vxv+7QmttV8R/+t29VKHeKseCV7mfP6mGygmcDe7q+HGqBE3U8PBR/ND
 jXmlTiq7uSs1zMp4iizxD+TCLS4QC0CsZpGo8VSmh5427PnqcA1EMZzxlGdxfZWLreTD+tW/8yo
 3gU72VCsqy7VL9w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_103654_014439_AE4F7503 
X-CRM114-Status: GOOD (  11.41  )
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

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

On error, vchiq_mmal_component_init could leave the
event context allocated for ports.
Clean them up in the error path.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 36f3b068c825e6a26508aefe544f7061c9559510..3c99d0f3e57178761ec57d97cd77e59aa26143fa 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -1768,9 +1768,26 @@ static void free_event_context(struct vchiq_mmal_port *port)
 {
 	struct mmal_msg_context *ctx = port->event_context;
 
+	if (!ctx)
+		return;
+
 	kfree(ctx->u.bulk.buffer->buffer);
 	kfree(ctx->u.bulk.buffer);
 	release_msg_context(ctx);
+	port->event_context = NULL;
+}
+
+static void release_all_event_contexts(struct vchiq_mmal_component *component)
+{
+	int idx;
+
+	for (idx = 0; idx < component->inputs; idx++)
+		free_event_context(&component->input[idx]);
+	for (idx = 0; idx < component->outputs; idx++)
+		free_event_context(&component->output[idx]);
+	for (idx = 0; idx < component->clocks; idx++)
+		free_event_context(&component->clock[idx]);
+	free_event_context(&component->control);
 }
 
 /* Initialise a mmal component and its ports
@@ -1868,6 +1885,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 
 release_component:
 	destroy_component(instance, component);
+	release_all_event_contexts(component);
 unlock:
 	if (component)
 		component->in_use = false;
@@ -1883,7 +1901,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_component *component)
 {
-	int ret, idx;
+	int ret;
 
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
@@ -1895,14 +1913,7 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	component->in_use = false;
 
-	for (idx = 0; idx < component->inputs; idx++)
-		free_event_context(&component->input[idx]);
-	for (idx = 0; idx < component->outputs; idx++)
-		free_event_context(&component->output[idx]);
-	for (idx = 0; idx < component->clocks; idx++)
-		free_event_context(&component->clock[idx]);
-
-	free_event_context(&component->control);
+	release_all_event_contexts(component);
 
 	mutex_unlock(&instance->vchiq_mutex);
 

-- 
2.51.0


