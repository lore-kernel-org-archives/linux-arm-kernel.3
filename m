Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1910C83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 08:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vlnZvB/WCXPqtyuE7Jw0BGhm5yZL6emwd3gHblqa4CA=; b=iP5P8m2HCkWSLKqKBLncUNbeai
	BLFOCS/wwrI7Efv/UubtFG9KYNsT+i51PTeVCCJAdw1wzFAN/+wOZTAfuSO/AsSrHuhk9Bv3X/p7b
	GcTDDZxGSMos+09W5aajTBeHSyio5pPYFJIz3d08WJMtsq6C8pDj5eHB/jbRkuOp3nIvCwNJ+g74f
	FNTYtdiLd5vtNdjEgOhfDExV0osFG/Ly3yxEP16NHBeStOttkS7oTKwnknqXP5v/1t++WGVrR51Bg
	fAPNHQlRbEReeWKqzAy0BkMVWIKmnXb1vzDuMxYZU5T1FjCAGRXndfCZTYPdFfQWhedYppKk+Ygxk
	rLmYCRzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9fu-00000001ab9-0Wva;
	Mon, 30 Jun 2025 08:15:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW9db-00000001aJA-0Sek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 08:13:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2329239f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 01:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1751271193; x=1751875993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vlnZvB/WCXPqtyuE7Jw0BGhm5yZL6emwd3gHblqa4CA=;
        b=DNNdu2iIGB6ibRe6zbB5s13u91hA2vQIWgyURQYourPO/ZDFrshCzJPN7ZTLaMz5BN
         jWn+7rsOGiyhlaJ4Cyu1juoi8tggMPPbwfNPT2Ifl8AWGYv0OmlhjW01YRLQbCR8YfdO
         EaXUVxlyIu3sRDyqVIVFdazeb3Q3xKwp3YRit8vZtBHTp+IveMX6lOyPgSSGga5O7AZ/
         m1HJ2HXrtoTRrs/5UxvxROnd8Yu3Byz0MoVvKU+Tvn+fhax1O5PbP6MxUy595lp+Qh2v
         hiRBhaDH12bzmrisWJAF4ohtRWUUMmxEJmeC5MaHJTDxgFSnhOnQRQroINfd83XkZkjR
         9hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751271193; x=1751875993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vlnZvB/WCXPqtyuE7Jw0BGhm5yZL6emwd3gHblqa4CA=;
        b=cYWSeKC6JMX3OHhYKqnkuUPLkKLAm8p2qvkfGvo2TPvGqhUCwct+v67HtLaLRMXJP7
         IqDP23g+sARObPsZQkCGfLTzWsIe7i3fXLXlVecjhJzvFiRu++4gLudN2gl2pZowo7NJ
         bnbHDQ10pq36CZnQGrbDe/7bambaZk1wUQmQyWSTdlMy02uULT6cMsib58q8Ou509391
         ReL1X0PD/JNVaeGtBh7xI9E8L5pXSu3cWMkxxvYooclHgpotrM5FMROff4jh/rgBsHHz
         FZ3mY/rRaZhnQuUEpaWEOeqYlZtBWjlNKEIPjfYFA/1FXR8La6axy71e3h126hLzxX8k
         NEjA==
X-Forwarded-Encrypted: i=1; AJvYcCVVn/Pdv7D/XI8zIJ0ntk5Xplo0Dzk4D3Tjhma1BAN4TnOZTYnumCa0JlzzzUph5mOwzmvqptIfiH/lpedmKvcW@lists.infradead.org
X-Gm-Message-State: AOJu0YwgV/01Lb+Q7CB5B+DMzVP4W77lRXbwI05gBXl50jJU94gMOxSX
	0SjcQFjKaKuwny4Og9cpTlkAGfuMMno0vwPa+CEI76fSZSpFLsAgKq+rZz2ecu0zXt0=
X-Gm-Gg: ASbGncvCxOKpYHPLDR7MANgOImXb6R9NvhqsWNoLzym+DxtISIxO2fFT+Ivj+B3c5aM
	2b33R8rVrM8vy84bJ3BQmIv6Nez6oOb3bkTiFAZCxQdGOm6Fje1wuz1tuQCBDprl5SPhIsBcPQF
	B5Z7RI3YGSpdR4q+fVODobXGYOprm//QVx7DnWOu512KyGPm8MBenAE4HIuRkasSbAjyP8JsfVC
	YAFsn8t5S1+9byUaVhaYT61YO9HGiIKCVdNJzNMjDFcwIkY3K+mgdbg+IEfvN2qaRS4dVnPK/50
	ZYR98az1eJNdtQGNUWFL4svE2+U1SEFotTzVyn6QLLRs7GIdeWpL1s8Gn7UyhN9J0RuXb5kNlfF
	aT3gsyG+zmWk=
X-Google-Smtp-Source: AGHT+IG31LxT0ptg6EHo/bGKOyukJazY4oC/IxLI6mz15TAMA4SfoRER0gF+bNZj4oNhXngxmykf0g==
X-Received: by 2002:adf:ca92:0:b0:3a4:f722:f98d with SMTP id ffacd0b85a97d-3a9008557admr7908660f8f.51.1751271193346;
        Mon, 30 Jun 2025 01:13:13 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:f5fc:eb97:a20:8b31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7386sm9612674f8f.20.2025.06.30.01.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 01:13:12 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH v2] spi: stm32: fix pointer-to-pointer variables usage
Date: Mon, 30 Jun 2025 10:12:53 +0200
Message-ID: <20250630081253.17294-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <1f49b8f3-44c9-43f3-a3bf-b931fb0726f4@foss.st.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_011315_297956_0AE96DA6 
X-CRM114-Status: GOOD (  13.63  )
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

In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
and rx_mdma_desc are passed as pointer-to-pointer arguments.

The goal is to pass back to the caller the value returned
by dmaengine_prep_slave_sg(), when it is not NULL.

However, these variables are wrongly handled as simple pointers
during later assignments and checks.

Fix this behaviour by introducing two pointer variables
which can then be treated accordingly.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>

---
Changes from v1:
* introduce *_mdma_desc and *_dma_desc for better readability
* fix another instance of rx_dma_desc bogus assignment in case of
  failure of sg_alloc_table()
* commit title/message reworded accordingly to the previous point
---
 drivers/spi/spi-stm32.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..4b7f074fdba9 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1474,6 +1474,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 						  struct dma_async_tx_descriptor **rx_dma_desc,
 						  struct dma_async_tx_descriptor **rx_mdma_desc)
 {
+	struct dma_async_tx_descriptor *_mdma_desc = *rx_mdma_desc;
+	struct dma_async_tx_descriptor *_dma_desc = *rx_dma_desc;
 	struct dma_slave_config rx_mdma_conf = {0};
 	u32 sram_period, nents = 0, spi_s_len;
 	struct sg_table dma_sgt, mdma_sgt;
@@ -1524,18 +1526,18 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 		}
 	}
 
-	*rx_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
-					       dma_sgt.nents, rx_dma_conf->direction,
-					       DMA_PREP_INTERRUPT);
+	_dma_desc = dmaengine_prep_slave_sg(spi->dma_rx, dma_sgt.sgl,
+					    dma_sgt.nents, rx_dma_conf->direction,
+					    DMA_PREP_INTERRUPT);
 	sg_free_table(&dma_sgt);
 
-	if (!rx_dma_desc)
+	if (!_dma_desc)
 		return -EINVAL;
 
 	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
 	ret = sg_alloc_table(&mdma_sgt, nents, GFP_ATOMIC);
 	if (ret) {
-		rx_dma_desc = NULL;
+		_dma_desc = NULL;
 		return ret;
 	}
 
@@ -1558,13 +1560,13 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 		}
 	}
 
-	*rx_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
-						mdma_sgt.nents, rx_mdma_conf.direction,
-						DMA_PREP_INTERRUPT);
+	_mdma_desc = dmaengine_prep_slave_sg(spi->mdma_rx, mdma_sgt.sgl,
+					     mdma_sgt.nents, rx_mdma_conf.direction,
+					     DMA_PREP_INTERRUPT);
 	sg_free_table(&mdma_sgt);
 
-	if (!rx_mdma_desc) {
-		rx_dma_desc = NULL;
+	if (!_mdma_desc) {
+		_dma_desc = NULL;
 		return -EINVAL;
 	}
 
-- 
2.49.0


