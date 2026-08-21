Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2ADC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J24VQ0PbzeNhbFkJDNmA1FnJGOH+TUis+dIGzKzBlPw=; b=npDR4J+z8GaHPpQfz/T9dV2mZ2
	aJ7vx4BnCN/IvebY2obfBz3p8DqiEEahAnuMX2O3U9e7xJ29Y3xNl9wGcIGjMv+z441ZCx+Nu66hh
	UnjZIGTKqeHx2srlzGNeGEBRLWQGEeJ+AAhvBvf0iqmN4laKX8ssALtu+STFqteZwEIZ+8hluidKv
	eA/yrzQ7kcs3Rgh/CoxG1n943zwpMkzoqqIbNFyAkKk9RRr5XX3vxycJfXnRxJCeMv6ryWF4aFdIo
	/v0DalHnfp04IwvDkpkAzCPiAM1+nvl+PZlfXd9Dnmaqa2wgOhbciA4ewHnmV96EXY+hX8ZR3qa2G
	t9F6CxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMBC-0000000D2M3-1tiv;
	Fri, 21 Aug 2026 10:08:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMB9-0000000D2JU-0ud2;
	Fri, 21 Aug 2026 10:08:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B43B43A82;
	Fri, 21 Aug 2026 10:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5355A1F00A3D;
	Fri, 21 Aug 2026 10:08:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:08:40 +0200
Message-ID: <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787240165.git.geert+renesas@glider.be>
References: <cover.1787240165.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 2 +-
 drivers/phy/rockchip/phy-rockchip-usb.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
index c3d257a0f4a65b4c..d2c2b17df5f340e4 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
@@ -1044,7 +1044,7 @@ static int inno_hdmi_phy_clk_register(struct inno_hdmi_phy *inno)
 {
 	struct device *dev = inno->dev;
 	struct device_node *np = dev->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	const char *parent_name;
 	int ret;
 
diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 7d8a533f24aeadc2..e47b89015586feee 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -400,7 +400,7 @@ static int
 rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 {
 	struct device_node *node = rphy->dev->of_node;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct clk *refclk = NULL;
 	const char *clk_name;
 	int i;
diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index cef96739cf3ff41f..c5a2853a63d3099c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -200,9 +200,9 @@ static int rockchip_usb_phy_init(struct rockchip_usb_phy_base *base,
 				 struct device_node *child)
 {
 	struct rockchip_usb_phy *rk_phy;
+	struct clk_init_data init = {};
 	unsigned int reg_offset;
 	const char *clk_name;
-	struct clk_init_data init;
 	int err, i;
 
 	rk_phy = devm_kzalloc(base->dev, sizeof(*rk_phy), GFP_KERNEL);
-- 
2.43.0


