Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A5ACA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIfDhWm6ixjJFnpSOj18AG3Xc7oniyYktxCnB0/d6hI=; b=rLDnjgpaAvmMYWr64IYpI+fvqN
	BHUTefRR0uakwL7T9mAd48IsH9Gu8hLoL8wOUyhO2+vhNNkKl2+Ls/OHPaiK5oj/Ze7VzPkW4jP/i
	G6th29fZi64pa6/gNmqjuDqp7n+B3resa15CUcLuMiRpQZscZ8iJ1OHU/rjfyU0hAiDZ3V0W1Yb6c
	5sTkqLxF+hmr/6KGz+BZGi7G2DFzKf1sQ8BsEIGFz0NM/53qUXr8QAyA4woOXOuRYRAYbr52XCXX6
	sbc8KgOlH7X110aYynkkg63D6PQaDWl7NV/Wn7nnbom4UrVMSoNGLTUjUumzmXEBNuV+x/kBEgqZj
	cRoD+Kog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSgV-0000000Bqb9-2qce;
	Tue, 13 Oct 2026 02:56:11 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGSgS-0000000BqZj-3HcG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 02:56:09 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-35829219da8so2195226eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 19:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791860168; x=1792464968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIfDhWm6ixjJFnpSOj18AG3Xc7oniyYktxCnB0/d6hI=;
        b=soqGY85ggUSZndHdFnpSKlL2ERJXF8qrsQFSJtqxDeB4lHsP9X7GANqKGPkr6K1B7C
         cggcOLCUxzC6QDZgGoOzZzCcGeeraXe8o5z8AWo6h53kdwVcSaskGErazEFlz4gDs9E/
         Yci6tTJBfsrrX/PXh+S9jSWzMLg0ZJXV6eceqKokEObAxRLrjGVdw3GctrOXDYCzfxbk
         YtFIwuHCK48IOYbzFUlLgwbC9jzC0U2sg5NBMFhhkUWTUVcYfXkBgWGcQft8dCVUhf/k
         Jt1Rx9Ea8Y/ux9Zzzh8vFmysPrrEXVLPfq4sa/zGJ5PeWJOZB1mquDaULRxYIdsy8KDY
         Jy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791860168; x=1792464968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIfDhWm6ixjJFnpSOj18AG3Xc7oniyYktxCnB0/d6hI=;
        b=Ccru2nnIS6cHRH0SCSR4xFbVnNV1F+yOd1IAds6n9OAoVZabjrWDvMJsdIKK6GYr+X
         1774+DW2r72CFUuPll8rWUgnhN+0LGN3yhgdt7L8I4FGJZFIeeARpSatRm4Kl4WEBede
         v74qXf9nTlVgHt3yt0KOyxXcIBggpJFViwMJgSDHkiUiRQOnxeFe/9HB/W8mJCuafhHu
         ZcfnVjtAEzsRwJ6QKloDNSiSqMaSI6HruT9M7ro2m8r72r+HcZ7P2awx8/ZJpLxj8UlI
         5m6rz+lBjYrzTmWZVA9mvFOEgjQ+RFU0u0r4AcQFbbC6SG7mXJBvRVRjkYvVrBSd5Lu1
         Toqw==
X-Forwarded-Encrypted: i=1; AKwUvBxLYO4yd4rgqNs6cSCY6IQ+brvfZ49bxc4pAKLV8JkzTZ5alavhd08hvL3mBMNmfaQ8cpOjsKzyVTjbr6px9wfw@lists.infradead.org
X-Gm-Message-State: AFq9FYJeT4D1b72nPlWoPKdL8OBVjK9b6a1aqFNyFybx/mHAKQyYB6mF
	w46E4Sqnm3E7EggjBiQx4XrqWegXu/Fi6gRXlq1fCAMisKtiTTcRUvGS
X-Gm-Gg: AYBFou0+tzF6lJzJvERMglepJyULjX8DXY04uPL1zb5U8LsVR0vsw/7nqZwNo4kOjjf
	ciXzicNjSvLCs9m+JVjp/alQHQXGnFFllT+5rkECMjmZseyNRw/h/sb3D7ZtgyebB55WkxsFItM
	xfdLJhBeXe+Fc+SOkFccwPFUjPsqybUKxWqizTHRiKl/IYWFxHzVdxM3tk4osR90PxrNYuqwB//
	d2ay8/B5TxtIsvbFyt0k0NlUsOONGw9r6wDCHC7GRg64mukpSAWDf4qhyNmclLsIt7CRS+IdI9Y
	sgNcxuIzxJpzOnaN+NHOTjW+pVUSgsY3Kjsx+SIvCZP6wuRk91CXjOhF+DVU73QAHQhxo0/2jPe
	2oVgq6YSso692locXH3Ura8eCeHfQ0mvExmXiXW9Lo3Kgn/5RT0x67/gcgEn8b/JKR1+hxIIyaS
	CBgx8DSMgqZdHw1Y97N8NKMVfgHiPWHSJm5jjEHG3biZkEb0+qRHrRlmz2ET7oNeC5OoGAexGUB
	g==
X-Received: by 2002:a05:7301:4694:b0:351:694d:9ca1 with SMTP id 5a478bee46e88-3537b3c7ed1mr16260351eec.27.1791860167835;
        Mon, 12 Oct 2026 19:56:07 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:8056:897e:dae3:8e2e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm50889219eec.9.2026.10.12.19.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 19:56:06 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Tue, 13 Oct 2026 08:25:39 +0530
Subject: [PATCH RESEND v2 3/3] usb: typec: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-usb-ptr_err_patchset-v2-3-f83351b3fc3d@gmail.com>
References: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
In-Reply-To: <20261013-usb-ptr_err_patchset-v2-0-f83351b3fc3d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791860140; l=2977;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=CJIEnX0P5e5vEIvo4jO29/P3pon7RQPwtjkdjcPRZxE=;
 b=CqTrpBWOFP7IoNCOlvIrFBD5UbdJH+gppg/u95/nDgGJAjX+b/exGfLDCfXtlh5uuq2LH1vXW
 RiZAV3SFerPA8GsjssqIRbmCZ+Q0/MSnQEOT7IZw/FpnBBlI0t3pHAb
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_195608_832845_09BDA5A4 
X-CRM114-Status: GOOD (  12.74  )
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

Fix coccinelle reported warning:
WARNING: Consider using %pe to print PTR_ERR()

Compile tested only.

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Subasri S <subasris1210@gmail.com>
---
 drivers/usb/typec/mux/pi3usb30532.c | 6 ++----
 drivers/usb/typec/tcpm/tcpm.c       | 2 +-
 drivers/usb/typec/wusb3801.c        | 4 ++--
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/mux/pi3usb30532.c b/drivers/usb/typec/mux/pi3usb30532.c
index 985683fe49e9..b32f4c433de9 100644
--- a/drivers/usb/typec/mux/pi3usb30532.c
+++ b/drivers/usb/typec/mux/pi3usb30532.c
@@ -139,8 +139,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 
 	pi->sw = typec_switch_register(dev, &sw_desc);
 	if (IS_ERR(pi->sw)) {
-		dev_err(dev, "Error registering typec switch: %ld\n",
-			PTR_ERR(pi->sw));
+		dev_err(dev, "Error registering typec switch: %pe\n", pi->sw);
 		return PTR_ERR(pi->sw);
 	}
 
@@ -151,8 +150,7 @@ static int pi3usb30532_probe(struct i2c_client *client)
 	pi->mux = typec_mux_register(dev, &mux_desc);
 	if (IS_ERR(pi->mux)) {
 		typec_switch_unregister(pi->sw);
-		dev_err(dev, "Error registering typec mux: %ld\n",
-			PTR_ERR(pi->mux));
+		dev_err(dev, "Error registering typec mux: %pe\n", pi->mux);
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


