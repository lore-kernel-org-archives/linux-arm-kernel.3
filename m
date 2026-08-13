Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438DC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEDFBvUyPs1VYhEC2VOI9741eqnWXBf1RP7M4sV9qjs=; b=vFBRL2RfxIl8AOkffZ571rY5wx
	VwcI278uuWIMyxrdTfEznXuZnT1QwC5V85U/oEVJI8a9HmlMr7rNZ2Rz82oIj1L1Ne41/BeTKzNPI
	op6JV/Ue8Ci1tRs63Qfk+YkZGNEVe+gcEWTEIxr2LUI22SEnB+DC1poGcsuPPXRjpQ9612mO71XVs
	KtDnvQz3V9iSCRIVkAur7gskcDVeJud6YuklrXd5RJBS1Hw88vx9y+pbsI6vrVPHZWS9dTuNxFsIp
	9gd9WUxb7qfxiML+CjY1PZ5vhRkja50xmdVvEQUyYsxdQMHXL/f2VMsTW78N0sBQewxZHoQy1aPAh
	PbQocZzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucQR-00000001ZML-3SsJ;
	Thu, 13 Aug 2026 20:53:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucPF-00000001XLi-2im4;
	Thu, 13 Aug 2026 20:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786654311;
	bh=1qnuCtil87k3ylTmmQL+0LtekRxupUr5oBAKbI9oT6k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lb7jUcwLyvwCXo9lnwdS/3PKY597rYEepVGNG7RHxVkt2u3oD0O2WkTdvEMornunW
	 UUyYDVqS7+GAlI27mf50cRjHnTIHBfjAqqn7nLJ/tfSxrLnZ5HRJ7pBLxtS/7/IQ17
	 Y9iYFeP/RCTmYJlL17Y2mUnWru53RpWQyYdZ6XVZoQrQTwGimgf0j1uCpreDUX1FDS
	 bCbhqw98LuEN/GAZrzK7VrpgoZgAlBH+EpalyXZllNXbKiAA7Z4Auygrkfq+FOzR8a
	 JpoEH8pecgEzDAYrQ6PnZpQVsSToOvWunY8Mj0dXZ9FnpN8HVUQooeqr7DwUH4BKTF
	 V5zV4axKb7qTg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E57BB17E156A;
	Thu, 13 Aug 2026 22:51:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id C348D480074; Thu, 13 Aug 2026 22:51:49 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 13 Aug 2026 22:52:13 +0200
Subject: [PATCH v14 30/38] usb: dwc3: core: add post PHY registration hook
 for platform glue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1954;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=1qnuCtil87k3ylTmmQL+0LtekRxupUr5oBAKbI9oT6k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGp+LmVuTOH4YGCROdyXVExeGE6AbtOVHieKn
 ZZyHmWIvGWQx4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqfi5lAAoJENju1/PI
 O/qamEcP/jCdT2HkkJzNg5kQB1WTxdnXLfXnsCWUdCYwQMGk1e2i0nlBO/Km8DaTtgVoxDVF1AA
 VJHnXll3JV4oNLVsGrF7HXhhGwSX4B5hU9QyqgCM/aFAbl/VjSp8GVO7K4YD8is9sMc9ivHWe9t
 aWKZ4FNqqE44vrr4LWLjQykAQc4iJ02EA8ByMGRa4X0gWQzPyCE5Nnq+xJFiMcSnjsIZcosHMTB
 TxYtED+GzfY3ew/cq4U8NPhLwC8JjNGVSP5SYIOVsO9JmzMzIONUKkKv4f7UJytqWb/dd0m4UbG
 b27RRXZvlaSs8trIvyEfIDuBh/MAF1O2lL5GFddJkBEGGVRxfjY0CGqrpN9ICeBBpCYT5ds0dS5
 yNYOzum323PNJ/GYVBWiXr2Mzst0MLV9irdzTL6H/yU54ifP8CudotNqDARUI0KbxFmQWCYOBhl
 3osCURofqm+pb+m1r2ayKZl1lSFtJGfmHoLxvcxK0qhY6P1V3GboUI4hTo7X5kpYNYwdZZmKmyU
 cPsrVikSGge/S39JmSuCO7tkxt7rOH30M7ralk5FWCtyTwbWpstd9yoTpQ1It1SWUfEypSi+/YM
 Tb2YafbwJ+U6abPMayv9EnKx+bQFxF1a3Ww33MOFbvz3bJH8D3nJ2fV86fongoZDXiPNBAJbCw1
 +GpxgQpuUPTC/ME05IO8rrw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_135205_921605_E2262FC6 
X-CRM114-Status: GOOD (  13.21  )
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

Add support for custom PHY handling steps in platform glue code
by adding a post registration hook. This will be used for handling
PHY reset notifications on the Rockchip platform.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 drivers/usb/dwc3/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 6e796489a04d..d0d766e1d20c 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1613,7 +1613,7 @@ static int dwc3_core_get_phy(struct dwc3 *dwc)
 		}
 	}
 
-	return 0;
+	return dwc3_post_phy_registration(dwc);
 }
 
 static int dwc3_core_init_mode(struct dwc3 *dwc)
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index e0dee9d28740..8572d23a80a9 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -996,10 +996,12 @@ struct dwc3_scratchpad_array {
  *				need to be passed on to glue layer
  * @pre_set_role: Notify glue of role switch notifications
  * @pre_run_stop: Notify run stop enable/disable information to glue
+ * @post_phy_registration: Called directly after PHY got registered
  */
 struct dwc3_glue_ops {
 	void	(*pre_set_role)(struct dwc3 *dwc, enum usb_role role);
 	void	(*pre_run_stop)(struct dwc3 *dwc, bool is_on);
+	int	(*post_phy_registration)(struct dwc3 *dwc);
 };
 
 /**
@@ -1650,6 +1652,13 @@ static inline void dwc3_pre_run_stop(struct dwc3 *dwc, bool is_on)
 		dwc->glue_ops->pre_run_stop(dwc, is_on);
 }
 
+static inline int dwc3_post_phy_registration(struct dwc3 *dwc)
+{
+	if (dwc->glue_ops && dwc->glue_ops->post_phy_registration)
+		return dwc->glue_ops->post_phy_registration(dwc);
+	return 0;
+}
+
 #if IS_ENABLED(CONFIG_USB_DWC3_HOST) || IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
 int dwc3_host_init(struct dwc3 *dwc);
 void dwc3_host_exit(struct dwc3 *dwc);

-- 
2.53.0


