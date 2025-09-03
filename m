Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C37CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBLclJ49GwXW6Sl/7GWX5bwphgDLjuO5JM0C91emygw=; b=QNIg5ymf73n1ldRQUZqzvoDbP6
	5fWCqBEgTfkEeHbBy2nSm+Ke0SQkr23WFjb7h9RZ9bJPXBnVlBUSnRvPrB9k6aCHPbJYDLWfIuAN3
	Qh6Gg8mSEgthyfGTQh2yl49X4wgPDUFKkXA7sf9J1KrE/IKGkDnwHZVjFBeAIzBc224Tj5wtQqypl
	0kENdRDTXGuutKbDiqEkgQOLb46gD5fwMPl8KQVvEkXFvj4FuP8hqQiXiOF6baw7WlHCOYSlOzafQ
	uTdX6KzneXYCqX44ss0xx3bTK9JQaNv3QZymXe2D8QQz6eoaHE+xIt0Ugq0XDK1UpB8GJCyE+kFIv
	7TtA3DnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utk9Z-00000005zfD-0J0M;
	Wed, 03 Sep 2025 09:51:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiy5-00000005d2F-35Lm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:35:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b9bc2df29so1894925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756888548; x=1757493348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBLclJ49GwXW6Sl/7GWX5bwphgDLjuO5JM0C91emygw=;
        b=VcbEZUsr0wxVX9+0mOSZBZwWikihmE8fxqvWUjsn2tCS0+LbpPbFYkz/wI/PyqUVu2
         UA3cLxxSF+qf7SH8ONoS6wdBcl1+dxQSK5uEb+QkU0NBa1AxYZKS6W6HrV9extYxs524
         aZzR+6p7cJotGJmFBfA2wf9tkasjFgUX8KoHPWHVSHG692IrO+v1PIbaAX/2GapGii2V
         zIpz+BRdbVPONpIlH/ELqeY5YLVjVz68bjm5BlrA1tWFIXv/GwqEe6mZt5YPSZvbA3z4
         7Rk8UXzcOOmzaloWT/XZM6yc1CehcBMQFIfTj9ey/4r31YKY379qHS6j+ax7vXkmD4Pz
         8P9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756888548; x=1757493348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBLclJ49GwXW6Sl/7GWX5bwphgDLjuO5JM0C91emygw=;
        b=PvBtyw5xYh+mh0qW4eLJZOHxEeBgmjWBqFWmlgcRmhqEQkFLIRVGJL6xqTkTeG0fHa
         ZVUMEMMG4FyXhv34FDrgViCHx6cpxYS6Yn9Spk0y0b7dX+IPD1jhzRIcKi/s9bIou2I2
         HkL0/RAXVcJiiQS9iyuIVy/U0gDgy+9Ceb12YuyRdMNEzcGplE+YykydQIYqG7CTWr5D
         vkwT6bK05Or+qmtiHnI/N2dj3Oz4DTCIqAFHv67OMo+NM+M9aT/Yh9bhD2dsGJJFZv5K
         lb/M5ilCiMMxWka6+GNpfbWI4e/O6V3A/lPsd1iHzWgygeN7bY4ICPHbO2R1wClS1ooQ
         lVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXr8616rx19GB6A5pticMNK12snohe6MDn0DlMZ8QmHzW0PhMItK6J3TfuV8aPiOliJsScnCKQtjNLcp/TQ9F1k@lists.infradead.org
X-Gm-Message-State: AOJu0Yza4mfFTqzNqMgt/JjGZJrc3VfwUURntCJyOwj2eE1dljGHTvwX
	UykEH0zvOQekMTYVrlYx8fdwYLUY0vVA7ed59EHfX7rcWZStzAJqSEts
X-Gm-Gg: ASbGncvEKdvpEAHekHWGO+2hgvKApYIGndYQgY+CJB30H2OZ8dCVLZWbMadEZMgyVqv
	6Wjlc+zF/dTV64qBmIGEMELpTvQl0/2hArnCFIyRa6enGiRFSbHKtvERRvhqWx7FcY1UK52EWN+
	VHdEKX1/n6vI6o8TIyZokuu18v1K+LF73TocL+weAyluGHfv6CajYETaDCLyTCBfyVKbxzwSC92
	qQF4XmWtVo/Rycnza8IOYjZ1cvXDAJoafaJTA1/YuQwKco0ttfDbzj33cRACBH1u+mDZDd22hWa
	hMAs/hSyX+u8CIe1usUM9de3IfP6VVcAYZXeLwJ9/+yIKwewiyUi4MwvJw6/WRp6U8kQ+Lg02x4
	X5cxO1sTqt91ej5qT2l7x96OLE4wAywVEgpCwAl3Od6AuZZvzekB0M+EtMVR62Q==
X-Google-Smtp-Source: AGHT+IFW9ALHmxwCXj4TL9k6+4FVJDaJACd/tV4951OuhZUxWmtj7iVAKFlPyglc3iIZQiAhzOjBKQ==
X-Received: by 2002:a05:600c:3486:b0:45b:71fc:75cb with SMTP id 5b1f17b1804b1-45b802d2fa7mr81398485e9.5.1756888548145;
        Wed, 03 Sep 2025 01:35:48 -0700 (PDT)
Received: from thomas-precision3591.u-ga.fr ([2001:660:5301:24:6179:26f2:8797:e6a9])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b87abc740sm164460585e9.7.2025.09.03.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:35:47 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Royer <nicolas@eukrea.com>,
	=?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: atmel - Fix dma_unmap_sg() direction
Date: Wed,  3 Sep 2025 10:34:46 +0200
Message-ID: <20250903083448.621694-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_013549_771639_811CEDEE 
X-CRM114-Status: GOOD (  12.95  )
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

It seems like everywhere in this file, dd->in_sg is mapped with
DMA_TO_DEVICE and dd->out_sg is mapped with DMA_FROM_DEVICE.

Fixes: 13802005d8f2 ("crypto: atmel - add Atmel DES/TDES driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/crypto/atmel-tdes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/atmel-tdes.c b/drivers/crypto/atmel-tdes.c
index 098f5532f389..3b2a92029b16 100644
--- a/drivers/crypto/atmel-tdes.c
+++ b/drivers/crypto/atmel-tdes.c
@@ -512,7 +512,7 @@ static int atmel_tdes_crypt_start(struct atmel_tdes_dev *dd)
 
 	if (err && (dd->flags & TDES_FLAGS_FAST)) {
 		dma_unmap_sg(dd->dev, dd->in_sg, 1, DMA_TO_DEVICE);
-		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_TO_DEVICE);
+		dma_unmap_sg(dd->dev, dd->out_sg, 1, DMA_FROM_DEVICE);
 	}
 
 	return err;
-- 
2.43.0


