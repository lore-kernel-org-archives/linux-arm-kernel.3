Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4F6D2E9D8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 11:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=; b=qO6s0bUcK2ZEiFWXRW7QKdTGZj
	7hFNBSmiDlCAYIEZhIqt/Ar5x2zewGp+AimGopAILpuXzCSdRDtVm4NdIPx/1MDvEyxssceQEuiD8
	kOf43m+UxJINcac7DtKfCi5nIoWhA7S1orRwf5RTXiC7WisvwhaI+U5tpWBOoDKVw1/RminkqMGlU
	WYkcBma1fGHUMACktrXdru1+l9YQtw9guSrZc4E7hzuRnd9FwMdsLIcCmQ86lEYFDPwBk8GAf1FD/
	p0LU5pmmavbdXW98L7emBCDmdY9XQB/gtw54o4wkaEKASh2dpgLqQnaIAmLvP+Xm8ht9Q2fET/Fd7
	8oviaQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tASWD-0000000HRCt-3JCG;
	Mon, 11 Nov 2024 11:23:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tASSa-0000000HQDO-0f6v
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 11:19:59 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a99ebb390a5so1005311366b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Nov 2024 03:19:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731323993; x=1731928793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=dgt8+RRYADxPTW0uQV2pTwQUHG42vPi31ug2j0OKWRXQVOwo9L49pBECsDvPYYWMes
         iFfeaZBkqkdMq6EyTwE2Uknr0rhtKQTJJ9zwBHdt8fnVPUYaf0JEv8bIcwEEosA5vXwf
         WGFs7kKSjYg0DCOaaPxmZytrFnj2VbIPNx90+SICAEc40YrdLSTJrie8RTYeU744tcTx
         6kjducdCJtNo7XK/LBwCprfIsurgmz0BvxtuxbTxbEZ9bb8ALjzCmUyxh3OF7k4B+vkX
         gS6662UWsJa5gcq08VEOOi9vgNNeFIHiAJVQDUlqRuqHM7R6pn+xXMLl94qb2AWm1uZ5
         creA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731323993; x=1731928793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4v/gyj/fLO48IP0NaLXgCS56M3wS/277l+hJaYFIg=;
        b=sNqf+ql0Xsek/dBbOHYYU9+2po0APuuDeP5o1tPdbjsYNxaR/hf7U8w2+faafM7QHO
         oNJda5fOHfAICzqyHiE3EnzI14OfeDwP4CQ8msXRY+oI/aYpLJa3fv8s3Nh0rme0wrNF
         chI1ZcfBX6ozPAzU0swGOVyWihUVvdBp5fT+Et8PRVfKwPlOONEoIqNvSVe6y5qjcP9W
         aQB4q9tBr/Msnll9U59Hs8ZRg4iZwS9SKQLR6pL+L8xMT7YiRupgsdoHivgaquBjt0z8
         l6u2fHYLQ3r7291avlkHu5b3YJb5n5EkISEzp5fOoN7h314XNB4LfbXD4YaRaFBQiaQA
         O2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWEx2V4DYBwRMdU/X6Jk06v7SbUAs3ptQY+Ykc06B+TXKKlVCfV7R4cF/ShfKrwBK88jYNevxe4O+2QXZp1SvV@lists.infradead.org
X-Gm-Message-State: AOJu0YwZuGyitaa6YN0N9VKA0ymsMMhTtss+we+i87lcQPAiRjWdysuj
	izA/3oyiB3pNnxoZtInoLjDJStP1jx+lOfyW8y6i+h/cttZr2fD1RzKx3uyTsfM=
X-Google-Smtp-Source: AGHT+IGuK2Mqhh/4a1qh5q0NmwjtNgZX29PbWEQEw3KvEot2jIrlM7uXsL6sEyoljZjEBiZjnawbgg==
X-Received: by 2002:a17:907:96aa:b0:a9e:b5d0:4714 with SMTP id a640c23a62f3a-a9eeff934b8mr1161128666b.21.1731323993471;
        Mon, 11 Nov 2024 03:19:53 -0800 (PST)
Received: from 1.. ([79.115.63.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2e922sm582530866b.193.2024.11.11.03.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 03:19:52 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 2/3] mtd: spi-nor: use local variable for struct device
Date: Mon, 11 Nov 2024 13:19:45 +0200
Message-Id: <20241111111946.9048-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241111111946.9048-1-tudor.ambarus@linaro.org>
References: <20241111111946.9048-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819; i=tudor.ambarus@linaro.org; h=from:subject; bh=xXAvRj8AmLSKWPBTJCUUr8yNr91DS97PKpc1oBmJELU=; b=owEBbQGS/pANAwAKAUtVT0eljRTpAcsmYgBnMehS9ebdJFKcsy5atBuVMxdS3C7109r1J/woe qFiYPTIviuJATMEAAEKAB0WIQQdQirKzw7IbV4d/t9LVU9HpY0U6QUCZzHoUgAKCRBLVU9HpY0U 6ZjVB/0WO+cX4vsaTdpLFXuKZKYDOuInLaBWEUgEPPZ/8cU4SDjiZKvr8yqh0UtViU1djsAGxrU lbbkvJAMmNKkIx66H4M55b1h6KMzypC7Gh2btvdMNc0kajfHClQULdOw/bmIgmUvlEGyMUaesei wMP4FzWZrVtgS990dISZi7Pb49XLFqGXQ+Ljbjhjh52HD0NDBRYPAY0GoVz2WfswymhIVH58lLn qM4IX/9b2evCs9iyAkAnuO6ihfSpfUSuoisuuY3nW3tEB9ewWucFstc9YWOmEQD/QN9wZiBRnk3 kFup7CWm/XBWyReXdRdjHbbjrhiBuF8zQinlnQoUIb61MhR1
X-Developer-Key: i=tudor.ambarus@linaro.org; a=openpgp; fpr=280B06FD4CAAD2980C46DDDF4DB1B079AD29CF3D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_031956_330330_31F89A7F 
X-CRM114-Status: GOOD (  12.19  )
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

Use a local variable for the struct device pointers to avoid
dereferencing.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v5: new patch

 drivers/mtd/spi-nor/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index b6f374ded390..2a329084505c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3576,7 +3576,8 @@ static int spi_nor_create_write_dirmap(struct spi_nor *nor)
 static int spi_nor_probe(struct spi_mem *spimem)
 {
 	struct spi_device *spi = spimem->spi;
-	struct flash_platform_data *data = dev_get_platdata(&spi->dev);
+	struct device *dev = &spi->dev;
+	struct flash_platform_data *data = dev_get_platdata(dev);
 	struct spi_nor *nor;
 	/*
 	 * Enable all caps by default. The core will mask them after
@@ -3586,13 +3587,13 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	char *flash_name;
 	int ret;
 
-	nor = devm_kzalloc(&spi->dev, sizeof(*nor), GFP_KERNEL);
+	nor = devm_kzalloc(dev, sizeof(*nor), GFP_KERNEL);
 	if (!nor)
 		return -ENOMEM;
 
 	nor->spimem = spimem;
-	nor->dev = &spi->dev;
-	spi_nor_set_flash_node(nor, spi->dev.of_node);
+	nor->dev = dev;
+	spi_nor_set_flash_node(nor, dev->of_node);
 
 	spi_mem_set_drvdata(spimem, nor);
 
@@ -3628,9 +3629,8 @@ static int spi_nor_probe(struct spi_mem *spimem)
 	 */
 	if (nor->params->page_size > PAGE_SIZE) {
 		nor->bouncebuf_size = nor->params->page_size;
-		devm_kfree(nor->dev, nor->bouncebuf);
-		nor->bouncebuf = devm_kmalloc(nor->dev,
-					      nor->bouncebuf_size,
+		devm_kfree(dev, nor->bouncebuf);
+		nor->bouncebuf = devm_kmalloc(dev, nor->bouncebuf_size,
 					      GFP_KERNEL);
 		if (!nor->bouncebuf)
 			return -ENOMEM;
-- 
2.34.1


