Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E138CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 15:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7sfbOPHJbYAEokWohXYUSXoQZPN1z7qIsKonuRcYrA=; b=T89jf8tfb5fBUUmYjuICM5qOWD
	FQh0EIx606eOS0uBgcUuXa2iBn6lUBze7Hq5qU+A8RDPkIqgLsAebG5YbCkWPLXjOra8L6BN16RSY
	7L2F6KrmAwFz5ycrNSOxMzphWTcDwrMIH7hQVdaFDmd9ZRK+zdKK87TZIbXenuRxR5tI6X64/p8KL
	Bovq0V81K312IIv+Of8IvD7PNewa5nB/tpg92bSvh74SVWPIlylIyGQHiqtEEa8oJl2jjFDJF0PxQ
	nooifdoT3zqbarNv/nysS58eqOQYgnVOweUTKhTJQtVjGl+9lqIGo0qaBLjSPkIxvg1zP4RctgZDo
	WBQ/g4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umD9D-0000000E8oW-0CXo;
	Wed, 13 Aug 2025 15:12:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtR-0000000E4sI-1JlJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 13 Aug 2025 14:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=y7sfbOPHJbYAEokWohXYUSXoQZPN1z7qIsKonuRcYrA=; b=lHl1obV0IXRb4FYnJm2qm4UYp4
	0gwFi1VaAtFBMioo8E76fqOIlqvHieiy2jhYw9LvRvtptakRcARvcGNqNH1d5Hf+hwde1BjlwpKT3
	+khEEDooDrFc+pF/wlkLCqZWo874eqIaqRhMwds+rGPj1uBCXehXIiI+pPRRSHDAgOdnCcgO7F9yy
	PVwRgB+vC0ePzhj9bSfyon+sqiKeC2Y8t5TgVF/c+Nwi5ui/UBo6KjE536SFm4zRIaDGlAAiR2jid
	b7fitR6HRvrNRjNE/yCY+a45t2gNBe08CJ22qLiq7I9rKhiXpPv6mztDbQYjbMFB3tPhVhYmAkHNk
	keSI7WkA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umCtM-0000000G73S-3ce0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 14:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A84F5C6C50;
	Wed, 13 Aug 2025 14:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3CE7C116B1;
	Wed, 13 Aug 2025 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755096950;
	bh=W5wn3NeKGRyaF5afVGlpCWkJIlaztzO4EVZV0lTaqQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKjmu7gDM/sY1ung+b2oB69H9t9KqVNJfZZG37yj0ObpM930lYQpvllOBqy57EVBb
	 BYqjyn77jC9dpRjHpPpBFufMN/jl3clDlr5WPou97L63ucspEq6u7JFy0XYc4X0PXX
	 SdyDkwbhXhpagqemeI2U66L1rSFi++CLCfbjmXNcTaAahu1KUqq8Lzuj23I9fw3xgR
	 wAIXot0CwvTBXFjN29c36eSgEoFcyIIWdS3fsX/uiK+jOb4kw+0zLbtfq/NYDklvhq
	 YvH6l6B1Q3zb0qe7/veWRGMicVkemt+H1NaNIoOZ6Dmx4zNkTT3wXZGTU41C5zm9P+
	 YrWKodIMh+YSw==
Received: by wens.tw (Postfix, from userid 1000)
	id 341B15FF5B; Wed, 13 Aug 2025 22:55:45 +0800 (CST)
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
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH net-next v2 04/10] soc: sunxi: sram: register regmap as syscon
Date: Wed, 13 Aug 2025 22:55:34 +0800
Message-Id: <20250813145540.2577789-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250813145540.2577789-1-wens@kernel.org>
References: <20250813145540.2577789-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_155553_145898_F65E0F34 
X-CRM114-Status: GOOD (  16.52  )
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


