Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1062ED46BFB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 20:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=; b=kzDGehMY+XWM7gG1WACCDIQqYo
	R6qBfU16to9VIilOV/Z4xx0ASwXCv0fa25Pne3hT85R73NtVNcUYifHTCeR02zGrEYObIsbec1CRj
	3CchwhQ6qkLLsZ7EK51WIRKZ2x/kXBA04QXzDAmVK3K83c49SbZPPXMpsdL2VQteLrBRLDknuNqBZ
	jHmRfzYRDvqCZ1eNeQ3tUcEO292KFX9NcUSfCyWU+pgZG9zD+ysAr8mQOvtVu15R6NINoxCnfH8Bu
	zai68Ib58tk49OGnPBnTu8tHAbE6DFoGTEtCR7Lt10i6jhmqNVAz+KgO5JzesGgJEuVe7RfhiVj5H
	c6B9jZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCGJ-0000000GmRH-2EDs;
	Wed, 28 Jan 2026 20:35:39 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCFy-0000000GmEe-20SR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 20:35:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb5810d39so174248f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 12:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632517; x=1770237317; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=QQYsKCOG1YMtKl+fj52d9qSkKXGJ2QeFfiFxc5Yp3BcJwC2VQibMlzYpdtMLNlYisM
         NLW7AkrmNkiXUOPfWSU0Y0Qsfaq5H/5myfizCkMwkss34V7yV3QVJX6eqS5DXlrlBotX
         Gj316RT5XlnM1LSFm1HnKjQA7hBpJZ5h83XjwPfGd/T2maiqok6FGhi+CnoUNVLwU1sN
         P44N41karDBFL5zGb16mUep1b2lQ0wJzC6mCQL1Y0F6eIpyDR2xAQBNfOvBXXVncUqJa
         gY8whxsRhw9ZWqQv24PTDavHeWnXdS9SG9fLBS3DFYa77CXX2XlyI50g4lOsKHtkHCXU
         nTmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632517; x=1770237317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGGndKjUsdib5KMo11y7V39NR6PErPC0l6mWsxXuQFY=;
        b=ezJ6YTo8i4nWb3c5kBvXRh9C1oSz7ZjNMt8tV7hqNjX+ghVxjVENCodXVy4GVwvdoz
         aUQ5tLuOWwyxlgg+UrYXNhESuZJDRuwt5FB65oovGMejlTgqwX8Srvrz2gI83HGEL+ta
         zjbSZfzmA5O1UOHf6M4XXVfblvJhcvORN/7o+g8HZgQo0cgBZpfUyqLDwiHoSP7mIm42
         D8RFxs9689B6wvSuUeW8691NLP5mBc5DQ3HfI4bDEp491orO1jhfUrU2MjAGmWDBVsCx
         v4j2rZmg6r7SCNBa44PDpWaRv+XufQ2BAs+RytQFOGnx4fn9Tn/Md1rNHdo8vYB7V60E
         zcnw==
X-Gm-Message-State: AOJu0YwFF+Pny50n12Few5nSTTnt36Ke0LF1rvzo34Hqf7gYLL3St4H1
	6hkqEVDqoqgmae4UGEPP7Xaiyhb/+uoIY16lCjoXq8K+ukRSk4kDIGAMyICCokfo
X-Gm-Gg: AZuq6aLxowwaf5UBxHVca6r2zAd1BbhMuFSOzK/kxv8I2SHfSRpMlnAWYh5siIJdEWs
	WuYe1Vn3osAh6KuXfGUuCY0kmtQOqpDsOjBJSbXWXSWLpY9GTSSXfy3APnoeYJEdSCcCcxTwk7+
	gv0rWG34f78X8vvemIJN/1IO1lgkn+mUJ0wZ3LtiwnpXM1VCWcNBjlsVM7mJeptNoCeGFv0H+95
	wsIXIizUV/JvIujw7G+vZndcX8O1i3uvXBOc+6csUxTd0NRhPSl6VNGvoEM5H0kwogtUci2Ws8j
	Y+PAc+cbOWf83CzCmVT19IvDGChqsvCzcwOp843zfRCtWGQoM0xb4SY0i2wdVvtiwhwlUDXE7tm
	PXRbbkxhCPHU5V5TsxKwE5RWk14Bx4+ZmakKx4mfptQgKx61BvmGvMBezbmS8DKbnEbKgDld69M
	sbZZn7kJDqG8EH9eWaDTIfOmFI
X-Received: by 2002:a5d:5d13:0:b0:435:a7fa:24ae with SMTP id ffacd0b85a97d-435dd06f9d2mr8766859f8f.18.1769632516779;
        Wed, 28 Jan 2026 12:35:16 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:16 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 6/7] ARM: zte: Bring back ZX29 UART support.
Date: Wed, 28 Jan 2026 23:34:54 +0300
Message-ID: <20260128203455.38569-7-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_123522_695910_8745E297 
X-CRM114-Status: GOOD (  14.20  )
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


