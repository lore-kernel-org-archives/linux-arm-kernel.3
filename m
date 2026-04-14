Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CAF9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 21:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=; b=inadtTir2dLLH1aXl9VwbTIOT/
	ix5fh1mhMT+byZ4dEL0SNAwagbSIvxhS64T2Xy64WyZQK0MNNKyqc//s2JSLFUjCe7JgiH2/QTVsn
	in9rETB9fheTaaEXNGLG7UL9AAdax9j6uZaisnelNSBLwMCBAe15dekBvqtF3zX+GBz/7V5b+Cp++
	7n8ildb79K0E1rsR5orWnyk/3cNNiZumNzaVRvicicbgBPTdWR4tlCkHjLvS+jPPrHDOHimMkn68N
	vc1SHKQHCdXc1YBe5EwIyRZuC/6XL7jUgz0LIlpeC6MSO0/VitpfpfvuK2YV9Ibmqv6E9Cmr+eLa+
	wZY0m1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3n-00000000DyB-45AF;
	Tue, 14 Apr 2026 21:12:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCl3j-00000000DuM-0sAj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 21:12:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d734223e4so1876790f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776201153; x=1776805953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=pRlOEghli79E7lDK/K7X01KGcOjFWpqiEkecvIB96LmwI/fpYHEx2CQ2o+uMAG0Mu/
         8KKwnkLPNMcmqIos+2559yn/9CsgxAZZ4niGeG1ObLzXaYb/lFJ6BoFQWPyJYwHd0ASI
         AQ/f3Pl5lh5cZsivy9aTnK/pyHR7vU8jDsajaoLyST80YjzCat9DUlZuiy7oweLXziup
         Ho7OoiX3sTmfx8mRFxC9/2XhmEqa+2sGDNIT0tZcGhOXgNgwsQTh5WXPBZipz8oQS7c8
         EUWZG5EQ80OcXtcbz+inJISImeSGrNuGxLCtzbM7iSkhQlOcQ4Eyhy38+HbLXJ65hYiD
         1NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776201153; x=1776805953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=fO3sXU5qQzS1y58C8LZgeYKnDJ4JjSNJ7OZCybGXKYWRb9PgNpNIF5wXV/lOHoNmGp
         kd9ag1fDnEk5qwCNeWmuaa6uYBO4w5UKR8fNZWyk1k45vm+Jm5p3UsHFWQZevMuJS8+5
         iW9Mh3K4wITO/bNa+unkkB/YJoo5dsnBisS7QDh5R0u7/lhBn9lawiQr6W5sEF7fRr3q
         zv7AItriLUwuWcfX3zrMlQraNfcm6arf7EmkXfmmZbei8x8ylj1dz94ja/19A67bDTOp
         458iJKIVEsiOyZw9pZGAFTpDlQg3sjG1eOQqfbnLor6F/4sE5to4I0N8QC4Nx6oUCMPk
         bKmQ==
X-Gm-Message-State: AOJu0YzBnke8qmUJtWGTEgcMLhjzle9k71TFdRZ4xfFmzOrgvKBmr7vK
	VInM1g3jSS68sEtSH8EkqG5Ccw4VbJgiqex9LgluN02zArDx1lWXh6BTj9XojhHY
X-Gm-Gg: AeBDies5qj+ExQHnt5NR1V3b94z6IgYsycZ9bPJLZTQyEn2wxx0ou7Yv/QCco4rkw/c
	E/hOGaFjbFWKUHmV5mrHhkc7GTmeq/YkYH0J1TAEn/6HEVpZ6of3ad1dpXZgU5Mk0UZ80KwLP/7
	3398VY9p+SwLU5uViWKy/tm2irQCN4omOecLIfUw6v3oJqqJ1WbmO6/BisAXUAkE+XRn1gTF2vS
	DBfWZmA25RI42ZioEWy7/GW6ui522p7UOo92au26WW5oEZaYQtRzurTGRGckHsG3goQoGKHFszL
	vizUpI4N1OFHe5aZlGaUx7KAY5ausadudj1xuOESiHb44uGekcS1bmoRG5a4cWK24jgsrXw2hAf
	oNtJPu0oIerx+qGIa46rX0eTLo1CxWpXdxq0xoFhNuTTTw9/kX7WZ3xq2afO9+fRtLnMUcZPIVN
	NQHA1qIA/2Qzsdgz4DlSXkh/u9cfa9zvkvKg4d4WdmNHk=
X-Received: by 2002:a05:6000:2386:b0:43e:aa88:f1a8 with SMTP id ffacd0b85a97d-43eaa88f29emr967679f8f.6.1776201153177;
        Tue, 14 Apr 2026 14:12:33 -0700 (PDT)
Received: from strix.doe.home ([197.250.100.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d73b44b3esm27652679f8f.13.2026.04.14.14.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:12:32 -0700 (PDT)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 6/8] ARM: zte: Bring back zx29 UART support
Date: Wed, 15 Apr 2026 00:12:13 +0300
Message-ID: <20260414211215.152850-7-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260414211215.152850-1-stefandoesinger@gmail.com>
References: <20260414211215.152850-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_141235_273769_304C3EF1 
X-CRM114-Status: GOOD (  14.74  )
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

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 drivers/tty/serial/amba-pl011.c | 37 +++++++++++++++++++++++++++++++++
 include/linux/amba/bus.h        |  6 ++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7f17d288c807..858a0edd3e3b 100644
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
@@ -3081,6 +3113,11 @@ static const struct amba_id pl011_ids[] = {
 		.mask	= 0x00ffffff,
 		.data	= &vendor_st,
 	},
+	{
+		.id	= AMBA_LINUX_ID(0x00, 0x1, 0xffe),
+		.mask	= 0x00ffffff,
+		.data	= &vendor_zte,
+	},
 	{ 0, 0 },
 };
 
diff --git a/include/linux/amba/bus.h b/include/linux/amba/bus.h
index 9946276aff73..854c962d70f5 100644
--- a/include/linux/amba/bus.h
+++ b/include/linux/amba/bus.h
@@ -103,8 +103,14 @@ enum amba_vendor {
 	AMBA_VENDOR_ST = 0x80,
 	AMBA_VENDOR_QCOM = 0x51,
 	AMBA_VENDOR_LSI = 0xb6,
+	AMBA_VENDOR_LINUX = 0xfe,	/* This value is not official */
 };
 
+/* This is used to generate pseudo-ID for AMBA device */
+#define AMBA_LINUX_ID(conf, rev, part) \
+	(((conf) & 0xff) << 24 | ((rev) & 0xf) << 20 | \
+	AMBA_VENDOR_LINUX << 12 | ((part) & 0xfff))
+
 extern const struct bus_type amba_bustype;
 
 #define to_amba_device(d)	container_of_const(d, struct amba_device, dev)
-- 
2.52.0


