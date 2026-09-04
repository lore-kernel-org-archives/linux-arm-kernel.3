Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5ECC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=; b=dMf5cWIqb+tyMGk5dVYELGC+VQ
	2JEsKIGBN2+6ZUA7ZPJpz0VIZE+6+NgbKsNY9qOBsvOkaxmsexH4dnZTxTOg/e7Mh23ca3Y6JQ2+Y
	+Qhm1GAGfnkMEk9wcyLXAf8TwUwWkt0em6GWyzRSohyxE9yLFfmT11yPv1CeRlWcH4/gGtrYX2NSA
	oj0G6rfV/qP9VyXspyeHfPvn5J2vFT/uBZ+PayUilKqyCQ3Y8qpeA3nDieufYCJBIf7myTlDZ7xVr
	VO1F+82nvzOy2LfDv/bcYyE9bbbKlHvFDBFBE/H2K5MCrA4Z20uQJU9Fm8ZgGMeDgraADIyqTOpM7
	OkENc37w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWn-00000001QE6-3TUj;
	Fri, 04 Sep 2026 08:44:05 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PWl-00000001QAX-0Lai
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:44:04 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc1c7364550so991890a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511442; x=1789116242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=a0KvA08CVP3MyiIN7NFByhrpKLCCRw3lUB3eUsUHBqdJgJHl6/6RWoSGbwLKLSPx5R
         UG4VImPWPoOBicBETumSb8wpldAEhoK7ADVBNv0Mvx+0QuDCqry7HVKO5OYMrL9IQd0J
         HHlI3xz3jbwUUaynnu+TU1LMye/H0mbitmABw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511442; x=1789116242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W3sj2cYUAVCTd2rqI36VhEFdVQ+OlkMrPyaumoKtPAY=;
        b=rSIkUSZ5GkuKruXLurPC99YobqJ15Mo+y8jUV3FsiM/1R2mhKxaBsWCRXLlqyL4Fq1
         hk5xW0k1FZEfNlEW4Qyy+LFCIwjyLt4Ay2GDKWTcnBz2oYT8SmtYNU9NQizh0X09r8wZ
         nkgrCbG8VFMDh3DEzG0CzLiPTvuuWOM5EkTU+Qf/ynS9xk3JdS7lDcoaxpg9QHkb3GfQ
         T9tKUFa0Vz6h2j8FHHSs5I59liTsiguNBOrqX594HY3GkhzKpowT+gD2NGOUspybp2O/
         dGXVnA6YNQdPj62HXxo/p29o1EPbFfzCilNAeqAEggNOv91gbsg6RqH/A2xfGR8/n0Mo
         iwsQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9sfqHzW5FOXC3dicqvjUAA9pYcuPOk/JSDezunBKBZcn6TAXvykQ6QKH1vPKagyVRFyeGl4+m8xZyfO5YgorV@lists.infradead.org
X-Gm-Message-State: AFuF++nTEBRE78hkQ9s6O/dyxgRSyBA8C2GK9EG++xsVySq3IE2NRHFi
	/WsgTodWM37vVgAyd5cIjnB4VS1ynslOdaQ4xwZTxsOSLqMA63Jsi5AnyqJP7sbM+w==
X-Gm-Gg: AYBFou1Mf+Sj+2u1FKp/aVHSwdXbkcng4PKRdnAFZRQMRHf4TL7aT0Nxv7CyLWr0qGe
	Pw+tDUqBs875tj4+HeywLeOeXbuUHc1taMfx+Z8eJt8QcLGErL3sIbZZuUFxMBRJ5RnkP8Jjaqk
	oC3iLlbE6OGFYcQPdpm96eMjID7aQQX1jMkzbLHlQy/84DkikgfT6nQhgBBTfXnW5jp7h3MukG4
	Cfu2cyN55dE52W6g67XVmyH6ASSkDIZ/gBA23p9MVaW5OEx9B78Y0doTv8fIjbOs9HGgl5pTkG2
	VToV2a6G0VCpuy5ejNkCloxXuuvpMTh/ioADeyvMPpAPBpeBOI9ME1fA+CW6fvwlvUL/aGye7Az
	ljqwRBSa7sS2SQdXjkKvHX2kap4eVBh3AJ2XtvrFG/t9rLrpkma/2k84VHEulLkEV4GqRJWxcjm
	8sPcX3WVKwN39KnsY1gb3wsZjFafUweQpx2fiUlxeM5RAox6EmQBFdduaTaEn3wWu6v5hwgnzZZ
	ohan+J2mxHaiOankqyTpGpH45/BKqjipi7SfKTCldIP
X-Received: by 2002:a17:90b:4c51:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39b26204e5bmr5803481a91.13.1788511442063;
        Fri, 04 Sep 2026 01:44:02 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:01 -0700 (PDT)
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
Subject: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Fri,  4 Sep 2026 16:41:47 +0800
Message-ID: <20260904084158.1341550-9-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014403_131508_829D9432 
X-CRM114-Status: GOOD (  19.80  )
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
index 7f58d753d77a..1b891088a653 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3294,7 +3294,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3736,12 +3736,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5437,7 +5438,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
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
2.55.0.979.g7e5102b832-goog


