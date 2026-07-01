Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D98A6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGcTGlAQjDNAf0MbrYZL8FmoE/oH2dDnKVX9nBxrO3I=; b=PdIEJRw0EEWqVy+n7DxVYCyDhU
	08yFnvgiYqLw3u9VhiqET0OliO68Zc3YD/CWPBI8Cpo7m9v0crrDkxWNHoxs2Pav+SKQQtuhK9kpM
	rzadkKZ2G3DIpVAax+TGjLJ864AfJp0JleapV8QtcjR828TVN139BL6KriBQfEYsAAHUWsz/ACe8K
	0eYr0GSXnVMFoV+u+lRX+zQYjuPMgdij7vNHN4e1S2QoNqdYDatcu7rH3P+x2y5Iux8KwSS1eAFAm
	IYwFI47V7H+XOioTqEQr1ssXxQMNHgCc29Mf/1e8tdiNCwu/XulJpZhfc3iKGvOCPa6KXiBB75y1B
	QCk8V6cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tm-00000003BEn-0g7F;
	Wed, 01 Jul 2026 23:36:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TL-000000039xn-1ciF;
	Wed, 01 Jul 2026 23:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=2KMZ0BK5nZl9x3Sxrnw8YlXTBKnooaCdrEkVGc6Hu7w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FjQx/BR1AcycpjQFboqeuflIr35Y68NL8TJPsSzOGVv2M9U1BTQfIaxa8j/FZ1DMk
	 lQAHErHxCEaXAKhx74lklAaYHAm0sG5gUA+Nu/7/JskFL0sOBMS5I3gETGQ1ehhxPv
	 2SkLM+cCp2QNBr+SoTZH9OomPl5Lur/fzKybx8MyGQUSIgpQolLUH4ca2W2l6lU2U6
	 IEbRIM/5EtKyy1K/fb/CAdx5NITFDCtaE/k8d54FEkG2c2AUDv1wtd0m06MNjskL+p
	 tRK83sgYBuZagKsFTlF6Fdtr+iVq58pli5GOQ3URCenF2Y5AqCcW2c7ZKDmMMmxik4
	 A1I+QOk5srNsQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 187D817E35FB;
	Thu,  2 Jul 2026 01:35:50 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D93C8480074; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:08 +0200
Subject: [PATCH v9 30/38] phy: rockchip: usbdp: Only enable USB3 when not
 in high-speed mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-30-e31efbb62d2e@collabora.com>
References: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
In-Reply-To: <20260702-rockchip-usbdp-cleanup-v9-0-e31efbb62d2e@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2KMZ0BK5nZl9x3Sxrnw8YlXTBKnooaCdrEkVGc6Hu7w=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSkcMxQDCmuLrdWjNkM/C2sM0jUr02q7
 Nd096rbB/JWVYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qalFwP/0WTgWmYfQkf0vMM3TApw1PcGBOaeKB8x9C/kYkdnIxed6Q5afPc3EW9cth0VP4BFnW
 kxBtJD+I4qRFHv0aB9xlVMeVJ+55uui4tXxtDaER0Ta1Qj4XkIBGYxqaj9rzpTBgHAQbQLeNJjv
 6oALvAg9G5SxOAHxU+eqrOE5QbqbqeeoBUujVoL1j6s2rBoDBPc6tF+gWy4tmj8rdXlhcFdPORV
 zUJZ7bUDzh63wHRTuTn/HSmS23Z+UEZ/aErXk1hGKelq/Ts1dI+pnDXA9jGZRhJJgjnZGgOm7M/
 vaggTyfa1bDzJ8PBZR2C+9+9r73e2hCYjAyZ8SdFmkMOuQDgrh4CuR88D/0nDMq2MeEQ8Ib8iTT
 tYc9yjoMhMONuBDjq3fssT/jmSVrgn4849mAR/Sq+zXrtiknkyD45o+SKnOfiBkGcerzzSLO8Am
 D7OSbzFWWZdR5NWeqaQ9fTAazRyFGKkExXaQ9JeddM7enPZ+NbRCQ4rYGV3aC7in0kabth/cmrv
 DGYcBuGaMknEb0rqzyRwJiR9niBIBNcmDCnnCOui6FELAVNODClLBDI7WhXs1jC41Ad0LSErAOl
 FjunmZnDQj/oIOn871AKWlJIeo7rFFM4yohT8EJ8/OBW72gh8tM/1NY9US33O0dDxTqU02COT83
 Wg258Fb4fnEdCLzk/H5su5Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163603_671771_6B7DF466 
X-CRM114-Status: GOOD (  12.04  )
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

Ensure that USB3 mode is not accidently enabled during PHY re-init
for systems that are configured as high-speed only via DT.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 266cbb0e5325..c69766929b3a 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1037,7 +1037,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 		if (ret)
 			return ret;
 
-		if (udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {

-- 
2.53.0


