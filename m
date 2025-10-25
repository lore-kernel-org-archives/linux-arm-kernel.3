Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBD5CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=; b=It7uxphB1PsFBrehjbcSVB++ZK
	Pxb+T5rJI4EgdwdibLYLa1etMXjpWG7vq1nzDNPyk0YljXbJy6Out4FKGzmK/aZZgcDqjagDIMkur
	PxSACLmdP5aGCMYPs9aYgjrnfMN+3DWlFiGy3QBr/8OAUQxnot0fcRqEJ/URpUPrVPu45rEmh8iaM
	AQ2XTvh/xCErOIj0k9knop2UUOqQF/f5LOj+igEzMFlzmEIcAOKoRapWQTYqTX7ZbgB2t9Z2NTZ6R
	sGGHIePhKxj5wTrr3bqUoFD1ggi8Bgki5ISQu1UqaWuruxl6SrQPg+qq6A5OJNfEb/xJddpnA67Ym
	gg8NFqJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChK2-0000000BYOq-0yG1;
	Sat, 25 Oct 2025 16:40:54 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vChJz-0000000BYNU-0hMg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Oct 2025 16:40:52 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4e88a1bbf5fso34502171cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Oct 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761410450; x=1762015250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=US9/rqVdLJthZRZXXj9AD4YLEyT6iLWFyJrktHe2MZvWE58nnt8wUZLRUJy3aYvITt
         dsoBjPx1PO5UUrm8z7llVCOaPoBKsnYI+VUCo98hkgor9UO89W+Ywd1TKDiV13oNm0im
         ar9AFyPCwNwk33yOPby7Z6fHzRntE8NQlT9Irveh35zEkDf9IzJ/4M3CXwQ3UKd4X5Aa
         2Nm9ylDnE7gkynm4zLD4ShRY/yWeg+RjVAEAHDyMo9zVwYEUgNUchNhFjMsPoJVsiAs+
         oYQ6eoLOcaT0+s4q/Zcsk+ftjiXlec80an/K8B9gNWwIeaAYAnyMcPU+W0oidmrC2fUk
         2+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761410450; x=1762015250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhEz+tkYwuCSnU6LNYxfD5DkxTKdrSyEg2dThddkEgo=;
        b=uYIBsv7fnzJaa222sptEh46cy5TLnNQztKl8nTLIc0mPYRoRdEF+msSDWoA/rqbjzz
         P6ITLrXTi/3zXHtC2OG5KeWAAF7NzyT57IXdQzB+LGILKRilAtyqKErWcPUoNageYkSx
         dGYmpoNwMSKpQYtiBMzRd01JTV83Q6tW8+7kUs8lOYE8WoGwmNspe7ML7bjyFqY9lffT
         Pb2jt575sxj5v1N+xjLbdxrNFYmd22fqpccTRPjtl/wrKZu6jjEJDLwPTpivFc7lz4q3
         mEzWdJagbdTEDp0s0F3w/Fu48OlJygYswU6BIRcbkIHx5gNKGP2Wqou4ChMpGvjhDefb
         ddVA==
X-Forwarded-Encrypted: i=1; AJvYcCXftPTKr5AfHmbf/7UcDFkRQot8UNCzpBpjxDQzQmyG/3gfKQWxGF2NzRVeaw5d3OLc9HILsqSHJNjXoLomCMU0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywys45Y5A2r2p8dfhGJ5ls3dnllTNYRpWm2yQYyywmDdQxiTZsG
	y0u7R3IT5lDxyJY53ln7E0gaBPyzVqJhRDeLfRKDZG8TygSF4z6X7wB6
X-Gm-Gg: ASbGnct3l65s6hz/Pry2KHPaXb+XeoKESTf+kTpQCQRMFywWUvsmhe4yVc60d/jBH0M
	PqJ4oblKnzykmlFbtS2Y3Srh+Uk9MAP9p1RCtxmlv5//0qMkkkp3/iPtCc/OL/jE8ZIkxpSTOf1
	HVzw+J6mjKp+FSCpMG/MpyKarOxRRvClB68QfsIwmSZAHvhFTzOgMZd9imsjYSKsxj61PD87IW6
	mME6lKEDCvTEvc4PUdhwvUE+1cjpEWOQFxcZzihYY/XmMShyxLHNzGyGf0pa2/qEWp2XXehmD0v
	P6HRJelAdc0q85LmU5C0UCsp/fCMNzpqeV4MfyMnUHnP9fK4dwM9IkCd+Sv3KyikrlWEwCzl14d
	+E6I6LsT1ZVgdpib/WYHouyNEmI/DUBXG1S1zIrZ+zi1K5ud8Q6SnV0zxqcFVpdAHLR+3wka8
X-Google-Smtp-Source: AGHT+IFg107k/tCYFMcohq67EzH90IUaPmb/gULgz0xOuwcBmv/ppnfnMODk2cLJXAhzPksQP0R0Mw==
X-Received: by 2002:a05:622a:153:b0:4e8:bae7:4d0a with SMTP id d75a77b69052e-4e8bae74e00mr318957881cf.51.1761410449893;
        Sat, 25 Oct 2025 09:40:49 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eba3860692sm15069131cf.30.2025.10.25.09.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 09:40:49 -0700 (PDT)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 10/21] i2c: nomadik: don't use GENMASK()
Date: Sat, 25 Oct 2025 12:40:09 -0400
Message-ID: <20251025164023.308884-11-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251025164023.308884-1-yury.norov@gmail.com>
References: <20251025164023.308884-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_094051_214406_2F6C44DB 
X-CRM114-Status: GOOD (  11.88  )
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


