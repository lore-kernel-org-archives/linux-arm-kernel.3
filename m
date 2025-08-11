Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8838C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 13:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPC9QjkdXxMejFY4x5ok5uLAPYyJClZcqMLBbaZ87b0=; b=mvmh0oyL3dbS/6YKIJ6a0AYO4B
	2czSBbloYvrpCF6K3ye+K06ck2yBh0FYnHugfO+1TAMk0I2tLDcancu+gvF1lRgb2IWfhr2dmJ8MD
	jngET3FopFclyP4oVugFma5jR/GD+NVFFO4WzztvTXxzHIraP9FwvvpoIx/kiIuar6uKGPobzFCom
	v1v3x4XNRdYYXssqX0D2t0/U04GPbWLvCtrWdmeq/bdZLflC/tCUf/A73bD+zDhZnW7xFUtHMkBf4
	CgO9HHfoLJCHiGgVMGC82lHiw/RuZcV9ewYTkHVQGJZAiB1Md6BaFsRHLSZpfjRhBepgixrnTWT+K
	+BvFwrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSmb-00000007rYK-3oDk;
	Mon, 11 Aug 2025 13:41:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulShQ-00000007qf8-16yF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:36:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-458b49c98a7so27534435e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754919387; x=1755524187; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPC9QjkdXxMejFY4x5ok5uLAPYyJClZcqMLBbaZ87b0=;
        b=qGGhVKyGublvcgvgHIc5IXdswiPdu8UOD5c6HF+ZVxmAgm5rQNlW+DYRKDrX/f9Ppt
         MiSFXUuhd2s1o/V9r9A32r5iRsT5bMvTgsCe0Ac5LuzVRtB5HjXlG6RBG1lz4GwzXfO6
         OYqDr/1fnQGQdEY9lHs/CrWyf8bFZes9ahj0QfNW3+BYJViYWuzPP1msXB8XkgwdtjNO
         fHcS8LGIzvnWrxJL6LPNqBttHvNetpCQvd74otQIpy8DL9CxLi8ZlhhQaqP47a5dKqCE
         HOzjzSWbzm0c1aqGNwLvYij9iwaPnqvxm67vw5MiNx2uVUqzUZVSJnmkfPTe/uAzoqJN
         jrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754919387; x=1755524187;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPC9QjkdXxMejFY4x5ok5uLAPYyJClZcqMLBbaZ87b0=;
        b=KcZ5N5tAKzJhWA23Yx0LpwBl/m1MvbaQCEuqUDRNn4QWmCQnkVTgicJs59zA2b40FE
         N9WVVEhfX6Xp3Kj7fmELMBwtX51Kh9PiO2ZhI6AtxevLGCC/UdS2z2Hzi48wUzbOPRBE
         qOqGlMIAbILagBcieA6Kt7qt4Gpk4Yzm54FjSOFr5loLnZUJriSHokmZk7m/YTJECc0q
         vSYEk8WnnKOcxeHbIWbq8lI9Q5aujD/iBoI0J9U36dQZfERuP0yRHqzFfBXJ0ZpCvPjJ
         /tli08P/fuqWd++RWb1Vu0ew43IYu+KrRXWLyZjbnRzBRZBVUucUxDv9LMitL4IUbckv
         l5aA==
X-Gm-Message-State: AOJu0YxF+Ig+bOjTwOQwkrIlZR7k/2Gbbb0VqBkois89A1AlgJxTVubU
	nI5iJtXJwu1OHy6Ut8XG5Af8XJfX1f6btJd9PA+4NyCjxjL2MDwH12sjer26YXXE0ys=
X-Gm-Gg: ASbGncvrr1Nqr5LE0TTlwbyIl83tVmxcIhhJE44RYFAF/5wKpUW3/BPb1hoT8lHvcM0
	eUmKatQNs78JzXrbU0DRnThZuWqtiSgN4xUzyeD6gRHf0chrTqM9QExKsWHscGeeE9glqINQ1zw
	5VrX3u5CQri+fHuMipMHCI9aKgYG9LqjkynMR6sXWqcQEpyErRvmDyBvuDVhiwRtDkFazEFIkwV
	eGWYzLRA/4gDZIKPxkQiEW0abhAL3e5fwkPp+V/7NWnUJP1AWw/Do/KoDdNAlsfkHhwzoQq9KX9
	5qEZIWE49HERWevu27LFsiKXGp6dgsjWgSgfJXv+AyY228UlNK65VYuhJlHvi8z5fT93ZvRPBcU
	/qX9mGFk11TCghkYWxw==
X-Google-Smtp-Source: AGHT+IGO8tGE6CmpRp8d7Dv8oPbrNyboejFtiyDhBBX2/eeF8sA7SMGla8jnfhdxvPUYVbbA5Sca3Q==
X-Received: by 2002:a05:600c:1c18:b0:459:443e:b180 with SMTP id 5b1f17b1804b1-459f4f3e153mr120440835e9.8.1754919386578;
        Mon, 11 Aug 2025 06:36:26 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e587d378sm253045105e9.23.2025.08.11.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:36:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 11 Aug 2025 15:36:16 +0200
Subject: [PATCH 1/2] mfd: vexpress-sysreg: check the return value of
 devm_gpiochip_add_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-gpio-mmio-mfd-conv-v1-1-68c5c958cf80@linaro.org>
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org>
To: Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Pawel Moll <pawel.moll@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1563;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=npVo4x9jWTs/C5oZ+18P177rzmdj25fbWuss0PN0sgc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomfHY3wi3JBmgBHiBE2qvpEWlJzPK24kglGeUX
 xNZz9M+CuKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJnx2AAKCRARpy6gFHHX
 ck4YD/9c0CqewiZHWF6/YFXoIqPUFIkHmddOhFieqmRdmF/yNc5waGN9erdg30PR/wywPs+kh2M
 PjWfHrs1tOet67Q/bfY9F2IqNibNOE9bxDVK+qs+uQZHj4z5f69AdGlLuAhNym++2ff4zHg0lTV
 ZkaSOLnVLDJVP2sLKAyCYxrViDNfbEhZnY2Uu8i5rbtHewxH+ZFDmxHX1ikemAk5Hi9e2HuUIMo
 rnaN5L9J2P4w1GwQTIDn++ml9Ew/BjhUZm+cQt9A91n22y/lWvdzHhnG4GqVTMBiuh8Yx1tRCZW
 dNQK08q2kM+JphEbuSkwEOwYa+CNIeGQ38q1gQpgTwDEQp9Kx0xs796lFX+xMr1sYretdbFiXaL
 4HksGf74zJAwsI5xRnkqLdb0QpAs8D78JNoaAtnMFhbMvwwEd/mWUlMhrmgx7YfY31JytU5teTb
 tW/3BdG+yz7M2Oww16f4xylTWevar1CUxrXfpDSYmmQ+fbO9/YcN5uHt9m3RXVnqsvbOxG0ugAM
 h/UUQy1fha5KHs4hANSsR+ezcPEd1uT0EIxDcHh6dGfcLCO9FkA3yktahT0OvJ7c8DNl6kYxD2M
 v/ZwWMfYppyp30Po+U4Tu1OfAuaQRnlcowPcUL9pisVN03koxnAzPyXJcyq/lN1bkWhIuTBquAz
 WYRMxHmxYqDtGQg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_063628_323872_6DF16CA7 
X-CRM114-Status: GOOD (  13.77  )
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

Commit 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
removed the return value check from the call to gpiochip_add_data() (or
rather gpiochip_add() back then and later converted to devres) with no
explanation. This function however can still fail, so check the return
value and bail-out if it does.

Cc: stable@vger.kernel.org
Fixes: 974cc7b93441 ("mfd: vexpress: Define the device as MFD cells")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mfd/vexpress-sysreg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/vexpress-sysreg.c b/drivers/mfd/vexpress-sysreg.c
index fc2daffc4352cca763cefbf6e17bdd5242290198..77245c1e5d7df497fda2f6dd8cfb08b5fbcee719 100644
--- a/drivers/mfd/vexpress-sysreg.c
+++ b/drivers/mfd/vexpress-sysreg.c
@@ -99,6 +99,7 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	struct resource *mem;
 	void __iomem *base;
 	struct gpio_chip *mmc_gpio_chip;
+	int ret;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
@@ -119,7 +120,10 @@ static int vexpress_sysreg_probe(struct platform_device *pdev)
 	bgpio_init(mmc_gpio_chip, &pdev->dev, 0x4, base + SYS_MCI,
 			NULL, NULL, NULL, NULL, 0);
 	mmc_gpio_chip->ngpio = 2;
-	devm_gpiochip_add_data(&pdev->dev, mmc_gpio_chip, NULL);
+
+	ret = devm_gpiochip_add_data(&pdev->dev, mmc_gpio_chip, NULL);
+	if (ret)
+		return ret;
 
 	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
 			vexpress_sysreg_cells,

-- 
2.48.1


