Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480C0CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ub44tcHR3rZ07I0PG7j4tYlcseLLTdK0dv8xseUhhuM=; b=t+oJeMU32/Zno2oeiYTm5VdIGq
	JIJ0NknF+yonlgtRRX+3Md56hAioXjllraYJaOuKCDwjo/vrzVKxMid1ZwwFzQbsTLb7y7hDrkRS0
	BlX4EpXk5WGsKZuPnasqryV3nashJd5FRecof/Ip9XISdXKTMa5Yo7Jdw8ZZcwEOkmgwo1um53wR6
	MXTbWgFf0HN+KwZCC8YIZAjCrb2yljukVmDtf9WwJKoImzoeQ8l0UWMXLe+RYQnXrTUlobRG7D9B2
	U3pG1qDfnR5d/s9mQEXHIwoNTg9QIGA9ZTvWgYp5VoWQqTcgCnD/uvHtN5bN/pADi/jWPkYTIGKfW
	Eke8wSRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHEW-00000003q5N-1zvg;
	Wed, 13 May 2026 21:35:12 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHET-00000003q1j-0Dfx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:35:10 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso78185825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778708107; x=1779312907; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ub44tcHR3rZ07I0PG7j4tYlcseLLTdK0dv8xseUhhuM=;
        b=pKJyha2+gl9RKKJ8to90na7TNAUkjgrCRsPRORcBp8xgCca2Erh+sF5EX32b3R4y6L
         Yz/cq026gQepd4KRM1Rf5XKTMZyAaNVpCuwWPmVOXumTTCafFIlxQP3v27Z6hEYDvsH9
         /XlNnLRxLW5fl2VXt7thGWdfk5zvfNnVcAumAb1TELo1ZTfZIiHkTbPVSJ+Fn2bUEoHC
         jTX9pViifO/YToYZPeWwgUysL33KxvWjhZePSqdC+A5nk9N+XKGN+XOXvV2UBS4/aHBO
         SAxGHo0Ij2JtJ5x9x78feh79z7a+olezPYaG66RSDNsKwdou9m7H+S1e3KCOE8AVzjMF
         G12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778708107; x=1779312907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ub44tcHR3rZ07I0PG7j4tYlcseLLTdK0dv8xseUhhuM=;
        b=RM8qVDjymvf1/kEgDbutEXF53s2OJsu+6ZgKBOrs2IZG3KVBHMNR9XIQczAiTscevJ
         LGGtXJBCiPa/tHrqpugRBv3CxN+iKcrTXDSk8WTHJLzbWIxOtXb8fus8QgSpxWaU7mHQ
         B5aIu8MNPzeaYQFuemEPHZaTJKTH524tRmCCXkGa5nGsSoFlmHafYa0JkCK9QuguJFaH
         Y1ZqKOv6TG/VYcol3orEgrIZOd1lacfY2Is6s0Ocm1EXIAdg+1eHBLa7MOxhr5dESms3
         MkNePgjeXBa8deGTjZXbp+lJ6RO/wdr7z/w+ERMS0qyVVxHiujtsghNIhG9pvDTeWNlk
         aULw==
X-Gm-Message-State: AOJu0Yz67uHF4r2emm6r9pZasvRQj80sRQJXzyLVWIhsPPYeobb30KWh
	eMO89nmTxxvGt5uYv20jGQ3dw4JkTLyb1pb5UmMHG8NVVzOovVfkFc0W
X-Gm-Gg: Acq92OHFo7VPq4vzomBieTIZs8+fnp62Y0XUTZkCrrhPB4+DIacpTrF0J+7+WAcWJKl
	KsMGRFawx2BIkiITbj+f6l+jCEiuUS6EoxWH3dYgkgDbNc3ZqoKuIBmM13Jdpw+eJ+/vYNtderQ
	i8+osUKYTgmsRuACrQeKlm10pDSJhoQvr60DXSjSyn+pMWcZ+7TdfxFbezrH/P2fhaW3Kt+e595
	/iRE4xdBMTB9JHF6MNVqD2xNh7ZhXpwFZ5610/IXSmkZ+zs0eEnYHY1eNOHtlLCz2iyq7M7IYBM
	2XzT5S/ZoyEHYXvrE+9uFQQ3qfuiF7piWEviCqldF+Nd86UDQoLyF3DvV71f4qI/wvyYzv0QHO/
	T1oyGWjQx2lb7GovsErhQVV9rXpsGa66nGV5ea6qW6b2G3LXDWICj948zfVrLvnhxUS57ZNDZOB
	AvOe2POZRjwL3UguDIR7bkWMzeo1dwMRAiqHn962dEk3g=
X-Received: by 2002:a05:600c:1d09:b0:48f:99a9:bbd6 with SMTP id 5b1f17b1804b1-48fce9f74f6mr69685145e9.24.1778708107012;
        Wed, 13 May 2026 14:35:07 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fdb1fee9csm2553055e9.0.2026.05.13.14.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:35:06 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Thu, 14 May 2026 00:34:57 +0300
Subject: [PATCH 2/2] amba/serial: amba-pl011: Bring back zx29 UART support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-zx29uart-v1-2-68470ecc3977@gmail.com>
References: <20260514-zx29uart-v1-0-68470ecc3977@gmail.com>
In-Reply-To: <20260514-zx29uart-v1-0-68470ecc3977@gmail.com>
To: Russell King <linux@armlinux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2259;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=6jLv9uRwNNN8SJgSF9nQymP0EEzhFiRyXMtCm0W4pdQ=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBqBO6DGgjg1pmMCmXfe0b2mXxO2Y8S1PUj7OB1T
 EVseGuTDNaJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCagTugxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJhGw//URVWivsSPit9lucIR3mmnK9TcanFuu5
 elxMLlXanP9eg8sPaRKspxh5/x2PAyYZBnQH4z+enLCz5T4Y7ITkrjVSEucTIqqTYtEmiChhuLH
 DbjpjLfGOnn5/Ew+9PISZVxhkXYejmQArMUtMrXodpadKU8RmHCnYGtwea4fmBaBNdPh1drJ4dN
 pQWSsCaoK6G1kdXUmvexrmeseetSKwb//WgWwU6Dgurzmr1J5H3VLWt4AMOz41nEgWTiFvUKN3l
 VcJ26w5v8CTTzkC6tLatNo7B2l/UwL8SZLKXKQ64Fo5SAsV5TuFzcE5mG1IxzkeOf+tyYlaC0PF
 WsEwkWXsJz6pgi9++ozgbFWXhYkyhbOuIrrSPCZeGNk3lCdEF9N8BBsRlE58cEWnYXTgrEF8w+I
 iv/VfaNCP66C+7aYg+0Q0te20+5yit8tBfz6Z3LM3hzFvNGFi/1nXlUDHDXxkYWmpjS6LgZ8fuW
 SOMB3jIpWpRw3yv/zin/0Q6jigrzTqb5F8vKsfbSLfxP2DqhtjSLv62LP69vAZ1e5vy/E0x7/bS
 8PFyBXCTlj32UrFu6lViT+ZvodU4bSBYIep0pLMP8EVJqOa76sdjCXbwMFE42O0ZJMFaTnHT5Xo
 rna3J9r0ar6T8aOGAHs3J7p1A4bbDNHCCq6oTH7EhQbj2w8Ft1io=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_143509_149632_C9FD7322 
X-CRM114-Status: GOOD (  13.45  )
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

This is based on code removed in commit 89d4f98ae90d ("ARM: remove zte
zx platform"). I did not bring back the zx29-uart .compatible as the
arm,primecell-periphid does the job.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---

Changes since v4:
Use ZTE's JEDEC ID instead of 0xfe for the DT-Provided AMBA ID.
---
 drivers/tty/serial/amba-pl011.c | 42 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 028e37ad8d79..8ed91e1da22b 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -240,6 +240,38 @@ static struct vendor_data vendor_nvidia = {
 	.get_fifosize		= get_fifosize_nvidia,
 };
 
+static const u16 pl011_zte_offsets[REG_ARRAY_SIZE] = {
+	[REG_DR] = ZX_UART011_DR,
+	[REG_FR] = ZX_UART011_FR,
+	[REG_LCRH_RX] = ZX_UART011_LCRH,
+	[REG_LCRH_TX] = ZX_UART011_LCRH,
+	[REG_IBRD] = ZX_UART011_IBRD,
+	[REG_FBRD] = ZX_UART011_FBRD,
+	[REG_CR] = ZX_UART011_CR,
+	[REG_IFLS] = ZX_UART011_IFLS,
+	[REG_IMSC] = ZX_UART011_IMSC,
+	[REG_RIS] = ZX_UART011_RIS,
+	[REG_MIS] = ZX_UART011_MIS,
+	[REG_ICR] = ZX_UART011_ICR,
+	[REG_DMACR] = ZX_UART011_DMACR,
+};
+
+static unsigned int get_fifosize_zte(struct amba_device *dev)
+{
+	return 16;
+}
+
+static struct vendor_data vendor_zte = {
+	.reg_offset		= pl011_zte_offsets,
+	.access_32b		= true,
+	.ifls			= UART011_IFLS_RX4_8 | UART011_IFLS_TX4_8,
+	.fr_busy		= ZX_UART01x_FR_BUSY,
+	.fr_dsr			= ZX_UART01x_FR_DSR,
+	.fr_cts			= ZX_UART01x_FR_CTS,
+	.fr_ri			= ZX_UART011_FR_RI,
+	.get_fifosize		= get_fifosize_zte,
+};
+
 /* Deals with DMA transactions */
 
 struct pl011_dmabuf {
@@ -3180,6 +3212,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x000fffff,
 		.data	= &vendor_nvidia,
 	},
+	{
+		/* This is an invented ID. The actual hardware that contains
+		 * these ZTE UARTs (zx29 boards) has no AMBA PIDs stored. ZTE
+		 * JEDEC ID (ignoring banks) and the "011" part number as used
+		 * by ARM.
+		 */
+		.id	= 0x0008c011,
+		.mask	= 0x000fffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 

-- 
2.53.0


