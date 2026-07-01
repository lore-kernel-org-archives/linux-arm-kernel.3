Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347B9C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFQ+ZLBOKd0LI6c0NVZlcPVTksymhGoZ9GDCV4JI/mw=; b=bba2p8/wooi7+kY0fcvFYKG2Jk
	Nyo4LHVstEO24ZKwE1LJzx4/hzh62j/cstXNgPhgyUNWee/8enJAAK8H959eIqkzztn+exwGMDUYd
	tBlc22r/CGrthDioNMFPYD2x3IX3fIOBZqMutXDHr1GEdOKFjgrvdevcC85WwrEQmIs+sQnth8ogo
	CSYiYFHYFmSdpu457Zm7M4xhHlRSxGEsokW/hk5+cHaxGMLtXlIMmK7ikx2KOEf1KjzU6wsrRIUkW
	UZBxKdHnCLtkuudMPjn3ok25hjvLKWAvpkq9OWzl9Rtq2ztsnEY0DX/RbjWi1j7XHaLHo8mKDtwk1
	+NQhAdlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4Tl-00000003BBO-1Iem;
	Wed, 01 Jul 2026 23:36:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TL-000000039wx-07jA;
	Wed, 01 Jul 2026 23:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948950;
	bh=Qm7aWMY3dOu8xo8sytm7nElHniirDvpuNm7Jfdk51Ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p0C7OEj6rGJXFj57Fwuc+mAxErLj6xrBxTtza4Z/OXYlRDVaTrPPk/oP39DPnS9u0
	 uOMbJ7vvVRSDwoQVXogN/UQIymNkO/nxYXFm5k6bA1Spin5fNFGuprxYt+Zd4J3lqR
	 19B/9Hnrw2yM6BU5YF77feA/fHVZAM5MPY2riv21IEmKMXvbpBRQimmG7u6pg6Vfdo
	 uFMrhvp2R7FURY8JNuwFQ7kFvBLn+qwlnBVZ9LU+swkfHWrg44W5jQpmcpqDGF8A2v
	 cax1oE5J2Nf56Gi4Ih9Ji2odkmLxy57SmC3Wa4I74IjbjFodNbEQQhe1e/XwdfBT+x
	 MjAbDvpr398Kg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F214817E35E4;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D4B8F48006E; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:36:05 +0200
Subject: [PATCH v9 27/38] phy: rockchip: usbdp: Avoid xHCI SErrors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-27-e31efbb62d2e@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Qm7aWMY3dOu8xo8sytm7nElHniirDvpuNm7Jfdk51Ik=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFSR/WoGN18TYKH2t7R13h3E8Ict54qM9
 Muxa2WWnwvisYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRUAAoJENju1/PI
 O/qaNz0P/0zMIGYr3oL3VrGWEMoNPDj37fWpW70NbNHQ15vTx9OwYD75BEKIBnRYPzxdoeN5RXt
 /uhiWC/IvMko+es76G4Zoa7CAlmdsQj4JlSLfkKX7Xv9dS716KCHACUEwKpc4ffNvDusD6Y+qlL
 mT0c1gpHUtm7oiHORuEpXFGjTJtxud5yIwvB+pl0Bnw2in9ZHDym2gEjIq89q1/6iDsiLJM5LG4
 kgbTfniIsuo7Q6Uh+L1DA2cGOZ9YOPyHIcBbi8dsG+Ncg6FSaXn0BFxY8sN0fRtErhggfY9gG+D
 UrvBrY5mg9t08nB2B8HdwiyAyPYKzQNU8fk44voLEL+wxyM5An9aAlJyNCZcnwv811lM0Rb7Y+K
 jcwsR1BimhZzyEQDK7JzPfvsbkX89SGVDHTNKDg0ilUF0vFISAAkI2Ezr84vUCuM0QbkCkm4pEf
 kG2FWtSbQecxo6qpddgRJlbVOeA5OIPGXsHGVgeGfy35tK99YR1vKfpTPbsSb56iILNUsSUWepP
 6fGXJkmnUytgYV0O0p8rSTkid+5Jy3q8gYl871jRR60SNE5XMej8GMUgrtB1EzJpL03p4409fTV
 FwVmagnyZvBxCFyn5VWCP5EBh/VBF5ShhXORsqt6NCLMcXpL9peFW2jqo8TNf0xx+Kx2Fzl6BSy
 IMzkMWX7S5LfQhfpdbnYqfQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163603_323096_BD4BD73B 
X-CRM114-Status: GOOD (  16.17  )
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

The USBDP PHY provides the PIPE clock to the USB3 controller, which
means the PHY must be fully running when anything tries to access
the xHCI registers.

When switching between USB3-only, USB3 + DP and DP-only mode, the
PHY must be re-initialized resulting in a short period of the PHY
being disabled. If the DWC3 driver decides to access the xHCI at
this point the system will fail with an SError.

This patch avoids the problems by disabling the USB3 port before
re-initializing it. This does a couple of things:

- forces phystatus to 0 from GRF (not from PHY)
- switches PIPE clock source from PHY to UTMI (safe fallback clock)
- num_u3_port=0

The last part will be ignored, as DWC3 already probed, but the
clock re-routing will avoid the SError. There is a small delay
afterwards to make sure the mux happened. The datasheet gives
no hints how long it takes, so delay time is a guess.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 6b0add354880..146edd35cf83 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1036,8 +1036,8 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 	} else if (udphy->phy_needs_reinit) {
-		if (udphy->mode == UDPHY_MODE_DP)
-			rk_udphy_u3_port_disable(udphy, true);
+		rk_udphy_u3_port_disable(udphy, true);
+		udelay(10);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)

-- 
2.53.0


