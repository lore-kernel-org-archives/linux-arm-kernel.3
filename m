Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C623EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 05:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycIvlxwe0x12FPCgy021uD9ce3/L5Ep6ZuVevp5ozGk=; b=DMLI3BOSRrR7XA7hTRuaV3nSEn
	BYREoyDM+z8uxVyxiKBOLsMoVIh0CcwpS7odQwQC6QU5///oONfZWGtSh6jE1fcgp9Dz8HH+/10Ta
	TAFMc74ptp3NOlCO4ZcJIhQdAXuxjuXS10q7zzZiOnmhclYmx797rPrXu3iSEHsFDrFooSFzFxmYE
	UHes6fjK+DVPvmPSw6YMGL8gYSPiGVeQP1uuiqolWzqZnUYevGXHvT5CuSFx9Rx6b2Z2Pt+pQMgv8
	zEjeLK7LfScyDUbpkVyDX7BUe1qs2Rqo96MNF8qon1cw9x2vLFDQ+xnHCwHl5A1HlO9/T6JzN/nri
	E2dN+FaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3O1-000000047VX-02BT;
	Fri, 10 Jul 2026 05:02:53 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi3Ny-000000047Ua-2p0j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 05:02:51 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-381ed661712so693815a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 22:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659770; x=1784264570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycIvlxwe0x12FPCgy021uD9ce3/L5Ep6ZuVevp5ozGk=;
        b=c6GcKWP4X0J7c/4dqxLExqJlptlLBLsqJtQySzJ8iaJg7LhAo36fyWGKHhSwM4WkJ9
         KfR9R5Ha/BARFqLglO3DvTu4+8Vg4uhQqgOQRFeEBAvGUoe6MlidVxeNIjUkhbsGkfVE
         /4mJQ5esARewZfcbKNFfeQTVBMbLpbzms+xNRwQ8rQ2Jujc5XyqauddZu8O/B27XuUag
         2KyevyJkR1ltkt9H2TGyGlGkgxLF1kvtf9wox3OQHRc7gaLNeDzt0+c+yFAAt2kLzP8d
         2qXWgj/cRSdv47OPhnkVG8eNVylM+KUe70ce/bGspqfNbFVGL63YRBiLBsLk78m0Z/KA
         NQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659770; x=1784264570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycIvlxwe0x12FPCgy021uD9ce3/L5Ep6ZuVevp5ozGk=;
        b=Z9QGJnVU+yACzEX1aPgi00ssMgUM6spK/wssP2KeSwyof/7iq6NqfxkJh04uIJ3/vc
         p+woEeODn2+iJfUD6ZLutX1gx1sEEnnkgxar5LFQw6Ysj3fxsmVOZ5P19bx9ckXl6dxu
         RQHUK+E4NAMTpgNU7fq8zemYvcoQqEArmpwxwLLRrdIXuOG/C0R2FADGhyZnvWqmAJXl
         /gHgtdNwzzkGyCbew7As777QSCy6qcUlHJvnMdvBv3scOjdjcSTCzM6/zszG/SnlTuZ4
         dQeLKDfBAJrYWIUI1Uw6Qqr73TCiF09U2cAg0pip8X1OZgK1YxtmQk9Ot6aLEiqCtAP7
         sRiA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5gkFzQ1PU9uh+a78uq1IRsYdVrA5MnrwU0RwQ6VIVJLG9mvbSmP+83FDTiynShRWFEnM2TNraCrCigEbbfQef@lists.infradead.org
X-Gm-Message-State: AOJu0Ywbr2Z1g5Sn4thki+zedFYobEc7yvXbBFFwo3WvAKbQx3ndwrQo
	QXStqgTc4MZ4jWEadLDXnWkBQ8zAmt3g0exlp3vQGO5WYtyMpDu0AtxK
X-Gm-Gg: AfdE7cku0ZFGRFLjj94fUVlSEiyDGmgCv15cUDuoL6A1+r9daNojAcG+V53wDS0oHSE
	BLzmjKWUlefgNj9k84VU1zuWlILeaULsFJyERKr4wQ7QRfYMky4IQBo2WOF+sJ4F+n2TIvbUWpH
	geZo4IR1CntD8kuazyrdiZ2b8TEAt8E5lm2jvKCFSVU8BJAR33KCwyLTLu+YbEG2No7C9tIMuDu
	7w3AhcJUge0JHClDGCPEmv8iFuxuzm9LPlT4D+NLg3i3vlCDASUmdp4S9eU4c+pggy3rsll1CPM
	bN/xLyfuQwdIP4513zDaMlMY2WwzZp7HaiEyAB/SD84J+ksbJLS4gxf7B0u21CH4/7M+SARpsOf
	24QRzew9BVieo9Fb56ArNRly1iivcjYGbcNmNw/52Wsmzlo1y/rGEMOd0N4fPzTLlbW6oA0XbKk
	NWJHfKLF6aP97kn4ko+kSUgTyTNXOOEf8FXCq4O0lGZtN3bCs=
X-Received: by 2002:a17:90b:3c4a:b0:381:21ea:912b with SMTP id 98e67ed59e1d1-3893f693923mr9181403a91.1.1783659769825;
        Thu, 09 Jul 2026 22:02:49 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516ad85sm2139647a91.2.2026.07.09.22.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:02:49 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 12:02:23 +0700
Message-ID: <20260710050223.14266-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050223.14266-1-phucduc.bui@gmail.com>
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_220250_722310_294100E2 
X-CRM114-Status: GOOD (  13.53  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Use dev_err_probe() for probe error handling where appropriate to
simplify the code and properly handle deferred probe.
Also remove redundant error messages when the called helper already
reports failures, returning the error directly to avoid duplicate
logging.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xilinx/xlnx_spdif.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index 017a64ab9f1e..8f4d238be890 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -249,21 +249,17 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
-	if (IS_ERR(ctx->axi_clk)) {
-		ret = PTR_ERR(ctx->axi_clk);
-		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");
 
 	ctx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ctx->base))
 		return PTR_ERR(ctx->base);
 
 	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
-	if (ret < 0) {
-		dev_err(dev, "cannot get SPDIF mode\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
+
 	if (ctx->mode) {
 		dai_drv = &xlnx_spdif_tx_dai;
 	} else {
@@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, ret,
 				       xlnx_spdifrx_irq_handler,
 				       0, "XLNX_SPDIF_RX", ctx);
-		if (ret) {
-			dev_err(dev, "spdif rx irq request failed\n");
-			return -ENODEV;
-		}
+		if (ret)
+			return ret;
 
 		init_waitqueue_head(&ctx->chsts_q);
 		dai_drv = &xlnx_spdif_rx_dai;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
-	if (ret < 0) {
-		dev_err(dev, "cannot get aud_clk_i value\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
 
 	dev_set_drvdata(dev, ctx);
 
 	ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
 					      dai_drv, 1);
-	if (ret) {
-		dev_err(dev, "SPDIF component registration failed\n");
+	if (ret)
 		return ret;
-	}
 
 	writel(XSPDIF_SOFT_RESET_VALUE, ctx->base + XSPDIF_SOFT_RESET_REG);
 	dev_info(dev, "%s DAI registered\n", dai_drv->name);
-- 
2.43.0


