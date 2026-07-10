Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06726C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh5hIJ+7O2JY7qrrtymOMkiruUIettb3qb3leyRUg7M=; b=lvElS/BjFKYX2J3kgLeEk285Eo
	lplCJ484nVLGLvcZSVcC+D+ZCZQ9EpmlGzmZ2efZUv7nbYw40BLroxKccAa/rUVH3Y5rnKLNRK/wu
	WmjqItzu+ovPcDstbvH41QoVETKe63iF+IWzQmkiBSO2cyOg3xh7Qc8serdECK+ozoot+4zLHG81T
	Gs4XuxK42ctLj+n5svNW6XWZKTNUzqHjREdwwU6I7P7EZI3sWpKS9uIg1U/KJJ0dGcsST7bg8kJe3
	dZvGt4Gte5nwcMiMathuJ94h3B+GDO9H5kk88z9zwDL1zLWgabEOahvR14BNLdo7Bfg8fAEOe3Wft
	gix8xJsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8N3-00000004h2s-2t8T;
	Fri, 10 Jul 2026 10:22:13 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8N0-00000004h0w-2iKW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:22:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso957976a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678930; x=1784283730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oh5hIJ+7O2JY7qrrtymOMkiruUIettb3qb3leyRUg7M=;
        b=sVuKAkay87ZL8Lm6FxQxrb2Hh0RTkxxz2CgIw4vzG7ey6GI6MbiFWf5JKMv3LkKAzE
         g2UhtGQlIL7H4FxI7KcMMOrEuNHnT06VgNgll+xiY8RFy7vXigGTxazxapUCcoZlhjrn
         D9XvikhgpwW/xaqA1tFF41UcwVzLwjlldH/Btz+LfultT0hXmi8rHRb7DwY1jWz4HLYo
         IxrRq0pW/eNvte1tpJzIyXk/PT1Rn3HGme6brpJmDSiyCu7/zbsJh5R+OmvK+W8P6nbj
         eRhqZNLnv0sg1EKaNCj84lGLuAhxo6EykJGbPDA4Mq1ddX1qCGqe4Q1XSrqDZx8RUAuD
         B6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678930; x=1784283730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Oh5hIJ+7O2JY7qrrtymOMkiruUIettb3qb3leyRUg7M=;
        b=gSZ+IGKhTTnzufxfA2KKM3xPAjVdShoQi1EYIamkqA7S5cEdsNr7D4pOQCBcJhDAnq
         Jv8+mub4xLZ9A39+x2Egc59dBgYwV1hyDiNfEpG+REfeFSSeI/M7ddZTc8ZfYU7Uondo
         ltj3pB2GeoxQBvoIqWUP5+uefA//6dtWXnxIdPXn6T5NoiwQ6XIb5YYGGrmcALMeT00P
         AKcdkbvC9kSOy9JX3RvdTgCODLsjE11UvySHWwgmaaRqHl/XNflPQ5XVHMUWbjrTXm6T
         lAOH0MPr+qHlVEn1LAbSH1kM2wyWW8S0iXGzROA1jUN31edIfA16vvtX6J3B//dUaYPH
         +NpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMwd0n+Z3BUJKcqVsTSSbqKKAEjhCZLUEnSRk5EU4M0AsGCBVuCqwB1yGdD7Chf9zynJnplWg3jzN5be+5IBr5@lists.infradead.org
X-Gm-Message-State: AOJu0YyIn8Ghq/kIMDvy31tvrfyLF5bi/nK5QJk4tG0eGiFLIBHpoSrN
	t5X8D2kwFH/91JqsPRAAZEzyu0lYEO402HHjgi3nhpAkVhDyAaC6tYkM
X-Gm-Gg: AfdE7cn95WD0SWXLHQy2UJRhMiGYAa9Hv1YSFGf3se67BGazng0tYdF0577vK4P7tvX
	QSbdtuZUBYXJXElqY/ZSAYE+TaDKTHLMHuaR/YVmUJrcQIX3oiK37n+ixWSuTEJLVoeFXO57Gcw
	hZ7e6gLeqGW9ehB7tw9YztqSFBF3kFjtcke9GzDpP9HJU4Lr+UOV8MX1P4vsbRCbtg2n6mc8tcm
	rIWZjCnEer1G8UUaDniRj4zks4UH3yEwSYyGIWz05+R7PMdLH5yd/DPMnzTsLyE4uO6laGV9sEl
	JZ77rIFDczONzuJnvTvbx01AqabaMUXVBmYYtCkGrw1zCAj2lBq1nS9tTowIN+PBaZiReiytHW0
	uMJeJeshXZewmRl7gFHK/n/xPUt9uWkRh3bcXgcafgGSqRpNKx1XDgRDbeKHN3VMwe00krmnX22
	y4/Omv2JyL1XXfkFGN/GyM0Z+g25uyhr0fuRK87CsfFW9BJeg=
X-Received: by 2002:a17:90b:3b45:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38940731d1bmr11115641a91.15.1783678929613;
        Fri, 10 Jul 2026 03:22:09 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5516abffsm2490240a91.4.2026.07.10.03.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:22:09 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and drop redundant error handling
Date: Fri, 10 Jul 2026 17:21:38 +0700
Message-ID: <20260710102138.29347-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710102138.29347-1-phucduc.bui@gmail.com>
References: <20260710102138.29347-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032210_694061_91A70585 
X-CRM114-Status: GOOD (  14.28  )
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

Changes in v2:
 - Adjust line wrapping.


 sound/soc/xilinx/xlnx_spdif.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index deb7225c1b4b..ae05818ba064 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -249,21 +249,18 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
-	if (IS_ERR(ctx->axi_clk)) {
-		ret = PTR_ERR(ctx->axi_clk);
-		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ctx->axi_clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->axi_clk),
+				     "failed to get s_axi_aclk\n");
 
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
@@ -282,19 +279,15 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
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


