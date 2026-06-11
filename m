Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0E7CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+4cm9QbNYmcZl/MXjwCiNY3TdxompycqRGjEnRpi0s=; b=bFOdu1Yv4xnNHOFbyEV4wAcWft
	8ETxZnzPI8kNn/05KnLEpufovym1RT9G44ifRyqY9UAgZvXd4ptM2/h7Xy9TFV+ArzAHILynyrEG1
	iy/Kf3G2dW3eUmY5hGgZpvwi62E1sOx76q1aMljsRMsmWo6VEvtIi8mUqHLTvIhAwWyIqrFNRLmhM
	3WvoJEaVI22AUsV1l12ID25fZanx/Xsr1D01md1QGYKl/s/W1wx77ngRry+xKSGt9PO52VpEuAJGj
	rQuQAsDFwmcdzY6zbuT3rSqSza+ZaJjqPy8/DRs2s8M+EhObn7XSkL2MRcMuh87A85MuOhtP38sN9
	YlnlzvnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGN-00000008cn5-1xhV;
	Thu, 11 Jun 2026 03:39:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXWGH-00000008ciw-1NZl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 03:39:22 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84232e83ca9so3190072b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781149160; x=1781753960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+4cm9QbNYmcZl/MXjwCiNY3TdxompycqRGjEnRpi0s=;
        b=sYK2A/BWIxai1CFgnINTTM6sAzYdSZ6Vp2FhvRKsYRLRp7dtvDJKJZUNbxtlCoAv/5
         XJXDwYLUxtiKFqsmXPbAMssNhuOS+WXA7OUQdqOGGkFhV5xVbwR9uEsuycezU4FFqxbR
         JXi6yx8tc73/CLdu3v0hZheDxO1NgukaWU9H7CW2IduPIBNwLqSeULkToc58aBHC3mtK
         9/GGh5C4xnb6Avzwir82J1r9yFJSr2diwbo4Wc+BWPPpdS4BZeYqolPaEl7nrk9McpNv
         HM8wz76GIMICCDfJMie+lob34LxRaOQrTwGE9wKbwa/V0Mzn1bnR8HdxBp8WezgDUrUS
         qWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781149160; x=1781753960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+4cm9QbNYmcZl/MXjwCiNY3TdxompycqRGjEnRpi0s=;
        b=lyYgwO1elqU2dl+xxyUwIb4u7uU9r/r0Vea9hPzLIz/+9m/TsE7jiueKtQ++YFsoPR
         Busa5irk0hyEu9Bmy202ABZTETwBykFI24BNniUh1m0MJwWVcf1I+ojLQqPsRRmqsF3v
         R2cmNEjo2ysPExWDnqcamyqTiaIQgkQJ5Y3TqcoKeP4nwSNDlWfm8BxyvrVapRZ6ZEHP
         jHgmZlixzk72M491Rkv8Wq2tvkUUdaW3IMaQPP99/VOjJ6577QKjGGZEPuxcxK23FKI4
         eea4BXTHM8qjqGmc99LW8Tu2gzipSusO2jWY5zzm1C0/lLu27fhTGhUAwTBzwBeSESiM
         fFHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+S+e823m0cj63bzyht1zJptkLAq7tqzouh8vbr247OqZWl6kChgejZJcFUaIu0lcl43tKwraXO4Qd0kxEe1bwa@lists.infradead.org
X-Gm-Message-State: AOJu0YzBd6MGZWLld+GWFS7eQAmi1jPv8JsJ1NWO66BTg7iwZrg1QlF0
	txcNadvEXyDRD3jv/BkdXJ3Lx54qxG0RyAjjm06EfgtNETvl3VAWfIJI
X-Gm-Gg: Acq92OHLRMqdK5g7UOlkN4R0Z6VRtWYqx9ERwyLsSXpJq1lAhwl7ymG1IskFl1YLD9V
	x621B9PRSyFbCQnf8O8QiijVhmyyH7Nd0nBwFPutsz7t8Etdil37+rxqHdkiFtQACkU/7Ofrj5D
	zRwLzfHp4FJszjuc68w1Qmu5Je0j3DrfrAj2457rOiaewvENM9GNBZ0izg7nbK2ZAXV3WLLxKw0
	Ze9/YhmjlPqYaTLhWjFbUFpfQoz0BdURACo3F8fldPqYUaDbMNQ2zxFbX30m7MDicQ5wDh64P+0
	MM7+nQ1NcVEn5O91Z7eYr3alc3S8IozsJ1zRDVKTpjmS9SsnYYAHVo2kHGxzBbFv3glWqdYbMjp
	nWdhqbm3PGq6Utt5n3AGlp8KPhIuPHfp1nLSWJElodObKTeOqKDagnoe5xR7vvlZkF7y091tFxC
	2taY/+iAnXp8ZinUtkpaPKO+xyydwwOELJLH9XKIusg5lJwoojwDoOcS9O/KvT/3hcNgB+4R3j2
	aCO0EsCwt6DdMQkCs/NJ4+D3vORpF4dFIeizTvVP4UdZg==
X-Received: by 2002:a05:6a00:194a:b0:842:5ea5:5ff8 with SMTP id d2e1a72fcca58-84336bc62c8mr967189b3a.42.1781149160353;
        Wed, 10 Jun 2026 20:39:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84337bb47eesm334548b3a.13.2026.06.10.20.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 20:39:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE)
Subject: [PATCHv3 5/6] serial: mxs-auart: clamp RX DMA count to buffer size
Date: Wed, 10 Jun 2026 20:38:55 -0700
Message-ID: <20260611033856.6476-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260611033856.6476-1-rosenp@gmail.com>
References: <20260611033856.6476-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_203921_387002_E35F8630 
X-CRM114-Status: GOOD (  12.23  )
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

In dma_rx_callback(), the RX count from the hardware status register
(AUART_STAT_RXCOUNT_MASK = 0xffff) is passed directly to
tty_insert_flip_string() without any bounds check. Since rx_dma_buf
is allocated with UART_XMIT_SIZE (4096 bytes), a hardware fault or
compromised peripheral reporting a count larger than 4096 would cause
an out-of-bounds read, potentially leaking kernel memory.

Clamp the count to UART_XMIT_SIZE before use.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index e2b656638ab3..fe48a372d022 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -823,7 +823,7 @@ static void dma_rx_callback(void *arg)
 	stat &= ~(AUART_STAT_OERR | AUART_STAT_BERR |
 			AUART_STAT_PERR | AUART_STAT_FERR);
 
-	count = stat & AUART_STAT_RXCOUNT_MASK;
+	count = min_t(u32, stat & AUART_STAT_RXCOUNT_MASK, UART_XMIT_SIZE);
 	tty_insert_flip_string(port, s->rx_dma_buf, count);
 
 	mxs_write(stat, s, REG_STAT);
-- 
2.54.0


