Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0DEC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3fD1k5bMIW/imRQuzK5KhvhuylFhJp7j2W2nlf3giUE=; b=jHMR4Lx/wDrv2aIGI9ZN3tIJIp
	Yff3JZSz5/gJpPZaJKVe9THP7oMdxRVvPdsSag0tdhK07uLE7sFKqcodsyxXViMUuwEeYsB70SWJb
	LYrHtKeK2bJecMqSv6KIsBI55vdfdB0l0r9WxmIpRqU3oBWZ0+sdp0avBHdLbM0bBxzY1vUTTH+sI
	MMcYYdfLIizlYgwwAnsBlt+E6/7ViHReN215owEhL+a9p5OZu7U7x7WazezMl30+iQBmyAKNWyubT
	PIFojNht4x8DYjwSDyFJJPRjM9bzWTranBC6C+jgwpJvx0HrgfiHwhV3P2UtjbPdF3lVO4mRNFW4H
	qhH7fX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF20-00000007wCn-25oR;
	Wed, 12 Feb 2025 15:52:08 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExr-00000007uwO-1oi4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09DA1440FB;
	Wed, 12 Feb 2025 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3fD1k5bMIW/imRQuzK5KhvhuylFhJp7j2W2nlf3giUE=;
	b=bWhR95VJSQ5uC0Sndhv/pxDenw+gX0dRpNFdgQqPWiD91pebWItUJdF7NB4RPGLQ8wl8nl
	GzgiZeiT8vYFJIsXBuf2C8sMvDFiGHOG5+Xq1dU0385nrdyGp/o0jA6HfVkmDJTLoiK42r
	cECb4VyA8zCdQv/5hiV5tzuV1kDfMWQ8LIHV2feTZlGPW7N0Pa11gKqaSjh360msfQPQ+M
	cifWlglhSf6M4hT+ELh6sMeMTBTBI0HhjFfg9ZHwvX/Y2ClOqR5fZ1KgjPGIuWoD/MjWIj
	Zg9rvDivxMjKIteLEfJBhlPH6ZVrne6QjQ3iXkcPenJUOHiuGawqL6ikkMLhhg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:22 +0100
Subject: [PATCH 03/12] wifi: wilc1000: add lock to prevent concurrent
 firmware startup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-3-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kalle Valo <kvalo@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074751_601171_C882A933 
X-CRM114-Status: GOOD (  13.00  )
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

wilc1000 driver supports WILC3000, a combo wifi/bluetooth chip. This
chip needs a firmware for each radio. Before bringing support for the
bluetooth side (and so, before adding bluetooth firmware load and
start), add a dedicated lock around firmware loading and startup for
wlan side. The bluetooth part will also use this lock to ensure that
both firmware are not being loaded/started at the same time.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 2 ++
 drivers/net/wireless/microchip/wilc1000/netdev.c   | 5 +++++
 drivers/net/wireless/microchip/wilc1000/netdev.h   | 2 ++
 3 files changed, 9 insertions(+)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index e7aa0f9919232350761d51cbb1b5be87ca39e855..393fff618f919c5a6d3f4a7d894b187399455fb8 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1736,6 +1736,7 @@ static void wlan_init_locks(struct wilc *wl)
 	mutex_init(&wl->cfg_cmd_lock);
 	mutex_init(&wl->vif_mutex);
 	mutex_init(&wl->deinit_lock);
+	mutex_init(&wl->radio_fw_start);
 
 	spin_lock_init(&wl->txq_spinlock);
 	mutex_init(&wl->txq_add_to_head_cs);
@@ -1755,6 +1756,7 @@ void wlan_deinit_locks(struct wilc *wilc)
 	mutex_destroy(&wilc->txq_add_to_head_cs);
 	mutex_destroy(&wilc->vif_mutex);
 	mutex_destroy(&wilc->deinit_lock);
+	mutex_destroy(&wilc->radio_fw_start);
 	cleanup_srcu_struct(&wilc->srcu);
 }
 
diff --git a/drivers/net/wireless/microchip/wilc1000/netdev.c b/drivers/net/wireless/microchip/wilc1000/netdev.c
index af298021e05041ba4b16a94c8ee768407a208dfc..d24859d12ccd535c966a9b7f46378ac3b3a21d7b 100644
--- a/drivers/net/wireless/microchip/wilc1000/netdev.c
+++ b/drivers/net/wireless/microchip/wilc1000/netdev.c
@@ -4,6 +4,7 @@
  * All rights reserved.
  */
 
+#include "linux/mutex.h"
 #include <linux/irq.h>
 #include <linux/kthread.h>
 #include <linux/firmware.h>
@@ -534,6 +535,8 @@ static int wilc_wlan_initialize(struct net_device *dev, struct wilc_vif *vif)
 			goto fail_irq_init;
 		}
 
+		mutex_lock(&wl->radio_fw_start);
+
 		ret = wilc_wlan_get_firmware(dev);
 		if (ret)
 			goto fail_irq_enable;
@@ -562,6 +565,7 @@ static int wilc_wlan_initialize(struct net_device *dev, struct wilc_vif *vif)
 			netdev_err(dev, "Failed to configure firmware\n");
 			goto fail_fw_start;
 		}
+		mutex_unlock(&wl->radio_fw_start);
 		wl->initialized = true;
 		return 0;
 
@@ -569,6 +573,7 @@ static int wilc_wlan_initialize(struct net_device *dev, struct wilc_vif *vif)
 		wilc_wlan_stop(wl, vif);
 
 fail_irq_enable:
+		mutex_unlock(&wl->radio_fw_start);
 		if (!wl->dev_irq_num &&
 		    wl->hif_func->disable_interrupt)
 			wl->hif_func->disable_interrupt(wl);
diff --git a/drivers/net/wireless/microchip/wilc1000/netdev.h b/drivers/net/wireless/microchip/wilc1000/netdev.h
index 95bc8b8fe65a584615b6b9021d08d11e4b36408b..5837f8ffe548dad1b756cdbd8543636f2be0e9b0 100644
--- a/drivers/net/wireless/microchip/wilc1000/netdev.h
+++ b/drivers/net/wireless/microchip/wilc1000/netdev.h
@@ -287,6 +287,8 @@ struct wilc {
 	struct ieee80211_supported_band band;
 	u32 cipher_suites[ARRAY_SIZE(wilc_cipher_suites)];
 	u8 nv_mac_address[ETH_ALEN];
+	/* Lock to prevent concurrent start of wlan/bluetooth firmware */
+	struct mutex radio_fw_start;
 };
 
 struct wilc_wfi_mon_priv {

-- 
2.48.0


