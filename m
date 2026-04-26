Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8965CFF8850
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 21:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pyO/fIf9mlptgfmwEFv0+iVbuqCap8jpTzF1uKuXdKk=; b=FdchXjrGmPJwt0tmByyMEwIHkE
	TkhJpnM3oqxTzv9bGpY6zhxYALFAk9DmJiT3Xo0BWa+FRcBEKCnwwPI0IJi5scAAH70RlL1rOUumf
	GavYoBeJfd5HSmadg0+1mbfFULVVcI4Lczv7x3I3ORTmKj6pS4NWNIun3bkibvEwLL5NHZiJEsQ8s
	tYqHN/nnQvJGnFq4YtnADV3QzTtTdCa/8US8kDLK3Fyu9m6TrX275CvvOOsaIIh091ttdIsLPOnMD
	tz0tWdIE/LKdUAiY1J6J0KbodGGnchjh/x7PnlUxtEPe1LFJhsJvuzy+Zt0mMr/u+Lfz6cQ4oPjwx
	2lCzOWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH7Fq-0000000Fs3X-0fae;
	Sun, 26 Apr 2026 21:43:06 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wH7Fn-0000000Fs3A-3K43
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 21:43:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ba840146so86279445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 14:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777239781; x=1777844581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pyO/fIf9mlptgfmwEFv0+iVbuqCap8jpTzF1uKuXdKk=;
        b=I7vLiuAEF87fE0UFMtziqJtNJtjirXIAv8Yuq6qKZSdCyE0MFJt8B3rl49jm60n2nG
         9wNk3C+4gKAXDgHGdta7DSWKqM8MuUeIv81i2Dh6VkdwW9P6yOYVwPuF7fftEntrnRWN
         bLnqv+/FdOVl4HnYWv7TGLDCt5SOFUG+CJecK1emPYqUKh9pUsRpIZTB1wIblp2RS5GN
         tdEnB6niPmvTCh5+M6Lh0pTx+CWyIknfpZtQ7r4GpV2OFVh3au5QAW4C+KSNM8+QklqC
         7AUN0NUxtBBT/5NaAUynacyR8zBLabq0sRrVwTIZV4TSsMXsViEpcIhJ2BrR+/DWhMOZ
         8JwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777239781; x=1777844581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyO/fIf9mlptgfmwEFv0+iVbuqCap8jpTzF1uKuXdKk=;
        b=E2I4T2AkN2RcljFTJS3zIpFflqAd+hQMm70MVTQywlhbMFQ0p7hGVq/b6w76v4mwMC
         0Sgl7ncg1PslGn4nk2yEWpleK1PSkJ33usI6SOXlm8XoD2P45fisA2f3kUcJ8tA7qUm3
         tmR/KeCEfga/WfyqweB1N0eQK8eeDAfnlj+5Bw7R2SPoVO+qC0/qB9sm3cSBdHZJyrOb
         VFza+TvJebOvltb6USJLwJAspNL+hQayDb1XQn2Ks9zzAjaw6AvKR74qD1pzo9EDPIXv
         5mVuHt0dzjXIAuELP0YGU6lwBwZQdHqiTDXPcxkD+pAxB79XCg6ul4QUtuTnaM8Kazoi
         W7MQ==
X-Forwarded-Encrypted: i=1; AFNElJ97FDvZZT+j03+DrfytTKb0Mn9EEKF3n6XmC6hCtBLzxYwZqXbnxEbMhDc0DGrZBzB3hoR+0R+uQyo31Mt5uBUU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+P7Y4ao1QFa3dvhrHBJfGOD0BMn/WhaIimZ/Jrd8RAod5B2yg
	+M62d4QOY9Ac7QSjnfeASBYLW/CiwiOH03H7HZ49W5tOjAA/cYpaGhaf
X-Gm-Gg: AeBDiesWFqfx+c4TQLPgAJY3jQoNPmtjNbhzskWDiJHUcANmqN8wbacSLUB2zT0+RNU
	fZhx5omDe39TjcOpcvxVuhEAIotB9BjvPXMcUy83V8BiNO5Q6WLyFtrJz4caSQ6eNBOIUzJFhbD
	39HjFhIde37eKG+4sHtcrSiMSmvYdWpggA623/czgKTU6d4aYeDG0VumNMdaNY/uja7Aj/BKraA
	53eaaVjZFxZoMzVqkJcI/bqbJgvFW3KnEl/vDCRaJc0Wu2uWIvZmW7pW7XuTpZTo2I4lklvdKuE
	83Z3U3GtIPO2hFXY2SnurZMKKk1BbbdNzz4E6PqByorvJLPBaMX1bitQXdmFXIC7f90C0BaTiTb
	PJzwCxXnAYrXnpE03aKv1KNfuzAP7qRvpNa8u1exDludcKfe546cKhc0W0U2hUAKlCp4hdcJvSX
	pFzc0Ohdv7fn8FwGdWV/ZPGnNBxn3giw==
X-Received: by 2002:a05:600c:a31a:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-488fb785b7emr432470225e9.26.1777239781269;
        Sun, 26 Apr 2026 14:43:01 -0700 (PDT)
Received: from fedora-dev ([46.10.223.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1cfbf2sm782831725e9.15.2026.04.26.14.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 14:43:00 -0700 (PDT)
From: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>
Subject: [PATCH v2] serial: mxs-auart: replace hardcoded 1 with predefined macro GPIO_LINE_DIRECTION_IN
Date: Mon, 27 Apr 2026 00:42:50 +0300
Message-ID: <20260426214250.781151-1-zlatistiv@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_144303_843885_0D699A6F 
X-CRM114-Status: GOOD (  12.00  )
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

The GPIO_LINE_DIRECTION_* definitions have just recently been exposed to
gpio consumers.h by breaking them out in a separate defs.h file.

Use this to validate the gpio direction instead of the hard-coded literal.

Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
---
Changes since v1:
  - Commit title change
  https://lore.kernel.org/all/26cd0656-ca76-4cb7-9f1e-b8c042a7e2cb@gmail.com/

 drivers/tty/serial/mxs-auart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/serial/mxs-auart.c b/drivers/tty/serial/mxs-auart.c
index 693b491f1e75..697318dbb146 100644
--- a/drivers/tty/serial/mxs-auart.c
+++ b/drivers/tty/serial/mxs-auart.c
@@ -1520,7 +1520,7 @@ static int mxs_auart_init_gpios(struct mxs_auart_port *s, struct device *dev)
 
 	for (i = 0; i < UART_GPIO_MAX; i++) {
 		gpiod = mctrl_gpio_to_gpiod(s->gpios, i);
-		if (gpiod && (gpiod_get_direction(gpiod) == 1))
+		if (gpiod && (gpiod_get_direction(gpiod) == GPIO_LINE_DIRECTION_IN))
 			s->gpio_irq[i] = gpiod_to_irq(gpiod);
 		else
 			s->gpio_irq[i] = -EINVAL;
-- 
2.53.0


