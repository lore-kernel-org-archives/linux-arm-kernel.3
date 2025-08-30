Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354C7CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=; b=f3E+B8SbMf+3HZ
	KChxy0xfJgiJNxF8SjDdHfjcIHHRNZ9hn4SINv/cxe6XB+7lCeCL6c3OHku9cpMNKcMCgCafBnVd/
	f2OLNfDAEAMk8gSemudNoexgifpje1d9GQHcnRWy7ABB8E5nvDUQTue7ZE+m0VtL6cySevujjrHMT
	09iYeWNyudpUUxHGMo7jxKPBmwj0B3TMYo2Bp2AAz/h/qD3eJ+H4IWAjtjmf6JOut7IJMRMq7UFAH
	xEbPSIkmJmBX5UrEvBYe+oRVAPByIOLxw2z6NdaodD+WhybuQR16Zuj19zvlfa7NmJiybdU/E9RcT
	8VKen8NOMHIPtR3VXU8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usP43-00000008CJh-1bfD;
	Sat, 30 Aug 2025 17:08:31 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usOx3-00000008BZV-3xvj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 17:01:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-afe7f50b605so65758066b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 10:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756573276; x=1757178076; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=doLE9MFOiEf8wXIEDb6y0RHFUGLOghb+6vH8vl/QJs2fe7KsFA7Fux6cvYE0GmhxRY
         WzQx1rFKWGjeKaj6artpULDZBX+k3FTq6mgWoE85uX6ha97vzDnxI5KSz1B7gDD5g1NK
         PiyqWybjCSRyOJSrFz6kTav3BgM4vpO5PaDWyGDDFuScinXvZqSsUQ4fTZA1cMhteOUG
         ZXMHbeT7sCnUI9Y9MIrAb0eXfLTGIPm/ohPiyZynQKQ/ZTSivlQ72euCstViQ7pykRXl
         nHxO/CzagHrIGEGblPcGv89jr+3domGfgw0RQDR/N/uUeX8tdFoMRoSKkKr8v2hC7UCj
         Xa2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756573276; x=1757178076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJLZ5CKo5DabaRRE0JZ2IWfxRuXGLF8UirDus01xVko=;
        b=lFxeB+rVKedJ/VBMwou4z6Zrv5fzsd67WdNlp5tKbhID6kI7hM0juw90LmTstEoajo
         4k+Tho5L1qxGFwJqxwzp3w6CihgLl65O0leapaixEMSDklcmNcYv6TYuHxKPl6+7U6zg
         rvmpAA8YRZnsAT/c7A9u5yH51HnhD69UECxpvBRVxYfutGBEhj2DDTIxtcEuRvTLTaz5
         PXQnEJRdh421I+A6838ziP29E43KfBiLY7rfcCI4hVn/uMdKPn0TUxKeHjdXRWSXgKXH
         qR9FjuhIBP7dpJ9W5VZ1YFJY8TJo6dRun4p5J8CQY+7JErqOpFK3Ma62GujpjLv6zpK9
         q1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCUCnTqfQ1fylZzmPnBPTmx+nOwlLF4BEyixWTVO63CjZZBUpa1/hyMBClbJV4BvzlRfoHTUyZoiTm6Gi7EhfWbK@lists.infradead.org
X-Gm-Message-State: AOJu0YyKKREGuAMdkEMvbJwzGA9eI8G5Dib+1rYbwTq5AQWS0bQs4Qj1
	HDGvBGbkAj1Is1SFsPXkOaFgaIWo5nwwesrymYHORVLpp+vDzKuXf1XYssSLYoxCZpQ=
X-Gm-Gg: ASbGncsoev5WlF2pAIrCfO0ntlz7I53l9oFnRwp+eDbeLe5EVJyOm8Y0te6j3Gr8gv9
	LmZbdSzCexwjs4kJEWpIGLx8b3LqSPKy6npzbCeexGZP52IAG7CyfzqJJEg5Xjo8WYJI/8MOTkY
	q8PwjrBbnOZ9qxOo/xUd9iZHwxpxI48F5mxJhXC5YTxpkbX2SgNqst5GgehEEDlK9fsbqiWO0CB
	SQz7MkiqeF4tx2PZy8eQScFQHIzSre0+iGZ5tfNYhvRtwPRaZtv1DD3KtAqDG6zmpYid3wAA2WI
	+FTCat/BQI5XLNbRh/9GC5VOpq0UigXjQMJxvtv8x/MT7G4kTqADZNFII5YzCSjxY8tUIZB0js7
	Ywww8hXk9eCJzG8eIIzhkJBHWWv1cr2MTCSrSdz1PCzHDa9BJGQ==
X-Google-Smtp-Source: AGHT+IGwW7z6ZZeWMRWTPz9Z3XwH2Y3BmJLkP+pAxyiHYWItazh7A81qCVLqms2areFztK92EQUEqg==
X-Received: by 2002:a17:907:3c95:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-aff0e28a1demr277259966b.0.1756573276279;
        Sat, 30 Aug 2025 10:01:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff12a6b404sm309038766b.88.2025.08.30.10.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:01:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Sat, 30 Aug 2025 19:01:08 +0200
Message-Id: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQus2gC/x3MQQqAIBBA0avErBuwLJSuEi1MpxqIKZQiCO+et
 HyL/19IFJkSDNULkW5OfEhBU1fgNycrIYdiaFXbK6sVJu3R7+TkOlGcBAzWzL3tjAuNgpKdkRZ
 +/uU45fwBRz7XeWIAAAA=
X-Change-ID: 20250830-s3c-cleanup-nand-d87b5847ad10
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=jRpxpUf4uEqnnfvpWME5IzFTj6kezYWwWNy6sI9Jnlc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosy5W+DzfByrBp7P1cypFBMFE0CLR2K5gNj6mx
 kR0wWKWBmKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLMuVgAKCRDBN2bmhouD
 1+eVEACVF2Mpcy6HzBCklOTJZflAQhOnWjfatgC59+l3hDngiFdxrTn7vIaugnHzXzVlGfvQf/7
 YoKm5zM7h2AVnRUNma4I+mDGmOFCQBmEpvk3YU9YFUOfkmM+CoWu0/PsKsvyUVqKZytmEuwvple
 5GDHSCkUsQC1Xf1S/KkE/V9wdPBGRXIki5T6JOcJkDksc/dgq6DTHOxnwFV9p9i9Nj1ITA+2hDN
 O3TVyJsWAU3jHlmovAXZr9yNq9ilT+05by7sIJC3OpyAKJfED03j3E3m9kKV+A8ebjLS65C10mW
 W7+HYdMHQCIg1qkDMo4GSzcEEVo3y1DmPzCEuT4fy98aQH8ECV3znQbn1yah9NReptaFDbhCSDm
 nYzLQdCDeg4EZ6+LqUXhw9B/IYiVrxcSrDT3MtOkdwiAYsVPARpdHfbZLi3pahLHeGTG3maIG/d
 za1pf+vxR7Ar5Ik+5jBVDjg1izKKz3mglIBmkf17Np2ZAaQH19UuBSL58Tu2kfzTAaCT1RuH8aU
 FhRnF9FTDeVRibJHEFnfpbWP5DHd+Aymtfai6eFstznmLlqUnn/f/fr2uE/zMXUueJCOoUGoEQc
 8SLDl8E8GNekwLgKnVG/rmCBRbx4b5XbSyZVPQ9Zam7oAx1M7Xcd0wrdBrN3+YsxkrTDRm+tuRb
 kBY0supEFn1RWxA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_100117_993268_C8280A72 
X-CRM114-Status: UNSURE (   6.92  )
X-CRM114-Notice: Please train this message.
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

Drop S3C2410 NAND driver because its only two users were:
1. S3C2410 SoC: removed from kernel,
2. S3C64xx SoC: does not reference this driver.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      mtd: rawnand: s3c2410: Drop S3C2410 support
      dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
      mtd: rawnand: s3c2410: Drop driver (no actual S3C64xx user)
      ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410

 .../devicetree/bindings/mtd/samsung-s3c2410.txt    |   56 -
 arch/arm/configs/s3c6400_defconfig                 |    1 -
 drivers/mtd/nand/raw/Kconfig                       |   26 -
 drivers/mtd/nand/raw/Makefile                      |    1 -
 drivers/mtd/nand/raw/s3c2410.c                     | 1230 --------------------
 include/linux/platform_data/mtd-nand-s3c2410.h     |   70 --
 6 files changed, 1384 deletions(-)
---
base-commit: 4e9ae4ca11b35e6a3e9a1175201d8c55406d9301
change-id: 20250830-s3c-cleanup-nand-d87b5847ad10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


