Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE05D44D78
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0JcE14w5p6N0fo4tVcmmC31puUI/DV24DnItGCBT3I0=; b=1j4cyVbI3XHQof5lQANX7Zfm0j
	7rLuzU5eCJ7jj4+tVvvGRhxajYWW+jKtir+r3WQhU5E3tYvxTPT9yMqmYs478e0QWMtIFQ4JIkU6v
	schJB0RHgFBa+8Dm+kWr9gOktSD3RJnBY9KP1EpF8C+8kxTgoP2VDQl2rR8uY4xJsb+pWVIc7AGNj
	syF08qZnnxUueE0b+nXasNxCh9dXsHOLvV8Nd+GtKxWGCyfT9zSnb20vDGwJdTBnTiElql0AK2xfR
	ETezmqxYGXqMG+HvkqvJZPFLaZzGMZk+p9MIRd3upsPOUvsF5eTMe8oTJgomTSih1xhBi+bTrd2zb
	o5T6ONqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h3H-00000003cal-3Re4;
	Wed, 06 Nov 2024 14:30:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8h0M-00000003bE2-0oeR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 14:27:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-72061bfec2dso6230107b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730903249; x=1731508049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JcE14w5p6N0fo4tVcmmC31puUI/DV24DnItGCBT3I0=;
        b=XqrGxjBFIYbBkifijZNhhJ/g/UnYOng/2uUDMRLFFn60JDD0KG79nQuMyKIp2YKSZK
         3RrxsVCC+h+XwNfnFgirA7pUI4gdTmJHcjSjZXgPya4oqN0LpB22capA00iSDdo9QwWh
         k8kgyuxhZzXUEqVXb3W/gOxMLIz8bMehu25CRsbq85CTzPdrJ+xlE02NBC8uHFrXYLQY
         jrA8pSi//4Tsn697SQYqeWg6MZJjaB9ZPB+77P8PMJxi3jsFXRNv06hqnoDyL6WF+cq5
         yFWK+3guRrMOS+J9Kl2j+c4uDtbs/IGjSngDRQ0sY2dyLaXns6Yb8CWuBFg7vIsvO8n5
         6SlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903249; x=1731508049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0JcE14w5p6N0fo4tVcmmC31puUI/DV24DnItGCBT3I0=;
        b=wiKXlFK0Ns7NByRR1EZzgmWbayJMphicJQJwVsl9eEbxZaH4pwB7mM4KUt+WXw3YXD
         xSup4dalb4Tf1O8Kh9re5F1Gh7tES++FYpAaqHFp0OZftKWHfZrGpPXQHI9cc5VrejSE
         phGI4VEW0RX8/AuyyGmEZ5MIKUmXzkqE2sBamZY0muVVvpUV1JfJ8o+yO05urbztshYS
         o9M1moZRViInhPJll9rLPSrwMHyF5+d0JLHsbO1gGPI/i5HafzRU0SRieXA37ZOKi74E
         emrgu+rjKXeSVw+tkiSVdS8eb/BNhJv4dT9umkQa/e/AiAhyN1w+/5fAs8twEQEZnVFp
         wR1g==
X-Forwarded-Encrypted: i=1; AJvYcCVL9SegtISy+YsSM5A/FoEFGvgqU7vrqsqWHUyReTrCI4iRCpevotVwmItpjIDAqlE7n4ta8oy5fc88j24/kISQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvYSB9raNK8yBqDzgARRBCtYf9PmWDe+zFXyc8pL43w/n0wuCw
	kclg+/S9Mm7tL1+OrymbPIhEHfpMPLht2mzc+0XqaozM4j+Y0B0b
X-Google-Smtp-Source: AGHT+IFg06EqOdCF2rpOYxi14EtM+wTa5t4FQVjglGsXDwwnpcFEc0NFnQQneJknXwmLobufAnZm3A==
X-Received: by 2002:a05:6a00:3d51:b0:71e:cd0:cc99 with SMTP id d2e1a72fcca58-720c98a1bfamr29992840b3a.4.1730903248950;
        Wed, 06 Nov 2024 06:27:28 -0800 (PST)
Received: from Kuchus.. ([27.7.141.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1ed2f7sm11843129b3a.64.2024.11.06.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:27:28 -0800 (PST)
From: Shivam Chaudhary <cvam0000@gmail.com>
To: richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	Hari.PrasathGE@microchip.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shivam Chaudhary <cvam0000@gmail.com>
Subject: [PATCH v2] tty: atmel_serial: Fix typo retreives to retrieves
Date: Wed,  6 Nov 2024 19:57:20 +0530
Message-Id: <20241106142720.41351-1-cvam0000@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_062730_253532_6A970C9E 
X-CRM114-Status: GOOD (  10.71  )
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

Fix typo 'retreives' to 'retrieves' in atmel_serial.c file.

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
---

v1->v2
 - Improve subject line.
 - Improve commit message.

v1: https://lore.kernel.org/all/20241024172300.968015-1-cvam0000@gmail.com/


 drivers/tty/serial/atmel_serial.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 09b246c9e389..bb1978db6939 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -1166,7 +1166,7 @@ static void atmel_rx_from_dma(struct uart_port *port)
 		port->icount.rx += count;
 	}
 
-	/* USART retreives ownership of RX DMA buffer */
+	/* USART retrieves ownership of RX DMA buffer */
 	dma_sync_single_for_device(port->dev, atmel_port->rx_phys,
 				   ATMEL_SERIAL_RX_SIZE, DMA_FROM_DEVICE);
 
-- 
2.34.1


