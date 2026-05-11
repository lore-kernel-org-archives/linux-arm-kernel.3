Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F330CD37B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 16:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=; b=GfFu4kC5VNr7tc2koVNJ3+Lt/L
	l0/wJNLK05Zo+6L90JhQZO4oL8sYE77CVXj0i5qpVmIWSSkeKEyzukiamSd5lfW59+OQS8XKAwORt
	0sbPiV7T51mhhppwi1DbzSql94edeZACgTFfmiCbXtM3bJa/YJVlcyq3awKS4lmbd/95pd9Pyhqj2
	h986llCSj0pk+f+zwxaa237M8K+sbQ9QCFhQ8jwlDxl13ZdoBydvDb/BumuL5ueml78rc6zL0qlsz
	U/BGWo/xGP0JVJGMB1tWEmFd73V81Ls6gqEFL/zQIhVsaSOgt3So/pkevb+iK9Uzbu1x1USYM/uWp
	pQlW2yOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT5U-0000000E8W4-1ZAW;
	Mon, 11 May 2026 16:02:32 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMT5S-0000000E8Ud-03lL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 16:02:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad9a9be502so27532345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 09:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778515348; x=1779120148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=;
        b=kuUBpMEHEfQoqq8nbMHZ5MOp3Uw6L+tYpy1CDK2OGOs3wbheWc/SqJhmBIjkAljtkI
         Zk8hRny1ShNYlYwOHpHGcphJnutXtVkrXIW+uiNo+BXs6BTJvf5/c2/bFuu4BoPEgzft
         c8nE9i7rmjr3q7kFP48GzEjL5o8Fg3ANa8VOkJb5XN5zSXYWepOVkWZLahejX9Qyt0MB
         Nrmnt9nSVhf1SFz+7UfBrlpIAryumb+GvN1JhhKAlqfAew5DiCt7QVMpJ7Qmb0BbFK8j
         4FlyKGEj7dvsy8fshIadDlOw/DpQyHcBqm8owASCCUOYQqmtgpvD0GPQYUS+8ZdMWiU7
         FGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515348; x=1779120148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1x/mOaa1dJhywLuUhoro4xsZpsIwTtvbqXZ9jlO2CSA=;
        b=q660AN/rUr3A0KqZUrqZuqpKs4eQAMDDkrLr78ldWchoN9fSvq2LamwYQv4UzJJxDE
         es3+1DYTbR8jfyKxdhlMXXKqScGV247Y3j8ct72uVIYy/dF3E5c6vQSNLIhfDbhP2DOk
         OyYLc6rOKp1+iu5jGtz4w48z2wUmYXaMScdE88TxM+VBW8uD5fq7FX1pZPDcqUiZXu6M
         /Yru176D9jsJuuQZdaegqjMhXK//fZD4uuTLN9f8ggGjt1ybM3UELTG7OXNHVU7LFokO
         SXc2ahULx+x0/jvKTTlbjRzrk5D8CFgbSO5ObEWQPSaJjj5uupkJRIlsUZZKQnj+LpBx
         FeNg==
X-Forwarded-Encrypted: i=1; AFNElJ/MH8HUYYamp/tMs7ZLq0gwADF1j8k+feY/cpWEJsQXR0YStSUgTMhH5cs5udJolUty/zhsZE5ZbBTmi/yfcyqM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0vOAiGv5jH3WBJSBTQbij3ufZhhbQ1uKE2LQdGEgYJQiu3z4d
	ajCegAnniT2OVkJVv9gAQj5GE0YVqul+r1gWo0JK5xDqeHm4mSyIxQ9k
X-Gm-Gg: Acq92OH6m11EgsIqqeD4cf9v3WTWrrRsZEoCmNfG0u39onyvy+UWeY3hE9d+ygeg9J3
	xukhnSJ+mrnVCNpjFYfZF2ab/OmzBe7lYUZF8J37JHbkruA6nk5L3CDD3Z+i+xZ1iTfVmkt7/tc
	GGMylnVsWi+KFQ7ELDyUnCgt9kXZ60tChZCUNNwKOx8nFKFAgM62HPAwGE9SsyyFFfBVC43seKD
	yoOxYmoZhNhBjY88biB17Ofleg/aesHHFIBGp/eTKPXe3WHR1/W6n98d5JQ7tKPmrVdxUOBiKpN
	E3+BQFG4yOTzOmo7KdMldh9UTjsHPYN3yI9Fc/Pkui5c7faoyZI+SD51DnRFgXaB9WBXfVYe+C0
	U25B70KSwc81O3TU0CndArh4yYiQQBVl9C/K4VOEgok3JhSu/9lCPPShKHpsLHWa40sjuTaFskM
	w6bQESvgQkwWJox9x9+Tf8MucYsw1OeA==
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr180279745ad.26.1778515348035;
        Mon, 11 May 2026 09:02:28 -0700 (PDT)
Received: from penguin.. ([2401:4900:cbde:8ff:92b4:bf0c:6a0f:7ccb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40a65sm108036435ad.20.2026.05.11.09.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:02:27 -0700 (PDT)
From: Rakesh Alasyam <alasyamrakesh77@gmail.com>
To: gregkh@linuxfoundation.org
Cc: richard.genoud@gmail.com,
	jirislaby@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rakesh Alasyam <alasyamrakesh77@gmail.com>
Subject: [PATCH] tty: serial: atmel: Ignore chars when CREAD is cleared
Date: Mon, 11 May 2026 21:26:55 +0530
Message-ID: <20260511155655.26435-1-alasyamrakesh77@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026051106-obliged-dismount-d85f@gregkh>
References: <2026051106-obliged-dismount-d85f@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_090230_083700_BF9379D8 
X-CRM114-Status: GOOD (  11.48  )
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

Ignore received characters when CREAD is cleared by adding RXRDY
to ignore_status_mask.

This replaces an existing TODO in the driver.

Tested on hardware.

Signed-off-by: Rakesh Alasyam <alasyamrakesh77@gmail.com>

---

v2:
- Add blank line before comment
- Tested on hardware
---
 drivers/tty/serial/atmel_serial.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/atmel_serial.c b/drivers/tty/serial/atmel_serial.c
index 5d8c1cfc1c60..5c756dc904b0 100644
--- a/drivers/tty/serial/atmel_serial.c
+++ b/drivers/tty/serial/atmel_serial.c
@@ -2184,7 +2184,8 @@ static void atmel_set_termios(struct uart_port *port,
 		if (termios->c_iflag & IGNPAR)
 			port->ignore_status_mask |= ATMEL_US_OVRE;
 	}
-	/* TODO: Ignore all characters if CREAD is set.*/
+	if (!(termios->c_cflag & CREAD))
+		port->ignore_status_mask |= ATMEL_US_RXRDY;
 
 	/* update the per-port timeout */
 	uart_update_timeout(port, termios->c_cflag, baud);
-- 
2.43.0


