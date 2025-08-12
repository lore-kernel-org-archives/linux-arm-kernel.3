Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0EBCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=; b=F4Yj1b6McM6CjuPt7So49yE8Lb
	k/lvBM3MY7pIkzXPlfB9l1fUhzbQqwwNBbkBFNcpcTOEeZOWCF5eDlie2sTWe+1SdoA3I+M7kkqly
	rGdXDvXPSvqSbVPChh3NUPSVCUAxibfTJtK3yVLwTqd2goE9v/6NQBQVKPLP9YAcmHS3j9HMH+0+p
	JEHw08vqkz15/xKwt9GXZE0SME+LWkRGoV+Hy1qbnqRuprgkQycpl4Q20ESJoru5RJsJzLkWDba6/
	AWcXc+wNQBXPV8dpWs6ks0SKsi8i3E+JnJq8N+eIUtvca2FJl6v2W4mPkG22WXI1WXhgHrjlT8eWX
	P7oYmDZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhk-0000000BHIN-0NwK;
	Tue, 12 Aug 2025 16:18:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullgD-0000000ARIE-1GRO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:52:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b78d729bb8so3034109f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754992348; x=1755597148; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=1d+9zSJEZxkpVMujCUa9NO33q3F1H9Valx/MkOLH4wKTC1WSV2doXzGk8WA4aBEx0k
         vZiLzcHIQMP2DdUu+sx2eWMscP0cpbNn56HDXPuBB0bpuNQTzJL+kPoNlGe20YitJqe0
         uib86ueF0mMGM+29SWRjssJ685jEh0kZDVG0TQe0y7EOXTyQXSTWas7iQS+OGWbyaYpF
         Fh+GkfEV457piUDpGrdrRXMmmlBifp12v3+Th1uqUgkvGvs6p921diaBc6gLm6Z8CTZH
         z+e9B0aeP4qTzeGHAO+vAjdB3uKmlLrXqKA+ZHNr67sAfKiCWn1ArwhJ80G43QPCUFkz
         JE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992348; x=1755597148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1M2z9RjV0ZuXBRlE0vMWSKVCPkQUD2amGo6k0F1OlA=;
        b=ra/RgAC7l4IhWGWbzDy+qB0qJT1LrTvSvL2Phu949Iy1KslVmkR6wOkPW2y7IKNEL4
         uvPaseFWfyRoMFitTt/fsR7tBHbbbQUPzWINYeir09jaKRHxgvq/I/5TxPV+DoqGXuxf
         LjWGPf0nwSIk2l1aEDTKhEbmCsv5rFg9uf3fnxyLADeFgNJpQCG8LJVpPVd9QfGsxNyC
         ix+V2qdGbVVmGiJWMAkrFGTrTMfw/n/6rGiTE+SyIDZSbUne5BNFt/GOKp2u757tehbp
         JSW4KHtH2hN4f+F4pW5ag+KuyUdQUKmrPhqlx3woEPq6bkHHUuowh/I1MydTZbjNlyBc
         xBXg==
X-Forwarded-Encrypted: i=1; AJvYcCXdeR/F9gfJBZXCL1ahU9q9Sun8MOvlNuQy7NXkmdwVOojGXmbXX+EqMoMO+nn2i6oLoJdql/2irUwu4T/ChktT@lists.infradead.org
X-Gm-Message-State: AOJu0YxhTWPjKXcbqRgHr9PjXb53rZA6ciDTbbcf+oRP21TQuljMMzpF
	ghUfwqU5SkslE2dAzL/PtC2+67a6hAGxhZaQWDlhTek9CTDHYm6SQmaqBZjOuwhvVZM=
X-Gm-Gg: ASbGncvSPO19JqPOEWi5lxhMkOCgcDelh/Zym7VO3YE+tEn9rqiOJNmvmgdVjxJe+cv
	1/TTdV6uJeyoMk66H6cfOpGhn6SdSKZdfvHqJPeGLg9Dnn8+yoC/Zl/ArBTXMJviV7fuMRXvw4T
	zGw50xx1ImX6rBWTuL4fRyzpmB2W1uKi0mxszM+Z+k48x0DDWWFNJR/4IA06ulhtdv5kvUQ7T0P
	his/CZ7ONJzjUX6GcxRu3JnNAWv83rnsroCG+Ef7mDFzuYlo6u9AHxoLJCAWutZmR6gVhLMbbfc
	zeGaVEM5r2XR9DT5dd1X3tv26bTfqvNHBLiU9EQPAp1tG+NeTpq9Q0F6bWDD3K1U9HvMIs263qs
	hF8oe/PHjo31KPxg=
X-Google-Smtp-Source: AGHT+IEaXb74g++gnnRWRNlRWlIzQG/C+rEn8w7KrjKK2Ka2Ylgk9xZIu5ATuK2+3VNjfEtrz9Ay2w==
X-Received: by 2002:a05:6000:401f:b0:3b8:5b26:b3ce with SMTP id ffacd0b85a97d-3b900b7a297mr13601145f8f.44.1754992347601;
        Tue, 12 Aug 2025 02:52:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587e154sm312580295e9.27.2025.08.12.02.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:52:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 11:52:00 +0200
Subject: [PATCH 03/14] gpio: hisi: use the BGPIOF_UNREADABLE_REG_DIR flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-gpio-mmio-gpio-conv-v1-3-9f43e95dea98@linaro.org>
References: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
In-Reply-To: <20250812-gpio-mmio-gpio-conv-v1-0-9f43e95dea98@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomw7GNzp6mz6xT0Tkum8iFoKh0J5iSYXuA3pFJ
 8nbXyZ4STGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJsOxgAKCRARpy6gFHHX
 cgxmD/497q2XFPdy3fQQUNTYyp+gDsJb0sHRX+VTofvSRmH0ZdkO74xDWvcSMGDe99ZcDOCO0UD
 osIU30qbFlAGXn8dLl36tH/G5aod0oTl1+8JsNgQHXnlglckq0lRPCzpSj4dCmYYaJLj2rcueh1
 7wWIEmGcIWObGgoYw2Ekl3HtMd6Lt2YxIia0e72oWpQbfhBKgE4KkSbyhPpFjDpunyg7MkS1zAW
 5cZ/ph/m2253NOMdtVq/aB8PHB+3H6A6wgWYBJQwXRhEbdpmaiHHRMSi5G4XSpX4T2z/HRttXFp
 5EsQVEOkQt0OA3Nq7DkVVxUns9ITQryOlUWR1gUf01eBT9n5cknde/JLDzmOQ42AN+vcEBshjG6
 yVeheK1PkKiwkGkrQMywnTGMnm2tWXDLbY+DPCRaHXjdDvfNm4RLj1zldaL6jRO/wGJI1yg0zJw
 ysOKCDzvnMe8ytfJYRgHcHtlmWvkbPksICUfGOnEdGGpxpDu6Fq0ZO7XA0cXgs4Xgi8GPVdnIgC
 l/4CILTByewxnpCVfniUzQT229274lX8VItp3Oiv8/Fjk2aOtH2pyn9Bw+MjZ3xSsOrcRFOgofQ
 hoduXd+dwZzH56V0pXT2koOAaHZUXIroGErk2068CRSi/2hUM46vDkKoE+L1xHOKCtGky7uoMjl
 Ih+Bp7CDME2Wxdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_025229_334518_C2355C0A 
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


