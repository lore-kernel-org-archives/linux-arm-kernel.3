Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5264D12D4B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HY6LofQj0a46MQGd5q5uk/dioxwk+UPp1qGJ6sCZzPw=; b=kr+HarP80un16rQcTcoXRux59/
	apmrHqQ0vt1t1XRrAZNEjyIyW1KLFz5yVXhhzyvoj1PWSmHMJ8A+hiEnEWKC4LdeEqZioDcgd2lyH
	NWIVOjmgLVdUKajNMFpZhho39esomx0yj0JLF/ryEkb8i7ZLF6X/NeY+MngTfSB1WyvMIc2D1r0NG
	vIdbgEHpq2KZMxJrTUrn7XXlTfXJN6zG0nBZaGpfR/m26WYAs22xYpqtEMYo51dJibKiDkcsVxvI1
	huybx2V7i2JnZFRO6cx//hvZeZRmarljMAhk2smLxZva5oTIDyCNRKl45sc0sy5q3dkSDK1dQJYhM
	+52JiUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlfS-00000006XRg-2XMQ;
	Wed, 03 Dec 2025 12:09:10 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlfQ-00000006XRH-38pP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 12:09:09 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-88242fc32c9so75703716d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 04:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1764763747; x=1765368547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HY6LofQj0a46MQGd5q5uk/dioxwk+UPp1qGJ6sCZzPw=;
        b=SOy4+6klavfEAdfchNi2bIiz7CuiwrLH+PcCp+JK7qRs9i0WRIWMlPsegrkIhI13Na
         8GYGNYCNKEIxRUpbhvWHhHpu7LbwGIzCf9HYK+N8LhOjdtFPrdMRDhFNJmF6Kq4/zhwn
         J2ZatKKXEEAv2P0UsGsgUdQAKfuoee7b5f8EIZ3zwcfk/f1eXn/J+LmtzBlQawMyxksv
         CiHtzWdZTSCzxdEKj2plhU+bXH7wh70EEBMzpo19el+i/0BqWokATAFpEqGrj8qgv0+e
         OcZlrvNbrxnPHKiIT/nagYXpQKjDu5tx3bqs5tRCz5pIsoEwxKAEziC64f4+MLVdITeG
         YoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764763747; x=1765368547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HY6LofQj0a46MQGd5q5uk/dioxwk+UPp1qGJ6sCZzPw=;
        b=oVUOYqQfbGJDLTkYeWni6U8K6SbT3SpyFUg1jNgdugNViotys2dQn2lcU7IvfNBi6R
         awETCrH7RpikziMHbYrHLDlhHKq5PqnSrHDOQA1dWUPWo8tF8Qa9J9kVTVW54yKuwykj
         3fXH9hGPXvb8/SxBXP8OfklYdKDREfgxBRsQ6ws6X9YQXT7kRfCpfvGMWrwLIEQhUJR/
         dp0SABqWgfmQDNmVRcayKRyfBUxjDDQw/vK31vStt3ZN+KNYuPNDJWc5Y7TTTnkENcWC
         NWiSry5T3Q4AzAz/cH3QGfF8SRFqElfIVIhezWrlZTxlqE7dG+K2083Nu+hZQ5IQlyEX
         zCow==
X-Forwarded-Encrypted: i=1; AJvYcCXIaFsHpwnSZbzA/SAWp+PIpGJVh8PaDPxQVihDKRO+2LQBH08KiFqXpOcb/ADrRoN9IQzVtdBUeF2rVnXM1UyY@lists.infradead.org
X-Gm-Message-State: AOJu0YzSDRXNvNFF4e5gUk6foRx+b4Agf1tktAPkG+mj2pV59xuPJDU2
	x2qCJnyrp8jNAhH6C2V9DhjzJCXjGzrKir9D2yyDC6oCLNORo/t1nOMiOGcNjjUU9jY=
X-Gm-Gg: ASbGncsSPMb3JlUEst5HzY6fWfYWoQBHEv6N47qWo1Nb3qs6JjgiaobncfIm4QDw3ju
	KRnSZAZzvZJhkebQDGTNOTa+T54H4K+wFUwDW6Wh8jwuR8H3Hmz2JOvXWooQZNyAf5VHtHHNsLx
	FywekTuGJUaSCM/1YAyF5BpcqVjqK1w53826PVcO6kuW1MDIkCRBR0N5vrUpX1MxqkcXl7YXRU6
	VU18vOHV0exCx14jbOd+ootURAmnPT8MxtU/oklpMS2MMyOnLyReVj6bgpP43YAk3BmVVNeQgVN
	E4X4Q/GooiX6M7F0LE56sym6TOUw6SkQlIwxaHf1cVyQwkHqWU/bL/mK75q51U9A2FbK4e6WlbB
	QL/92TFJ95ZE6o05UQRB1XBDQe3uIctnRAcAOpQbTxunUv3WDpTFyNaFUlLjCPZLt1QgkEoXln7
	EKxGbqsQyzCyDNTEvPcVRbW5aknUralU8ND6WW3EhaDkemy/s7kGVEZik=
X-Google-Smtp-Source: AGHT+IEvNXdED/r4HNe9JNsgMM/9LcSRInAqa0tAj0HpibxFF7yD3qYBXk2NGsNRo5JcknABVsIKhw==
X-Received: by 2002:ad4:5aa5:0:b0:880:448b:b893 with SMTP id 6a1803df08f44-8881956a88amr25245066d6.50.1764763746646;
        Wed, 03 Dec 2025 04:09:06 -0800 (PST)
Received: from fedora (cpezg-94-253-146-247-cbl.xnet.hr. [94.253.146.247])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-88652b49390sm126308036d6.32.2025.12.03.04.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 04:09:06 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: ludovic.desroches@microchip.com,
	vkoul@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Tony Han <tony.han@microchip.com>,
	Cristian Birsan <cristian.birsan@microchip.com>
Subject: [PATCH] dmaengine: at_xdmac: get the number of DMA channels from device tree
Date: Wed,  3 Dec 2025 13:08:23 +0100
Message-ID: <20251203120856.1267671-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_040908_827031_13454DAE 
X-CRM114-Status: GOOD (  14.97  )
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

Signed-off-by: Tony Han <tony.han@microchip.com>
Reviewed-by: Cristian Birsan <cristian.birsan@microchip.com>
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


