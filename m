Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 01:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=LCTeKOtJCcNcqhm8kK+2rG9VUL
	3pdBkEgRyY+f62Y1uIJbSB2ppzo02PHA9TKw0l6FSJR+HP7XfdBAfvR3XGuVQEUs7BC4wHdeplITR
	+rO4iffJnaJsAjOKRguhCo2eQJ5XrgdbeW3UGJE0qJ+qeDN3yhZL+M/ab9W+i7ioFqJIVlU8ytlhi
	Has7s0lqd/YgttoufbY3PFnEtuP8z+E3nbt6luR6UhVmfDW6Q3ue/Hdxnm+iiDhRg2XGVwEvFJ0Xg
	dF9xXsTFKVPnDGCCOptSFjKyMksXYIn6V8tLN0p0ZWrmMffj8G8yz+us9vYkDiMW+uTOUoNoWRehd
	DGcJeVOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TM-00000003A47-0ASO;
	Wed, 01 Jul 2026 23:36:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf4TE-000000039ll-2kUk;
	Wed, 01 Jul 2026 23:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782948949;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lByMA+n1w7UnYPYOdhaxOBwVg8kmnVgI/qv/UFAwLskvkAeBZQfCrbT6AZ4eWpTF9
	 KB4UpQ4DrIriZ134spZ67snz9EVAUnBfwmhVSNVwtAVGnTUDnbttSLEEZsaCDz5Zy8
	 i4NJp1wlSrBkQW1wWPsIA3R3cuqRH18aqrfb7kpOMFTJYgnn2xaoem/LQD9M22hInd
	 +ClaYk2NG2on1LUPWzetb54gbbbINxGau3qdMd7xZOm8kPWWEPuf5pwnTM88FKI6xc
	 5rn/zdH+ScemqPJ6flwxHbVS6yzmqKxGLMxPM3Q5O8vy8x+VqfNrg0XZLSF0ZW3R6V
	 PMkr+5ARGWm7A==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5018B17E116D;
	Thu,  2 Jul 2026 01:35:49 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B3ACE480031; Thu, 02 Jul 2026 01:35:48 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 02 Jul 2026 01:35:43 +0200
Subject: [PATCH v9 05/38] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-rockchip-usbdp-cleanup-v9-5-e31efbb62d2e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpFpFMAFuQICuq+pgZahF9eFNY8XO4s4xAU/
 bruW5mzt8lSqIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqRaRTAAoJENju1/PI
 O/qamqAP/i+W0rkOK4Was4V7O/+GfjSo4lpHOLHp5ojqVKKjupJsWXkZKuO5agbostaupQ2Sfa2
 fXhk+pvQULC4q5QBK7bzpOAzqp7w23Mqlr5SiN21Lf4mmchRKqGG321E9+KWXosyrb1lWlX1LbM
 VrH7FX/AVwdVjDiC7aXmM4bJKIvZZhISP3Fmrf3WcUDrwZbuM5i7B5jfsFvvnotW1rK98pJ8Nq8
 G20kxYanxvQM78MkZiuLoyWZKZUAttgeq0YPeHgUBtxvOrE5Y9fh0f31Pp3JnpofgVzOXoQ8LW4
 Z9dIeZ3+5e4/kw/VIvUR6LZNWO37JDH0Ym7Ocxkr8s5FmEMB9mI6/a+aZfxXArOa4C9V1rKrEyI
 NwvpoMYS1h0DN8j4MWjf7EfIPkR7nPbrWxNcREtxFXYissJWartwUjVS/SHAYrw9kqgf9h6zrv8
 pXVCU18120CVPYULNUgM/25h2KvRnfFPjI9zwbnm2Xd5DU/TVWl875dop5qdhlvcWzx+23Vbydt
 eSMLr44hD2CegzLSRyAYeYeggl52Zu16R6rNevD9G6N9GUKAEokPNenhneB2wbYKCyKRfQomfJm
 ZW6hCpKP1XaDhtiZrN0bUCRfCtD4Xm/n73/TfKMo060Whde5U/Nebcfl2fWo7J0974M1cMAqjub
 V5YIg09rozL4zVoRr8tY7HQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_163557_204488_68B681E1 
X-CRM114-Status: GOOD (  12.66  )
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


