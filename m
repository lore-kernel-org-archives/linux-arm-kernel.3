Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104D5D3A69D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mg56kOzcgZYyfjxOgtlPIecLk2wzzp7fMeuBDM37L6g=; b=WxPWNC4vY2GKAwYOCG8i/Ky9f9
	7Aa3XJGc5JwyN7PUx2ehZyCpe3MQFGGSXhG721uRbVl+y2afQ/zAU7NoUw3nbMnk6u+CxEmF3Rn3j
	KG+BLEHruQTceeOLl81lnXOy8yVq12zFUypCuSVI1O1rraP/4nvoMLpqFLf7EYz9i7cEaXzPbBEFh
	DxclZUhhKuutrVwaNL4PeW/OeK3M64IUY//GJ51QF+psBqL1Nr5AO4VfJfFdA+tPMspKZcTP7e2Us
	twWL0qRbBsZPA3Swl9h/LBCfQFA3DTb28FLGaQkGxV5Sldm54oyJB2CwW/MmfJLpxOmUhTfmCaydb
	VCZ46NMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5t4v-0000000Fr8u-41Eg;
	Tue, 29 Oct 2024 20:44:37 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slA-0000000FlB7-22St
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d43a34a0cso655563f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233451; x=1730838251; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mg56kOzcgZYyfjxOgtlPIecLk2wzzp7fMeuBDM37L6g=;
        b=AJq1xBJy0WkQqSaUcktr1G+zhaprUfbf3WphnUvCIZdq4qLmO8EsYh8ijMFbYe652u
         zCflvPjzNuiMUxMMPhz//WhFlUuk36pYxuoobNIyn0dC3gDSBvBWVa+DUwUvNH6c08f0
         h0zwra1qnW5EsXugpVEIytN+iv1Abj4Q57xxSrrdDBLeG02CBP1N8HddgoFEq7NuZYHy
         MGZY0NAZict04adC+wGWNSpxqfn6AR1ZEWdbQkbqzwC4MOGOlFkLwzJSHQ42PsZKmT02
         vzQ8cduVAFsgOK/ISaWV0bfJg4R9PwOHpqP5ZnScfU6rHknZZWtoXmleOkwz1I9+rUsg
         cw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233451; x=1730838251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mg56kOzcgZYyfjxOgtlPIecLk2wzzp7fMeuBDM37L6g=;
        b=YA5mtoD8QoO53bTwoSSdAym0r4RzZb+Qvb8gX5EJU9TzgwNSjXxV8qzjXBgbwur5Ni
         MwFLNv9Ey32NuvbqDogDcwneuKm9vE1cmaVrxiplUd/uC66BNVnCzGJhrbry741PSS5u
         oehkHGLfhHVPsM2o85iI9DYO9FHFum0J6eth+rFWrIYxkRUdViUUEi/1WIDOIchId/xP
         x+vZSLOvdinG/LebFXXU/8LBjPaBWRuHQ1pOOx+Y+4Enpz6SfEwjtkFkDANzfc1LqG8Y
         KOuI4N86DwAhWs1UJGQw9l/iG3Rki0l6Ed8X8GwIe6zxlF0g+OoSQTzgLQbXfjj78Hwv
         9zfA==
X-Forwarded-Encrypted: i=1; AJvYcCUPT1PXEimePMfqMocVy1sVSPStqaQU4Bv5Q6FhQENGlRzAMparCwgDuPrc2bjRerR2Pb9x1pO55QAykqbL8Q51@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf2+1OEN5J20IcEeEvu7A4YsDLX2NLPUL0OMtKb2FdFD7WiMaL
	U0D1r7DwYoav+MkYrqQLXlWhFm1TMv1G2inaEa2nXjiPdxrHX6uo
X-Google-Smtp-Source: AGHT+IE2SE7Pl9hETa2QNaY4l2Zh1J8tx94HJ1BeI0oGFH/nw6C1/hbm9Btnw9C+KXluDRBZKD/PmQ==
X-Received: by 2002:a05:600c:511b:b0:431:558c:d9e9 with SMTP id 5b1f17b1804b1-4319ad24126mr50500815e9.5.1730233451009;
        Tue, 29 Oct 2024 13:24:11 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:10 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/23] net: stmmac: add support for dwmac 3.72a
Date: Tue, 29 Oct 2024 20:23:37 +0000
Message-Id: <20241029202349.69442-12-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132412_555573_616E7D48 
X-CRM114-Status: GOOD (  13.35  )
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

The dwmac 3.72a is an ip version that can be found on Intel/Altera Arria10
SoCs. Going by the hardware features "snps,multicast-filter-bins" and
"snps,perfect-filter-entries" shall be supported. Thus add a
compatibility flag, and extend coverage of the driver for the 3.72a.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c   | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
index 598eff926..b9218c07e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-generic.c
@@ -56,6 +56,7 @@ static const struct of_device_id dwmac_generic_match[] = {
 	{ .compatible = "snps,dwmac-3.610"},
 	{ .compatible = "snps,dwmac-3.70a"},
 	{ .compatible = "snps,dwmac-3.710"},
+	{ .compatible = "snps,dwmac-3.72a"},
 	{ .compatible = "snps,dwmac-4.00"},
 	{ .compatible = "snps,dwmac-4.10a"},
 	{ .compatible = "snps,dwmac"},
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 54797edc9..e7e2d6c20 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -522,6 +522,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
 	if (of_device_is_compatible(np, "st,spear600-gmac") ||
 		of_device_is_compatible(np, "snps,dwmac-3.50a") ||
 		of_device_is_compatible(np, "snps,dwmac-3.70a") ||
+		of_device_is_compatible(np, "snps,dwmac-3.72a") ||
 		of_device_is_compatible(np, "snps,dwmac")) {
 		/* Note that the max-frame-size parameter as defined in the
 		 * ePAPR v1.1 spec is defined as max-frame-size, it's
-- 
2.25.1


