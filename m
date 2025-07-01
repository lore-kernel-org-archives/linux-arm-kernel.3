Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B858C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOYTYWWc8PUvVc4bul7wn2N2WIwzUwIC/CcClgPGY5Y=; b=lTlGGY9G2c0x53YYN5bJusVF+W
	zrFXM9w9Hd6oBLsoU73a4iyn4LvVAUkdtzWqAQDbofss8IHQ9FQ3v7yv0EvvmjL/svZI8yjDXy3kM
	j6c0l/HbalSaDt/FK3pURBSKCn5htprHcz1pHQjzV8HiSbcxZ+EbVKFENyhxB7oM1cwmmjtR5yRGM
	zLGTNie7zxnAC1aRG1LHwtbVYt6ZkpIyFDxWm0eM/6huTdKyESVxpOTEg3lDyQjKEjDWOooHobA6q
	cA8kRF0ogQTfdT5m1qqt/oAoV1tQHksuHJWnuCA7DE8T5PF9XLzSfs+dQ9Jp8rf4dSD6YxUlroVaG
	2d03pB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgcu-00000006TM4-25vM;
	Tue, 01 Jul 2025 19:26:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWeJ7-000000068ZS-1aTb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 16:58:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAE7C467FC;
	Tue,  1 Jul 2025 16:58:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53288C4CEF8;
	Tue,  1 Jul 2025 16:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751389088;
	bh=I/bJFFYuJYTgGBIDN+smaPh81pdclQ4NTY0/0vTHG0Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZmNrt4MUMKTDeLpB9MdnSdSE18qRibwY8Nbtz/Isya33gvsd8q4Pkzx8o2FY7QY23
	 SF70tJKMuR70mbxPbgxJ+OB2jTM4ieHcxzYC89iAxmEd5LYUVdoVYQ4pz1Ig512DPh
	 GvGRXMHs154G81LOE2/Fdng7K4HVDTb+e/ZT2JBluFArZ00QQck7u5rxkcSc/1eTlz
	 f1bC6E2NJZm7uSCtKL1Z2heRMhw6DHwT21YnOVz74U8AIdaq6I4WjYpN6AiUZdlxo7
	 2mhy1zKf2y3EAzRZcNbtZvjA49GA6fwiTFEwQ4WGCuUQAgzBxGDLgt1im6e/n/1QMC
	 Xe79bZgFiuqOw==
Received: by wens.tw (Postfix, from userid 1000)
	id E2E595FF71; Wed,  2 Jul 2025 00:58:05 +0800 (CST)
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
Subject: [PATCH RFT net-next 04/10] soc: sunxi: sram: register regmap as syscon
Date: Wed,  2 Jul 2025 00:57:50 +0800
Message-Id: <20250701165756.258356-5-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250701165756.258356-1-wens@kernel.org>
References: <20250701165756.258356-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_095809_446152_3AF9EB96 
X-CRM114-Status: GOOD (  13.79  )
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

Until now, if the system controller had a ethernet controller glue layer
control register, a limited access regmap would be registered and tied
to the system controller struct device for the ethernet driver to use.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/soc/sunxi/sunxi_sram.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/sunxi/sunxi_sram.c b/drivers/soc/sunxi/sunxi_sram.c
index 4f8d510b7e1e..63c23bdffa78 100644
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
+		if (IS_ERR(ret))
+			return ret;
 	}
 
 	of_platform_populate(dev->of_node, NULL, NULL, dev);
-- 
2.39.5


