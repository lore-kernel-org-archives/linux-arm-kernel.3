Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D96CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=; b=LVgmuWa3T9MxATqqKUZvzviYjl
	w1TCclr7kiCf8yWKFEfY/Yy4GcmuAxK5KyVmHTuPDlI/O8v/xIdDCEZf+sb7BY3RJ2k0FDJejjl44
	YZXXCr8zItQ2cyuj/VL2+cAtnxlk+NNBBGTJoHRGY1MREqS4eJUC4Y5jFJoRgTx2TmaNSQ8xZbqVz
	CsIUpBBVasAPkAGsTYuYoRguM28lR/sXnHpg0vbc17D4yYm9it3238POSuni43B/BFd1e06SkpZYy
	L1CXKFuFlVY4RWPXpP+WWNYagSFXmz7HBRLrv4bmuhDzT01L2erxb1ovPkxcnsSjRMoCarp8FpI5s
	VeA1uvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVaG-00000007n7y-2pWW;
	Mon, 25 Aug 2025 11:41:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqTov-00000007YEw-3gcB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 09:48:59 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45b6278893eso1012135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 02:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756115336; x=1756720136; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=mezoEBjxrjcT2HQ8bNIrDOEkcocT7sGQXpm4qPpOqRgKpOx2AhT07/WXerlFStWpue
         fOey7Z0WLV9jEVhJmyCvGsqdrtyLlZbWg5qAPnPULHfjsZn0Kx08Ty0TTx6L64umHj7R
         SXtw/CFTKmBwYFAS1nUFpmHgZsKwNhFDdelMNaCx34CrDEBWO0vaGb/OC5tSbGn8RsmZ
         U5bPQz5Za9+ta4FSuKjV5SMjWVqyOvE44h9HhqQqCY+KtY+vNz6nFtm8XUrJRP4L7GlQ
         zI5pyjx0hAnDTxI1Zaw0pyGTkX/hC/Ut5g5bBW4cdN8zXiwJl9cyRw2gxJB8rsL2Lhvo
         LwCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756115336; x=1756720136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kI37g+TGqamMTbBje/mg9IaGEYmRq4naVS4/zTf0zA=;
        b=wYfmgVU6ZYi8g5qJWGtLh6nALWvbYm8TEwbFROxEIIYxvBTO34nxuhH4XxOEDI0jfY
         wFbNJ56jNXr5FQE7GfS4W+sWSTeaacvWgaNBIuzpYv19GXHtTTTz0lKZVNHFf5rUbvaO
         nHu41fFJ4iFocxyjtxNwUePM7kGdD7XJfVZjzzkCfSmwC879bSFo0fnyFLnEtaaGBN6o
         vLavYZw7+YYZE81llZyXdnFIgz1Uq2Q9DVXISsQtgNW/cZQVoWi/yF5ssy83wvBJIKN2
         L74PVKHQuICEhMO3oqsuTtP3NmZc2lKmTY0Fy9G1xq+fO1KNtMUAmW4tKnxMrCno/yXe
         cdkg==
X-Forwarded-Encrypted: i=1; AJvYcCXvG3Fc0FdG7r0iLFuamA4nE9CGVDQqGx+rLB0h8uKYyjjV8W+JAs1+5uxOjVN2vb4D+Gwj/STs7+TCrGCCSPAx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfof97JMdfwL9HSunhnxJZAUAg/khJoPtH0J29UGzXZHlPVL/q
	oQuX8ZP3S52KTpxBqGqQj608QgWrwiXFdjTYnpZEj5Ya1Z0DznOslWyplLtXDOsAuf4=
X-Gm-Gg: ASbGnctas74EwLFROYAupfkL9qaqXrwcLHXzYJU7nlxZv1smxVwCxGp6ydk7NR8I1BP
	y6HjmzqywumInOvs2Ran+3gmS5avOhCGnUhEBoSP+J7/TE9ERJb42nMIxMi3fMP1wSdmZFCXfqV
	wERSAggvbXvkshAouBxZAMjYcplRbiwlg/KpJBt56QUVUDM9J1vxDmVt7OPLDrc0JGDfM8pDXVB
	mojEbKHAmd7lQBXybcEcoBluRxDINCtPzwmxSN9EYg0BMwqqMQ2IGaaJjzXDniE1H7oLnnOFGh7
	kycS/R9PVVEeoW+GOeiiCLMtYh+Bth+1FS22L1UbWrOsNoGVr8UWwKFqtswVwuSu6iP6uQR+NSF
	gSRSAQiCKjN0ZzN7T3wY0oyw+ntJm
X-Google-Smtp-Source: AGHT+IFBJgx4FrBDAeV7RwKnXB4SffTSOqBH1vBajjyVNmLRVpOgheodFv/ptAil6rsqIWLKje7MnA==
X-Received: by 2002:a05:600c:45ce:b0:459:dba8:bb7b with SMTP id 5b1f17b1804b1-45b517ad7ebmr96898065e9.13.1756115336507;
        Mon, 25 Aug 2025 02:48:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:ef52:fc8d:34ad:9bfe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c711bb1e3asm10877449f8f.57.2025.08.25.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:48:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 11:48:47 +0200
Subject: [PATCH RESEND 06/14] gpio: ts4800: use dev_err_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-gpio-mmio-gpio-conv-v1-6-356b4b1d5110@linaro.org>
References: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
In-Reply-To: <20250825-gpio-mmio-gpio-conv-v1-0-356b4b1d5110@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBorDF+8MVnWu62SojaCwPXpE2o9XMFUOy/ngGTn
 33rOc9+sWOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaKwxfgAKCRARpy6gFHHX
 csMwD/9OBeg8LCNmIrMJvqordPa+1PIQrwXU7oe7UmmAIOXFub+iDU4uYpvKPNSwH9F4ei69RM4
 fqo39MKqN1YL/FIXHPkGIu47yS1arMAJeQdeio/KF2NDBbfJXNzY5GvsZ21PIvVDjcvCNKVuS/V
 nrADfS5P1szrVWjrwR/Nn/W4NMyj+r7ioTNEipaa3d7giZ1pDEoTy2zlcyXfs2zEEcNwArwMgJM
 f/dGdlxFI1MJN5AOwwIyB/nKLg8vMHxNkmiYwXY6k75S4Q4kATCltDdBYXz9/cNOW/bycc2WpGd
 0nfudGpSYFUYvsOiWNTyz3A+7o9duScuKQtF6WhEUgqySYrs3OaSBJQFhUg/M0lchiI8kkAZ/Uq
 uxkAEyMy9AlSUaGAL2WHpNpWyHSYcrsqT+ycAE/rDTcv8lhhMf58QxpEmLHTGe+u+AV4xiINPHX
 Z3hUafIqsO6ee+MXUQJOAAy9Y5D0+9doWoayYT5264DnK/tVHdZ3HOfkuXEsbue/d2wL94fpoBK
 AzG3FivhUAd8v39Zh8GszWBQUfCba1xaG00nvPF6u7Hi6o/IgdgN6VE4ZHcYz88GooWrBUjFhLx
 leN0gQmcH95+fMEK0Mk+Wv6B5poKD1WV81lVAscPIdkY0nrtxGESK+DWY22kRFp8H1F7b/lV2yb
 6Yxh0NqHcK+jjug==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_024857_927256_E4AE0913 
X-CRM114-Status: GOOD (  11.17  )
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


