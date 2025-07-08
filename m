Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F3DFC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qWsk8ZwHDgxqYRwHFFMeZK+uhE/KHO9DpLNrBBEM2ik=; b=ED07MWF+kD7YPM6IEXopkxSqiY
	3SnRzJXlxrWQV85n0mNYuIZAnYYxmNsjydfKbGXWPQO23YaQYzd/OzXFpPkMDR7gkhtum+ZIqJe6V
	Qf0ZJMK0mjnQhrS9z8UBT/Rg5GfY8oUV+AnZQ/P6vudIqHJkjXm/vnvK6FiCEBud3UdKZ5TWe3tJ3
	2psPcNnsSsPh374yj056EllKnySWKYSJ8WlpDTG7VmjrAAUuDWfc7BKgU0+bwCl+zPChyPOeKi1HC
	iXmfzJJqBrEqEynyI7qIszkspnbT5K8uoaM/QIQoFpJqK0tI/3B65bdYcKnahZ/Ki7bTHghP4pbn+
	LxHoq5cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC5W-0000000674v-3D51;
	Tue, 08 Jul 2025 17:26:38 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBXx-000000061Fd-1M9e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 16:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=qWsk8ZwHDgxqYRw
	HFFMeZK+uhE/KHO9DpLNrBBEM2ik=; b=Yl9rFPHB+UQOpXdume2OML+tQvwGWaA
	WxqYuy2HVfemmvq97tBl0ud9qt7mfqnwyWoxUALB2pP8142yvWtnwG/gHwRWhQaa
	WdX84sR4eO8l5KUOyXc2hmYwCiOpgKeXNXC2zdKuGgH+JHG/eJKkIPPf3+VAvS5i
	rmok7Iri9uMM=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3YqRnTG1oypwxDg--.1262S2;
	Wed, 09 Jul 2025 00:51:01 +0800 (CST)
From: Lizhe <sensor1010@163.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com,
	sensor1010@163.com
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] net: stmmac: Support gpio high-level reset for devices requiring it
Date: Tue,  8 Jul 2025 09:50:44 -0700
Message-Id: <20250708165044.3923-1-sensor1010@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wC3YqRnTG1oypwxDg--.1262S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF15Aw17Zr48JF1kKr1kuFg_yoW8Ar48p3
	yrua4UZr97Jr13tw4kXw48Zr95Ka93tr40k3Wfu3yS9rWDWFZIqr1a9rW3XFy3KrZ5uFya
	vw1UCF13Zan0yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-Originating-IP: [112.23.164.54]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKBKEq2htS5kM0AAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_095157_784204_A6A21C65 
X-CRM114-Status: GOOD (  10.69  )
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

some devices only reset when the GPIO is at a high level, but the
current function lacks support for such devices. add high-level
reset functionality to the function to support devices that require
high-level triggering for reset

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 836f2848dfeb..cb989e6d7eac 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -458,6 +458,7 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 #ifdef CONFIG_OF
 	if (priv->device->of_node) {
+		int active_low = 0;
 		struct gpio_desc *reset_gpio;
 		u32 delays[3] = { 0, 0, 0 };
 
@@ -467,6 +468,9 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (IS_ERR(reset_gpio))
 			return PTR_ERR(reset_gpio);
 
+		if (reset_gpio)
+			active_low = gpiod_is_active_low(reset_gpio);
+
 		device_property_read_u32_array(priv->device,
 					       "snps,reset-delays-us",
 					       delays, ARRAY_SIZE(delays));
@@ -474,11 +478,11 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (delays[0])
 			msleep(DIV_ROUND_UP(delays[0], 1000));
 
-		gpiod_set_value_cansleep(reset_gpio, 1);
+		gpiod_set_value_cansleep(reset_gpio, active_low ? 1 : 0);
 		if (delays[1])
 			msleep(DIV_ROUND_UP(delays[1], 1000));
 
-		gpiod_set_value_cansleep(reset_gpio, 0);
+		gpiod_set_value_cansleep(reset_gpio, active_low ? 0 : 1);
 		if (delays[2])
 			msleep(DIV_ROUND_UP(delays[2], 1000));
 	}
-- 
2.17.1


