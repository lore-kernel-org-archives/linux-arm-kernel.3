Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFACC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 02:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=20X0PhCRcRj6aFiBuS5mrmdrBSw8ydwTa695mVAjRJA=; b=dLe5tl5XJ9///ePTrKvSfV5Uof
	cWFgnjDpc5GUDoM0G5YZuCViY21z4XvQZH9FczMr+NQ3b5y8GtEaF3nCjNAaLOvMmD5OqBMTd7Zzk
	KyEGJsA3aJFkAx/dlUnJsoEkEFqJ3ZycdggtYE5lqoMVPXdhMDVgxEbTVSgMYaD/8RrVeTqyezu0C
	So6JU3rukmwJNgoGh4ruc5xRuE1FL2S/S5hCwbHyMI3I26fXxlijH9F9M+44+/1iai1+bbaHYwQbb
	8ugpee5B67fp0NJb6zUgtW3rdacVBbTGTHqL+adUq3/782+NBrpyl6L9PrzKHrkZT/pk9+41cbGWu
	LSkMtsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udJik-0000000Ep9Z-1Sd2;
	Sun, 20 Jul 2025 02:24:10 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udJgC-0000000Ep3s-1EdA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 02:21:33 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e8d9f9613d6so25429276.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Jul 2025 19:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752978091; x=1753582891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20X0PhCRcRj6aFiBuS5mrmdrBSw8ydwTa695mVAjRJA=;
        b=LFWrR9qF9JMhpAv2bVC6XqtG/5dqtDsxBOILfnJ2ZH6SGKQZZMK33oTxU6/+KLdb6Q
         uwegHz76LXgCZfsEuRT0HLCz+2Zfw4gmnl1wTKb6snxJwfjcLXAsff4igxU8VSDzPq5U
         crCq6wX01IM+HnCwU68Zjamt8m1+x0EutVlTb9oMYvMgkq1QexoJc5agcOz9zzoWpDOf
         +6yUDDHx6fFUMc8y+vgUAWlAgFBwPBuuohdphj8JgjUDLZ2qjoxVV/56bjmPP7qO5prF
         otW4YlasmyUTwXYS8MgutMUYXPg8bw41yRF/1nkDiYgDGoYRwzfndlV4Y7ScTzx+zHRx
         h3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752978091; x=1753582891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20X0PhCRcRj6aFiBuS5mrmdrBSw8ydwTa695mVAjRJA=;
        b=rhFNzPrOztjelB5MKbzwqqUxeIsDCVPGoOAkr+fS6Kn2Q74YLNUmjtUTagUHIDRyaw
         KQkACC0+uDh//RVvQO5EY9698qFzZRtw5ofj7HW3EtozReW9ey+TrcO/KWHau2zzCVpo
         MDkwgQro9J0YPcE2DdxC0IvNp4+t/nV+eNVvio/H2l0AZSjc0b8clp5x5WVT2PHvO5NE
         CUfBFmukT+I7XWS2m7tF+62xMMNY4OD8Skb1MD8btrxq6Fmb4ruzhMeH2/1Mo7hCMhQO
         cxVVq0Dca0CH9XeQY8JHA9JRMcOa51rX3CdeuPrw1UjecULvg5FwfSkFoa5D3T10p+Zz
         3dYw==
X-Forwarded-Encrypted: i=1; AJvYcCVEupQIEAuf2wAYsV0OOIRR9OI8aBwZQ0Nm9Hv4qY7ATOdJa3qyRbmMn9YZ6SCbdEtL2CrujQpQjB6FqrTsnzpV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq9y0oYLTOqYofCu/iX7YUnHFzBMrowWUBxHChsWxTZeBnZdAr
	oRVDqDE9w6l+HOhLAOqFNTzjq+fL6zvh0EKo7NEudXEcpL27g4ziwtFD
X-Gm-Gg: ASbGncux03wsp5EtmHET5FpykQIEOuOmDQ8bUZ0XVyw6nbL4tg8PxA4wTCMUNkwsbSX
	0QmrGJUu/bssYfwAlKOZFSs6BJvHmeiaCPcXMn+xHk3CtBAZBCBULDuQbu3itNt6d9g7FL4yFhc
	APikNTs4CZw8rbLh70gkhGEwQqOIBfOjfhVKUSkN0bzDw9mfP7O10jkAIE9sYlKwSTBB0JaxEjt
	URXEqHDIdDWZWtGZVe+66d//pxqbNq1n2oRMxtnmFYtZEjbv1j6NZHKQVY8f62v+lbJ95xv2jjK
	+VEcexPKJIDx6t3PxiTl5BsimFUAI22C3Jmuh6VeKqOywsjGBncATmYfn77cbhuPRWYKj+vqQ1o
	wfrh40zPVuAkhfPeB4Ast2I4x1Hm8TZWWl4Xjj5fYCrVka+8V8TaweeGgon+ctOVC+wum
X-Google-Smtp-Source: AGHT+IGQeBqt1JgArpYmqU9CC64rnAVFyPtgmr6zEcLd7fPQHv+Rm+/NeKHZqrBKHF8zawaTftE66g==
X-Received: by 2002:a05:690c:46ca:b0:70e:73ce:80de with SMTP id 00721157ae682-71835185a29mr205173357b3.25.1752978091242;
        Sat, 19 Jul 2025 19:21:31 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7195310a968sm11599877b3.2.2025.07.19.19.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 19:21:30 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>
Subject: [PATCH] ste_dma40: simplify d40_handle_interrupt()
Date: Sat, 19 Jul 2025 22:21:28 -0400
Message-ID: <20250720022129.437094-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_192132_339537_A23AAE37 
X-CRM114-Status: GOOD (  11.73  )
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

From: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Use for_each_set_bit() iterator and drop housekeeping code.

Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/dma/ste_dma40.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ste_dma40.c b/drivers/dma/ste_dma40.c
index d52e1685aed5..6cc76f935c7c 100644
--- a/drivers/dma/ste_dma40.c
+++ b/drivers/dma/ste_dma40.c
@@ -1664,7 +1664,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	int i;
 	u32 idx;
 	u32 row;
-	long chan = -1;
+	long chan;
 	struct d40_chan *d40c;
 	struct d40_base *base = data;
 	u32 *regs = base->regs_interrupt;
@@ -1677,15 +1677,7 @@ static irqreturn_t d40_handle_interrupt(int irq, void *data)
 	for (i = 0; i < il_size; i++)
 		regs[i] = readl(base->virtbase + il[i].src);
 
-	for (;;) {
-
-		chan = find_next_bit((unsigned long *)regs,
-				     BITS_PER_LONG * il_size, chan + 1);
-
-		/* No more set bits found? */
-		if (chan == BITS_PER_LONG * il_size)
-			break;
-
+	for_each_set_bit(chan, (unsigned long *)regs, BITS_PER_LONG * il_size) {
 		row = chan / BITS_PER_LONG;
 		idx = chan & (BITS_PER_LONG - 1);
 
-- 
2.43.0


