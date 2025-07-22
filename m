Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E45C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TpC2CuLLVKImVsax3ves5ivKtHIs3qQIrkEy2aJN8Cc=; b=3RDnygcTMQF41NZOIYVWt6JPVv
	jhT/lzsFaMDxWbfO7JUtlpc4IwCh4Wttkqw6SEUf3f9nE3FDItENGCprqK4EDREthYZn6HugXvA5t
	93s/9ypXZuWC+nhjOudO+k+wj9lRhs+lzh6wGSsLXEBatRKYJG577URqqNzApRLYAZ/RpqJHrSsAQ
	FN1LkmdhGqqUeiy5H3kEtovMHcchhcClX+n4Hi2N250U+HEwu59+/mcDO+C2lKbq8qTLbI5P1WW3P
	aH0trzqqPFXWMkZfLZHK/I35Txx5SrkfJ5KDmPck6oBqG2nTPB7+XPRMGhPe9bPSuwxJJ3FQQF8T5
	JRjfjZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8dt-00000001sGf-08uV;
	Tue, 22 Jul 2025 08:46:33 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8bO-00000001rjt-0tvx;
	Tue, 22 Jul 2025 08:44:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 99F37431F2;
	Tue, 22 Jul 2025 08:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753173834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TpC2CuLLVKImVsax3ves5ivKtHIs3qQIrkEy2aJN8Cc=;
	b=eQFfUCmX3KsNmIset3YASPBzN2xYqBJB90c0VNm9Gg5aC00xQ3zKarLQuDpjMo6OHRcjcl
	jJxl1HGe0I1BYTpqRI+8LRxHS7/mdx8Qz6iZIzIbyPhBVYmSZNF7drizRiJ+0kYjmxG2ds
	It3RKjfnNaWXOYIoKfaJVMN4zHu/o0PR5h6O/QKksFVebQn2JYjvy97VFhNNakcx11tz6Q
	pYkYCRd7tDB917gLwig8DgoNY6PiwC6Kq6Gbrp0FU6u0oLEVGn303/DgDf4olqbEysmx3g
	dm5FNRz+xL0ENftjnZYfbnMeKApKNsi6eZg4bJKn7FveVVoSBrPMMCizBnk7ew==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 22 Jul 2025 10:43:43 +0200
Subject: [PATCH 1/2] phy: rockchip: inno-usb2: fix disconnection in gadget
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-1-239872f05f17@bootlin.com>
References: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
In-Reply-To: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-0-239872f05f17@bootlin.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, William Wu <wulf@rock-chips.com>
Cc: Kever Yang <kever.yang@rock-chips.com>, 
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheejgfdugedvudekgeevtdfgudduhedtgfetfeevgfehkeejhedviefhtdffhfeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvpdhhvghloheplgduledvrdduieekrddujeekrdejhegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudeipdhrtghpthhtohepvhhkohhulheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhgvrhdrhigrnhhgsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgri
 iiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopefoihhnrghsrdfjrghruhhthihunhihrghnsehshihnohhpshihshdrtghomhdprhgtphhtthhopehhvghikhhosehsnhhtvggthhdruggvpdhrtghpthhtohepfihulhhfsehrohgtkhdqtghhihhpshdrtghomhdprhgtphhtthhopehkihhshhhonheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: luca.ceresoli@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_014358_971432_988973B7 
X-CRM114-Status: GOOD (  15.82  )
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

When the OTG USB port is used to power to SoC, configured as peripheral and
used in gadget mode, there is a disconnection about 6 seconds after the
gadget is configured and enumerated.

The problem was observed on a Radxa Rock Pi S board, which can only be
powered by the only USB-C connector. That connector is the only one usable
in gadget mode. This implies the USB cable is connected from before boot
and never disconnects while the kernel runs.

The problem happens because of the PHY driver code flow, summarized as:

 * UDC start code (triggered via configfs at any time after boot)
   -> phy_init
       -> rockchip_usb2phy_init
           -> schedule_delayed_work(otg_sm_work [A], 6 sec)
   -> phy_power_on
       -> rockchip_usb2phy_power_on
           -> enable clock
           -> rockchip_usb2phy_reset

 * Now the gadget interface is up and running.

 * 6 seconds later otg_sm_work starts [A]
   -> rockchip_usb2phy_otg_sm_work():
       if (B_IDLE state && VBUS present && ...):
           schedule_delayed_work(&rport->chg_work [B], 0);

 * immediately the chg_detect_work starts [B]
   -> rockchip_chg_detect_work():
       if chg_state is UNDEFINED:
           if (!rport->suspended):
               rockchip_usb2phy_power_off() <--- [X]

At [X], the PHY is powered off, causing a disconnection. This quickly
triggers a new connection and following re-enumeration, but any connection
that had been established during the 6 seconds is broken.

The code already checks for !rport->suspended, so add a guard for VBUS as
well to avoid a disconnection when a cable is connected.

Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk3399")
Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b0f23690ec3002202c0f33a6988f5509622fa10e..0106d7b7ae24ead91d9c996daaa56671de02a39a 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -821,14 +821,16 @@ static void rockchip_chg_detect_work(struct work_struct *work)
 		container_of(work, struct rockchip_usb2phy_port, chg_work.work);
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(rport->phy->dev.parent);
 	struct regmap *base = get_reg_base(rphy);
-	bool is_dcd, tmout, vout;
+	bool is_dcd, tmout, vout, vbus_attach;
 	unsigned long delay;
 
+	vbus_attach = property_enabled(rphy->grf, &rport->port_cfg->utmi_bvalid);
+
 	dev_dbg(&rport->phy->dev, "chg detection work state = %d\n",
 		rphy->chg_state);
 	switch (rphy->chg_state) {
 	case USB_CHG_STATE_UNDEFINED:
-		if (!rport->suspended)
+		if (!rport->suspended && !vbus_attach)
 			rockchip_usb2phy_power_off(rport->phy);
 		/* put the controller in non-driving mode */
 		property_enable(base, &rphy->phy_cfg->chg_det.opmode, false);

-- 
2.50.1


