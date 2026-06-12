Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9AACD98DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htkyJ4CbAFmLCf8DDtlBuFoswThHMlM5Ih/JLPFB64k=; b=3tokQYcOoWOw7iI9O6DgdUiS9F
	lLSDlrMgEinVNH6dssGzDYSc8PCOw4z8W0lrChUjjYgvDFGJqwXmnFZCbhMxmEKK56U7rtfgJTUOa
	W2vbXllSo0PPw/vRp4/DnMrBLNSY3TpBJh1k1AJyg7HA1c7tuzYrZ7ZMD1FQwpS5dRxFtS6aFXREH
	ORtdDUcT9Y+dZQa0+xYNs1MRz/YQzH01FPKxrCA5ruXmvM4idVVcjFatBPpPCR3xGtMpn1ypOD3KP
	9fJONmtevXsqYKfelxGa1SJYwl1EVsB4ZwK9JwIAXA+xhLMwWyuyqdEnk++jdSgGaDLYaP0qEAwQI
	DrLnu33Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4e6-0000000BEbS-3QAI;
	Fri, 12 Jun 2026 16:22:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4dt-0000000BE5A-3Byr;
	Fri, 12 Jun 2026 16:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281315;
	bh=e+X7quj6f3rwPOTFsKJxXaQIoHZdjdmli0YuE2QSEew=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pBHDTHR5h+JwNslciPAkO1CdyWdDm+LxG90FUrFF9uDXyVvTp2Hytdgbwfc2nZcdP
	 k+j4veUH50En+9k4pef78+Uew8j7u0H2nP61hbkD9gyg643QAsuOdULTxESPs8GlLU
	 AeobgJaiFJ1us9odY4skLhRX9CM8BroDP27L2x5Hg4u0xokk/JAm063++PxNZ5MrJx
	 RLGxXdjgf0+CjOxjVLq20Kpc69AzrUJMh2Pp1Itu9XnqBH5MsS1L8LMFqBdQJGYjJV
	 L7Pyb4AXXUsCGtHuJyvBBs0eRzlUPmW2XQphojHstTmtwPb7b/3miLFKvPa4v67r4x
	 txz8+x+x+19gA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A33EB17E14FA;
	Fri, 12 Jun 2026 18:21:54 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id D7A3D48004C; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:51 +0200
Subject: [PATCH v5 13/18] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-13-efc83069869f@collabora.com>
References: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
In-Reply-To: <20260612-rockchip-usbdp-cleanup-v5-0-efc83069869f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=e+X7quj6f3rwPOTFsKJxXaQIoHZdjdmli0YuE2QSEew=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiF9vvEsZaiOmkYhh/VPq3iFHuFDU87FX
 uMK4PCvJQoabokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaisYQAI5Avcdg2sfvSFFiSTvWoE3HNrEmq8Pyd0ORW6CTQEu5c2i3Ndu2rzZTnyUsvapTMqd
 sF+cABFMoL5l/0s+d0mCIjnP3vOQs7+8U/8rCcvXnRKz+6poFfSjZzkWWyFtpazIS3I9+av2SUR
 sXsB9sQoVG/HPsXMdcUOwHlFkcBvmLzHUz+WwMI6DbUE/rK7HqMGCjdNBHZNp74U/ndbbjbLNUO
 Yma44IjJLTk4MdAf1ewvPt/RSmOGILkIZDG7MuEKVdmIpZzV3E8KsPcZgIY3NUPahxCSB3WOVhQ
 K4vNT2bLlwC3Ommf2rXNZxvTENL9hO19Dc0aNucaq23PeLXFKB9u4zrTLZLIhxp9um9+YSuUpRg
 SsJ0fvmh264dd7sDYW6SriwfUbeQyXHqQAP9TQ2vDWL+O/rv73HQnxdNbBf8TMUwqMJyNAyooA/
 LfrPLYklhmasW9fWTShanRYlnm3W9omh70NBrl17IefSyPTaDfxPUGS0+Gwr26J7lZ6Kqv+ctWf
 MeiDI22QDIlVS0EFr5dvYDjnIztgv/mVDQa+WTiy0RqHGacSxKjPY24gzaAVK7nT9vfGeffyugr
 t5re+fFOGjkL/wx9XDMTpKG05ZgneVFYQKDQv2P7ORXycRlYX8NlQ+bOekpU5jP4eOZXwIlglow
 MYZs2VX2q/Am8h68AdpAy5g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092202_006563_58A02E95 
X-CRM114-Status: GOOD (  14.91  )
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

Right now the mode_change property is set whenever the mode changes
between USB-only, DP-only and USB-DP. It is needed, because on any
mode change the PHY needs to be re-initialized. Apparently at least
DP also requires a re-init when the cable orientation is changed,
which is currently not being done (except when the orientation switch
also involves a mode change). Prepare for this by renaming mode_change
to phy_needs_reinit.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 7255c80e0fe2..a3b4e2e0f578 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -580,7 +580,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -968,15 +968,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 	}
 
 	if (udphy->status == UDPHY_MODE_NONE) {
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 		ret = rk_udphy_setup(udphy);
 		if (ret)
 			return ret;
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-	} else if (udphy->mode_change) {
-		udphy->mode_change = false;
+	} else if (udphy->phy_needs_reinit) {
+		udphy->phy_needs_reinit = false;
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 

-- 
2.53.0


