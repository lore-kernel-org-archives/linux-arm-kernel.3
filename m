Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7223CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIgme/hli59wBCI5OwyN88StS5WzrGGP4qMfY50DT24=; b=puNInzU9cq6MEHDO088bkgT1b3
	d+hhWbQEpgbr1frX+AcAayIkPZyCv2WflQiohr5voOsJBdLqjzJG+L0do8xG35jCZmNjjfOh0104a
	5OjlIS13hKeojVoV7vpGriY4JUrxPuEahI0ZuyNHd4PyClfmeUE3cx6Pw5kHPVxp9UktVjuIVbeft
	vd18j0VOlbJFZ+DUfKHSR9l/ohDUttvLVbEGrtSBPWPno+TAwZGPsds/3R5DYcXqquPgNiwZF/Oul
	yo9Fq6E7N3c/k/1zbLOKhO7apigcwMM5UudYlc1lvjskHpEu18Te8dBmEkCKRyyjpSw+nyvFFRDc2
	g91PxWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGgP-00000009DVJ-1MMw;
	Thu, 01 Oct 2026 13:18:45 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGgK-00000009DSg-1UYR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:18:43 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a4c8262465so1926632a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860720; x=1791465520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIgme/hli59wBCI5OwyN88StS5WzrGGP4qMfY50DT24=;
        b=XZd6z2eCkATYzt+yk9h4+Qi4v5WzRvdOuLb9xJAn+rsR8VPB3Dr4KCvj/bWsVI9XN2
         2phofCO3/hbOFbvIw5Oowjq1dWyvJ7DLlcu4xWmUdUGDt6JEZIua0LqUx5AYTpQJP/T1
         eTXXUQtt31c4OD/47gjZj8cPIRBdHTUKbCdK6gBKS8Fn9jvwrLOonYDI/6B6xuatgRdI
         8zNnbRND+wU931SRLE1qVIWeNryxKyw4SthrGipNd7k1hR9ZisIyZmOGbMMZioG30TeP
         Q3dJsWR+bJ64iFYVNiYzCMMxAt3Et7tA4DrccQz2ndJVn1nsKD6s/BwLK2USAM1o+WLj
         kMBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860720; x=1791465520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIgme/hli59wBCI5OwyN88StS5WzrGGP4qMfY50DT24=;
        b=dae8IdenuAiDQ3cHNutuleSUXqmHyytl/5gN0WXqyEN4EQiXzZN3ogGcaoo3R66dfK
         d3FCayJk/675KXis0kAWHgAv07GhK4piEuUhYaIPVB8ah0mIVpbMpC5hI8C8M/S7MuCn
         GzPcencOD2xDqWzjhlYbvzy5RcQqkScJ2G+3D6g+7EdDJloC4ZiGxFo/6nDQUa4aDmFx
         jFzNi6Fk9dYOYhUh1+Xr7AKAubn4VX65G98Dc8GrpbWjLGPyr6BAmZOE/eiHrUXpKbtD
         Ka9g30RhrZCslq2i6btTZ641j22VMGUri1lM4Do4K6Ioh8IQHCbAR9GrEnFmVIu1SuYy
         iYtw==
X-Gm-Message-State: AFq9FYKd69/UOaIhPk7STpLYc3NhLA+CTmIOfWjEn7i5FdOFYuuSrs20
	aFEKrkcDhNerfORw2DohLfNDlT9+DBGk5c/6EnQGRXoiyEKbkYx+n/mzJ5mg5g==
X-Gm-Gg: AYBFou2XOpClZTrefV4CiblMwgETN1C0++RR+F89lp8wmfgdu20RgDCcDQWiNBXxE12
	zFegyw7xKBWKGgaHL5C6OMo6JOIpIutglHEXCezHXMAOwdPV2PO0DYKKKMIgH2w/maMPYfsIfN0
	TAjsIK/LASOSv6EnvDgwPhYuCATnhymO2ArWydYxtLyrmsyV1VXdCpVKNIzBGBJgrKmQ0s83QAK
	8zhERL4xmL6mgbuyXccCrFIPhUix82BRKcx/j0l23Zv0DdN8U26nFnnLiUML7ecOmBiaQTL3/Ib
	GMWpVygWUDy/q4OkhCLEAu5E6ARGSJGLiKfuvhPtmy4paGhUMBKj0JPU+390ffD3B4Yr6LguOuQ
	kcwErIEIYusMLWrqVYFQneMgMJDMi6B6fcWYUqIRO2sqQ4M4JGSS6eqEoQg6ZDymIgeo9+Ow5Fv
	ND18CePEX36DQlqYFLod614CkK9QH0LeCJ8+s121zoH1Wd4k6TyuOfv2SX2TYDVEcrqx/0EAt79
	pXywtct4A7NoTNt5fjZayj2DcqDGr29DdzdsAJDV7dLnZSdhokXDOBQzqPky9Q9yOjSkQg=
X-Received: by 2002:a17:90b:2b4f:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4fb2ba95bmr1983848a91.55.1790860719369;
        Thu, 01 Oct 2026 06:18:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:38 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 3/3] spi: ma35d1-qspi: Add GPIO chip select support
Date: Thu,  1 Oct 2026 21:18:18 +0800
Message-Id: <20261001131818.110028-4-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001131818.110028-1-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061842_738402_F1176ED9 
X-CRM114-Status: GOOD (  19.26  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver does not currently enable the SPI core's GPIO
descriptor handling.

Enable GPIO chip-select support and specify that the controller provides
two native chip selects. Add a setup callback to reject active-high
polarity only for native chip selects, while allowing GPIO chip selects
to use the polarity handled by the GPIO subsystem.

This keeps the binding capable of describing valid board wiring while
preserving the active-low limitation of the controller's native chip
selects.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 39 ++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 30e3239f777d..0644bb2990b8 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -62,7 +62,7 @@
 #define NUVOTON_QSPI_STATUS_RXEMPTY_MASK	BIT(8) /* Receive FIFO Empty */
 #define NUVOTON_QSPI_STATUS_BUSY_MASK	BIT(0) /* Busy Status */
 
-#define NUVOTON_QSPI_MAX_NUM_CS		2
+#define NUVOTON_QSPI_MAX_NATIVE_CS	2
 #define NUVOTON_QSPI_DEFAULT_NUM_CS	2
 #define NUVOTON_QSPI_DEFAULT_BPW	8
 /* Bound PIO operations to avoid long atomic polling loops. */
@@ -442,13 +442,35 @@ static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
 	spin_unlock_irqrestore(&qspi->ssctl_lock, flags);
 }
 
+static int nuvoton_qspi_setup(struct spi_device *spi)
+{
+	unsigned int cs = spi_get_chipselect(spi, 0);
+
+	if (spi_get_csgpiod(spi, 0))
+		return 0;
+
+	if (cs >= NUVOTON_QSPI_MAX_NATIVE_CS) {
+		dev_err(&spi->dev, "invalid native chip select %u\n", cs);
+		return -EINVAL;
+	}
+
+	if (spi->mode & SPI_CS_HIGH) {
+		dev_err(&spi->dev,
+			"active-high native chip select is not supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void nuvoton_qspi_set_cs(struct spi_device *spi, bool level)
 {
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 
 	/*
-	 * The SPI core passes the physical CS level to ->set_cs(). This
-	 * initial driver only supports active-low native chip selects.
+	 * GPIO chip selects are handled by the SPI core. For native chip
+	 * selects, the core passes the physical CS level to ->set_cs().
+	 * Native chip selects are active low.
 	 */
 	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), !level);
 }
@@ -457,7 +479,11 @@ static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool assert)
 {
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 
-	/* The direct spi-mem path passes a logical assertion state. */
+	/*
+	 * Direct spi-mem operations are only executed for native chip
+	 * selects. GPIO chip selects use the regular SPI fallback path.
+	 * This helper takes a logical assertion state.
+	 */
 	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), assert);
 }
 
@@ -638,18 +664,21 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 		goto err_assert;
 	}
 
-	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS) {
+	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NATIVE_CS) {
 		ret = dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
 				     num_cs);
 		goto err_assert;
 	}
 
 	ctlr->num_chipselect = num_cs;
+	ctlr->max_native_cs = NUVOTON_QSPI_MAX_NATIVE_CS;
+	ctlr->use_gpio_descriptors = true;
 	ctlr->max_transfer_size = nuvoton_qspi_max_transfer_size;
 	ctlr->max_message_size = nuvoton_qspi_max_message_size;
 	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
 	ctlr->mem_caps = &nuvoton_qspi_mem_caps;
 	ctlr->dtr_caps = true;
+	ctlr->setup = nuvoton_qspi_setup;
 	ctlr->set_cs = nuvoton_qspi_set_cs;
 	ctlr->transfer_one = nuvoton_qspi_transfer_one;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
-- 
2.25.1


