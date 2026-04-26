Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42142FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Apr 2026 11:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=; b=jriidQjVefO1+FhtLkmoaSkkeO
	jvINkJoMcs7Nrpcs6Wo4PcvcbKNHNkeR66yvqSaiHef1uVvp86upK/HUq903I+gXWQs4EoXwmWTJu
	kBdzkJSsIe2TJx8c8Iop/5vlZFk8//f7ELIctNb+EDxDfaglR7+mxDLwnelx56JQvuBLB0faTTFN0
	mnN51jFYnfPjPB/YEv0yLXG9iAxbvKx2bn8WHfBuZNeFpiQtuxL4PxgzqXDF+5tJGtrxaAEPXlWSj
	9SVUpdGPKS1Kymox9p39YqsUW3NMOtJS3sISO0Gp2EPJY6vWWZavzHOmEwGKCf4Ob82FDR8isrNtO
	i8rpwXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4s-0000000FW1g-1FdO;
	Sun, 26 Apr 2026 11:55:10 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGy4p-0000000FVze-1yv2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Apr 2026 11:55:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43cfce3a195so5268550f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 04:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777204505; x=1777809305; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=bqJ/gHC5nFOZkYIWAlf+4VpAwnfjKbl3hEwG5h7Y1fA9XN2B7JlN160cr7gILYkpNw
         eOTDLjQ6MWhZmgj/VtsLHbHiGgnh3wz8NTFZYSmjPyH+7buYz97Q7d5x7EuSpQ+MEfeO
         I6eegRD7dnpHxNBdFsh+HSrnwK91vWuw5CBhJEn6ofTnVSPrVwmWCrqvKp3dhTVGLH8J
         M0Pw49WB0LSjaPOh2DXJG3KXlee93nDptPIc+f4lho6AMcYCEOfWv/hiz9i/aMDi98LF
         iRgIPbcyhfuU/mfSKYfmS/sh7F+2OYZsoDZ60ZTh7Pk5HIoRXDnv6Rzxp5n/XRJEHSBB
         SV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777204505; x=1777809305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkcOvOZZBBJ6rw+XBoAkJNNzNDgTfzBSBc4KLO3hr2I=;
        b=WIf9eaCGdQjKbitcF/gHMBnkSX168+WfM+A20duVDoMCWJKXSc+bh5RiZKKAUy6+9W
         wAaDZlunvUnsiTnzxDgzD5OXziR4xTm8tAtGKHhEPuE3I3hso1erfobqUbxwjMoB7MCz
         4aYv4MUQYElB4+xidLlPDt76aVNKMJIwZh1WdPizLuBzUA3b+j2IfpNJ/RlAXvgsK3g5
         OACQVNx3GAjRZhUlfXo9tBD9AA1WRiRGmI599AN5DFojqcEgoJJ0Ux9J35k3B162H8M9
         ohE/OJa7UL52X6WNhpawiXY6HHqTnipTFdoZJyGh4dGp2bC4g4PCHTVQ6mnXE4EE0/W/
         /6sQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sBbIhvIZ1MrpVi5oSPAgH3ZqkBdCejYncvZIxS2jQe+M4bokHlL4T9UNL5Rz98wZ2jai6foCIHNU6ujdAub5E@lists.infradead.org
X-Gm-Message-State: AOJu0YwU7WkCLBcoFWsrlE76KYts+EM5UX7q5qUcCEzzZvgtS5ZfWm3s
	Yn1/vxm0lFmB8La5lXcibOLcaUXNorV7v1BNv00upCObY7EC601Si0n7
X-Gm-Gg: AeBDievHm6DCSNfuMSOOeVOfLWGqUZo9TJkkuqSrGje9i7KMGJkdIGF/qOVYCHv1cv7
	AUlk+z+1iHQRhQHIe3C9L3pBbbUYuDWcSefEgmdZhdLUx+5H6LwIE/KjQqYWnYSVW4dAGm8wfOa
	f5VqQxZKCeUEi7ALU3bqyAsjwgR7+JgTXSpM4iDRtv3HpY33prAmmbImD0ntWgkIIcoWJSs01A+
	Ok2byn/xaBKrkU9IuO+GxxG7T1jKvzUTR1ATJ3fR08ef35Uztw4Z5MuLoKyIhP1opbrQpu5ZeEn
	QyamowyIv6/90N9R/nscrp/0ozrbMUFvBhHE2Xx0tLvdN1+C2oLih5Uic7IY9jD8b1idmii/8sX
	S6fvNL7sOLJGCq5Pa/2gB0Aa84n95JQ/X+RUkKG+zBsGorH8Yh1hO++1d5AJVnWk1r1Ii4uDoV6
	CzsvvT+5ZgcG6/fI9AxO2WSGFA0mMgp41ICFSDuQG8lco8Emx86Y4=
X-Received: by 2002:a05:600c:3006:b0:487:1108:48b8 with SMTP id 5b1f17b1804b1-488fb739f86mr308742125e9.2.1777204505424;
        Sun, 26 Apr 2026 04:55:05 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm424018575e9.0.2026.04.26.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:55:04 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Sun, 26 Apr 2026 14:54:17 +0300
Subject: [PATCH v6 4/6] amba/serial: amba-pl011: Bring back zx29 UART
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260426-send-v6-4-d49efa72bb09@gmail.com>
References: <20260426-send-v6-0-d49efa72bb09@gmail.com>
In-Reply-To: <20260426-send-v6-0-d49efa72bb09@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2247;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=OFELZprfvGMngJiiwTNQcz/opzneDKzuYgSzdRQRbGE=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp7fz+u/+qpPe53sgA9IGeQxT3jxCmJ4DtmSGvC
 U4HoXZLR8CJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCae38/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiLafQ//TFrg6fVGLeFet0jt8eE0RSlbETUAuhe
 Y1d5O5EVEObWTh1jBB8JPUT3ZMr9helrlQYwToexGoTQfpSWSh2y7cnmeHUOVgNmMTRNJAuUso/
 jrrVPSqGIcUqtxoBdnsvzSa90oTzQCm+JRHjGgcYAwdrCEnArO99rOMFt/YyqLEqpntXHuUBOsw
 EeCZQY1SXWS+c4h8fhIiiW6XE6XxCUD6hNk6MYFY3KFG9h5qTNy7pSt9aYtUFSnrmi8m3ZI5fAH
 jDuPQIyemgkEdEydS4g9gPCvjhQUcfRBC9hi/2ElHHk5D+QzEM2Jiqe3XgxYz4LmIZrTgDwB+89
 LLZeTrUrEwPHURqLvlqh1ryypR05fts94XcfLO6co10aJDrcPRtNciW+QtWkmQDAACHymkqkTFQ
 I22mqAZvxR9UwaIHeMv3ryypBbv/LFD/tUGxrP791tf/3gigCKCS1wh2niV0tTGg5Z5ZJ+tZFkg
 OMy+aMsWJJhXSQPKTGTvi2sREMqhUdyxim/FnY/x5Eobdm8l7n54KB7aywTfJW7iZjzEYnPjeGl
 XNH7zOkcpMKILqKmG/lpaiJunscs002+uMD0iNosFvzrKvY0nsvrzm1d3PPV6hj4t1LVlqLrfUK
 uzQ3rgUYa4CP/LgeP+54Wk0INmumy1gDlodGjGyuw2lAbqwrnNZM=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_045507_548919_6D46B162 
X-CRM114-Status: GOOD (  13.96  )
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
index 7f17d288c807..f24cc403d9e0 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -216,6 +216,38 @@ static struct vendor_data vendor_st = {
 	.get_fifosize		= get_fifosize_st,
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
@@ -3081,6 +3113,16 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
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


