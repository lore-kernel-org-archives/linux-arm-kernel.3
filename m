Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AD7C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTJfnMPbA37cVAyGVvx8GRRhd+dTZCIcUs03TckN6k0=; b=lkJdTadvyOBVg+JYiL4Cu5opyJ
	JU0gSnOuf9cCOOdJTbIIuP1JxaP87fT4oBPxtR3dsD1MLuEDikMyUAq/nPdweJvPhLAoxKj2X1g5n
	cIMFJndeDH2KM7RaA6z7j4LCZs+ucIrmWM/CIVFDs5xQ8wVm8/lXdwV5noh/3aDSM2y/4hScqfAsv
	/ggxbkqFYT5FGIC+IsYj3Zqwgs/kd29ETdfKphLf8mhm1citNSEwegTGpErT2/kA6p3OBHwJXleOR
	9A68K6otZUuker/JIpHHXICpoCZ0TQk47gFyIx4mqTLYfu5RNNdwwvhFxT6x6g4USuTjaRYB4jaal
	qEbzQeCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm6t-0000000GRRG-0Jc5;
	Mon, 03 Aug 2026 06:25:15 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqm6q-0000000GRQu-2SIJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:25:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84830c774a0so2857240b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Aug 2026 23:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785738311; x=1786343111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JTJfnMPbA37cVAyGVvx8GRRhd+dTZCIcUs03TckN6k0=;
        b=G337+ngYWSH6Y15nXZT9ByQ2fsNoF/7XiBBoZl6sqH5zzxIVEe2dxdvunutqXkSEaa
         vDHJCenittjt3FNQo9hK4UgefssISDAz2V9/2JTYiXZVlVnz5MGx+JoAhgvrtE0BlnDr
         ByI4hJkSOZBS69aMn7/EV8Kse5pv+Ct1U2vZq27QKX7fak5BYFH7hpTlPauoChQNrFTZ
         COP7qTvuHzfJS8+AQ8N7TUAMpPJlKhfSfxrXA+Gnv9zbTPIHvh9io070gjTg/l4fgqpI
         1pPtXv7QVJGwXSpPqo8WFXEowGqvjJaJ7xNKnCCRiorUVaObexLdbqXs6emeua0RfOSI
         XoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785738311; x=1786343111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JTJfnMPbA37cVAyGVvx8GRRhd+dTZCIcUs03TckN6k0=;
        b=qOBLafwILESWbftTSU42vHGanL2wPV1tPD2PhciK148FyyNsbeiBTRDh5uE5ohHQY4
         Qsdk/Qxkf+mzii/MZGyHKwq5MGIcbTUOiS88Zf8R2QD40oWsebqBunSLAsHYMHJvk4kD
         OqneJ+z1MiSnKyHyToC1/64SimnHZl/JfRLQJSYJOrgWbUU+v80cI1s1FshPU8Ttmers
         8Fgrp49TLD2Jw+CmSoJNfCMvjRAx3p3oGu7aIrs3lRm6oGNGZOIMfC95EIdYPBc8LlSj
         sb5im1vkaPCWs92sY/K0dOgAGmnU0IoNpX2ETjOzeulCGG8f34yk5kCTbpA+m6P4Wsas
         ERMg==
X-Gm-Message-State: AOJu0YzvGlrohD/hbiqFO/knNA4xiCNblMXbBKQo4Q2M6mpyQy6GG743
	ZAj6iqmD9k/KGy6we3kpYG9HIsFCRLLRl0z9q7Iuiu6rQlPh524U36Nn
X-Gm-Gg: AR+sD10kWjCcvFoBhPSUwogue0GykO9tWz8UKn4r/5sU8cftlhOTMZetHJ6i699EEcr
	dd5+Nvbp4jFJyAzt0wxdnODb8L10/o/nfvrqnqHa0wwryLQqzuD4ioioTs06g8OGPkpfAkmLeDV
	79mGHJH29gwsWYo88xf6JuFKJenZ2plG17JpqHdTDgK4zdtjvR+peac5kn5Z6nE+5kpcyArRN7K
	aQFwJ2GtqsZP4AwYRU8ZH287Moz6vcJEddDjjwLA/UeN1P8wPVC6J3VrgplSBVZi6L2noLsms15
	6lSqNpb969Eg4X71t9voN8iYWOptBOtMqyVWlEeFoovG4tFC7Ezv8yC9rxfngxxpByua5BJ08j9
	8Uv1jgqSmqW1pLbpatY/1YHqSgqpFLbK5tYR/2l+x7nHg2iJvKijK6FDVGIHaroToTzPiOwRjgo
	8n8krqOKdnTOyOpGmrlZK/YUO+wC3K6foVo68L/V3lkZcYUsbWv6OHmypoFGg15F3sJy+uD80IW
	zOSLs3MKxGvQm71OjtbDISQDLgKcfkjC4x+93DQmf9L5TI2Hrs=
X-Received: by 2002:a05:6a00:8d6:b0:847:94bb:30db with SMTP id d2e1a72fcca58-84ee48bc6f1mr8775916b3a.49.1785738311301;
        Sun, 02 Aug 2026 23:25:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29f312sm3132816b3a.33.2026.08.02.23.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 23:25:10 -0700 (PDT)
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
Subject: [PATCH v2] spi: ma35d1-qspi: Enable GPIO chip selects
Date: Mon,  3 Aug 2026 14:24:44 +0800
Message-Id: <20260803062444.1649057-1-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
References: <5769eae0-1b40-419f-8311-0d919bf619fa@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_232512_651523_A247DC2E 
X-CRM114-Status: GOOD (  16.21  )
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
Changes in v2:
- Enable GPIO descriptor-based chip-select handling in the driver
  instead of disallowing cs-gpios in the binding.
- Set the maximum number of native chip selects to two.
- Reject active-high polarity only for native chip selects.

 drivers/spi/spi-ma35d1-qspi.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 541d5d72484c..60e082de58f5 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -430,13 +430,24 @@ static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
 	spin_unlock_irqrestore(&qspi->ssctl_lock, flags);
 }
 
+static int nuvoton_qspi_setup(struct spi_device *spi)
+{
+	if (!spi_get_csgpiod(spi, 0) && (spi->mode & SPI_CS_HIGH)) {
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
@@ -613,10 +624,13 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 				     num_cs);
 
 	ctlr->num_chipselect = num_cs;
+	ctlr->max_native_cs = NUVOTON_QSPI_MAX_NUM_CS;
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


