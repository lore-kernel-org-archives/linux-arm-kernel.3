Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B0AC35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=; b=s66v1DUv0dGc7EmJ0EEVBk24Pf
	9YoEBH6+4Xow+BsP/LZZuc+4WerP/XMdHltO0DFJ80xga1nzy15krWr2PSzBDXWu4eha3vjjB3KSY
	RZXaaejAu0MUXUUx6BC5RfNXnQC8Sp2uKmr9CyrwgzKFfDzdsdscSl5TODrHx6shElUwnImj7KX60
	embmtVcYsQZkd29s+3tOtd1eVwsK+ZQduwDi5fMpKyBmjS2kily7g7P3St+dnRmYw8ZSmVqnZakjD
	CRjmxGlI1rGXwKmXAHxkQ8qePo8Aox9/BCE3s0FexzZC2qwBJWWBsXX0WrLDVl8fCwrFjwCbG1aIA
	oY0wojNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumDJ-000000084wZ-0DxJ;
	Wed, 19 Mar 2025 05:43:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum8P-000000084aH-29tD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 19 Mar 2025 05:38:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=; b=A7T4hGnAYPuhs7rYuru+JnOnX8
	rPpiprdoI06o6jHnIpadPxmJ4e4IPIrmVNGc73QlCzH8uyofc3fBpvki/KpXkuEML8Ld/tkcXkxgQ
	XTAL98PKIUQb6W4SnyBH3pfP8TOVlZDVPRdKPWYIbkMUqq3vqChva0Xu7bU61qnf5DwNZGWtraS2l
	Cxeyf6qylFervtv99GTF5eoEgs5vh7wyrIlLuLQxQ9J+5L52uxk7hVLHj2ek+FIGvg7TF+34siD4Q
	3PRqgoO/RWOKgT4/NfIi5WEPOWEBwqj+WPI8q00A9IGl37/9IOq4IxnmixZt5tOi8MBMCdQWk/u5o
	uhw+TCDw==;
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tum8M-00000003u1U-0Gnw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:38:32 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so10255007a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742362706; x=1742967506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=;
        b=XEunAQNAym4iULDqHfbVtzc5Amy8/GOq39yXim0+0eyyeQ5CO07edtGJ172sP0ThHJ
         1QOWV2guJqxWpOFxCU9vYki0vFDBlyB6T/ADbuNWchjSkfzHpzs1yKggSF5GXlmZbAKd
         twhzSrdkIRZyYP8pleEU6tuwTr/FTpU6aFNALfE2w1vbbFCtrpx4+W0CvW9Qakr6bXEQ
         FbPM48EH4/8xCgC2IOf5NroF0IplC7Qf55uOEqdxCBr38rOrI+WGPnzC+iwrHd47IIVr
         sFwqkmM0/ZoYlItgGp1fwoQgRXRRSxXHY8IeqWQ/YJ4exTw7211qSO/4Cmg4+y6iw5hu
         Q4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742362706; x=1742967506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sus4gSJU+xZ+2CemlxDEjCXjhG8aiYHNZQAdXRIuTA0=;
        b=e/yurm0BiDlSokEH2QupUjHQFV8ax8RUsyf4NPh3tTW7DrSAuzVimr1q/zG2qEeeFI
         fzhd2AgaUmpvZQB35KJawbk30lLM7564KjXTAlMCu1XQmh7w79Czy2iKIm8cE+wOxN9C
         NyQXsH+V+wdndcWgU2WAMOZrNVjuIM/t5X7C8igrtCP18HKYJ+OyI3vVA7WlkCLl9GJS
         dy9LrIQA7Ub8xpWXkBQs5BCM9UkTH674dHkBfE4SS+bgLlaxeIt+8jtuGmEG2xkxisXu
         YL8KXdWtbhk8Ohw9xhiK+XBUNNcxK45p7usvBbFyEF01Iuu5S/+CpDd7TNJBrGryD2Wd
         gM1g==
X-Forwarded-Encrypted: i=1; AJvYcCXAQMfqWfJWyVbZ6pZtOdtA55Z2FmqEKXUsUPP75+sw+tciTibXWQoKCrxJMIUShgs0p2lhNNTOFKDn07gg/GkG@lists.infradead.org
X-Gm-Message-State: AOJu0YwxvRXaamleLl8RukMdYlXxxaRvkxiqCuX7OS3khv1cPtZiZCQe
	43+8Gq4p9GC/d44cwDaABEKg8Zn2AvT2ZzMzNla3uqHPn0Y3qSB7noyAU9+50xM=
X-Gm-Gg: ASbGncsylZyioXQwyXQ7gK/F9I7M7r65a4zZfni5ebL+FqOC/uMAUjy1CLTJm7VxGzV
	q+QkOF3IAtzOBydFSvfJU72il/4FBp9hmRZmkUOxHlfiGUFAHqQ58/ckEy9AbIHE3NxNCIohdI9
	CSaipFj26Z263z159GmgEH5eDtnMaWZaev6Kp2ajrJ6bSS3eg/Z11xGAAjh/BSjIFhwFhJGh4FT
	wgMXi/Z5a/ciQStFLP0zD9b9zJ1c4jPTcgJKa1HTKPqGLdFsES9bcQ7YkgB8w6RMe7MVA6qmDQW
	uP738w4HiuA1VTjfs/0pWzSGbjcMG9J2seU9NLfNIF82Tj+XIjE0+3gAn3zEzgi/42x7ufmBimX
	9IBt3XoySAy1XRcgLeWKtU3lFjtJqfDwFwjZx3qs=
X-Google-Smtp-Source: AGHT+IHrn2C9WLboMGGXgsOlvqqsrQueINwlBYIC5HbnjUBRvOCY+qEiAJm+UPf+gUneCwQHFhXSew==
X-Received: by 2002:a05:6402:2106:b0:5de:dfde:c8b1 with SMTP id 4fb4d7f45d1cf-5eb80cca862mr1173125a12.4.1742362706356;
        Tue, 18 Mar 2025 22:38:26 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e81692e6d4sm8511817a12.9.2025.03.18.22.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 22:38:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 19 Mar 2025 05:38:24 +0000
Subject: [PATCH v2 2/2] firmware: exynos-acpm: silence EPROBE_DEFER error
 on boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250319-acpm-fixes-v2-2-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_053830_356500_46B6C649 
X-CRM114-Status: GOOD (  14.37  )
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

This driver emits error messages when client drivers are trying to get
an interface handle to this driver here before this driver has
completed _probe().

Given this driver returns -EPROBE_DEFER in that case, this is not an
error and shouldn't be emitted to the log, similar to how
dev_err_probe() behaves, so just remove them.

This change also allows us to simplify the logic around releasing of
the acpm_np handle.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..04c73692383b17ace33e95ce9534101bc68f089e 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -680,24 +680,17 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 		return ERR_PTR(-ENODEV);
 
 	pdev = of_find_device_by_node(acpm_np);
-	if (!pdev) {
-		dev_err(dev, "Cannot find device node %s\n", acpm_np->name);
-		of_node_put(acpm_np);
-		return ERR_PTR(-EPROBE_DEFER);
-	}
-
 	of_node_put(acpm_np);
+	if (!pdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	acpm = platform_get_drvdata(pdev);
 	if (!acpm) {
-		dev_err(dev, "Cannot get drvdata from %s\n",
-			dev_name(&pdev->dev));
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	if (!try_module_get(pdev->dev.driver->owner)) {
-		dev_err(dev, "Cannot get module reference.\n");
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}

-- 
2.49.0.rc1.451.g8f38331e32-goog


