Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F4BC44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0qKlWX8FzGSFJND8Ia7yOIyQJm+d2FFI59Vi2+W5s9U=; b=J2a1lt1VhNMM1R0HK+13zF4Q+w
	sFJXYG2EvQS+Sr2t4vrjEGWCESZm0kBW6iCoObpuhl4wrGb1x+r5DUxmIs+5U4776pACYEOGEDG5r
	Y7aQrpw628kkNE3psQkQ5DT2UROo3AZ5RU4bhwP8zhjc5XUjO5pBejmjvBPzqlWGvmMS+Uz3cAU18
	oDE2qTCSGN8yXiRkrAssigz9AoYVg/IpKwz7dUPuiNH7g3XefK5gIcOHyBQiCGGmtTivH9czGfFYJ
	YW2vf8Bn+ScIsbDCm51fgjkbRx8U6VVCKldr0uBTOWSwtJODF+LtPrSLUxKzLvWH2UCqid2SqTiel
	omJHjAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGm-00000005k2o-3ztW;
	Fri, 10 Jul 2026 20:56:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIGd-00000005jui-3oRv;
	Fri, 10 Jul 2026 20:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783716973;
	bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AsnlYnKEb4+9cZLy7mzp7QAshUqMTXL9/EbdW3DuunJuDxdbrpMOeL1FWPDHPPvR+
	 Cxzgb3felcLaF6Lu4mhE9gH93JLD9e8MPz4lH9/vgwq1Vimxj3KXCFwyMF/h4zTUMm
	 UFb/9duz/3TSeYwaU3hAuk6ik15A2DPWsumwP/6GY+HS230VrOz/RJkya3jGxKWyGY
	 TwBIuppasQHWCwxaAQv3eU0X7MaZPFIjyxwAf5/9e3i2tFKXc7KIbGcFPLyxdMwUrI
	 mVw6Aku2yLhdX8RZJyrEmmfAZNtooXlEe/0JnRfQV+GMCDmkCHGAfmSqJh8lxHwci2
	 LFfc8TgHc1OqQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 13FEF17E0720;
	Fri, 10 Jul 2026 22:56:13 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 02912480064; Fri, 10 Jul 2026 18:46:18 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 10 Jul 2026 18:44:56 +0200
Subject: [PATCH v12 18/36] phy: rockchip: usbdp: Rename mode_change to
 phy_needs_reinit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-rockchip-usbdp-cleanup-v12-18-8b41a9a9bef0@collabora.com>
References: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
In-Reply-To: <20260710-rockchip-usbdp-cleanup-v12-0-8b41a9a9bef0@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1831;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=KsztTcLL1hh9As65BcDTh5Y7TjOnYb7YivozEbWiMmA=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpRIdnKMGlckTMit4CKUXquYmHJn7bDwh6N3
 QCRwH7JCCLelYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqUSHZAAoJENju1/PI
 O/qaVUUP/RKGEc58xxEWdv1e05CjoEyyVl/NtF3LV43Blv0Rr0F8LAyJnPHAEyHZXDsgUIdC3qL
 R+SDKy8GPLvGJovGEniewLnVE808qs45iyfHL2QNLBrZxexZApBB+1qJsN2c/viXCs6FOuyQTeq
 k8VLrL4xA2nmOEoYcX5OVYEYQyYyzWzWFtP7IC+zqr8xFAzrPfqp3cq2RVFsGuD87JL73+kvNpc
 e1KPphOsi7rW53oXVXyp1n8gvspuIbtSUkAdvSgmddz7hH9RG7DPnGCbxnZ0BQXrbs9QyXHi2XN
 NGwG1zPGpDjCKHnDBddwoDiLoxg4IgI3QLs31mmBMSjA7D3wt7kDdq4JpqGhq/jUxd8DjPKwY6h
 HTfDMBdShp0LXsQCW8ICv2uDJmuuxwSEwO4EorhkMlB48lGLr1UhVoTd1NNe7pk6s7qw2wG5Ym8
 oErzKqkKcuxon7KRD0WZE0WCoR9WISO6bpuyGgUyHtMiOsLuFt5eEM7x2yM62XGF5EF2fHO4vXV
 BqpPUzXzrIwClZEnf7G+pkuUaiiQY0x88VReUWCbep1TqV1MAKPPkTKzNVkK9Lp3GnEIHW2cV9e
 J2n5OzOSOCYo3PXKoNceJ77VOcIkSerpj4ssCTR42MlFQfmUIp/q1vBUhqeBn47PTMuJznctDb6
 b/oFJibv47hP7sO+5f/M0Rg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_135616_107255_ABF1A510 
X-CRM114-Status: GOOD (  15.15  )
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
index 24108816e3b9..e44d19c9d119 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -171,7 +171,7 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool mode_change;
+	bool phy_needs_reinit;
 	u8 mode;
 	u8 status;
 
@@ -578,7 +578,7 @@ static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
 	if (udphy->mode == mode)
 		return;
 
-	udphy->mode_change = true;
+	udphy->phy_needs_reinit = true;
 	udphy->mode = mode;
 }
 
@@ -951,15 +951,15 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 		if (udphy->mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
-		udphy->mode_change = false;
-	} else if (udphy->mode_change) {
+		udphy->phy_needs_reinit = false;
+	} else if (udphy->phy_needs_reinit) {
 		if (udphy->mode == UDPHY_MODE_DP)
 			rk_udphy_u3_port_disable(udphy, true);
 
 		ret = rk_udphy_init(udphy);
 		if (ret)
 			return ret;
-		udphy->mode_change = false;
+		udphy->phy_needs_reinit = false;
 	}
 
 	udphy->status |= mode;

-- 
2.53.0


