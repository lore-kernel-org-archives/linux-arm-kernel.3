Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSlKEKgzm/q54egNWa8O2T+4J35Hi0UxWaRxNxaH0z0=; b=OaH7tahHwpSq6hUR1hDlIxy2oh
	SMLRdsbvUhaqs/CBMtP8H9KRkkzk952jfTgjOKTOBKXrGEu9cy5kA0F9c/C8698rsk1vE2N4tlXYP
	pHP2/bbRcekIeIBpPyyAr8iZOwn1prgFy7qNNqNuP5XY4grUP132h/9cNcpU4kYR614018zodIAzW
	41uvD2vA8wKjvispjsG3fd2R7O1/2nAzsjViSEN/J76sDEynHmdwrPNFjIdoav3taU4MmAxvlX7hp
	cp8WmDrZ1MgR/79QK5obSsN4OUPrFwsJKOx7vddz/hPvw2MVm4tsosk0CBcP1lErabXiri1jgx4uZ
	IGx7uOIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF8y-00000007yDi-3emn;
	Wed, 12 Feb 2025 15:59:20 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExu-00000007uyx-47A2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6D0FA440FC;
	Wed, 12 Feb 2025 15:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eSlKEKgzm/q54egNWa8O2T+4J35Hi0UxWaRxNxaH0z0=;
	b=TjZ/AkzYBhFedMs08HnK2oPOp6dXjcONfnjOmvCeVY5yD1HgW2rZK1tK9BIt9Q7pqBJYXM
	jYJbWmd+ejh+BLMlLWDafz5mHwh/O7xNF6pK/P8aDakRyOBG62CoB7YzeQGv83sOTcjApk
	SMWRhwtEVnVGV+bymbbS/YDY266W7IAXQYfm7N52QcqA9xD/CMc/odRIGEqCmv/K5CGAFH
	UBwMwGzp9Tvpt4awsN2oxlifbSxp7cEwZ1yRsNL1e0wZOx1fLVvenTvahnFd5AsTHz0D7n
	602Uyye/ALCwG8XYAfhIBXoX04BI8r9In1S5/ai7cWsYZdzFuQri43BFeewxXQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:25 +0100
Subject: [PATCH 06/12] wifi: wilc1000: remove timeout parameter from
 set_power_mgmt
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-6-9609b784874e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250212_074755_161997_1AEE3E42 
X-CRM114-Status: GOOD (  10.66  )
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

While the timeout parameter is part for the cfg80211 ops set_power_mgmt,
wilc currently does not uses it (it processes only the boolean value).

Remove the unused parameter from the driver-specific function.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 2 +-
 drivers/net/wireless/microchip/wilc1000/hif.c      | 2 +-
 drivers/net/wireless/microchip/wilc1000/hif.h      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 393fff618f919c5a6d3f4a7d894b187399455fb8..ff8c1a40634cee9960777eb017f6b2905e6399a5 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1348,7 +1348,7 @@ static int set_power_mgmt(struct wiphy *wiphy, struct net_device *dev,
 	if (!priv->hif_drv)
 		return -EIO;
 
-	wilc_set_power_mgmt(vif, enabled, timeout);
+	wilc_set_power_mgmt(vif, enabled);
 
 	return 0;
 }
diff --git a/drivers/net/wireless/microchip/wilc1000/hif.c b/drivers/net/wireless/microchip/wilc1000/hif.c
index bba53307b960d996032f56affead0cd0922902a4..3b14d560bc295844d873ed966592f031f6b50206 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.c
+++ b/drivers/net/wireless/microchip/wilc1000/hif.c
@@ -1932,7 +1932,7 @@ int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
 	return result;
 }
 
-int wilc_set_power_mgmt(struct wilc_vif *vif, bool enabled, u32 timeout)
+int wilc_set_power_mgmt(struct wilc_vif *vif, bool enabled)
 {
 	struct wilc *wilc = vif->wilc;
 	struct wid wid;
diff --git a/drivers/net/wireless/microchip/wilc1000/hif.h b/drivers/net/wireless/microchip/wilc1000/hif.h
index 96eeaf31d23777e0392699240479b341529bfd42..5ecf6ba293a598823d09de43b597f8d54d375a7c 100644
--- a/drivers/net/wireless/microchip/wilc1000/hif.h
+++ b/drivers/net/wireless/microchip/wilc1000/hif.h
@@ -192,7 +192,7 @@ int wilc_del_allstation(struct wilc_vif *vif, u8 mac_addr[][ETH_ALEN]);
 int wilc_del_station(struct wilc_vif *vif, const u8 *mac_addr);
 int wilc_edit_station(struct wilc_vif *vif, const u8 *mac,
 		      struct station_parameters *params);
-int wilc_set_power_mgmt(struct wilc_vif *vif, bool enabled, u32 timeout);
+int wilc_set_power_mgmt(struct wilc_vif *vif, bool enabled);
 int wilc_setup_multicast_filter(struct wilc_vif *vif, u32 enabled, u32 count,
 				u8 *mc_list);
 int wilc_remain_on_channel(struct wilc_vif *vif, u64 cookie, u16 chan,

-- 
2.48.0


