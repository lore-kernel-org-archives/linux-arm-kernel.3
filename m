Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64739C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 11:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9cPqL3pvjwpbD7K2B2dA/s4JEktG/HsuL2/Ywhworts=; b=slTq7IwDqXQzq8FnYCW+5pjZ9v
	1OCkJIzF1oZGfZ2lagAdTto5f7iLPs18hH/ArQhtW/RTMeZn2ZV7iPgsDyR/yHMPjCbw+kBpSr9+h
	QtFeWI7VTzvmVQMQkQHbG7T6ozymvfgEws6A2buSfdlC0+b+HDZOVoUMJ+DAbea2dggiuCZ763le5
	q2VWOBVdVMYFBIUBtwBKfQxKzKFYTJ5Itom3jXOkLOyzJaPl40CCp4DC9JOY0wz5/ZmSUgocLFH8j
	5j0wHFQInzPkH6GFpE8ovfLftiXbtqF4AS6jaMnRqt302NMvAsbx0//ap7uLKgGKPVLkZM+8hPYvH
	l+dOhLRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1Ji-0000000BcSo-19b0;
	Wed, 15 Jan 2025 11:12:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY1IS-0000000BcLa-0aZH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 11:10:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-53e3c47434eso6186703e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 03:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939450; x=1737544250; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9cPqL3pvjwpbD7K2B2dA/s4JEktG/HsuL2/Ywhworts=;
        b=dipbRZKDU2ik1kx0zfMtSl4zalEU4z2/fb7qYW2QSk1PZjDRr2el5/3byrQ2c8e6xI
         06OhGZS7ZbNcCRKyR2czRSlowpeIyN5tuPhqj29KNonspwBSyOlLjrGc8WFy41ELsjIo
         dpKIOLQeAWEZOJunvTC4np5syrriUNMsCn5+GTp7AZvfsvgqYiTxbWbQRaHB1ovmLVkB
         IFFweeWSho1LNE/OzZZG+JkmO9+T0GBTQELleop8vE6WyWC3ue9HaMQBIJBx2yV+Bl6D
         G+p+WDT96P1BXosWGqst2PkGPl91NZ3l+/Q1dK2ssveAf6jCVbvCQHuKxhhi2fjuTnHo
         nPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939450; x=1737544250;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9cPqL3pvjwpbD7K2B2dA/s4JEktG/HsuL2/Ywhworts=;
        b=eEvGIlKGPQuh/HVs8SXB2v5x/irj+PzOJp02tGZ/f6AIQR+XQgj2DC2jYFx5IehWtY
         nZhfE5rF8kbSLnsbEd3WseCmPGOxb5yILJYtUHe1nZ9xm+o/vGW6V9J67UzOrOw7BkSX
         ssDJJ0oW07iTZ8AuTNBhdPyvPtpbA3wY5t0WZwnx0pzDJI2xMeu2HOsuQYlBglnTX/7y
         /4GLLhsCWokpzp5B3UzN9P43h3wxJQgILmqj303oWj4Qi2FfKQkIF0VrpXISEOz0FuGm
         E9YBUSAAA/HGD+LK2qAYztR/hujs73019Isrs/IqmSAxQvhML9a+9KBMGLUlaEsYpuz0
         4tvA==
X-Forwarded-Encrypted: i=1; AJvYcCUH6AEJyJVJXXN45x7CjMmfr6a5DeATdzlD0kV7Oyjf7EAcA7oyJH+NkYB0gIlp3p+7rgfvo5Ew3znUF3QYqXUj@lists.infradead.org
X-Gm-Message-State: AOJu0YyiqQW7gRZmfJne6kGFR4oDbxXK1RhCXCdXctoWdHDE3f7rs3L2
	xtcS3wqSLulv54mvzsY7PXjSCW5dXe9QhdW5kszaa9hjJHZmnR7uNfCBvqLGAl4=
X-Gm-Gg: ASbGncs428sGCZxW6MGZ2wDMgxrKVPa75xWzWciJk7BX8DDFnbWx6ImcTdzXmQ3jP8g
	xxrMNgBdYorjKgyWl4gxb3yzNnCyODt9XbiepUrNPeE+W9zMU0cbsmWcUSEint/pYZyKwRUk4hY
	kIom+wFyywMnIYX8HhVtkpjJGyLgdXUvXVnTjTsqVdnl8+U3Um1IGCo3za9mxL9z0nGk8FJ+K/D
	oHECAgudl/EcyWZ3zcINjCG3Esu8WzpJfW7I0xJEibPuvcxnxadmc6kR6Bnmu+U
X-Google-Smtp-Source: AGHT+IG85kgXOk/y+PGUU9aSW1rfAywF6FZXYhKzLssLnSoDT+9VsjVq+V6QFAGhJAZqkiike4pUTA==
X-Received: by 2002:a05:6512:1081:b0:541:1c49:523 with SMTP id 2adb3069b0e04-54284816f73mr9507707e87.48.1736939450343;
        Wed, 15 Jan 2025 03:10:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49692sm2009084e87.16.2025.01.15.03.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:10:49 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Jan 2025 13:10:49 +0200
Subject: [PATCH] ARM: cacheinfo fix format field mask
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org>
X-B4-Tracking: v=1; b=H4sIALiXh2cC/x2MOwqAMBAFryJbu5CPKfQqYhHii25hIgmIIN7dY
 DkDMw9VFEGlqXuo4JIqOTXQfUdh92kDy9qYjDJOae3Yl4ODDzskxcxRbh4Ba6L1Dnag1p0FTf/
 PeXnfDxqi6kRjAAAA
X-Change-ID: 20250115-arm-cacheinfo-fix-9ee32f3a5e34
To: Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Dt8d1C/tljuHwCYE9rqB9mV99qR1IwA31kMWM8oW5ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnh5e5bVtlXo43+ur9ZmjVXRM38owhcLp66/0P/
 3imQJL3v1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4eXuQAKCRCLPIo+Aiko
 1eGACACSCS9TEYuK7peyrjK8tniNVAB6t+KYUw+pzBOFimWNqyFNHEUbE2NyhIItTO3hUjmAa9A
 +aaL8HtMbRTwNf74A8MI1AGnEzYmc+chnIgDMO17jjAdpOqZrcoKqAahQC30eu7hkTgWyULad+O
 s9xmvRtr0Yd93LFs7pvflaqFcpBk0NmibgCh0DC211VjKq9ka5S1wFkrIhYdIEcMxp2GIZjJX2O
 f8Zhwfl5CHApOncr0wYBSMGx0BqLodP27M97P7W8Cs35CTbY+qnNMTphkzZjEwGkhQfu0hRswte
 X7xGLnxVgBocaKqQ35BM4T4yYK5BF/sstqu69VSR1sQJ6GIi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_031052_196783_40C6F9DA 
X-CRM114-Status: GOOD (  11.54  )
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

Fix C&P error left unnoticed during the reviews. The FORMAT field spans
over bits 29-31, not 24-27 of the CTR register.

Fixes: a9ff94477836 ("ARM: 9433/2: implement cacheinfo support")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/linux-arm-msm/01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/kernel/cacheinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
index a8eabcaa18d8941ce31ad267ce0d369b8d53886a..e1469b6417804d2802e847031950cb99b7b4e1d2 100644
--- a/arch/arm/kernel/cacheinfo.c
+++ b/arch/arm/kernel/cacheinfo.c
@@ -23,7 +23,7 @@
 
 #define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
 
-#define CTR_FORMAT_MASK	GENMASK(27, 24)
+#define CTR_FORMAT_MASK	GENMASK(31, 29)
 #define CTR_FORMAT_ARMV6 0
 #define CTR_FORMAT_ARMV7 4
 #define CTR_CWG_MASK	GENMASK(27, 24)

---
base-commit: e7bb221a638962d487231ac45a6699fb9bb8f9fa
change-id: 20250115-arm-cacheinfo-fix-9ee32f3a5e34

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


