Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D934CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wV29etHKmeXpNOvM6Yg7tazjewCc3IV5UL8KyxdRZok=; b=JoYYu4dq06TiFccmtToarOBLEl
	VOV09k05/pwjY6vaub9U+OaNrano++V0FCxIIutihhkab1XrA8vD3JbN5U5MVZdtm85ecYecZV7jj
	WVBmEI14r5VEHekW8ya0WiBrhIYn1FAoG3et4V3UHt9vkxTBpxAv1e9dvt9xZGdx3iCMUOyqiUm6c
	JHHtRXP6OLXdSdWbHPo8oQq2fQWLp7NyHHcgTB/1F42SJr54xMJKwR3haTfIhTbFX+lgcXVfRk/dF
	X/c85UkYPFajfjOu11IaXGIsRvBUSWIKLHHDzJbWaYiuxXvC8EDdKzW/zSoWrjoRks40T0hJtu5g1
	aNWAG+BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPV-00000007CpA-2X6m;
	Fri, 01 May 2026 14:00:05 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPT-00000007Cnf-1PTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:00:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so31387035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644001; x=1778248801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV29etHKmeXpNOvM6Yg7tazjewCc3IV5UL8KyxdRZok=;
        b=LDUruPfLlpwH0dILyKgwPFabV2n7NjcSMSyo7gqNGcPrRCwqSbjXYPmCFYQoBZgbaJ
         ESeqYw4VASFrTmh69GpqrlNauHl8lyW/sy9oEFu70ggSgjsCzUOl2K8I/HgALyF+1e5+
         FHoKog2g3ZiFxCD31nF9s/hIs2ZMuqQXOHMIoZuKRqMc3KKXNhz3V0zF7+GlG4v5rMH+
         KcTDGVMQvXOb3Sng6DZJJPIStHw4F8I5oDkGb/DHKI6n5/4wihiTBWdr7RlelnJ/uF3P
         WPhJWjtwidRUaDJPeVffYGwceWdZgVf4uqslZWELPSs1dwlyZf3YOREyKsmePzP0oZCJ
         LMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644001; x=1778248801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wV29etHKmeXpNOvM6Yg7tazjewCc3IV5UL8KyxdRZok=;
        b=e2WRNtpP6wsbyxaCXGyBm5KQQYwvvmuZ6URzjt9TaMCamtrhpblnHrVmCMkn+6mvdm
         UFfO/sXk1wNflgrYOwm2RKYY/Ib3vC5uxdh3m47hKoHPV3Ns21bqt5iEfBLYfnkDf+6b
         mSx74HwLSqGCaOWsnzVd+Ga0zPNgzTn1LZIBW9t35fXuuglgZkk7L8I2i290WG+8nn6/
         W+/cj6vRN1M0Ud9dzgC3V5C1q4vwg0cVj6A1sw84VHZJxs8PiahEUXGlB414SZz+R5B+
         RBpzTMkxIDHtGE22hLDukjL/x/pJ7HkA49aO1o+M2R/JaYuZ5s2Km+JMDqZQRZsyynvS
         a14g==
X-Forwarded-Encrypted: i=1; AFNElJ+4DeP2hmMIeNjpcgv96w7svAnHmBWZ8gzDSdgi+eMV8PDNmfVSDpKzFJ/luXGMcIlY42JU3kWw0A9KIBjsvueK@lists.infradead.org
X-Gm-Message-State: AOJu0YxF7JpRNh4202worQjbJFAjt17NdcCi9SlhwcR8TQQguOUFCZV+
	1C3kkjkZhXHgdMPDG8wlke3i+4zdcnKhkY7diui1GS/JXab8MwHmxWQq
X-Gm-Gg: AeBDiet3V2Z8RoU9x/ICZfDpvkE9RX1I8ooYsoo218PVw8cGa7+rdMT4uoL4eA/kM37
	8rEtcUvQZoDzXsdl6JFODvIp07cAfGc5YJu7B0vt8IWdsx36cuiXvLabHZvD5043/mO6srS024o
	ukVLiN1+vhrPlleAVVy9KidUr+LIj8AnZq341u1q/QNAgJ2E4HJf43lsn4fNPOUTGMFcNcgIKPs
	IWvd3nZZoUJ1KGQJOUv6DR708e7uxgzUmAVzl4sw34uDNmdgomAhuKtOlntnxQxnAfc3i533aD6
	SYGxF8lEq2apKQ7Apb/5gh4/dki22kUT3VfQiRf9SrgPd60/VcT3ZxvijAal8HAETnSlDC/L5Lv
	0fzZhp6s3ezR+sIrbiP4FLhqq4EO/83ATrIgiRHxkhyZ+pB2AqETlNRLkp7u/Cp7KMZPwCWBy5G
	48UzDctogTX7AP1AVLMRtbloQaTiHduR0LaUDz9auM2QpJ0MUO162tOuV/Ae/EFVIut61dyLVRk
	HqO
X-Received: by 2002:a05:600c:a401:b0:489:1c1f:35df with SMTP id 5b1f17b1804b1-48a84452161mr92478485e9.10.1777644001371;
        Fri, 01 May 2026 07:00:01 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:00 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 1/3] spi: imx: Fix precedence bug in spi_imx_dma_max_wml_find()
Date: Fri,  1 May 2026 13:59:49 +0000
Message-Id: <20260501135951.2416527-2-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070003_388023_ED2C404D 
X-CRM114-Status: GOOD (  15.36  )
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

The watermark search in spi_imx_dma_max_wml_find() reads:

	if (!dma_data->dma_len % (i * bytes_per_word))
		break;

The unary ! binds tighter than %, so this parses as:

	if ((!dma_data->dma_len) % (i * bytes_per_word))
		break;

!dma_data->dma_len is 0 or 1, and `0 % x == 0` for any x; `1 % x` is
0 unless x == 1. The condition is therefore false in every case
except dma_len != 0 with i * bytes_per_word == 1, i.e. i == 1 and
bytes_per_word == 1.

The loop almost always falls through to its end, leaving i == 0,
which the post-loop fallback rewrites to 1:

	if (i == 0)
		i = 1;

So spi_imx->wml ends up at 1 for essentially every DMA transfer,
defeating the entire purpose of the function. The DMA engine then
requests service after every single FIFO word instead of using
multi-word bursts, hurting throughput on every DMA-capable variant.

Add the missing parentheses so the modulo is computed first, then
negated:

	if (!(dma_data->dma_len % (i * bytes_per_word)))
		break;

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index e5c907c45b87..7ae8078c10ef 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1836,7 +1836,7 @@ static void spi_imx_dma_max_wml_find(struct spi_imx_data *spi_imx,
 	unsigned int i;
 
 	for (i = spi_imx->devtype_data->fifo_size / 2; i > 0; i--) {
-		if (!dma_data->dma_len % (i * bytes_per_word))
+		if (!(dma_data->dma_len % (i * bytes_per_word)))
 			break;
 	}
 	/* Use 1 as wml in case no available burst length got */
-- 
2.25.1


