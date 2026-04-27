Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7D1FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bl/XCw0/NlDvZucl8fmIFkULRBGXTZv9TzNsGmOAeb0=; b=d+hCT7iRfFfaboC3X0Q72kzPmi
	vTQLL6jpdsbNvMqlHdSTnhWm32aHAM1SopILVUkikIQRyeJJUWVhlH22Se5QGdoErykMGrJsZT79g
	baj0DbbFqexWmjfhsluGZITX4tmZfNcbp7iQvKf1RzNw68KHsvI4M7Fd77BsT/mEUuxpvrjDVlpTy
	stkoU2snWF9OGwEYEsVoKb3C9Ko03gxJ1HmLo5l+3NlAX379FuEy4+AueOhpfed8MxBYhXGHTbjBy
	kBfW0IMhlssrE3IKsDcWCZV13urUSvkCQGS/5Hgl49Q0CENZKv806B/FUd5fL9niXN5pH9uLmnp2S
	4MqEmE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOtU-0000000HN6B-2wlg;
	Mon, 27 Apr 2026 16:33:12 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHOtR-0000000HN5K-2qHa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 16:33:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c7973f67f4dso3072326a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777307589; x=1777912389; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bl/XCw0/NlDvZucl8fmIFkULRBGXTZv9TzNsGmOAeb0=;
        b=r8yB8RPMh3RMcGsxqAO/mhtfTd18E4p5AnnE8b2C88+VXQSF5IoROL579uYG9wLw4t
         jK5XYEzv+wc7Oz+pHPLdwUU4YobwVLnbRP6tRi3F/S4fg0V6YS8wXJ569/JS3XPjtcTA
         MCSEO9eUXxSZIfeOxfeL2eCQaZDHBda82NOhZ9EVRJQswx179/XZ6X7rTniYDj4CN859
         T9JobjXDHS3exsUp4za+gWt8NT90/iaP+50su1PHrCA8Rh/jV3JqzuaxBwUOrN2dAAOO
         /B2kooISBhNMa9oAq39L/gGZ4TFkkUhzqC2Xd0no7b3MO1rp2Jx5O3dBBVNSw2+vbNkK
         hPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777307589; x=1777912389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl/XCw0/NlDvZucl8fmIFkULRBGXTZv9TzNsGmOAeb0=;
        b=qwlUWBxux2j8BIn9jxVBILkLchDDt8Ive+oaVdWIo7QPNasuULTMk87ztpFnknr7sl
         gQdiyvZtwSeNYjOWO4EBCbsw3sYRECq7Ze7uQbuTB7MFUKPU6MOqu1/GbH7kWptu4pV1
         CUnSbVwQbK4wmB3RQAr4M3PkcU7Zcvk7zBpvEQfb2NLE6Rf+67ntAc58n7i92ycJm1W7
         QLOxWveG87dj7PsYk2IZQHn6zpTcPMLS8U1BZcBx0ZNBTUtXOHl4q4S4PA9twjE9aTp8
         PicBWyQK1tzKk0OxWiNh/io1a+oQ7d6qHlJiHBho+0BtIcojTeFnYBj8yNaSrtowx+pY
         B0zw==
X-Forwarded-Encrypted: i=1; AFNElJ9ZZ0jLM6y4RV+27lbqAVkHA851FZ6n6YuNDQwmkH/T/bf4Mw8gpFGrIH+f2V52j9zLFbho58Fv0lNaOYqMNMFW@lists.infradead.org
X-Gm-Message-State: AOJu0YweyZeZGtYhqKFTF3Oii0knSPNRsUMTNedMvoVJvLJ1KCzK5XkZ
	13c/rHwDEs3NajmEOfbyhiC3A7/s8rX9PCmR0K+BvSMVwyrDbZBzGRFo
X-Gm-Gg: AeBDievJRX/RR63sASZSiGDn9/cc6qg9VAnvqb4O9pn3LIs1p0Z3KcYAqDIfNwkqGg5
	OvlGeBSS565PVmtmbhO8sbHG+vVA15GrGkmJqzgY57/OUXoZ4Nf+iNLXOi3H4vKwMpnyyBTI3VS
	ZKRXVYrbDvL7IMjJxfytA1uk6hOYS1F/4HiP9AdXvEualuL1kazuEZs9r2pd5FMWf1Ec3IMYy1Z
	eFg42YqT5oXU1iwvGBwKOADQXx7nkyW26RZKAZ3zOosCzUvvt68lodQ84flvPQUALpTtH+5KDA0
	zB8hSqFruRShx9AsbnR7h9O7XXkV1o/dcffOfVGcsCSLx6amWauif/MCX4oApY2OQAjAdG6O5No
	JcJd0s/YEUN0tQb19PksYN/u33Qxc5Vl2pcRI5iIRK3lLxpKznt8uu9vd3r36M6nWgMOX+bL9T9
	nRZEFXcKgMeRhhZ3SonjfgWUzfNYoRKx2+yATCx1DmwbcbjuHztZ4LuRbMiHAm8+VOGxtDNAEiN
	W77SsoGeITnP1phFn04FNQ6VV0HMJo=
X-Received: by 2002:a17:902:7615:b0:2ae:47b0:dc80 with SMTP id d9443c01a7336-2b5f9df6fc9mr269245635ad.11.1777307588432;
        Mon, 27 Apr 2026 09:33:08 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa174c3sm309346485ad.21.2026.04.27.09.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:33:08 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 28 Apr 2026 00:33:04 +0800
Subject: [PATCH] spi: axiado: replace usleep_range() with udelay() in IRQ
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-axiado-v1-1-cd767500af72@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL+P72kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyML3cSKzMSUfF2jJPNUMwNjM9NUy0QloOKCotS0zAqwQdGxtbUAO8K
 1G1gAAAA=
X-Change-ID: 20260428-axiado-2b7e60365e9a
To: Vladimir Moravcevic <vmoravcevic@axiado.com>, 
 Tzu-Hao Wei <twei@axiado.com>, Swark Yang <syang@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Mark Brown <broonie@kernel.org>, 
 Harshit Shah <hshah@axiado.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777307586; l=1029;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=8W6ejA4JywJSSKQL7Q25kMUHMTPo2Ypf1rOgcW6fZAM=;
 b=evbJ5bCAUbuUcCQyFS8QvVajCnmBYUG5ma1I9W/857WZuf/FziNv4+AYnXR8V9fsnELVLdqY6
 IGVWiI+OvOoBMcaRfQHvbp9q5ibD0wwzHWa++Qh8GbMwiuDKyEsN4CW
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_093309_722207_ECAEDAA3 
X-CRM114-Status: GOOD (  11.14  )
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

ax_spi_fill_tx_fifo() can be called from ax_spi_irq() which is a hard
irq handler. Replace usleep_range(10, 10) with udelay(10) in atomic
context.

Fixes: e75a6b00ad79 ("spi: axiado: Add driver for Axiado SPI DB controller")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-axiado.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-axiado.c b/drivers/spi/spi-axiado.c
index 9057a0a8df4a..649f149617ce 100644
--- a/drivers/spi/spi-axiado.c
+++ b/drivers/spi/spi-axiado.c
@@ -201,7 +201,7 @@ static void ax_spi_fill_tx_fifo(struct ax_spi *xspi)
 		 * then spi control did't work thoroughly, add one byte delay
 		 */
 		if (ax_spi_read(xspi, AX_SPI_IVR) & AX_SPI_IVR_TFOV)
-			usleep_range(10, 10);
+			udelay(10);
 		if (xspi->tx_buf)
 			ax_spi_write_b(xspi, AX_SPI_TXFIFO, *xspi->tx_buf++);
 		else

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260428-axiado-2b7e60365e9a

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


