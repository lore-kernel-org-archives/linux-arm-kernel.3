Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E543C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 03:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFYh5M0fsDdvGMhmL2V0U6mTiiJF12cIZfzIb8uL/7Y=; b=joIHY1cBj3K6593muByklTz52t
	QwwqP6g8QbMXeoTFmEfkxUhmENM+HmHvAn5dDUZNg2gI7LwgbqLN1xUg3iQog+OFNnpL/VpELSekJ
	yIaj4OE0PDL2ctiJ7C8coJypVQaW4yRnmlrow9qjkwc1up9hPSoBu5hQcbxGP1MhJqJ1jcBSaPzZx
	GE0kQ8Ae/JkbcSAQZxT8FY08h1FW4EAHq9/TRoWZvzbCig+J/0VZ4L+xwA/LpU3edn8McxuTfgC7F
	7z23kEdGAQvanpGGxkdTmjU4ciX8pmluNfmS6+qyi42TVYL0KvOVrAKYcHDwflHWkFMXeVSxuPB2T
	dh+sPVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzSVM-00000001rOX-3Tw9;
	Tue, 01 Apr 2025 03:41:36 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzSTe-00000001rFu-2GYU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 03:39:52 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-226185948ffso98718455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Mar 2025 20:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743478790; x=1744083590; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFYh5M0fsDdvGMhmL2V0U6mTiiJF12cIZfzIb8uL/7Y=;
        b=TpU9207vPQoJYpvUshjS3ocz1Eo5U+klX5ufQOzirpqmqSJ9FlG3oUe30KS19trLK+
         HOeoMf9dzeZdConEzVfrmCNJ1aUSO05QetABrdEhuL8VqX+z9/a0x8gqDfaeOCO2T/Q0
         N8Rd1RUYvsg+7nicLOl1Yu2gYXBsl0X8SUolKOR04F/EsUbWrrJuxRPjDcUtF90PWuwp
         GpCqCgsqf6TS8YEiqUhb+v56EspY+9dBt1i1ZPQ0cCxgp4nnHhV8hjk75PpfEzFP6v5m
         1Nr3wDa/8UGpF/P8K0L0CbOYju8BvnxKyJNt1RBq7ngKx32tJ2ZUn4L7j4mV9sarY9HH
         qywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743478790; x=1744083590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFYh5M0fsDdvGMhmL2V0U6mTiiJF12cIZfzIb8uL/7Y=;
        b=IdIH+h5n8O8JFCIDdgf5SRSIyIGIiiqUS+37sGkH9Bmwoq6DU70jJmcTxDW02MA2Vd
         IDY3Thz3fhl2HqD0l6Z8t2jVbk2WTbKwDLRTB5XicR2lT1CXwF7FdJMEXbK+SS3/xFKD
         GxFIltsRmIVm0AxMMahBmVTg+lRDIbYiwf0x8U6+MFPNm8QdNDn1YbfulWh6qumZnNDC
         yEvJNDzmIU45wJywuEZDFxk60xDiMyWYid7b47qlYrZYE85DtzXfh8etfkAkDJe7vPbJ
         jJjR8Xf54fbkhRrL7COoLBodlUoRf1VNyP5UsBSyClEuGCIlXLz8VykldU5BLbGjE5iH
         yFqg==
X-Gm-Message-State: AOJu0Yyjb7k1UCj3/9qD+EpiLrW+iBVObNRcHiwf/Au8NjorHVNaWmzG
	c0iTVT6AlRbZ20cdzOfzVa9c9iETGRlZ3g1FlCv8TbE8FKCoTJB1
X-Gm-Gg: ASbGncvCSlnEUc+8nH7kG3XFGVR/iBVyJL81EArVXRFyZisSgWPS5iPN7CjD+eIxZzK
	N8muj3Zh6UK5/kYzljMo4HZeEeJ4U0htkQrnsIQxMw84b4peAqTVVBPe4m8khrXDc0rc6HDjebX
	iUO6V7yg3Z15C0wMpYRQzpMjVZTxV5yMrElm7Et/fMF9t0KnL24VX80ySE/siGrS8Tdx0V/4H4g
	1Idq5wpsb9L/w1NLOPRyhyhQS27HYDxFqn+lQOjv7lcA6up76sYhRQ9wi6Jx3djhFUK2WWS+/da
	hPMw6fHkaewp02x17X+Jdct2DabrO03syBo+IqKCE6oTPTN3vCRMbx7aBsOpXOCXVzf7QK0=
X-Google-Smtp-Source: AGHT+IGT8jkNO5+IfXQCLnbfYUK9R0hC9L7cWhycJGTtXws06galosA23s3dNcxmybY3RaYeogb7zw==
X-Received: by 2002:a17:902:eb83:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-2292f8968e9mr195477775ad.0.1743478789870;
        Mon, 31 Mar 2025 20:39:49 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedcedesm77958805ad.67.2025.03.31.20.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 20:39:49 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	u.kleine-koenig@baylibre.com,
	andersson@kernel.org,
	arnd@arndb.de,
	herve.codina@bootlin.com,
	bsdhenrymartin@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] drivers/misc: Add NULL check in aspeed_lpc_enable_snoop
Date: Tue,  1 Apr 2025 11:39:35 +0800
Message-Id: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_203950_595743_B62F60EF 
X-CRM114-Status: GOOD (  12.88  )
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

devm_kasprintf() returns NULL when memory allocation fails. Currently,
aspeed_lpc_enable_snoop() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
V2 -> V3: Simplify the arrary access and correct commit message.
V1 -> V2: Removed blank line between tags.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 35 ++++++++++++++++++---------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..25ebecd14103 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -189,22 +189,28 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 	u32 hicr5_en, snpwadr_mask, snpwadr_shift, hicrb_en;
 	const struct aspeed_lpc_snoop_model_data *model_data =
 		of_device_get_match_data(dev);
+	struct aspeed_lpc_snoop_channel *snoop_chan = &lpc_snoop->chan[channel];
+	struct miscdevice *mdev = &snoop_chan->miscdev;
+
+	init_waitqueue_head(&snoop_chan->wq);
 
-	init_waitqueue_head(&lpc_snoop->chan[channel].wq);
 	/* Create FIFO datastructure */
-	rc = kfifo_alloc(&lpc_snoop->chan[channel].fifo,
-			 SNOOP_FIFO_SIZE, GFP_KERNEL);
+	rc = kfifo_alloc(&snoop_chan->fifo, SNOOP_FIFO_SIZE, GFP_KERNEL);
 	if (rc)
 		return rc;
 
-	lpc_snoop->chan[channel].miscdev.minor = MISC_DYNAMIC_MINOR;
-	lpc_snoop->chan[channel].miscdev.name =
-		devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
-	lpc_snoop->chan[channel].miscdev.fops = &snoop_fops;
-	lpc_snoop->chan[channel].miscdev.parent = dev;
-	rc = misc_register(&lpc_snoop->chan[channel].miscdev);
+	mdev->minor = MISC_DYNAMIC_MINOR;
+	mdev->name = devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+	if (!mdev->name) {
+		rc = -ENOMEM;
+		goto err_free_fifo;
+	}
+
+	mdev->fops = &snoop_fops;
+	mdev->parent = dev;
+	rc = misc_register(mdev);
 	if (rc)
-		return rc;
+		goto err_free_fifo;
 
 	/* Enable LPC snoop channel at requested port */
 	switch (channel) {
@@ -221,7 +227,8 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 		hicrb_en = HICRB_ENSNP1D;
 		break;
 	default:
-		return -EINVAL;
+		rc = -EINVAL;
+		goto err_misc_deregister;
 	}
 
 	regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -232,6 +239,12 @@ static int aspeed_lpc_enable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
 				hicrb_en, hicrb_en);
 
 	return rc;
+
+err_misc_deregister:
+	misc_deregister(mdev);
+err_free_fifo:
+	kfifo_free(&snoop_chan->fifo);
+	return rc;
 }
 
 static void aspeed_lpc_disable_snoop(struct aspeed_lpc_snoop *lpc_snoop,
-- 
2.34.1


