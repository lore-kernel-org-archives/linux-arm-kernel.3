Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 09:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKvs9NMfzomWJYoL/uKjqHUhieamWRXdxRMSQh2ZggE=; b=SwFPvxY+hXlud61qSWYmNS9FZP
	3T+4r7RvRrj0JdLAIbWoPgnlAhX+XsLL4t+tF7V9S6VJYY60tmAcdTfseII0E8lh0LEG1d2gI+qA4
	gYIUsf5BOCalDQinPyyZ9lzPWxIIn5e7nqS9mes4yRLa/gDBcnTCLjR+WHqlMYA0iI30hgaKVA5xU
	d2IXU+/+s8PQxF7N6MHX4SeoC8C5BkRZsSGahn0x9WtB5+2B54xU9Vzt5q58L5484Mm3AuILDgCr8
	b7IIT+XlUrU2oGHOqvSpD+q0QK07wE5gIrLov0CT0z0DZ0d7KaJgoJApqgxGUeoWvsW3L0pl7bZk4
	AlHZwJVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWF-00000001pFb-2Zx2;
	Thu, 09 Jul 2026 09:58:11 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whlWC-00000001pCB-1uU2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 09:58:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ccf2360620so13411785ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 02:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591088; x=1784195888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKvs9NMfzomWJYoL/uKjqHUhieamWRXdxRMSQh2ZggE=;
        b=hCsXXo3pvP3NsdZIbNGImRylW28qqALQgXvZ3wC3iRdCZidN4O3NEqzJ+r3nCwO55j
         M1VTxQrFVCVcSB4EJJuxiQvAXXd0qhSeudIKnxtmc7GkJ7z2uD0xDYeAasmp6EnsZ/v6
         RfRqST4+hwD4p441Ger9/BbvSjtbrBPmpvzTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591088; x=1784195888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKvs9NMfzomWJYoL/uKjqHUhieamWRXdxRMSQh2ZggE=;
        b=Z5Un/QsN+1bKCueY0lzG/ZnqqW1CgF958WK/RKk3+W7BE2NlbumeC+BNr5hz50gPrv
         dOYMs7QXs69gudaTOY0SZJboHikXX5l79lUR2HpnLc2g5zUCUBiRJ/VOtclRN52ossrj
         oC3UIzZraDy8ltCLTsztNkcOBJTtdUjBnoPkT81R+d/thIMUcrsr1FkdtzJE8fWw3XbO
         xUizB3HDsI6kJi0T9LhdL6BF2VfmjfbXRqjKrukzvyIYhvXHgLUPEO5fD9TznlAlX1YR
         xFbI6DNrOKU82A/uOStYadYQpHv3S2PdibEVzD8kmc32kUeRNFJNnlggQrJNwN2z0n0K
         hQTA==
X-Forwarded-Encrypted: i=1; AHgh+RoIxIqwiHJfGjzmDL6yq+SqS19gcU7VhPIYKgbTUzvyVeFZpjpgATx8HBqbmfWsXTb4h5y4jwQpdF2f5TADpB0W@lists.infradead.org
X-Gm-Message-State: AOJu0YwuOB9bV3yuX0IlLzN6WMkQB6cIagyk6tdS+bC6nO7P6qmw5MCa
	M5kmukSSPXJJKLDDBUqwIUSqYZcK6H75o+Iux1NjZ2LArvRZ3nCNlMMdIC7qc8sItw==
X-Gm-Gg: AfdE7cmS6+YxezAdpllGNBRTIgjEKQSvJj7JWUtLanDXJ4uQ9d6BLefeT3fQGC8iE+3
	oIzzta2GwUHZw0laO7MnS+tjq00X/mzrRa/TwPdkjiAYA603mhWnf3eWdfnuxUOFZFK/HVj3XnL
	2fspdgavokAU/m85BGBwrhMMJnpTKTm9lrsDfrPg25XqqJNuQz1k0CxAds5nyokHEnKRRKB85ey
	+DztnJnyntvTUuNaeOa+w05ho0nJPww64YwrZDZ9ri2hxitqiQ5Do8Ir1c8V8rDdTejA+FBBSrf
	Dah5Ze0PxiO08DxJ9Gkp0Pyu5a9xPhA+ADN9NwpVioG9gNt7vALXNOgEdZK+/tcT55VHIgADifE
	gbLLuxlVJRyvW+b5TxBGhF6xcm7L4o+0EMd27aNIxkxUi9XZl80ErzFSP2v/YYSxtEpABpnoz+9
	OCXeJNm99/gMBrdZ9cyGQEtIyYSEJtO9wmza5/6SDG40ejBIpj3wJJ8OjbYtmSSip2HBwpcQ==
X-Received: by 2002:a17:903:2450:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2ccea348596mr65689615ad.8.1783591087839;
        Thu, 09 Jul 2026 02:58:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v4 06/14] usb: core: Move struct usb_port and related APIs to port.h
Date: Thu,  9 Jul 2026 17:57:11 +0800
Message-ID: <20260709095726.704448-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_025808_522610_FD179EB8 
X-CRM114-Status: GOOD (  25.77  )
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

|struct usb_port| and its matching container_of() macro should live in
its own port.h, matching the split we have for .c files.

Move them as described. Also move usb_port_is_power_on(), since in the
next change its |struct usb_hub *| parameter will be changed to
|struct usb_port *|, and becomes a non-static function that only
references |struct usb_port|.

port.h is only included from hub.h, as a subsequent patch will directly
use fields from |struct usb_port| in a static inline helper in hub.h.
The USB internal headers don't have header guards to help with this.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch (Andy)
---
 drivers/usb/core/hub.c  | 16 ----------
 drivers/usb/core/hub.h  | 48 ++---------------------------
 drivers/usb/core/port.c | 16 ++++++++++
 drivers/usb/core/port.h | 68 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+), 62 deletions(-)
 create mode 100644 drivers/usb/core/port.h

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index fe10d72ef39d..6f576efa37b1 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3239,22 +3239,6 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
 	return port_dev->ignore_event;
 }
 
-/* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
-{
-	int ret = 0;
-
-	if (hub_is_superspeed(hub->hdev)) {
-		if (portstatus & USB_SS_PORT_STAT_POWER)
-			ret = 1;
-	} else {
-		if (portstatus & USB_PORT_STAT_POWER)
-			ret = 1;
-	}
-
-	return ret;
-}
-
 static void usb_lock_port(struct usb_port *port_dev)
 		__acquires(&port_dev->status_lock)
 {
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..de524c6da9fc 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -15,7 +15,9 @@
 #include <linux/usb/ch11.h>
 #include <linux/usb/hcd.h>
 #include <linux/usb/typec.h>
+
 #include "usb.h"
+#include "port.h"
 
 struct usb_hub {
 	struct device		*intfdev;	/* the "interface" device */
@@ -78,51 +80,6 @@ struct usb_hub {
 	struct list_head        onboard_devs;
 };
 
-/**
- * struct usb port - kernel's representation of a usb port
- * @child: usb device attached to the port
- * @dev: generic device interface
- * @port_owner: port's owner
- * @peer: related usb2 and usb3 ports (share the same connector)
- * @connector: USB Type-C connector
- * @req: default pm qos request for hubs without port power control
- * @connect_type: port's connect type
- * @state: device state of the usb device attached to the port
- * @state_kn: kernfs_node of the sysfs attribute that accesses @state
- * @location: opaque representation of platform connector location
- * @status_lock: synchronize port_event() vs usb_port_{suspend|resume}
- * @portnum: port index num based one
- * @is_superspeed cache super-speed status
- * @usb3_lpm_u1_permit: whether USB3 U1 LPM is permitted.
- * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
- * @early_stop: whether port initialization will be stopped earlier.
- * @ignore_event: whether events of the port are ignored.
- */
-struct usb_port {
-	struct usb_device *child;
-	struct device dev;
-	struct usb_dev_state *port_owner;
-	struct usb_port *peer;
-	struct typec_connector *connector;
-	struct dev_pm_qos_request *req;
-	enum usb_port_connect_type connect_type;
-	enum usb_device_state state;
-	struct kernfs_node *state_kn;
-	usb_port_location_t location;
-	struct mutex status_lock;
-	u32 over_current_count;
-	u8 portnum;
-	u32 quirks;
-	unsigned int early_stop:1;
-	unsigned int ignore_event:1;
-	unsigned int is_superspeed:1;
-	unsigned int usb3_lpm_u1_permit:1;
-	unsigned int usb3_lpm_u2_permit:1;
-};
-
-#define to_usb_port(_dev) \
-	container_of(_dev, struct usb_port, dev)
-
 extern int usb_hub_create_port_device(struct usb_hub *hub,
 		int port1);
 extern void usb_hub_remove_port_device(struct usb_hub *hub,
@@ -138,7 +95,6 @@ extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
 extern int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change);
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index e8fb2acd77be..206b9f9a5807 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -22,6 +22,22 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+/* Check if a port is power on */
+int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+{
+	int ret = 0;
+
+	if (hub_is_superspeed(hub->hdev)) {
+		if (portstatus & USB_SS_PORT_STAT_POWER)
+			ret = 1;
+	} else {
+		if (portstatus & USB_PORT_STAT_POWER)
+			ret = 1;
+	}
+
+	return ret;
+}
+
 static bool usb_port_allow_power_off(struct usb_device *hdev,
 				     struct usb_hub *hub,
 				     struct usb_port *port_dev)
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
new file mode 100644
index 000000000000..f43f6b3b6b1f
--- /dev/null
+++ b/drivers/usb/core/port.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * usb hub driver head file
+ *
+ * Copyright (C) 1999 Linus Torvalds
+ * Copyright (C) 1999 Johannes Erdfelt
+ * Copyright (C) 1999 Gregory P. Smith
+ * Copyright (C) 2001 Brad Hards (bhards@bigpond.net.au)
+ * Copyright (C) 2012 Intel Corp (tianyu.lan@intel.com)
+ *
+ *  move struct usb_port to this file.
+ */
+
+#include <linux/container_of.h>
+#include <linux/device.h>
+#include <linux/mutex_types.h>
+#include <linux/usb.h>
+
+#include <uapi/linux/usb/ch9.h>
+
+/**
+ * struct usb port - kernel's representation of a usb port
+ * @child: usb device attached to the port
+ * @dev: generic device interface
+ * @port_owner: port's owner
+ * @peer: related usb2 and usb3 ports (share the same connector)
+ * @connector: USB Type-C connector
+ * @req: default pm qos request for hubs without port power control
+ * @connect_type: port's connect type
+ * @state: device state of the usb device attached to the port
+ * @state_kn: kernfs_node of the sysfs attribute that accesses @state
+ * @location: opaque representation of platform connector location
+ * @status_lock: synchronize port_event() vs usb_port_{suspend|resume}
+ * @portnum: port index num based one
+ * @is_superspeed cache super-speed status
+ * @usb3_lpm_u1_permit: whether USB3 U1 LPM is permitted.
+ * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
+ * @early_stop: whether port initialization will be stopped earlier.
+ * @ignore_event: whether events of the port are ignored.
+ */
+struct usb_port {
+	struct usb_device *child;
+	struct device dev;
+	struct usb_dev_state *port_owner;
+	struct usb_port *peer;
+	struct typec_connector *connector;
+	struct dev_pm_qos_request *req;
+	enum usb_port_connect_type connect_type;
+	enum usb_device_state state;
+	struct kernfs_node *state_kn;
+	usb_port_location_t location;
+	struct mutex status_lock;
+	u32 over_current_count;
+	u8 portnum;
+	u32 quirks;
+	unsigned int early_stop:1;
+	unsigned int ignore_event:1;
+	unsigned int is_superspeed:1;
+	unsigned int usb3_lpm_u1_permit:1;
+	unsigned int usb3_lpm_u2_permit:1;
+};
+
+#define to_usb_port(_dev) \
+	container_of(_dev, struct usb_port, dev)
+
+struct usb_hub;
+
+extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
-- 
2.55.0.795.g602f6c329a-goog


