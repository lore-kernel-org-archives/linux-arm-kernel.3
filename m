Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA322CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=; b=FG/fLNan6EtPKgFecBLOZh8l6Q
	3k+R1kxdt2qGjok6VgHisQK082VJqvSjqSMUDSKkSKmGZBzE/dVr/3V641zaoEdxPy1FD8+0L5LrR
	RURSKtLrZn4pMTPxSSVJezwb4I8lFJL96rzcR1J0EetBTvAF3FucywSfvlXtK8JkLV/ZkXqVswxZI
	gPxifywQJgfzYG5uik+UL029x9oBd1PZ8pGRiW7Ot2Kt84UV5KRDLmVrPECIWpwfqGWTWip9neLIp
	IJTvwjrUt/J4KczvovrU7wM7R1BtxsYfhtuphzD6okO6oqgE0YN3HuT7Hcm9P74XmN9VIPnMSkGM9
	XApxVJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVM-000000075g8-0MSM;
	Wed, 10 Jun 2026 08:41:44 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVJ-000000075e0-2n24
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0bd02d97eso72502105ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080901; x=1781685701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=NxIqTs8aDBxLa1gFBmkBwAve4udKvOuJJkMShXO6pvqQp7CfD+E8FpYNsUVKTTQ3yr
         SEBviJP8ZxStIaBTg3qMGnlfb/jZrgnq5V7Qzf1ycn8OkQA2agmTYcQJJPXQWbAvcNb3
         OM/1LG9KyjaA9LkVgXKkQxNC79iOdtTW1NIeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080901; x=1781685701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=M7LQFU4wh6CwLuCz6I3h/KZ6HcvuYQsJlBZum9G0pMW2dXwwaaNkCJ7NLvkTGhOxW2
         4GCKJSiNBvlmP+Np1aTNjVrT6n60GLgknueE5uRzuzGYjLnqUFU+8QWwDFW1puoTAwrs
         0uG6XCd/VrrIM49sj5KC64vNapdqa7gdXNl1qL3wbLwnthB90XYjNJTEjesEivZCDVZm
         oqT07IOSGlkW3oGd5xaS/nS8FgyUaRFGjZkgau1AME6BS5BFfLgBZSOay5UhFNJNvpiJ
         N6UX6cTuLQ2pXRCfY76Sg+anCMah462IyCR+7/sbqapJ/tmVHngIpACGpf6e1odHJPuL
         rmcA==
X-Forwarded-Encrypted: i=1; AFNElJ86m14ZC5AAJQFGxRe5wkjz4TxzYyFxylzTvFakZ3xdt9TWyiIEPjMZ+9/PUQ/T8a/kkULMCHbOIYNNY8akfQJR@lists.infradead.org
X-Gm-Message-State: AOJu0YyQJq0Jpfx/w4SxqpiyB44wyW64aLvfNkLP2iqgstXtXIp28Y/q
	/Sx0TSb2KpEJd9Dcn9JsNv4FrMWvRkyuxwHa4FAaGzALNIDgzJvXDGMNvMvgsPWdmw==
X-Gm-Gg: Acq92OEGGGC//McYImUj0wwn/1o0iW8OGl6H4VBGssRGOpDIjYi8f1oa2bjnFItOWUN
	h9s+X4bVWzCGNPLtsYtx+gzqwm9XaI03+rqOOJA59k0IDHmOtDzEt1gBli02WQmgQo3FDSZ5Lv0
	3Tdi76ZavNRQCYt+v4MHCwviYxBd16/lgEnXEg5n04XsOx8GodK7jegW4CAsf+uPAymWcrP8kdO
	8JPnb+7Q/wskqXssHUX3m5J1hpUL13gt/42I62l3yiKOPPfRtKOL2ZnOcmMYgzVJnzEaIXHzqcS
	NKda9baJ4XRMNbbnsw52geoWJn0STumxFIB8oBX2kkGGEYblguBPqAJg+rLLEeH9yS8G5YOcnsC
	XO3MXH/B7c1J10WyqCLi1kfV+cuz7NHJtb8NIOSXx3rZ3YhKiNLEVIkTbIsYEcabdepiakyswFG
	+yhgekp5es6FP0lyyJ5tjZnt7CmGGRm0nDZA4Akan3UzK588gbVhOKTp4LynuFAHRKiSZ4ifggC
	PRz9Z4MWYNWMeV2NQ==
X-Received: by 2002:a17:903:46cf:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c1e80cd78emr274569985ad.4.1781080901116;
        Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:40 -0700 (PDT)
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
Subject: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 10 Jun 2026 16:40:39 +0800
Message-ID: <20260610084053.2059858-6-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014141_711820_0010D9D1 
X-CRM114-Status: GOOD (  13.01  )
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1846eb1206a4 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	device_set_node(&port_dev->dev,
+			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.54.0.1099.g489fc7bff1-goog


