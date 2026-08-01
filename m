Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28FA5C55175
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=; b=5Bvuz0WRteohvIXUPhZt9IezCP
	yoJpb7akocTfQwKugKjKulHHbstM0JHioOxNZY4OyY/eC0XHyn8zQbfwu7FXjOyUXzlx0mCfIxwR4
	pMQbUbcVyEKhlxdQpNjR50FWobVh3xKVZENr+ihJbSGBXVhAZjDWMaBvUxpgaYnK+ngqze7eBnvVg
	PVFvu4uLRkBGdLWLWO9eMFKXoRhicsIrFLyfRSaah4YmvzDQzVC5fBwv7ySThPlsnDrH/2Yz8Fq+W
	MBNKFELgse60DXbv+KjftwowPMPHhc1uldjcx2UhPsJL8VxOU+iKL8a3gZfGCBcDzPzcTxx0k1WKk
	5lFR8lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8r6-0000000EeKf-2YWb;
	Sat, 01 Aug 2026 12:30:20 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq8r3-0000000EeJO-3Lot
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:30:18 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so1883733a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Aug 2026 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785587417; x=1786192217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=sIlO6o+d0aZAVELkE3rnvcY8uRSFTSO1k3Jw1gcZ16SqSdJLaRyHiCMYkqoNkNvLW7
         saga+5NvoMg//nYQT8gVWlQKTRY5Eg/IIitDxo7StfW4YAia3n67h3KvUQlzn5CV0Xeb
         kKtCScEXOIpn8usHnX6RINl4wfICd5TgXGX7NHeu0DkZgFQrgCkUT03a0LQaJaonvcqh
         tIxsOSOJ+7aMbsrf1gcArns5LxKYg5za+O2Pbq8GENVGYzZftV9ZUFncrrAVNC5JBiW2
         v1oybR9UwlldLADE4HorxEQqydhQGmCvI/6s46Yhv+e7IdHfmbHhDH2SulDtlaIGDXGa
         YRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785587417; x=1786192217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZXu4hUthVdVMyzR8sBV5EnxrSahb+P4A553ME38qa0=;
        b=nnCyTN1/Bwc9duStkg1Hj1AUCHgKAf4mKnMtVDqXu6IgD4qFU77Nf6J0LnQdtwcQrw
         zal6CBQiPkPtqI3hXsm5x73NgBP32Cc4wYkaJ55n9Ytm0QPINoLfsSZYvvw00z38PADk
         gHh9eoKU2EHzi7pe1d/C8qWEOtr1gHzs0e0MAiSF7xZGCGJUKUw2PcM4mz+snSEgppMI
         sG/44TuMWG6Dg6wNOMYR3fJP+smikXdxSki4lhI4t+AljUltU4xd97ycza1nka1fYFsH
         zp3jdIlLEJSxSqpolJUW970YInChWzJlHOvizu4kXafxOwLoSAnfkpXo0gXQkigjbsTd
         UYFw==
X-Forwarded-Encrypted: i=1; AHgh+Row0B+KpMOKRhPGbFX0G4Hkwr63uyjCjL2joBFF337G4Bxx89w9mPFiWSTRXZ93YSA22/UeuxkY68ZQRMeBDRYF@lists.infradead.org
X-Gm-Message-State: AOJu0YxDEAlYr9TxeRWj3CFjn0g+lZHdaz1UJ4ffZSYALK/9fPvFOXH+
	zUm45dWKFYPdcIBjMkHmJlV7v4qPBYqCui/DGcigCC4OPGtidvVKhf3J
X-Gm-Gg: AR+sD125yqP8NWHgj4ZuYI4zxK6fulvyDHOs3U6wrws2wncTVccfpJkbAjo6DU53nDz
	AJoegOyk0h7uI7+plQcN0bBC/VwnVPZRrlW1ECiV7waN7CL3hIz2mkZhbEuEVxjc+NmU5gpWEAc
	pLUwhEyXBK6jIyTveloeQfde6d4WI/I/66KxgJmLD0EB8TTqWNW4PE7DV3mYxvNg9UQN9iVr2z7
	HMmOHE9h9T5B4IqcE2m53llw3OrZz2qC9EpxKv+doIjO9k8DocTPbQ+8uDmaOSCkoE7srIUO7Fe
	Sc1v/kQhgA7rWkHfLHXwaoNHikhLEVHjIIq55orj+q3CHPkThsYheeCD9MQrxPVHkwK6IeUEXRp
	s+VqLWjfQWTSuu53Q9LRxSaOQcWzOVqL9kmb5guAiYprrezzkMCDQna/12GIeGvGR+5Vl64JGQd
	AWnTF3WcvuYEzJQnaTN8ACAHuW84iH1naJv2A7V/JZLT2HW+KxC8oDMwkDX2B+Cqx/i3yF70uYL
	xo=
X-Received: by 2002:a05:6a20:d809:b0:3c4:2eb6:c3a0 with SMTP id adf61e73a8af0-3c92a63ad0bmr3140772637.30.1785587416840;
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
Received: from [127.0.1.1] ([2404:f801:8028:3:9df5:1cd1:f108:c202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045022sm16174086eec.18.2026.08.01.05.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 05:30:16 -0700 (PDT)
From: Subasri S <subasris1210@gmail.com>
Date: Sat, 01 Aug 2026 17:59:52 +0530
Subject: [PATCH v2 3/3] usb: typec: Use %pe to print error pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-usb-ptr_err_patchset-v2-3-1698e298c1e3@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785587393; l=2871;
 i=subasris1210@gmail.com; s=20260709; h=from:subject:message-id;
 bh=EixTu8F/XmrqpGkUc1ZAKwt7Ik8fS3oCoez4NHHuAPA=;
 b=y9rlU0Bar73W/79icXHYY1Za1xqYHDFPlcRNAyzBdU9DLsdx5ZFdZAtAfdQnYCacrmDjy37bN
 67dNNmpkRFUB7JSMQ26Hj03dv6oZIIwgFS5fqDwVdYCNRhAPyYsGqab
X-Developer-Key: i=subasris1210@gmail.com; a=ed25519;
 pk=6C4wavGFy/OsR8yQQKNWuDXoYPHp2L3sfgNfyzTruTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_053017_848332_C83D478E 
X-CRM114-Status: GOOD (  13.23  )
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


