Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD38CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 18:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8cubTt50saFAmDXuKpQFAxZqB8xlqu8eLyJFrdzwEAY=; b=D7g1HrLN2k+ePSUuTcJsnFGXVS
	ObOnWZccjfpHYreAM2NPd9YyZrxFqeKUHEv8qSVEdW+QqfTcndk5GQvYkNwOaqVx2QBGsg8O9wLw3
	I49ZsMx0Z/A9XuE5QhwWaiW02hbmdvLmWz8JWuP4kUtomRMr6vTsUlN+LKeiWAnPr6Ev0XgAVTqAS
	d/UAfJuA5gS9njbBwZKL4nYXOVcZsYewaFEglioEodg9BdOHJB7X6dNpPDGeEksXa7DLK9SaiDuv/
	+55hO6JjpQ9M5KU5hMRqrmtn3+OcUIbtuLufXSgbegKEDuM9h5JEqaIav/12d+RQy5JhMOGdbmLel
	/lkRCUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmuJ-00000003iDM-3Kuu;
	Fri, 16 Oct 2026 18:43:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHmu5-00000003huc-2cAr;
	Fri, 16 Oct 2026 18:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792176215;
	bh=C0aeOmS9sPLL/qJwqoFzotL1XmRAOgMH6m/vPGSwRVM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oIxys4qoOZiseYN5V43CVayuctRKCRQC1ExO0bZLZP4ZVgijLLFFLA8CsBzTkxseu
	 4FOi8uNzg8fD+Hr00sNoXPKnYokjMle/qbeD9bD55cqpXAjpaWcKjMRMWiX/rVQdQN
	 T6vUNvGkj2lOUvf/uRDUVi3SxNJ8G0nAltNfPHbMihzj/PAx3j0O0gm2nGA3CSt2/p
	 CeclEvpKFd2nOYUDDqCzgVGXD4+YZqkk7H/gGTYZ1bLRGxrsVi04WN7NhqpF9OOzr9
	 UVPO99aaYE0ReMNNwKS6iGGrjRqtcE6c1eHYawfB0OWgFFEuAiYVG/skAtWObGfMvL
	 A8K0SKrFfZEbQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E99D17E153B;
	Fri, 16 Oct 2026 20:43:35 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 6B1AE48003A; Fri, 16 Oct 2026 20:43:34 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 16 Oct 2026 20:43:23 +0200
Subject: [PATCH v17 7/7] usb: dwc3: rockchip: fix USB-C reconnect in gadget
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-b4-rockchip-dwc3-rockchip-glue-v17-7-876f96893e2f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3255;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=C0aeOmS9sPLL/qJwqoFzotL1XmRAOgMH6m/vPGSwRVM=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrScFbVPfVUApqPMxSUh2rHPf/nEbJ1tr2vi
 8KFoP8e21z1hIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq0nBWAAoJENju1/PI
 O/qaCXsP/A0h4by3pYZzgmq6LcweRSRiEiUTMh3E3tnb1J8EGyk6/N/ZU8MiQCSzVqYW7VpQVUr
 f4UaRhmbYMrdGBywoO/22rjL4RfAX695hSHcH0sdmWW8CEXclj4avbl5lXb+y15DDo+m/H7mqIn
 2IRrnX9cP6jzcffWec/9FVL6VMiw4Mi4a/rLrVCnQo7sCDzOcwdUU0Q/qyWcyY853vXtNijbTKZ
 r7TtqMSEKe3UQy2QQQhv4OkzNYDJZfYSx9ACO7cCNJxmFgaFczstawQJ/EZJi9URtSyqP9N7VkM
 d1PpAaxF4Y4winNq9dgu7rygHgyjr9wFgFeuOpxPYy9gmUDf0EeqObRrowK9jGRsQO3x0QMlMt2
 wsoT7VH1MoxqQFf32yok3sp8uSNd6Fii/WV9rmmnpoWut//yfCG7VdgUI0Jy4nDEulq21snL3DR
 Qw2AxUHxPcl3UgkljdmkUR3MAbdVK9D4fcU7Gmk8UN7lo/NeUyhHS4zaFkt9Z7UBwdMYCPxmYMB
 OSCzUiPC1laIfTNpyLODN6oIAWL/7pLkaXWG6R2hwx+vkXoxsG09cny0FX53D8WXFkZnCOzgzgi
 aTGYfYgl9gkbTb1xnUMRAtXn2D8N2TEmrPKrI40HYBHJImJhBqxyKugKyEf9B6BkkpAOK4xBrv9
 GItSKkjFPUO1DEZs1HDkqWA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_114341_840430_8BF1413D 
X-CRM114-Status: GOOD (  14.58  )
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

Fix this by informing the USB core about VBUS updates when the PHY
mode changes.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/Kconfig         |  1 +
 drivers/usb/dwc3/dwc3-rockchip.c | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index c86c1ac293bf..4cbc949c6abd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -194,6 +194,7 @@ config USB_DWC3_ROCKCHIP
 	tristate "Rockchip DWC3 Platform Driver"
 	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on PHY_ROCKCHIP_USBDP || !PHY_ROCKCHIP_USBDP
+	depends on USB_GADGET || !USB_GADGET
 	depends on OF
 	default USB_DWC3
 	help
diff --git a/drivers/usb/dwc3/dwc3-rockchip.c b/drivers/usb/dwc3/dwc3-rockchip.c
index 1f32150caa09..5cb5feec8bd4 100644
--- a/drivers/usb/dwc3/dwc3-rockchip.c
+++ b/drivers/usb/dwc3/dwc3-rockchip.c
@@ -25,8 +25,17 @@ struct dwc3_rk_phy_nb {
 struct dwc3_rockchip {
 	struct dwc3		dwc;
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
 static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
@@ -51,6 +60,8 @@ static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 	if (!ret)
 		return ret;
 
+	dwc3_rockchip_vbus_handler(dwc, false);
+
 	/*
 	 * Assert USB3 PHY soft reset within DWC3 before the external
 	 * PHY resets. This disconnects the PIPE interface, preventing
@@ -70,6 +81,8 @@ static int dwc3_rockchip_phy_pre_reset(struct dwc3_rockchip *dwc_rk, int port)
 static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 {
 	struct dwc3 *dwc = &dwc_rk->dwc;
+	bool gadget_mode = (dwc->current_dr_role == DWC3_GCTL_PRTCAP_DEVICE) ||
+			   (dwc_rk->role == USB_ROLE_DEVICE);
 	unsigned long flags;
 	u32 reg;
 
@@ -87,6 +100,8 @@ static int dwc3_rockchip_phy_post_reset(struct dwc3_rockchip *dwc_rk, int port)
 	dwc3_writel(dwc, DWC3_GUSB3PIPECTL(port), reg);
 	spin_unlock_irqrestore(&dwc->lock, flags);
 
+	dwc3_rockchip_vbus_handler(dwc, gadget_mode);
+
 	pm_runtime_put_autosuspend(dwc->dev);
 
 	return 0;
@@ -138,7 +153,16 @@ static int dwc3_rk_phy_register_reset_handler(struct dwc3 *dwc)
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
 	.post_phy_registration = dwc3_rk_phy_register_reset_handler,
 };
 

-- 
2.53.0


