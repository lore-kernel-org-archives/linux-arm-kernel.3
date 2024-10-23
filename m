Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57894CDDE6E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mgVSkFYW8g++2xOZcgUKg5n6JzMMcQtZaKvUm5z2Urk=; b=1myFVPPOM/XjXtte6mbYDGp4/n
	CFvqLkiFZKW4wBD+ItH1HPXkKCgSciGwgfWeS4IH/H40shMfJL/o3kXiO7bPCz3MaVeu2wPfrjRfV
	1eGju3JnGZ+wwBylIcqqk6LkBf6RlJBNhXbXLVSrHMOK8l9ny5vvD7VLXbxoOsXDMAT3Xq2RT1uNm
	1qwuHkKfAQVNlZdzpZqUvHIWkcgdnrCOaOVLKLUXnHp5WXz2Tj4BI6UvfLMmkJj6t6U/STTsk/jpQ
	j3WC/d+lbO8EugLhoXGXuQJ3iUcOABjNyMgR5FegAazsglWrBibfYFDTazDiwQ4hUZgbNy7rMvetl
	hfdjj5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZpI-0000000EByc-1PmW;
	Wed, 23 Oct 2024 11:46:56 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ZAb-0000000E4wn-387a;
	Wed, 23 Oct 2024 11:04:55 +0000
Received: from umang.jain (unknown [IPv6:2405:201:2015:f873:55d7:c02e:b2eb:ee3f])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C43E38A9;
	Wed, 23 Oct 2024 13:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1729681385;
	bh=xHdIxr5t+jY9OyJWLgchvzvtGsJl4NVdoLGbuMoHYRc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K309Z7iBlCQIl4pVKDO/iH87GRiGHP+2XDgSd71jOvzw37jnV09aiFPwJ9FxgfS2O
	 MaxBXlc5nVMzurjIR8EVfth49AqTWtWZX3L+/Hcd4vddOZKAZdQo8YmfCdFlhNvL1s
	 n2AVht3QfvxzbS22SbJaVvxIw+kBrzwaDkYOmWeo=
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
Subject: [PATCH 4/6] staging: vchiq: Rename vchiq_completion_data 'bulk_userdata'
Date: Wed, 23 Oct 2024 16:34:04 +0530
Message-ID: <20241023110406.885199-5-umang.jain@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023110406.885199-1-umang.jain@ideasonboard.com>
References: <20241023110406.885199-1-umang.jain@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_040453_951251_EA0181A7 
X-CRM114-Status: GOOD (  14.14  )
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

In a previous commit, struct vchiq_bulk 'userdata' got renamed to
'cb_data' since it is the data pointer passed in
VCHIQ_BULK_CALLBACK_MODE's callback. Since struct vchiq_completion_data*
structs also has 'bulk_userdata' for completion records, rename
'bulk_userdata' member to 'cb_data' for these structs as well.

This brings consistency and clarity for the struct members. No
functional change in this patch.

Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
---
 .../vc04_services/include/linux/raspberrypi/vchiq.h       | 4 ++--
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 .../staging/vc04_services/interface/vchiq_arm/vchiq_dev.c | 8 ++++----
 .../vc04_services/interface/vchiq_arm/vchiq_ioctl.h       | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
index 6c40d8c1dde6..9a6ab006bed2 100644
--- a/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
+++ b/drivers/staging/vc04_services/include/linux/raspberrypi/vchiq.h
@@ -64,7 +64,7 @@ struct vchiq_completion_data_kernel {
 	enum vchiq_reason reason;
 	struct vchiq_header *header;
 	void *service_userdata;
-	void *bulk_userdata;
+	void *cb_data;
 };
 
 struct vchiq_service_params_kernel {
@@ -73,7 +73,7 @@ struct vchiq_service_params_kernel {
 			enum vchiq_reason reason,
 			struct vchiq_header *header,
 			unsigned int handle,
-			void *bulk_userdata);
+			void *cb_data);
 	void *userdata;
 	short version;       /* Increment for non-trivial changes */
 	short version_min;   /* Update for incompatible changes */
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index c06a57ea9cf5..bcfd4ccc8373 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -662,7 +662,7 @@ add_completion(struct vchiq_instance *instance, enum vchiq_reason reason,
 	completion->reason = reason;
 	/* N.B. service_userdata is updated while processing AWAIT_COMPLETION */
 	completion->service_userdata = user_service->service;
-	completion->bulk_userdata = bulk_userdata;
+	completion->cb_data = bulk_userdata;
 
 	if (reason == VCHIQ_SERVICE_CLOSED) {
 		/*
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
index c99cd36a2696..fcdf97391fb6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_dev.c
@@ -414,7 +414,7 @@ struct vchiq_completion_data32 {
 	enum vchiq_reason reason;
 	compat_uptr_t header;
 	compat_uptr_t service_userdata;
-	compat_uptr_t bulk_userdata;
+	compat_uptr_t cb_data;
 };
 
 static int vchiq_put_completion(struct vchiq_completion_data __user *buf,
@@ -428,7 +428,7 @@ static int vchiq_put_completion(struct vchiq_completion_data __user *buf,
 			.reason		  = completion->reason,
 			.header		  = ptr_to_compat(completion->header),
 			.service_userdata = ptr_to_compat(completion->service_userdata),
-			.bulk_userdata	  = ptr_to_compat(completion->bulk_userdata),
+			.cb_data	  = ptr_to_compat(completion->cb_userdata),
 		};
 		if (copy_to_user(&buf32[index], &tmp, sizeof(tmp)))
 			return -EFAULT;
@@ -550,10 +550,10 @@ static int vchiq_ioc_await_completion(struct vchiq_instance *instance,
 			vchiq_service_put(service);
 
 		/*
-		 * FIXME: address space mismatch, does bulk_userdata
+		 * FIXME: address space mismatch, does cb_data
 		 * actually point to user or kernel memory?
 		 */
-		user_completion.bulk_userdata = completion->bulk_userdata;
+		user_completion.cb_userdata = completion->cb_data;
 
 		if (vchiq_put_completion(args->buf, &user_completion, ret)) {
 			if (ret == 0)
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h
index 17550831f86c..afb71a83cfe7 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_ioctl.h
@@ -47,7 +47,7 @@ struct vchiq_completion_data {
 	enum vchiq_reason reason;
 	struct vchiq_header __user *header;
 	void __user *service_userdata;
-	void __user *bulk_userdata;
+	void __user *cb_userdata;
 };
 
 struct vchiq_await_completion {
-- 
2.45.2


