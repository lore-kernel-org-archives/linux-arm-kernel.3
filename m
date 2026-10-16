Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCAFCCF2C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cKhcz6casj5nfFxlHJJdJQdg/yPnZi4Q+Y+embVqI+8=; b=P8NliIM+QoMHlyDru6/fjj2wgG
	gW3NEOwWztkIXW6nxUJ1uienRMtrDXLSn0AOSQwzLFs01MCaJBoD4u/IWR7WU6utPxqnZpsH8pHGF
	j+xbhw6uPD/Wstq9ghKxsMjknXWx+5Yq2KVbQB0henyHKB9IuSVKmaVah1Crh3CQM3NQZajPBeQWZ
	79ADne5R7Z1FD1EgEFkP7bcj6kEt7o6fU5ktAbHZKKP9Zo9I/ZCgyQJTjJ1wKnwqpQWwsyAW4iXp8
	kNXUlmm+1KC8886wT+P9PYL/p+OfzRmd0AHkSI2wzigTtC41IIGJ9I8K2kFlRM21uuDdWtxABxNrG
	97cUbW9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu8-00000003i0e-47vo;
	Fri, 16 Oct 2026 18:43:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu1-00000003hsI-3mey;
	Fri, 16 Oct 2026 18:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176214;
	bh=ajby+69181ATcgw6MxCUTCcnnZAWh+YZh/D1NNgYaPc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DC+hLVAXZ4r0scMw6U0rykjJrQjgru2Gots0AwEmTnxHZtajwa78hpWwCFP9VmfTt
	 roI9m3hbCuRT4ahJJw4fIM7MRa0sf+B89bNPTiCosUbd9wHXkcoF6CQmw+bjWBDTtJ
	 Gr4rDsS5ulxTZjuTu+MVOi8TcFrtpSkJvpgbudwwxJjnlh+jgwoy4vBRx3HkGWF8nB
	 k7KhGGGIGkYxkNXGjag6fU0CMsfgL3weP2RqMy4lywwDU61B6QrnDM8zKeFqnrgxm+
	 lUiKPzWJ9Y5MRZxl301w7tnnFAST3XyHW83pyUh9NM/ruwNRKyUGIBDvqfcx3zEtFx
	 darpnZc3JRN5w==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AC06217E1134;
	Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6219F48002F; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:18 +0200
Subject: [PATCH v17 2/7] phy: rockchip: usbdp: Add reset hook support for
 dwc3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-2-876f96893e2f@collabora.com>
References: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
In-Reply-To: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-0-876f96893e2f@collabora.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4662;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=ajby+69181ATcgw6MxCUTCcnnZAWh+YZh/D1NNgYaPc=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFbrZQcHhRObFIRq4D3q79ndKV0HDoYQU
 fWmakTPifYk4okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qa7kwP/2PNZdQaxgJAVv0xh915RrRj6q1RpKjKE9y5X/ICQJcUephy6RXIAWRHbMzRVMkGSWb
 Z8r9by4vOQ6qM6ks+K+be6tQ84X39Dzf97e8TH3uC+ffAKzNLZJQhEwVu4RfIzD6AJ5DJpZKcFM
 L+d3p5R1JhQ1RgEKYNNO1H53xeySJRJiothC2HCyOSS7AQF8U4ruPc+vV70axTbvzk53p3OfSl7
 vjnyEmwa0riVjJ8ZEOIWVADx9wNz2DvLOAG8S6fMd0JSTrhIRDNBtWgD34HfvIVWnGQPXGO3mFd
 aWSWoo1bUYUXtz4Vyrot6v6XXWi4NZ9sqwvz76gBLMZFW9HOsMxAr8OzRLtzidYKxvkikv9Fu1I
 33/vuW0u2PCoiWDmCEwbrLdahXN4s59bUiKNSl0MP1n77BFUW2eECvmGR2HXl8AV1DiGGkXq+zl
 xPQTnmfcfDFTFbDEsksZ8nYfea35OguVLUjZAQ3dZDAQT1x/rKMw5My2SU7LsJzvYvbFiy70CnW
 QXYJwQ5fWemGYCPVvTr/RIiegXH2R/2dsCSTIUyQ3R8ffBJ3x1Ci/FY2TNECmBJUDmAhs0BwrlE
 je+fpMZxmoXgEY6fDLuE7+37J6rDUptoH7bUY7A7gnpBAhne0h/I1KT9qT+Q4znw2NW3bQyeCCx
 fDuE+4IzFiPF9ga0aPcAyCQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114338_104779_A2E13746 
X-CRM114-Status: GOOD (  20.78  )
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

When TCPM (Type-C Port Manager) triggers a orientation or mux
change, the PHY needs to reset. This results in the PHY no longer
providing a clock to the USB controller. If the USB controller
registers are accessed without the clock, SErrors are generated.

This can be avoided by switching the clock provider for the USB
controller. But after switching the clock, the USB PHY sometimes does
not succeed to lock its "cmn ana lcpll" PLLs again. I suspect this is
due to a clock glitch and after some debugging figured out that this
can be avoided by disabling the USB controller's PIPE interface while
the PHY reset is ongoing.

Implement an API that allows the USBDP to actively request a reset
from DWC3 as a quirk.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 57 +++++++++++++++++++++++++++++--
 include/linux/phy/rockchip-usbdp.h        | 16 +++++++++
 2 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index db69dd24f73b..b396f286e785 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/phy/phy.h>
+#include <linux/phy/rockchip-usbdp.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
@@ -179,6 +180,9 @@ struct rk_udphy {
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
+	int (*dwc3_reset_handler)(void *data, int port, bool pre);
+	void *dwc3_reset_data;
+	int dwc3_reset_port;
 
 	/* utilized for DP */
 	struct gpio_desc *sbu1_dc_gpio;
@@ -995,6 +999,43 @@ static int rk_udphy_parse_dt(struct rk_udphy *udphy)
 	return rk_udphy_reset_init(udphy, dev);
 }
 
+static int rk_udphy_run_reset_handler(struct rk_udphy *udphy, bool pre)
+{
+	if (!udphy->dwc3_reset_handler)
+		return 0;
+
+	if (!(udphy->sw_mode & UDPHY_MODE_USB))
+		return 0;
+
+	return udphy->dwc3_reset_handler(udphy->dwc3_reset_data, udphy->dwc3_reset_port, pre);
+}
+
+void rk_udphy_unregister_reset_handler(struct phy *phy)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = NULL;
+	udphy->dwc3_reset_data = NULL;
+	udphy->dwc3_reset_port = 0;
+}
+EXPORT_SYMBOL(rk_udphy_unregister_reset_handler);
+
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     int (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port)
+{
+	struct rk_udphy *udphy = phy_get_drvdata(phy);
+
+	guard(mutex)(&udphy->mutex);
+
+	udphy->dwc3_reset_handler = reset_handler;
+	udphy->dwc3_reset_data = data;
+	udphy->dwc3_reset_port = port;
+}
+EXPORT_SYMBOL(rk_udphy_register_reset_handler);
+
 static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
@@ -1005,24 +1046,36 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		ret = rk_udphy_setup(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	} else if (udphy->phy_needs_reinit) {
+		rk_udphy_run_reset_handler(udphy, true);
+
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
 
 		ret = rk_udphy_init(udphy);
-		if (ret)
+		if (ret) {
+			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
+		}
 
 		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
+
+		rk_udphy_run_reset_handler(udphy, false);
 	}
 
 	udphy->status |= mode;
diff --git a/include/linux/phy/rockchip-usbdp.h b/include/linux/phy/rockchip-usbdp.h
new file mode 100644
index 000000000000..6923ac28303b
--- /dev/null
+++ b/include/linux/phy/rockchip-usbdp.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Rockchip USBDP Combo PHY with Samsung IP block driver
+ *
+ * Copyright (C) 2026 Collabora Ltd
+ */
+
+#ifndef __ROCKCHIP_USBDP
+#define __ROCKCHIP_USBDP
+
+void rk_udphy_unregister_reset_handler(struct phy *phy);
+void rk_udphy_register_reset_handler(struct phy *phy,
+				     int (*reset_handler)(void *data, int port, bool pre),
+				     void *data, int port);
+
+#endif

-- 
2.53.0


