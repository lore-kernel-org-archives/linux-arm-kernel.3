Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D6AD12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jmZ1Nnr8hYEbUibLvWDZg2doGxe3gLL84xuGJmKYhWk=; b=w+OI0enQqNud0B6EFius+1bfEl
	t+G3ScH1FJVyC4wNd4WKS22wbSIjDxNSjH5+m9+RXgC2s661566gJ1qvVZ9i5tRGeGPfDZ5OoOm9T
	Fs+YwJmsjaN0KE2afZR0UWCxfR6Eyu680DkNUFqLQHgJEJXttQ+8skojWLRtFmi2ORQzvvOIvrNv/
	FYc1KSKe5lNKIF9obcFGawyOpPi3nOoZwEHt0KGqHGf61z7M6uKo3l5lJMOPpAezZeuaCWGJMkBqx
	5S983d/mVDxgDt9Nc2ZFWDqmQVhF1M0Cpd9vId3kErb4pkgJOhlVP/Kejp+QpEnqSGZcnD7WCyOyt
	InMF7r6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQliZ-00000006Xee-1cX4;
	Wed, 03 Dec 2025 12:12:23 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQliX-00000006XeF-1YIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:12:22 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8b2f0f9e4cbso83844085a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764763940; x=1765368740; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmZ1Nnr8hYEbUibLvWDZg2doGxe3gLL84xuGJmKYhWk=;
        b=Wd+GixyASco4kieBfQA2ENs4HSoHYlWvbco4QDf8xfQpi5+0jVjXEs3t9Ch+eO/AIB
         aufKAWEztCvQg4vjFd66DbHwvpX2drTBNestoX07a4mc1fAPLTRMkVV7hmioy3VoEMfu
         pz+yAPf+7sHP0MKLTEGlyl4ooHyJT5j8HeDywAi9DtjVrRpMmgKtfXhwdSe2u4mUbeAZ
         RkSeNQPiFgzmfLVX3ByHB6nNCro/C51yxUg7Yp8tX6GscRqbA9QCqWWeFOcLo42fLVAX
         EyXPWOSH0z+4vv6fnv1QG7icnkUw9DSy5ja9z/AZSzEajq6ePhcQLaEW4WFPP0eUPk4j
         JBpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763940; x=1765368740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmZ1Nnr8hYEbUibLvWDZg2doGxe3gLL84xuGJmKYhWk=;
        b=PzyvziiwtSJ6FYQ3Fmq06H3/WTBDbtYLYT+rcy/UpdhL1dJ6ZNE4u356NTOS1ayx5A
         N2degY5CELtw1h43ic3dvc3RTtyR/GJhpBkMSPHq/zHRX86lmgTZis7v6LayKIF1g9Zl
         G1Rou388UA+eoB+GRGdNLkEBf1hih0KCi28AhGI8gAFYwmwZ458xdmEETlAoU1PRZlk5
         Uy5j/oOcHf01HUFGwelGls24IxZu1wxQFF/mtpS5DtQfWtTfVFXIE1hCIPv4xdOMMB/j
         r84S/NaY2zDWzBfMTj+iQxHWwj+4f+zng0eub70jJl052W3wPbouf/ousXtUdQO64H75
         iabQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8uBQLtZwHQAh/WOPCXOiNpdKg2Tt6DFVSvvMU+Uyn9CEk64Tow1A9FJEeljjrzM2mF6adJRJijMK3YUSC5LhV@lists.infradead.org
X-Gm-Message-State: AOJu0YxL3m9fuO3QTA2z/oB8MSe0cmzLeQ9fcvky87IU6AipbKoqpElp
	wU1DKYUv0ElGHdx4lal6aa46ILbCjDcDnrigT5ZvypXSgqouw3xP4Ux9b39f+kFPh2o=
X-Gm-Gg: ASbGncvsNai+5bMBHMphUZApVOJifLy/wP+tcNTsKmG92PFjsgqzsRmPftD8ajP5hfL
	gIJQUbCzBUBC4GarLK9BbZwAL2zF3FXdBOHCp2vqf0cP/L5cPPgiKe5yt2lzlYTICZw7EhZEE+J
	IeF/pBrsqx7UR3AhNlChpiTxQj8L0UJ71gpx50UhA9GlhxDSSBSqgxj11RSTkOfmjWtEk8F5+R7
	PJkY+aGoqQ3jyo1wsiU1BZu15z0cNUa36NEnjOy4a+P53y5Bhw5CR+hwi+t7cBXmTsEHWAPU6aQ
	aWa+49leAoEwQdPFK8cWR6TcyR8YOsGhJijscGJofqoTbrTmh1FpaPVnPiVCNRJpsbMhSYMapLW
	ae+Cq3BccND/8SzxGwIs/NK1dYewq9/c5pXiTAgFcJeU3J+KrxAcJPPJzUIZQBgmbbsFmD1KzN1
	Q6WcfC7zkBLFO8UfNrP6C1yEN61b4kym3GUsop1sbdQsqy
X-Google-Smtp-Source: AGHT+IG6GEiIMrlIJ16aAfiqLcEureDC4oQURs3Fa/1GaHuA+RFp6sYuomKRuRIY11PjdxnazNDFvA==
X-Received: by 2002:a05:620a:1aa3:b0:8b2:faa3:5639 with SMTP id af79cd13be357-8b5df10bb7bmr297923085a.11.1764763940117;
        Wed, 03 Dec 2025 04:12:20 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8b52a1dd353sm1294658485a.49.2025.12.03.04.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:12:19 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Tony Han <tony.han@microchip.com>,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH RESEND] dmaengine: at_xdmac: get the number of DMA channels from device tree
Date: Wed,  3 Dec 2025 13:11:43 +0100
Message-ID: <20251203121208.1269487-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_041221_426220_10E146CA 
X-CRM114-Status: GOOD (  15.74  )
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

From: Tony Han <tony.han@microchip.com>

In case of kernel runs in non-secure mode, the number of DMA channels can
be got from device tree since the value read from GTYPE register is "0" as
it's always secured.

As the number of channels can never be negative, update them to the type
"unsigned".

This is required for LAN969x.

Signed-off-by: Tony Han <tony.han@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/dma/at_xdmac.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/at_xdmac.c b/drivers/dma/at_xdmac.c
index 3fbc74710a13..acabf82e293c 100644
--- a/drivers/dma/at_xdmac.c
+++ b/drivers/dma/at_xdmac.c
@@ -2257,12 +2257,29 @@ static int __maybe_unused atmel_xdmac_runtime_resume(struct device *dev)
 	return clk_enable(atxdmac->clk);
 }
 
+static inline int at_xdmac_get_channel_number(struct platform_device *pdev,
+					      u32 reg, u32 *pchannels)
+{
+	int	ret;
+
+	if (reg) {
+		*pchannels = AT_XDMAC_NB_CH(reg);
+		return 0;
+	}
+
+	ret = of_property_read_u32(pdev->dev.of_node, "dma-channels", pchannels);
+	if (ret)
+		dev_err(&pdev->dev, "can't get number of channels\n");
+
+	return ret;
+}
+
 static int at_xdmac_probe(struct platform_device *pdev)
 {
 	struct at_xdmac	*atxdmac;
-	int		irq, nr_channels, i, ret;
+	int		irq, ret;
 	void __iomem	*base;
-	u32		reg;
+	u32		nr_channels, i, reg;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -2278,7 +2295,10 @@ static int at_xdmac_probe(struct platform_device *pdev)
 	 * of channels to do the allocation.
 	 */
 	reg = readl_relaxed(base + AT_XDMAC_GTYPE);
-	nr_channels = AT_XDMAC_NB_CH(reg);
+	ret = at_xdmac_get_channel_number(pdev, reg, &nr_channels);
+	if (ret)
+		return ret;
+
 	if (nr_channels > AT_XDMAC_MAX_CHAN) {
 		dev_err(&pdev->dev, "invalid number of channels (%u)\n",
 			nr_channels);
-- 
2.52.0


