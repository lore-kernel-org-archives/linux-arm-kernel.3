Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D667CC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfTrS1OjRQIwj0wKN7rCzduFEiSKH12F8dOUfUGzre0=; b=NqGOV7oAk/KTETp+0TTF9vSz3S
	imj0OHC+EH02KCWZhcn54v1qoOGcmvLIoyeT5AA/uSnbfWsCcmrE1xEWL+vEqSnhz7YmawUMLf2QL
	/oFTuJEbD1UOOaOcxBvx4pfph8d9o3iLqqCVhoM40j738CjexU/HffNPmjUPl4RMEjnpc3RURzJGJ
	JZbb5AIoQOCpYQdG+cZUbsLHSYooDDW25AdQuRy9mPrtWwjuo+nrvS9rwabMgBAKULVT0QBxRkCm+
	7PiLHwIfnpShvsSKQG5eyr7NdrzXq0nVJ8QI6uEbYg1qOsL1ydoxjIZnwPaan8BfLCSgpxtFRPL79
	qMCzkm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF7a-00000007xre-10QN;
	Wed, 12 Feb 2025 15:57:54 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExt-00000007uyL-3Ev8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 46A5F440EF;
	Wed, 12 Feb 2025 15:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BfTrS1OjRQIwj0wKN7rCzduFEiSKH12F8dOUfUGzre0=;
	b=h9aQZ1VUnpQBH1K35/5VnOQoGp5HDbCa5PiNnGEKScTKrRSC/mrTSXD1Sc0mhlkShKVw4B
	eShP7wCQ5x+h0ZnLV0PWAgA15HTmnm+5EAz079vSfxISf/mzMhJB8YXmiB/ZMDdI6idK2s
	L4rvtv58Yl8YoerEDFEXys0c+9XKRZO7t0/eVkANAuH+z3g9Gqv+fJwhKOA3GvJTmFcXf9
	xfqkAiG0l568TtGVF9YhElfj+bkDOinuUcXIU2SgIh3xuSC8ddRypSytU/Bhd7TghJRZRe
	uL0k8qYKFRE6jPczp1LrgpgAoorULwcjvPsustaPJdXmfuIzmiJJDYjzmr01mA==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:24 +0100
Subject: [PATCH 05/12] wifi: wilc1000: do not depend on power save flag to
 wake up chip
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-5-9609b784874e@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074753_939743_C66C5ACE 
X-CRM114-Status: GOOD (  17.61  )
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

The wilc chips family has at least two mechanisms dedicated to power save:
- a firmware configuration message, currently wired to the
  set_power_mgmt_ops of the cfg80211_ops structure (and so, configured
  through iw)
- dedicated raw registers which allow to wake up the chip each time we
  need to communicate with it and to allow it again to sleep once done:
  those registers are currently manipulated almost any time we are about
  to use the SDIO/SPI bus to drive the chip.

Those mechanisms are currently coupled together, and so the second
mechanism is driven only if the first one is enabled, but it is wrong:
even without the power save feature being configured in the wlan
firmware, there are cases where the wake up and clock registers need to
be written correctly, otherwise the chip stays unresponsive. The
downstream driver seems to acknowledge this issue, since the flag
matching the first feature has been completely removed.

Decouple those two features by removing the condition on the powersave
flag in acquire_bus/release_bus to make sure that the wakeup/allow_sleep
registers are actually written when the passed enums
(WILC_BUS_ACQUIRE_AND_WAKEUP, WILC_BUS_RELEASE_ALLOW_SLEEP) explicitly
require those writes.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/wireless/microchip/wilc1000/wlan.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net/wireless/microchip/wilc1000/wlan.c
index a697caf73ac3ed06602c029c17773f50e3f8edb5..1031f8153c76ca5761c1e91d03ba357a5c915774 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.c
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
@@ -748,7 +748,7 @@ int acquire_bus(struct wilc *wilc, enum bus_acquire acquire)
 	int ret = 0;
 
 	mutex_lock(&wilc->hif_cs);
-	if (acquire == WILC_BUS_ACQUIRE_AND_WAKEUP && wilc->power_save_mode) {
+	if (acquire == WILC_BUS_ACQUIRE_AND_WAKEUP) {
 		ret = chip_wakeup(wilc);
 		if (ret)
 			mutex_unlock(&wilc->hif_cs);
@@ -761,7 +761,7 @@ int release_bus(struct wilc *wilc, enum bus_release release)
 {
 	int ret = 0;
 
-	if (release == WILC_BUS_RELEASE_ALLOW_SLEEP && wilc->power_save_mode)
+	if (release == WILC_BUS_RELEASE_ALLOW_SLEEP)
 		ret = chip_allow_sleep(wilc);
 
 	mutex_unlock(&wilc->hif_cs);

-- 
2.48.0


