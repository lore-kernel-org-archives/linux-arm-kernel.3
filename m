Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05933CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOpXjH4zHe57lK3qdi/P8WojOgWdtQbWVpZlp1YAxCc=; b=QAKLnJSYzM9cbtsox0mpWlVpOb
	sbEQiWWaxAkTPRz4A+3ShzoX5XMkcba9Z1e+3yq7AEi8gj0goHgCBRJDYz6dLZDi091KOvelx3vF/
	oNNJyTGroxEa8dLpJ6eJMMEkNgWpw02OG34fSr6W9gFnuInG0dkN5AIUUQ3JHAstopdldCCYifY4d
	oOVCVsB+A9SuQo4NCEE4WymLoUmqrzHmjxECUreYu8TwF0cm3J+snjYrCu5c5GpWtpZ2EEmaebk/L
	ngRWiUkYsGY5ijd6UiUeEIyzmvbHosbAZWAhVgrC3NghH6a7KXJ8CWL6yqaKGFZ2ummMf28V8f7qL
	kIrZ1HeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvley-000000033bc-0aRJ;
	Mon, 08 Sep 2025 23:52:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgKg-00000001RIX-0UCQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 18:11:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F23860223;
	Mon,  8 Sep 2025 18:11:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BF2C4AF0B;
	Mon,  8 Sep 2025 18:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757355071;
	bh=lfdtXInB87tu2kO8lr4PclPJGDu1MGh0UniOZ5ZFUPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsJSXMDAgjrWt/CinApi/kfH/8IGCgQE9y6YylGIBATS7IcSBWWNry81z2gxcwVWB
	 tM7RDdrsu+8LA94mFbNDO1MFtYTTIzlMBb2MGExtX0mkOfWrNM76q+d5ZXEgtaAoQL
	 v6dPuMeNcBwaY8UzZiqj2blSBxgH/gBS6+jLsSDSXY1tdaa0m1JmpwlcMf9XtEfvvg
	 h7L7tYWk0ld31Pi5kjxGMkOrVOH7uLPL9EE4/dk2dM1Elm/Fqhhq3OV7WohSU+MLMr
	 RK9e7/6nvodl34f1VixxghUpbatZbmcdPbJnP4KOGfDWAl+RPVD0jbobHFISuYgtnq
	 IawI8k8rQj62A==
Received: by wens.tw (Postfix, from userid 1000)
	id 1BF805FEB3; Tue, 09 Sep 2025 02:11:09 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH net-next v4 04/10] soc: sunxi: sram: register regmap as syscon
Date: Tue,  9 Sep 2025 02:10:53 +0800
Message-Id: <20250908181059.1785605-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908181059.1785605-1-wens@kernel.org>
References: <20250908181059.1785605-1-wens@kernel.org>
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

From: Chen-Yu Tsai <wens@csie.org>

If the system controller had a ethernet controller glue layer control
register, a limited access regmap would be registered and tied to the
system controller struct device for the ethernet driver to use.

Until now, for the ethernet driver to acquire this regmap, it had to
do a of_parse_phandle() + find device + dev_get_regmap() sequence.
Since the syscon framework allows a provider to register a custom
regmap for its device node, and the ethernet driver already uses
syscon for one platform, this provides a much more easier way to
pass the regmap.

Use of_syscon_register_regmap() to register our regmap with the
syscon framework so that consumers can retrieve it that way.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v1:
- Fix check on return value
- Expand commit message
---
 drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 4f8d510b7e1e..1837e1b5dce8 100644
--- a/drivers/soc/sunxi/sunxi_sram.c
+++ b/drivers/soc/sunxi/sunxi_sram.c
@@ -12,6 +12,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -377,6 +378,7 @@ static int __init sunxi_sram_probe(struct platform_device *pdev)
 	const struct sunxi_sramc_variant *variant;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
+	int ret;
 
 	sram_dev = &pdev->dev;
 
@@ -394,6 +396,10 @@ static int __init sunxi_sram_probe(struct platform_device *pdev)
 		regmap = devm_regmap_init_mmio(dev, base, &sunxi_sram_regmap_config);
 		if (IS_ERR(regmap))
 			return PTR_ERR(regmap);
+
+		ret = of_syscon_register_regmap(dev->of_node, regmap);
+		if (ret)
+			return ret;
 	}
 
 	of_platform_populate(dev->of_node, NULL, NULL, dev);
-- 
2.39.5


