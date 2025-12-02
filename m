Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323D8D116FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 08:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=; b=Si2jWh6+ugKeIu6HbbdX57foiD
	N6aAEaGSbJbZUXv4UaI4BihtuU5BR1xZANeKB3+uwfiViR8hckEVQcMDHlUnR/JaE436ENAsojfFf
	haljT1QyhAQCaHcIY5sugi+TF5PmPBGRGIx5URrYwxhM8601S/jzpwuh/T2PZ2Cm6C8DRKnz5gG97
	36kYpKFTcKkAorRHkqrgr8lBBOjeLZ+RIT8Vv1OgFz6YJ9p69hJuSBQf/D5iRmPphOW5Jg+iYdnBo
	VHWiuEOIR3oVWXXooa8P2dWfcNeuRIt6PDfV6COSMAELKPUGN0KfGh0mNiyV3Ijpmd5Y7y8yYk1mt
	yHCdBArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTi-000000051y0-37gj;
	Tue, 02 Dec 2025 08:11:18 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQLTg-000000051vP-4Bvf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 08:11:18 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59583505988so6586302e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764663075; x=1765267875; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=eqtsQgN1wxloGAc6mALX8iPZGI1VkI6/Z+xtHmFIvYLWYfN1E8keipKlvvbq8Ju5Gq
         ES7y+PGIxnCoqe31Bsn+X054cCoVthmr7gZsRj+mJpPU66S6ZeoxmmtZHlkshLbgLYG1
         L5ZgISiV2mmEndHXJLBC1SMRhRe+f8BXuUPmj7TlWvJieNA8JXZfbgaP5JSL9Ci44LAZ
         iIe3aKdhH18lqYWf/HjE2e78w/Y+5FXXvWE/2M9z4qI6ulqKOGIBviNEYzLTh+rd2aeA
         DJTGc3+QgxNcZY9Ckss+WGPBcxKBrXiKDBFyEIQ9HSDvnfikhdopGBoqCia/PgCxTNC0
         2mzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764663075; x=1765267875;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adLvNDTeiStKP0eZHWwvkkAFK5IxR7T1lQU7JiLOZOA=;
        b=vIZNMDnKlqBrlimcMpeC1NREm6t30RSUlOS+K52F/E2WgnBIU/w5UyWmMdDZxwccMg
         CJucUZn8bBIbOeZ/FA5Q4KqI/lJ42ywAREFqtrNYz9WquxOvU1sIOrGCYmfpXGw9jegb
         iBXPmqnkDbLYJ81vPan15a52hWljXxsJzoXrwiLcnCXbvT6RZo3WVEz+J66MUN+8avXU
         ZML4sJXBSMy1HFh3xIGvCHC6oq+Ld6uvmkaFFKRc7msdEmVvGWUWJSVvSVNAW+6QgTAE
         Uk/YkNTBTZajINQZT50PLb63XUmc1kSx28rDRvU0B14z5f6Dy71Jfc7/Em2CoY8kFFzv
         4WPA==
X-Forwarded-Encrypted: i=1; AJvYcCW1aGUCQri3vSY3Wrs5GwUtjJkjotJqS/k7F3oAGPpptWvT/6G2h2REwUm07ZWE3xygFusyyI8mjztFMdD8ZIQf@lists.infradead.org
X-Gm-Message-State: AOJu0YwZzv/BubICQhe5+XpS/zEX9mAC1avaf9e3/uR5EY6h/ogZkw3d
	vySqvn76SSOWn9+oQVdTiS69SEpcAZm9PZos373XpflXWfnvCzmTYAPq
X-Gm-Gg: ASbGnculLEl1RKvSAhMara72dvfe4gvGpwzgw63VxDoSchJFsS02APFiaS44/ZhWDTJ
	XYOEC/iDk2Fve62QMDgUWVYlyDk0S0j34RfhLzf0pIki3mKBgEyGWaJEuZQFi3xnl45ktv3/myK
	1SnlnA4bmQQJQWHLAkzVX2U/GeRcvDSZZdPAMk4pTtoLIo7/4VUprrVueLFSOOegkK+8MUYDZo6
	4y6Ev2gnlLTieg5LGewapBpHpzFHz7kpdg2/TcyiQHTnik4ot8eBfxpS642KftGpd8n7GoHly8S
	KPxX6UdSy1bhcT60al6AASAeGGwLesQ5f/SNscJF/jM4bSvDkz7RUcPPBBODRZ2gxqUmjNL8VhP
	h6SOZ5BDXtbV8g0EiSesokMLC7D7XsTPBr1Y4/ysRZUv8MAtjAPx3DzF0BhtKs8q/Nuy0aRxsbA
	zCLL9VuBkS4BPZoG/FV6+ODWhqQpkabvVesP8TQj9JRoHem+uLax36ulgK
X-Google-Smtp-Source: AGHT+IE/6Ujf/ndJP175kyG+RcorUj0UCUQD+EBcycMSfGLIB/MQTBPPzYVUYN1vTXHMq+R8Z5NnZw==
X-Received: by 2002:a05:6512:1081:b0:594:27de:77e7 with SMTP id 2adb3069b0e04-597cfb0430dmr577541e87.15.1764663074635;
        Tue, 02 Dec 2025 00:11:14 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa4f8a2sm4342412e87.88.2025.12.02.00.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 00:11:13 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Tue, 02 Dec 2025 09:09:51 +0100
Subject: [PATCH RESEND v3 4/5] i2c: davinci: add support for setting bus
 frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-i2c-mux-v3-4-877dcf478a9f@gmail.com>
References: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
In-Reply-To: <20251202-i2c-mux-v3-0-877dcf478a9f@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=PGfDlWvGSscBxbVs8v8ZTNXGs8v6TwzoMOGQNHx4lNY=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpLp8Qi2I962N48ZEi7OQaJbPonP2RofpIcDdIF
 Qc2stjpsfaJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaS6fEAAKCRCIgE5vWV1S
 MpjuD/9HEkKWHOP0IZvSLXAbb4TgULotS/GvAHKuELjbV+pQuEp20j6vtDCA6wZCj06iSNZ9ePR
 ek8ISCZzlQIutSBTaZNKOu4nQdehiSt2CksmXna0GE9ZQykzpoBaaxqgUF5GPGIjKO3l2CYbKXo
 0xU0lSoXtu1g0nHau5Pmh5YiAq8ATCyfGmIrdZ2xvadty8mnbmjsoZjzs0IorM8vBw2TnsaRGqo
 2HlE8c9ZsuGKLMe2qsea1LyC+keoiQJYwaDta95B6Ertzb8SSlgQYebIt5lDQwwi2O0TkRgO8jY
 emFyvKGvc7LDIkUwT/0Op48swG7+Fq1NFoeDyDjzTbBqqMXdGnCP7/W5P3/UFA4Q+VBdLI2McOs
 PvO0M9Px1ZizYBOG3fhDr2y62s8FEQ8tolg3sdnPqYreWGVzpyMhP6rVGtL7jcClL/uyKX+X604
 2Cd5p8n6skJuD8+mFxR+l/+dA9w58wrEQ/6VoTFIc1JH5neJ7JJZ+B9gEJ3onGZS9vweV6PrXRY
 nIM8FBphBbhuasC/rr9G+v+S7R/az0xJg0Lf6fp7l05klJGTKWM1U0rU/tMOp9EcurPPYNKc7hy
 x3WAJmuNP5NFXrcYPb57XNRuBE87aDHZYe/Y4tMclQPW0488mVo46NRjY2qXDnqZ8eICurOxJja
 qVdsLXxWV4ZU6WA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_001117_080468_8574FDD5 
X-CRM114-Status: GOOD (  13.83  )
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

Populate adapter with clock_hz and set_clk_freq to enable support for
dynamic bus frequency.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 82f295619c4d..fdde573eb59d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -279,6 +279,27 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 	return 0;
 }
 
+static int davinci_i2c_set_clk(struct i2c_adapter *adap, u32 clock_hz)
+{
+	struct davinci_i2c_dev *dev = i2c_get_adapdata(adap);
+
+	if (dev->bus_freq_hz == clock_hz)
+		return 0;
+
+	dev->bus_freq_hz = clock_hz;
+
+	/* put I2C into reset */
+	davinci_i2c_reset_ctrl(dev, 0);
+
+	/* compute clock dividers */
+	i2c_davinci_calc_clk_dividers(dev);
+
+	/* Take the I2C module out of reset: */
+	davinci_i2c_reset_ctrl(dev, 1);
+
+	return 0;
+}
+
 /*
  * This routine does i2c bus recovery by using i2c_generic_scl_recovery
  * which is provided by I2C Bus recovery infrastructure.
@@ -810,6 +831,8 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	adap->dev.parent = &pdev->dev;
 	adap->timeout = DAVINCI_I2C_TIMEOUT;
 	adap->dev.of_node = dev_of_node(&pdev->dev);
+	adap->clock_hz = dev->bus_freq_hz;
+	adap->set_clk_freq = davinci_i2c_set_clk;
 
 	if (dev->has_pfunc)
 		adap->bus_recovery_info = &davinci_i2c_scl_recovery_info;

-- 
2.51.2


