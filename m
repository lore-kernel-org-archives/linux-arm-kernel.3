Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34908CCFA02
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0bjdzOCaBcLRp+n770rmR23Mz+RGNd0qYt2FTB/5pps=; b=Iz8gohj/C6WUmDZozqh0m3cfqA
	JUhoZPPLt8fJmYJtzOc7CH6ThWHPBs2BCv+8E3iRE6Hfslh/e4FptzaQINeM1EBdlQDagPb6TpIea
	5Sb6ZhzgnJ/PU7axTT8QOcknsYAidn0sVApcOrDMD67N2RsBz9PboK1FzPsgS1Hdf2b8KkBSmqPNw
	AR6L8/rmYfiUUAM+yILoxWIf/Bsfn1HmaZtcplO6D1ZCTMwxp6wLQ/p3Uzu40rWd9p5p4lZDn7RG8
	XH6sz1/qCmgASki+ad92brIdm0rbBjhrCjzJAkezmWyhOE6pwXzP78gkol5gaC4fmbY9/cQL+zCu+
	OJDyfUPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvQ-00000006UOE-3JVI;
	Fri, 31 Oct 2025 17:28:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEsvD-00000006U7A-0rAZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 17:28:22 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D915446;
	Fri, 31 Oct 2025 18:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761931586;
	bh=Y7nThyvwqpce8nW9iJ0THyTWhnt4FWq/t8yCxViAL2Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cHxdNjpc+48gBksiqEin9x35j6nCW5JFYXTC+drP23ScYn3cRkJv/+yEZFjzditE6
	 jvl2lERrRAYaVjqEKqXF8ERhh3TNeLMbQ4ePc6l9wsxy/ZcNZDnMR1LWW3u3Suy5MS
	 EAtrjHbs1xFV/eRujpjEocRGOYp+gSVLfr57TKHs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 31 Oct 2025 22:57:22 +0530
Subject: [PATCH 02/13] platform/raspberrypi: vchiq-mmal: Add support for
 event callbacks.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-b4-vc-sm-cma-v1-2-0dd5c0ec3f5c@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13198;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=HV7eDw2RJNoFQ/vfTNfIFTlG5/z3KZrEQLJcrzl3JN4=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpBPGV9RRdyPVpR1rSPOcSsc8358HTjW4XoxmjR
 qv2iGr+wQiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQTxlQAKCRBD3pH5JJpx
 RdDUEACBpm9+lpq2UhTPKAseXCk9mc8L4A4k+6B2mhdG9TIghaH3hWatp6kU+FatqTBJi4DQWyF
 1LK/2eCq0Lrm/u5yzvwYEklPDpJ1fpnAGz2Gfvrctupmi7wXZktce40R3WhkSpCTbc+VzFoNqK/
 fG+ZoNUdZfxhuft/S6DXHWC8TYWwAQec6v1Kf9xAHJ8eZsSd5eBoRrbpJSjaiNQhFpG/f2SJQZR
 4O3drUgK5pe7vH+FKtEYfz1+nrDoXlFrxKp3/obQ+xegSqvAZ7q+zAX/Tgw0w9AGMp3ftgAvM9C
 gGz+90AcfJI3eXsu57No5AH+NimrpFinL+wyDaXah7tHxTM9eu9iGejtZN0Md4KE9x9fp6q9VMD
 ghwWljbdPcTpf/Rrnoq6ATFceHzHHwQQkXX57sMEKebRY0tzsPoeOs73WeBVCqa1r7hkWmvX3Wc
 yh0Zc79vp3I+i20cYT5em18vkJYYDEpzJdz2DN+ZAwLWrLTtHDxquZJm+cF9EqRS805fbN0OYCD
 zgGUQyAbUepK04hVXlZBOeh1MKDR4Qu43MS3OyTdlV8LmMwU4/JOOoBQhMPybxjMMYcKoFrsEGV
 6ac8AfvjGCscZPpFRDdEsgVwTG2M+Q1gehB67ISTtu0Buoir7WukbNJ2NGgadIda5Illh9wyBah
 lSrITtGAlXAsuWQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_102819_580374_20FAB60E 
X-CRM114-Status: GOOD (  23.69  )
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

The codec uses the event mechanism to report things such as
resolution changes. It is signalled by the cmd field of the buffer
being non-zero.

Add support for passing this information out to the client.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h |   1 +
 drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h    |  35 +++++++++++++++++++++++++
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c  | 170 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------
 drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h  |   4 +++
 4 files changed, 196 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
index b33129403a30347fe762d0377cacbda77434c211..0443be8198ea57fcd66d598ef7a46309d82ec7b7 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
@@ -50,6 +50,7 @@ struct mmal_buffer {
 
 	struct mmal_msg_context *msg_context;
 
+	u32 cmd;		/* MMAL command. 0=data. */
 	unsigned long length;
 	u32 mmal_flags;
 	s64 dts;
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
index 1889494425eb65e4e2212e0806084a56087dc61d..7cccd5ee9a9e707b26dada6a9506d6a4145de32f 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
@@ -346,6 +346,41 @@ struct mmal_msg_port_parameter_get_reply {
 /* event messages */
 #define MMAL_WORKER_EVENT_SPACE 256
 
+/* Four CC's for events */
+#define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
+
+#define MMAL_EVENT_ERROR		MMAL_FOURCC('E', 'R', 'R', 'O')
+#define MMAL_EVENT_EOS			MMAL_FOURCC('E', 'E', 'O', 'S')
+#define MMAL_EVENT_FORMAT_CHANGED	MMAL_FOURCC('E', 'F', 'C', 'H')
+#define MMAL_EVENT_PARAMETER_CHANGED	MMAL_FOURCC('E', 'P', 'C', 'H')
+
+/* Structs for each of the event message payloads */
+struct mmal_msg_event_eos {
+	u32 port_type;	/**< Type of port that received the end of stream */
+	u32 port_index;	/**< Index of port that received the end of stream */
+};
+
+/** Format changed event data. */
+struct mmal_msg_event_format_changed {
+	/* Minimum size of buffers the port requires */
+	u32 buffer_size_min;
+	/* Minimum number of buffers the port requires */
+	u32 buffer_num_min;
+	/* Size of buffers the port recommends for optimal performance.
+	 * A value of zero means no special recommendation.
+	 */
+	u32 buffer_size_recommended;
+	/* Number of buffers the port recommends for optimal
+	 * performance. A value of zero means no special recommendation.
+	 */
+	u32 buffer_num_recommended;
+
+	u32 es_ptr;
+	struct mmal_es_format format;
+	union mmal_es_specific_format es;
+	u8 extradata[MMAL_FORMAT_EXTRADATA_MAX_SIZE];
+};
+
 struct mmal_msg_event_to_host {
 	u32 client_component;	/* component context */
 
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
index 82c2c261fd9cf0669cbd2ca7c814e0703317885a..a115a391908da06e101e159905a4403b91e051c6 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
@@ -145,6 +145,8 @@ struct mmal_msg_context {
 			/* Presentation and Decode timestamps */
 			s64 pts;
 			s64 dts;
+			/* MMAL buffer command flag */
+			u32 cmd;
 
 			int status;	/* context status */
 
@@ -232,18 +234,6 @@ release_msg_context(struct mmal_msg_context *msg_context)
 	kfree(msg_context);
 }
 
-/* deals with receipt of event to host message */
-static void event_to_host_cb(struct vchiq_mmal_instance *instance,
-			     struct mmal_msg *msg, u32 msg_len)
-{
-	pr_debug("unhandled event\n");
-	pr_debug("component:%u port type:%d num:%d cmd:0x%x length:%d\n",
-		 msg->u.event_to_host.client_component,
-		 msg->u.event_to_host.port_type,
-		 msg->u.event_to_host.port_num,
-		 msg->u.event_to_host.cmd, msg->u.event_to_host.length);
-}
-
 /* workqueue scheduled callback
  *
  * we do this because it is important we do not call any other vchiq
@@ -265,13 +255,18 @@ static void buffer_work_cb(struct work_struct *work)
 	buffer->mmal_flags = msg_context->u.bulk.mmal_flags;
 	buffer->dts = msg_context->u.bulk.dts;
 	buffer->pts = msg_context->u.bulk.pts;
+	buffer->cmd = msg_context->u.bulk.cmd;
 
-	atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
+	if (!buffer->cmd)
+		atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
 
 	msg_context->u.bulk.port->buffer_cb(msg_context->u.bulk.instance,
 					    msg_context->u.bulk.port,
 					    msg_context->u.bulk.status,
 					    msg_context->u.bulk.buffer);
+
+	if (buffer->cmd)
+		mutex_unlock(&msg_context->u.bulk.port->event_context_mutex);
 }
 
 /* workqueue scheduled callback to handle receiving buffers
@@ -349,6 +344,7 @@ static int bulk_receive(struct vchiq_mmal_instance *instance,
 	msg_context->u.bulk.buffer_used = rd_len;
 	msg_context->u.bulk.dts = msg->u.buffer_from_host.buffer_header.dts;
 	msg_context->u.bulk.pts = msg->u.buffer_from_host.buffer_header.pts;
+	msg_context->u.bulk.cmd = msg->u.buffer_from_host.buffer_header.cmd;
 
 	queue_work(msg_context->instance->bulk_wq,
 		   &msg_context->u.bulk.buffer_to_host_work);
@@ -451,6 +447,103 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	return ret;
 }
 
+/* deals with receipt of event to host message */
+static void event_to_host_cb(struct vchiq_mmal_instance *instance,
+			     struct mmal_msg *msg, u32 msg_len)
+{
+	/* FIXME: Not going to work on 64 bit */
+	struct vchiq_mmal_component *component =
+		(struct vchiq_mmal_component *)msg->u.event_to_host.client_component;
+	struct vchiq_mmal_port *port = NULL;
+	struct mmal_msg_context *msg_context;
+	u32 port_num = msg->u.event_to_host.port_num;
+
+	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
+		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
+		       __func__);
+		return;
+	}
+
+	switch (msg->u.event_to_host.port_type) {
+	case MMAL_PORT_TYPE_CONTROL:
+		if (port_num) {
+			pr_err("%s: port_num of %u >= number of ports 1",
+			       __func__, port_num);
+			return;
+		}
+		port = &component->control;
+		break;
+	case MMAL_PORT_TYPE_INPUT:
+		if (port_num >= component->inputs) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->inputs);
+			return;
+		}
+		port = &component->input[port_num];
+		break;
+	case MMAL_PORT_TYPE_OUTPUT:
+		if (port_num >= component->outputs) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->outputs);
+			return;
+		}
+		port = &component->output[port_num];
+		break;
+	case MMAL_PORT_TYPE_CLOCK:
+		if (port_num >= component->clocks) {
+			pr_err("%s: port_num of %u >= number of ports %u",
+			       __func__, port_num,
+			       port_num >= component->clocks);
+			return;
+		}
+		port = &component->clock[port_num];
+		break;
+	default:
+		break;
+	}
+
+	if (!mutex_trylock(&port->event_context_mutex)) {
+		pr_err("dropping event 0x%x\n", msg->u.event_to_host.cmd);
+		return;
+	}
+	msg_context = port->event_context;
+
+	if (msg->h.status != MMAL_MSG_STATUS_SUCCESS) {
+		/* message reception had an error */
+		//pr_warn
+		pr_err("%s: error %d in reply\n", __func__, msg->h.status);
+
+		msg_context->u.bulk.status = msg->h.status;
+	} else if (msg->u.event_to_host.length > MMAL_WORKER_EVENT_SPACE) {
+		/* data is not in message, queue a bulk receive */
+		pr_err("%s: payload not in message - bulk receive??! NOT SUPPORTED\n",
+		       __func__);
+		msg_context->u.bulk.status = -1;
+	} else {
+		memcpy(msg_context->u.bulk.buffer->buffer,
+		       msg->u.event_to_host.data,
+		       msg->u.event_to_host.length);
+
+		msg_context->u.bulk.buffer_used =
+		    msg->u.event_to_host.length;
+
+		msg_context->u.bulk.mmal_flags = 0;
+		msg_context->u.bulk.dts = MMAL_TIME_UNKNOWN;
+		msg_context->u.bulk.pts = MMAL_TIME_UNKNOWN;
+		msg_context->u.bulk.cmd = msg->u.event_to_host.cmd;
+
+		pr_debug("event component:%u port type:%d num:%d cmd:0x%x length:%d\n",
+			 msg->u.event_to_host.client_component,
+			 msg->u.event_to_host.port_type,
+			 msg->u.event_to_host.port_num,
+			 msg->u.event_to_host.cmd, msg->u.event_to_host.length);
+	}
+
+	schedule_work(&msg_context->u.bulk.work);
+}
+
 /* deals with receipt of buffer to host message */
 static void buffer_to_host_cb(struct vchiq_mmal_instance *instance,
 			      struct mmal_msg *msg, u32 msg_len)
@@ -1333,6 +1426,7 @@ static int port_disable(struct vchiq_mmal_instance *instance,
 				mmalbuf->mmal_flags = 0;
 				mmalbuf->dts = MMAL_TIME_UNKNOWN;
 				mmalbuf->pts = MMAL_TIME_UNKNOWN;
+				mmalbuf->cmd = 0;
 				port->buffer_cb(instance,
 						port, 0, mmalbuf);
 			}
@@ -1634,6 +1728,43 @@ int mmal_vchi_buffer_cleanup(struct mmal_buffer *buf)
 }
 EXPORT_SYMBOL_GPL(mmal_vchi_buffer_cleanup);
 
+static void init_event_context(struct vchiq_mmal_instance *instance,
+			       struct vchiq_mmal_port *port)
+{
+	struct mmal_msg_context *ctx = get_msg_context(instance);
+
+	mutex_init(&port->event_context_mutex);
+
+	port->event_context = ctx;
+	ctx->u.bulk.instance = instance;
+	ctx->u.bulk.port = port;
+	ctx->u.bulk.buffer =
+		kzalloc(sizeof(*ctx->u.bulk.buffer), GFP_KERNEL);
+	if (!ctx->u.bulk.buffer)
+		goto release_msg_context;
+	ctx->u.bulk.buffer->buffer = kzalloc(MMAL_WORKER_EVENT_SPACE,
+					     GFP_KERNEL);
+	if (!ctx->u.bulk.buffer->buffer)
+		goto release_buffer;
+
+	INIT_WORK(&ctx->u.bulk.work, buffer_work_cb);
+	return;
+
+release_buffer:
+	kfree(ctx->u.bulk.buffer);
+release_msg_context:
+	release_msg_context(ctx);
+}
+
+static void free_event_context(struct vchiq_mmal_port *port)
+{
+	struct mmal_msg_context *ctx = port->event_context;
+
+	kfree(ctx->u.bulk.buffer->buffer);
+	kfree(ctx->u.bulk.buffer);
+	release_msg_context(ctx);
+}
+
 /* Initialise a mmal component and its ports
  *
  */
@@ -1683,6 +1814,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 	ret = port_info_get(instance, &component->control);
 	if (ret < 0)
 		goto release_component;
+	init_event_context(instance, &component->control);
 
 	for (idx = 0; idx < component->inputs; idx++) {
 		component->input[idx].type = MMAL_PORT_TYPE_INPUT;
@@ -1693,6 +1825,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->input[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->input[idx]);
 	}
 
 	for (idx = 0; idx < component->outputs; idx++) {
@@ -1704,6 +1837,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->output[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->output[idx]);
 	}
 
 	for (idx = 0; idx < component->clocks; idx++) {
@@ -1715,6 +1849,7 @@ int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
 		ret = port_info_get(instance, &component->clock[idx]);
 		if (ret < 0)
 			goto release_component;
+		init_event_context(instance, &component->clock[idx]);
 	}
 
 	*component_out = component;
@@ -1740,7 +1875,7 @@ EXPORT_SYMBOL_GPL(vchiq_mmal_component_init);
 int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 				  struct vchiq_mmal_component *component)
 {
-	int ret;
+	int ret, idx;
 
 	if (mutex_lock_interruptible(&instance->vchiq_mutex))
 		return -EINTR;
@@ -1752,6 +1887,13 @@ int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
 
 	component->in_use = false;
 
+	for (idx = 0; idx < component->inputs; idx++)
+		free_event_context(&component->input[idx]);
+	for (idx = 0; idx < component->outputs; idx++)
+		free_event_context(&component->output[idx]);
+	for (idx = 0; idx < component->clocks; idx++)
+		free_event_context(&component->clock[idx]);
+
 	mutex_unlock(&instance->vchiq_mutex);
 
 	return ret;
diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
index 8c3959f6f97fb21bcaf2f21589ef291e754e7c19..190a0f42bd6b22c7493463da94c094265d85d8fa 100644
--- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
@@ -79,6 +79,10 @@ struct vchiq_mmal_port {
 	vchiq_mmal_buffer_cb buffer_cb;
 	/* callback context */
 	void *cb_ctx;
+
+	/* ensure serialised use of the one event context structure */
+	struct mutex event_context_mutex;
+	struct mmal_msg_context *event_context;
 };
 
 struct vchiq_mmal_component {

-- 
2.51.0


