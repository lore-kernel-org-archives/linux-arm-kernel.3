Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9368C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIIjCuT7H0XDo4a52csag/RVgzmsdDxQ+CvC8r4yA3M=; b=A36waIn0HxI8ZnRw/PpOXIHcqP
	h83jNq59OVOHoqk6lnT6d8rmuJy8yyBIECdUQTwtDbYjry/4jG4N4LCtVndYTLrtndOyoTpCZN2PA
	UXtGhtUwdyF880bXXM/59MTmc1mOr9/bexVrjPWjSFNEiOopqloBZKwC9aXlbMNsV0kBb92kGYw6A
	jSYWrWVd40x9RGoOpIXzE8QVK/PlIPT8cFwFH8S+9pOt/fiMUdqrOezunIo+HxinAfoIREXt9WKwy
	6VinQWKOIqbuhdYM5uMaqN+zYHMDc9GWzeyNn81wzedmjJa/rErEphWiwh4vNyZ7rRRcRuNMYsvku
	S4kRngtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O8-00000008aru-2ugi;
	Tue, 21 Jul 2026 06:55:36 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nv-00000008aby-3E4J
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cc891373e0so136833125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616923; x=1785221723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIIjCuT7H0XDo4a52csag/RVgzmsdDxQ+CvC8r4yA3M=;
        b=GDf0q7e2jJFZbb+Va8GAB3NP7MzNsZldZF24S6YHX2LXkV+OeZBBQ83v2Toum9dOvN
         I27ADo+gjvJlLJFCDmUtCwF6T6WT51ktuTO128O+6KqYVBol2mmUG0Qgzs5zKXHuFxd4
         cgCFqzxF7FfLBtAF9hJeA7Oa3dkLpgwyjZbds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616923; x=1785221723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xIIjCuT7H0XDo4a52csag/RVgzmsdDxQ+CvC8r4yA3M=;
        b=f77iAo9yz7/lkiXaTa/w6VlkKWH2Aqv/Ort7fRuSLylEJLrxKwuk5lpYstpda1qx6I
         5QlANgD+eFalhdYje20z1XWzhlJw5vMXKQizHcHGpmLSi1J1m+L17MUVNetiLX2BlREk
         dt2It3au/lLipGZ7vCMT8kEa98/o0d+K8+BSRaP4DSR3VA+H7eozyl8swf6/mZF4kP0v
         IkwbYQNbIofEh9Gozmtoz2sOpCcZ4xx8VIY6q8oKhu4TRc57RbcRATFxODwDo1XKigFE
         B2av1lfC8nMwYbVQvALtDs0jC2HNromaz7ITb9iWa9EWrnpAuAFvokgf1zAnoum4FMNW
         3CjA==
X-Forwarded-Encrypted: i=1; AHgh+RpSIGsYRLmQhSkwhYHw6OPXUC5d+8cmpBHl9RZ7eFqlkA9TZnWbNkXdmvgCaCdQeZ3QUqmsZKSbmNB6NkFIwjs3@lists.infradead.org
X-Gm-Message-State: AOJu0YwNNv7o2ybOnAgH/U3ZAhXlmOXM0oAi6yQS3xUfRib4KfBk26r6
	J5rzzxL1b8cHnr3EaOPcJswR1odLJpIp33DPxDN2GK/q8eJ6mHfQEXTfwdxH30peGg==
X-Gm-Gg: AR+sD12cmONkisio+gnypftKFjXHReX/jl6MQMcP+aUV1Tb0Uqr6awg1mlku4Xs1lD3
	9iF+gEDT8Gno2d/JluYDw0Uc/d2IfTNHZYp0xYjeAdFsD93IVEWWuHMVwXgNClZv2KtIzc01Sm6
	1txBW3naVbxZF51sDvRiTEwXCMkdFZfpOWEad0U74h2bc1eVpxgN07ZpD9z6Yt4XV0mFqXOoFJv
	wx4HSajLcVw82RY9kt4BRy9vP0hFf09YXkKVn4YcTZ9IHeqiUEQ5wSA3vXUFE/kroodyZYwo61F
	LO2cmfFKbYONogrlGavPCA6noUMi/goIu+qp9W60g+DLKUbvIYAhqvAtXDkH5dkqyExvgyYF/q6
	G1CA0VAyMSup+Mji0eMxdKrz0sWekE5L1Mjhsy3YIyo1cwAuEKWfVj8pEhH32PO7IdW9L9N5ySl
	hADv+kuE0JSkt1TDipKg0UCzf7uPQnyXGBkFyKK0mt2cdvbGac855CHqHq1/I=
X-Received: by 2002:a17:902:f542:b0:2cc:741a:ff33 with SMTP id d9443c01a7336-2cf34a39f67mr182425285ad.43.1784616923094;
        Mon, 20 Jul 2026 23:55:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:22 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 10/16] usb: hub: Power on connected M.2 E-key connectors with power sequencing API
Date: Tue, 21 Jul 2026 14:54:05 +0800
Message-ID: <20260721065413.2306137-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235523_825829_27B70084 
X-CRM114-Status: GOOD (  43.94  )
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

Sashiko mentions possible use-after-free of hub->ports from the sysfs
callbacks. This is actually not possible, since the sysfs callbacks
acquire the hub device and its lock, and then check if it is in the
process of disconnect / removal. If it is, then the callbacks just
error out.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Only assign port_dev->pwrseq if successfully retrieved pwrseq
  descriptor (Andy)
- Dropped the pwrseq error pointer check in the release function (Andy)
- Added check for port->pwrseq != NULL before calling
  pwrseq_is_power_on() (API change in patch 3)

Changes since v4:
- Rewrote usb_port_is_power_on() to better express intent and
  restrictions of pwrseq API (Andy)
- Switched to dev_fwnode() in port_pwrseq_is_supported() (Andy)
- Added blank line separating normal variable declarations and __free()
  type declarations (Andy)
- Split out assign_bit() rewrite (Andy)
- Moved pwrseq_put() to release function to avoid UAF (Sashiko)
- Added back pwrseq_power_off() call in usb_hub_remove_port_device();
  otherwise power off could be delayed to object release
- Don't clear hub->ports[port1 - 1] in main error path;
  by that time the port device is registered and sysfs attributes are
  available to userspace (Sashiko)

Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
- Simplified usb_hub_set_port_pwrseq() (Andy)
- Renamed usb_hub_set_port_pwrseq()'s "set" parameter to "on"
- Dropped usb_hub_restore_port_pwrseq() (use usb_hub_set_port_pwrseq()
  with inverted argument)
- Fixed off-by-one access in hub_is_port_power_switchable() (Sashiko)
- Assign retval from dev_err_probe() instead of the other way around (Andy)
- Clear hub->ports[port1 - 1] in USB port error and remove paths to
  avoid other threads from accidental UAF while the USB hub device is
  being unwound (Sashiko)
- Short-circuit out of helpers if !IS_ENABLED(CONFIG_POWER_SEQUENCING)
  to avoid errors from stub functions (Sashiko)

Changes since v2:
- Expanded subject to mention power sequencing API
- Dropped commit message bit about power sequencing Kconfig symbol change
  to bool
- Added optional dependency on POWER_SEQUENCING to USB
- Split out pwrseq_power_*() calls into separate helpers
- Rewrote set_bit() and clear_bit() branches with assign_bit()
- Dropped the pwrseq_power_off() before pwrseq_put(): pwrseq_put() does it
  automatically.
- Removed pwrseq_power_on() from usb_hub_create_port_device(); it will
  get called through usb_hub_set_port_power() in hub_activate().
- Added checks for port->pwrseq in hub_is_port_power_switchable()

- Use separate pwrseq descriptors for HighSpeed and SuperSpeed ports.
  This makes things simpler. On the other hand to power cycle a port
  userspace needs to toggle it on both the HS and SS ports together.
- Dropped pwrseq state tracking again
  The power sequencing consumer API already tracks the state internally;
  doing it again in |struct usb_port| is not necessary especially now
  that the descriptors aren't shared.

It's unclear to me how actual hubs reconcile USB_PORT_FEAT_POWER settings
from the HS side and SS side. One hub chip vendor said that VBUS_EN for
a port is on if the flag is set on either side; however actually testing
on one of their hubs showed that VBUS was cut as soon as the flag is
cleared on the HS port. Maybe it could be different if a SS device was
connected? That scenario was not tested. Testing on another retail
bought hub seemed to work exactly as described though: USB_PORT_FEAT_POWER
needed to be clear on both HS and SS ports to turn off VBUS.

Under this scheme, I'm not sure how the power cycle in hub_port_connect()
would work correctly.

- Link to v2:
  https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.org/

Changes since v1:
- Switch to fwnode instead of OF
- Tie port@ fwnode to usb_port device
- Move remote node compatible checking to separate helper
- Use usb_port device to request power sequencing descriptor
- Drop "index" parameter from pwrseq_get()
- Do not get pwrseq descriptor for SuperSpeed port; share one for one
  physical port
- Add pwrseq state tracking
- Link to v1:
  https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.org/
---
 drivers/usb/Kconfig     |  1 +
 drivers/usb/core/hub.c  | 20 ++++++++++++++-
 drivers/usb/core/hub.h  |  8 +++++-
 drivers/usb/core/port.c | 57 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/core/port.h |  2 ++
 5 files changed, 86 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
index abf8c6cdea9e..ef1959363fb1 100644
--- a/drivers/usb/Kconfig
+++ b/drivers/usb/Kconfig
@@ -44,6 +44,7 @@ config USB_ARCH_HAS_HCD
 config USB
 	tristate "Support for Host-side USB"
 	depends on USB_ARCH_HAS_HCD
+	depends on POWER_SEQUENCING if POWER_SEQUENCING
 	select GENERIC_ALLOCATOR
 	select USB_COMMON
 	select NLS  # for UTF-8 strings
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a5c5038e1604..35e035cfeb4d 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -33,6 +33,7 @@
 #include <linux/mutex.h>
 #include <linux/random.h>
 #include <linux/pm_qos.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/kobject.h>
 
 #include <linux/bitfield.h>
@@ -875,6 +876,16 @@ static void hub_tt_work(struct work_struct *work)
 	spin_unlock_irqrestore(&hub->tt.lock, flags);
 }
 
+static int usb_hub_set_port_pwrseq(struct usb_port *port, bool on)
+{
+	if (!IS_ENABLED(CONFIG_POWER_SEQUENCING))
+		return 0;
+
+	if (on)
+		return pwrseq_power_on(port->pwrseq);
+	return pwrseq_power_off(port->pwrseq);
+}
+
 /**
  * usb_hub_set_port_power - control hub port's power state
  * @hdev: USB device belonging to the usb hub
@@ -890,15 +901,22 @@ static void hub_tt_work(struct work_struct *work)
 int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 			   int port1, bool set)
 {
+	struct usb_port *pwrseq_port = hub->ports[port1 - 1];
 	int ret;
 
+	ret = usb_hub_set_port_pwrseq(pwrseq_port, set);
+	if (ret)
+		return ret;
+
 	if (set)
 		ret = set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 	else
 		ret = usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
-	if (ret)
+	if (ret) {
+		usb_hub_set_port_pwrseq(pwrseq_port, !set);
 		return ret;
+	}
 
 	assign_bit(port1, hub->power_bits, set);
 	return 0;
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index de524c6da9fc..7277c38c9e62 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -103,7 +103,13 @@ static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 	if (!hub)
 		return false;
 	hcs = hub->descriptor->wHubCharacteristics;
-	return (le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM;
+	if ((le16_to_cpu(hcs) & HUB_CHAR_LPSM) < HUB_CHAR_NO_LPSM)
+		return true;
+	/* check for controllable external power sequencers */
+	for (unsigned int i = 0; i < hub->hdev->maxchild; i++)
+		if (hub->ports[i] && hub->ports[i]->pwrseq)
+			return true;
+	return false;
 }
 
 static inline int hub_is_superspeed(struct usb_device *hdev)
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 8d686d43e996..38da7cc24c63 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -8,11 +8,14 @@
  */
 
 #include <linux/acpi.h>
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
 
@@ -35,6 +38,10 @@ int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 			ret = 1;
 	}
 
+	/* stub functions return error */
+	if (IS_ENABLED(CONFIG_POWER_SEQUENCING) && port->pwrseq)
+		return ret && pwrseq_power_is_on(port->pwrseq);
+
 	return ret;
 }
 
@@ -45,6 +52,9 @@ static bool usb_port_allow_power_off(struct usb_device *hdev,
 	if (hub_is_port_power_switchable(hub))
 		return true;
 
+	if (port_dev->pwrseq)
+		return true;
+
 	if (!IS_ENABLED(CONFIG_ACPI))
 		return false;
 
@@ -380,6 +390,8 @@ static void usb_port_device_release(struct device *dev)
 	 * device_platform_notify_remove() in device_del().
 	 */
 	fwnode_handle_put(dev_fwnode(dev));
+	/* usb_hub_create_port_device() could leave an error value */
+	pwrseq_put(port_dev->pwrseq);
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -772,11 +784,46 @@ static const struct component_ops connector_ops = {
 	.unbind = connector_unbind,
 };
 
+static bool port_pwrseq_is_supported(struct usb_port *port_dev)
+{
+	struct device *dev = &port_dev->dev;
+	struct fwnode_handle *port = dev_fwnode(dev);
+
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
+	if (!port_pwrseq_is_supported(port_dev))
+		return NULL;
+
+	return pwrseq_get(&port_dev->dev, "usb");
+}
+
 int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
 	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
+	struct pwrseq_desc *pwrseq;
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -827,6 +874,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	retval = device_register(&port_dev->dev);
 	if (retval) {
 		put_device(&port_dev->dev);
+		hub->ports[port1 - 1] = NULL;
 		return retval;
 	}
 
@@ -844,6 +892,14 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 		goto err_put_kn;
 	}
 
+	pwrseq = usb_hub_port_pwrseq_get(port_dev);
+	if (IS_ERR(pwrseq)) {
+		retval = dev_err_probe(&port_dev->dev, PTR_ERR(pwrseq),
+				       "failed to get power sequencing descriptor\n");
+		goto err_put_kn;
+	}
+	port_dev->pwrseq = pwrseq;
+
 	retval = component_add(&port_dev->dev, &connector_ops);
 	if (retval) {
 		dev_warn(&port_dev->dev, "failed to add component\n");
@@ -901,6 +957,7 @@ void usb_hub_remove_port_device(struct usb_hub *hub, int port1)
 	peer = port_dev->peer;
 	if (peer)
 		unlink_peers(port_dev, peer);
+	pwrseq_power_off(port_dev->pwrseq);
 	component_del(&port_dev->dev, &connector_ops);
 	sysfs_put(port_dev->state_kn);
 	device_unregister(&port_dev->dev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index 2f4349b3ce6b..088a182332d4 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -25,6 +25,7 @@
  * @port_owner: port's owner
  * @peer: related usb2 and usb3 ports (share the same connector)
  * @connector: USB Type-C connector
+ * @pwrseq: power sequencing descriptor for the port
  * @req: default pm qos request for hubs without port power control
  * @connect_type: port's connect type
  * @state: device state of the usb device attached to the port
@@ -44,6 +45,7 @@ struct usb_port {
 	struct usb_dev_state *port_owner;
 	struct usb_port *peer;
 	struct typec_connector *connector;
+	struct pwrseq_desc *pwrseq;
 	struct dev_pm_qos_request *req;
 	enum usb_port_connect_type connect_type;
 	enum usb_device_state state;
-- 
2.55.0.229.g6434b31f56-goog


