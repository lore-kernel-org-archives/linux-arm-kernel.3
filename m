Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6DDE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5oTtaO0AbaCWpmx8lBb1nMQ2H9C061MoYafHHDeZMk=; b=r786LL6ysjcxt5KD/RX07NdqzQ
	hmImGbnUX3bFoYALrbMHw2pMCeLMSrMaP3LODYez2Eqi5SjrT4cx3LnsSL+AqFfDuir3633SuZhEJ
	l1N9VbfJGfMARiG8idfJQErvBy/Gwyk1HCs3gX7JS0lvHppIHSPGn0KnG1JEAZEyZq3k7jYjo1zhl
	kZliXj3icF0vU0zwJEhwftLlDLYlnoKbBReNQJZ5y9u2FiuOqTpZSvqdU5EEfWwYHhZg7+nHGMZUU
	CHphftmTY0uiO045iEpCGLi1LaJoE0FCHQ9Y6dwsmmmMJZwdp6S7Gm+2IumHQ3TPD5g45581LEOBy
	DS6WJLaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpSs-00000001kSC-3xxt;
	Thu, 12 Dec 2024 20:07:14 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLpPi-00000001ji0-1mng;
	Thu, 12 Dec 2024 20:03:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734033837;
	bh=rzY/ekTj36CpGepR2T+DTbTdewEz706/EN294cYriO4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XJV/kuoKfxKSxUEmXOw1KT5z/JxGOig6CtpENBQ27dFsm+yIIIqut5ChBzAHGr+Ie
	 cq/svw7DEt1nvoy0Si7hou9PwTDinqjKqk129ufYEIqFDQzb3OAHINK1QaKicSo44/
	 Yk3O+vV+wyqo1CMfZ/OUyZJezgxTJFn1GFPHqQ6CcmpqlrC5KEFEYeeuZk5hMTr/D7
	 yELCx5SAYs/qCpsthZuSa51si8va/oFv8aAgiqNN89L52elMYHuSxezVwKUpV5qFOF
	 WIuClvV8Usw9AqN3RExdD8yel2d+sfcWBzLOsyU3kYt0T9Z8xCrxp1YyiaHk96naBm
	 FbyFgssQpKPYQ==
Received: from localhost (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D90C917E37FF;
	Thu, 12 Dec 2024 21:03:56 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 12 Dec 2024 22:03:34 +0200
Subject: [PATCH v2 3/8] phy: rockchip: samsung-hdptx: Fix clock ratio setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-phy-sam-hdptx-bpc-v2-3-57e672c7c7c4@collabora.com>
References: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
In-Reply-To: <20241212-phy-sam-hdptx-bpc-v2-0-57e672c7c7c4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_120358_612319_57008576 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
and not before.

While at it, introduce a define for this rate limit constant.

Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY driver")
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index ceab9c71d3b53ae0b746a10c081fcfaa7d5c5ae7..089020df5b4b8f9b44d272fa87a66e0f2c8ccaba 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -192,6 +192,7 @@
 #define LN3_TX_SER_RATE_SEL_HBR2	BIT(3)
 #define LN3_TX_SER_RATE_SEL_HBR3	BIT(2)
 
+#define HDMI14_MAX_RATE			340000000
 #define HDMI20_MAX_RATE			600000000
 
 struct lcpll_config {
@@ -826,7 +827,7 @@ static int rk_hdptx_ropll_tmds_mode_config(struct rk_hdptx_phy *hdptx,
 
 	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
 
-	if (rate >= 3400000) {
+	if (rate > HDMI14_MAX_RATE / 100) {
 		/* For 1/40 bitrate clk */
 		rk_hdptx_multi_reg_write(hdptx, rk_hdtpx_tmds_lntop_highbr_seq);
 	} else {

-- 
2.47.0


