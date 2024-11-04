Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0068D111B8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 21:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=; b=eydTYvHNXkxo99MQ0nLeQ/8h6r
	CDh+XOy2JZ4ywF68ATfYCAZ23wddu+oHIMSYqDaolbXMY2v3aL/i5aPC8g24i6fWdiAGIY02xdZrx
	FszyQ3DdgxM1Hgxj3jYPtNPEowFpiFeiYpufeLF+ylT2VXgZ8TL+aMbU78h9x3T5zxmopjMRe8DyO
	0Ap7O19ytIb9pZrQFQPJ9IrLv1uBefI92B5xEXqP2VCHr8ZZONhiElmQAfzl+wWtTcHEwUvyF0j+U
	RxsGNrmcSysTwftIPka1iXHhiUceVU0sooruBnpKUCnMKa3dTPxaNH/m2DxazfK/DaLtmgPaA1dZu
	kgtEBCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t84vS-0000000FDVn-14hF;
	Mon, 04 Nov 2024 21:47:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r5-0000000FCtw-1bUd;
	Mon, 04 Nov 2024 21:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=; b=lr6txmaPVkCwe/RG63e7dqiS0C
	GGCWod32Bjy87DL1/SrSEghXmwvjQd1qP/LO122O97hS6sH4my2fOVt6xFy7hZ31SN7sRnkBYepJM
	txbfVBwbe7Utj7xFNphFsRUjSQgNTg53RCm2+yBeLP7sfjsxY8IenEXvMaHsm/xd2MbhcSPRhSrgp
	cIeOqB+p+u5qN2zJX65HO3A+BX2ii81AEKPw0r0mc/VF/IG4W0Jr6wqYmyFcC5ToBfbALnAVTFDGZ
	f3RJMPd4XG7/Mcq9XVKWZIDr3dc+/k2eyEBn4II8uJae83hUF605Et0ci+D+4Bqc3vUwtecgjFLIU
	+3lJwmTw==;
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t84r1-00000001bX9-0bcd;
	Mon, 04 Nov 2024 21:43:22 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-5ebc1af8e91so2210015eaf.1;
        Mon, 04 Nov 2024 13:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756595; x=1731361395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=;
        b=ge9MHd0pdCrMvl2pTD+g6UgPH4VQUoiesBBmIJfAiMXM4y82FCY6isj2sXODptLU8b
         PZcMddwDVoftH8X89L/ArYqFg+jJXYpxGZNYszlw07qtpfcSVcrF8+Jq/1qQPyn3iSg+
         PSOEGL5QR+ARTMBMXoVIuUrEnBm1qEhp6gwwKVHrDYJ+bGtFdjt8Ta73CgIK6BZE3XoZ
         J/p+cmYAA0NogJ9OCMPs/l1vhBCFxNVRoi5w5ycV7rF9iwI0Jlaedjhc9ujaIlOL4gbF
         VrHhl/T4166JsIIhpB5uZm9peklZlpjb1qFUQlH2axKth8ZFUP+7rcB61HFDFCche6bg
         8GWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756595; x=1731361395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOLycEB3fTB76jveJ6Ec3et2DfKHvs/Gj7ofAidlU2U=;
        b=f9kj6VeN5EkQuj0WqmQb+/Fr1urzHf1ooKGO/odpPzxXaC0Bsc76xLs51oyD1rXJea
         VdjOjRY8mgdIf7jVUMxw4ogu90c65K6QiEVgBNVlsMddLPOhJEu/aeRBShZDOt8nSkqb
         2vL6v+AYSbe6DHWrP3fr2xZsZ4CGqDr4HXZVpPRSzZSRGuho81ympYe9D8ZTi0PRNIvT
         jUrkRdUG6ynUo44s9h1fpR9CltpcNmqWIt2xM9b6MrankkcGi5/GshuCDomJGfJalD29
         sAMtyg3yGUg1KY8s97Yk7uEDvFw5nolFuubJ1YGWSh82aR7kI+sSFD8YZ7tIn6VTwuxt
         Tkeg==
X-Forwarded-Encrypted: i=1; AJvYcCU2Jl1UY5ewgeIb+Qh7Gyleuf1yPmmc5YNud7NIt5mzdsAjJJxT9A/k4QagJBCB2QEzl5FO1xqGScern/jikA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUHazvJy1i8afjLu7Nw1UZ8wnzrDSoSV5IM5o6kkAzigBA+09x
	LYsDcriWBj0p+qnMmSBBArIuBgxg8PToGaMrvWByBrf7Nx3bzElA
X-Google-Smtp-Source: AGHT+IGnt1DbQccv8yv6iE45XBrqGyCFkNPY8U/R7NDQnyLk4H54QS9Fm7w3bkWhRyMLeNLeyX0P/A==
X-Received: by 2002:a05:6358:7254:b0:1ad:10eb:cd39 with SMTP id e5c5f4694b2df-1c3f9f7979amr1635893255d.26.1730756595525;
        Mon, 04 Nov 2024 13:43:15 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d35415b1edsm52553916d6.75.2024.11.04.13.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:43:15 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: rmk@dyn-67.arm.linux.org.uk,
	max.schwarz@online.de,
	dianders@chromium.org,
	david.wu@rock-chips.com,
	heiko@sntech.de,
	vz@mleia.com,
	andi.shyti@kernel.org,
	wsa@kernel.org,
	manabian@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH 2/3] i2c: pxa: Add check for clk_enable() and clk_prepare_enable()
Date: Mon,  4 Nov 2024 21:43:09 +0000
Message-Id: <20241104214310.6048-2-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
References: <20241104214310.6048-1-jiashengjiangcool@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_214319_866928_2E6B0C56 
X-CRM114-Status: GOOD (  12.49  )
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

Add check for the return values of clk_enable() and clk_prepare_enable()
in order to catch the potential exceptions.

Fixes: e7d48fa2b5fb ("[I2C] pxa: provide late suspend and early resume hooks")
Fixes: c3cef3f3c07b ("[ARM] pxa: update pxa i2c driver to use clk support")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/i2c/busses/i2c-pxa.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4b..1118a7f5c6bf 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,11 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret) {
+		dev_err(&dev->dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
@@ -1560,8 +1564,14 @@ static int i2c_pxa_suspend_noirq(struct device *dev)
 static int i2c_pxa_resume_noirq(struct device *dev)
 {
 	struct pxa_i2c *i2c = dev_get_drvdata(dev);
+	int ret;
+
+	ret = clk_enable(i2c->clk);
+	if (ret) {
+		dev_err(dev, "failed to enable clock: %d\n", ret);
+		return ret;
+	}
 
-	clk_enable(i2c->clk);
 	i2c_pxa_reset(i2c);
 
 	return 0;
-- 
2.25.1


