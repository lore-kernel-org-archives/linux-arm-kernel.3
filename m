Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC701C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=; b=mN4XO+3aVVKASnWm6XloKGV7aW
	5o0kjNigINXiagEthupOtMy007qSVFzpI5yqdGkWp7zhvQYmdpWNfZ0E+gsg5gq2Feu+nvFoEr43w
	ubEIhK0lN0gxCWTFTz48CM3scxHKtg7+mjK+cmYt0yJWvIWSvOtQUqCxMPyHmI5Q/l3ZSR7v+KM09
	C27IQ9vObMxyYQmimvxB45tmq5ua9u8J88vz44rgLaAK/g8IuX+SszOYfy3hvvLwtARPPFIO9WBXt
	FHOULfXCVgtf/VMTc8sanHjIpflyHqAQwxUDxpX6tUneR+6WcFCQT23mLAd3e+cxnjLpfl7+qOeE2
	0v/zUpDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nk-00000008aQA-2pNi;
	Tue, 21 Jul 2026 06:55:12 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nd-00000008aGK-1uX7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:07 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ceaf8a1265so108155805ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616904; x=1785221704; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=JJ5Tt7XlHKz2n2Cd5UufjY8c/P+IYJ2PvQXH/wKgHC3mViIyGikdQuKRWTWk/9JApA
         MDPszm2d2wlsMroOTqNH5tP3+qg6AP8MhllA/nkTEMAV3Gggg0xr9+zDPakzv4iKCu8q
         OrD2k14ZHYTfqEpJyS2gvUFMzOo1PjIOmv3Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616904; x=1785221704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=QJGbcHB3yK4JHdNnQ4xj0JOYnmy0d40O0ca/CpzG7dUfQD1ZeXLgqEJ+LeTMQV80cb
         LRp+i3h32ZGe3KUHGNi8nX6xSZVAawT0YatipPymqIXAwDnw1653nSIf4Z8kkzlVu24F
         4Pw07w+QdcOTVbekr5mIpsYxI4p/uW00rVNF2zj6gzCVVOZdsLxBI7L4Mysthpl6gNyB
         lHoWuHgRUEalQTXnC+h+Hc+MiUDeN21IlKbRJrK7V9CSwxUhwqaxapGiD6obe8kCZtlN
         OvTtz2UJzmvGyZq4H/HQ7PgqmIwE+iP5QeQAss3YUXI3tElSvvtCrXBWV0FyG+IjciOw
         6NFA==
X-Forwarded-Encrypted: i=1; AHgh+RqnNDBZB8zHsycmI1Y3CSLJS4SbNl8/zh5aTRYTZJ1FcoUkWY/8ugT00AF6sAbK7ebEuNV8mQ+tvORMJ1oNfMkP@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDqbIfN7v3/5eONu0mOSaCEhHyKOt8i0zFdCj9FuVtSWK1krl
	faStYmENC9DAfT9jgbbRacjMqMo0LqsqG9jCavDcF8FZe3ytcmSdAjPydkVkkv70NQ==
X-Gm-Gg: AR+sD12z6B0qB5hus7UXsMbbtkUB0vl2xredgF7fOMcdRh0Ia64aIdCxe7EBDEIjs8K
	G2GkKaJKR5EensBVH7ecTh/H5HqI/ygwkAuQiUx5Gh/tYHQ7gV6/q0sCJateZA7VsbaL40ftH5S
	2XgOCmqf6LiyF8ahU/Xc71xxbv5LkeeqyzWgcthtnDlMqqZJaAXCVya7X/ipmrFCL6QZALXttxl
	LiuGPU0KQEd5QefaeIqDI91Q9FzH02vGbgGYKbuHJEqcx57ZzDeVwN8ikd/XXiE7P2bWMK58DnU
	l2TO1uCUga6/LwRU92PC27s99IHxmp1GxuALicAtYhoORQSahpOrEMfGrKtBbfeKPw7A2u+ggIG
	VtTMD8YfRzedGm9HY2UEd9xJHjapMfBPfeVScck5pmk/JIZn9fsDSoZKrnFp7XOrx5GbsqANZ1c
	090GeBcUqkv3o8+mR8TH9+zxZxTfwLMOBv8ksTRufjeIQyeHsKk5LwqH+V9/TrKFc0opp09w==
X-Received: by 2002:a17:902:f78c:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cf348bee75mr185892145ad.11.1784616904541;
        Mon, 20 Jul 2026 23:55:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:04 -0700 (PDT)
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
Subject: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Tue, 21 Jul 2026 14:54:01 +0800
Message-ID: <20260721065413.2306137-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235505_494001_59D11410 
X-CRM114-Status: GOOD (  19.89  )
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.229.g6434b31f56-goog


