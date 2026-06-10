Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CFACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dxbS167RBZec05UVkxkxFcWU26xTYm3kEJbXHA80P7M=; b=fR5ORBPQGQlWoP4mMXSEG+QzNO
	21tS9iZjDYtPkYBpp15/OeQ9upcM5e67TMPlx6vacu3DtJFcIo6gdCLcT0tPvEm1UiwmXZxawMH2r
	dBv53nGyswBkf2b1DG6IRpGFcQGkjOkYUdM4qcP/h1QPmMkTXsHs4Wf97tP8KYrqb/3ePZRfglR0Y
	Z4nC1VIqtVjJjct0SEEpgAeI1Miv551K5qgDVJCHblu4wXLUCsQ0n/7O/c6qO2ilngliEaIeMXp4/
	RkPzAwSGEVqqfnlxrJKzMTak/Hg56+ZpOkVNX0+ucCvQ86sTXwofQ2eodq+avio7L9G5s5JheOVxz
	IXbvK5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVR-000000075mJ-2Q2b;
	Wed, 10 Jun 2026 08:41:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVO-000000075i6-1wmy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2bf30d530bdso65049355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080906; x=1781685706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxbS167RBZec05UVkxkxFcWU26xTYm3kEJbXHA80P7M=;
        b=jtJaZOD0lFBv+GCNUn+d6wbahqPD+MzmHBp10YBXN3MlyY1FddrpG5VrDwWe/GoqJw
         PVv+XLkwKSmgN2bAHzOqgZ7wNGjtkzOgCG9F82UZTVEspfxYMV5vmF9KC2FGxpCUmAv2
         pzrAAZJaqPruTYHTqZcCib5A0LTTU9L6lT+KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080906; x=1781685706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxbS167RBZec05UVkxkxFcWU26xTYm3kEJbXHA80P7M=;
        b=UGis3W0vpiFQc1DiTDe7sBFW164zktwO5IWeluolUf8drzzteb1lLty/L9lCqy7dvW
         nr7hagTsd1rK8gS6VsubieaN3Ct0pbROTD9/HMXu3CTQEfZHI98y6CbYvopHPU3BZA9u
         ues5Z20mstL6qFocMg0Hs8TVYt/5Qj/mOezusTfPNEB02M25KSPKD1K6B/d/WuOFuYIR
         ++wDrhrLkVrP2TLupY7jr32O5/k5SrE5CZnFSvo/Zcs4YGHLTssfYWvBNGYEF3BeZjDr
         PsyipQo3jH2fIoWMfmXfpB10wol8vaHVw2jzEIPUH4pT6bIqhnutbe2mgmjZJzPiZzDH
         HAiw==
X-Forwarded-Encrypted: i=1; AFNElJ+DIESQICV75VTH/nmsypl1vIS6FwMeRS+1s7Iws4qiW1FTrXhEe/486e8/ADP5FVOEirVXaMgRVCBaqCl64MvP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd59j1VewPwRNaatxwWfKXX3sFTqoqcw5TgJnTD0G5LTGbIRCc
	RoBDOAcfFXdgKb+RxRlM9iQAQ06LvMVOwvArei9zhmtH5xOsKyLCi8XIJhGLFRnqpg==
X-Gm-Gg: Acq92OGq+LchGEAjw19unz3LpFdFgvOgBwWiETryOeUg4I8a3Bc9oxNQfjhzTZevWEt
	kkJQJ9OQGw9lbqJ9TprqG169Lzx6MxZYEfUOaqjwuhsxCPUFfXE/X9GoIATOHZgLZX5+32pFoNv
	vsFDzKnsV/ZqbKyJSTpNsCtX7rUwHDu1hYgCkrQhJCTzBW/4qTfFbSGbY2dUgKoqaBhXIZulz6f
	j7lkwfVKnnWzhEm3rPujHC9gCpFyVbSUp70mHcRjoM9YiKXlNbdMf6+aUtNkcKESkglImy/UsT2
	ZRXt0OdSiLtkAmJvmwSwXptQPs4oFRim4YRRRhM/MXxvG6YD5WMcKyLFhjhAKH8MYyFBaOqnlU0
	H8NYwB/VxyP1SNP8GiUnjqZlXsmHxLwh2SMKe7jB7RPAYsPCgF69ny86vYdzYXnmzsSV5R/QqgB
	woO1oTs9ms0oFc0l55KGCf+vIQCSMktiKYWYnJe2Ix6Fb9jTfvoW/tILSbfMjPcYMq7mt04Uxij
	Mt43hfImVxRzEb+SQ==
X-Received: by 2002:a17:903:f8b:b0:2c1:4d9:c8db with SMTP id d9443c01a7336-2c1e836dfe1mr288494565ad.37.1781080905536;
        Wed, 10 Jun 2026 01:41:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:45 -0700 (PDT)
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
Subject: [PATCH v2 06/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Wed, 10 Jun 2026 16:40:40 +0800
Message-ID: <20260610084053.2059858-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014146_512352_EB27007B 
X-CRM114-Status: GOOD (  19.52  )
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

usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
it to tell if the hub/port is SuperSpeed or not.

In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
state tracking field in |struct usb_port|. Either structure can be used
to identify whether a port/hub is SuperSpeed or not, as the field in
|struct usb_port| is inherited from the hub:

    port->is_superspeed = hub_is_superspeed(hub)

Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
|struct usb_port*| so a subsequent change can use it.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/hub.c  | 11 ++++++-----
 drivers/usb/core/hub.h  |  2 +-
 drivers/usb/core/port.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 985551d013b2..362a10f7eddb 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3240,11 +3240,11 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
 }
 
 /* Check if a port is power on */
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus)
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus)
 {
 	int ret = 0;
 
-	if (hub_is_superspeed(hub->hdev)) {
+	if (port->is_superspeed) {
 		if (portstatus & USB_SS_PORT_STAT_POWER)
 			ret = 1;
 	} else {
@@ -3306,7 +3306,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3748,12 +3748,13 @@ static int wait_for_connected(struct usb_device *udev,
 		struct usb_hub *hub, int port1,
 		u16 *portchange, u16 *portstatus)
 {
+	struct usb_port *port_dev = hub->ports[port1 - 1];
 	int status = 0, delay_ms = 0;
 
 	while (delay_ms < 2000) {
 		if (status || *portstatus & USB_PORT_STAT_CONNECTION)
 			break;
-		if (!usb_port_is_power_on(hub, *portstatus)) {
+		if (!usb_port_is_power_on(port_dev, *portstatus)) {
 			status = -ENODEV;
 			break;
 		}
@@ -5449,7 +5450,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 9ebc5ef54a32..b65d9192379d 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -138,7 +138,7 @@ extern int usb_clear_port_feature(struct usb_device *hdev,
 		int port1, int feature);
 extern int usb_hub_port_status(struct usb_hub *hub, int port1,
 		u16 *status, u16 *change);
-extern int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+extern int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
 
 static inline bool hub_is_port_power_switchable(struct usb_hub *hub)
 {
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index 1846eb1206a4..d9d3e2bb8f25 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -97,7 +97,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.54.0.1099.g489fc7bff1-goog


