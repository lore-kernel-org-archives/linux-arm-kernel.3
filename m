Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A49C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lL0vBxv9N/cBdRGCto9TruzZjRh7DSP5woNWAvZPKD8=; b=piHYdOrTMYSatJQQpbePednBGt
	6kx2fNaK0M+FSYUOahfoTeXeSilycFMVYLswEmmH49VREoRDWYLBBs5ckaLoSSi8gcME9ZZrTe7K0
	nHxKXqr2pIspowPh9KuJQ2rSnN7htMgbbbts7/V8pqXqfRZ0GsPG5kCOjJBwAmANVuP7GTaDQlAKY
	Cjz+pqF+Imemyug6W3QJySAuAH7+lBNwu4IaZEAfKgXXfutu176UCdfuWqNAA0dHRWLKJ04hRYQ0n
	OulETFhvJXdh6gYZaMtxkadBx5DSc3m6YAtcOJl8XFXW0AM0dAwJHRe7j/tq1AuyKhZbTxTESbREr
	5ymSwJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8ip-00000001u1O-1JR6;
	Tue, 22 Jul 2025 08:51:39 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue8bO-00000001rkK-0pZ2;
	Tue, 22 Jul 2025 08:44:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CAD2431FC;
	Tue, 22 Jul 2025 08:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753173836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lL0vBxv9N/cBdRGCto9TruzZjRh7DSP5woNWAvZPKD8=;
	b=NUPWCHsYkURdekhDUMdZwqGKFREk6+4V2tal/89Cg+5EABkccB+EcustxKaIbxe6RRaK3T
	81LsIvBcwO9uoSd+jS+5AwhkqkFrKVLYPnOVujqGc9w4Afl5EABBq2b3alD5dJvWTB2DA9
	z/d9lL0TydRL+SVxzqF+RhkAmXqds4bJZXcYJ7FyrFCPDMOnUhkPAkLaf3KNH6RyRdGzH2
	adVV/liPPzNq7ubSIZPsETYA6ScqpqS/+7DYLlBCNu5lpHHv/GD15tcnZ+RsxeGY2AMcZf
	t9xI66f+YJ1n6/jd5p0Uf0ktCzTfBiIzn5yqqN8pgwD+8qOTBKthwb37A9E9xA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 22 Jul 2025 10:43:44 +0200
Subject: [PATCH 2/2] phy: rockchip: inno-usb2: fix communication disruption
 in gadget mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-rk3308-fix-usb-gadget-phy-disconnect-v1-2-239872f05f17@bootlin.com>
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
X-CRM114-CacheID: sfid-20250722_014358_972498_1C44E0C3 
X-CRM114-Status: GOOD (  17.76  )
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

When the OTG USB port is used to power to SoC, configured as peripheral and
used in gadget mode, communication stops without notice about 6 seconds
after the gadget is configured and enumerated.

The problem was observed on a Radxa Rock Pi S board, which can only be
powered by the only USB-C connector. That connector is the only one usable
in gadget mode. This implies the USB cable is connected from before boot
and never disconnects while the kernel runs.

The related code flow in the PHY driver code can be summarized as:

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
            property_enable(base, &rphy->phy_cfg->chg_det.opmode, false); [Y]

 * rockchip_chg_detect_work() changes state and re-triggers itself a few
   times until it reached the DETECTED state:
   -> rockchip_chg_detect_work():
       if chg_state is DETECTED:
            property_enable(base, &rphy->phy_cfg->chg_det.opmode, true); [Z]

At [Y] there is no disconnection and the USB device appears still present
to userspace, but all existing communications stop. E.g. using a CDC serial
gadget, the /dev/tty* devices are still present on both host and device,
but no data is transferred anymore. The later call with a 'true' argument
at [Z] does not restore it.

Due to the lack of documentation, what chg_det.opmode does exactly is not
clear, however by code inspection it seems reasonable that is disables
something needed to keep the communication working, and testing proves that
disabling these lines lefs gadget mode keep working. So prevent changes to
chg_det.opmode when there is a cable connected (VBUS present).

Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk3399")
Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0106d7b7ae24ead91d9c996daaa56671de02a39a..e5efae7b013590f5b0bf65654008cdc167f52e3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -833,7 +833,8 @@ static void rockchip_chg_detect_work(struct work_struct *work)
 		if (!rport->suspended && !vbus_attach)
 			rockchip_usb2phy_power_off(rport->phy);
 		/* put the controller in non-driving mode */
-		property_enable(base, &rphy->phy_cfg->chg_det.opmode, false);
+		if (!vbus_attach)
+			property_enable(base, &rphy->phy_cfg->chg_det.opmode, false);
 		/* Start DCD processing stage 1 */
 		rockchip_chg_enable_dcd(rphy, true);
 		rphy->chg_state = USB_CHG_STATE_WAIT_FOR_DCD;
@@ -896,7 +897,8 @@ static void rockchip_chg_detect_work(struct work_struct *work)
 		fallthrough;
 	case USB_CHG_STATE_DETECTED:
 		/* put the controller in normal mode */
-		property_enable(base, &rphy->phy_cfg->chg_det.opmode, true);
+		if (!vbus_attach)
+			property_enable(base, &rphy->phy_cfg->chg_det.opmode, true);
 		rockchip_usb2phy_otg_sm_work(&rport->otg_sm_work.work);
 		dev_dbg(&rport->phy->dev, "charger = %s\n",
 			 chg_to_string(rphy->chg_type));

-- 
2.50.1


