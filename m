Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93774CDE000
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 17:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6jXmQlYKLG6/+b28m7jod1WCtSytnvjTVSDOiebZDU=; b=nnCCRRMcQXwx97ERcjGpfgIHb3
	xkzBSVbrEJRSeMtP7YsfQOCMG/uit6EkpBm414oR5+TwXr0a3Cq88sIXIMNDZk4AgnFtfx78XR682
	LMOs5zUTyuExlq5dgaHMrZQWl7fc4Kd6DDBkEcmReT3HygOrRqaCdnIk/R+JZlLTF+oTwf5Eyfnkr
	6kEkklqIjBoCizJfd1WQF9C0rIX4omYazQnp4TRUkNPfnZJb5UvcwGXHzY50WAsUsLxJvS3qQcXwY
	YXOtD9utMcE7qfKupaktQ2fsV/3+UmwZFZ8zohjHc/rVRH1RYh0rfPoIg2uW9xRmuR9pPQ8w+PNMT
	d3KRs4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3j-00000009a26-1GMh;
	Thu, 25 Jun 2026 17:40:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wco3G-00000009ZUR-3C5b;
	Thu, 25 Jun 2026 17:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782409180;
	bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o6PfmU/Rq/qqpxOd+/bTWQOGX74elW3LEt5RxAXT4hPtD6tlxgmAMeSPXV3gQUWq4
	 hol+iASN+Adl/UM8hEqzqXdbesZqJV9qWMldgpbzXFY2Vm7hQmcmT+OUcCIsivUeno
	 2hdnRnWC2VAEnLabG4p7V288pgChzM0Rzh6J3r8yQN9EuQUMQKvuRUKqFkxI3dwPwl
	 oWn4ia7sFEfhgPYNmBvxMnFisfvpFjM8McrEY8IHySkyPFAbih93OEdCRUXuBhBzB0
	 7JF/jPPUYGdghQGMbGudKT6fNK9OXLmqbzNwoXaU5x3gKK6BE8C/+jKDvjcwk34O/+
	 i9+YlfxGCUyRA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9762717E10FC;
	Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 008CE480030; Thu, 25 Jun 2026 19:39:40 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 25 Jun 2026 19:39:32 +0200
Subject: [PATCH v7 05/27] phy: rockchip: usbdp: Handle missing clock-names
 DT property gracefully
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260625-rockchip-usbdp-cleanup-v7-5-38eb3cf654fd@collabora.com>
References: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
In-Reply-To: <20260625-rockchip-usbdp-cleanup-v7-0-38eb3cf654fd@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1302;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=gjt94yB7OMQ1kbenpTWsg4rbaygeNwSXNZrsMwALuYQ=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGo9Z9v53VCwL/5j0uIAofPBSiXu39MjOkHXU
 XFisYiBZJSda4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqPWfbAAoJENju1/PI
 O/qaCwUP/RVdbPir5Z7CN3NvuxMsF3OQcR48veQ7vGmUrH3KC/ezePMd9k5Mna7tgaS5vekMEc0
 SjFmkc6SIQSZMySYRQSaUO3AN++KPhFu5hTnaNK/9GuslYp12SXrFiTnLCXVZua81flNBCqpUt6
 A6moHpQQGuLHG9EdGC5q6Gar9djiMRuOusxXnyij8T/598bh6GxUIsZ/2zICAuMmpkklel0/otG
 tiJ+xE5PuA+zl1MBdqXFb9c0/LtqzAHuDNd0Fey6p//rh83jWlLONZq/nBqAGaxUR+WqhiUZaEz
 pkGdevsR+rfx4gln4IUUY1neiTlK6t4EBOlBvH9lpbmvxwngTzVpDArJ33mit5B+DtIDP3Bnlu8
 U98khG0+f9FvZ/zMHaXEc90+2TM7+lXEBFECjJ3Q+XVILXXebFncz8EtaKBP8BirjKpLM6gFdJC
 vwARUZfLUnRHg8aU69uyOjou4wowQ0h4zdPeqlzVZZ6P4ovIVTgNx/nmKmja2N3gLiTZH7eRvZY
 LQ+H51g4U96pfzuzX3BcAZfygytlY/8pB/Q/ybRp7YWtmly71tAJh0IdoSnb0yPYvWTaDFugN7p
 J49znPUlSbWX8ynTuONP0v9+vWLzERLu86RJg2pdEVDTsRRNNmLq/aaokw2Zv7jo0zDEHGiQ5In
 I3+YahrYL7X6RO6Qq6gAvTA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_103946_957060_A78A94C6 
X-CRM114-Status: GOOD (  12.08  )
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


