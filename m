Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACC93CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 14:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yRGhlBCY/TW5XKeeufbyghz250gEgHu0HIRBXKkoYQ=; b=hzlnV51fBoCX9MaDRSr/p5Kixe
	gClx1BLpcwzps8Py0GECKWrQJG7Ouct0OB9jdpq08oXSzfJvQZjK6pY7+iROFrO2GiDLVFHVh5TQs
	DnOGZNmpV/izYyoC0rIyZwBh25evto9gBCQzWx8dnt6uA2/x75K7rLFic4fX7J4UJLfR/aXdxAsYB
	SZHOxyZyivdmSHI6bvV9KCzjSgg9lRtQIgWdt75T6pPf4MRUiYs/SRfXY54qm6VwSyt2BI+LZ/pdY
	W1Sws2wZQX5pjiLI8B3Bd52L/Ev7t1vWPIFa7SC9eBDw0Kn5hZqKq6rOInvLi5odYsJ4FK+Z8cHDp
	Z4YRDJ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPY-00000007CrV-2vKU;
	Fri, 01 May 2026 14:00:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIoPV-00000007CoP-2WCi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 14:00:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso28994235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644004; x=1778248804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yRGhlBCY/TW5XKeeufbyghz250gEgHu0HIRBXKkoYQ=;
        b=AU84q3xm/fPCKXa1L1yyVPSxYHzNOwM0cySxgHBuh8JRPLzRdX6hMc8ZzkDxOk/WOO
         81IQ5HhT1REQuAm9LTZ6NtD4p8nshNBrJnMDZyGO9A8Phb+RIjfRzYaC4KB40vhkpzCQ
         BneQhT2uF6gNMBN4wRQvIzqq6EBsRwxbfhLJyD1Wq+gS07MfSWK9c93mzuJT9HdVbRHT
         LS4s1yX8FUwXVA6p8aqnZQYZqzkv1ekz4EpUalCTKn0R+qGAheIsWv/xZgm8bczsc1oz
         DOp5c9nC6GHRlW/PhK5xMEEbs3i+VCrkoPqORYnW7wBLvEqLbKG8oMiZ5pX3E4KIeIwg
         ghew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644004; x=1778248804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yRGhlBCY/TW5XKeeufbyghz250gEgHu0HIRBXKkoYQ=;
        b=aHYy1xeDUpedNwO4rmCO0Y58FnjJIMMVdD2k93My6oMHmEf1j5ni94SXbOxeuGoaY2
         22998KKZT3rEM+97I9YjRW1ojxa7uct8E0XbfiVb2HSOjG9hF94LSi7W5EBi5jO93z7i
         j9his/leM4dnqK9oAcY8WhlVxdYgv+jNNgD7JCiFhEd0Z4sNVa2ZJhjyefHrVoECUas+
         jbKyFMRUMrdhOBn8nXtDKtFdUsAhPL6KwKTjay7aTJumfcyCEi9sCQygulPMDNWlqjxX
         Jlt8OGKG3Mwy97V22qXke1BfgH1ywrJ1qkpp7Zxs7Ag42UmXdgM8X0Q588miNfZbyNIp
         TnLg==
X-Forwarded-Encrypted: i=1; AFNElJ+8e0oVyFC8pJy0LpeCd1rYZpwKHQplFkroTpNaF8MJLfUr2X/Y2bv0WVP3uzSV1OzBLNcrJXJGX9FRq5Zl9Mb8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtg6n6ivAZMLOr1X2U45994wk0N/xdZ6jwccxVrqXSz35LOR6S
	H2Le5AkdSnxcTAv7Cz4FLX1oD6HmC3qUhHsbRzeLNxmjwKfhXTtPpRGp
X-Gm-Gg: AeBDiev5gwMxVypCPTcIHya6jUZQy/7C0E+9wY6lKHPXMee6AP1lhv0V80fBERYsZvU
	cq68qwQXlq44omL3JcJ57tf5JBcC4qTGRChfcMNv/4baUlvApvUQ1gW4N5at8rWv0v7xEs4DS9J
	fggbQbzoRW1dNYqvxBHExvzAuNfS4hRm0e+alRu+MvPnTiGd/HaDUgFK8gXdYye/pL7VgmJ89Nh
	Ej/PIDfkDrC8Gefg1khl0HHRVerN104M7nwBBi6Wt5OIZh+oK7b7865y+gtme8g5z9HpTOTr60M
	DRKBiQ4+VgBgSWXVCxs+tWpegXlB1FmjrjfEZ7zwmfmADhI8fHzxK6Jr0JaZIPJXT3tqYEagUb1
	8oLUEkDdSP5G4LGp5qfC/IbuWdz9Xln6G2gXuIWHJe00mfusVJltXREK2n/KmDPhyEMim6RizJG
	d5j0GlydnmKozp55c0S7TIq4ipCfte1X/EW9EVmURkd5GQ3GRbLs8caEBM0Xz+++FW4OLmqO4Dy
	Qow
X-Received: by 2002:a05:600c:34c6:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a85e7c80amr105322175e9.8.1777644003492;
        Fri, 01 May 2026 07:00:03 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:02 -0700 (PDT)
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
Subject: [PATCH 3/3] spi: imx: Propagate prepare_transfer() error from spi_imx_setupxfer()
Date: Fri,  1 May 2026 13:59:51 +0000
Message-Id: <20260501135951.2416527-4-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_070005_650046_E3E039EB 
X-CRM114-Status: GOOD (  13.14  )
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

spi_imx_setupxfer() calls the per-variant prepare_transfer()
callback and returns 0 unconditionally:

	spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);

	return 0;

mx51_ecspi_prepare_transfer() can return -EINVAL when the requested
word_delay does not fit in MX51_ECSPI_PERIOD_MASK. The error is
detected after a partial set of register writes (CTRL: BL, clkdiv,
SMC), so the controller is left in a partially-configured state and
the transfer is then submitted as if setup succeeded.

Propagate the return value. The other variants' prepare_transfer
callbacks all return 0, so this is a no-op for them.

Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 4e3dbd01d619..480d1e8b281f 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1382,9 +1382,7 @@ static int spi_imx_setupxfer(struct spi_device *spi,
 		spi_imx->target_burst = t->len;
 	}
 
-	spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);
-
-	return 0;
+	return spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);
 }
 
 static void spi_imx_sdma_exit(struct spi_imx_data *spi_imx)
-- 
2.25.1


