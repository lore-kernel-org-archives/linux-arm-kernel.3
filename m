Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8B3C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=; b=0k3FHBb7k7du+5YCi1H0zdO6lY
	dqCBGCTo30QeDsz6iiASGcX9JAtXagTChh0AJ+bDXoxY+Kpdi9pIcyYeiBoZb1k7UxOwmQ3gS9Nn4
	RFJVcCD2oV+BPGXd+ryIzDjCA4q+J4iBmI8Y3o/92KqN4Z4CfqpylgrDRyW5jNe7r60VhmIMgE/vL
	ymnfhn+tYGwIrofaVvxC49EzuO76J8KKQ6i8A8ztQCRjLJRu4ZtffGTFABfe/mIRNH1NA0DrRfip1
	58tRGSzMQd8aohT3SlUDYOP8LvDTRp9DU5mx7VgSUiNZ8zh6zoULUzt0j8iBI+SW7HeRobhJgEY5c
	tbpCtUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWU-0000000FqvT-1WWT;
	Fri, 24 Jul 2026 08:44:50 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWF-0000000Fqip-1t83
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:44:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso176786a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882674; x=1785487474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=H/b92TFwxUHLafOMvxys1EQPBCAGk5DdUJRSHYBbnkGJ4YoXF1OWzYj6kkdxQ+BzMo
         3tJEg30G3bm3vJzmLpeqOgvkmGK9dWpmN78VQ95GaiCjrO5BYhZi+pKkWubjvlRB7j1T
         9KjZIoZIz9Pmy6vmL3BwUoaanIsXgp27JfWgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882674; x=1785487474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fHUpdIaIyIIyz0xHiffTwBnjBb2ySQuUos1Tr0diNj4=;
        b=erYuJ4G/Oo5THvXpYiZrf+SFSap7Gp+DtaF9bkR4pmbuUhOtQwiN8dzztkmwWfgkGY
         hQRHdV7qBDgp0+pEVAUCdjmDhiOAiO0NiA0ISGHmpJFyj1SGCVVyWvk4WYU39jDCJHSg
         dDxKl6IPtBRI3RR330zvcWOEvJAvMlf7gjaHpgWlwc4r6V6PvMyTo2MsvZ7/Jzm8Rl6j
         vwL2JuB7YOXMzte+mOxL61VyhRGs2KUZXx8834u89lR2HEvw4RkyYBiOWhI/PdsuG7/y
         jcTiMt3GpcOSJ15XrDQW7nzbjIOkeQE86jOExoz760BA+leBxrL9wpFGJBSvHQ4/jOpq
         Xxow==
X-Forwarded-Encrypted: i=1; AHgh+Roy7rwHD5JFO4lTudSUhp0tWmi/atWMI2yzuXbc4wDMxJcPNqcF0w03Yc6BreV9mTbLjyDhpE0jAOzrT/IfGkDE@lists.infradead.org
X-Gm-Message-State: AOJu0YwS0w8hT14OC3PF1cp31noDNFia+ZMHFnrLaCYtGs0sILMb7VLE
	f59XCqMGUv7fSZxGU5+PKVZ3kvtXFD2qHh5bgVu2X9TGA0l5Lr8KolzHosURwAjjkQ==
X-Gm-Gg: AR+sD11/1KZcUzrkpwlGwchfWMUzSFPg/HrFaD81rMv1aknB7zTbJSx1qIPgoWU40Hk
	dUxN3kZWOrqqEabRpbCYujpRsuOn08BPw0guHBcxIK6+n2SnnFMfEPxZ6M2+CkYqQ8onhosBz45
	pbJmbiEqDNQaB7BG1PUCyLqTI4CQzQZJzzetxP838QmX4eyC5lyFMmZB93qZhMPGgYGltiANUt5
	nWAASGcWnEbOkIPq3bcuQt1lkKT+Nx2my8e1Dc/f0fjyxzRHZv+gFjxgayxuAJnjXqi5rGzoBQJ
	+Tog6NHCd1IkxstTKFU/rGzKaP0njpsjrVXlFiOOKFVKtiIJrx5uzCocjmK6/88cQKLtCB5VCD/
	C4q7miiVtn7Gs3OjHq+T/IHEZXjTiavztCNYcLUznxh64LDT3+0EBWlZ+rgUpJpmD0cAWDwGVMx
	LCa4Yzh3rV0rS3T+ELnSUxv15osj4hjoiUlQPLUu/pWA3WuYzge/cUTaMcIq0=
X-Received: by 2002:a17:90b:5407:b0:38e:64b0:8bce with SMTP id 98e67ed59e1d1-38ec6650435mr6482024a91.20.1784882674612;
        Fri, 24 Jul 2026 01:44:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:33 -0700 (PDT)
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
Subject: [PATCH v7 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri, 24 Jul 2026 16:43:15 +0800
Message-ID: <20260724084328.3943997-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014435_526461_2877C481 
X-CRM114-Status: GOOD (  18.94  )
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


