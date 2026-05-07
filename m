Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3344ACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 16:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pGCU5B8lEdAiwWeUe+DGhLUkoxpExSxBEl0W5p2Dn8g=; b=t7qmE4eG21zH203vODBhBLuC54
	Z4UHstsfKav52r/wvP0ueT3Xf8p5kD+6y8r2p2UpMkd/KojzrJc5tP5BRHqHRNk02+bZ1uIEQeNFj
	3z238qqK/aennI8vQBP9YoVQEapyBJUBHoL21bdSXyKHWtigCboxXYjHAdgz3auHACnWB+sTsjkAh
	yn7oMYqm5gDQ3ZKHZkCigAf7RFNYMf5T1tdoQ/tX7Yf7inTqsKJCr5hQ5rb7kAUkyv3AzFpS3t+eZ
	Wow+JxoJdRBMBg6q58gl4iJP5BfYxrc0RCUbLfLOgQEBwaF3pFhtwoTyeld76+aoPE7mQOGENdwnI
	XW+ymQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1jY-00000004Lq3-45nA;
	Thu, 07 May 2026 16:37:56 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1jU-00000004LoU-3wMu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 16:37:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-48e56c1bf5dso7071705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 09:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778171871; x=1778776671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pGCU5B8lEdAiwWeUe+DGhLUkoxpExSxBEl0W5p2Dn8g=;
        b=hpXGml0/CCiVC75gCwEUBfsEp/Vroj1Y06eSebHp9eiWHWKCvZ4juLYNEk7f7B0zFv
         YfpgHKFUyCXF+QZugf1wMpvC14+5u7t8rxS8K7+HUBYr82so77imBYB0NcGnZaZpjts0
         yVUldEbyJgHK+HZISYy6b2qgFrxmYHKcGIdcdZL8VBf6zFHZdsFsZp6SVL0IHJljALky
         KBVAGl8xLMZ7xvb+YlOAGin3C6K7h/I7bRtglh/7ZdObAu7EWNP2tFlvEugJXtcSGV2W
         Z+j9zOW1qeatJ1THtODBMsmz2E0cgJe+ER1O+0wWFZGwzpjbhEXvigaI2ozK+VBCJXf3
         870Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778171871; x=1778776671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGCU5B8lEdAiwWeUe+DGhLUkoxpExSxBEl0W5p2Dn8g=;
        b=d954vr0FEpFrTj/Cx3NeIpltylUHgN0G2rsRtNEcNOaKn9gkMUYM4O4oEtpgjkzZ8Z
         NsnaZLhpsALnW1fejDao4X7n9YZDdB4xr139c0XZ5RMGmlPcywH3738hYrk63HXeuqWR
         mmpOlM1zDToac7vFpsm3JVXYlsR6VPmdEMJlfvcBPJ4et/bg03vW4S17/KGoYnEj2VaA
         Y+xtDVu6lbzQ1Z6PJxJsO8P6yTwbQWf1UGQYZN6Z5yXZeMWfeRq3wMXDT8lRkuHax5U8
         mvioFlzdO7KbiKmkfqgSYrSU/mw4pM3HpxJrznAOR7VVQSUczDmoCLE+0aY6KxEjymCZ
         Z3hw==
X-Forwarded-Encrypted: i=1; AFNElJ/95+h7CI8PK+k8wSTTmrv6eqpe47QI0bWaES+GMQUk31YDacoIJYKrAn+LfeY/v4uZR0+cHRM/gzQyvFMTcyoh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqn9jqbJcpU/qji4n+TWGJyySKW/XEAMj2aVsH2rz1vCjus6ul
	vbmeiCsM/ZMt/JPpVybGTiBLInlIum8sJpcjWUz9IJAt/7fuObNORbKN
X-Gm-Gg: AeBDieubqrHSY4m2nfViTP7RKl4wMie0ektdWo2YWgxt2zRRAU4LmxaW/nhZB0g72dd
	mZvp/WRMcyZG8mCZE6h9cG7pIxeD2JW/2GtUYoFdhjLImBiDvwUF2TaRhUeWvqjzO0numo88x64
	p8+E9RApgpbYg7GFkcp5ZbWXhjQs2ILqxGrEHhJuBzRPa747ti05L0MyUaTSKzIvlFowpo4/pJH
	3Z0VLrwuUdk7OGoOUhM0YuznVIPRZr2A5BBY/LN/yPssKxov/ycH6/rMDPbXNYr0ZqffCCBC1t+
	vAtsfhv8Gn1RZntWtT/isYZGgBdDPgMynBSNyx6NqUi385tEaZ6NqteAAx+C0qENQMV4Fbw2F3T
	L1lxK8zLc+y+eW2prr6VIqmxCZd2y4/zmMk0l+FzA4mGZq4l9VBVmci9Tb90bHxjBCNLr/7SD3q
	+wc5qDylUWVzfwnDyhYR+nodn+Yl0k9j6cuxdqlEbWSVV2FNM+oPfq8f4UEUy8w5rSXt1WGACeh
	60TUOWqli6C5TbVM3QxsA==
X-Received: by 2002:a05:600c:c11c:b0:488:c078:bfda with SMTP id 5b1f17b1804b1-48e51f4835dmr101988665e9.26.1778171870182;
        Thu, 07 May 2026 09:37:50 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6428e746sm590165e9.0.2026.05.07.09.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 09:37:49 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	marcan@marcan.st,
	p.zabel@pengutronix.de
Cc: olteanv@gmail.com,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2] phy: apple: atc: Fix typec switch/mux leak on unbind
Date: Thu,  7 May 2026 17:37:46 +0100
Message-ID: <20260507163746.108086-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_093753_001673_6619BA42 
X-CRM114-Status: GOOD (  17.40  )
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

atcphy_probe_switch() and atcphy_probe_mux() discard the pointers
returned by typec_switch_register() and typec_mux_register(). The
platform driver has no .remove callback, so when the driver unbinds
(e.g. via sysfs unbind) neither typec_switch_unregister() nor
typec_mux_unregister() is called. The framework reference taken in
typec_switch_register() (device_initialize() + device_add() in
drivers/usb/typec/mux.c) is therefore never dropped and the
typec_switch_dev / typec_mux_dev objects stay live forever, with
their sysfs entries under the typec_mux class also left behind. A
subsequent rebind cannot recreate them with the same fwnode-derived
name.

Save the registered handles and unregister them through
devm_add_action_or_reset() so framework registration is torn down
in step with the driver's other devm-managed state. While here,
drop struct apple_atcphy::sw and ::mux: they were declared with the
consumer-side types (typec_switch *, typec_mux *) instead of the
provider-side types and were never assigned.

Scope of the fix
----------------
This patch fixes the registration leak only. It does not close the
use-after-free window that arises when a consumer that obtained a
reference via fwnode_typec_switch_get() / fwnode_typec_mux_get()
outlives the provider unbind: such consumers keep the underlying
typec_switch_dev / typec_mux_dev alive past device_unregister(),
and a later typec_switch_set() / typec_mux_set() still invokes the
registered atcphy_sw_set() / atcphy_mux_set(), which dereferences
the freed apple_atcphy through typec_{switch,mux}_get_drvdata().

On Apple Silicon the relevant consumers are the typec port and the
cd321x controller registered by drivers/usb/typec/tipd/core.c.
Cable plug / orientation events and alt-mode transitions trigger
the .set callbacks via:

  tps6598x_interrupt()                 drivers/usb/typec/tipd/core.c
    tps6598x_handle_plug_event()
      tps6598x_connect()/_disconnect()
        typec_set_orientation()        drivers/usb/typec/class.c
          typec_switch_set(port->sw)   drivers/usb/typec/mux.c
            atcphy_sw_set()            drivers/phy/apple/atc.c

  cd321x_update_work()                 drivers/usb/typec/tipd/core.c
    cd321x_typec_update_mode()
      typec_mux_set(cd321x->mux)       drivers/usb/typec/mux.c
        atcphy_mux_set()               drivers/phy/apple/atc.c

Closing that window requires framework support for invalidating
consumer-held references on provider unbind. The same
consumer-survives-provider pattern has been discussed for the PHY
framework [1] and is out of scope here.

[1] https://lore.kernel.org/linux-phy/aZejMSJ9qqRWb2pX@google.com/

Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/phy/apple/atc.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index e9d106f135c5..4156fabad742 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -628,9 +628,6 @@ struct apple_atcphy {
 
 	struct reset_controller_dev rcdev;
 
-	struct typec_switch *sw;
-	struct typec_mux *mux;
-
 	struct mutex lock;
 };
 
@@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev *sw, enum typec_orientation ori
 	return 0;
 }
 
+static void atcphy_typec_switch_unregister(void *data)
+{
+	typec_switch_unregister(data);
+}
+
 static int atcphy_probe_switch(struct apple_atcphy *atcphy)
 {
+	struct typec_switch_dev *sw;
 	struct typec_switch_desc sw_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_sw_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
+	sw = typec_switch_register(atcphy->dev, &sw_desc);
+	if (IS_ERR(sw))
+		return PTR_ERR(sw);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregister, sw);
 }
 
 static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *state)
@@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_state *sta
 	return atcphy_configure(atcphy, target_mode);
 }
 
+static void atcphy_typec_mux_unregister(void *data)
+{
+	typec_mux_unregister(data);
+}
+
 static int atcphy_probe_mux(struct apple_atcphy *atcphy)
 {
+	struct typec_mux_dev *mux;
 	struct typec_mux_desc mux_desc = {
 		.drvdata = atcphy,
 		.fwnode = atcphy->dev->fwnode,
 		.set = atcphy_mux_set,
 	};
 
-	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
+	mux = typec_mux_register(atcphy->dev, &mux_desc);
+	if (IS_ERR(mux))
+		return PTR_ERR(mux);
+
+	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregister, mux);
 }
 
 static int atcphy_load_tunables(struct apple_atcphy *atcphy)
-- 
2.53.0


