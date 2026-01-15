Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6320CD3CC92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 00:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bXtk0sA7TGlPJIYepV8HIyQX3pf9pLDE07n5yEMjuS0=; b=jOFaEL1hzmsbnoNyrMDowPuFiX
	HVsmH+FotCuPoN3rVLzHQePfPFofiw49dAceYY70Gj1N2j3OyR4nKWXCAgxBmnPMzPhxVxOdLrZh5
	oEwS/klt4S7XSDGmU6fDWi1EZUQ+njCAn8Swi+FjVvUT0VfXRNbSxiJAvT+eHooOaEqKrrdALG/dZ
	AX3dXTJgqlvQhuPxbdbIrc4ZfHviHRmQZgSTEGia6hHAiU6EQ1E0dNxpYU5CheVoTgIJ9OjyD7C5g
	/IeFAdADSUDsKhe2H3yan9ZDRpNE8kFCmKzcMoJg8e9OCszPBSpzRUmVFV+P6N9FhtoxlGJL7opW7
	gQzdqOIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBJ0-0000000BF0N-3a50;
	Thu, 15 Jan 2026 00:33:42 +0000
Received: from mail-dl1-x122a.google.com ([2607:f8b0:4864:20::122a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgBIy-0000000BEzP-1iOh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 00:33:41 +0000
Received: by mail-dl1-x122a.google.com with SMTP id a92af1059eb24-123320591a4so371844c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 16:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768437219; x=1769042019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bXtk0sA7TGlPJIYepV8HIyQX3pf9pLDE07n5yEMjuS0=;
        b=bjmUu0FTBZ0Ty6+kS5PPlwKdjMpoAVaZJri1BhPbJVxQTnsdDhROKCcp9Xyy3qJJ0M
         YdF2o5cvscrGIO3WpI5dmKbGttLdexkSx0gfIuar7kIHzGkRdKuQsjF3nerh3S23GTSU
         04Z/teRXO+et4JwfcCC+K9vppcpI1Ve4jAqROdyrj5pK3xla/c0ZqnUfupq5fbGxsGOS
         RkAuEhrpoODI6TllyL8SyWEZwT2Z3OCvSHTuncjJ7KclE9PNDmYOlzBfUY5GuwzsD/4s
         0GknUGZOThMkJekhwBDVhH5VbcZN/N2+N3/+NpdUnrCx0G2EKdjSVDf2jRvK/kQvK3Dh
         qc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768437219; x=1769042019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXtk0sA7TGlPJIYepV8HIyQX3pf9pLDE07n5yEMjuS0=;
        b=krxi45hO+FpJl6sb/aBNDRSri9pbvaJ74oDLm8wXl0kYR3Sa+dxUAyCHOMlGe+uTve
         jc8EG7atu5FcU/5RBrfGJpJTAyKzjTYPl3LO8Wz8Mu5IuqENcOwMi2YAokKnP6p6ZpLq
         O4EbNNTtOhyRSLb9uUI+MbUUrDgUGppVfPziQHfz/TH2uhBsJ9v/AdppCtMg5rZlOfQG
         cfntgkYWIWoCoQaeL2PXNXMNYmMSjzXz+KQfmqclrspAYVeNMa0muH1FufZn6dwD09Um
         WgnLJi+su9nmOvdThz/h1gGMSTkX4wBSE/UVKor/MJbZuQfTiV+EeiAPCtVu0eR5yp8i
         NFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxfKnOyQZKW19XAYX08BgFKiw7F1a2dYTHinAi1bL17aiTj4EEtsp0kTv6ojOtzIuOtPW0C6MQJld36Uy3fR4J@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5LPgH2yQ0pmuxhn/IlQHfplpWSfk0/UqKkcqynpLVFVtJGgF1
	+VTKBaQfX1yV3oBqv929sqUqtQP3Nbh5ALIfTiPTwUqZtjBCyUMZxLQzEV2/ssqGlQvdqeB0fI4
	fJiSc
X-Gm-Gg: AY/fxX7I1hkkRH+cVQU7pYYn/10Dp4sxaKlvosUpktsIbvt1SxCjddrqLmTEN6aHVab
	1M3YGA4lQquyDQpYGA86xgSgDZV1awKf+T3eeZbNHbBxC4eKQ2QFAhe2Z+eZOcYA1l+u9wRbkYP
	KlhWS2ewo37pRm2S2J+XJ3RQjglfK6RR/vcno0858j73mFAVvTh00c1b0iEfF3bcEAGE/d7Eo6k
	OTLRSUuMvx56KQPGPTX76UehA3OKUGTKDXld/Jai041W5vRY+gwFwEqEGvaNRAFp4d26GlkyIb1
	/YCm9+q4rjMxd+TA0KWO4pxekpNhxub5sVJb3/e2i8SaGfEqlADPqXvRVDkpMyXjLXaVT+M2mrW
	Jd1Y83U7EQ9eIIxML2YrDE5ELfNMg98kCfbne8xViqLFKGkTCcrsnaNMhrptJnvEhTu1oWtojze
	gD1JmV6vzorURD/YqC0W+etA==
X-Received: by 2002:a05:701b:280d:b0:11d:f464:38b3 with SMTP id a92af1059eb24-123376b1d88mr3105776c88.2.1768437219338;
        Wed, 14 Jan 2026 16:33:39 -0800 (PST)
Received: from localhost ([50.145.100.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm13313027c88.14.2026.01.14.16.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 16:33:38 -0800 (PST)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>
Subject: [PATCH] spi: xilinx: use device property accessors.
Date: Thu, 15 Jan 2026 00:33:28 +0000
Message-ID: <20260115003328.26095-1-abdurrahman@nexthop.ai>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_163340_450811_15247ED8 
X-CRM114-Status: GOOD (  12.40  )
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

This makes the driver work on non-OF platforms.
Also, make irq optional, since the driver can already work in
polling mode.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/spi/spi-xilinx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-xilinx.c b/drivers/spi/spi-xilinx.c
index c86dc56f38b4..9fb1da2fcce4 100644
--- a/drivers/spi/spi-xilinx.c
+++ b/drivers/spi/spi-xilinx.c
@@ -405,11 +405,11 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 		bits_per_word = pdata->bits_per_word;
 		force_irq = pdata->force_irq;
 	} else {
-		of_property_read_u32(pdev->dev.of_node, "xlnx,num-ss-bits",
-					  &num_cs);
-		ret = of_property_read_u32(pdev->dev.of_node,
-					   "xlnx,num-transfer-bits",
-					   &bits_per_word);
+		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
+					 &num_cs);
+		ret = device_property_read_u32(&pdev->dev,
+					       "xlnx,num-transfer-bits",
+					       &bits_per_word);
 		if (ret)
 			bits_per_word = 8;
 	}
@@ -471,7 +471,7 @@ static int xilinx_spi_probe(struct platform_device *pdev)
 	xspi->bytes_per_word = bits_per_word / 8;
 	xspi->buffer_size = xilinx_spi_find_buffer_size(xspi);
 
-	xspi->irq = platform_get_irq(pdev, 0);
+	xspi->irq = platform_get_irq_optional(pdev, 0);
 	if (xspi->irq < 0 && xspi->irq != -ENXIO) {
 		return xspi->irq;
 	} else if (xspi->irq >= 0) {
-- 
2.52.0


