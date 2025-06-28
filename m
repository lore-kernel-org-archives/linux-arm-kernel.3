Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82239C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 00:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=; b=AMAZ3+ETDsZlDv8gPOlM6fNQ0D
	q3soznlk49ssI9yzpBXD7aDxTgOkppOvMYHlXnM4s2+O1Vw3MaYI2grTidtdo+PsxqMCnB7Q0OSDY
	h/1TWZiwiOrRZaSm6SK3vr4hHZDVA2UR4RONCr9JkEbieWZqNo5eCY1rDLk+6PqPxOzk7b05x/hIZ
	cpT0l8Gx3JktMva+mCNpkxFl8phYuO8VhhZ7plZyn+kXMKGOZAzli9McpIn8KY1wWrwdsJE8HgvY1
	kOxc0b/DBrhnZkDa4CWchyOv2Acae1YjeTT4cljpxe00KzVp2XSYtpkhlFcHKtJexRBHNlVTnUb6w
	Ti9JD6Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJ41-0000000G3bw-08AE;
	Sat, 28 Jun 2025 00:05:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJ1h-0000000G3TV-22RG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 00:02:38 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a588da60dfso168818f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 17:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mandelbit.com; s=google; t=1751068954; x=1751673754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
        b=g90LuHCaPRQ74DpAz4PoHOmUJmmakJtf2S1kUZXOcCSX3ogrEKDvMrT9ErsZzF3AoT
         qoGUzZsw+81AePPi/MMKQOrfNE8j6wnh+M9sb2TiCzvJNZYyvEbaMLvffFhneylfNLUu
         h5HavfRj+nw+VhrCNUzrSnYxPYXTz4d7XPhJ7idW+BOAjhJXzUH/9C1xjpHzn2lWMXil
         fVQXjgHrUwCMjYvqnbe7fmnyifxD80Ee7HDboy74onyNxTPI6tL9I/5RVVwWyRnEY6Vn
         zMPyc+iQsOldHBJ7LwpzgExvyx58ppzh8DfaeFGJFEY8A542IscICHB8la674nrTzerr
         Gc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751068954; x=1751673754;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VzxBghiapRo0aX1nK0c+nhbUFh9iAun9Qlu08MsGo1c=;
        b=dAr54Jg7IWBIxKRzatoR+2HVSrM4LFA0A/ZtqIXXohJbtYzVqNTEvTTDSkupAITx5F
         L6qbO+NbcAya4Ka55pNoJgLyQ8eBMxSAaOJT1fZmiZw7zurRCE+2pgzMvHIEWlykpdKM
         sg1Od4KP/CRwZ6llIQ/uE5JQ3rJw3b7mjtl81STbQk1WrPDmJoeiv/DuM/XFfb2Kt0Jp
         5gjNPz821wcKGJFY9ZOpsMW3+SkziOv+vFdtSuThyJrK24V5i1J8qrRj/PvYD9yJapro
         YtCuCjiz2BjbVSbG0DYilhqK8Ge7kDeRcHe6e61L/SuqUUraO2214bKYi2x6XTLnw51u
         Hl/g==
X-Forwarded-Encrypted: i=1; AJvYcCWPsDV1LGWgjwIy5clK9wyTvGLwqinQT+PAyG4AcKj9dbsAmK8bLu0T5RXGlA3D6aqhBZOoRWJ2kUKvcfdIB16a@lists.infradead.org
X-Gm-Message-State: AOJu0YygJrkMtt1h0rKVGI+1FEujSKehJjRaVvRNvwj3RDnueajUEJ+j
	6QwRfsXxuw+ABf9HInBjDQQlBWF/KB4LwUZZtzesyG1yv78PPq21dSw/ow5hNrJ0KuA=
X-Gm-Gg: ASbGnctP+ofsdDUXPbJigP+oIlaQn3q45yNCyinm2sR/fU9hN/m4b9W6Z8WC3xzVnM4
	n4CtIzcBQ3/puYiXLk4XChdXusaUAjkgoPifjEeITBQXlBf9nNMwlFXN6Rhw0bardkx6yldpKMS
	DMEOsfnUCDNb8IHPzTz7gTRv6Ic97Nrh+d3hKdsKlcs2U2zfZmpL11SnNGaXHZuPfv3c+j1rMwc
	+QZWkDMci22hPh/Dlh32zklmHZWrIYdPmMZE/H0bqYsob5z5JnZMOvsG51MxpSupK8AEqkoUmhm
	OhITUK+rcqkjMffhAGLmNbliFPdWYbpYv+pTLBPUzvrG9N3bU3O2Ws6h4t68hCOo6B4x5Sl4dXa
	TKtxG8wKceamA
X-Google-Smtp-Source: AGHT+IECU//FZnUMFlsTYIRoyghzMGUC/zod9WnPCi6VKfNKXOA/f3HCNrR2SW3KH5umXabnco5DLg==
X-Received: by 2002:a05:6000:248a:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a8ff149554mr4015024f8f.46.1751068953621;
        Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
Received: from inifinity.homelan.mandelbit.com ([2001:67c:2fbc:1:9bca:2bf0:5e15:c50e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453835798acsm91685845e9.10.2025.06.27.17.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:02:33 -0700 (PDT)
From: Antonio Quartulli <antonio@mandelbit.com>
To: linux-spi@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Antonio Quartulli <antonio@mandelbit.com>
Subject: [PATCH] spi: stm32: fix NULL check on pointer-to-pointer variable
Date: Sat, 28 Jun 2025 02:02:27 +0200
Message-ID: <20250628000227.22895-1-antonio@mandelbit.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_170237_552345_9BBE9ECD 
X-CRM114-Status: GOOD (  13.03  )
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

In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
and rx_mdma_desc are passed as pointer-to-pointer arguments.

The goal is to pass back to the caller the value returned
by dmaengine_prep_slave_sg(), when it is not NULL.

However, the NULL check on the result is erroneously
performed without dereferencing the pointer.

Add the proper dereference operator to both checks.

Fixes: d17dd2f1d8a1 ("spi: stm32: use STM32 DMA with STM32 MDMA to enhance DDR use")
Addresses-Coverity-ID: 1644715 ("Null pointer dereferences (REVERSE_INULL)")
Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
---
 drivers/spi/spi-stm32.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index 3d20f09f1ae7..e9fa17e52fb0 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1529,7 +1529,7 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 					       DMA_PREP_INTERRUPT);
 	sg_free_table(&dma_sgt);
 
-	if (!rx_dma_desc)
+	if (!*rx_dma_desc)
 		return -EINVAL;
 
 	/* Prepare MDMA slave_sg transfer MEM_TO_MEM (SRAM>DDR) */
@@ -1563,8 +1563,8 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 						DMA_PREP_INTERRUPT);
 	sg_free_table(&mdma_sgt);
 
-	if (!rx_mdma_desc) {
-		rx_dma_desc = NULL;
+	if (!*rx_mdma_desc) {
+		*rx_dma_desc = NULL;
 		return -EINVAL;
 	}
 
-- 
2.49.0


