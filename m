Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F7BCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=; b=yjkpp78vKuwODD+ah/HpiwXZzo
	v91XMR3Eo8RFEVu4/Q2OD1gVzoQERuTLmScz/VZ4cMf/pM9nz2lPt90LdLyDQi1wXaYyP9X5gu0a5
	xw/sHr16Zm9aqXzr8N8VRcXXZetiY0ftVSs42zMsHqqNFFE30e5+pAb/OkGcgmjk4Bn2EU8WEM01N
	JUOcExuFq+HI+OUGL4Xl+wcnfwBN0z0WBnio8NDpSJqF1pEviSnAYUU3QMFDMCUEFI4VLNz73kd3Z
	sqTaRO71Ln4OJrRQVH8Nkqm02LSnoEpezHXDfYcX1lvff07X9ZMHU8P9hq1e22rrVq1DrD2lKAGRv
	7lCrg+jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCk-0000000BWmY-24k7;
	Sat, 25 Oct 2025 16:33:22 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChCd-0000000BWje-44pC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:33:17 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-89ead335934so136238685a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761409995; x=1762014795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=S3IZ10zaDWoL/+9VE9+SRfV8eXOLteZNQ6Vnds/IRBE4txRf4KLpJOZC1AxkwHVfFM
         fDFQcJA7dBH0DlQzrWSWkoQmgPMuVGJXYHba1g5siMGVa8C9cO5TweiCEA4VHtEOE6pE
         25DOI7Nwb3k0focFK6hmqwoZ2xsG+/Yfxflfc2Ed/5rUo1lTZkj7b3yoL3Z6U5hmPDy0
         Gcvr5RxjUJ8SQp4UCDBsKq4t0H+GD5WubUu1MHc7JhCwn4e8RkW1PMCH+lHOSVDbnsp+
         HyYaz0c7qZ49LtcBa1JfhE+xxmU3lHImsIbPTvf5cJR4sgooIDka+bl1LmK/hiMNI8ic
         LFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761409995; x=1762014795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=F0FIwblNPe6s+E8nx/pTNYXIySukIP5Xqjfso6siiT9M/7dMEjThE6Q65qsMOAxiWR
         1Rsjb7UTvSVnbrkZEPWO6fPj34DJhC7iwlwOPA94gDv1l87IBpMr4p6Jj7Lds5a8ntuF
         iL8HOSqpAq0rEp0201W1UV5aUcy8s9rawQa97MWB+q2kVV0kbLds86ovSrLY6LgIPuRr
         8QyLDGxh6/uHx/1mgpbpR6j7tSPAYMxFLPyp3ayQnidHYyBerwNWEBnINMiCAKWMqcDq
         BApOjXA7krKuUw6GeUpPiCHwVJusf4BCJBMbj0iCIBwavrMnbYMS46P+p0CpRZdvhr6k
         DEAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8CtULUEaJqxIJ1FBJu+lKqXZub7S9Ao6lpdIKZAkL/7FAgpkflIwOL/JO9uHtskAxlVpMylCRGC0wcRI3+M8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw85PKVuAZsfutnd268Itc7IwTS+WkPODoevTdAU6Wz9uBRHITq
	SlBqvi0SLB/GpuVX3KYzHgeqht6YeMHn1dTaFf+YJrkE/gj/5z0MN4F3
X-Gm-Gg: ASbGncvA4U4ml+3dbsc1rqLP7Cu9ZY8ZWbMXrCc1H2pQibFoEAQragw7PiGWC2FleLr
	feGbbq15via16LVZZD/8napa9q3ByzixGdqnPBR6y/A1g8NJOT37/4V3Sag8UA5GudBf4leWw7y
	KFDrcY7EFpRMoEBAkphOqO76OSFgxarAf27w91sdQYZ3Kak7JN0EHrWXEtuyKFCiwyU2+4H1nFs
	Vja6kNGCCvPUuNosH+nKmVgVVDa7jJoYLaYt0JFk0ROI2wZNKFVLZNVDajDtGWz9uWrnjOeYh9X
	gQa6PshGFE8O6LDNd7pH8Fy3i/WO/NAKnphNZGqMw4qqu+sCAb97Xw0PVAiWMBKRd63AjrSyx6c
	yqOzFqdvXAedmd7YL+hKhKy8E0qPofF9M0EmJuLYbXDHQ/YjchOEZe6yv5UCRAce5Gz7yPgCskY
	GN3FGwxzo=
X-Google-Smtp-Source: AGHT+IFDvjrbgHR4c+YHa9gstK3rUAjMPa1JntDOFoEPIMpUO9JHPoIw8Cykn+I5mIOdA49QSX5xZw==
X-Received: by 2002:a05:620a:aa01:b0:8a1:e059:cea0 with SMTP id af79cd13be357-8a1e059d294mr36247085a.84.1761409994607;
        Sat, 25 Oct 2025 09:33:14 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254a297dsm174758885a.28.2025.10.25.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:33:13 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:32:52 -0400
Message-ID: <20251025163305.306787-3-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025162858.305236-1-yury.norov@gmail.com>
References: <20251025162858.305236-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_093316_023969_D2954C23 
X-CRM114-Status: GOOD (  11.98  )
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

GENMASK(high, low) notation is confusing. Switch to BITS() or FIRST_BITS()
where appropriate.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/all/CAHk-=whoOUsqPKb7OQwhQf9H_3=5sXGPJrDbfQfwLB3Bi13tcQ@mail.gmail.com/
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 44 ++++++++++++++++----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index 19b648fc094d..4c79ada5e1d4 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -53,9 +53,9 @@
 
 /* Control registers */
 #define I2C_CR_PE		BIT(0)		/* Peripheral Enable */
-#define I2C_CR_OM		GENMASK(2, 1)	/* Operating mode */
+#define I2C_CR_OM		BITS(1, 2)	/* Operating mode */
 #define I2C_CR_SAM		BIT(3)		/* Slave addressing mode */
-#define I2C_CR_SM		GENMASK(5, 4)	/* Speed mode */
+#define I2C_CR_SM		BITS(4, 5)	/* Speed mode */
 #define I2C_CR_SGCM		BIT(6)		/* Slave general call mode */
 #define I2C_CR_FTX		BIT(7)		/* Flush Transmit */
 #define I2C_CR_FRX		BIT(8)		/* Flush Receive */
@@ -63,31 +63,31 @@
 #define I2C_CR_DMA_RX_EN	BIT(10)		/* DMA Rx Enable */
 #define I2C_CR_DMA_SLE		BIT(11)		/* DMA sync. logic enable */
 #define I2C_CR_LM		BIT(12)		/* Loopback mode */
-#define I2C_CR_FON		GENMASK(14, 13)	/* Filtering on */
-#define I2C_CR_FS		GENMASK(16, 15)	/* Force stop enable */
+#define I2C_CR_FON		BITS(13, 14)	/* Filtering on */
+#define I2C_CR_FS		BITS(15, 16)	/* Force stop enable */
 
 /* Slave control register (SCR) */
-#define I2C_SCR_SLSU		GENMASK(31, 16)	/* Slave data setup time */
+#define I2C_SCR_SLSU		BITS(16, 31)	/* Slave data setup time */
 
 /* Master controller (MCR) register */
 #define I2C_MCR_OP		BIT(0)		/* Operation */
-#define I2C_MCR_A7		GENMASK(7, 1)	/* 7-bit address */
-#define I2C_MCR_EA10		GENMASK(10, 8)	/* 10-bit Extended address */
+#define I2C_MCR_A7		BITS(1, 7)	/* 7-bit address */
+#define I2C_MCR_EA10		BITS(8, 10)	/* 10-bit Extended address */
 #define I2C_MCR_SB		BIT(11)		/* Extended address */
-#define I2C_MCR_AM		GENMASK(13, 12)	/* Address type */
+#define I2C_MCR_AM		BITS(12, 13)	/* Address type */
 #define I2C_MCR_STOP		BIT(14)		/* Stop condition */
-#define I2C_MCR_LENGTH		GENMASK(25, 15)	/* Transaction length */
+#define I2C_MCR_LENGTH		BITS(15, 25)	/* Transaction length */
 
 /* Status register (SR) */
-#define I2C_SR_OP		GENMASK(1, 0)	/* Operation */
-#define I2C_SR_STATUS		GENMASK(3, 2)	/* controller status */
-#define I2C_SR_CAUSE		GENMASK(6, 4)	/* Abort cause */
-#define I2C_SR_TYPE		GENMASK(8, 7)	/* Receive type */
-#define I2C_SR_LENGTH		GENMASK(19, 9)	/* Transfer length */
+#define I2C_SR_OP		BITS(0, 1)	/* Operation */
+#define I2C_SR_STATUS		BITS(2, 3)	/* controller status */
+#define I2C_SR_CAUSE		BITS(4, 6)	/* Abort cause */
+#define I2C_SR_TYPE		BITS(7, 8)	/* Receive type */
+#define I2C_SR_LENGTH		BITS(9, 19)	/* Transfer length */
 
 /* Baud-rate counter register (BRCR) */
-#define I2C_BRCR_BRCNT1		GENMASK(31, 16)	/* Baud-rate counter 1 */
-#define I2C_BRCR_BRCNT2		GENMASK(15, 0)	/* Baud-rate counter 2 */
+#define I2C_BRCR_BRCNT2		FIRST_BITS(16)	/* Baud-rate counter 2 */
+#define I2C_BRCR_BRCNT1		BITS(16, 31)	/* Baud-rate counter 1 */
 
 /* Interrupt mask set/clear (IMSCR) bits */
 #define I2C_IT_TXFE		BIT(0)
@@ -339,7 +339,7 @@ static int init_hw(struct nmk_i2c_dev *priv)
 #define DEFAULT_I2C_REG_CR	(FIELD_PREP(I2C_CR_OM, I2C_OM_MASTER) | I2C_CR_PE)
 
 /* grab top three bits from extended I2C addresses */
-#define ADR_3MSB_BITS		GENMASK(9, 7)
+#define ADR_3MSB_BITS		BITS(7, 9)
 
 /**
  * load_i2c_mcr_reg() - load the MCR register
@@ -1028,11 +1028,11 @@ static void nmk_i2c_of_probe(struct device_node *np,
 }
 
 static const unsigned int nmk_i2c_eyeq5_masks[] = {
-	GENMASK(5, 4),
-	GENMASK(7, 6),
-	GENMASK(9, 8),
-	GENMASK(11, 10),
-	GENMASK(13, 12),
+	BITS(4, 5),
+	BITS(6, 7),
+	BITS(8, 9),
+	BITS(10, 11),
+	BITS(12, 13),
 };
 
 static int nmk_i2c_eyeq5_probe(struct nmk_i2c_dev *priv)
-- 
2.43.0


