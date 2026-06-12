Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AD2CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 16:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26OAxS9E/Hp9IDb4I2iU6qR795z9Sn+bUf1oe84DZts=; b=j4S35mobNyqU+VhMW8Y2oHharF
	h/1te/NQ9IbHHPuwHXp+jJ5R8Nbhvl2Xpvyvt9NSxmiH4zsAR0ueKkf3mwLaiJBps84HwQx4wHJRP
	RWtCAU7gr3IodDX5ObGQ/4iRTm5Co0h54gvoWq2QC9f5ZdnOSNObG1nAIAmy+RaQLFmAYNQsMfrJq
	nN3F4XhZ6FLHlkbk2B2Utcsxb5MgKtfiGbErCc7/baaKpYxCuvHctPp7UVyduQXUvIz4tyT4C5R74
	i2MQ3dJJhZbRVT/Bknn/q3L9I/wE3ogt96bF/oR1t0kSaqBTn+ABJKscvtKP/ohrZVEIbp3asFMkZ
	fDki5qJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4j8-0000000BHBM-4A7b;
	Fri, 12 Jun 2026 16:27:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4j6-0000000BHA9-0LGe;
	Fri, 12 Jun 2026 16:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781281641;
	bh=HLJfkYvaJE6vU0w2x8CHyfN8q0SgDuG8KtmXkuwPh1Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ECu1XSFpEXOqmOi7Fkr4XXgpcQpz8O2HOuigN7veLOG5ddPTcKFZKAVuh1pnUYK64
	 syAJCtGWrtA0egn17fOl4jup3mW1/ODRFVyVJ0SfMNnoT6rf+n1M1p7zf8UT5hRaea
	 ceyzAeqB1rFYs3DLtKBShAETMAvFtpw55VOowOvMgxtUDUXcFMjZt8RR6Yv9nakZkF
	 DFA9HK9Iz0c+KZesiCTA3mPzpQeEMCIjbWzCCF+DDm07Tfvh/repGUv4T+g6uVVMlP
	 ajHKTH1RN31gi2OBjzdVVmDiyUI898ulk3wgvEGZpTURNbSmdwvN+rWW+B+RH1ScMI
	 E0PEkQqWzRytg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8FE8717E35E4;
	Fri, 12 Jun 2026 18:27:21 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DF5D7480062; Fri, 12 Jun 2026 18:21:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 12 Jun 2026 18:21:56 +0200
Subject: [PATCH v5 18/18] phy: rockchip: usbdp: Add some extra debug
 messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-rockchip-usbdp-cleanup-v5-18-efc83069869f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HLJfkYvaJE6vU0w2x8CHyfN8q0SgDuG8KtmXkuwPh1Y=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGosMiEezP9iqnNrRmCYYUGmd407dMDcqIIaU
 C691vroSvcju4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLDIhAAoJENju1/PI
 O/qaL2oQAJLECuKbtLdqJjGnNSLcBZW2EHi//3RjZ/zYADEuirLdgvcQahxUuQLVf1lEDNS3YSr
 yKdEksEyQfPeut7+aIUTk3UPX1igNwI7FHW4GtBGhu58Uy8D5spq2E34HWbEcWTOjPyk40WuU+P
 RgwYzJE/An6EVt7du4ilKJa7RbboH0FpzNGz5Jk/zDOhkK9pIoX83BpEVlYLipNUUY6nuI+BT1g
 7imDgQPj4w08TsF3udAwv0Csp6kbE2v5k0wHbL0Loi2mmLER3AGs2ZKsLUFtZkjUlY7DwXqwQQi
 LV01WJmzaMl7P2zORLuxeR/bptX14imFBfFN/N9nworFZCedGwFrYrhjz86WEC5z6VsLM/I3Qbi
 t28r/GWLtA2D2dPsE8pYzfg145/QExBHfB8/z/ttWVvy4c9lh2QzqJnkbrCxPXHzbSjRL+7k0Nv
 l/kBva24fKwDtrswhxZ2xYX2Vbj0hHezjiXkHrkO830iMS8oVwCHgu7l9UrsprfYlc+D1PUSa+t
 Jcc9EE9+hei9N8rYRSu3Te2yBi8N1r5TGUE9vnDbjP3ppM41jPTK028dl76AQJMSnRHJ6OknS35
 iDAyA/7E6XC/58yURX74vmTRaM8xsLoq/wSJtmFRwZmUlQv55V7xHXYQixC9cDHkej1cgiP8KXc
 Q5B62NN7XrZpSXVcFa38s6g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092724_274849_4569B42D 
X-CRM114-Status: UNSURE (   8.95  )
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

It's useful to log PHY reinit to ease debugging issues around
USB-C hotplugging.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 236331cc0d13..4042e2dd8121 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -491,6 +491,8 @@ static void rk_udphy_u3_port_disable(struct rk_udphy *udphy, u8 disable)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	const struct rk_udphy_grf_reg *preg;
 
+	dev_dbg(udphy->dev, "USB3 port %s\n", str_on_off(!disable));
+
 	preg = udphy->id ? &cfg->grfcfg.usb3otg1_cfg : &cfg->grfcfg.usb3otg0_cfg;
 	rk_udphy_grfreg_write(udphy->usbgrf, preg, disable);
 }
@@ -784,6 +786,10 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	int ret;
 
+	dev_dbg(udphy->dev, "(re-)init PHY with USB=%s and DP=%s\n",
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_USB),
+		str_enabled_disabled(udphy->mode & UDPHY_MODE_DP));
+
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
@@ -854,6 +860,8 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 {
 	int ret;
 
+	dev_dbg(udphy->dev, "enable PHY\n");
+
 	ret = clk_bulk_prepare_enable(udphy->num_clks, udphy->clks);
 	if (ret) {
 		dev_err(udphy->dev, "failed to enable clk\n");
@@ -872,6 +880,7 @@ static int rk_udphy_setup(struct rk_udphy *udphy)
 
 static void rk_udphy_disable(struct rk_udphy *udphy)
 {
+	dev_dbg(udphy->dev, "disable PHY\n");
 	clk_bulk_disable_unprepare(udphy->num_clks, udphy->clks);
 	rk_udphy_reset_assert_all(udphy);
 }

-- 
2.53.0


