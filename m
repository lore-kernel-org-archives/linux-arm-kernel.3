Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D9ACDDE71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Ux2RzC9XNIw9d0bSRDZ5Q8JiKL0SUivtiH9OHY3c+s=; b=HOzcDKKysFtVHKCZCiGo8GVRKs
	rBAbq01zT1JW3k/9+xibT1fOITonqsfKRVax75DnUo8k2u7RMModXC/5NpIqRgJZVnXhr1aCawmDf
	qrYyr1zxRHYa2cvNBQ8LBHGTF5+Tz3HKkHscLeENkx8NPPRT1p01ribQiPycCQzZg49h3lOs1zpPS
	RHys2sgNYWuh2g8CnpuCThYipx0rUB3dvVaXWK5uWQJMlFGw6he41gRqG4rXx4rZ0GYhI6W9BMUZK
	JgcAPOEP/ZKi8gY6HJsntSeqZBAD5Llb/iyIurKRLxUqa3Xi6AcfgEla6+2wRe2AKwy0IiAXSuvyj
	oJpHKaSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpP-0000000EC5R-3OYE;
	Wed, 23 Oct 2024 11:47:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAg-0000000E4yb-1R6o;
	Wed, 23 Oct 2024 11:05:00 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3ED4182A;
	Wed, 23 Oct 2024 13:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681390;
	bh=TNPi62Wih43ydCcvW6KjvjYGbgJFkkVc209bi8iV4bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D3eG7eOrokVhIeflPyOcA676N9RRGceTdo4hQw3cm1tji4TqxUD9ZFdKkvnvidNn2
	 5CV/bEZIdL9QjEl1VmKv1UGkjw1tHcoJmF+MLp3mQUIy91nQyNHF3a7dZsMJAahC1i
	 o+EyWUNNzwaEc5/qoIsLOdLQG3IjyJeZ2nYYSxnY=
From: Umang Jain <umang.jain@ideasonboard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	kernel-list@raspberrypi.com,
	Umang Jain <umang.jain@ideasonboard.com>
Subject: [PATCH 6/6] staging: vchiq_arm: Track bulk user data pointer separately
Date: Wed, 23 Oct 2024 16:34:06 +0530
Message-ID: <20241023110406.885199-7-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023110406.885199-1-umang.jain@ideasonboard.com>
References: <20241023110406.885199-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040458_704404_3FCD325C 
X-CRM114-Status: GOOD (  20.81  )
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

A bulk callback transfer can be initiated from two places -
inside kernel interface or from user interface. However,
the callback data pointer 'cb_data' is used for tracking both
sets of data pointer. This commit tracks the callback
data pointer from user interface (named as 'cb_userdata') separately,
in the bulk transfer service callback.

This is esentially done by adding a 'void __user *cb_userdata' for
tracking __user pointers in vchiq_bulk and vchiq_completion_data
structs. Furthermore, the 'cb_userdata' data pointer is appended to
the vchiq_service's callback signature.

Separating the two callback data pointers ('cb_data' and 'cb_userdata')
fixes the sparse warnings around mixing userspace and kernel space
pointers.

As there are no additional sparse warnings left for vc04_services,
drop the relevant entry from the TODO.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../bcm2835-audio/bcm2835-vchiq.c             |  3 ++-
 .../include/linux/raspberrypi/vchiq.h         |  5 ++--
 drivers/staging/vc04_services/interface/TODO  |  4 ---
 .../interface/vchiq_arm/vchiq_arm.c           | 27 ++++++++++---------
 .../interface/vchiq_arm/vchiq_arm.h           |  3 ++-
 .../interface/vchiq_arm/vchiq_core.c          | 14 ++++++----
 .../interface/vchiq_arm/vchiq_core.h          |  1 +
 .../interface/vchiq_arm/vchiq_dev.c           |  8 ++----
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     |  7 ++---
 9 files changed, 38 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index 133ed15f3dbc..dc0d715ed970 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -96,7 +96,8 @@ static int bcm2835_audio_send_simple(struct bcm2835_audio_instance *instance,
 static int audio_vchi_callback(struct vchiq_instance *vchiq_instance,
 			       enum vchiq_reason reason,
 			       struct vchiq_header *header,
-			       unsigned int handle, void *userdata)
+			       unsigned int handle,
+			       void *cb_data, void __user *cb_userdata)
 {
 	struct bcm2835_audio_instance *instance = vchiq_get_service_userdata(vchiq_instance,
 									     handle);
diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 9a6ab006bed2..ee4469f4fc51 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -56,7 +56,7 @@ struct vchiq_service_base {
 			enum vchiq_reason reason,
 			struct vchiq_header *header,
 			unsigned int handle,
-			void *bulk_userdata);
+			void *cb_data, void __user *cb_userdata);
 	void *userdata;
 };
 
@@ -65,6 +65,7 @@ struct vchiq_completion_data_kernel {
 	struct vchiq_header *header;
 	void *service_userdata;
 	void *cb_data;
+	void  __user *cb_userdata;
 };
 
 struct vchiq_service_params_kernel {
@@ -73,7 +74,7 @@ struct vchiq_service_params_kernel {
 			enum vchiq_reason reason,
 			struct vchiq_header *header,
 			unsigned int handle,
-			void *cb_data);
+			void *cb_data, void __user *cb_userdata);
 	void *userdata;
 	short version;       /* Increment for non-trivial changes */
 	short version_min;   /* Update for incompatible changes */
diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index dfb1ee49633f..2ae75362421b 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -27,10 +27,6 @@ The code follows the 80 characters limitation yet tends to go 3 or 4 levels of
 indentation deep making it very unpleasant to read. This is specially relevant
 in the character driver ioctl code and in the core thread functions.
 
-* Clean up Sparse warnings from __user annotations. See
-vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
-is never disclosed to userspace.
-
 * Fix behavior of message handling
 
 The polling behavior of vchiq_bulk_transmit(), vchiq_bulk_receive() and
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index bcfd4ccc8373..505ab32e071c 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -632,7 +632,7 @@ vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handl
 static int
 add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	       struct vchiq_header *header, struct user_service *user_service,
-	       void *bulk_userdata)
+	       void *cb_data, void __user *cb_userdata)
 {
 	struct vchiq_completion_data_kernel *completion;
 	struct vchiq_drv_mgmt *mgmt = dev_get_drvdata(instance->state->dev);
@@ -662,7 +662,8 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	completion->reason = reason;
 	/* N.B. service_userdata is updated while processing AWAIT_COMPLETION */
 	completion->service_userdata = user_service->service;
-	completion->cb_data = bulk_userdata;
+	completion->cb_data = cb_data;
+	completion->cb_userdata = cb_userdata;
 
 	if (reason == VCHIQ_SERVICE_CLOSED) {
 		/*
@@ -693,8 +694,8 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 
 static int
 service_single_message(struct vchiq_instance *instance,
-		       enum vchiq_reason reason,
-		       struct vchiq_service *service, void *bulk_userdata)
+		       enum vchiq_reason reason, struct vchiq_service *service,
+		       void *cb_data, void __user *cb_userdata)
 {
 	struct user_service *user_service;
 
@@ -712,7 +713,7 @@ service_single_message(struct vchiq_instance *instance,
 		dev_dbg(instance->state->dev,
 			"arm: Inserting extra MESSAGE_AVAILABLE\n");
 		ret = add_completion(instance, reason, NULL, user_service,
-				     bulk_userdata);
+				     cb_data, cb_userdata);
 		if (ret)
 			return ret;
 	}
@@ -730,7 +731,8 @@ service_single_message(struct vchiq_instance *instance,
 
 int
 service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
-		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata)
+		 struct vchiq_header *header, unsigned int handle,
+		 void *cb_data, void __user *cb_userdata)
 {
 	/*
 	 * How do we ensure the callback goes to the right client?
@@ -769,9 +771,9 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 	rcu_read_unlock();
 
 	dev_dbg(service->state->dev,
-		"arm: service %p(%d,%p), reason %d, header %p, instance %p, bulk_userdata %p\n",
+		"arm: service %p(%d,%p), reason %d, header %p, instance %p, cb_data %p, cb_userdata %p\n",
 		user_service, service->localport, user_service->userdata,
-		reason, header, instance, bulk_userdata);
+		reason, header, instance, cb_data, cb_userdata);
 
 	if (header && user_service->is_vchi) {
 		spin_lock(&service->state->msg_queue_spinlock);
@@ -783,8 +785,8 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 			DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 			DEBUG_COUNT(MSG_QUEUE_FULL_COUNT);
 
-			ret = service_single_message(instance, reason,
-						     service, bulk_userdata);
+			ret = service_single_message(instance, reason, service,
+						     cb_data, cb_userdata);
 			if (ret) {
 				DEBUG_TRACE(SERVICE_CALLBACK_LINE);
 				vchiq_service_put(service);
@@ -822,7 +824,7 @@ service_callback(struct vchiq_instance *instance, enum vchiq_reason reason,
 		return 0;
 
 	return add_completion(instance, reason, header, user_service,
-		bulk_userdata);
+			      cb_data, cb_userdata);
 }
 
 void vchiq_dump_platform_instances(struct vchiq_state *state, struct seq_file *f)
@@ -909,7 +911,8 @@ static int
 vchiq_keepalive_vchiq_callback(struct vchiq_instance *instance,
 			       enum vchiq_reason reason,
 			       struct vchiq_header *header,
-			       unsigned int service_user, void *bulk_user)
+			       unsigned int service_user,
+			       void *cb_data, void __user *cb_userdata)
 {
 	dev_err(instance->state->dev, "suspend: %s: callback reason %d\n",
 		__func__, reason);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index b402aac333d9..e32b02f99024 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -155,7 +155,8 @@ static inline int vchiq_register_chrdev(struct device *parent) { return 0; }
 
 extern int
 service_callback(struct vchiq_instance *vchiq_instance, enum vchiq_reason reason,
-		 struct vchiq_header *header, unsigned int handle, void *bulk_userdata);
+		 struct vchiq_header *header, unsigned int handle,
+		 void *cb_data, void __user *cb_userdata);
 
 extern void
 free_bulk_waiter(struct vchiq_instance *instance);
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 3c811b8f210c..064c22fa31c9 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -458,20 +458,23 @@ make_service_callback(struct vchiq_service *service, enum vchiq_reason reason,
 		      struct vchiq_header *header, struct vchiq_bulk *bulk)
 {
 	void *cb_data = NULL;
+	void __user *cb_userdata = NULL;
 	int status;
 
 	/*
-	 * If a bulk transfer is in progress, pass bulk->cb_data to the
+	 * If a bulk transfer is in progress, pass bulk->cb_*data to the
 	 * callback function.
 	 */
-	if (bulk)
+	if (bulk) {
 		cb_data = bulk->cb_data;
+		cb_userdata = bulk->cb_userdata;
+	}
 
-	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK)\n",
+	dev_dbg(service->state->dev, "core: %d: callback:%d (%s, %pK, %pK %pK)\n",
 		service->state->id, service->localport, reason_names[reason],
-		header, cb_data);
+		header, cb_data, cb_userdata);
 	status = service->base.callback(service->instance, reason, header, service->handle,
-					cb_data);
+					cb_data, cb_userdata);
 	if (status && (status != -EAGAIN)) {
 		dev_warn(service->state->dev,
 			 "core: %d: ignoring ERROR from callback to service %x\n",
@@ -3073,6 +3076,7 @@ vchiq_bulk_xfer_queue_msg_killable(struct vchiq_service *service,
 	bulk->dir = bulk_params->dir;
 	bulk->waiter = bulk_params->waiter;
 	bulk->cb_data = bulk_params->cb_data;
+	bulk->cb_userdata = bulk_params->cb_userdata;
 	bulk->size = bulk_params->size;
 	bulk->offset = bulk_params->offset;
 	bulk->uoffset = bulk_params->uoffset;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
index f9a2268ad47e..fadca7b1b196 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
@@ -115,6 +115,7 @@ struct vchiq_bulk {
 	short mode;
 	short dir;
 	void *cb_data;
+	void __user *cb_userdata;
 	struct bulk_waiter *waiter;
 	dma_addr_t dma_addr;
 	int size;
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index fcdf97391fb6..454f43416503 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -338,7 +338,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 		bulk_params.mode = args->mode;
 		bulk_params.size = args->size;
 		bulk_params.dir = dir;
-		bulk_params.cb_data = args->userdata;
+		bulk_params.cb_userdata = args->userdata;
 
 		status = vchiq_bulk_xfer_callback(instance, args->handle,
 						  &bulk_params);
@@ -549,11 +549,7 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 		    !instance->use_close_delivered)
 			vchiq_service_put(service);
 
-		/*
-		 * FIXME: address space mismatch, does cb_data
-		 * actually point to user or kernel memory?
-		 */
-		user_completion.cb_userdata = completion->cb_data;
+		user_completion.cb_userdata = completion->cb_userdata;
 
 		if (vchiq_put_completion(args->buf, &user_completion, ret)) {
 			if (ret == 0)
diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 67489c334f7b..3fe482bd2793 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -551,7 +551,8 @@ static void bulk_abort_cb(struct vchiq_mmal_instance *instance,
 /* incoming event service callback */
 static int mmal_service_callback(struct vchiq_instance *vchiq_instance,
 				 enum vchiq_reason reason, struct vchiq_header *header,
-				 unsigned int handle, void *bulk_ctx)
+				 unsigned int handle, void *cb_data,
+				 void __user *cb_userdata)
 {
 	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(vchiq_instance, handle);
 	u32 msg_len;
@@ -626,11 +627,11 @@ static int mmal_service_callback(struct vchiq_instance *vchiq_instance,
 		break;
 
 	case VCHIQ_BULK_RECEIVE_DONE:
-		bulk_receive_cb(instance, bulk_ctx);
+		bulk_receive_cb(instance, cb_data);
 		break;
 
 	case VCHIQ_BULK_RECEIVE_ABORTED:
-		bulk_abort_cb(instance, bulk_ctx);
+		bulk_abort_cb(instance, cb_data);
 		break;
 
 	case VCHIQ_SERVICE_CLOSED:
-- 
2.45.2


