Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A436AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WS/LG8NLHrxUYbXTyAgZN6AxbMxAGqMIBf9Cy5n0BGk=; b=qeQuiBsSU5anOP/Q/ZqafP4Pfl
	RZgQLgrKPezt9FQkS8aC9GviLwjqKGM+fA1czapuwVlTSzeB6dC7yAM7Dqugcr6KD90EDBMVc7gas
	qbN1eCivyhrnzcZ+cRIOvb2pj+PIJ7a8Dq9Vk5yFX7nIGLEDTe3DpUvEBLEXaYm9ci3lhHbZMx76v
	tBEsXqNTbE0JEQHtn4qFZydQYyaIplbya49ue2E2s2oCalqnEOSgcWwcPjCl85z+G7GBZ4WUzbYcp
	Djj2aroZ3IwJmzcKf7uPZsPEko2L48h8nteywXoJL+iKUg9HCAU5fOYUCDTZB4BDVgcWz17eBZc0V
	FBFpH5rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgEm-0000000Cg4e-3bEr;
	Tue, 14 Jul 2026 16:44:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgEk-0000000Cg4E-262Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:44:03 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493c733f15aso41173945e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 09:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047440; x=1784652240; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WS/LG8NLHrxUYbXTyAgZN6AxbMxAGqMIBf9Cy5n0BGk=;
        b=i2kDuK+Y893GrHEuXgMQEEzbCL0HBTc1FcprsS6kdu2K2BeeqB6zQYb5JaWvoG+SWQ
         ECJQFmEq916qut6mEueqzewrUeNEZD+FwRYTdSuMT23X094ugFl9bCfNwKKiS/X7CKOE
         kMDbth3MUddkLkBhKKkueKUS3YDJcM6eqFy1EIzjrWk+OgpO1RaMiKKeWTDSRkhD03fL
         FW8Eo7KwRPeSLgY/I5yHqSYicv/GAWBmPPaYyKbQlehg9qZOrXm36pKP7E/Mm1/t/SIG
         NL6SkMmxjCSJKMX2KaC75mGGJU85BZXtS8qJVrQhzEOA+AXlV9zqyB8xB4WXEZwqEtrD
         n4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047440; x=1784652240;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WS/LG8NLHrxUYbXTyAgZN6AxbMxAGqMIBf9Cy5n0BGk=;
        b=kMmpSO5ekPC6uCSHOdzYp/Txa7l6gfgT6fpnb51yfoS6uPfJE2UEe4Pf1IySsQY/Yq
         XA6QaGXhZZ0yfOffz2kzl7SNXwMSQ4GrOM7+AjD5+qQtap7+NoEeFIUNM1cpFYNwvqr1
         OaZ4LvZ5qQ51OONx60FmqZNtv3Q4qMWGeVjDsJUXGsoo9SHRjspULL1UF8nZUpVCHDoa
         KRM+zAG3HkSnG9XaUJYkT5e/5GDshqsJyt5WprDz+EbJgRKWMG4n59JORR1vGYGPlXas
         mAQztq0coKFeT9H3152em4ZujnKx1MHyJN9EK3v5JLkGh/yCUZuIX3dPh3B6k4AypHc2
         GgLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPHwlM6sWMk8h2IgPTS3MCWu6zvvVdgrWq3mf+VTdNvX434ZbRu6Bi9lnqvt5y1Ny5DSVVfZP2YcE4Yxd6P+K4@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0TXld29nWZ+vw1Nm+SJ4HuPXz2X40EXv6lu21je8c+KEE7wT
	9dCPh6dmkBO4XNNcxwrZ9zlyTU6iKetP3jfZB2NCcFwxZ2RZbXUZrfW1
X-Gm-Gg: AfdE7cmDgniqCoFU8TXVmPd2YrZKuWGP3nHA2/7zx/sjG2p8iNAtwl8qymb/3cnEY4p
	ua/Rsu40iFuBWGp8u4A1FIjtkyojlAZx4K8Dc4+6X6hWZS785cBtNla8wL9GRwn1hhiHmtry1Aq
	VPYd51zTpHks8HbeqvLBzHPuxs0OtqzxfCk+HLVNUL8gxcSWf2/Et9LqtiDDJdNVL/gmKTVPvPX
	5C4T0W2J4aSOfEifDQOlX+bsB7YPhfMYQrvsBpQmZjBAnDKvPYMZwr8w0GlvZJCEXgBearKCZUV
	6/sT9bDW7AHQx7KrCSe7WQT1w8H/ntiQ3MfZWmacThO1+xp/8BVHbuW/JM1KtUMWcfaxM1gavjZ
	HIoM4/wmI2PXHcDSsVpuIQBWjeoPC4nSUz7/3ECFR7z1siIQHcYNPy4z61ZjXTMTIcyM0BOOk0Z
	BikK1guJZ4uaKTx/rBofLSsw==
X-Received: by 2002:a05:600c:4754:b0:494:ca0e:880a with SMTP id 5b1f17b1804b1-495389d2ba4mr34447785e9.12.1784047440059;
        Tue, 14 Jul 2026 09:44:00 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a2f951asm92705685e9.14.2026.07.14.09.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:43:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-spi@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] spi: bcm2835: make read-only const array pinctrl_compats static
Date: Tue, 14 Jul 2026 17:42:15 +0100
Message-ID: <20260714164215.183809-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_094402_567863_C003163F 
X-CRM114-Status: GOOD (  12.75  )
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

Don't populate the read-only const array pinctrl_compats on the stack
at run time, instead make it static const char * const

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/spi/spi-bcm2835.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-bcm2835.c b/drivers/spi/spi-bcm2835.c
index ff94482fefcc..3d5255d75ff2 100644
--- a/drivers/spi/spi-bcm2835.c
+++ b/drivers/spi/spi-bcm2835.c
@@ -1226,7 +1226,7 @@ static int bcm2835_spi_setup(struct spi_device *spi)
 	struct bcm2835_spi *bs = spi_controller_get_devdata(ctlr);
 	struct bcm2835_spidev *target = spi_get_ctldata(spi);
 	struct gpiod_lookup_table *lookup __free(kfree) = NULL;
-	const char *pinctrl_compats[] = {
+	static const char * const pinctrl_compats[] = {
 		"brcm,bcm2835-gpio",
 		"brcm,bcm2711-gpio",
 		"brcm,bcm7211-gpio",
-- 
2.53.0


