Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B4BCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/pDXK1AfCX+Hni59vZriLv6LYkpG1vOii9jrnO1YhfI=; b=Mopd70aMlOx4FQZZgOuT5HihuM
	43s9MyuvJlgvT7lXVLPjqPIrIoaupeLZpQX1cEnjD0BkfZwzlUn7l50LWbV6PWAyrayRkVLwTpk24
	k8QSUP39OezYol9V+qkn6KTjsQJqMMiLbFaQqj43Hx8zIhogIyeVsr2u1WRocG2TLl2X5ns0aO3FE
	gOYiNyo57HD5QLv45yq1B9lCu0R7twoG+aPMhk7FK0sP9z7hdfX3YpLQtDS1bsqUuHCIjtzfPP0fX
	S2EZAPrZvvACIio90WgxfCTdRRpR8Okl2h+lMqLIgrxlItYYXKeZiDDNYuVvmEk9ZlvjfInnKamoP
	0DtgWdzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2HR-0000000FqbF-3bey;
	Thu, 06 Nov 2025 15:52:09 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH2HO-0000000Fqas-2g6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 15:52:07 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-640ef485673so191942a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 07:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762444324; x=1763049124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/pDXK1AfCX+Hni59vZriLv6LYkpG1vOii9jrnO1YhfI=;
        b=YFfTpsXeDccdVe7vp/DYao8nh6spJQDTNOG8yrZ5vkfdA7s9o/aG52x2fUpsuPzPNC
         RFMpR3E7xVfgkPzRB4g2OBccCOZ/DRHPKYbSrtyzft6x7PEfBnSMqpaJ4d3dPwDOc/TN
         oeotB0KdIrkarGWGRa5HgLmLtQdjqM1gqzDqgJZSKT/IDY8PwRHjiEdN0AFVj8OaENfc
         h7ByBm+eNTIazuPhTIai/BWbp7NG6gMxVonUCKLksNQzOgJ/VKv2aInotW1BlldUBoJO
         LQ61eF/Yyilh8tVCzZ5ZcG0Ioay5VRBGo1R0Tmqx8ezkRO2oHTis0btxWaHRdUC7Oiqy
         NNNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762444324; x=1763049124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pDXK1AfCX+Hni59vZriLv6LYkpG1vOii9jrnO1YhfI=;
        b=VbAJ/LaaRE2u2x5Af/VWDtQv4cCYmGM23PXaqvNs8lh1wH+QeABNT3f/qi57cys4ya
         HiM/Q72KVlZiumRjXlRFTDbDjLDbpQbs/x4hqK5Ed4Lm8K8c+2vqTYzyntIKsYR7a8O+
         rP5wNrPWkLfpHDHj+rvbyHzTefHsgDMqv5+uSDcS5tccaVbkkWFNXS/a+eUAXB+rTEwr
         ok5FnPTBe67uAK9V6RyHqt3D4rzD3zbjdPh9+Hj64etS6tYyds4UKArPUn734tYNaMzF
         d2pjLMIgZSQcMqOjJkptQ0G6XemZhijM6SpJPysCO88qml67p26QmL/YM0IskRURBqIh
         uafA==
X-Forwarded-Encrypted: i=1; AJvYcCUKIVTAMa60pLSTSmeUnJ1Yb9EkOtjJK/YqjbHEa8T0LaS7Nh1YCzaFOB/J35Kzm3JJIGFlxrP6/qYj/lkBTIiu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9E6/059cZSI3TIfC7mRgUeNGsZWyTm3EFVQSuXJabdAKyfGRN
	4yjViveGUv0xbNSxmJj9ckY2lJZDc18l8XmWZ73ehkSoPc/VFT4Yo1ZWoJ4n913lP74=
X-Gm-Gg: ASbGncs6gnymUJjwpMr1+akEe8pZsrxcjwxjqGBGWDQPtVqqIzHdbA6TR4gFZx+EvSa
	mWsnDIyZgcbawaITQ+5OE7Da1XQAKcKmjcZayV4Em7L6RiyKYfD+8f/+egUYHcNdQl8jf/qjEDj
	Ui1LDdbZUSjB5VPAtUXV9aZZj6TCVNANV1cpsBpbof3leoo9zfitVPBLin8/diNSdV0y9hOWY3+
	PCJIGTPomw8aM7AlACLjyZ/Vi/+1zEMqSQ8gQ6mcgTAi8eRA2MMYBJjnMie51dqcsIHbDVNsN2m
	ThM1bxndMrUyhePU+MVq00mzlIZatm0V/VYt/mOflgHbDvy+3Dx/eUf1p1OvvskAPbo+0AvR7om
	3Nf7MzPLM77IKF8Mt1rTA0TnYV63f0597YmT6Kam+b5GhNgOI9ax9CtRPkgDiqg7hfmpjnYXkus
	UGZGmssko5B5oRnNDWH81n3A==
X-Google-Smtp-Source: AGHT+IHUL9GfAK2sSZIr1pdLdb7oSwV39dHOCg6krXf3O+qK4JxFrJeVUTzcLdiPzK33dR3osdKvNA==
X-Received: by 2002:a05:6402:2683:b0:62f:3041:c7d4 with SMTP id 4fb4d7f45d1cf-64105b9fca9mr3869113a12.7.1762444324485;
        Thu, 06 Nov 2025 07:52:04 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f8575eesm2067292a12.22.2025.11.06.07.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 07:52:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] irqchip/irq-bcm7038-l1: Drop unused reg_mask_status() function
Date: Thu,  6 Nov 2025 16:52:01 +0100
Message-ID: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_075206_720556_5B316974 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

reg_mask_status() is not referenced anywhere leading to W=1 warning:

  irq-bcm7038-l1.c:85:28: error: unused function 'reg_mask_status' [-Werror,-Wunused-function]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/irqchip/irq-bcm7038-l1.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 821b288587ca..ea1446c0a09c 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -82,12 +82,6 @@ static inline unsigned int reg_status(struct bcm7038_l1_chip *intc,
 	return (0 * intc->n_words + word) * sizeof(u32);
 }
 
-static inline unsigned int reg_mask_status(struct bcm7038_l1_chip *intc,
-					   unsigned int word)
-{
-	return (1 * intc->n_words + word) * sizeof(u32);
-}
-
 static inline unsigned int reg_mask_set(struct bcm7038_l1_chip *intc,
 					unsigned int word)
 {
-- 
2.48.1


