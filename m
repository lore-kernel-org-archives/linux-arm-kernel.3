Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6DCCCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YfCV5alJTAHskvSEMsQJ4T0BY2JN7zrMWiro+wKilhs=; b=JO5hcRbUIRCGL1ye2Ivb82wu01
	feXG0lMZuDtGvrToT9JL7+2fIeU6BpGN5TkAV+zdCxDVEj4+51msXw7mM/X8rSG4wQ1y+1/jgPCEr
	zWLNeBnv8aYLZzNIASUJ2be6yNr/90f9SU/w2+8+wHacKMczm7iAeY9AFFFiIpap+PdSD875coUki
	6LAw61zQirNR7W7/8P5+yhkNmfOyu5YlcwX80FAv9KqkwLBHvB/7VEVUgCA0MwUY+OYmcrPAWw7+O
	MwhgI0aS0ZU8eop4/ayDqiy/WXPUNMmCRRTNXnHkge+FXSHkxrh80B5B49UdVZrnrXjKmlg/58nHY
	7yFIw+5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3rm-00000007kQo-3syB;
	Thu, 23 Oct 2025 22:33:06 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC3rj-00000007kPp-1iAo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 22:33:04 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-57a960fe78fso1900319e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 15:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761258781; x=1761863581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YfCV5alJTAHskvSEMsQJ4T0BY2JN7zrMWiro+wKilhs=;
        b=QDEIJzZ+ORbaEFCmFZLAcZ7wZ+6igBz7qPu6qn9puFfu9oeT67JLO7cJ5WQnHLnv9u
         eL9qh5FtKmGn938paCCsst1rqjW5mfkRlY+tmdeutuVTYssV1UvBMElHZFUws2Xmywrz
         04kBZJ4WUgeBIxYIgcMq0NVgy0kOtcv+6PuuhMOII2/v4k47yB7Vdcdat/6KQRSNmW7Q
         jssx3Sx75sswNB6/HLkPGvqRQZHA/1RR1XKzV2/tZ8PV744ODQ1VSs2x7BJ9bWgyyXeK
         X/BKKwtjlHwNE3P4d5AfAznH2pq9jgdKFIhgnmFNEf8tw6ML/d5f4xJkPduQ+PaNCw8h
         rjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761258781; x=1761863581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YfCV5alJTAHskvSEMsQJ4T0BY2JN7zrMWiro+wKilhs=;
        b=EbzEHNUBNSFxSoaJ3ChX9o/2369aAijrWVnN0A70cnrA2P7SQTrNtxSia2odi9fAB2
         uPenWH777IAmareg05gwJYqtH1YcE7ySGk2esiVA7EFnRsFuLG0SB05uYBtOxvzn5Q1q
         CCvzzQpZt2RIF4mA6NWj9pZXjbpW9rZZGgcsiJ+9FKmv3mNwWiFkpDv3A2lHDnAvo1RL
         J4+tMTuA1JNdFZlXgkMFAeqja2ce55YcGnoaoTG4UrxastMXR48WegGgepdZoMRL+yTy
         KxpqDCtaFQfTYL1Lz/YfKoYbOQLDOA44afUUq+lNwr7x7dwHVQg5iTwUl4sWbXBpoMMq
         BgSQ==
X-Gm-Message-State: AOJu0YxXBF5tkLS/fTE/r0nPfSsWU9DASS5lQMxw370A0guzj0AuEAeM
	jWTEFu4ogEiYdWARv94aArGM8ewOeUqTTBRKHTR4vB12oN4w1Jb10YKsjZ8sDG5Q/O0=
X-Gm-Gg: ASbGncsjmxoWkNI5cCSzb+UUt41LatWcmAi0na/happQbkFNHO7lMspt3t8iL1hIfHI
	4kGkv8IfzwulWzH/A0s3IZlVpZHoFfpjV5gVUfVQ2eO98CnIMO/ECuoyaRlq4qzc5ZHr29PGv2I
	VoCu3uog+iNLtaXmEQSt/D9sD/47H8tuQ+CiEeYRoyguEepBgdG80dKnqTnin5jxfcK+WVGRDcr
	vNVUB+hrXvKKYkct4HFDIHKb7xeGplDzOTnzh5/9BBpQgb4ebb5m6bnPMx5vWD5v6fODosv/z0/
	+1pxiPZptgyAOT3UMqAbpyEF9xv1RhSUD0fi5xq4GV3KlmGwGJTZJGYqae2dQGyQ0M9iIoNUlN8
	Nob/2y2AMF/R841sSHg9qug8++ah2ETIcHPhp6P/1z2nC1lDyaGw2yVU2p2c+H6xLS7VLYR0l00
	ma7Q==
X-Google-Smtp-Source: AGHT+IGL/agCFh5xcVpLpEm/hG8y8IfAB7SRELHSIgjuPn+ItQn5ngUOLCHahnegg/FAh3e1d7Srng==
X-Received: by 2002:a05:6512:230f:b0:592:f95c:4f92 with SMTP id 2adb3069b0e04-592fca59d83mr28871e87.29.1761258781296;
        Thu, 23 Oct 2025 15:33:01 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d16904sm1069156e87.75.2025.10.23.15.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 15:33:00 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Shivam Chaudhary <cvam0000@gmail.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: versatile: Fix typo in versatile.c
Date: Fri, 24 Oct 2025 00:32:58 +0200
Message-ID: <20251023223258.3181274-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_153303_631030_3CAFF940 
X-CRM114-Status: GOOD (  13.95  )
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

From: Shivam Chaudhary <cvam0000@gmail.com>

Corrected minor typo in versatile.c
- Fixed "documentaton" to "documentation"

Signed-off-by: Shivam Chaudhary <cvam0000@gmail.com>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: Please apply this patch directly.
---
 arch/arm/mach-versatile/versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatile/versatile.c
index 7ef03d0c224d..f0c80d4663ca 100644
--- a/arch/arm/mach-versatile/versatile.c
+++ b/arch/arm/mach-versatile/versatile.c
@@ -134,7 +134,7 @@ static void __init versatile_dt_pci_init(void)
 	val = readl(versatile_sys_base + VERSATILE_SYS_PCICTL_OFFSET);
 	if (val & 1) {
 		/*
-		 * Enable PCI accesses. Note that the documentaton is
+		 * Enable PCI accesses. Note that the documentation is
 		 * inconsistent whether or not this is needed, but the old
 		 * driver had it so we will keep it.
 		 */
-- 
2.51.0


