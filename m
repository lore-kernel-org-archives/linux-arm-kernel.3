Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C314C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 07:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uMU3m5ar;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rzh8+wVY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=; b=uMU3m5arnsItls
	K6muYIVK5/K7uZFc/ywyiQblRltCYt7pZauBXTUtExFsIgM06wEhPPexUbhdVrBzJhnhUnZ2KQ/GB
	p8AWnp0OxcYNWHqFBiXynRGE0jiRineIP+sTpgP1ohCaW8bwxql0fNKVDuHq02w2T5RqZDszXke4x
	AkofDvzOA5ITM9RHdY2YeeKPe17bm97YDuZT6IupC89UDaQGj2slX5nYM7OI6Fz4hrTPSGhTY92Oc
	dqk/HAK7hhxRAOu9tjr8Fhs2DVP2B2ltiDmAgi9Sb9bv/feP9+ky4dwURweKTdVcvoPdKUv8IDGxY
	6uL38JBQ2zfG6vx2o/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9n5-0000000FlpY-2UcF;
	Fri, 23 Oct 2026 07:34:15 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9mr-0000000FlfI-406N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 07:34:03 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-82109f51565so219668a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740841; x=1793345641; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=;
        b=rzh8+wVYsfAR3mZC7enWi4n2+bb7Y8OnwR319H9fNa5Yau/4oUWwaEPvbwxzrw1bSZ
         IWUGeF6Md/3RTl2OJo5NlRybOHQxaKyBtikczsiIA7sQSb4CzhrRuD9VWzaP+Q4L2Ptk
         DOEZWuOooVzLRIGWLmbk1Y2q1W6cqw20+86soTM6X77h6g58Y+HexrQlxL/7VOvdBUVR
         HnFWW1d59cIXzTNyOaZAPJuyaaDMchhPlv3rs8sQ+gcz1mM7IgoChBKpCP9pGTpk/qiQ
         Xvk4XURznxQGExzu4v7/4JQdxz90WYowIM4LjYGDiEwgJrCP+XFEncxddPcqi6GD7KRQ
         KZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740841; x=1793345641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=;
        b=n+0DSou5Cizb6qv85xTQsUF+ixnda4I7rL3QZQNnTaoG26NXKBxj92YmwXZij+YLn9
         V2WlJtbtqbqt4QC/BJ2HGnISjToV8uLrHHOvYFRvuS7ZnSUkIUS+bVmpWy3leVSYnCEr
         HNE4yopD75iDLoLorJJdYkZMtYT+sUvJv9t2w79d7x5TQrsGxBa1Hti+zv+ZN6ftIaQ1
         sQDHsGFqjOnWb5PW+T+WdfOt0KWyhqGnuY6orjp9+/88jnkLoIxZEz+PRIpd9X2HtIwg
         OR3cIWteMGJtrQnZ/2ljj7tYsHCFm3LJQhxcgN4Hgx2/ChOoqvJppaof/w8UG3BPq11u
         ok4Q==
X-Forwarded-Encrypted: i=1; AKwUvByeupOgjDSHtOQWtJhY7+An84FDSK/D0vcd5ch/ECyjQu2+T9mw7MMjSY44wQeIJPy3Q4EXIfOiQwmroNkrAR4B@lists.infradead.org
X-Gm-Message-State: AFq9FYK2msmeLMn0BVNMaQwtpaG5jYApUZRfsnck8g12eINH4zSaMYmS
	FoUCWH2cUildJ/u2Zf/7QaOLA/IlvPjF2+0+I6meSnYDUlV8+khM/YysGMjcH4bH
X-Gm-Gg: AYBFou1i3Dl2/K7VOwg67QI62YVaZ8K3E2Hn1nNEbmB2lU7j9aoi9DWGgsxPWP3Ra/g
	f0Bm/93RBHmmKwsQRW31yRSfYFAy2QTwb3a0qlR4CYoHu/Ooi7I/+FDYxpsJuNw/8gt3euQ9o5a
	wF+Wj5xhq/zHJYy60pJTbTo7JYA3KDf8K6XNafSevyrYDKsB90DGYhmelfPRjrMKaSD6ADpHnmF
	ztaOk/w0qQiyZ9tjWnUj3FoEEr1L7G1YdCmZshzOU4RsdKWOAPjSVztjNhnFMo65q9tGfr47dxy
	e7wT4pRiCo7u0fCxRjuYWlT0A+D+aLKXv61FbTnASJYA0bA8OwIp9Pn71rxlKJiVG0WvGeSWW3V
	Ziiw+vN+vGKc+xYyKCMYbovL+Bk9GYJRnyiOji8FIdhchE7oTv55jnX9SzVOK8ryZ3wbVWkLSYc
	LnQJmzlLlq2ytvGdsdd+pbj+Lo2ChnBiel7jR+oUDc+HERzkYHJ5lYED9a1BMu77sHcSmD/LRS3
	/DkaRvr1/k/VinoWh/f9t2+w/8QuiWzs2ct1sp9oud0ztDMjY2K/aKPqZmPElG3a3YKJHsiUFBA
	BuSIE/GwlFkk3pmPz4XHeAgxarvreHFIzs4MLkhcWhvtWb2lzp9thk8/4abpvHSpZv1qhaWSc2T
	DK9UFmTTX1bPdK3UHc4EXfdKc+06qEnzTz+kbJsjFXSNZcTgGcTz4fjW988iaGlaJNUhgvM/2qm
	X3thg=
X-Received: by 2002:a05:6808:6d93:b0:4d6:90f3:74ad with SMTP id 5614622812f47-55be82da8c2mr808701b6e.45.1792740840785;
        Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:50 -0600
Subject: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_003402_058342_AFE88A70 
X-CRM114-Status: GOOD (  21.96  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.
DMA attachment also depends on a FIFO size being available during probe,
so these ports do not reach the existing 8250 DMA path.

Use a fixed port configuration for the H616 compatible, with a 256-byte
transmit load and the documented receive thresholds of 1, 64, 128 and 254
bytes. Select the quarter-full receive trigger by default.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port. The
8250 core installs its FIFO defaults during registration, after the probe's
FIFO-size test. Configure single-byte RX and TX bursts because the
peripheral request can correspond to just one character. The existing
startup path requests the firmware-described channels and falls back to
PIO when they are unavailable or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_dw.c   | 45 +++++++++++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_port.c |  8 +++++++
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..0f8c1b0b4a71 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -77,6 +77,7 @@ enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
 	UART_PORT_AIROHA_HS		= 125,
+	UART_PORT_DW_APB_256	= 126,
 };
 
 #define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..f03051740be0 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,9 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Use a fixed configuration instead of probing optional registers. */
+	unsigned int type;
+	unsigned int dma_maxburst;
 	unsigned int quirks;
 };
 
@@ -630,6 +633,18 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_port_fixed(struct uart_8250_port *up, unsigned int type)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = type;
+	p->flags |= UPF_FIXED_TYPE;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +780,21 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	if (data->pdata && data->pdata->type) {
+		dw8250_setup_port_fixed(up, data->pdata->type);
+		data->data.dma.rxconf.src_maxburst = data->pdata->dma_maxburst;
+		data->data.dma.txconf.dst_maxburst = data->pdata->dma_maxburst;
 		up->dma = &data->data.dma;
+	} else {
+		if (!data->skip_autocfg)
+			dw8250_setup_port(p);
+
+		/* If we have a valid fifosize, try hooking up DMA */
+		if (p->fifosize) {
+			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+			up->dma = &data->data.dma;
+		}
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -854,6 +876,14 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.type = UART_PORT_DW_APB_256,
+	/* A peripheral request can correspond to just one character. */
+	.dma_maxburst = 1,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -904,6 +934,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index db066a42f61d..e99d35880a68 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -335,6 +335,14 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 4},
 		.flags		= UART_CAP_FIFO,
 	},
+	[UART_PORT_DW_APB_256] = {
+		.name		= "DW APB UART 256",
+		.fifo_size	= 256,
+		.tx_loadsz	= 256,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01,
+		.rxtrig_bytes	= {1, 64, 128, 254},
+		.flags		= UART_CAP_FIFO | UART_CAP_NOTEMT,
+	},
 };
 
 /* Uart divisor latch read */

-- 
2.53.0


