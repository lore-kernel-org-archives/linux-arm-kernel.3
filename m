Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AC2D11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lFvV4pIsDLWnAbmZyAdOTJZYJAocNppm+NL9MdS0/y0=; b=Sob83+S+42KET6xHbnLRarHeDd
	nB2q1s3dkNIhqVUoc/k2vsb/578P1nn/Mgz+AzfDrjO0q3H84gbN+KR/+PyinuneF+K8VBSLuhSEP
	SmWXPOefpjXaG093lZoOlDlm8V/j4ps/pwpRNgJL5etGOnK7UhHrN8638dwyaHZK9NtKj9XUzO/6j
	80Jl4BUlPtQH8u6pm53sYL5FYPhP1FQWGEgaW7y+MrpnBnHB6+M705qwKTOrBP8ce9Vq9wR3rKAvg
	LOa4UvZ1u+0CftxqTtaSySo1TaeLDRjGu2ln0UB3rGstGn2RYof2ncI5MnWZSzqNdOdMP6BtEXkmD
	CprZ/vxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZD6-0000000GNP4-3OAs;
	Thu, 27 Nov 2025 10:26:48 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOZD3-0000000GNM4-1PeY;
	Thu, 27 Nov 2025 10:26:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 33335C16A1C;
	Thu, 27 Nov 2025 10:26:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 708376072A;
	Thu, 27 Nov 2025 10:26:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C0F0102F275A;
	Thu, 27 Nov 2025 11:26:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764239194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lFvV4pIsDLWnAbmZyAdOTJZYJAocNppm+NL9MdS0/y0=;
	b=lWPPtEyMjs2+lAQ/ndRPyoApXSxEuBSRuO5MvPTgTBY/+XSq1eerRt7s6xaVmkjelp7W1f
	416ddSEWPnyfxy4eSHgieZcESh1ye8Jjzs4dxgw8CjIVnCZKAHqwlY7fkvF//WZhv8F2Ad
	wA6bfpUEykr7Oz+av1gpGrfAq6flT3j41e7Gts9tO4cXi/sh+GmQ0o/AhaQ4PPArA7xqUO
	Gy4X6znMCIR/9+FIqxfI8hJd/loPoc2HvirkiHOUiIzqEALJ8WZ3eq4eJtN218LFOy1++a
	qUAILd+aYh5OyQwTdP381XxKUcDw3FicZEA7AbqpgFrAdiaBpKByeF+ffzBmjw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 27 Nov 2025 11:26:17 +0100
Subject: [PATCH v2 2/2] phy: rockchip: inno-usb2: fix communication
 disruption in gadget mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251127-rk3308-fix-usb-gadget-phy-disconnect-v2-2-dac8a02cd2ca@bootlin.com>
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
X-CRM114-CacheID: sfid-20251127_022645_673288_90CFFDD0 
X-CRM114-Status: GOOD (  16.95  )
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

 * the first time chg_detect_work starts (6 seconds after gadget is
   configured and enumerated)
   -> rockchip_chg_detect_work():
       if chg_state is UNDEFINED:
          property_enable(base, &rphy->phy_cfg->chg_det.opmode, false); [Y]

 * rockchip_chg_detect_work() changes state and re-triggers itself a few
   times until it reaches the DETECTED state:
   -> rockchip_chg_detect_work():
       if chg_state is DETECTED:
          property_enable(base, &rphy->phy_cfg->chg_det.opmode, true); [Z]

At [Y] all existing communications stop. E.g. using a CDC serial gadget,
the /dev/tty* devices are still present on both host and device, but no
data is transferred anymore. The later call with a 'true' argument at [Z]
does not restore it.

Due to the lack of documentation, what chg_det.opmode does exactly is not
clear, however by code inspection it seems reasonable that is disables
something needed to keep the communication working, and testing proves that
disabling these lines lets gadget mode keep working. So prevent changes to
chg_det.opmode when there is a cable connected (VBUS present).

Fixes: 98898f3bc83c ("phy: rockchip-inno-usb2: support otg-port for rk3399")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/lkml/20250414185458.7767aabc@booty/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0106d7b7ae24..e5efae7b0135 100644
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
2.51.1


