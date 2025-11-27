Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F314CD116F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ty06Lu9jM47nhD5kJlUx5SDRAvr8cRr/zqTlMHAryT0=; b=4tXbjdV+hhGIPtGBUvExIWfIQj
	LNg6IWvLqH1Bkt0dMP/KRDIcevD3OrLnUDugVJcFjcE166DWD/KI/UYonN7JSEY5glY0uNRw6eKMM
	Csvb0UVTdqQKVp9mX6pTM/+T7j3zA10khk4xfR3ptM1dxNq8dYNqcetXZ2n/EtZF/GTLPmha/Uvg/
	ZJvjfVtPJzC+jnWs43XafynC67ceIc+M9ddyRSLXPZhcicVOEJZYpCFc3JZ43NA0Yo9EKl9j68KEz
	9Cez00u8Z0es03ICCU4gTkzuRoSs3p3OXmh00NzYzCYnPpzMV+9Eymj+7ucQ4f156tiy95xJc9x84
	inFzaHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZCy-0000000GNKP-3gvr;
	Thu, 27 Nov 2025 10:26:40 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZCs-0000000GNGU-2I22
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 10:26:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 231CD4E4191F;
	Thu, 27 Nov 2025 10:26:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E90836068C;
	Thu, 27 Nov 2025 10:26:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24E03102F275B;
	Thu, 27 Nov 2025 11:26:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764239191; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ty06Lu9jM47nhD5kJlUx5SDRAvr8cRr/zqTlMHAryT0=;
	b=Wc30LcY70goGq8iaS1mGSVu5Y0iZMA/xWEDEr+bupHRRWd7a9GFE4e4teqRSRR6pyVB8YE
	LnD7SV+r4SZYeNSIfoNG9i4+OcYNZEK7xVh1prdAx2i2dHSui/cnQOXTPfhHPKmmiBJFV7
	+kF9yO9uwv/QdeZYARzn8IIdcYZk61+6j6gi/hk1XjzE41HTEiFtaAkus8pN9otPj1Yws+
	8haIUY2u3HFmraaWVyjR77tXzDgy/9M+FO/rSUH7vFAbuYD0d5sq5S3ZYyNI0sOYlBOY+N
	kK4iKRJsX80WCzOi2a+Yd+C74H+JV97zYul1k05CSPggeWkmJDTn9x2wIsY0PA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 27 Nov 2025 11:26:16 +0100
Subject: [PATCH v2 1/2] phy: rockchip: inno-usb2: fix disconnection in
 gadget mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-rk3308-fix-usb-gadget-phy-disconnect-v2-1-dac8a02cd2ca@bootlin.com>
References: <20251127-rk3308-fix-usb-gadget-phy-disconnect-v2-0-dac8a02cd2ca@bootlin.com>
In-Reply-To: <20251127-rk3308-fix-usb-gadget-phy-disconnect-v2-0-dac8a02cd2ca@bootlin.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, William Wu <wulf@rock-chips.com>
Cc: Kever Yang <kever.yang@rock-chips.com>, 
 Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>, 
 Alan Stern <stern@rowland.harvard.edu>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_022634_841142_7A5D970A 
X-CRM114-Status: GOOD (  16.81  )
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

When the OTG USB port is used to power the SoC, configured as peripheral
and used in gadget mode, there is a disconnection about 6 seconds after the
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

The code already checks for !rport->suspended (which, somewhat
counter-intuitively, means the PHY is powered on), so add a guard for VBUS
as well to avoid a disconnection when a cable is connected.

Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk3399")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index b0f23690ec30..0106d7b7ae24 100644
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
2.51.1


