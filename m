Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93BECA100C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=18wUDZNoCbqEG6tqUCcwZ6EF2CMi46nnuyazWZg3eg4=; b=Q28GOBb/vZ9qHqjdpF/iJ2pVmR
	NsiYulfjfTiGSxKBNuBnnPx+VNZvzIrK55QynGbeWWvRv2dxakEzjkm9c+4e2imGE+Hi1+eNGHjzN
	cLcml7a+vpKX39IbLCzXo8NcE5Zy60Ki0L3n/yh79jupXo4ceekARxnJsCNOoLnt+4wvXvHDFN87N
	fqqL1dQeTyTGqBSZdt2BKaZa+wnupVzIrTFLWYWm7e/BT9YpIPcQa4qjlo33anwdcKPBSsns+Zms2
	qA5+ZM2GvZETrirFBE5FfCWgQR0HqAVZH8fcpSlfyqa/Jg66TrGExgihOMpjje7P79bWhNYoTdJSr
	SzwdMLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utjlO-00000005vWs-3EQv;
	Wed, 03 Sep 2025 09:26:46 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utiPw-00000005Lpb-2TN4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 08:00:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b8b7ac427so19081845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 01:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756886431; x=1757491231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18wUDZNoCbqEG6tqUCcwZ6EF2CMi46nnuyazWZg3eg4=;
        b=OjmALkjG3AEMe1EYHNPlQ4WXZmXJ031GB2bK4CjkT9wvejVad2DIlxbhCsxXXDj3Ft
         Lms1ZvDhHV3EvoaJpH4gZv3SVdTw36VxqKSZakkUUm9X+qWpmFTK7Ez/bx/1CZ/kRNEC
         BmiUsTcxulUAFErpS+S9dpcTAKhr4W4QmaHxpFfi8rkhZkp2lFK/zsbwc9b2qJ5xjVUK
         aFgTRU1LKBjTX/1hO7MmhcLh1qdTatwNP0GPR0/Ls1WS0quqHLGAjIX8nOlkys234PGp
         XjgGKdsvBv0dXiLt1mxClWp+vSw4FWo9EqAHV+cyrV9tbXyUfndG3XX7eAg+lByzkCQL
         3luA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756886431; x=1757491231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18wUDZNoCbqEG6tqUCcwZ6EF2CMi46nnuyazWZg3eg4=;
        b=bqiA2MsUf7jw2MQw/nL5rpDvM5b62LcfgRjIQLZGAWCpkNa3xGJA4ysJgjwZ3ptj+C
         LP4XsNWXJXo2EOVdtotNgVpX9tkKhtsBZzTW6WLPz0/J3bY1UEkrrWm8lJZChxdTbeY0
         p2RfEAphWlrk1JINn/zpx///Qm7F6t87JzcpspoErqzNYzW7/fqKbbAI732yYelrmL0N
         JDbNmybG5dgjbEiyKQ6W9x7glrrHcBXwVJydSEkOpiNCvN0SJTHNI3G5ebB9iZUh+l12
         d6+3SkjSeyRoOgvg7ShGvRJT6JtZUIE0lDXfwUjrtqnWY9ZzvHd8fiK22eKXmxQa3qvb
         Z/NA==
X-Forwarded-Encrypted: i=1; AJvYcCXHn7IHhrqmW7t1CkL9tQRDPKLl51vzq3pCpPbM2rSCltOn+qwgGtljzuNnqioaAUIM/Ss8tb8MiLRz7BorFIt4@lists.infradead.org
X-Gm-Message-State: AOJu0YxFO1xWSYwAxTxDrcL1tYpdlUcuIkonTFh05EUSJhDAMWSzqNYq
	q5WGXljly0hjRPOpTAP8RdQxLKqYRbag0pBxvq5ggUn8yBDvgGxe/kMwNmmUpqMpMWI=
X-Gm-Gg: ASbGncuXOkqhtjpUa9mGVxKYBUcIqlo/j4yU1MW+y858N45o1vTRrkTASNO6F3OJhgh
	vklx4u2ki5uWrVkOE6vfKeHILBh6PqAHZXTkMd+JYxZ/wb/9SltAbCThgc5KU3samC7jLe7FepD
	cVTGHUKUPpdxYG9URwmMVW1/IjxMbASLy6srhWABq4M8z8Ug25En8nyj8BTMr861WUqO/X1w07b
	sOV2NhJ1+ryqLIsve2e+PBcOHaaLIzyw89MSmhlC3wZkoCVXvFY8hwRgYm2rYHIKFhJiIs1uOYx
	OtFDl/lEDZ0ZDcroeC/2Uuh7nBm7EWRLPf7zhMFuv0dRWgdRaAZIKe1aiyoGecsVY2PHa+wDWZX
	Cd9R/UpM8GRZs5BjC
X-Google-Smtp-Source: AGHT+IF5KpHSkjjzJJ7M7jfgIF5Fx1K+eiZBRp5hE9btLtkWTijcKBFpACkt0UwL+yVIo0fMGVn6sQ==
X-Received: by 2002:a05:600c:1c15:b0:456:1514:5b04 with SMTP id 5b1f17b1804b1-45b9353e825mr48986465e9.21.1756886430953;
        Wed, 03 Sep 2025 01:00:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2f8b:4799:6bd6:35df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b83e954b7sm113331635e9.1.2025.09.03.01.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 01:00:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 03 Sep 2025 10:00:13 +0200
Subject: [PATCH 09/12] gpio: ep93xx: allow building the module with
 COMPILE_TEST enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-gpio-mmio-gpio-conv-part3-v1-9-ff346509f408@linaro.org>
References: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
In-Reply-To: <20250903-gpio-mmio-gpio-conv-part3-v1-0-ff346509f408@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=662;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=RyabPByGikXCRgzs1yNMhXnICz9jTd5ZeCItLmkI7LE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBot/WSs7BrYudE/MV1P1Rz91UsCyzxCl5FxgCJc
 nZOU6oYImeJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLf1kgAKCRARpy6gFHHX
 cunLEACakmrfrVS5eWsQLoNk8R7Zf5LSFhgcD03hO4jXvLeHunckz0WUwYEgk+ANWT5aGf8cRb4
 biREJ6YbDPXpXvjo4jI8g16RHULATmNewkP+0uA2By/zyKKQ+t0BpYpE4uwTM6sUCjznKjfuOYz
 nYXpr7ONFzhBcMa/DVi+xS3tynC7ZlXa2J4rwz5YBLAwiiCNfEu8wmSqjz7m/YBhAnKfGA+YIbp
 GTmV6SA2D3WIVVFvoWlJKM3arEmSM6sI8oQMMunl4B5t/cf03KQAfqHFHmIruWLcrYRdPw3e6rl
 TXszTmHehIC7gp0lOJMNpyJsqjKhuXN9oz374CWeolahMsBiA8UdlpP/wyrD3C0gkbqgBlaCChz
 xgOe1bA+zQ47AZhsNTRaDGaoq6FwcUBbK2os/KjPsPdc3y0pzO1EVqiGwH2KJG4oMa7H9Lu93qB
 hZG1+JAP//Nc83iMXLYBNBn24HzlQF5rrccHBcW76Nf9HUQ26uvm7I06CAAhGikl5EDAguOfYzl
 dDGqSo+DzpohslCLolSytFn2muBK8hSD1Xfs7NfMF/KdQPXIoU0KnX1aO8dkdC0a5suNNT40BZQ
 KjaDIN6CWTm6Fq6B8FjmmQajFbDhP100T44TDou/G7yytDlFzNHw9ufv38v3yhDq+6KsBPJ7Ltq
 x32uruAOOcF7Sgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_010032_640383_41AF0C98 
X-CRM114-Status: GOOD (  12.29  )
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

Increase build coverage by allowing the module to be built with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 2fb77eff3b1f2e862a81eb77f2d4d8f14c27873d..08e1fc13195452bda347f81a3552614d8e603bd0 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -303,7 +303,7 @@ config GPIO_EN7523
 
 config GPIO_EP93XX
 	def_bool y
-	depends on ARCH_EP93XX
+	depends on ARCH_EP93XX || COMPILE_TEST
 	select GPIO_GENERIC
 	select GPIOLIB_IRQCHIP
 

-- 
2.48.1


