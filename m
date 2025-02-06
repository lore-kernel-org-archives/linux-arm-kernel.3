Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2103CC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 13:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mv0wdh7SmM7WMLkdwxSV1wkm7zvheEOu8m9g8tZ+KPI=; b=eayO//TKKR+oYSR1tc/GTGuUpx
	AcDtevl4fmJ2EGFK0MFcMdE/2Z1cw1MyC+AG3vMe0pcKJazRFmzQRquAZsXO6aeb+LfyrpQOYax7s
	sTwZZRCvaL0seZCHqyiISln+kgXQCKrzi3O5HHmuY9GLI2BXk/MnYi2JZgmPipKMB4ALIcibADZjH
	gWSjxMRnlV8btaSuvdYZN1hBdMItVIPEwvjvKLp6XHXh5jZcuTLeH4g9v8p3VraJaMnc14tDO/bnw
	MOFuMTP3PyjM9IYVobH411lBGRoFRYgv9MD+M/tZQW7r69cSfYq2/U8myGvUzl25cATL/ERwBTEaM
	588lEPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1VX-00000006Kp3-23HS;
	Thu, 06 Feb 2025 13:01:27 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg1U3-00000006KcS-1Rc5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 12:59:56 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Cxmmr3553666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 06:59:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738846788;
	bh=Mv0wdh7SmM7WMLkdwxSV1wkm7zvheEOu8m9g8tZ+KPI=;
	h=From:To:CC:Subject:Date;
	b=XrTLxR5wO8p6ersm33yDywbwUdJb5nIdCWOIuRR2+l8AnSWrgBBsCi40/sqGEZ9qq
	 TRNHphQJO7WGmGZn2oiSJ8YrYp3kDbFjuilteo542lDVMKNSRma3Y/b+XGTqjm8M7X
	 qW7ubqUEzu+OWEbVngTMOgwR7fLGI7RIeChkMwuo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Cxm5T012943
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 06:59:48 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 06:59:48 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 06:59:48 -0600
Received: from uda0492258.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516CxhVf101205;
	Thu, 6 Feb 2025 06:59:44 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <peter.chen@kernel.org>, <pawell@cadence.com>, <rogerq@kernel.org>,
        <gregkh@linuxfoundation.org>, <balbi@kernel.org>, <jun.li@nxp.com>
CC: <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH] usb: cdns3: exit cdns3_gadget_udc_start if FAST_REG_ACCESS cannot be set
Date: Thu, 6 Feb 2025 18:29:36 +0530
Message-ID: <20250206125943.786949-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_045955_472466_62499F9F 
X-CRM114-Status: GOOD (  14.47  )
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

When the device is in a low power state, access to the following
registers takes a long time:
- EP_CFG
- EP_TRADDR
- EP_CMD
- EP_SEL
- EP_STS
- USB_CONF

To address this, the fast register access feature can be enabled by
setting PUSB_PWR_FST_REG_ACCESS bit of the USB_PWR register, which
allows quick access by software. Software is expected to poll on
PUSB_PWR_FST_REG_ACCESS_STAT to ensure that fast register access has
been enabled by the controller. Attempting to access any of the
aforementioned registers after setting PUSB_PWR_FST_REG_ACCESS but
before PUSB_PWR_FST_REG_ACCESS_STAT has been set will result in
undefined behavior and potentially result in system hang.

Hence, poll on PUSB_PWR_FST_REG_ACCESS_STAT before proceeding with
gadget configuration, and exit if it cannot be enabled.

Fixes: b5148d946f45 ("usb: cdns3: gadget: set fast access bit")
Cc: <stable@vger.kernel.org>
Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
---

Hello,

This patch is based on commit
92514ef226f5 Merge tag 'for-6.14-rc1-tag' of git://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
of Mainline Linux.

Regards,
Siddharth.

 drivers/usb/cdns3/cdns3-gadget.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-gadget.c b/drivers/usb/cdns3/cdns3-gadget.c
index fd1beb10bba7..b62691944272 100644
--- a/drivers/usb/cdns3/cdns3-gadget.c
+++ b/drivers/usb/cdns3/cdns3-gadget.c
@@ -2971,8 +2971,6 @@ static void cdns3_gadget_config(struct cdns3_device *priv_dev)
 	/* enable generic interrupt*/
 	writel(USB_IEN_INIT, &regs->usb_ien);
 	writel(USB_CONF_CLK2OFFDS | USB_CONF_L1DS, &regs->usb_conf);
-	/*  keep Fast Access bit */
-	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
 
 	cdns3_configure_dmult(priv_dev, NULL);
 }
@@ -2990,6 +2988,8 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
 	struct cdns3_device *priv_dev = gadget_to_cdns3_device(gadget);
 	unsigned long flags;
 	enum usb_device_speed max_speed = driver->max_speed;
+	int ret;
+	u32 reg;
 
 	spin_lock_irqsave(&priv_dev->lock, flags);
 	priv_dev->gadget_driver = driver;
@@ -2997,6 +2997,20 @@ static int cdns3_gadget_udc_start(struct usb_gadget *gadget,
 	/* limit speed if necessary */
 	max_speed = min(driver->max_speed, gadget->max_speed);
 
+	/*  keep Fast Access bit */
+	writel(PUSB_PWR_FST_REG_ACCESS, &priv_dev->regs->usb_pwr);
+	reg = readl(&priv_dev->regs->usb_pwr);
+	if (!(reg & PUSB_PWR_FST_REG_ACCESS_STAT)) {
+		ret = readl_poll_timeout_atomic(&priv_dev->regs->usb_pwr, reg,
+						(reg & PUSB_PWR_FST_REG_ACCESS_STAT),
+						10, 1000);
+		if (ret) {
+			dev_err(priv_dev->dev, "Failed to enable fast access\n");
+			spin_unlock_irqrestore(&priv_dev->lock, flags);
+			return ret;
+		}
+	}
+
 	switch (max_speed) {
 	case USB_SPEED_FULL:
 		writel(USB_CONF_SFORCE_FS, &priv_dev->regs->usb_conf);
-- 
2.43.0


