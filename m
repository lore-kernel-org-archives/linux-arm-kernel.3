Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FE9C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 15:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f0QDXdrnVYdl2WcxZmvLO4vqnkGNCkcX//xPR9QV5j4=; b=B2BGrJSptB4JhdQj0TXaXwfM5L
	WbVUn3zqjgeI/n2Eh+d6JTAFUQuUuW1DsCPFd2ihLiaPwBu3/tqPvwiNQ7fOxh3Y0ODxraTvI8yqG
	wwieVE7RCyjujfCZIJdDPQHHeH2ODNZJyy/brgKnMP8//9MOXn24+DhN6abvhELRNyvp7UpzxVFcz
	cT+4DE9cVihb5nu0ALMD9RqKVmx3K0o+ajmLWXePRkw2Y+OFU59Yn/XSdP00cs4EWCd14R99HpvsT
	t0KKhvm31VlG+qI6r7R+mlbfdiXNGmJXFbUsmYhrU+7Mw/L3lNvXggAoITBA50MUKWYUuPaN6RWvM
	NJe/cjWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiF6B-00000007xSp-2Uj6;
	Wed, 12 Feb 2025 15:56:27 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiExs-00000007uxf-3yly
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:47:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 215B14318E;
	Wed, 12 Feb 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f0QDXdrnVYdl2WcxZmvLO4vqnkGNCkcX//xPR9QV5j4=;
	b=OJGKYxq1p8fQMxq/s+dbAehrnUH1vUoJgKdDfQzN/kLeINzgAdHGOH9scjrtLCWCJoCzdJ
	KPYnJ/+u856gAgcYxI0hMRNKgfH9FMQvubkV8fqnOqDJpzC/YBWyqE4iUFdUPQvHa2Lx8R
	XUJDmzm58mYI3QUxOvPIeJyalj2msDNUc+a24r+N2SCZIoedTj3FpHQ7QVQmtOc+mmHCsS
	C7XBTU2u2zpA3TMV+8nPxorGCQiVuhOvxEB8iHH9n5yZh/2NWgKusrHOtmGDRWRi3XHfJv
	9gH68xFvZvOfotnHyP5zIAbnHCcyh3FzytHAh8UuBbRR1+Pak28+uT98Eq41aw==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:23 +0100
Subject: [PATCH 04/12] wifi: wilc1000: allow to use acquire/release bus in
 other parts of driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-4-9609b784874e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250212_074753_122104_9CBF1DAC 
X-CRM114-Status: GOOD (  12.54  )
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

acquire_bus/release_bus is currently used only in wlan.c when needing to
access the main bus (SDIO or SPI). For wilc3000, the bluetooth part will
also need to perform some operations on the main bus (eg: bluetooth
firmware loading), so expose acquire/release_bus.

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 drivers/net/wireless/microchip/wilc1000/wlan.c | 5 +++--
 drivers/net/wireless/microchip/wilc1000/wlan.h | 3 +++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.c b/drivers/net/wireless/microchip/wilc1000/wlan.c
index f2b13bd44273ebe2ee474eda047e82bf1287bd6e..a697caf73ac3ed06602c029c17773f50e3f8edb5 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.c
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.c
@@ -743,7 +743,7 @@ static int chip_wakeup(struct wilc *wilc)
 		return chip_wakeup_wilc3000(wilc);
 }
 
-static inline int acquire_bus(struct wilc *wilc, enum bus_acquire acquire)
+int acquire_bus(struct wilc *wilc, enum bus_acquire acquire)
 {
 	int ret = 0;
 
@@ -757,12 +757,13 @@ static inline int acquire_bus(struct wilc *wilc, enum bus_acquire acquire)
 	return ret;
 }
 
-static inline int release_bus(struct wilc *wilc, enum bus_release release)
+int release_bus(struct wilc *wilc, enum bus_release release)
 {
 	int ret = 0;
 
 	if (release == WILC_BUS_RELEASE_ALLOW_SLEEP && wilc->power_save_mode)
 		ret = chip_allow_sleep(wilc);
+
 	mutex_unlock(&wilc->hif_cs);
 
 	return ret;
diff --git a/drivers/net/wireless/microchip/wilc1000/wlan.h b/drivers/net/wireless/microchip/wilc1000/wlan.h
index 65e79371014d9e60755cb0aa38e04d351e67bcfb..e45c2db0f5cd2de6844993dde15034ebbd93e73b 100644
--- a/drivers/net/wireless/microchip/wilc1000/wlan.h
+++ b/drivers/net/wireless/microchip/wilc1000/wlan.h
@@ -475,4 +475,7 @@ int wilc_wlan_init(struct net_device *dev);
 int wilc_get_chipid(struct wilc *wilc);
 int wilc_load_mac_from_nv(struct wilc *wilc);
 
+int acquire_bus(struct wilc *wilc, enum bus_acquire acquire);
+int release_bus(struct wilc *wilc, enum bus_release release);
+
 #endif

-- 
2.48.0


