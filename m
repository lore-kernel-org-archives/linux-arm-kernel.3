Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345F0C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8RUZZ0a/rFvTsN1FZHwK89Bz0TUluu/ex7Jb2jpMwI=; b=qpNEIN6O/QI7KYrSe/twsGauq4
	PN+FFsYOKTwX7GwJ5tvGhVb84VB1P1fsA3JG993WO1ttyJbFKqjbQdy0DDngy3DtbjiJSaCxorYOy
	vjA6Vl3/1Xqj3BAFa924DuC9D6cQm6A/p9EL4cf11M/oqHiovtBiLbBL9kMrglDBJbIdNXee4nwWg
	Ba+imv6G723w8qKjmdm96EJn82piDhTf2e35bCMzHR23aoDAz5Ss20uD0NVlVpWfd1hpqg3E8zDAP
	1yEJ9rXSoXoqin0yhifE4N7F6Fw/uLVsthG1GGiFVnYUXmfVJkI6BP/0xc+pRJo/8TVG4KLzMMm9b
	7MNH606A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8r1-0000000EeIH-3vD0;
	Sat, 01 Aug 2026 12:30:15 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8qx-0000000EeHS-38Z8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:30:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1495719a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587411; x=1786192211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f8RUZZ0a/rFvTsN1FZHwK89Bz0TUluu/ex7Jb2jpMwI=;
        b=NNVaN6vZQKTlulLHheZZoB6/svgazwU86nB2ulwfvxoHiCaLtsfgpUT5gbpFyL3t7A
         bvlyrShPgPkQbpRYaNSfBMyaB9t75u1ecOV2EevN6JSQPeR6pRGnBeCR3TWP/fK/Mu/p
         K7+RUPPKzBDAzkl7+n6WJpqPqn6Yf7EJrZSNDLcGaNgWxIWJIExatXgh/VyJIiDaZg/4
         bUhqegIrgI4oM85p7TR8bIiJCHFL0U9WpnPdTz3xO7gaxFtGEOfXyBgt3P/UesC3ToyM
         AmAP7c/whZFuhvaR6h4TKhv6SSiUYSoetyTtPIwhr6wvluW5j3Ts9cIt7RsPhe5gl9my
         G2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587411; x=1786192211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f8RUZZ0a/rFvTsN1FZHwK89Bz0TUluu/ex7Jb2jpMwI=;
        b=MwGFWAz2AOgFfcFYzHQrRPTPq68cbWkM2aYo60eQtq8ZnzJcf6u9XTiTjG4VJaAC+0
         z2aINUzI4Jss20/s3WSE/KVjn7sLCRNEwPGxtBfYstOW8w+iWQHOi1cbvg2TVqRypDHr
         MOkaoFa/321snUd3yglYPXtheadqm8GFPO9I1v3wtvay6+qpWVb1uIuBU7BcVS4E7qs4
         8n6CyrTTNQt4QqfRX0Y5lhYMoHUhI1ekazreRRZpNWy1NsuJW4qeWFGRWxmZdXN7XBCs
         c+oCcpnU6sSq17yeFUEEKJFFMOcuVvI9UpaK6ba8pDLzydrYiADhxtJO+TyVTQQHWppC
         ep0w==
X-Forwarded-Encrypted: i=1; AHgh+RrE9tMNQMwWCtCINiOKMDygOaR2nHMiZNl/ijPz+B+F9bHGBD5zCiZnA/f2ts5O3lRcehfe7pptsjiNnyxS6jFT@lists.infradead.org
X-Gm-Message-State: AOJu0YzBSkyvWkzUG4rwDffzq76DwWyLXcGrrGy1vJatH7u49yBxPNU7
	hqNdcJaRgxwyKQZ6AD8TeUd8szkNmhNbpz0QcVOpH1qTtJhBC06zwxs/
X-Gm-Gg: AR+sD10sfSaC0Mqbl9UtQwMqgK3PRPsfJBcDSAxxjtTWVATJrv7ooDukzgt+iS36BUk
	bjXyTloyg4NBe6MG38tRHu0dPiqBokOPd24uot86chSCzFiaWi2+rVbkETGMaIWO2SsraaliacZ
	OLQIb6LpG3A9Wh3YeS+zjSbm0v0mhrbbKMZGygUxElNtnZp1nV9KuV/VYJomAtK4iiQzqLQRTpR
	uWpCWdOe5S+v/5Ausk0AO9MzYhxI41rwJVMwoYsVHa4alhld8r/UCKUY/q/Kvh7sNrMUioCLrMi
	JNva+9XV52xNDIZQgXIx5FKPEMonrmlW0WeqrUkZ/4UaUHbVVUAtgJV3w7CS7HJ9bctpbdsvu5U
	iO0CdhRHWbYlUqwhjP/d2XUuIWY9gC3FhgWf9uQvDOMXHT6Kt4bilRGfDCpajQ2/FfgChgrASE/
	c/pPinwEBCZi9pp3NxlMwhH9Zi6MHr1RI0A2WUYRiE1Emze/XA9IEL1JvOIJ1bjOnuszlcGTM89
	Q==
X-Received: by 2002:a17:90b:17ca:b0:38e:59c2:cbc5 with SMTP id 98e67ed59e1d1-38fbc472132mr3131442a91.18.1785587410830;
        Sat, 01 Aug 2026 05:30:10 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:10 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:51 +0530
Subject: [PATCH v2 2/3] usb: misc: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-2-1698e298c1e3@gmail.com>
References: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
In-Reply-To: <20260801-usb-ptr_err_patchset-v2-0-1698e298c1e3@gmail.com>
To: Peter Chen <peter.chen@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Duncan Sands <duncan.sands@free.fr>, 
 Chas Williams <3chas3@gmail.com>, Minas Harutyunyan <hminas@synopsys.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Badhri Jagan Sridharan <badhri@google.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, 
 Subasri S <subasris1210@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=3558;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=44OfuOpRWkEpwE39qqs/5tw6fhh8iyUcWoHJyKnfJX8=;
 b=TT73Eu2ymiE2sUt+275pzPgJnLbNlahPwI6ZFyNJ56z2bu3NfyqORVptbO5eyf0pSQGK3vZZN
 w27WafvA0koAljB6/mzo4JrJfu5+4nc2cFmixcor+YIUhAsL+un9F+x
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_053011_805360_C0A11E09 
X-CRM114-Status: GOOD (  13.75  )
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

Use the %pe format specifier instead of %ld with PTR_ERR() for printing
error pointers in various drivers across usb subsystem.
This prints symbolic error names (e.g.-ENOMEM) instead of
errno numbers (e.g. -12), making error logs more readable.

Fix coccinelle reported warnings:
WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/atm/usbatm.c               | 4 ++--
 drivers/usb/core/hub.c                 | 3 +--
 drivers/usb/dwc2/pci.c                 | 3 +--
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 drivers/usb/misc/usb3503.c             | 3 +--
 5 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
index 9600e1ec0993..c78caa1b57c9 100644
--- a/drivers/usb/atm/usbatm.c
+++ b/drivers/usb/atm/usbatm.c
@@ -979,8 +979,8 @@ static int usbatm_heavy_init(struct usbatm_data *instance)
 	t = kthread_create(usbatm_do_heavy_init, instance, "%s",
 			instance->driver->driver_name);
 	if (IS_ERR(t)) {
-		usb_err(instance, "%s: failed to create kernel_thread (%ld)!\n",
-				__func__, PTR_ERR(t));
+		usb_err(instance, "%s: failed to create kernel_thread (%pe)!\n",
+				__func__, t);
 		return PTR_ERR(t);
 	}
 
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 5262e11c12cd..8c750a93c350 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5671,8 +5671,7 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 			descr = usb_get_device_descriptor(udev);
 			if (IS_ERR(descr)) {
 				dev_dbg(&udev->dev,
-						"can't read device descriptor %ld\n",
-						PTR_ERR(descr));
+						"can't read device descriptor %pe\n", descr);
 			} else {
 				if (descriptors_changed(udev, descr,
 						udev->bos)) {
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index f3a1e4232a31..7ff9c4df941e 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -68,8 +68,7 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 
 	phy = usb_phy_generic_register();
 	if (IS_ERR(phy)) {
-		dev_err(dev, "error registering generic PHY (%ld)\n",
-			PTR_ERR(phy));
+		dev_err(dev, "error registering generic PHY (%pe)\n", phy);
 		return PTR_ERR(phy);
 	}
 
diff --git a/drivers/usb/gadget/function/u_serial.c b/drivers/usb/gadget/function/u_serial.c
index cdd1dfc666c4..da31e5cea0a5 100644
--- a/drivers/usb/gadget/function/u_serial.c
+++ b/drivers/usb/gadget/function/u_serial.c
@@ -1311,8 +1311,8 @@ int gserial_alloc_line_no_console(unsigned char *line_num)
 	tty_dev = tty_port_register_device(&port->port,
 			gs_tty_driver, port_num, NULL);
 	if (IS_ERR(tty_dev)) {
-		pr_err("%s: failed to register tty for port %d, err %ld\n",
-				__func__, port_num, PTR_ERR(tty_dev));
+		pr_err("%s: failed to register tty for port %d, err %pe\n",
+				__func__, port_num, tty_dev);
 
 		ret = PTR_ERR(tty_dev);
 		mutex_lock(&ports[port_num].lock);
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 759770a13260..1160dc594b1c 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -202,8 +202,7 @@ static int usb3503_probe(struct usb3503 *hub)
 
 		hub->clk = devm_clk_get_optional(dev, "refclk");
 		if (IS_ERR(hub->clk)) {
-			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(hub->clk));
+			dev_err(dev, "unable to request refclk (%pe)\n", hub->clk);
 			return PTR_ERR(hub->clk);
 		}
 

-- 
2.43.0


