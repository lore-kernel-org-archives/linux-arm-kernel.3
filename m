Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62684CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fFHLfFog5+tJEOD6z3uXuJEqumNcdwRPWU/fZudPyJE=; b=fbmHOLO+E1Dh48zBMgN2jQwyyA
	uYcRKwnl4yQmaCS4kr5daID3f5udPzTqHfqpf2wghOxtMLoF2MgrcS5j1J5Qr5YBjrrYq2UkB9jjL
	abNSrf3BK/2YJ8xI5/or6wkdurERAGGr1kt3oMs0WeNu/H9UIsvzhJr+uHmxbXhQI2R5qA9wwk6Dz
	xX4d2Fd+sF2/3aO+7Sv9zYhbo+P7vRsgI2P2dMX3mYEubXAJOWvFv2GyCpnbwCL81aieT39C0isEW
	rUp7dULRE24Cs8+WoOdpc0A6uchaUnkOezMfQIpa4IfJ5rp++6BKMjUppH2wqXx2JQiLfrABcSxGi
	RYOKCSCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrr6-00000008Lww-3ZDw;
	Fri, 15 May 2026 12:41:28 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrr3-00000008Lvu-22eN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:41:27 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso104798405e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778848884; x=1779453684; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFHLfFog5+tJEOD6z3uXuJEqumNcdwRPWU/fZudPyJE=;
        b=ZckTnk9ndhWTkOS/RwDj66joGHNv1TvM1+5QhScKkLYh8CjCewFhKs9CselvzciAAo
         yr+BXnJJ7VE6sYlR0qZSpNaR4TdSv/3m5aemn+vzVqxmpWQ0gzlVAA6cekRwwiinfHd4
         5cV29U5jhlYMYsZRpPM6xFga2yXYe2AXZovkjI8FSDEbc5w5IvzROjCnPAuAvItZApC7
         TVhJqTBP0+uhbN4aVCvy8IhYd1IBlwZC8cJLrmiyKhfVbsPHs2IFQ8NCXJOiQnCaolvs
         z1NOmms0nCgAkmckAVYuhqj7sRepxqQKIO/VVUPF8ccv9XZ5CPupr4IKqlI48JafaG5C
         gmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778848884; x=1779453684;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fFHLfFog5+tJEOD6z3uXuJEqumNcdwRPWU/fZudPyJE=;
        b=Oq8rqJXizUNJbFEbtOSnJzR8Ag0aIxmpD0Sh62sT6LczQR2CJUU/TlMMx4nDUiXS9s
         SwgHj4D2GAp/ZuyrjEUPgG1d4lOVSIN3RgL2aILSTuKYjzSv1AIubnCGlZPWHZIoZMZg
         /1bSUtcR19UFr69KgbCwKa+sqMKsIYzB/WGUig2TybCWjNg8Di6/Q0tW8NS4GspV1iJt
         9LZEjOeofsACO1xCcwgk2WpeGp2LbJnNscR46dvUi2tpEzfQr8fQDJ5zB/GBvctaNFGb
         p2g0P6ynrJQ9BZE/f4LV6NVcWftnzFl2FM8INiUJ2LotV30sp46uKT0xrodhX9JNt3ll
         GpXg==
X-Gm-Message-State: AOJu0Yw6zMhpPLfq18hRft4U/9J3BkY+sHmRO1T4Pln2VPW10HyLNcZA
	Ro92Z8HULUqjnMqiqWIxjSyatIXP8KIS1+cWcKcvoTKXlv00EoqMepIUR5Sr2io235o=
X-Gm-Gg: Acq92OFHCWKtH4iKK5QaE+CMUvyG7xALldSRKiQHiRLJGE4ZIDXsZKzYZ3LSrr07LqZ
	G5u34uojDvJBrhLSVMxDwzjfe2DB2DC4r6yEVQTLLq6eCyvf5g8eIlhNwmL7pWsnY/wiLqptGIx
	cquLHVntIkhSCnlFOcrcAGNglagyeYBegrH6eq2xPMisQYvUpXPvs4P3yE2U0CwA5PO+XIOlqB5
	wW8TDEGhVswrqDIqkzjw8EL9wx5SX94klzvXJUhnMYrWeBsc2b+NHztdQ9W5Y3uZlG1cJdkQ4sq
	KgumJQNlmcmlMFEW4RM/pudv3xiXj2tx8LMF6w3XArVdxjJ1/mc38/JmvpnQcA+4dNSPIf47/BF
	8WaoTGzdkJCoufuMzlPJChrGwJRTkxs33Dsg5aZQK5J2UJ2nY7WM+NQGem2f2zw7QY1dHnf/35z
	w6DDNgamrSkz5rUg7NJaLQtniPWZs/UB0VJWg2fJYSzsRr0JmIuhMnF80XCL4NP54oiq8Qqauu/
	XRMY6i4eLGIA348cg==
X-Received: by 2002:a05:600c:a309:b0:486:fba7:b150 with SMTP id 5b1f17b1804b1-48fe61f20a7mr44622645e9.15.1778848883620;
        Fri, 15 May 2026 05:41:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm15154969f8f.35.2026.05.15.05.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:41:23 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 12:41:21 +0000
Subject: [PATCH] tty: serial: samsung: Remove redundant port lock
 acquisition in rx helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-samsung-tty-flow-control-deadlock-v1-1-93255edbc9bc@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHAUB2oC/x3NQQrCMBBA0auUWTvQCW0FryIuYjKpwZiRTKqW0
 rs3uHyb/zdQLpEVLt0GhT9Ro+QGOnXgHjbPjNE3g+nN1I80otqXLnnGWlcMSb7oJNciCT1bn8Q
 9kfxgJjrTPQwErfMuHOLv/7je9v0Am3DCl3MAAAA=
X-Change-ID: 20260515-samsung-tty-flow-control-deadlock-1d426171bf41
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Ben Dooks <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 john.ogness@linutronix.d, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, jyescas@google.com, kernel-team@android.com, 
 stable@vger.kernel.org, John Ogness <john.ogness@linutronix.de>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848883; l=2912;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=7TZ5vcA+GLdk6E7fGnm5v0lehUpocwQ4ZVzCnZFOHkU=;
 b=HSB610k4svdM7RKtaunGgLw3+2VSD01p4S4EygS9OUnKmnC03b2/KyWCaywVndUgAybnnLZpV
 Iy911zmNlEdB3AXvSJIjtzoXHQPpTK2gU4xSiY6C6ROJ3/zU5kryg5R
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_054125_564070_E700DD7D 
X-CRM114-Status: GOOD (  12.37  )
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

Sashiko identified a deadlock when the console flow is engaged [1].

When console flow control is enabled (UPF_CONS_FLOW),
s3c24xx_serial_stop_tx() calls s3c24xx_serial_rx_enable() and
s3c24xx_serial_start_tx() calls s3c24xx_serial_rx_disable().

The serial core framework invokes the .stop_tx() and .start_tx()
callbacks with the port->lock spinlock already held. Furthermore, all
internal driver paths that invoke stop_tx (such as the DMA TX
completion handler s3c24xx_serial_tx_dma_complete() or the PIO TX IRQ
handler s3c24xx_serial_tx_irq()) also acquire port->lock prior to
calling it. (Note that s3c24xx_serial_start_tx() is only invoked by the
serial core).

However, s3c24xx_serial_rx_enable() and s3c24xx_serial_rx_disable()
unconditionally attempt to acquire port->lock again using
uart_port_lock_irqsave(). Since spinlocks are not recursive, this
causes a deadlock on the same CPU when console flow control is engaged.

Remove the redundant lock acquisition from both rx helper functions.

Cc: stable@vger.kernel.org
Fixes: b497549a035c ("[ARM] S3C24XX: Split serial driver into core and per-cpu drivers")
Reported-by: John Ogness <john.ogness@linutronix.de>
Closes: https://sashiko.dev/#/patchset/20260506121606.5805-1-john.ogness%40linutronix.de [1]
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 2f94fc798cff..63d0232dffc2 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -245,12 +245,9 @@ static bool s3c24xx_serial_txempty_nofifo(const struct uart_port *port)
 static void s3c24xx_serial_rx_enable(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	unsigned long flags;
 	int count = 10000;
 	u32 ucon, ufcon;
 
-	uart_port_lock_irqsave(port, &flags);
-
 	while (--count && !s3c24xx_serial_txempty_nofifo(port))
 		udelay(100);
 
@@ -263,23 +260,18 @@ static void s3c24xx_serial_rx_enable(struct uart_port *port)
 	wr_regl(port, S3C2410_UCON, ucon);
 
 	ourport->rx_enabled = 1;
-	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_rx_disable(struct uart_port *port)
 {
 	struct s3c24xx_uart_port *ourport = to_ourport(port);
-	unsigned long flags;
 	u32 ucon;
 
-	uart_port_lock_irqsave(port, &flags);
-
 	ucon = rd_regl(port, S3C2410_UCON);
 	ucon &= ~S3C2410_UCON_RXIRQMODE;
 	wr_regl(port, S3C2410_UCON, ucon);
 
 	ourport->rx_enabled = 0;
-	uart_port_unlock_irqrestore(port, flags);
 }
 
 static void s3c24xx_serial_stop_tx(struct uart_port *port)

---
base-commit: 16e95bfb79b5d9d01dc7651d98caf3c2ace331cd
change-id: 20260515-samsung-tty-flow-control-deadlock-1d426171bf41

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


