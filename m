Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE8AC55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mh0zq1YTh3UJhLL40JBJykkOmBY5F9aAuS/qMZKEofk=; b=Qe6gLZu9FHGrDEJbqQeie3KJNm
	d12lROtPFIo19V7cQ5dF9CHX9aS+bQ/4E25DjC/4f4PRgxxIVtkHd5BTD4/0IPway4NwvNF5DCaRM
	4VFQsWAuEQKRtfiG2hc6p570amkiv3PoNJv2UirUqaoKzFFE+x3mmKEvV2DE7tqtDQHE6XDYKQVk/
	6TxSAlLSgDmeh4eB0lGR/9moz76DtsrwAOmeQlWOuoj7AXq22lfj4UDMoKmyU81fxuwxNvjYZIOYu
	mwICZRdyBPHcM5Z092NY+B7zaiSCEERNcFsIACrbZaIrSG76ardDfesTxskBU/wuOa0GHwKUXddPk
	T6XWlzaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQh-0000000GYqZ-43oD;
	Mon, 03 Aug 2026 07:49:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnQf-0000000GYpP-1jWZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:49:46 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ced3386430so30502995ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743384; x=1786348184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mh0zq1YTh3UJhLL40JBJykkOmBY5F9aAuS/qMZKEofk=;
        b=m1P56F7kqH0pYnqoTk74RnkqYEZvlQxq7SCcMPfLK8NJgYZfPelJL3C6jnVye3eGdK
         FerjSyQDhRjbcKppHALcehNAwSLXyTMYoPPTFPm4n9xk/9OgPQGkcvuL5PGU3z3A7hdU
         1EuRLBDSqcIt+IyUK6pBO3DYoMawTfXcHighqYw38V6ECXF4UI4r6DgOhnuFnI6To/Iy
         dLDDaR8ybrX799OQja9Xrf3EPG/HPMyXM9z1pIn2SuuQSA3Q0YIzbEiUg3JUUYwIWSte
         dh3PelcqME2IKYFK6IwKfB9Dt0XMWcIwJQzIHvb1crqc7j7Dwfa0gljt7Bi/WYWmJKN0
         kCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743384; x=1786348184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mh0zq1YTh3UJhLL40JBJykkOmBY5F9aAuS/qMZKEofk=;
        b=JgQGSsy1pVnzYKTKFf3AXGysSydCEBLbRas8dI1Gkp8eAi71DCa5CE3zOgTPahuZm8
         IIH9zGDfWxygQS4/vGC8ITGLxDxhNRtDPOTT2a9REPZT/UCkVQo8YlXAMkTJcrBe3T/L
         t3+FIH5WORyh8r0tIaraGxBbw2CAj1IDlrANXA0Lt1cb+4/vz3TD5pWQbC/iTvhxaFdx
         KEy29LMxMxQ5RD9F4MA0UmqvPlSOM8YELJRnL9r0KIjnOK1vW8cSkzBdqN8mPRFoRBdl
         lGMbQuD6XDAFDhDe4LmRrc3yvxCBTX1BVC2n8itqj48xHDjUK/+mfvCNv0iYQqw3Um1i
         ioKw==
X-Gm-Message-State: AOJu0YyPrYMTwWNV4yz8JqfZ0lpEVs4LJrA94P8WrcobW6n58c/9ypVS
	AFmFnGv0mkNESeb4npAvLu0mayZOyptD2sRVVCSoYDy8GnZKQ30HzND1
X-Gm-Gg: AR+sD11YU8lx6nUUNF7/05IsPIIST5seKkxChWZ32CbzF0QDquQ3MHhmQBMCW1JxXHy
	mSAPjh4SdnNCW6mbkuvXxh+E1yyKblBHXWLl70LIffcQNHO6k2gO2aQW+RHCxQxZWO6Aa3t3uoL
	y8euROoLdHy/jIf4wWo86Fik58ibf5gjUEJdx0/0GBDalzs3wAJhCKdGVbQTlyysYjB7pjqPoSo
	zwLaCBNB3U0Cz8TZK23rzwOYouvbI3esMYyxTzyvoAqpzbi+zb3hJhUVthlsKzRck1XkKTScxhN
	CTxmopgunat6nrT3174HvsuhgNNhN3WKZ/yCGcfIbEWQyxGDBjHpoJeb9N4Ce5ahSkEsm3O0FFK
	aNepMP5ZewMDhCKh7MR0bJxt12bPw05Ym7o5bz8QrSlbW5IbAPffgCPgMQ/x+W69z41tMuKduzD
	viSPq7SzO6FdARU0eVYrY7wktlhwVajJur9J8tEyGjx//37Q8hYdK6dsF+Gs0IsOT8RUq1PbQPH
	nDufmpuN7EsY06xWsFhbw1zaCjvuMXC1lHEAY5YufLZobHHl+I=
X-Received: by 2002:a17:902:e84d:b0:2cf:84bb:1ebc with SMTP id d9443c01a7336-2d0521e9e05mr90498015ad.15.1785743384392;
        Mon, 03 Aug 2026 00:49:44 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b120f2fsm33679845ad.64.2026.08.03.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:49:43 -0700 (PDT)
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
Subject: [PATCH v3 2/2] spi: ma35d1-qspi: Enable GPIO chip selects
Date: Mon,  3 Aug 2026 15:49:13 +0800
Message-Id: <20260803074913.1656675-3-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260803074913.1656675-1-cwweng.linux@gmail.com>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
 <20260803074913.1656675-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004945_457665_93C1E6EB 
X-CRM114-Status: GOOD (  17.34  )
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

Enable GPIO chip-select support and distinguish the total number of chip
selects from the controller's two native chip selects. Allow num-cs to
include additional GPIO chip selects and set max_native_cs to the native
hardware limit.

Add a setup callback that rejects chip-select indices beyond the native
limit when no GPIO descriptor is present. Also reject active-high
polarity only for native chip selects, while allowing GPIO chip-select
polarity to be handled by the GPIO subsystem.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 541d5d72484c..f893a4160528 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -61,7 +61,7 @@
 #define NUVOTON_QSPI_STATUS_RXEMPTY_MASK	BIT(8) /* Receive FIFO Empty */
 #define NUVOTON_QSPI_STATUS_BUSY_MASK	BIT(0) /* Busy Status */
 
-#define NUVOTON_QSPI_MAX_NUM_CS		2
+#define NUVOTON_QSPI_MAX_NATIVE_CS	2
 #define NUVOTON_QSPI_DEFAULT_NUM_CS	2
 #define NUVOTON_QSPI_DEFAULT_BPW	8
 /* Bound PIO operations to avoid long atomic polling loops. */
@@ -430,13 +430,34 @@ static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
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
+	 * The SPI core passes the physical CS level to ->set_cs(). Native
+	 * chip selects are active low.
 	 */
 	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), !level);
 }
@@ -608,15 +629,18 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 	if (ret && ret != -EINVAL)
 		return dev_err_probe(dev, ret, "failed to read num-cs\n");
 
-	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS)
+	if (!num_cs)
 		return dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
 				     num_cs);
 
 	ctlr->num_chipselect = num_cs;
+	ctlr->max_native_cs = NUVOTON_QSPI_MAX_NATIVE_CS;
+	ctlr->use_gpio_descriptors = true;
 	ctlr->max_transfer_size = nuvoton_qspi_max_transfer_size;
 	ctlr->max_message_size = nuvoton_qspi_max_message_size;
 	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
 	ctlr->mem_caps = &nuvoton_qspi_mem_caps;
+	ctlr->setup = nuvoton_qspi_setup;
 	ctlr->set_cs = nuvoton_qspi_set_cs;
 	ctlr->transfer_one = nuvoton_qspi_transfer_one;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
-- 
2.25.1


