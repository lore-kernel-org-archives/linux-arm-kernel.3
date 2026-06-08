Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5050CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=41O9k0y5eFiUd6+1CLxq2KiJxjSqZ/KgLg6URVebdXU=; b=YBRHKRQQCF92DmyEliWDgG5rtf
	cFSjezJJV76OA1C/z+Ux7dgTqauPbwdqbSIGv2rOviGAPlFCNlKBR83x8YoAG2k8ptgh7kt6pbHIp
	u5WxyUR63RurxHqo2JVg5N5Xa/vIOfIv/iF7NKToxyQunmlzJZtA36Pomw8SYV2FA3ATh3fiqGElu
	9deNYd9tR7NhVSE5MjbllJO6+0PCMo0+cinVarozWt+qNCInxfjQQ0k9SlmDVU4vDtRnNDhwDloA9
	J1Z0sewIf6lg0VjWxkyHgpNKTI+G7ArZCJmtALFlNX1zzAbEvEOJR8BEhkXqx5/RWN6ZHNiA11JMa
	eRevrNOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSNv-00000002pqE-2s2A;
	Mon, 08 Jun 2026 05:18:51 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSNt-00000002ppp-2IhQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:18:50 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4865b9e16d4so1319260b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895928; x=1781500728; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41O9k0y5eFiUd6+1CLxq2KiJxjSqZ/KgLg6URVebdXU=;
        b=GhWG6AbMKSOLGd6tsQLwjygl1mhGAZxZ7AnOkh6p+vHUul4mFRwbHKg8dq446w/onm
         sMXNSnyO/uLVg2VJTUsD1s8H48F3Ao8MuVAquQJwxmCPTq3MQKiwekoaJrk6m7WrR79u
         IX0ACvPbRJBfb70II+3TQR9WtRW+YFthJcY7wtefQkGj5sI6yFtFj3zoDk4J/1PThg7W
         zLeUdnkH4QXQUZfnbFoyY0qflnOndjHuwzSkp8Tbfl1H3iGUqH0pOA7a3tzmTYNCY0JA
         Pajil283xfiy+ib92T5z4KHe0C/gFWOjgnIabf4zuyrlpr9iyaS3l517jmffzRO66ija
         6kKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895928; x=1781500728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41O9k0y5eFiUd6+1CLxq2KiJxjSqZ/KgLg6URVebdXU=;
        b=OX88l5FNANFnWsWigEZdj4g0LLZzPWoKKDNuwuAh7X25s3IZPra4o7AwKdenP3k1UQ
         rEOc/XTEQFdTlodvQcnCAY8ynxBW0KZbuf9LJ2AaG24KJBLn3TY6trUfsEmRBq8cQrRu
         uHBuB9uUzKGXFFs3ZabvxF7Vx7GM9JBDNWwHcj3gwNjSNf7eK96eclZSl+ovFH+Z2BxX
         sdqhzIcFPAyu9pIu77MT1k3uV3kpcLoMZwLtkdQA52GWBkdoV/yVJoK1GZRCSIRu+t0Q
         D8YVX2j2H8VMe1AhmveTzyLzZ97qc11mGPZMx6S14dSHEpQ1uq/XUuIeVuThFVolyvvr
         LC3g==
X-Forwarded-Encrypted: i=1; AFNElJ/cCc/3oVjvNzJjIPIHzIbWdd/iAjlHnAsS7fCiZcWfihjRI6PhWum5S5zdlMEXBiJpmltal0gXpZx2L7JDS5aV@lists.infradead.org
X-Gm-Message-State: AOJu0YwhdijYufxfIsSKWNZ9LybqOc1OBYGG3UtHsKU3oHencJIJUTYc
	eRPu9/EO/8PbBY0ZY6Wq2micY2ebnBfLbT/aMGnUK8zxH/VoKkW0/3UHIjNgRn2H
X-Gm-Gg: Acq92OE91hdm79BmaWnuZBGw8o7v5XDF2c1mQITLGnLaL2NcgFnUnTdsqkAFASoMuF1
	M9JlOIMRIJ1CXEApBjugeJwaXZEhSuMY1hRchv/KND9P+y4hHHixFNS+xr9I/3sUuH27HAWkhKB
	6kyXQ29DHpjJRP0OC5mI7GqtfpZraYJZhsn/lvJBIeywwPayZNJ0aIxyANlMVsdJlZsJHRiwu/z
	be9dvvBCEc9cKatxfKhACw4BADr8nLVOE63zG3f81pQcBqkyS5k+fc80cqSygSJwoFGKzjXTBgF
	N5XtdOO8QpS37iZ55oo1viELF0+mXio4jgDR5Hzeg24tlMrxLGN5ilDnLGfcF/r2slCE+PIWc+8
	Dq44EZ7oT40to3nzkzqFWpgne2oCqR/80p7qPpWj6GnN0YoeHIkOwwt1TI7EXcnjuUXYb8kjopE
	OeuEEHPB0fJqY3ZvXV00Q61spJ5GoYA3JHn5c8eiKr2SGmPu9eFohNtgjwFR/+9NFTg3Cad1Bx3
	RTXWhluVNcX+P+/DMSa7Trf7g/gWS3HOjwbMqMj3HJwKA==
X-Received: by 2002:a05:6808:148c:b0:486:39db:ebf4 with SMTP id 5614622812f47-4868dc042fbmr8070721b6e.8.1780895928388;
        Sun, 07 Jun 2026 22:18:48 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e75b2017sm10838024a34.8.2026.06.07.22.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:18:46 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STI ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] dmaengine: st_fdma: simplify allocation
Date: Sun,  7 Jun 2026 22:18:29 -0700
Message-ID: <20260608051829.7390-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_221849_616400_3B8AB458 
X-CRM114-Status: GOOD (  14.29  )
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

Use a flexible array member to combine kzalloc and kcalloc to a single
allocation.

Add __counted_by for extra runtime analysis. Assign counting variable
after allocation before any array accesses.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: update description.
 drivers/dma/st_fdma.c | 27 ++++++++-------------------
 drivers/dma/st_fdma.h |  4 ++--
 2 files changed, 10 insertions(+), 21 deletions(-)

diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..3ec0d6731b8d 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -710,16 +710,6 @@ static const struct of_device_id st_fdma_match[] = {
 };
 MODULE_DEVICE_TABLE(of, st_fdma_match);

-static int st_fdma_parse_dt(struct platform_device *pdev,
-			const struct st_fdma_driverdata *drvdata,
-			struct st_fdma_dev *fdev)
-{
-	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf",
-		drvdata->name, drvdata->id);
-
-	return of_property_read_u32(pdev->dev.of_node, "dma-channels",
-				    &fdev->nr_channels);
-}
 #define FDMA_DMA_BUSWIDTHS	(BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) | \
 				 BIT(DMA_SLAVE_BUSWIDTH_3_BYTES) | \
@@ -742,27 +732,26 @@ static int st_fdma_probe(struct platform_device *pdev)
 	struct st_fdma_dev *fdev;
 	struct device_node *np = pdev->dev.of_node;
 	const struct st_fdma_driverdata *drvdata;
+	u32 nr_channels;
 	int ret, i;

 	drvdata = device_get_match_data(&pdev->dev);

-	fdev = devm_kzalloc(&pdev->dev, sizeof(*fdev), GFP_KERNEL);
-	if (!fdev)
-		return -ENOMEM;
-
-	ret = st_fdma_parse_dt(pdev, drvdata, fdev);
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", &nr_channels);
 	if (ret) {
 		dev_err(&pdev->dev, "unable to find platform data\n");
-		goto err;
+		return ret;
 	}

-	fdev->chans = devm_kcalloc(&pdev->dev, fdev->nr_channels,
-				   sizeof(struct st_fdma_chan), GFP_KERNEL);
-	if (!fdev->chans)
+	fdev = devm_kzalloc(&pdev->dev, struct_size(fdev, chans, nr_channels), GFP_KERNEL);
+	if (!fdev)
 		return -ENOMEM;

+	fdev->nr_channels = nr_channels;
 	fdev->dev = &pdev->dev;
 	fdev->drvdata = drvdata;
+	snprintf(fdev->fw_name, FW_NAME_SIZE, "fdma_%s_%d.elf", drvdata->name, drvdata->id);
+
 	platform_set_drvdata(pdev, fdev);

 	fdev->irq = platform_get_irq(pdev, 0);
diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index f1e746f7bc7d..27ded555879f 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -136,13 +136,13 @@ struct st_fdma_dev {

 	int irq;

-	struct st_fdma_chan *chans;
-
 	spinlock_t dreq_lock;
 	unsigned long dreq_mask;

 	u32 nr_channels;
 	char fw_name[FW_NAME_SIZE];
+
+	struct st_fdma_chan chans[] __counted_by(nr_channels);
 };

 /* Peripheral Registers*/
--
2.54.0


