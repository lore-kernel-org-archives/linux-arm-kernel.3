Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806BECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eseKVDbNwZEFjkR24/rAvFca/zD9edxu6DZlNEbgmLQ=; b=39k+qvZFqfis937qzpjne7iC9p
	Kq5UfkaWgnSBYS3jbcpmRM/3B9YWUMGaFr6HmsoxryRMixnJykkslaiZzVLpOYVKbB/3917/USgnZ
	ps69XjtHRM/ywayu09dfP7O53WsT2vLRafTkiJEb33QIAqUgh39qNt9nWzyoLyTf8KCbw2td1+JXS
	/YINiRyKiV3VpEWerdtfWyQBmbHkMEetmIDkFYGKIAPXxRTBTf7gqGEoIi+F0z+kxWEg42O2B5S8N
	1Z6r9+1tcibc/Ddsd89SdkFGslLEatdq7ac5GalpHLquNcq/rYtU6+edR7/fg2APV9DCiMXj2yXXA
	Kw1RDADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVV-000000075rK-2w6I;
	Wed, 10 Jun 2026 08:41:53 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVS-000000075nX-2muq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:51 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2bf30d530bdso65049915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080910; x=1781685710; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eseKVDbNwZEFjkR24/rAvFca/zD9edxu6DZlNEbgmLQ=;
        b=HqrHwU/q5EiTrF6iUE1A7osq4/rpuQdCiUKYQSuewgh5Z9GLpDfDcaFu1nCnpQWL/z
         YF2ecQ8y7x9Z0bLAXKbDYcSlDmqgj5HQUk3PNFn+fUI8BViQFug9MVD+RY95oMs00LYi
         kpVdfZHQShHfoRQDOyekJce/at/dndL74arDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080910; x=1781685710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eseKVDbNwZEFjkR24/rAvFca/zD9edxu6DZlNEbgmLQ=;
        b=JnJxKnhoPD5BfvwGelrz7RLCkjV3yqTZ4m5GJXpa2O0QlatI5v8qh3c/KX4Exx3zeG
         mSaQkHiOazM5PjE9bcp2kJFIoXbG9i45WEK4B4sDVGhS17A8yZ78IPFdFajZDESO8r/d
         vaDKTJk+wRRkMJ3lRQLc8+2syjX+ld26hagsFyradKTR2GiqRVSFD3j2z0jVWECFJnkM
         SVJK/1spDTcVvfw/okxiLf8H5xlzndwHubrhnvVy6lK4aeZ+5eZBf6pHVd/CbRdtr/3H
         wPhn9mQC3nEBfodmLFJEfObUIkBkLUmIlkYDedgr/cOr6tqeuvsrDPOtJ6o4yRXrHuWq
         7jNg==
X-Forwarded-Encrypted: i=1; AFNElJ9k6Bw3j4lOAGSxRW0ehOnMu97RhbrZdzb2MR91mXRI7DT31hWjFhHpzfWE2e3SfPHaqQEqor5jvZEmrdshuttv@lists.infradead.org
X-Gm-Message-State: AOJu0YxaTx6NHnWmMFm2VSin+VvnD4CPRfifTkjF3+UAIDo2E4PahkiZ
	fdsMh+fEhXfn89VatT6EQOdHL8GZ0NrTjRpAISB+nfLXXGWzFVL7TGExXFkRhTYx2g==
X-Gm-Gg: Acq92OE/Hor1Y+mvrFaOSP5Wn7YJTzrqXHjUKWCtkZHRG/hB9QWCBOWDCoIYr36bQVr
	YEzW8DGQzkbnGGz89C8r9+nE5e5HIbXR5UB/pndjcVj+AbGp1PXDqGNj6IFOUZe4vjt3W7GAArR
	PeH/mO2Ad9GTsU1dGx0ZYj3tWcwqnBldJfQ2+TAVfWCvGVnfpC9InCS05kvq8CvyTCVpq3ju/4L
	J9nHyMbfL8uUSCMQ1g0scglUBMZfMKdD6SNmmMvhnGZmxUdCkVtvmCYz+s3hwPFCneTYGGC1xrw
	xFBY8vNSSCdS2+uWazyTTgxFEVzhJ28r9erm3q8nBH9ro+Kqfiui8KbphYumf5uSbi1MwpcI9It
	7ztrmtEJNqZYcu97Gc7AuPwoenQ9mjH5EbAjUTpD4rsQehWgU9D+LSAukQpYm2uBHrzpffde+Sg
	0HsudonE+csK76+pTQQvIz/Ok4006BvEeG7ixuWM66wxomv61PMY2xrsOMeGMr72E9VMGQtrrAF
	+q6PYRIGb6r+CoTrg==
X-Received: by 2002:a17:903:28e:b0:2c0:bff4:96a7 with SMTP id d9443c01a7336-2c1e7e55653mr253761215ad.12.1781080910066;
        Wed, 10 Jun 2026 01:41:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:49 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 07/16] usb: hub: Power on connected M.2 E-key connectors
Date: Wed, 10 Jun 2026 16:40:41 +0800
Message-ID: <20260610084053.2059858-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014150_740003_AB381141 
X-CRM114-Status: GOOD (  36.17  )
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

The new M.2 E-key connector can have a USB connection. For the USB device
on this connector to work, its power must be enabled and the W_DISABLE2#
signal deasserted. The connector driver handles this and provides a
toggle over the power sequencing API.

This feature currently only supports a directly connected (no mux in
between) M.2 E-key connector. Existing USB connector types are not
covered. The USB A connector was recently added to the onboard devices
driver. USB B connectors have historically been managed by the USB
gadget or dual-role device controller drivers. USB C connectors are
handled by TCPM drivers.

The power sequencing API does not know whether a power sequence provider
is not needed or not available yet, so we only request it for connectors
that we know need it, which at this time is just the E-key connector.

On the USB side, the port firmware node (if present) is tied to the
usb_port device. This device is used to acquire the power sequencing
descriptor. This allows the provider to tell the different ports on one
hub apart.

This feature is not implemented in the onboard USB devices driver. The
power sequencing API expects the consumer device to make the request,
but there is no device node to instantiate a platform device to tie
the driver to. The connector is not a child node of the USB host or
hub, and the graph connection is from a USB port to the connector.
And the connector itself already has a driver.

Power sequencing is not directly enabled in the connector driver as
that would completely decouple the timing of it from the USB subsystem.
It would not be possible for the USB subsystem to toggle the power
for a power cycle or to disable the port.

This change depends on another change to make the power sequencing
framework bool instead of tristate. The USB core and hub driver are
bool, so if the power sequencing framework is built as a module, the
kernel will fail to link.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Switch to fwnode instead of OF
- Tie port@ fwnode to usb_port device
- Move remote node compatible checking to separate helper
- Use usb_port device to request power sequencing descriptor
- Drop "index" parameter from pwrseq_get()
- Do not get pwrseq descriptor for SuperSpeed port; share one for one
  physical port
- Add pwrseq state tracking
---
 drivers/usb/core/hub.c  | 38 ++++++++++++++++++++---
 drivers/usb/core/hub.h  |  4 +++
 drivers/usb/core/port.c | 68 ++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 104 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 362a10f7eddb..9a9eb7e3e1fd 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -32,6 +32,7 @@
 #include <linux/mutex.h>
 #include <linux/random.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/kobject.h>
 
 #include <linux/bitfield.h>
@@ -886,20 +887,41 @@ static void hub_tt_work(struct work_struct *work)
 int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 			   int port1, bool set)
 {
-	int ret;
+	struct usb_port *pwrseq_port = hub->ports[port1 - 1];
+	int ret = 0;
+
+	/* non-SuperSpeed USB port holds pwrseq descriptor reference. */
+	if (hub->ports[port1 - 1]->is_superspeed && hub->ports[port1 - 1]->peer)
+		pwrseq_port = hub->ports[port1 - 1]->peer;
+
+	if (set && !pwrseq_port->pwrseq_on)
+		ret = pwrseq_power_on(pwrseq_port->pwrseq);
+	else if (!set && pwrseq_port->pwrseq_on)
+		ret = pwrseq_power_off(pwrseq_port->pwrseq);
+	if (ret)
+		return ret;
 
 	if (set)
 		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 	else
 		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
-	if (ret)
+	if (ret) {
+		if (set && !pwrseq_port->pwrseq_on)
+			pwrseq_power_off(pwrseq_port->pwrseq);
+		else if (!set && pwrseq_port->pwrseq_on)
+			pwrseq_power_on(pwrseq_port->pwrseq);
 		return ret;
+	}
 
-	if (set)
+	if (set) {
 		set_bit(port1, hub->power_bits);
-	else
+		pwrseq_port->pwrseq_on = 1;
+	} else {
 		clear_bit(port1, hub->power_bits);
+		pwrseq_port->pwrseq_on = 0;
+	}
+
 	return 0;
 }
 
@@ -3252,7 +3274,13 @@ int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 			ret = 1;
 	}
 
-	return ret;
+	if (port->is_superspeed && port->peer)
+		port = port->peer;
+
+	if (!port->pwrseq)
+		return ret;
+
+	return ret && port->pwrseq_on;
 }
 
 static void usb_lock_port(struct usb_port *port_dev)
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index b65d9192379d..a2ac91726c61 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -85,6 +85,7 @@ struct usb_hub {
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
  * @connector: USB Type-C connector
+ * @pwrseq: power sequencing descriptor for the port
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -97,6 +98,7 @@ struct usb_hub {
  * @usb3_lpm_u2_permit: whether USB3 U2 LPM is permitted.
  * @early_stop: whether port initialization will be stopped earlier.
  * @ignore_event: whether events of the port are ignored.
+ * @pwrseq_on: whether power sequencing is turned on.
  */
 struct usb_port {
 	struct usb_device *child;
@@ -104,6 +106,7 @@ struct usb_port {
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
 	struct typec_connector *connector;
+	struct pwrseq_desc *pwrseq;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
@@ -118,6 +121,7 @@ struct usb_port {
 	unsigned int is_superspeed:1;
 	unsigned int usb3_lpm_u1_permit:1;
 	unsigned int usb3_lpm_u2_permit:1;
+	unsigned int pwrseq_on:1;
 };
 
 #define to_usb_port(_dev) \
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index d9d3e2bb8f25..a5e7fbf4aa6e 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,11 +7,14 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 #include <linux/sysfs.h>
 #include <linux/pm_qos.h>
+#include <linux/property.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/component.h>
 #include <linux/usb/of.h>
 
@@ -28,6 +31,9 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 	if (hub_is_port_power_switchable(hub))
 		return true;
 
+	if (port_dev->pwrseq)
+		return true;
+
 	if (!IS_ENABLED(CONFIG_ACPI))
 		return false;
 
@@ -748,6 +754,43 @@ static const struct component_ops connector_ops = {
 	.unbind = connector_unbind,
 };
 
+static bool port_pwrseq_is_supported(struct usb_port *port_dev)
+{
+	struct device *dev = &port_dev->dev;
+	struct fwnode_handle *port = dev->fwnode;
+	struct fwnode_handle *ep __free(fwnode_handle) =
+			fwnode_graph_get_next_port_endpoint(port, NULL);
+	if (!ep)
+		return false;
+
+	struct fwnode_handle *remote __free(fwnode_handle) =
+			fwnode_graph_get_remote_port_parent(ep);
+	if (!remote)
+		return false;
+
+	if (!fwnode_device_is_compatible(remote, "pcie-m2-e-connector")) {
+		dev_dbg(dev, "remote endpoint %pfw is not a supported connector", remote);
+		return false;
+	}
+
+	return true;
+}
+
+static struct pwrseq_desc *usb_hub_port_pwrseq_get(struct usb_port *port_dev)
+{
+	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
+		return NULL;
+
+	/* A physical port should only have one pwrseq reference. */
+	if (port_dev->is_superspeed)
+		return NULL;
+
+	if (!port_pwrseq_is_supported(port_dev))
+		return NULL;
+
+	return pwrseq_get(&port_dev->dev, "usb");
+}
+
 int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
@@ -803,10 +846,25 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
+	port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
+	if (IS_ERR(port_dev->pwrseq)) {
+		retval = PTR_ERR(port_dev->pwrseq);
+		dev_err_probe(&port_dev->dev, retval,
+			      "failed to get power sequencing descriptor\n");
+		goto err_put_kn;
+	}
+
+	retval = pwrseq_power_on(port_dev->pwrseq);
+	if (retval) {
+		dev_err_probe(&port_dev->dev, retval, "failed to enable power\n");
+		goto err_put_pwrseq;
+	}
+	port_dev->pwrseq_on = 1;
+
 	retval = component_add(&port_dev->dev, &connector_ops);
 	if (retval) {
 		dev_warn(&port_dev->dev, "failed to add component\n");
-		goto err_put_kn;
+		goto err_pwrseq_off;
 	}
 
 	find_and_link_peer(hub, port1);
@@ -844,6 +902,11 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	}
 	return 0;
 
+err_pwrseq_off:
+	if (port_dev->pwrseq_on)
+		pwrseq_power_off(port_dev->pwrseq);
+err_put_pwrseq:
+	pwrseq_put(port_dev->pwrseq);
 err_put_kn:
 	sysfs_put(port_dev->state_kn);
 err_unregister:
@@ -860,6 +923,9 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 	peer = port_dev->peer;
 	if (peer)
 		unlink_peers(port_dev, peer);
+	if (port_dev->pwrseq_on)
+		pwrseq_power_off(port_dev->pwrseq);
+	pwrseq_put(port_dev->pwrseq);
 	component_del(&port_dev->dev, &connector_ops);
 	sysfs_put(port_dev->state_kn);
 	device_unregister(&port_dev->dev);
-- 
2.54.0.1099.g489fc7bff1-goog


