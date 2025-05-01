Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A34C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+CQO3BwoDKAYLGKeUQMSLddVF7xiAI/qGk80JN0kw5s=; b=IMA6iAGPWjDkMsfVJo1d1slzCe
	uVCCiHX9YHCEthSCshC5UqBvmn8c+/USw3Wes39M4s7LsPlvzTgkehqkgLGa8AchFqy7OnE0ojTPW
	4N/7GJq5+NGk+u+J7UOX3CjocN0uV8Tk63RKZL0sVurQjRtKEgg4w4e/FWuLEmgl8KWBUiOEr7yuv
	tLjr7y4mdUW3UK3STSVafEWGwETeuDyoaxUa6ASrw8XUF5iWizgT1ZKoQcclHbvD4B1r5F7Q5D4zZ
	jJ9IvCopZuHTW6oP4iKK3thmirAiH1XGhl8rH4VJ1Xnzgqzgs/eDUqIDP3qtVGGuQ9nvTz1uPHstw
	vHmG1Vbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVVV-0000000G2WF-0FS3;
	Thu, 01 May 2025 15:07:25 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVQQ-0000000G1hg-3de9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:02:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf861f936so1949955e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746111729; x=1746716529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+CQO3BwoDKAYLGKeUQMSLddVF7xiAI/qGk80JN0kw5s=;
        b=JbABxU06mcLXfAjvqoJ7NMksgFEqVmgRrYYiTgkrCAcZkEqpLlROJF/qCcgOHoy4Nl
         M4xn4NXJhnT+0KTv5axLWwG1iMEub48SgK4LedQjO43zVq8yAiJ8D9YigeZYtKdfUpia
         /sVdCsRpbsX5cMSnctu7uXKB23ZIR//X67h6jrhjTnXUnfk2S4L83MwrhPnyoSsEmYwI
         w4AS0HYfRRHo6t43cH6Oi7XMvdtFhaco+YHAYY1nl0PvP90Bsm45Ee+hZrEbCRHFIHK8
         r0xs7eObvJmcJdYb/Qk8ISnmtiXiiHOlwxWtt+yLmCQhaR8qx0Mb3qrYvZtykBlnQFca
         0GSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746111729; x=1746716529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CQO3BwoDKAYLGKeUQMSLddVF7xiAI/qGk80JN0kw5s=;
        b=e9v1yme5OXn78F1RdwgN+mZ+TQHqnrL5tOa8q8rUfWHurdoJXodEbMIzfWik9p985d
         1ygIzeVNKpU66inH5zvmjgo4/hjgwg3CICLuJC2Sa5rSISGpn04pazarJ85cpWm1coy1
         /bjrY5rrt5ID8RtD5ZqeOrv5VEN8W/ivLtPpkzIpPYsrzz4hI56/t0Zvem8jGUy7GKMl
         V3GpzWT2q2FLQMV5OeHTH3M9tRPMWk7imIOJMcLP9noM9Pmj4Jpf88z+86xB6WRcNx6U
         A4sA+/aZDyAW9swQXdlkvzeG2pLsIGkDrWih0lAs+6WVwZXD9R/ve6NpGqqBLQRXn35k
         JenA==
X-Forwarded-Encrypted: i=1; AJvYcCVMhIJlVKuM70fh1gWuf7DA9+chFxMBClWh0RqSomkDWwmBCPWR+OwftdHaanpufQv+9XYiXgyaksyZQXVkke6E@lists.infradead.org
X-Gm-Message-State: AOJu0YyCfeUhIPdftU/IkpqijiNeGSw04SPm7geKjpjP7jhz8sDPg2Ec
	KwmtyJXWam/g1EqPjPqVg2MKgpTwvMEoOaU8mS7xTaAo7LTJxK5P8Xy8mMcEz6c=
X-Gm-Gg: ASbGncse+ENGeE5S4In6eCwm+s5/qa3noIQW2dkA5pglpzQ4LC1GeGMOxz+mz0WV+Y8
	kScEh34DqS6JKSX5YkXN8CXAe1+EV8QqPFPcIEylm2O8jkI+5tnJhb9Q30kUhevd4AgQr0TXI5m
	W46lvq1t29rx8X87FFSIn1KcekChGO+RBdxJ7t0v7NMJKZ9ykcCv0/GCxSJ3RsQELMSXNq0nmv0
	+uD4bu7GJzfKW2OxEgO60WGSJcYXLz+Bn+r9lwmhFFQ7uJ6sHHgGuRrnGBdZRmRzG4IEGsioWsC
	BcXSQVHXIlkYG257U90dN4IFFL+u6YqZGfDjbFXnCd4T/kHXKDjs9eGh/bE=
X-Google-Smtp-Source: AGHT+IE4vTsyhTKjuwrkxiEbVaqWLWprrAFI6LPkc5oJ6Tw5j0urpY7Zf4f4AAtn0dsslPS8UEL2JQ==
X-Received: by 2002:a5d:59af:0:b0:391:3110:dff5 with SMTP id ffacd0b85a97d-3a09404c7a7mr791880f8f.5.1746111729092;
        Thu, 01 May 2025 08:02:09 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4702csm1033190f8f.40.2025.05.01.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 08:02:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 17:01:59 +0200
Subject: [PATCH v2 1/3] spi: atmel-quadspi: Fix printed error code during
 DMA setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-n-smatch-fixes-v2-1-d2ad9c1f2e67@linaro.org>
References: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
In-Reply-To: <20250501-n-smatch-fixes-v2-0-d2ad9c1f2e67@linaro.org>
To: Mark Brown <broonie@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1698;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=4rkQ3Dw/vam/Vj+imyvV8Y9YuqnRhg19j57rXz0G09I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4zpE4sh6HCX0YHtu8ifWSZYIijtzq3yBuTF0
 rzZi40A/NKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOM6QAKCRDBN2bmhouD
 17ByD/9kTC3n6CgO/RKnoXTfVLW/0Pek2pCNI0Uowbck7+kCs7+0VPQ42qPkHHI4T6iWorNe0Qu
 GhENCHnyqd3A2bm6kqChnDRxzS4e7Ahct2c31seIg2nLHs5HmusHPNwSC8HTnzrT/N3kFvotDsj
 V01lG8bCbJ8qh5PSHAqTJFHMUAVq5zdJ0mKvnMISjajAEMTVvNcNRcQAl0Q5wBllqaKNflYn47O
 h6f37rS32zOxHljsIuMOo99la3c72iTkFCLSOc6a1N6fRYxAPH2ze13O24+vDphIwPEndOLRFyT
 adnFoGHyzgqEFu8ULVxDCIPLR+ZHmPNZtvOaE0XsFluaUcGhTKqKtYhQcf586SsGBKqz5u2mRxg
 vO40HXN1p6lX+XZTB5bO43/DN9UcC0eXoz+bp1nlTiJIqN9vLh1fQ6zhPvZi9axRBc5Qma/RVeQ
 W5S0gjuVVVUiVB35Prck8VDSNAIn7RApJikZCESHlqVV2JIMgtrGPQLmq9MEcjdcOlOux3H5cQN
 Xr7swRKIyavFwNYjvAQtV+KfJwU38RDFDSPSa9XMSsYxRMd0CcJG6Ai+EL7oFi4PX5oT0yxnMM+
 Z3GldcMCrtpxCa9IsLBZfEjp1k/MXtXtVVIS5RaUZ5j6M/50awIM3PLEocmTM9lwoKQAuEy2RAR
 EWKOBKuTGJOR/FQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_080210_908825_95A1CDD1 
X-CRM114-Status: GOOD (  12.71  )
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

On dma_request_chan() failure driver NULL-ifies the 'rx_chan' and
immediately uses it as PTR_ERR() so dev_err_probe() prints incorrect
error code.  Rework the code so proper error code will be printed and
NULL-ifying of 'rx_chan' will happen in common error handling block
(failure of DMA setup is not fatal for the driver and further code
depends on 'rx_chan' being non-NULL for DMA operations).

Reported by Smatch:
  drivers/spi/atmel-quadspi.c:1287 atmel_qspi_dma_init() warn: passing zero to 'PTR_ERR'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/spi/atmel-quadspi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 244ac010686298c58427fadc0ebfff5e62d18880..fc36751763887cc14bc71e2f398a25e56e9c5e42 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1287,9 +1287,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
 	aq->rx_chan = dma_request_chan(&aq->pdev->dev, "rx");
 	if (IS_ERR(aq->rx_chan)) {
-		aq->rx_chan = NULL;
-		return dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
-				     "RX DMA channel is not available\n");
+		ret = dev_err_probe(&aq->pdev->dev, PTR_ERR(aq->rx_chan),
+				    "RX DMA channel is not available\n");
+		goto null_rx_chan;
 	}
 
 	aq->tx_chan = dma_request_chan(&aq->pdev->dev, "tx");
@@ -1310,8 +1310,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
 release_rx_chan:
 	dma_release_channel(aq->rx_chan);
-	aq->rx_chan = NULL;
 	aq->tx_chan = NULL;
+null_rx_chan:
+	aq->rx_chan = NULL;
 	return ret;
 }
 

-- 
2.45.2


