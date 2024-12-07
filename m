Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C39E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 01:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ajfi+wkQFyaWasmE+q4KW/J7MFmGlCQy0rOceUXZD+Q=; b=Uyk1l6J4czTxn/xsaLuJn6+wPt
	pSxfg3pcs3Hleoz3mgSEvourrEno9f91PlzTdV+SSYzRRirORLYmWRk7+pPsGH+pmgUdxaoU2EX7q
	w57QPYrGH8M+nxiZQGjo4x91wOBbbrFqiLAnVFymy2FF9i7CkJoFYZlzJmjwYJiryse+VjE1nfr45
	2EEF4NdZx3Z4ZJg9ZKGT7Leq2VvbxhJsmKyHSjBrJ3xCGme0p1ZXzD9JP+F5PFHbH0C4NVV6Ajgxk
	wYgUbceGIVZGl/9CAyYxB9HsfeqgW1w3H6w/eKPl9jpVhDXyXU/SyWt+7prO6sXXhLQNNUH85SnVW
	QR3607zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjxA-00000003Au9-2UW3;
	Sat, 07 Dec 2024 01:49:52 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJjw9-00000003AoG-1Oup
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 01:48:50 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4668d7d40f2so22793261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 17:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733536128; x=1734140928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ajfi+wkQFyaWasmE+q4KW/J7MFmGlCQy0rOceUXZD+Q=;
        b=R4MTgADJwq78RlPjsqOfkHAvGlVnOg8B1KJcYTBEhqiBdQ1MtPOWbMBg2d3c5YAQvR
         35AljbXoECPQsxnsE5G3j4dQvKiokPMO97+HcYfm2eh+HPt04IY9REKx9u7DVLwvb6u1
         0bId6eyTjpssuGO/FthyqdEkYaYk7iiTNnk+2bBsf5nxe/ToF8CyUQrFN1ImtHTNvMrm
         P9duxeHNbAXB8T+66Kp34SxR6uNbIKLGaMp95nGTYN1wbIzsQEYXt54zH3nAeeTziM1P
         3mtRDf8wnbFz9VR22dDbc0lFbZ+4ugVWqJlnUMuE1gjbVl9O+NJqQodnX6JHu6mpIpYC
         1Ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733536128; x=1734140928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ajfi+wkQFyaWasmE+q4KW/J7MFmGlCQy0rOceUXZD+Q=;
        b=YFGb61UeTW5qmE2z3Ed8wvFtmY1xtPygwIpNKBuEE6Dm4fd631GzeIdf5Oj0AAYPn6
         //sJBHynOGgPOTKRPkaNp5swSNjQBqI0cfXeMoaJ2edSssc49PoTOauwMSMfPjnOYKMu
         G2IEmzPxaF1JPT+im1y6MAsRyqhIkOT3nXGx+5kauDlgpYsigf8Vi+xo0nS6VdLD+7mc
         pdxSSLr5zZBF+Z5XDz93BL+A4WW1M8YGhAHnXDFYboHvaXJX/HTL15EAym4QUa8x90IP
         n/IZ/XM03PokH8qKBJdMWd3ezKBFuIozuI/sCZw4J6YAlNQgKYZak1vxvmpzXW7+VvdP
         iIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9/RydO0Ot5yCCTVJ3j3qsMIrzkFbVrpvVFIgsq7L1fdrHm0TZE4/VCRm13hxAis3y1kJDA7tz/73o4mOnGxCm@lists.infradead.org
X-Gm-Message-State: AOJu0YzdQ4kxA3vGIaKsGeLPbw7bgVm0oXNDcU/BSgHkEuNp0lvMWinf
	B0hHjUn44M7NIBoR7GhPLBYLCwnoN3UTZgNasfRUmTFz1UzHTqhW
X-Gm-Gg: ASbGncsG+7UKtZ3brIxAzv5n55MYO8N1ZlySIN6ZdzNSDuxzyp4BgOtPqmXQRpU8irK
	1Gdl0vE9ZoV5ta/SnCO9XNmMQljy5SlFieXgNsdNSES13YXH41osGqpFZj3WEOO6KUPqeRTU8TK
	+HEQ6u2FORcaDgzu4Kppr6dCHX29EBhYQh6CpDEeMVsoIClzMjwEMaOUwfF9Ak2sSZyB+ntzG1B
	Vch8kv2uDRb2OdUVRKMriPDZUeGyPrKgiyDj2B4RTvPyDKbviniAN9Mm5v6lg==
X-Google-Smtp-Source: AGHT+IE4NLqq67Nz90hVIj+QuOGnN+1RySBoeoLm48wEmZGUAS+YgYXJAD6JG1I0V+XjWUCLcketbg==
X-Received: by 2002:a05:622a:8e16:b0:467:4c21:e396 with SMTP id d75a77b69052e-4674c2206cdmr11685731cf.55.1733536128078;
        Fri, 06 Dec 2024 17:48:48 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6b5a84506sm228443185a.81.2024.12.06.17.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 17:48:46 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: broonie@kernel.org,
	michal.simek@amd.com,
	linus.walleij@linaro.org
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH v2] spi: zynq-qspi: Add check for clk_enable()
Date: Fri,  6 Dec 2024 20:52:06 -0500
Message-Id: <20241207015206.3689364-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_174849_386228_5DBC6223 
X-CRM114-Status: GOOD (  12.62  )
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: c618a90dcaf3 ("spi: zynq-qspi: Drop GPIO header")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2:

1. Add clk_disable in error handling.
---
 drivers/spi/spi-zynq-qspi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index dee9c339a35e..da6c2800d6b5 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -379,12 +379,21 @@ static int zynq_qspi_setup_op(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
 	struct zynq_qspi *qspi = spi_controller_get_devdata(ctlr);
+	int ret;
 
 	if (ctlr->busy)
 		return -EBUSY;
 
-	clk_enable(qspi->refclk);
-	clk_enable(qspi->pclk);
+	ret = clk_enable(qspi->refclk);
+	if (ret)
+		return ret;
+
+	ret = clk_enable(qspi->pclk);
+	if (ret) {
+		clk_disable(qspi->refclk);
+		return ret;
+	}
+
 	zynq_qspi_write(qspi, ZYNQ_QSPI_ENABLE_OFFSET,
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 
-- 
2.34.1


