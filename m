Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A181C44521
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 12:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=; b=Pcq1v5e6at2Tw6ZVtCR17LS9cf
	lIgaDw8ZFY7RgVzCL6KdNLflq/s3A0ivrvw0WQ9UgG9lQVNA1dL/Zss+npkkgO5PjmiBRvTNKU+/T
	mKfxQL6bNbZKKoDit0WoAJ/FbHAy2DVIYdRD5PohIovcwPKcQTHIVNAfo82c5CE62ueMWHl/u8M2h
	7hA63qNTE6Kr9QFFse6JGDuUOGeQWfdz0RuTjcziiEEnxA7nSbMzoRTbX2UeOEIhK6cjgXmsHXqtK
	oqJDiM0YfD7WrzVnvVzGKsfHx+8slAWhBGI0csa2wo+RTwGxspFuMfHSkZKXZG94dE8Y7ArzlNl6+
	EYzouhGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR4L-000000050cu-0B3T;
	Sun, 19 Jul 2026 12:56:33 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlR4I-000000050bF-0eOS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 12:56:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-38e041ea211so7000438a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784465789; x=1785070589; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=MfGi/aHeqBoy2F6W8HEPEjOIVXMRXByibSCQQfz5Bi/yg7nurykkrBs3eORsOTAYPu
         qkAtvW2K2VDKhEx1zcQBK6qCCa70VKit78mzD36T+D1NtNTd8SZqdTJYDUnK4WT0jnba
         4dnU2A2GsME9U+3+x/GwHUXN2r9Ilb6JlibxJrIz1z37xkeiOE9CkHuocvjWCy/xRGoK
         jIQalrQY69pVRU+K5rzzNc2FUUtuFeUGB1kuzxTQa/kK8WFV7jhLlLMArnGkTb10UraU
         a+WOcn1ylYqfIkR3vcfaJlRc0P8u1OXtxdk3CJ+hQ7KmUZij8rpOp+yyjpeZ5qOorD1V
         +Z8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784465789; x=1785070589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8hVhgq8qkFjQgYXBuINyY4J7kP1MwBhvWar/OW6Gmc8=;
        b=hS0dIpYf8/JZvBluAamPvnZ/T2gQ8Jskb6fbmrjOdoMOu4jp5DMQehQAhgVTLZxwSv
         TuudXvqQAkhNM0vxm7P/OcOmgOPxc3MczY4JbXkYOJ4gPt8BFA7AjjR2VYLrFN8AX/xu
         +WMC0q42kzgJtTnmRREeOnkYnUU3xz7NiT2aF3NCCvfKX8Z1ICN/WQrmTYJ4CiGeWydr
         SXB0jzGx7LvoqqXPrPeAuUVhHBTmiPEZ0SAKiCwf3dzGLjZusSd5k2IeSCcPOdkWsdgS
         haQGBYvHiITNXsS9uaMkHF4G9mz7D7Ilq0eQtUavqbl9sg7SarWtsrdqEH1RzI3wi0E3
         E4uA==
X-Forwarded-Encrypted: i=1; AHgh+Ro7GkxAWqWTXy9TZvLnj4JAeEsMs4tAK0T8mQhNio2GloD83vGmPbnEKUazyndudxo+dimf73JchXSsgW48r4r5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1XfT5t7ni03X4ifVNRq2znE70SnxUVPz5LS4isMtX3SbbDDym
	dlc8dvraCi3OWIddEo8g00ODmFN9PxJS+sbJ0u3Jt9w2PeDNcA9RCNdq
X-Gm-Gg: AfdE7cnSNPs9ZNjZp4Ka1mVlWUX/JPXf+GHVehXXhSSttCdXq3GENEIhMziAiOlXmlg
	Y6M/98j3QkS5XtHzzTdXFlV+LF3wH+OAYHQ9bdqVDRKG++WVBHN65D9iOphGKB+wjWuixjMPhZ9
	0DZjp0rkSr2x6Izll+E0MKz7NJdRminMaMjKP733/cNzDQCBMoI0AIojFHzBkivgw4jCnpXhJNb
	i0xAv5MrLY/hNyRHBPQmSfVmfCTjXDuaJynD79KvAHNrnbQnbT9SDrD/lo0+PbYqkbnlDHXZLLy
	Qo35Ie7AyMUgb+Tft9FQw5VeOXAuWab0l2yFmP8jQ1cBPNfk+q1ORwQFjXDrzf1p/ti0vLF5lZV
	u5scRgiZ36GdED1Vw1t8spCVjfJ9u1f6eo5j16VMeY6bhN2bSqFziDIhfjgx9V+ZxLdK9UP/WEI
	TYpX0=
X-Received: by 2002:a17:90b:6cc:b0:387:e0bb:57f4 with SMTP id 98e67ed59e1d1-38e4b5792a6mr11187005a91.37.1784465789205;
        Sun, 19 Jul 2026 05:56:29 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:1:edd:423c:25d9:f95a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm20990052c88.9.2026.07.19.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 05:56:28 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 19 Jul 2026 18:25:48 +0530
Subject: [PATCH 3/3] usb: typec: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-usb-ptr_err_patchset-v1-3-85f7f2e4fefb@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784465765; l=3117;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=TshTtph4XpDtLC0dRiJ/OQINrhwR+YX+U/Elo4w8YsU=;
 b=rOqRg26QyDZf5559WdNDPWAG75Lk1bUfU++c9aZ6toUgJ75Al395i1fAUcJgGkaQAbCTmnSVA
 MlK66hcnFGXCwfDAeiZvJ89y1HvvgA+mdLV+wyy9OEmYm+j7FFo8UZW
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_055630_207284_09CFA4C1 
X-CRM114-Status: GOOD (  13.48  )
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
error pointers in various typec drivers. This prints symbolic
error names (e.g.-ENOMEM) instead of errno numbers (e.g. -12),
making error logs more readable.

This patch fixes coccinelle reported warnings:
./typec/tcpm/tcpm.c:4799:60-67: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:143:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/mux/pi3usb30532.c:155:3-10: WARNING: Consider using %pe to print PTR_ERR()
./typec/wusb3801.c:281:5-12: WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 8 ++++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..a2357a28ecf4 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n",
+			pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +151,8 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n",
+			pi->mux);
 		return PTR_ERR(pi->mux);
 	}
 
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 89eec20a2064..ad10470ea73b 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4796,7 +4796,7 @@ static void tcpm_typec_connect(struct tcpm_port *port)
 			port->partner_desc.accessory = TYPEC_ACCESSORY_NONE;
 		partner = typec_register_partner(port->typec_port, &port->partner_desc);
 		if (IS_ERR(partner)) {
-			dev_err(port->dev, "Failed to register partner (%ld)\n", PTR_ERR(partner));
+			dev_err(port->dev, "Failed to register partner (%pe)\n", partner);
 			return;
 		}
 
diff --git a/drivers/usb/typec/wusb3801.c b/drivers/usb/typec/wusb3801.c
index 6062875fb04a..86d13ab41670 100644
--- a/drivers/usb/typec/wusb3801.c
+++ b/drivers/usb/typec/wusb3801.c
@@ -277,8 +277,8 @@ static void wusb3801_hw_update(struct wusb3801 *wusb3801)
 		if (partner_type != WUSB3801_STAT_PARTNER_STANDBY) {
 			wusb3801->partner = typec_register_partner(port, &desc);
 			if (IS_ERR(wusb3801->partner))
-				dev_err(dev, "Failed to register partner: %ld\n",
-					PTR_ERR(wusb3801->partner));
+				dev_err(dev, "Failed to register partner: %pe\n",
+					wusb3801->partner);
 		}
 
 		data_role = pwr_role == TYPEC_SOURCE ? TYPEC_HOST : TYPEC_DEVICE;

-- 
2.43.0


