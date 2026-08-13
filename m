Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFEEC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckNcC/aE9HjmIz9fkheZH7IRF4LnGTb+595G2ppiiUI=; b=hXWhnQP2lb2yvPLR5RlXXqqu4k
	3mpF57YDMOFb6Jqz2ijSTH8rcJoQ0O62urgb3DwdD9qnrk2jxodYItQO5z1Hi6g+/WVp8d1Os1j4j
	yoaNrl8Vh/M4DXi11zjrEWe2qaoeoes5gi5Y+6SkxOJmig09roT66nkVo8jjRoPsd89f6/wV7E+9d
	QUQb3eSrnfR8vKYJs1Bx9jvplhTBiMAblA/z9DVrJmFfS20GevhTIhympTidcCe92jzmHa4xtNJpw
	R60UWbgH2g99HAFeCgA3P5TAet/wVbdEfWsx6EA3OHzmYHTAREjNWEGhfdhxp8bQHICL1QIoJsSDC
	dtVv+bUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUv-00000001b3i-3EVQ;
	Thu, 13 Aug 2026 20:58:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucUo-00000001axe-3wn7;
	Thu, 13 Aug 2026 20:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654668;
	bh=Oiytd4+YGwSR5avjv6SniM6ZOVwd4g+U70BRp49fXfI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ivFdXVyzZQZgWItML1tdBuodVlShSiteYRZSQc6bGegPuHNDQO3t2G+5VYgphUdZx
	 cGp3OKdspIr8YG9uzCwioegiqJaQhKDd9dti+mfkMzdx+AFEtpUkdEColFV+U8OjII
	 EtMFWW2dk0P6LSySZAGnKeqKQy0c/mJZd0NfibGEaly4pMBCHt4KbTTox2A0wGPKxr
	 tE76RwtXHZ7qDAdbYpZCqvxhc9zukSca5K+7Rfytn6ypudfsbYFw5ngMPdu5lhKmYF
	 UAmXrM5s9WHcSWxj4zHpODYbWzuJ5DX5tI9DccpktxS7HkMsXgGsoB0larW9V0rACa
	 d9P3Rw3R8y51A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 922CA17E0F35;
	Thu, 13 Aug 2026 22:57:48 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C502C480075; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:14 +0200
Subject: [PATCH v14 31/38] usb: dwc3: rockchip: support PHY reset
 notifications
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-31-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, Igor Paunovic <royalnet026@gmail.com>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5625;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Oiytd4+YGwSR5avjv6SniM6ZOVwd4g+U70BRp49fXfI=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmXHe9UD3cULi1qAVfg/t32GszCSGhw+c
 tDV1Scj62QqAYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qabuoP/Al3k3HBe/vEANaeOo08ZrFL4idG14xXHSnPGb4FKchn3v4K6IXnV6+gLO+uByJGpfb
 uGvv91GT+swQ4f/oUJa6goInZs5zfY3lNCyQ36Cp45ywiMAk5P8glGP4dw5HmKH1h5ZnJyHOEuR
 rtufrSMZRgzIAsmYK3UboWyRhI3tQHSYZhlhgS3k9RXNbuCcG8N6hmkf0aFcl7/b3+F0OoUwrIX
 ekBZ8Cz7XSyZ11lCA9WvR1NG5VUBB6/utj0YhQ8fv2zBEV8uHWgcs+hRMSquNi7ktLQ3IrxnV35
 OQ8JqEpCnMX3WFIadcL+QU7ORf0ZmEJ50lYkHrkCKTsK/Mtd20UbObt3Bo8tq3HeBEpZxqwz08a
 +iORcm+9lCGk+b7omzblisfe90kD8drkBrHhmuJe8jspCzJbZ81aegPf7MQCgKtPqdmNMw1guFX
 dhRm5pJCRX5oIBcbvNWNCXQWqTCCoDelB4CDUWYemexYvw39oHjvJQ5AM5Rn5MLLXF39EhZKxUT
 h+rVCg3u+XMFPfXHFCwTIP9vGDmXLpFuh1r/qoevAU0rfyBPiXIne5vj9SmV/2RmVDy/vaf2irl
 cL6DNf6O+oNfNP/X3xYNvVfFjr4pLSbD+5xm7/MMris0ZgB6GEIO2g7WDbxtejJlpXPACm85Otx
 Y1cyNtjMP3s2iCovsU9ow1w==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135751_141125_E208C238 
X-CRM114-Status: GOOD (  21.86  )
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

On recent Rockchip platforms (at least RK3588 & RK3576), DWC3 IP is used
with a USBDP PHY providing USB3 and DP. This PHY needs to be reset when
the mode changes, which may happen when plugging in different USB-C
devices.

If the USBDP PHY resets with the DWC3 IP running, its internal state
corrupts resulting in the USBDP PHY not being able to lock some PLL
clocks, which effectively renders USB3 unusable.

To fix the issue this adds handling for the new PHY framework reset
notifications, which will assert PHYSOFTRST before the actual PHY
is disabled and will deassert it once the PHY returns.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 127 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 126 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 1df33625b69f..9e91e5f7e53d 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -2,11 +2,136 @@
 /* Copyright (c) 2026, Collabora Ltd. */
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/phy/phy.h>
 #include <linux/pm_runtime.h>
 #include "glue.h"
+#include "io.h"
+
+struct dwc3_rockchip;
+
+/**
+ * struct dwc3_rk_phy_nb - wrapper for PHY notifier block
+ * @nb: notifier block
+ * @dwc: back-pointer to the DWC3 controller
+ * @port_index: USB3 port index this notifier is registered for
+ */
+struct dwc3_rk_phy_nb {
+	struct notifier_block	nb;
+	struct dwc3_rockchip	*dwc_rk;
+	u8			port_index;
+};
 
 struct dwc3_rockchip {
 	struct dwc3		dwc;
+	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
+	u8			phy_reset_active;
+};
+
+static int dwc3_usb3_phy_notify(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct dwc3_rk_phy_nb *pnb = container_of(nb, struct dwc3_rk_phy_nb, nb);
+	struct dwc3_rockchip *dwc_rk = pnb->dwc_rk;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int port = pnb->port_index;
+	unsigned long flags;
+	u32 reg;
+	int ret;
+
+	switch (action) {
+	case PHY_NOTIFY_PRE_RESET:
+		/*
+		 * If already suspended, the resume path will reinit GUSB3PIPECTL
+		 * via dwc3_core_init(). A forced resume is not possible as that
+		 * would call phy_init() resulting in a deadlock. Due to the
+		 * phy_init() in the resume path there is also no need to block
+		 * async RPM resume on our side, since the PHY synchronizes it
+		 * for us.
+		 *
+		 * pm_runtime_get_if_active() returns 0 when suspended (skip),
+		 * 1 when active (ref held), or -EINVAL when PM is disabled
+		 * (device always active). In the -EINVAL case PM ref counting
+		 * is a no-op, so the unconditional put in POST_RESET is safe.
+		 */
+		ret = pm_runtime_get_if_active(dwc->dev);
+		if (!ret)
+			return NOTIFY_OK;
+
+		/*
+		 * Assert USB3 PHY soft reset within DWC3 before the external
+		 * PHY resets. This disconnects the PIPE interface, preventing
+		 * the DWC3 from interfering with PHY reinitialization and
+		 * avoiding LCPLL lock failures.
+		 */
+		spin_lock_irqsave(&dwc->lock, flags);
+		dwc_rk->phy_reset_active |= BIT(port);
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+		break;
+
+	case PHY_NOTIFY_POST_RESET:
+		spin_lock_irqsave(&dwc->lock, flags);
+		if (!(dwc_rk->phy_reset_active & BIT(port))) {
+			spin_unlock_irqrestore(&dwc->lock, flags);
+			return NOTIFY_OK;
+		}
+
+		dwc_rk->phy_reset_active &= ~BIT(port);
+
+		/*
+		 * Deassert PHY soft reset to reconnect the PIPE interface
+		 * after PHY reinitialization.
+		 */
+		reg = dwc3_readl(dwc, DWC3_GUSB3PIPECTL(port));
+		reg &= ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
+		spin_unlock_irqrestore(&dwc->lock, flags);
+
+		pm_runtime_put_autosuspend(dwc->dev);
+		break;
+	}
+
+	return NOTIFY_OK;
+}
+
+static void dwc3_rk_phy_unregister_notifiers(void *data)
+{
+	struct dwc3_rockchip *dwc_rk = data;
+	struct dwc3 *dwc = &dwc_rk->dwc;
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++)
+		phy_unregister_notifier(dwc->usb3_generic_phy[i],
+					&dwc_rk->usb3_phy_nb[i].nb);
+
+	/* Release any PM references from in-flight resets */
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		if (dwc_rk->phy_reset_active & BIT(i))
+			pm_runtime_put_autosuspend(dwc->dev);
+	}
+	dwc_rk->phy_reset_active = 0;
+}
+
+static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+	int i;
+
+	for (i = 0; i < dwc->num_usb3_ports; i++) {
+		dwc_rk->usb3_phy_nb[i].nb.notifier_call = dwc3_usb3_phy_notify;
+		dwc_rk->usb3_phy_nb[i].dwc_rk = dwc_rk;
+		dwc_rk->usb3_phy_nb[i].port_index = i;
+		phy_register_notifier(dwc->usb3_generic_phy[i],
+				      &dwc_rk->usb3_phy_nb[i].nb);
+	}
+
+	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
+}
+
+static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 
 static int dwc3_rockchip_probe(struct platform_device *pdev)
@@ -26,7 +151,7 @@ static int dwc3_rockchip_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dwc_rk->dwc.dev = &pdev->dev;
-	dwc_rk->dwc.glue_ops = NULL;
+	dwc_rk->dwc.glue_ops = &dwc3_rockchip_glue_ops;
 
 	probe_data.dwc = &dwc_rk->dwc;
 	probe_data.res = res;

-- 
2.53.0


