Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B921CC4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 06:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=; b=RIfweHXwic2B6RkaQN3B7N8o9w
	cvBtWnA3oTmCpgZpi7EvxxODHrQVeMENJyBZsMT7kA/FGp5OoqjJxJPkZF6Ct5ql1VzSY1szYLyAT
	ZOxh3/4PHiRkxs0U66W/zTF0fHREWUoq41Po8Anyb8dnCmB4Q3nCENXQBOcOFrJlU52h/v3DuJ9GG
	t247/NdXabaGVw8yFzD/ZqNp1eBFrno2D7zkft1UOVFl2llbeHUPbxY7RvEDKj9jyrvxVkNqh4f6v
	Z6R2paIaEYtdzAdZyv0gB7RJSe+U+ooiJ28APWRUblcKbUCMlCOMDPFge8y89HNfOTnYiBwyGt07N
	c/OJSLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4O2-00000008ajY-15ur;
	Tue, 21 Jul 2026 06:55:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm4Nm-00000008aRj-37zQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 06:55:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso81984695ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 23:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616914; x=1785221714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=WM0MUYxmg+E4pe7knx4zYyUrLKhKjMeTbrbuVWgIWYrzjwZsAq8wkwZDeYgd0qrMyf
         JdqEkOT3l1oZpjgowHBjmJDGxW1EFXp1iZ4EUdrQI40+TsAURPYXhtDRew9XiRXxM+Cz
         eiPwMvTl0CDxaXVYpCwaGtLLS/K/mKFvR6ahU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616914; x=1785221714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rURTZ+6KnrNnBGX3zC7u+30dtH0N63AaHeGxXuU8P7M=;
        b=ZbNxgzjt78iie9kQ5IXzVtwe8QIdbOMhoWYv4pU1J//e4E/hsm7qD3OqQZZnaSJuBq
         XiZ03X9AwTV88j1/Yom/GTFxmOuiuTRhSQiOdkIqGiCuKt5XxEMxS1uC8tF+G30qSjEw
         xH+7RgFe7zPs8tMJSXf/brQFkrpGnVH8PvfzsLGaojs8oPM1DwEvf/8oSv2Z+9WurTtc
         +7uvCbJHEsSnedJvbmrxStocIBLRG7nqEGYT54JcfphqwJW1fQY2DKXf+rN2ONMSa3zH
         5fwvNp+la470BetVAg9rMpfYQit7AxU2fguPilWL5BHOFE2jbRtpPhZvU6CfctZDA5Xk
         OxIw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0ZEZ0dAr7lJJfQDlSt7PoleqUV7mDvu8xNaDiQfloDM3uUB0PkZTgDsYASK590gp8LrMOvp50ZqENFwU6ge3J@lists.infradead.org
X-Gm-Message-State: AOJu0YwEj03lXDfr2goOVVAASOYeB6zyh3N5PJAeki9Lhka9Jo13+OjM
	leNnPTD3731VGm7sqz/oJmHZ4140u6r+KXSsQiAFKCuF0GTfuexa7ExCz73ImiN0Ig==
X-Gm-Gg: AR+sD12msgL4awCqx4CcXF0U83yRQE1uR4QlsibNDgx5oQqBd2EwUzHWhpSEDtnuwQP
	B4+KnLb2Znmu4rAfy4zcBo/5akFN3Kvm6bcbPK+EWXLiSxGR6NY81KNXutfEUIqHBhBgLH9lGl/
	68Pdgj6oh3r7nje3Qi4TCWwFeoI7bo5+Qv/gLDsfvv+X+v9+kysE/s8Z00yYsK1SL2l6nxM3lIA
	XUo13khHW8hSJwOqfn3QIz/j/ZSyAMKCLUZs71JMdej7RHNypg3/nScETZ0/HNOzD/lOtd2/YFL
	2O+gBJPH7lUSO/4L1YFqY0cJP7jmaQwV/IfTFkPn5lNGIFmHZeU1OG/G4+aC5dQEs5QDw9MP0HZ
	uTSNPyGwQ7YPsF/1OaikLV7TOSjfWBQFbsp5Xhoaw4v4jj/09xu73S1yIUMbshn5uae6f9iKiD8
	K2pP8DyxKdVbWt7rwNYD4xLkGYCjEa8lH0fo/PrXInL3CbSI76MJvC6yznRgDmHng5qGc/yw==
X-Received: by 2002:a17:903:2383:b0:2c9:97a7:f544 with SMTP id d9443c01a7336-2cf34a18cefmr188566915ad.42.1784616913792;
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:13 -0700 (PDT)
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
Subject: [PATCH v6 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Tue, 21 Jul 2026 14:54:03 +0800
Message-ID: <20260721065413.2306137-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_235514_788617_0B495839 
X-CRM114-Status: GOOD (  20.07  )
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

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 7 ++++---
 drivers/usb/core/port.c | 6 +++---
 drivers/usb/core/port.h | 4 +---
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index a6c4e4c0368a..6671b5e45191 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3291,7 +3291,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3733,12 +3733,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5434,7 +5435,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		 * but only if the port isn't owned by someone else.
 		 */
 		if (hub_is_port_power_switchable(hub)
-				&& !usb_port_is_power_on(hub, portstatus)
+				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
 			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
 
diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b2e953f137f8..8d686d43e996 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -23,11 +23,11 @@ static int usb_port_block_power_off;
 static const struct attribute_group *port_dev_group[];
 
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
@@ -114,7 +114,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
diff --git a/drivers/usb/core/port.h b/drivers/usb/core/port.h
index 00f7500af336..2f4349b3ce6b 100644
--- a/drivers/usb/core/port.h
+++ b/drivers/usb/core/port.h
@@ -63,6 +63,4 @@ struct usb_port {
 #define to_usb_port(_dev) \
 	container_of(_dev, struct usb_port, dev)
 
-struct usb_hub;
-
-int usb_port_is_power_on(struct usb_hub *hub, unsigned int portstatus);
+int usb_port_is_power_on(struct usb_port *port, unsigned int portstatus);
-- 
2.55.0.229.g6434b31f56-goog


