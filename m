Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CCCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=YCe/nLUF/fDdYPH0X2wdZuRiA/
	FH+gx0pqJBPXqHa2GZxCYEutK1QqvKm8Nhkv5lnngVu1KNs4I1VpX7RK+Y9Dg34FeMh4fiRATUBpa
	zB6ps5gTYVlAdXpruGSAL8ShGvdBkDM7JnHaHr4oKYqMxwPpXt3Voorl+zF3DXeOd5Oamj9szEIW9
	LZf0i9tlT4wbIsja+HEVzJ1A/Uzyb3GV39BvwFkNcaqCzsYVz1XYflOFabZ5mo9vzg7Pmpv9KPHxc
	DFFKz+SFWlfpRBBSO5S+4+VsVTO/CvSAo+M/IjhKV9hO41WLaFOXD5g6EEmBwcEzJLFtiovzRqtXs
	c/RlYiHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOf-00000007eCB-3gVG;
	Fri, 03 Jul 2026 18:13:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiOS-00000007dhM-0QW4;
	Fri, 03 Jul 2026 18:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783102413;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JL3oC9IXXMSi3atxGXKazwNKJ1CRZ5svJR9xV8gVtjb5M3ExS1KptJ6Sx4Kpd9cCU
	 qtV7I8k72OAKKmt/s36Rj808VYrnJKdZdjM4h5YCoFBfkSKmceJflF4nsif1QepK8g
	 rI6n5tK1eFWOHTcN1HCmsuzYUitj8jevkQFEbommHAKKXstRtvUEU73a9WtPAFa655
	 FS4sBV5LFYKY8UHpbdVB9lF1Qmd1PfqczN52BX/ymmwODclfpUwG5vAnDMbsh3yfoY
	 TBkmNV/d5NN34fRSN08s5OLmWCm29z/bWuHKlNRfurGDxSnbPoBX4sughKDTaZKbh5
	 SBP72T0V99LjA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 221A017E1123;
	Fri,  3 Jul 2026 20:13:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 80563480031; Fri, 03 Jul 2026 20:13:32 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Fri, 03 Jul 2026 20:13:21 +0200
Subject: [PATCH v10 05/36] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-rockchip-usbdp-cleanup-v10-5-a392711ca8a9@collabora.com>
References: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
In-Reply-To: <20260703-rockchip-usbdp-cleanup-v10-0-a392711ca8a9@collabora.com>
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
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpH+8tyg707WYxG+xVW2Xv12fOU8M6kcmUo3
 ZikGel4WMA5IIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqR/vLAAoJENju1/PI
 O/qat9EP+waNNc8Ls6igELDg6nTIpAWqTNlG/hFv9CeVwLdtQ/3nAEIo2TVQsoaLADf+YdVBDlc
 M0eXlDDuMZIb0VSIUEqhVuRaj2ri6oEKZLFY2QHDmznhKBFmu8LcwB4UqM1GyeuuTudjqqYpsNi
 uTqeZKF5HNcIldOXGbyS1HUkGhnuGmlcb/zhUtDR+ed5BhZOmY8V772dEuNORY6W8f/9cWt4Ekv
 8UcUY5RSgc/zygQozt8kAXG9ViRdyeeTvnHm+qQJl+QV66IKrZdiPPUzTqcJu2ViAYvTRX3Z2yX
 3PxuHTBD33ciSD7KUXedr9MFCRKM38qMvg4/Ta7mxvqdNwo+dtXGuoQh0eOzh+eWTIBUDj6juPC
 5G/Z6T3zxvNEeJO6xlT8WYHJ7y6Mempq0F1B1U0aU++sXdh5xmfmYzmfC5is/ldCaEpooenbykp
 CV1Rj4nGavT+jvoB/rsz+KfaYbsxdhOngO6f/XTrTmiy2lOGYNH4I1ZjRgA0hreHZZY514peojK
 NrpDzsPgBpwGRtAi6gfvu/AHy3EoT4cySwMn4bnW73RyTPSukYgBopj7rn2QQeeESYac6PpYphW
 VpfuZ/Wjm2QpKV8/rltlWQZhWI1lK8P49ZXMOa9K4gSvQlrlh+QVapQt7oUQh0KiFY1/XsJ6sq1
 kJGYszwkRMXhqCS6AOVgrxw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111340_331403_D5AFF11D 
X-CRM114-Status: GOOD (  12.17  )
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

The rk_udphy_clk_init() function would currently try to do a strncmp for
a NULL pointer, if DT specifies 'clocks' property, but no 'clock-names'
property. Fix this by making sure the clock has an id string set.

Note that DT binding requires setting clock-names, so this is only a
problem when booting a non-compliant device tree.

Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/message/20260619154349.071321F000E9%40smtp.kernel.org
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 2845a012eafc..3fc8222fcaec 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -432,6 +432,9 @@ static int rk_udphy_clk_init(struct rk_udphy *udphy, struct device *dev)
 
 	/* used for configure phy reference clock frequency */
 	for (i = 0; i < udphy->num_clks; i++) {
+		if (!udphy->clks[i].id)
+			continue;
+
 		if (!strncmp(udphy->clks[i].id, "refclk", 6)) {
 			udphy->refclk = udphy->clks[i].clk;
 			break;

-- 
2.53.0


