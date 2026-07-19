Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60051C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaeHrzDwq749xNqEBv7Hp6+uBqLf+sS5NmRKMPCInEA=; b=0NbqtW+9qZdfz7QFAhBmG0HLc8
	hHaQPsydoUVryQBdxwJFtKVW5W4Vi91c/cDbG30i0IMwpKrgIvYjEMOUq4DbzksdAH+QQEPvfeFVB
	+Ef3/JPFbNjyiqNyjF2GSObucSOXeCTs/LcX5wdbYs6THs+3DohEkbR0Tqz5z8pZ6rq01BagK11GY
	8OizSkWKmSBo0v/RgUeHj4MnDSMbOf8Z0Aee8EjfWam/bjXeK3LlUtdxd8Ky7qgabS3YbZFrtKDWC
	Lc+jR/iyPu+4zp12WK+7bn8/Y9KCV52RSpeHBlM1i4C5+bLQYnVoSMWCYu/SQn5SsCTooFvl/k7BA
	YmcZMSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR4E-000000050Zl-3z0z;
	Sun, 19 Jul 2026 12:56:26 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR4C-000000050YX-0oFJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:56:25 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso2189700a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 05:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465783; x=1785070583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PaeHrzDwq749xNqEBv7Hp6+uBqLf+sS5NmRKMPCInEA=;
        b=bBYssMgo0hNXp9TVeESBB5+Qow9KgYJLTjEI0bQHw8R/gtYsPWMrjtL7b8SPiyIzng
         S1p4EQvaniN6Vs70jp5+z9TDa/VVyhvDdZmihm/JkCqXBTMexi53bum6oxNBPkSjyh3f
         AwzGNLGy/VTjF8YB/gIv4z8UvQvsgMvwrYiKhkRZ2eo9INbgebmFic6ldoCOK7dN0+0o
         rZhLixV3jDGKq3vWCL2yJLw4Kkfi0sA9DZkavkUoLKMbzTUMi9GA99YhA1hpjJhx/j2j
         NLUeaJ9whRunZNuqWtYd8W09H7dQwFj5XbGheXoc4kco+1wdWPBhROlqya6tH9UfbIzY
         Ap1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465783; x=1785070583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PaeHrzDwq749xNqEBv7Hp6+uBqLf+sS5NmRKMPCInEA=;
        b=SFKkHlfNyQvZvbe3NeIIaINPAyPxRZUhfRpt3ZcioSs+n1F8kcS4/zadW6500PRjPR
         98j+pH4dfxBLA71vDIbDzI8Nckcq6nL2cg/SjensyrjfaUv4IciSaUzp0HJ768oiJe9K
         BjPILTTQdyqrJT2vifC7AONQ8IUO+Aw185W+WfpgD6WBiFOOliJ78dRA5PTGlyRhikCg
         iz+XFM9/r5vweqctA0BQqE8v8e6mOxZsdstBjAxe+DdhtQ8dUy3ARE6UIjxvxjp+UF6l
         QS0wDHi1fSoeJafL84EGQ4VuUuo+zWdN/FgjoHWcGtNLsP6pvpUsdrzTOGNvyAdDgGhu
         93hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqq22sh4Q4nMYUd3LetQN5tpcESEvsmzTJioT0xIzzuKdcz0wlh7okkwj64UqcvlfwUc34avwyF/nVuUdshG1sW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlzd44RQzsojEAbl5P6w38vuSFnYoJjL12O7MLmWOo4oQuhM5x
	C0Ta/lzLL4TlwxG28r8x5Xi33ulf97Pgi+lWSpRquRgva/cYgBrpNrTs
X-Gm-Gg: AfdE7cn+rK1kAfZ2BhkSKGYUsaRZI0SqVwweAlrn3pdI0W1vK3AGYxPecSe+WIxm1yw
	c4sB3os8lMMucfREf1fjzikMdHUGAuIzSVek37KYfYd/YVqYpS0f6TM4rMSOAKhYNyTJYEp04Zb
	5n0nwB11ViZw87HXj9uA1xUkXsbdVA8OFZwlZRXTUqjLgqSOsWGyfW/3GS9RLRxsefReCzNOOUt
	xuDLndCM8FrZDZth6GgII4YGUCOIyWquKOXRedeirOrQwdnFYtS0pNA2qCDqPoLYSQJCHWsDCtC
	B2e2eYjQmKlRJfB6UPa8rkgxaEfAMUGjeWl4OmwkdfogdXoTdz44IhTqdddTEd4IWPN56E3ms6+
	eqThigdnn9ObgsiBFJ+TE/9Sn/PNIjgRv0uM4Bdywf1lWSAkGKFQUmYYMgVmuJKrtEBZq5avisF
	mMvMnjfsyHnrAeyQ==
X-Received: by 2002:a17:90b:1fc3:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38e3d2b11dfmr16744203a91.21.1784465783164;
        Sun, 19 Jul 2026 05:56:23 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:22 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:47 +0530
Subject: [PATCH 2/3] usb: misc: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-2-85f7f2e4fefb@gmail.com>
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
In-Reply-To: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3927;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=5zvKnd0JD5ih/+cLM7K1dUL0S6yC1cEB7EpZtuHweFE=;
 b=ql28qsE4EWaYsxnuq4JZUcJCPFY2lrNmFjQWb9Rd/+w5VfSlKcXCXOhlFyrJi7M80qTF8IpCY
 OaddRPOw0BcCS0eedCYsSCCl31WLSBEf+wArxIm7CVH02A31l4uhy6q
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_055624_250152_708DF0B2 
X-CRM114-Status: GOOD (  13.32  )
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

This patch fixes coccinelle reported warnings:
./misc/usb3503.c:206:5-12: WARNING: Consider using %pe to print PTR_ERR()
./atm/usbatm.c:983:14-21: WARNING: Consider using %pe to print PTR_ERR()
./core/hub.c:5675:6-13: WARNING: Consider using %pe to print PTR_ERR()
./gadget/function/u_serial.c:1315:24-31: WARNING: Consider using %pe to print PTR_ERR()
./dwc2/pci.c:72:3-10: WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/atm/usbatm.c               | 4 ++--
 drivers/usb/core/hub.c                 | 4 ++--
 drivers/usb/dwc2/pci.c                 | 4 ++--
 drivers/usb/gadget/function/u_serial.c | 4 ++--
 drivers/usb/misc/usb3503.c             | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

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
index 5262e11c12cd..5e33e3984499 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5671,8 +5671,8 @@ static void hub_port_connect_change(struct usb_hub *hub, int port1,
 			descr = usb_get_device_descriptor(udev);
 			if (IS_ERR(descr)) {
 				dev_dbg(&udev->dev,
-						"can't read device descriptor %ld\n",
-						PTR_ERR(descr));
+						"can't read device descriptor %pe\n",
+						descr);
 			} else {
 				if (descriptors_changed(udev, descr,
 						udev->bos)) {
diff --git a/drivers/usb/dwc2/pci.c b/drivers/usb/dwc2/pci.c
index f3a1e4232a31..9845327f95c5 100644
--- a/drivers/usb/dwc2/pci.c
+++ b/drivers/usb/dwc2/pci.c
@@ -68,8 +68,8 @@ static int dwc2_pci_probe(struct pci_dev *pci,
 
 	phy = usb_phy_generic_register();
 	if (IS_ERR(phy)) {
-		dev_err(dev, "error registering generic PHY (%ld)\n",
-			PTR_ERR(phy));
+		dev_err(dev, "error registering generic PHY (%pe)\n",
+			phy);
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
index 759770a13260..3ac57d31376c 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -202,8 +202,8 @@ static int usb3503_probe(struct usb3503 *hub)
 
 		hub->clk = devm_clk_get_optional(dev, "refclk");
 		if (IS_ERR(hub->clk)) {
-			dev_err(dev, "unable to request refclk (%ld)\n",
-					PTR_ERR(hub->clk));
+			dev_err(dev, "unable to request refclk (%pe)\n",
+					hub->clk);
 			return PTR_ERR(hub->clk);
 		}
 

-- 
2.43.0


