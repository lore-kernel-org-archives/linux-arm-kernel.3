Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FC5CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=; b=WM8OmGF24MflsPFtTKVH0VmM2L
	lDU/A4af+N2ZhRLGl714kPC7/B7Z+nxcSDBa7RLWfgifRzW7YH2dOTMvJX4Yiz5AeOvc9TrARYS8Z
	DJXdLjsfx/iHrnkAWVsOEoIAS1J57J/Pn/vTllAGpws6SMCTXZstj0d2x9S7bERn1ltUBW4226lq3
	Olc2kObuqdIqJwlr36ranFY9l7ol8bnlkwAVvsM2I8r+/+Z44hdJgAGStCJ2T99XQAAWHV2yEtmkR
	R/nYjYx6CzZHzClyVbaKZSYiIrYoCMqZ9WN612c35YOyQ7cTzC5NBB0H6TxunmAUtI32zqXRMXn6/
	lP+yPx/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhr-0000000BHOI-22sU;
	Tue, 12 Aug 2025 16:18:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulllm-0000000ARvI-40Y5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-458bdde7dedso36073145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992693; x=1755597493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=NF7jyuAtA3Y4v0FcElkbT68LK5LIQxNXJ7xH+cZV4ER3up6V6UzhvCp2IhrnKC1FbR
         BR9j0Xs2yPDiuAVgOLdjbJ1IGZVC0YkD9ILCQ+hhaFbsOIhCZrOgyT0vcJtFMtaaipnV
         tK5JgyvY/l6Dtg8UzM3HrVDf5mu2Hkf7jZRbXkhw64nhJd8oAn7rKS9oWMuBZLoVRwgy
         qisi4rBllQ6HXV0bqmqC75FQYoWGBHaGa3azd2i4l0YOo25V/PHQggWvAAQ9jSxr80+/
         WZMWRDaP0MT1nJ5t+mWRMeG1DgJXDLkH60liCWWCOMm0VrVCMJU8MNGIXGjTaE+3JTsJ
         lbgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992693; x=1755597493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=newa3TieHssOgSJ/d7I5DJtJyLWjT+9BkuwPCMQkc+EsISdSG9j3Ge9YbeKpgdmR9y
         kpj/7PbSceIKdbI6OOGR6/IdA0DeC/JxTB1vg9SMP/wMPVqfOEjHSDOWfW5yhJc5HLwF
         O+/aeGkFsS12BMX9ZCpxp/POn59CMigcD8GxwVdH+AC9rMnZiDmbd1aJnhfkjm6OTeY3
         eoKUasj9huvUsmCZnB0eYLqgyw6qpwi8AgWsAyAbdF31BZo20j6knJK2UE6OyEXcTxSL
         YL9kQ0Mh4rV0hE/HzpgYScevrSB5P8Yk2ORqyOXgJl7nB/SE68iyB6NlvnYLWuItcavp
         pTJA==
X-Forwarded-Encrypted: i=1; AJvYcCUR2zIaOW5feJsifGWrTAMGoiB6fb+IXDjAThJsOOqnQd8fBV2Fz41A45/hCDI4AfmBl5cf0jSbhxNBW1gNArFj@lists.infradead.org
X-Gm-Message-State: AOJu0YznXBQR2Ulr8hLa9e8lK2E/+GQeY7AH28P4us++jSztN5HPSGh0
	AgOvZhXfpRDVkn6XiwVVEL/XF3XVhWWR10E7s/vg8kVXkxE0uviaSMyEtBckgelOaXM=
X-Gm-Gg: ASbGncvJITFSnFTzLJA7bhnm2/DoN68hf1kp/bh3mA9crLBv23ioVVh8RO6Rsj2qmY7
	3xRiaiLlV52fYB+2W3z2KRf1czxpPP21TQvkWHfLM8A2DgYYOA8GQUTGiHfouCjrUH+XwbY6sRH
	fWkhAkTMT0sei5RKKXH/9x6aTD3NBCgMPmpmu1VsVslxDsxhySgs/w5mvToRvTKNiA6SrIxjo7i
	E7nGOM+LGo7YTf924ayWlLP4LOy/ykmDbHrXrKXWiKnlNA0RZHpWyLe2seESv2IYGUw49jFYNfR
	CrH3+DIdgdUTCO2696T+21EFgL3b+OFaM40QNXbje0040G1b/nKPjY0aM+yboBIhLuYf07JrqCx
	YdZ/leywhKtj4KVrX9yR1WZnJ
X-Google-Smtp-Source: AGHT+IHrrvfILBNWEhNV7XMQSmR0S8nHoKaZJjsiFHryRf1RqUPgUP6MkXc2ValXGBQCI1vagLTAeA==
X-Received: by 2002:a05:6000:40e1:b0:3b9:48f:1960 with SMTP id ffacd0b85a97d-3b91100f193mr2267978f8f.49.1754992693349;
        Tue, 12 Aug 2025 02:58:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:57:58 +0200
Subject: [PATCH RESEND 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR
 flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-3-8492f4a4c1e4@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-8492f4a4c1e4@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Hoan Tran <hoan@os.amperecomputing.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Yang Shen <shenyang39@huawei.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=LGZlUs6AQDs8ng5Nn7ommqnFHh3w6/vhUJqzq5JniBE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAmHBp1qfofMqe+al1PpQUT2nv72TJvV/tSC
 dbDQW6TtPyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJgAKCRARpy6gFHHX
 cuEuEACD9yCaDP2SiUwlOEFzSZLdWmr/Aao5dlNo1IQ84lWUR7l/e5LK6BN6YMzKATYfiioPgaz
 4V3/DFMPo9kfYdzp0l/orxKzYWGpveBtOuL1FXuCL/boOBtikj9G7FXzp0iRcdHd9bTyUr+c/uT
 SXRr2wsbX0eY8bSrjfDBbmTKDLs9tFlKrSZVW8SXzj2TqXqiL2KopwLFHRBMXKGtqdRG7cEthcc
 7nkB6HQ2h1y9Kl4HNngUVJVCIDBRj3ujuAQrxGgiLxN2m3ENkf3y4DjqpM3S+XolGf3Y3Om84/D
 CnqLQGvSVp4I2xLC36GHRf48xuo6EirL+ttZlCyQyEDQoeHYU17c+3osUGC3oi94llnqYMndyey
 vpUZTS/6mKzIC84s2vsOBoLHYytFwAWfDj6Ox/fLDJagdB6tFI0rcPaSd6smM0E5weHAKuNu1fU
 smjz0mME1HDeRVATjQ59yY/ADLm5eSifkk0ABGIEqaWvJSa0+33NEL27OPWz3PMJ1twrCcOKCF8
 4WJVuzyRaM1nSm2RB2Nm+jKBf0xuEQFFaCljw2FYqF6mV9zBYEwbrb5XebrAb4rnFpG6B/Xb54U
 cwJqAmYkYB2S3utN0Fq2KpJ/W48akbXxxUT/4fDFjtsSMcLs/Bm8sVq/o0T76d2zoxDiXdpnv29
 C29VhwWunWo/dIA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025814_989185_821C89EB 
X-CRM114-Status: GOOD (  13.93  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

There's no reason for this driver to touch the gpio-mmio internals, we
have a dedicated flag passed to bgpio_init() indicating to the module
that the DIR register is unreadable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hisi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index ef5cc654a24e2327510b872563e68fb0b9aaef71..6016e6f0ed0fb80ea670ebb575452d9ec23976fa 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -295,7 +295,7 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
 			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
-			 BGPIOF_NO_SET_ON_INPUT);
+			 BGPIOF_NO_SET_ON_INPUT | BGPIOF_UNREADABLE_REG_DIR);
 	if (ret) {
 		dev_err(dev, "failed to init, ret = %d\n", ret);
 		return ret;
@@ -303,7 +303,6 @@ static int hisi_gpio_probe(struct platform_device *pdev)
 
 	hisi_gpio->chip.set_config = hisi_gpio_set_config;
 	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
-	hisi_gpio->chip.bgpio_dir_unreadable = 1;
 	hisi_gpio->chip.base = -1;
 
 	if (hisi_gpio->irq > 0)

-- 
2.48.1


