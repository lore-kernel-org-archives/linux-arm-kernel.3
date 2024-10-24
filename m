Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CF3CE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sdc0n77WzmRaIsQcNtQtD/WVPWuMLNG37KAerrThZGw=; b=kRkTdRKPJebDRfWYwWQMYiq9lJ
	nqpFaGfJnzQXDQvWJbqRZHHoA+Z5nTU5GG7bNOsrHn5sxgMI1Nu36jhCOCiknrElgpnLXMxIPdoo6
	D26zJrGxRDugcqHi4fG8qG/95+vHSsK1KMmXLdutoilZE8MzWZwVNHeickIyiOhBc3OCnDmoxnesR
	gN1bwkOuAzWWdsBZBvWyofIDrlEOJ84m+2NcjtQKzGrs2wveuYAYIZwbj6H1uMC7Vg60+934+nvAI
	085DZjRNZ1w83tpUDMg4bcLmNi7csNHprXnntfFmCRf01VFwOJtSrUjEPodhcIF3G2Wtqg6JjEwCg
	YssORqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41T8-00000001FQ5-27Ps;
	Thu, 24 Oct 2024 17:17:54 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41LG-00000001Dlq-2XFY;
	Thu, 24 Oct 2024 17:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1729789782;
	bh=JkRVwM9k+j3E/nlOdSLDJcFQJqTbTeyz4GS5TOzoBYo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fu0uHdmhg589NknjBuOq9MenRyuPkuLBEwT8UHfJfGkBBQxJ0hjtome9pFYIJ+ttH
	 yKeWh1Jg8E+iEXu7C5XCIQSpBNGf8kSqDa33v+kuK3L3PRnHPpAF9zvKb0V9uIU+/a
	 GynAIKZ3nVc4shet1UoW5blBjtZxNaMS8uLnjCxh9EFoEPMlJ9l1z+y1id20ZKcXkr
	 V+fE7ofcC6P22gbdH5KAYDiwtn2q0uNfEmE7kU2UJA1aZQgsUdHtX5KZQ/EOTltLxQ
	 0tNG3dPJI4PTOWsD/PXI1M1bLyvPGfNnPu1v77ZKBa+KHbvIaHbti9KNY/O6CJtxpl
	 DRh1VwlvO88Mw==
X-Virus-Scanned: by epochal.quest
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Andre Przywara <andre.przywara@arm.com>,
	Parthiban <parthiban@linumiz.com>,
	Yangtao Li <frank@allwinnertech.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <treding@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH 03/13] dt-bindings: phy: sun50i-a64: add a100 compatible
Date: Thu, 24 Oct 2024 14:05:21 -0300
Message-ID: <20241024170540.2721307-4-masterr3c0rd@epochal.quest>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100946_815824_03717D6C 
X-CRM114-Status: UNSURE (   8.83  )
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

The USB PHY found in the A100 is similar to that found in the A64,
although it requires some quirks to be enabled. Add a compatible for the
A100's variant.

Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index f557feca9763..b91e6c83722c 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - allwinner,sun20i-d1-usb-phy
       - allwinner,sun50i-a64-usb-phy
+      - allwinner,sun50i-a100-usb-phy
 
   reg:
     items:
-- 
2.47.0


