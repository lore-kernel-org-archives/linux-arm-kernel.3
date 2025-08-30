Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28839CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z7M3vCsJMZ43cEz62AGJknDQN7G2hxsKCz1yzLKeGQk=; b=DvhMrMnXL0sXPg8Q+W1ykPQumy
	yZg6wivqeKfH79Vl3L8M1+hApQ3xbAogeKUX7s/iQLiGQHACCIWdp1NhKIik2utQeFNtiPQaTx6UF
	3u7T4EmPIOAQjyK33nMV/GRCblaK3mUA+TVdlSW7kcX+YVrs8H0Kuf2YPVJmF/6T/mjjpRQjLNZC6
	n+CXrVl66f9y8x8N0C+0tYOZ0XV3qdaXJJpMNzgT7ZtEUedpOTLn788Fd1pC947lrINC5ZNAncl7C
	YtE8nSYwHLcStd9Q1t/YbECpfgpSTyldCbsaZlA4A9O8E7oTZ+g1DBHwoFvGUD+izJcKcevSkncnJ
	OAWyL5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLYt-00000007vsB-0c5o;
	Sat, 30 Aug 2025 13:24:07 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usLCd-00000007tl6-2o56
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 13:01:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3cd99b4bb72so254650f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756558866; x=1757163666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7M3vCsJMZ43cEz62AGJknDQN7G2hxsKCz1yzLKeGQk=;
        b=moqJrlIw0FjPGFY+NjmJJWNUHYdLIXZz9nefl4NARMmKs7PaUFxXhk2YzfpG9oScII
         PE8nNIBoJd2vDoyO3zjVbbhZLXtPzHkzoAIA5pgES3SX1qyeneQjvfJiDYqmJKivNEGh
         p78VbWyUYfCp1gfBzKEtvgshpDWTd4NZ4EpKFJxOA6Vy/Bmgn/jm2XE00Xnxd47RsiCV
         Zj/mCGKxasSYUQm7lCme7VGpwFgDmlt41RlsxTI4R+uTfPRPAHZuw9fMpBslSI27z+TL
         KqJsjaZ8KJOEPMnnwNIlzq0NlYx4gbEr98HeNHj75pgw8SmtGc8K3+FW18FlMb0pBfiG
         AwBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756558866; x=1757163666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7M3vCsJMZ43cEz62AGJknDQN7G2hxsKCz1yzLKeGQk=;
        b=iajwfNqNNQnSTKbnVsG+KNnB+zQl6wnZ/cpSKHPWYYdXPE8HXAKymmRyAvqLGetItE
         c0kucQHCEYkq/H0W/7Vlnj1plEQ+i0P/fleDrY6jR0+2DllOFBOfHmmtuVtNQRzLpFQv
         q9JNbBkaVeI1lt70h8r9CTqAE5GziFeSnSVT1EfgExjuPeJTvfrog8dkdPteiRM7Ww+a
         pDZy2Jq0l4HSttWKKwz0J83WQf1PvdvJ0Ko1/oW2qQaTkenVBjqNG+hVjDh1gxT99GEB
         GIG+PYxAUQxyQ9KDPYPL+JckLs7jBnhe9/MEhaPYCj93C/aH9Sm9qyz9ermrZYuVw861
         MTEA==
X-Forwarded-Encrypted: i=1; AJvYcCUJolCZcRjVGYRP6mQGYl1u4mEPhPcgwFzi2lh/0P50ccyzbY5dgmjFLWEK5fl5DdAHWBBhE8Ce/6DfaQkpWzwe@lists.infradead.org
X-Gm-Message-State: AOJu0YyZuTwqDLk7bDtW+09f+xAt/l7ue2twscAqabWox3peTkPo4Gv3
	Ta2Sp1mC4IywDkVaQcu2fu4fQTg2z7ti6zkTO/zyq6FEBV0epMHkzAeHzOH0ARCWVpA=
X-Gm-Gg: ASbGncts+kAJI12nNw0imW83hMx2/edejz6n+tGaGXMYUjl/Xm+XQQGg06gGSidxuLi
	i77PP7piEKNynji564TIVrAQYJhrBhWsKC8ochEFkFvTHGBIYsOMragZ/kw4emGxULihfn27Uun
	SEu79szZ76FWFifCTzv7VStTuXKkTWvs/zHK2yvl18dx6img29AJ4j4r1nCgYSVpSXpqq4exkMb
	hTKc3dar2SkcR3kbv6AJNGjRYG1r6Axqg9JyiorKcXl2Dt0Ws2cPQkgaMAsol/fMaFxy6sKuR/i
	vLKmCjMDdjknEbxKFBAFOAQkJNMtw7z1I+6z2PansMMe2R4zfkwaC8wYlNnocbxwnQmsqIZlMdI
	12dDyNS0bYUXO04V0rbSzmPL9A+mFyQFK0Q==
X-Google-Smtp-Source: AGHT+IEu1+x+u0FHULlv7GGaPuC8Ffe2R8NvXXiJsVVqoIZf6exP5Hg/aAeQyEtK81AZG0NwYJM3IQ==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr20236235e9.0.1756558866091;
        Sat, 30 Aug 2025 06:01:06 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e74b72esm80211125e9.0.2025.08.30.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 06:01:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] usb: ohci: s3c2410: Drop support for S3C2410
Date: Sat, 30 Aug 2025 15:01:02 +0200
Message-ID: <20250830130101.142934-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=F10VaVS5/ArpOG9M7zzfIdLqM2KBJPmJ/FtgIA4jIL4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBosvYNA0wmJK+pguYnQUpTK/ASBvUxQPhgV540P
 UE+4CLZevWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLL2DQAKCRDBN2bmhouD
 142PD/9p3DrAcMRMNNzkSIXpDhHq3HZY4MvCuwRl1jcGO+FbxdaCH5lhrs0RvCDhX4y/ZEmisPb
 8hpB4RYc5hKwsc5QGrvl62wUN8ExpxyvulPKkLmLbJpRTdLVYFb+ndZWgKoWoPq9h+0AFRo0xYh
 4xdou3tnK7wqOhJLyCP9f1m26m2bkl8/A1r7z/Szy9GE/bVYtWyLEgmQ6A5a+Zw3c5xGcYX/sHL
 OJArL5NO5P2AaZBqncFRTXKxqP8IYqBSlxyOJxRp736IRjhyHAZ3e2CBXUaDAKFiT4aSvMFOcDA
 xwEatA/oE9jpSrViZyxCx/m7rlviYzRLOhMuJC2KbCLYy/4N5SXNaQG5v5QwwMDjJl+wgMPBOI1
 VOA21of9u4DNS6qIXDvEOGFdHw0Bb43GMU9GAXuU19IcjLarXeLKmqBMMH/LXOKD5DExjceCUYX
 X/HAG0mwVTV8QS0Et0voXOAXUP/pg6ns1cyeEv9F0x3L4qu8ENUw72ntwyYoIUBq0QB0G9iVR/V
 B7vkd+qHlS1RBWoX2H0lBulDw1mqzctrH+mnNXXFDAUuIFayz6hos9RQ3oliud+K7Pcm7hKdAGg
 7f7vXiXAbuhabPtJ2b9zgLF9isy8sTINNfrSrCxdGEf1oshN6POaKyXEsQob2MQgQPsoSSbVmYK VZ/+HBRX0zAaqMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_060107_708445_B8F8F2CE 
X-CRM114-Status: GOOD (  14.56  )
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

Samsung S3C24xx family of SoCs was removed the Linux kernel in the
commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
2023.  There are no in-kernel users of remaining S3C24xx compatibles.

The driver is still being used via platform code for S3C64xx platforms.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/usb/host/ohci-s3c2410.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/usb/host/ohci-s3c2410.c b/drivers/usb/host/ohci-s3c2410.c
index 66d970854357..e623e24d3f8e 100644
--- a/drivers/usb/host/ohci-s3c2410.c
+++ b/drivers/usb/host/ohci-s3c2410.c
@@ -448,13 +448,6 @@ static const struct dev_pm_ops ohci_hcd_s3c2410_pm_ops = {
 	.resume		= ohci_hcd_s3c2410_drv_resume,
 };
 
-static const struct of_device_id ohci_hcd_s3c2410_dt_ids[] = {
-	{ .compatible = "samsung,s3c2410-ohci" },
-	{ /* sentinel */ }
-};
-
-MODULE_DEVICE_TABLE(of, ohci_hcd_s3c2410_dt_ids);
-
 static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.probe		= ohci_hcd_s3c2410_probe,
 	.remove		= ohci_hcd_s3c2410_remove,
@@ -462,7 +455,6 @@ static struct platform_driver ohci_hcd_s3c2410_driver = {
 	.driver		= {
 		.name	= "s3c2410-ohci",
 		.pm	= &ohci_hcd_s3c2410_pm_ops,
-		.of_match_table	= ohci_hcd_s3c2410_dt_ids,
 	},
 };
 
-- 
2.48.1


