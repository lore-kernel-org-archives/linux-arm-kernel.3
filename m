Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A4AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=; b=eTjABul/tCiTBncdsKCGn3KI2C
	Kvnzl4ydp/gANxZ1JnaMZpFGEzhw3rOnc+iINys/xfpcH6W/5XKgvIcYoAdx9HqMrptTrn9JLkcdj
	QUv0TH7xpoMykWbXrfC2EKZWlJ6BSrMD9Qx/MM/T7KpoV9++fvgD7HwtUV0nzfroa9QJMuD0YI0i/
	DB3VsLSP7v/dcdajWKWlfM9noa+serXdYI2apC+LFZW89b2Z1ED6UwBOd/tesfTqxL4tGThxRF8dn
	GkIr0R86qqOlFyBjEzshOJqzByUs3NYudr0lW+ok7YwTaBLp/6lfC2wgROHlF20jgKyGDZM5h3Bl9
	1KPYEa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWd-00000001Q6P-0X5v;
	Fri, 04 Sep 2026 08:43:55 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWa-00000001Q5I-13UR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:43:53 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so803676a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511431; x=1789116231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=KwMxB0GB+/qlQ7DZ+Df0Gc1aZdG6KkQuuYn9fq7PaCg9aNVbV7y+wG1idZH4asMtbu
         aZegh43vEcrSMe3e3J+IeOhAIYc5hlc4ZlMULPFqlGMHf5EcNBXOwSo1Gxo4nPFH/bY2
         snSBh93szvXyEKcgG/uqvguaRa+3cNU7Hmebc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511431; x=1789116231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=PJPVDstloWjNXu/m41S7K5ReT1sdLEEMyF13q0t+zkcmQKNmmuLttbWGZPMDxOVmQh
         nS6l0ie/wIIMDLcERdA/mzOZYUkAjtqOQN2x+sU15XL3eomD3m3/fTtb5GNjGECzTQuX
         MPJDzKQ5pVPjT0HnJRauQWX6v0b2rsIVl5uQ5wP/IKFyH0P2JhsYm8ZqDu8ZU8LmBFQD
         B8s1kj+UYhtz6qsV59roMrubDa5jPu/QfoaR5WJkn9/ynBM8YBD/S310xL0rq7OgEDH1
         97eKIhfnfoU/yVoTehM8ru6PAdniNSggsEiA/uFp5v6s8a46AP3GfAPgX0M2/SLhZIW7
         vCGg==
X-Forwarded-Encrypted: i=1; AKwUvBwIANg7OTLAUa1zj5VSbq2EK2zyLyPoL1DLwa4NfRH7b8j4Yw6CTp+viEsNkoqsHpS929aCdIY3xfltAt47exYb@lists.infradead.org
X-Gm-Message-State: AFuF++nY12gIcxqKr7wByqpay8cbjIppHcbxSiq/PZNCkY/qTIwBb1rz
	WlnPRYpk/vL0yOcKm3JxKyA1D1gmFgcaDeTG3TX2BR38JRM/RVKfuHspCNbXlAmziw==
X-Gm-Gg: AYBFou2s1Uhm6DG0FPC8uATgJKRYyZvTQnCTh2bA4J5/6r4QjyF92mOvzLk/iDRk7Nu
	kXMlCCkiRaFG8JCteCzR/KfNDbor7NxxYPRaY++UkeiQHVo8+nvdhG4UoFf97zW+yDBFBPYENTg
	jRNlzfrlBnP0RfRuiXGYy3Nx3YiO5x6DHF3f7gUhlobgLPb19t6OYcoIq0RaVD3+fo5OmFZuVen
	yeAb25DnxlzNeg066MbXUSjgSIRsDE7uX3PHMvSBiqMwAcjk0Blsf+JA0ppaa0SFk1l1verCsiU
	ZX7uFW/VjdRMUyZ/iGOGeAPzyhiRgOE28q4serLp6AboONZQVS6yg3abwUVT6yQx7Fvod9PWSiU
	XRZnYn5lllqT/htYDAidEqv/gwTvLtFjbUSW+JFA96iLXgi5aZwvxIMNaTwfi9w1OxNBFldTIZ6
	31HZdJas3HmekzHk5TCJP7qlmveFulx1qRC67NCKsCYlBpBxmw/KAg5nuJ6XcjTnI/jK6sjKkQU
	smIT31JPopylMEoFo+uhssCf6LNO4jvsqQHJ0RvrBLLY4imzu1srYM=
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr7487531a91.10.1788511431512;
        Fri, 04 Sep 2026 01:43:51 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:43:11 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v8 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  4 Sep 2026 16:41:45 +0800
Message-ID: <20260904084158.1341550-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014352_297801_AC487F11 
X-CRM114-Status: GOOD (  19.63  )
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
2.55.0.979.g7e5102b832-goog


