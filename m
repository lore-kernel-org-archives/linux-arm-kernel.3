Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00F5C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9YeS9xVOMYe6PZfvbKj4wDaNRSkdfLc5sPSScmMBS0=; b=Q/TpNBRCZCXhnJaM7EMcW88FIo
	jKzhul4iAteRJsO4ujtkiO5myXqmlP7/oBPPfz43GKUrwvSEVBlBaubYCNbWlFSt3oMQ0vVpCBSHM
	/WpQfnw2ML7iLPP6ZscqNFg9bX5gBSrFv32oNzwus507AUawTkgZnpgf4B0BvVJNAjfmluq/VSirE
	S8EAZITKG8MprGO5cEA6u3cJHdKIXGFARMqPSueUr4NKN/5bpSy8lVGW7YRZI1JbOagvdzEccAa5r
	vWNZF+SrJz11HFLnsrpl1fIbILK4sSdHN+3EONOog4S3mA/5YqayvaPlrgP/w9uuaoSk29XwQY2bx
	fqlukIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucQV-00000001ZUJ-2lx3;
	Thu, 13 Aug 2026 20:53:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPF-00000001XM2-3NaD;
	Thu, 13 Aug 2026 20:52:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=UernfhZx0JYe3iXoCAiTVzwM/QAARPlfYy6ZBB10VvY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iiVz0kr33b+IyEogMs/8JPeLyruZJbQaFaMDSi4By8Pa9JtWGUuOmQbQJuCo5niRz
	 ZRiuQRbviWFtgYk4IxrWGa9mVQwXVC2nNtASMY9HM9Q5oRP3JZRyoAUo6RhDFgR0gn
	 rvzmXwvjFqlT2tO/Lh6tnjs0vFyvgKUZHE1MrJwTAQdj9va7J1YC4rbIj+nmgurXwa
	 1r8aGQDJ/xZRp0rpRbL9OSe4pRnaK5i2ecqtGxqjWt2zzPZYJkCE8OIbRv2SaxwMbL
	 z9xZubZgyQPn84G9fUCeNLYFERz4UDtFEdvUtlSdnKETJVjiAdvejLt6dwC7u3ccFN
	 I7OFb3d2EEJTQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F054217E157A;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C692F480076; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:15 +0200
Subject: [PATCH v14 32/38] usb: dwc3: rockchip: fix USB-C reconnect in
 gadget mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-32-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2823;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=UernfhZx0JYe3iXoCAiTVzwM/QAARPlfYy6ZBB10VvY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmWt8532Lg/5dPP2v2wQ5BiB5YCJCJADx
 fWfrfVUCwbRX4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qa3zMP/29YAZehz0zofVJuH2Ernkpt4yYq0AX6+aym1zdc79vYvq8xFCr1sZLlO+PmXEh0FFO
 SMc3I1PqAkodM06CEcZ/MaG/FH/394NxbCzl4XEW+EET+rewxLI5I+sqI2meceu/FS5ThrUMr+e
 XM3fYN//zbsqg5xXpB4RINC8fcGPciRV/Zpq2F67tcuNQHPFU2SmZx8Tt7Y0VR1IiE+ntoONPlp
 lTmN+ZtApxAP1ZBgk+6NkDWUKTJ9ROtJDvMQlipVj/MFlcdmu0sKk19PcxXCaC+zqkfEKwrs9JL
 zzR69bO34aPXzaxjJRKruvv/UkWnUc6eM6l+E3Hfp/HxpIXF5xkym/tJ/7cpAJ83QuRS9poQMlv
 fGjWz9mbz6FtbtMr46BAgT9n3ilC+k1VwcCfAubixBhJeiVJY2qDYckeKVaAywm3KKoQCVFufaa
 +0mGcLyFg1bIuDWK/23cHoWERc1yPhMl8ZLs0LzrU8OcOIWGp6cIK1D+8R9jPqBPFbvDFOy9hnl
 j5qmq/YQzzN2eJojvek6ug7lP11cqdpeoqRAiNDiiUAwTLuGPnmZaYg8BQJJ8n+2MoKrEW7GRn1
 vhTXoi02DxJ8jL01qFXY92fbXFHLpuTRzQXnrcjJj8eFHhchPH9stfHy14frM4/G0rd7K9WDYo/
 IMdHaFB6+hOSUdHE/ttg9GQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135206_099525_5BB22C33 
X-CRM114-Status: GOOD (  14.56  )
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

When USB-C is configured in gadget mode and the cable is unplugged
the USB controller is suspended. After plugging in the cable again,
the USB controller stays suspended and thus the port status remains
not-attached.

Fix this by triggering a runtime PM resume when the role is changed.
The Runtime PM reference counter is immediately decreased again - the
auto-suspend time is big enough to detect the connection status, which
will then keep its own reference.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/dwc3-rockchip.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 9e91e5f7e53d..246d7dcafc68 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rockchip {
 	struct dwc3		dwc;
 	struct dwc3_rk_phy_nb	usb3_phy_nb[DWC3_USB3_MAX_PORTS];
 	u8			phy_reset_active;
+	enum usb_role		role;
 };
 
+static void dwc3_rockchip_vbus_handler(struct dwc3 *dwc, bool present)
+{
+	if (!dwc->gadget || !dwc->gadget_driver)
+		return;
+
+	usb_udc_vbus_handler(dwc->gadget, present);
+}
+
 static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 				unsigned long action, void *data)
 {
@@ -57,6 +66,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		if (!ret)
 			return NOTIFY_OK;
 
+		dwc3_rockchip_vbus_handler(dwc, false);
+
 		/*
 		 * Assert USB3 PHY soft reset within DWC3 before the external
 		 * PHY resets. This disconnects the PIPE interface, preventing
@@ -69,6 +80,7 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		reg |= DWC3_GUSB3PIPECTL_PHYSOFTRST;
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
+
 		break;
 
 	case PHY_NOTIFY_POST_RESET:
@@ -89,6 +101,8 @@ static int dwc3_usb3_phy_notify(struct notifier_block *nb,
 		dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 		spin_unlock_irqrestore(&dwc->lock, flags);
 
+		dwc3_rockchip_vbus_handler(dwc, dwc_rk->role == USB_ROLE_DEVICE);
+
 		pm_runtime_put_autosuspend(dwc->dev);
 		break;
 	}
@@ -130,7 +144,16 @@ static int dwc3_rk_phy_register_notifiers(struct dwc3 *dwc)
 	return devm_add_action_or_reset(dwc->dev, dwc3_rk_phy_unregister_notifiers, dwc_rk);
 }
 
+static void dwc3_rockchip_set_role(struct dwc3 *dwc, enum usb_role role)
+{
+	struct dwc3_rockchip *dwc_rk = container_of(dwc, struct dwc3_rockchip, dwc);
+
+	dwc_rk->role = role;
+	dwc3_rockchip_vbus_handler(dwc, role == USB_ROLE_DEVICE);
+}
+
 static struct dwc3_glue_ops dwc3_rockchip_glue_ops = {
+	.pre_set_role = dwc3_rockchip_set_role,
 	.post_phy_registration = dwc3_rk_phy_register_notifiers,
 };
 

-- 
2.53.0


