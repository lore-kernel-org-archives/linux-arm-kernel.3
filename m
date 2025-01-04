Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39BEE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 21:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XLKX/DDFIRPvx5t6DaUjc92tk+3Aa7daTr762N5Ifkc=; b=Duk6fRLaKUAe3fBgajE+DmunV4
	u8Pcv+CKXP+2m7QMG9n4iLFmvmA27OX4XwWBUerI2bxmNRbxVYKskgf2IvdXLx7Ot7S+3i+fFDWuD
	RIcNKIZfoGkwpxJz0JlEvzpCXKih4DLv734gbCjKtx/tLnl08gqFc6bZG5BjsSIXtQce6HP3rjdyL
	9jTPi+0NYlEh4DPxBO6au7kV451MEq8lqzVbzfZV773tdrZ6WxaWLWwvj3Y13OEFqJRbSXUccvKUM
	aomjGK9blbDe8urahdBnRcvP8U72BqhXCOzvUF92uOKhGImTiUQVMr5XjARIuR7WWBOdFCvR+iOAK
	xTlmIiRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBG7-0000000FblT-1F0g;
	Sat, 04 Jan 2025 21:00:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAT-0000000Fahl-2ON0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:46 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d0d6087ca3so2765711a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Jan 2025 12:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736024084; x=1736628884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLKX/DDFIRPvx5t6DaUjc92tk+3Aa7daTr762N5Ifkc=;
        b=JV1YrOkBYW4Kk2SbPrNafhLNKYIyDa1eMofc9PxGA6XtODi5F+EC/lsy0YoyReyosA
         zGCzs91FmNMX65/JscvUsTWk0Cdt7vXWQLK3CjzQMtaoyRthhu9GotmUaQdz9pg2o/cO
         ZY+yfgDnA3AR6s5pljPEI53SvvKSiboThoPr7A2Pf4yWClHRKAtMoMHFHi1f1EhxFw+8
         XP/1ySHXBPE+ak9GLkApAHU+oyaJ2V/WeU6hcv/RSbcaA4gOB9orOvb/mH3KjC6UlDrZ
         w+E8COhNaOmOXKfqrMf6NsJ5Cbri2h17wCl+AO2mgIN0GBUDDBX1e2mQDkTlRUUICz1n
         oC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736024084; x=1736628884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XLKX/DDFIRPvx5t6DaUjc92tk+3Aa7daTr762N5Ifkc=;
        b=Tkru6A03+cJ2ZKcHiYXhNl9Mazo5IIpzd4rwgYzJusOJtFBigoMRU4SKn3cK+Ay5VN
         Jj4yemiGL3w4KFLUsjNiPcl+ClknMD9Agmo55VykJvpw9+rNZNvC7tzw/aaMTF/tCer6
         6qXVwdlX5WrQ8IPvV2xvgkaZTQfGE+iHT8h3DFpEoSjn2BX29NJcJuLlniEkvdx4xXxM
         mSRRm5yv6uhtm2nezmqZhLNBPmuurz7YD6uSA7qLjRqETrX1lUsqe2oUQXTI2xihZiE6
         03Jdl+1I+bBNT23jGHXi8E7hVPsCdXSsKN2MAhPsauC9MAICaoyx/E1zlTlE4t3Z4/lT
         GJFw==
X-Forwarded-Encrypted: i=1; AJvYcCU/VY/gFgm5Yiy7UWqI4d7OWeDjHdJKBAg3/oonbukgGvGMeJgeDy1hep7L1VrJKfmAnJ9I3rU1meYSQ2JD7y3F@lists.infradead.org
X-Gm-Message-State: AOJu0YyDbSOUEKgWqtg8QKPahrvAW6c2RP20rwGp5uS6f7LzesMBU4k2
	kXIqhkUtLiV+HtCvKFdFOjei/8KWrSqArC2cPD9WX1dPznzUEAOcvM/P10S1BQ4=
X-Gm-Gg: ASbGncuC8WuiFYF0uzefvKQpzu527+gHEdnN4JatEuXo31VM3GIwka895pBORtOpqAi
	AErr35hf7UHzqCCPGOP5qgBwBkNG6g1z7LtbiR4rSlMr+YW9XUef9PgczDi2CjI0kakuZeEiGl5
	+o/MQ6FwTGEbJxkAGayvxHIdKYvT6IGMsXuRCdMzX2aleRpm5TEhHfu8xFQBzCsrdeO4d8tgNMR
	WHB1d2icm5XAuhq87xQYoI6YuLk6AyaNcj2p/jEdxb00y7EUesBqN4hYVbX5hv7sX9HWN0=
X-Google-Smtp-Source: AGHT+IFmkhn29wqYEMmrNGScq5CXWT6m6SapSyW0XiDfeMVUzsZXK4EWiuoixIVsOEwexnWV5pkkww==
X-Received: by 2002:a17:907:6d1f:b0:aa5:a60:ad6a with SMTP id a640c23a62f3a-aac2d4472c8mr1834711266b.8.1736024083242;
        Sat, 04 Jan 2025 12:54:43 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm839666666b.137.2025.01.04.12.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2025 12:54:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] spi: atmel-quadspi: Fix printed error code during DMA setup
Date: Sat,  4 Jan 2025 21:54:35 +0100
Message-ID: <20250104205437.184782-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
References: <20250104205437.184782-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125445_605272_EE1851A1 
X-CRM114-Status: GOOD (  12.91  )
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
index d135cca4e454..057bc20a74ce 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1283,9 +1283,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
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
@@ -1306,8 +1306,9 @@ static int atmel_qspi_dma_init(struct spi_controller *ctrl)
 
 release_rx_chan:
 	dma_release_channel(aq->rx_chan);
-	aq->rx_chan = NULL;
 	aq->tx_chan = NULL;
+null_rx_chan:
+	aq->rx_chan = NULL;
 	return ret;
 }
 
-- 
2.43.0


