Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E14CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j9uKP/w701Utzlek95Zxmn6XXXuTthToNRKbdLienIk=; b=beq3QL0wjDWgQyjRH5Eh21OYAd
	F8b5zUH0C2daU1rR+C5a14O+bPeRzFYM6wX1y1P8lO2y0E3+y4kDkMEypPCWxtJUaBe4UJ9zzWrOf
	a4jtz6WeSB6lDdGUmxp9vh58f9FH7ioMdMu7d9YTkE/7nNfAycRkQIiu/PrZRqIGz5KtYQv9q6fhJ
	zmbmM+Iqg2hCTn2WgJnQ1WBb8AnU3jRgUUBqwSog99d0SRnAgSr8/MaTTO4HPZNrWHdVzTIBov2XU
	t/uLYGEn9OZVeYNleGnTvAf1nJdALuvbu3C4ZLmKOBATs4SHBUvjiaXVqu3j/dyQc72KJ4UOIdGtZ
	MCJgO6bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usJHr-00000007loK-2xGe;
	Sat, 30 Aug 2025 10:58:23 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIwJ-00000007kXg-38R6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:36:11 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afe72d68b88so28190066b.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756550166; x=1757154966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j9uKP/w701Utzlek95Zxmn6XXXuTthToNRKbdLienIk=;
        b=BfhzujAmobfgRXPsdIKMZPsxRyyUbe0J+pfCiiIWwuxrXZqdZu1mfpe5ek4yd0Ue99
         +THbZLNanJ0DDdKe4bUHoamyut4I+oz/NgPs7RQK10aECc9elrFlkkGWaE9dFvqCJ0AV
         eygSmJB5TpiY3dOmcwsk4/B/wDmbEFjUmheA3qjCfq4AX/L+RcZfWd7SZGOfahHJV+P/
         t12rIIhFTMLtSO32vnJvRW6Z1Pm8dc1xG3MmnJhdBJHh2jY+lpgZrjmXz1q/Dt22pJXI
         HVDNHGX6ivitvepM/juryIeqGm1kDCOW3xCT3wfC6/VpEtXBDDFs5pNDn23OHMmaTyJY
         H4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756550166; x=1757154966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j9uKP/w701Utzlek95Zxmn6XXXuTthToNRKbdLienIk=;
        b=mimRi4pbs7Pcc8JDo5/r+JJXMZNswDER4XLNxxkFbB4bvytVAfIyagKmNLQmQuu5bb
         VmP8pwwjtyM/cSdAGSXN6K7C9CKzMgjyHsVYtjuChueJwn9rO48rw8ck4WGnct3MjByG
         jQxDb/fxu7ilZDUyI9ZK0raC3lifGXj8QPFqXnda1iGT8g6FIA+hB1Rrhexkf6TawkK8
         Do50puh/Jum1EdenuhRLcJRtlm21hzwrYiqyzTdMYL8OD1+uTZH+a/xuyiSQWCUXOjg7
         omkFpwt2SImQSmJtkI41oIQaDdysDzVl6NZAQchyOYbUnOhjbFI2mRQESPmEl1RWlQbO
         RWcw==
X-Forwarded-Encrypted: i=1; AJvYcCW7yfmSyPmMohd2swgn5Zw0uGxP2JUE2uEQQ7mY5y7g3kdqArWQ5PXPjoZcjskHyBSdpVvyMnIRDaT3tR4UySZ1@lists.infradead.org
X-Gm-Message-State: AOJu0YxiP7ii62iTPk5ycVGjvPG4JEFd0qKjEAshuFnpdObNzbKKVmAu
	yx451HrfXWJRbScpPop5ob3ZsiCSn9W/5Evg6dR/mfW2i4JM2O2awlNFam3GjslqFJ4=
X-Gm-Gg: ASbGncvAPPy+IFo9qYqYopusicSVpGn/oipwj8o8a6nNbdKICUHnmi2asdH01tM29qn
	bZaVjsDQ+X3K5h1BrrXPHPRUGdZ0rpfFQJtJw1fIXD4lOrdHCDSLeiI5GozAf0zx982Cg97HJig
	iYhDRkKQYCq7CWpXMp3iGdIYuNBa2CNGu8RLDZR0puizFayDEzC0fGzQEUlqMw+7+EIdd3fhx/Q
	NqV0xyLAx9U4kfRhQg9nSRGnQKaqZPKdAI4OGP/5tseYcoXXGT1mj+aOGJayyJfyXjDy69U5ZaB
	M1EDLp/xb4iaMP9cNFmdiQaMT6ljyf7wFae/uLx4ZxpsB61Qarl4YqHGetJq3NARdDW8qJHXDk8
	NTzLMMaNvy+pEYN+XtGQQv1YhvqLYd1U4vzLYIhvU7zwe
X-Google-Smtp-Source: AGHT+IGdgzBBWg0IEYY6EguBKdq5dpPqYmiYWBCMG3kWwvM1hnhfunzI2F1bpeK7ModfnwPEFWO1Ww==
X-Received: by 2002:a17:907:784a:b0:b01:7e4e:9bf4 with SMTP id a640c23a62f3a-b017e4ea313mr83699066b.8.1756550166068;
        Sat, 30 Aug 2025 03:36:06 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afefcbd9090sm393749166b.69.2025.08.30.03.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:36:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] i2c: s3c2410: Drop S3C2410 OF support
Date: Sat, 30 Aug 2025 12:36:02 +0200
Message-ID: <20250830103601.82046-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=aYDrCmJqwydp0cITFrdKKChTEbGkRwFi+heWaQ+g8x8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostQRcylIQbLHQaXyoT5lBp9dj25r3KgJrdhH6
 8mC/mo8CO+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLUEQAKCRDBN2bmhouD
 16+GD/9M1J85gCn20FMDk1QPTL3u+uwRfax3oj5iYwAvMOwkSIjeyHlvkMRzay+X2KWu66XXcjm
 hOmwAuSza6JH0eoCje7JaZIQ3hDfklIf1K6/i7wGoXDNWzF2AVFk2j3AgCoUkh0PgjcQgb26pb8
 hSWqvCuJJEmrC7cGevfpl1WzrFGjsQAWPe9WdT6nb51GbfaepDapfHnXZSrv+olJGd83PcID6Nm
 uBrOhQByHIFTxLUTJlcYHa7t+/T/J16oltUpqb7T1z3aHF2XflK9pxGPqIRmpjloSJHixMVqLYg
 Y6aFvh/dNlK4A9lAYFPTm8yGXx5zS+n0ImO5+5an5VZ1DmL6/d2b6AAUTzh3emDXMow1Zs4bJGD
 hVqpdBnAP3XWma6eCVc5qTz8f8gvhOjWYEDXqH0kerRGDw3nt76m0eNw7MdH7sx9knmQumGOHfm
 n52XcFBEhLVBabL7FyD5K2tgyus2rtxzJdq3io9hqjhvc5hB/+UuPs/evZRca1fCrzykbpSukA6
 jTWkG1i6Hhv2y4+xT+QHEJlDy7itMFjwhdeqOtx9wp3mfCa7rtynUXToBOl4KEFgDgpWcq/1YdT
 uFZvZN/LiQjg6Mi6bb+JM/OI/4+abDaxl1NWpGlWKgTptd25RdpyIR5AyI8vWPPHfEwTlIAzVMV cJK484bq7er5PuA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_033607_808846_BBA1B2F7 
X-CRM114-Status: GOOD (  13.06  )
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

Samsung S3C2410 SoC was removed from the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of "samsung,s3c2410-i2c" compatible.

However, there is still a user of "s3c2410-i2c" platform device ID,
S3C64xx platform, so that part needs to stay.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index f4fa4703acbd..8138f5ef40f0 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -138,7 +138,6 @@ static void i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 
 #ifdef CONFIG_OF
 static const struct of_device_id s3c24xx_i2c_match[] = {
-	{ .compatible = "samsung,s3c2410-i2c", .data = (void *)0 },
 	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440 },
 	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
 	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
-- 
2.48.1


