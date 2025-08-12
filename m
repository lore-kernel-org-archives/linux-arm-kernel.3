Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCDDCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=; b=lFdbRp8V5YmxgEPnqEtEfDSFy7
	Kn4cAoLWNa+yQ/I8A/GUew8MVaR93+2jGI3EOCV7SOSBVEVvdwD3/7iFzaTBcXF5RVKBwOimEDoPe
	tTNOJqk71mHU1ABIH2WiYFAHbW5XqmfIXpCC1iSzWuZTN8YmlZaGUyFLs66eYEVduS2gV8VHDvoyj
	utCpN5HFIRKNlFf5H49dgnIq1H6rthozUkm5H9RZfHLILBbRXfLg5wHE6dt6zxyiA1ri1KtfDgvph
	6t/VKEyn/w6176gtkQyBzWZarMBZaIwW3G0Hl3pk9i7hUt14SzfJUO37TTZLBekpBzPsU6f3sNLaZ
	4sVf3u7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhs-0000000BHP2-0fH9;
	Tue, 12 Aug 2025 16:18:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullm0-0000000ARzX-41v3
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 09:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=; b=WQ3dDbVSHtyeVgrI4mBq8IU3ez
	syZp8+Z12X3GAA4YtFkie+SO0Y51nhGXx/NTNiOO4MZFIt2oF9kx+8FP3K3fM9xdD0TtjasAlmFg3
	cNWyHDRC7Wc8VvfhT0E+F9T1Mt1dSzl1PHGIYhS1wWHl4dBfVB5XVWLfHV23ROQKo7ZCw9EXQ1eBK
	r4fRzMzbWgJZXDIR6E+YSWaEG7NIjp1pRokpUh5v6Gk6HZj/QXnOk8jQCYpWcfMipCEBfFQYuP62L
	PtnhrAUTA5BgIyescgJn6dptyenfYzoo1dhZlnZH4JWWHPUfQZOazuyptKGocU3dVe3Oh6emWV133
	IXyEuFJQ==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullly-0000000FmLM-0AXp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:58:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so3117488f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992705; x=1755597505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=iCMjrwcZxOf4DJR1nnJuCrPeBpBVEEUkcz2gqf4821bFYuzNc8ZtjsX2D2xEQTsrhx
         9zN1XgZAFKIzw9CzkkwNbM3USni0bqvENpXmuG/tBbw8rHx15p703kzRJ4qpvcbDLhkX
         Bizk0m011aHwJcuJ8gDlYZFuNXaNiPS2Jf8yx0igawgQHZcwPnwi6NrBrlaBJ/LN9WRQ
         wXgetUOzBtZbiOz1Yy7V3lHWCa3GJk17DcC+O85Zcm9D2g6daA5zDLGRB6v8Us0vN7g1
         SWwrbOwJugdN2Fde9r5ICR0p/wApQKtBt80qG5nF3pBVvaGYt3Nynx6W+2vveTrXoBk9
         U/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992705; x=1755597505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=tZRmmu3eBlubCp1SjXaD3NmU5T6xCxTvFmdSlpWAtoGMHuGB7nSvyDycHIPq2VD7kn
         ZqZY6F3nvvzOAAKZN6BVNCbqUsqiJINjmKl6iY46got4sFygMgn8Albi5ODmN2qkrBTT
         INEwZGg2QLuPd8VKg16WqNNJDGV+5C48X6DjF/r7sKCb8EIev22zRKxh+Tndxt4NrDai
         DxvfkGadrr/X84UiOamupSnBSXAnyWbaE+nahV0PCiNJlJDba7J/6xnY0qAXOcOEtoIW
         ojQF11cOCFrjdz7z/sAueEMiKTMcYrOg/KAY1LZ7sn/9MSEutEFe7YSkqTzgPKXfQRz+
         43Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV8mNZUerhTHazzG0sEriwu+TeNI75rV+tkkWdmQxjrtvhx3Yim+tfE0dpHS4Mg6hQO8nSmXk66RrMPqKsuSUs5@lists.infradead.org
X-Gm-Message-State: AOJu0YwRdxpzByQu2geHq2AkeucsVcmU0T1ajFe6xCk5zpKkIPsdYNiH
	ya7G7z8xwOP/+/PqZFTeiz00Zhg/HLTVRvJYJHM6wLaBSpq3Jo5XpA+ZUcCLc+PFShk=
X-Gm-Gg: ASbGncusUVbarng2oFwvFdoo18AJLE64ao7bs8zU53ML3e3w0NWL45a9IVtIobX7xPU
	b3vCdjFq92CPFUCFTKaom5zVa2UOZK9t8aiQzA9b7oHRBEDta+0N46cKNajLNN/UkRiYz3vRtpp
	XePCflbqCsUML5JO3rhFGls8oT/MoS40SXSe367uLy1Azcb6VBesjAcVmqBBeebzid/4guq9h8u
	uOze2TGnK+NkKME2y4jGH10kqhjhfKUJjO41uKSA6GDLxHdXuU6lcn9/HZAM6MVZ10cTCp0Ywul
	IEhxqEHzdfTGt7f0RxmHRTQ2MRw0gxMqrkJsi5Dytxl6HCm7am6Xf8CvOdO4ksyze6Q3tvWVCJ2
	HHz+YO+El3b+/yQ==
X-Google-Smtp-Source: AGHT+IGP6L8eG0JfYf/ydIlGJwEs9dkq2mdBQy1wTn1tOHW4K8UU3R23oikopgJzhNuW97eM03hofQ==
X-Received: by 2002:a05:6000:402b:b0:3a4:eb80:762d with SMTP id ffacd0b85a97d-3b911041c3fmr2577263f8f.56.1754992704943;
        Tue, 12 Aug 2025 02:58:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e0b2d2fasm33098977f8f.50.2025.08.12.02.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:58:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:58:01 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-6-8492f4a4c1e4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JVVbThM9xH2PXWbYe03tJE2jElHw1ibdCVrW+ltAkLs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomxAnfJy2r+LGJ2kqXkPK0iGECTYjbI4ZXi8XQ
 KNobM92MTyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsQJwAKCRARpy6gFHHX
 coGmEAC7sc5BuPuG0tJF2dz12GRlFExbbIEHvMu4270s+8nuFbTe8gz4pzYdDx3Qd3iIdDGbp5R
 3FXZraTexU0UkjkRcpn2KWW/Dmt5ujsOIF8VLx9YLezeVFMZC1LKUFE1oBB/CuCAbXYGOnkiVss
 q9rN1QzVDkq04yf2txNXD609dPsWbEV9mXN7WI0VKtsf88eaZ/tMH0fk7P8QDkdEwQGar5jpgsM
 41Usa6/AteJuK0Po8IqVv5FKaukQbBd2g9ThELqVHxJ5To1Nz3mbB3Yl3uBx/0QnxHWvTJK9SEm
 MeglxEIf5uAtEEmDEpzNjW96VWc37FxuqpRMDTNuem15i9wzwoMJbiN1/J1KpKO66XHmUhO1UcN
 jMMSxICgkvvoi2ZDk0im5GQrWBbO8jnnnDx/31AHXkiAu0PX0WMMC4BwzpUt9JmbGd2C0ftb8m7
 tYMKtLXaJPXnDa99s99dsk2A2Gg5Lwhq716FETe4pruxfzf8lrZlUOvGoO3tbHJqpUgljcSL4eW
 eTPIRgz1yalulrH+it7rq5BmYyizNz8LyyfbUhPgS818jJAOoSv77ZODkR3tkcJTmQuaXfU8Emr
 SMuwBDKYIimbJLitVPPlBrmOLUJQXno+8OjNENn+s2pMF7wNn65b2OGUEffsOmmWre7l4XGlXnx
 u3F5tCkza4Y7BfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_105826_377705_2137EF20 
X-CRM114-Status: GOOD (  11.62  )
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

Use dev_err_probe() where applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ts4800.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ts4800.c b/drivers/gpio/gpio-ts4800.c
index f4ae87325393c909c66eda3bb7b2f849e645b7a4..cb3eeeb1e9df9aa687e880b16f8d0a31b04a3b07 100644
--- a/drivers/gpio/gpio-ts4800.c
+++ b/drivers/gpio/gpio-ts4800.c
@@ -40,10 +40,8 @@ static int ts4800_gpio_probe(struct platform_device *pdev)
 	retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
 			    base_addr + OUTPUT_REG_OFFSET, NULL,
 			    base_addr + DIRECTION_REG_OFFSET, NULL, 0);
-	if (retval) {
-		dev_err(&pdev->dev, "bgpio_init failed\n");
-		return retval;
-	}
+	if (retval)
+		return dev_err_probe(dev, retval, "bgpio_init failed\n");
 
 	chip->ngpio = ngpios;
 

-- 
2.48.1


