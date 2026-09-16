Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B5FC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=; b=iFiMmCvJDhJ2EUfSJGisxzbtW0
	1gulup2IpO2oLRfPuCjI/CzDQ/SXjORThLL0yCCyYti0jBAYCE8U+P6k+VGmAd43CMv0bJ8I4lrz5
	uk+2IlvC0SuFH0vQQvMw/046Q0CEjCkSjfk19uMFXVaITzb5UfggKP5qw22hes4Pv1Kbqe6ubN1ZS
	U0WuuxwZTRCtQjU0OTXhkgDzWBO3AXfABQg8OQzdn02LbTaKvA6qUPO2hlebvUnq7aHLQ/Ob1/l/w
	rQzjBTACTSICt75mND+cDTfl3GHmQ3+v2qcXcW2lVe5sUmatFsaCohR1Cp1u55GFSGAq0iH07zs/b
	F7FQApjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kYB-00000008eD8-3gxf;
	Wed, 16 Sep 2026 07:59:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kXo-00000008dze-169C
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Sep 2026 07:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=; b=dUcv0oVWy2JLC1YcC1cbc2qo3i
	6p+h69+OKkHuL/dl5AyKh0DIwz1jOnwped6eTLr2T7f1EMPTTxQG1sjNj37rqQrjUTLybVbjbSN9J
	Ljp14RsI4qyg3mB7XI3DWV0I3BRYxawt/qwJbR4rM0Sn0pZmd/Xcjo3vc6p7yZwh3djfHlzJpkxAG
	8uM357yla/7sSicIAB8T6+4p5dKV0iOh8/vqZxb6Cjw9HQa+5gjc223fegp1EBFyV1lTI40OEBCq8
	EVLqUvnZTkLtBkhgQ5rqwq2UZz/rWzD1GYfzotEDpNck0ArX5AbgLA7FtRc4HmwTbGBYH7zRz55Q1
	dw8WAgUg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6kXl-00000007bZ6-0xSm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:59:03 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccafb751so519926a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545539; x=1790150339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=;
        b=GEqFCMmBxNWP2ZXQU6uDmnGG2YM6tuBnBdz0Q7ZTQccCMNdpnQVi5OYwdGVbAUMWlF
         enuCmjnnmgvAqVWLmpgYnhtgh8fBbSJZEdZx+gVIkaDnnvITBb2cmfien2H5xqtu6eV9
         4puCqBEkGTeLGs36UUTx1HBEBLF7vzSpSXGNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545539; x=1790150339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mxcOLcYtzXeNvmAXwxnBSPIznA4IuiBXVh28WxVeHIw=;
        b=UaPfRYCw15AZqJPmYMB8jgF3JGExl6bS6zodNFHIcu/F3c9CL9hg150m45GbzBgcWc
         3drt1BWLdLET9ROG2oEM0xsyCCtzPMyPaFIBPHml8YFI5ULZlBZbUt3vK2Fh6ofoeTS2
         7kIN8dHdpkZlpD0NCiueo1Po/HoQh0/6GHbzEgipJ52b8hj4a8q9AEtFMoAiv0o9FraE
         EKS3IPhsphVpkXpSr1Ogyz8cabS5TKPPQWWzGEFmgp9BsbCWxlfwukfo1Mi2yOsrAnZF
         3Lx4U/5ns1GsuAPrEAyqW15TOf2mtpVX7MjKvmI80+JzJEXe2oVjCF7EplMsBpuUJfbS
         jNdw==
X-Forwarded-Encrypted: i=1; AKwUvBwRraZ/S0LRqi+SB2fDPhL73UQOzuc0i6qPVV30QLOr0n53dOgvIf3YDPPmhy5eA/W5IkEZGAb1MS+yQ6hgx72h@lists.infradead.org
X-Gm-Message-State: AFuF++mmKZ8dtQiIeSVp9dOl9YdTHVmSFaqRhTPfFRJNjUHAuFk1s7BD
	I7jx5ooebMoHR6cke2MyjfaLHRtGqE2FzTdPowLxvaZYTrIOlWDH3cyA9dqu5Q2r8A==
X-Gm-Gg: AYBFou0Z4sp+mM6kbiKk8qXKG/FLKxqD7/i8ymR/ySu4KnqrSVbYCtchSF+nTlNq7lo
	HruFjG/nZtQ9dZ25Cz2FpBUgCNgGmu0GmUN/vDorgEcj1MJpDYnzDJjEH525LGieGXk9I6qdulZ
	kFzryKE5RQCBuf79chcrBH6Yhn0rI3Fg7n26MoAghlJX1c0xNeGQrg673hfTC9QJGlkmzVCTVtd
	i266DgabjwtAiVoIi5mz/d/faY7do6FQVlgotxgPMXgm+3tdh4A5szhihnHYgTnX9WZtooJ3ph8
	NjsmjKcWoVyyTEPluwOYFZBhNfMcxi1U/Hd3PPwglskJ12IhwctAI6+Mcc5tEiVfRSYfbrlUch1
	4gSTaXgbCd2YVEsP4I3nHazg3nm4tX4sshN3n6pnTMjVFe1n3dPM8FlZ5KPtiYn/QJCcWaqAWs7
	s/BFUdU5qJgCD/vJfeYvlLqsrkyXMezUjjSfP53lnb5b5X+sAaxrbZ5u9JxIES/XOGNY6k9VqC0
	Nb+VfZLekoXe4DUaG9pv0qdbKm99MRFrFPIVjiIcAlDy5pwhotIctdz8w==
X-Received: by 2002:a17:90b:586f:b0:39e:28dc:3682 with SMTP id 98e67ed59e1d1-39e28dc380fmr622870a91.21.1789545539469;
        Wed, 16 Sep 2026 00:58:59 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:58 -0700 (PDT)
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
Subject: [PATCH v9 07/15] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
Date: Wed, 16 Sep 2026 15:57:33 +0800
Message-ID: <20260916075745.3549953-8-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_085901_644708_F335DA9E 
X-CRM114-Status: GOOD (  18.98  )
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
Changes since v8:
- Adapted to |struct usb_port| and  usb_port_is_power_on() moving back to
  hub.[ch]
Changes since v3:
- Adapted to move of usb_port_is_power_on() to port.c and port.h
---
 drivers/usb/core/hub.c  | 11 ++++++-----
 drivers/usb/core/hub.h  |  2 +-
 drivers/usb/core/port.c |  2 +-
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 707eeee198b0..1a98ccfe2664 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -3249,11 +3249,11 @@ static bool hub_port_stop_enumerate(struct usb_hub *hub, int port1, int retries)
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
@@ -3315,7 +3315,7 @@ static int check_port_resume_type(struct usb_device *udev,
 	}
 	/* Is the device still present? */
 	else if (status || port_is_suspended(hub, portstatus) ||
-			!usb_port_is_power_on(hub, portstatus)) {
+			!usb_port_is_power_on(port_dev, portstatus)) {
 		if (status >= 0)
 			status = -ENODEV;
 	} else if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
@@ -3757,12 +3757,13 @@ static int wait_for_connected(struct usb_device *udev,
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
@@ -5458,7 +5459,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
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
index c0a51d9b06a6..67ae2bfd3e93 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -98,7 +98,7 @@ static ssize_t disable_show(struct device *dev,
 	}
 
 	usb_hub_port_status(hub, port1, &portstatus, &unused);
-	disabled = !usb_port_is_power_on(hub, portstatus);
+	disabled = !usb_port_is_power_on(port_dev, portstatus);
 
  out_hdev_lock:
 	usb_unlock_device(hdev);
-- 
2.55.0.1032.g73a4cd73de-goog


