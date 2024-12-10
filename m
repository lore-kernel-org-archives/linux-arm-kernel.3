Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889D0E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 07:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=; b=QpPye5c9WRhESwMdPAYkny07ZA
	/SzAIydarSa2f8I3UW8Zbm9KHbkC/zWJLEdMj3JyqClQwPJEXVAjSPNCtrZ0fHilB4WG2WPBQ7NCg
	bEwV2kOE8A+r4oOBYrofymtUMEg+80qTGvTKWrfRUA4ykn8q9I+j4zfUuMZ0otBRNWu18RiwU2Oqc
	qFb40q1XHh9PrXQ1CRmk8wmA4kO7XU6UyjzNHHlvkURxS63BKM78IEfNTs4Fp1JojJJFnsm5vqH75
	l5AuiMoVY3k5ZyAohgcUewL84APhYe05YrZITrV8E6AEQuiiVie+6JYnhFdGdliXH70ccXCP/dlc3
	p9syqgpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKumJ-0000000AZZn-1EPv;
	Tue, 10 Dec 2024 07:35:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKujI-0000000AZ49-3Yrq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 07:32:26 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so4190442a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 23:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733815944; x=1734420744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=;
        b=SKF9z6GpLlR74X6XCE4QRwqNaJpeH3q6LtErFk3WWx8mK1H6aG/lKzDxkXE5xT2xid
         oz3yERxRevoxzAoNy27SZP2hlbvy0Tj46IQGbVGub1ziJnCjVe54B/9dvlAtTzlqaPBx
         nwME+K+kWv/Z2FFae67C/t824/6gtKUvcHevs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733815944; x=1734420744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oIYaaljMW1uOvyE52JKpg1mRNjsi/3D4cn4UsNQnmlk=;
        b=OhERH16fzrma6q2Z3C7bLoR1b0T3/Osgy6WFYnexsh6SdMs6GZUhD1W88aU9EftdxZ
         X2tVyQRaf88F6N+71fAHh18jAEjX6Isk5Fr/amLQ7HTGX5UFKydM932yHk99tKceaERq
         poZj1hmc3KKmsCexkysVbNJx1s5hUajDbZTl3nC276snndvfqfSXrYBfVS5QXIL79PyW
         6HdCcEw//quzkuQvACa+M6cYwiRccWmZDkxL/Xznc4fkpGRptvYRcfyowxE/KvO85yw0
         sLzN6TpfuJMVbYCAzr9kf+NJIlB/choKcRL5cJrz1QVjskgyC3Clgu+gmDwwF5rd2W3o
         3BBg==
X-Forwarded-Encrypted: i=1; AJvYcCV2g0fBKGt6d4CLBz+yzs0ZJnNSHLXR3JS5t7li6leXTlyHPBzBt6ifv488A2D+sFDcvRCG/2JxJKX6B8SIUR6N@lists.infradead.org
X-Gm-Message-State: AOJu0YyqpjFh1nzV/8hSWGpC/tWXxj0/iailNu4pyC7WZSMZtlHvvZIV
	pdi595H41wzecLcTUO8dp2q0aEZOal/H0PR/3Q1dQeqTSIn/Hk7I/CzXT/+pUA==
X-Gm-Gg: ASbGncukTvyzUuN1N0+O4wuqZMG7TivCiBIrLTV9J5ioE6wsOyCbAUmbD+Y82UTpzVE
	zVM2dZo1txcIePLXw4FO4Jk8jXYIBQ0TmCyKh7VsSHIWz4lmfxA8u/Wx2m+PlDHltQz4tffirwl
	TSgfQ/vxZDd1rGhUTYVCosZ6YmJDiCUAQVnev/trRnVG4J/4L25B0ompZgDXyzoRzb33HErE5NX
	BgGDKxicaHwi6HHZj/Zi72twBokIaGCl3DmlSlnDJZFjo0JhaRslOidKChoSy/ENK031Dz4
X-Google-Smtp-Source: AGHT+IEljjpPjIkRAq9lZ+wjZ9Q+4usk5mFRZZW08ysh+jkDMPJ/btZlL9SUPYyzmbG9svkENmEq7A==
X-Received: by 2002:a17:902:ce88:b0:216:55a1:35a with SMTP id d9443c01a7336-2166a0097c0mr55964065ad.30.1733815943958;
        Mon, 09 Dec 2024 23:32:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f09146sm83693295ad.199.2024.12.09.23.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 23:32:23 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Subject: [PATCH v2 2/2] mmc: mtk-sd: Limit getting top_base to SoCs that require it
Date: Tue, 10 Dec 2024 15:32:11 +0800
Message-ID: <20241210073212.3917912-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210073212.3917912-1-wenst@chromium.org>
References: <20241210073212.3917912-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_233224_889659_77DE9324 
X-CRM114-Status: GOOD (  17.83  )
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

Currently the mtk-sd driver tries to get and map the second register
base, named top_base in the code, regardless of whether the SoC model
actually has it or not. This produces confusing big error messages on
the platforms that don't need it:

    mtk-msdc 11260000.mmc: error -EINVAL: invalid resource (null)

Limit it to the platforms that actually require it, based on their
device tree entries, and properly fail if it is missing.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/mmc/host/mtk-sd.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index e2c385853eef..1bb7044f4ca1 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -414,6 +414,7 @@ struct mtk_mmc_compatible {
 	u8 clk_div_bits;
 	bool recheck_sdio_irq;
 	bool hs400_tune; /* only used for MT8173 */
+	bool needs_top_base;
 	u32 pad_tune_reg;
 	bool async_fifo;
 	bool data_tune;
@@ -587,6 +588,7 @@ static const struct mtk_mmc_compatible mt7986_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = true,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -627,6 +629,7 @@ static const struct mtk_mmc_compatible mt8183_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -653,6 +656,7 @@ static const struct mtk_mmc_compatible mt8196_compat = {
 	.clk_div_bits = 12,
 	.recheck_sdio_irq = false,
 	.hs400_tune = false,
+	.needs_top_base = true,
 	.pad_tune_reg = MSDC_PAD_TUNE0,
 	.async_fifo = true,
 	.data_tune = true,
@@ -2887,9 +2891,13 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(host->base))
 		return PTR_ERR(host->base);
 
-	host->top_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(host->top_base))
-		host->top_base = NULL;
+	host->dev_comp = of_device_get_match_data(&pdev->dev);
+
+	if (host->dev_comp->needs_top_base) {
+		host->top_base = devm_platform_ioremap_resource(pdev, 1);
+		if (IS_ERR(host->top_base))
+			return PTR_ERR(host->top_base);
+	}
 
 	ret = mmc_regulator_get_supply(mmc);
 	if (ret)
@@ -2951,7 +2959,6 @@ static int msdc_drv_probe(struct platform_device *pdev)
 	msdc_of_property_parse(pdev, host);
 
 	host->dev = &pdev->dev;
-	host->dev_comp = of_device_get_match_data(&pdev->dev);
 	host->src_clk_freq = clk_get_rate(host->src_clk);
 	/* Set host parameters to mmc */
 	mmc->ops = &mt_msdc_ops;
-- 
2.47.0.338.g60cca15819-goog


