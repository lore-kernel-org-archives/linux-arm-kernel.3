Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B293CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 20:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP40aocTsGkB8//cxZMak90EHfdlyQYnHT+ooa5+Bl4=; b=VdWVJNEff/Z0mT/STNmw8tw9yf
	2cnurP+apWgYKjZAWMgKI/BfoJCRpqv1AFtYhO0orQIEbBL7y80KiN/s/D7tvtBN/cEvgVIM0dd7J
	MPfiaLm9BucdYxMfDRQ3FFtNLFbquU63iQuffEuzDWmI6exMQ5fcITQ9fudau1rLNoxUDmcH2Xpp3
	C5ZKhM7dtTjoJ2vrgdWuVui36E0e2198n5FoMsKPRt0iJNoy5Oc88eAM1tjE/juOgBhLvPLSZZXKb
	TAs3H/DL7MZhTqpdfJpeyH7Y5FUthAjz+miRIZ+tubtqNaAhjD2IdEaag8Vk+RzuTZP+YG563KNrl
	lVq8/G7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRgA-00000007RFt-0c9P;
	Fri, 08 May 2026 20:20:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLRg5-00000007RDx-281f
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 20:20:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso28467985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778271603; x=1778876403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HP40aocTsGkB8//cxZMak90EHfdlyQYnHT+ooa5+Bl4=;
        b=UJIfr8F6RoQNHxlLPgmvFsRekeNhsL5nT1spDeYsuU81GVtopd3xq6e4GEJtWvVZT3
         Y/mRzCurzVh5RtmyOAJLb75ZLV0jTJM18nMeOfNcIAn6Apr4FNqpAVnQ0LsaTfqACjyH
         UMMXK7wNdQ/5ldu1lxccSQWPLo2pleRwQA0JcsExlnRrYSFhmGdSD84jng1MGMv1IiBw
         cC9QPIMe4TwpoIoAjpVmWvlleb0wDKJsLp5Pt/q4yxJg4uk5FaD+q4ar7mnRh+dP/Hkk
         mljZkHuza/ExQxJMP/xaj6bfxjz2Pz3zJQTeHnIrexbZ4+nVnFiMDyDX/r2ybYC53He9
         YRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778271603; x=1778876403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HP40aocTsGkB8//cxZMak90EHfdlyQYnHT+ooa5+Bl4=;
        b=kFYjQllyuWMrWiSBJ5zVh9pHkIRQOsepz/hAc382irAy287ynUoItCE8Z8z2He9d0v
         SnWuwA++w009rqZsvh7BzbFr7WkGg0cJuWTyayaXSPXePnw30u1KekVAdvjl3docnByg
         f7bHVj4+1IhUq+lSofCpxQX00DifCOry/LbJWvnZItOARZOFLdhh6/UMQevfBoNlFp2W
         VD/BSIRGEzlikaa8lCnmqcF8TOoN7N5MX5UqUKj+nNB3XORqGhZZxlxFPOU6CeaLmZ3P
         FlpkaimkyIp7j+ygMKoFOzEieScs4N0E45CvYqgWUO47GnwVxYLpTOCMPp4UgFiMq9JJ
         X91A==
X-Forwarded-Encrypted: i=1; AFNElJ8bkPxaQsw1X5yXef96pelOMFJkflupewJEugUueuDCunKtb7IZWJrHR6z03rLpY2IvHJi1cArwQ/2l9W1ou3K7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw0/ynCVZZQVrDl02ackkmDrd9TuhGSJOeWS8YD4VaR39bgkX+
	8KX64WUT5ckUPIDaxvCUfvjeCcTBzcoXKhb17SewjXYU/OvdotrGgw8c
X-Gm-Gg: AeBDiese9REvnQpZwrsx40U/mp3Bgi2RWDU8mid82uC5ldmAShkTtjk8chQ6dQx9kZa
	HarliJUxhnMEjKZUFZi57RGmKpwEemHlqMnd07NwiLYmisHv/j4RXP/ixsiwdt1y/p5lOpSbDSv
	zGgKel0lH7ac+sfCPUBPt9yft4noUTEtbpijqRcEuJAKcAxGAIxsmyBvUYwVIjqmHcLTq7qA59C
	OWZ/+DkSje3csrQmsN9NlXN1KgsVGOkDSsjPDUiP2xnwlv8Tr2oG0faGtzqZv+lRUGKPxDQ2tN2
	V2To4EeWNakCupLKbs1L9gQJXm0N6cqpaV24tvMlDgkZJgOv7/eR9xT7+XFm+JPH57r+WZDGLMi
	KFssh0TwVhBJonrqFkqvkMTnvrDDOGqGxXn8ANkYCwpysiW5YKah3cYYWjn8KsQa5wzjoi/6Fm4
	82JqkSqvpaOufMX/MqsYejhzW8I+55TA7UqAFXofA//8/y2WjXcC6CXRxWEnUllEeAWLr7bKGEN
	1txXzYfGm0=
X-Received: by 2002:a05:600c:3151:b0:48a:7605:751e with SMTP id 5b1f17b1804b1-48e51e0837amr215462255e9.4.1778271603054;
        Fri, 08 May 2026 13:20:03 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6dd328c2sm15825895e9.6.2026.05.08.13.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 13:20:02 -0700 (PDT)
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
Subject: [PATCH v3] phy: apple: atc: Fix typec switch/mux leak on unbind
Date: Fri,  8 May 2026 21:19:58 +0100
Message-ID: <20260508201958.30060-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507163746.108086-1-devnexen@gmail.com>
References: <20260507163746.108086-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_132005_582003_22544232 
X-CRM114-Status: GOOD (  17.54  )
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
================
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
Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
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


