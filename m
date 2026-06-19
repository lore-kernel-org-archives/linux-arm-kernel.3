Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF872CDB46D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 15:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ma90rjKSDwwKQHcUb13kObUNdaFvCo9Cks1RVRC52g=; b=S4ALQSeFH4bOTCo9V/Qq4k5SCn
	GS24BLOwzeYZVn6supFdo10pK56ud5ZYqaysl9LSVpDibgPcityrSyxiz33mTpTCMUwR+Wc62Nhkf
	F69RV1oMw+rOP78i/VpA9DRGqNiQFuzxOTYTy5AxVR9nc2xB1G/XysUns0jbQ7HEcTTMU6GUfu+P1
	44VmkmLDr9oUWCKfeOPigcj4o4zrDqk4NFFXfZAmHy7RQz5p6I5wTbH4YoU69s5aKCZoPmUri0uHs
	T3D3ELMFeBxLv/awCRntzWFvhufUYtshGUmCS48fXP3McYBT9hRl/juJCopTbFgyeBlVwQOLKkge5
	fJ6fJbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9q-00000002duR-0AI9;
	Fri, 19 Jun 2026 15:29:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wab9V-00000002dXB-3Da5;
	Fri, 19 Jun 2026 15:29:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781882938;
	bh=CT7u7E77U7zQr5kR3FDQAqLkvmw2hnmp6IofvsnGVfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ovSqgWUAmqufq0Ithx1kJogO2JTHWlrBZwgaymkZwIx2f0NKbRktMiJ/9S31ShQ4j
	 TuJHzgZ/rQVfKiY/E+TmNZmE/70zviksO2S1TAMLY7o3SQQb3W640iq5zAt+/xXSFv
	 +9FsNUkKrBx6jOwY8U5y0lGJMHVoZuiKABKIuwdRJLFH4mNEniHuT7dJUoLBidtVbW
	 +EtxkxfOUWGOUmEEW3nrbUSyimRUpDieAYzZDZ8BfZzANLGXAk1UF28NGkpDrXoHne
	 66Fy2di8FzdtQIdGcfh+hbm3SrmXu3agMUR9g+39W4aebQmzy4l3+EJuedSuRxIMVj
	 J+n7Nw4Mq5T0A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2F18917E1024;
	Fri, 19 Jun 2026 17:28:58 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8FEA5480031; Fri, 19 Jun 2026 17:28:57 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 19 Jun 2026 17:28:57 +0200
Subject: [PATCH v6 06/23] phy: rockchip: usbdp: Limit DP lane count to
 muxed lanes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-rockchip-usbdp-cleanup-v6-6-3bb1f54b3f35@collabora.com>
References: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
In-Reply-To: <20260619-rockchip-usbdp-cleanup-v6-0-3bb1f54b3f35@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=CT7u7E77U7zQr5kR3FDQAqLkvmw2hnmp6IofvsnGVfE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo1YDgY6JgXUN4hevis9mLAzA6i9pfOugLV4
 GbCGYjlmcnkb4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqNWA4AAoJENju1/PI
 O/qazOoP+gPIDglRhRA9dbFA9WFquwF0e2esJ2neU5Q3g3XeMYfvTqmpVOQPYCZZMfB3L2SvrR/
 9OmJct4u2toKHmQpe0uAlohKsuNKtsxt8BX7NTLOkrW+pCci4fxSlZ+uWhujMMcohf9WJbM4LsX
 kEsTGwue3tvgtBbMGN4K1774ML7f4PFiLkGpSCQCk13vAUZrs14xZkhSKK2LCdE5JAba1GoRjWE
 HyrqNqFoFCb8wpWcbYtkFZYX8ZgAaawHWNmlNZ6r6Cd5IF3/nXSFJ8AndQKUvaFxWoZKD3j7dyL
 Gv+v6koDwSls1S71t3T6v9DKX4RBZMWL+Sg2WpcySL8rAfTAHb7zmLUURExKIECEzAxGXqlruWO
 XadkQuavG9jQplj+XhfeWcdKQQkCdxnbzS2BevT0gTOCaIvvIsX8w8MlnGmbQJAVDi/GbpaM/7Q
 FcRhLjlPffHjVLuJ3UmP76v1m/dwQbmMqWuaz7oAEivKVeWxJycB5hgxz+MAuvmnjInqopDNAG0
 knFDcSQ2k1GuboE805tSdfruYLJCOY07XLKzQ/DqF+SPVCxHfwVY/WxlhAVYKfJ/SgceiuPD7vM
 C4b5NrCHvZY+R86PAZIFi0EGgf7Ln62AVR1SlZ9iloZwMCykuEwQcXAJ13sHegQVd1g94A7R0+B
 QSzUJSywuMx1o8R36WqMtMA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_082905_969684_A36D220F 
X-CRM114-Status: GOOD (  11.98  )
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

In theory the DP controller could request 4 lanes when the PHY is
restricted to 2 lanes as the other half is used by USB3.

With the current user (DW-DP) this cannot happen, but as the check is
cheap and users might change in the future protect things accordingly.
Not doing so would corrupt USB3 usage by the following code configuring
the voltages.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-phy/20260612165546.98E1F1F000E9@smtp.kernel.org/
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index ffe39c968c70..6dff4dfc9363 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -1126,6 +1126,9 @@ static int rk_udphy_dp_phy_verify_link_rate(struct rk_udphy *udphy,
 static int rk_udphy_dp_phy_verify_lanes(struct rk_udphy *udphy,
 					struct phy_configure_opts_dp *dp)
 {
+	if (dp->lanes > udphy->dp_lanes)
+		return -EINVAL;
+
 	switch (dp->lanes) {
 	case 1:
 	case 2:

-- 
2.53.0


