Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0962C43602
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=; b=QdXQEaFRg57CVlEMhbq4P5y6ue
	sgIFysLjn3D9JGtigDgwutRkV0UZsK79qQh49c4sN4NKY4LhBHg5I9EBBwE4u00dNkXVhT0Ayugei
	deNBAWPM5g5vyt/Rglqz341I96T1j7CZHnjcuIVc0IJ9S3PbvlqCcsu3LJ8hTM9SLxRFnRgwJHpet
	HYg9gO3HCuy6owBGENXVFaIHBtERrrWRaUSIriK1XsQO526Ux3lcesm6B+Lqu4FRHiOY1SBgOesyl
	aJ3a4j9s5wfMEweOAl53tezY/NDE+JryomWH8GBSSIM9xjUPXPHzmexUOvm6CDmM3ZMOqfAnfZZuw
	0sAYzz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgh-00000006lHj-2Kdq;
	Fri, 03 Jul 2026 11:04:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbgd-00000006lDJ-3yqY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 11:04:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2cac59f8b64so4386425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076639; x=1783681439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=kBipA2lEiZXvszz5momEirlRn35fnGj5U0qI/iYRNVBq7gFLZTf7CvGdKvPno3qbbK
         urVyuvfINXae7m6AaSOhhzmFr9cQLM9V/xrbkfXXumiHuNTCvBPLW3PL/9Yr/Iq90AH5
         OVZ/LKGjVNW7eTyoRr7J/Bg5VPqWas0+JzKXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076639; x=1783681439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=eXEcNErvWH/TRh/WRqqbgcgyZFqQTOHgzV5m4V9zM4K+ltBZZBXMzoroaV3ODPQsW2
         RadjAijeNCyioJ1X6EH8nxjCkaWVQS/aRyawJVjPd+OydK2C4Rq/Vzl0u1QV4Uxwsyil
         DSMLjJ5D/a+Rqqv5iF1qaacsXQwzdjLuz0I9e8hIr6EDS8eZs02/hzIKe/jkZjiCDoDY
         cIq+oc3eq2PSRY+NY8sSDtC1OHFM7BCqjYGuKfU9wswIEpRfOUJGqsr4FazXAT5aVmaf
         dBDPFmGOrmi68q4A62wV6DUBLiMBpd7DfygAHEcrdzNBM8DrEHSujC4KGT9yeIP7j90P
         AHww==
X-Forwarded-Encrypted: i=1; AHgh+RrkNEeSCmlAyNyz6ZoFjfOp0R00sMMECkVHvZh9JRR8rmiLksCxVV5FVE/qa0QB/XCJyuprtoAIhu/U5PybvCp1@lists.infradead.org
X-Gm-Message-State: AOJu0YzC5Hr4yedrmMAHyk6yOtf7CAov58zly7O7bFQ4L7QEADcQ772n
	1pOHx8RoRl7NH/Oij3K4Glqq/HsRcR1E43/h1f3joAEAsDXHkX5Mb6XvsHZUOpijqQ==
X-Gm-Gg: AfdE7clLtwERVoc/fFILGzNhTdGx4YWV58HtX0NcMer14S/Lt5z4+ezWfk9tyVxpeEn
	pc45nbGIYYHtxES2BjePryK2kPsuCtIg+Wy7ZWXkhjftkkD8f+kIMquk/huuRzJUr0+CDFsJBPB
	hhryHlYoCzOIDurVHUGu/YNavBGzoZwj1PK2pdva6RYWBnJ4VWlNArUUZvb5W6VFmuwkOzfo+0f
	GO8MD0JJvBFd7Nwb+WdEbnV7cXweB6hqsGr2aQ1JgOkv8fRCkE4Rcl63/S121iTywmaTcDANso7
	+aFPWoaKgFxCBgBNjSBjzHnPV0h1h99Y4QxqnL2fOf7hjK37eZ6vNsV9oYnIKlffFKrGhKkzZpr
	q++3GvpNLDhRfb4n4AUWVslatXiAvaLYbOYzBI392HXwzbbIIB/6VlPe0piUNOCWdLWFAkaXsqV
	PTprYtepb9E+Wc+RIlGveCvTsOdGInX1qAKBY/3SEYrWQUU/p5g/JUq1D31qYk4FbEsEbZYg==
X-Received: by 2002:a17:902:e5c4:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2cad874c884mr19763035ad.26.1783076639217;
        Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:58 -0700 (PDT)
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
Subject: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  3 Jul 2026 19:03:06 +0800
Message-ID: <20260703110317.1283411-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_040400_003011_40B0F2D2 
X-CRM114-Status: GOOD (  15.14  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Skip assignment if hub firmware node is ACPI node

 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1088776ef750 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.rc0.799.gd6f94ed593-goog


