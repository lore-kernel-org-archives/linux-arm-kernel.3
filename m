Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0687C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=; b=Z74aAJGDm6mhYwfVFIR90Ah0nn
	1Lp0JXWy6EINvBesWNLjbqhyIKkIZk7LsmH3DuA1E7jgleHRg6U9cBuXMlumDw5E9kG2LJNVXnb1k
	TEGSRkJnp5REyHstVPuyptQUPI/8hFLvGGqMp30IpKOBhI3wbdQyKkPDoJyRv6k6cSX995IKcI5tL
	c5GsC7s82OW8inYc4KcnifcjTRH99OhC96tpRZYkXm9WX9j3UR/AFhPsaHGgriWaYIqmm0R59Frg/
	J87+e5SIM5mT7wu50N78+VfP8erBxDfSzG8dK/vit4ssuSOHpQcnNBTcHqzVJBgJXs+gM+qDKC5eO
	LUqZ/KUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOE-0000000EDkw-3cds;
	Wed, 15 Jul 2026 08:54:50 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOA-0000000EDgH-1oJ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 08:54:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-848595b338cso6085083b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 01:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105686; x=1784710486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=mSVvsjUPRN2KEFaKqSl8GeiMp3Pi5I+T1seuTRvSKL5VrUSqWArC+lKX1zfYetBOzH
         1YUAWQuPFscJXt6HhGyZ+Q9YCZjAgOt0IcQrZxWZzHmpKHIKN4wBQW31fnUuZN3RUdjF
         RdsM5DUFKkqH94pOXftvVkWEMPxDmGvffTiZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105686; x=1784710486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3MWujHDcAo6N5pm988slASDpmZJoFPb9rC5ReM64M0=;
        b=aUPUe5n0cscaLPGegSqui5aoenzoWSwkalf/Lss/Cp/pAnrwTqVR3Py/H8BNTZaFC6
         Z7BlOaMElfAdvulbRvaMFFxhhOWUc5l/YDVsubYGlsCa/WU9Pr87Oj4Uf4MhbONgggBv
         JPwoSBg2+y/dfLNr/A0KoyFhbSMzPlivOEu65QT7HU4gOPL/NPlfrrdcPbUiiO5Z3G9q
         IXynDSer9qyBba/eTORQQ1z4GKQ8vCjku2HPmde6q4A+mlK8zkpbiYryteNn56DexGFy
         uazt3uy5YIafqE6dk4QUx4wIN7FHLMPWyQwLHaRzSl1qru0wni6goNlZuY0r7O7HsRmk
         zNxA==
X-Forwarded-Encrypted: i=1; AHgh+RqGJYZiYKNQV7+mxEa0ARit6maQ7vMSdNrRUS3rlUywqbSzqUDYne5S1Fp0f7nhPAt5U7gnQB27BQQx4i4rGQTI@lists.infradead.org
X-Gm-Message-State: AOJu0YzRFaVUeu2k4KYxsGpsW6Zr4JDQDYCqVySBDP6kAU0ursKhsXU/
	qceKI+4eBwysv3KzxO84JyqEoFHkwpJmVSW71ojDBZaN84z1b4O2Rn5MN9ZWVdWSlg==
X-Gm-Gg: AfdE7cnBgLDLImlQCuasdtgeQLlcyqKAitFGTPnvCWPlvY12usuYy6U2BihJg1L5JYB
	umml0Mp2PD+teehnpNFgy8IR95mja3BNNki0oOqREVvo3eQGhBH0ypcInpVNhudxKYWIbPdsxrP
	aCz+NbAXVDEgDwi6UHN+M4wnanPqbevNfauF0uaj5MAKnsqLiSkB6bQS4sFwk9ixdrkxuxL6+cK
	HZdoJ3T1/PodOwx/6sSuTyFrvIiEzZ/jUy4EurI+mjQqR+oU4nFpCORFyTHfiRPWQT9slzSBrrS
	5Lb7hbFUP7eXaXAGV/4ORUMcBbADvhSkbfXUEnBcdW/PIpuHeRrz25xn8zQYL+aILlQ2UYg9BC9
	LxLjlixH2Ge8OfMbGNC1HY4biGJw1ihTMdMs0XsWt1ccZ/2JdJFH8E+wFB8pDyy30FsLLDanRvV
	sb/iRqB9wq6h8K8G2mu2qRR/yOmgBEC3rlise0R8A3zm+4M1QP14NoHmFgVAxi8+B0Zn6J8Q==
X-Received: by 2002:a05:6a00:94d8:b0:847:7f3c:b5f5 with SMTP id d2e1a72fcca58-84a554fa4e8mr5539619b3a.11.1784105685669;
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:45 -0700 (PDT)
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
Subject: [PATCH v5 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 15 Jul 2026 16:53:36 +0800
Message-ID: <20260715085348.3457359-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015446_497864_32AF2D2B 
X-CRM114-Status: GOOD (  17.06  )
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
 drivers/usb/core/port.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..4fd0a4745741 100644
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
@@ -780,6 +786,14 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1,
+							    FWNODE_GRAPH_DEVICE_DISABLED));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.795.g602f6c329a-goog


