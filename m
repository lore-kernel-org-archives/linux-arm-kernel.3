Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC14ACA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVrou259Nqx2mf6vUTvrTuOu7ushA+qQgGCR5MKGSus=; b=nojgOhKmyPdpx/LsjmEHaBxiW5
	eH59/N1E0FC2my7g4GJPK6l5wYOvhsDY8rhBHRKgZoNewyi2SM71c0kTFaXG+mSXtVWu43nHeSak6
	IfA7m8qYwIcIPfW2yd9JuKhj07ab0VTRVQeDaa5EqRXgR+feAJ0UYV8i1bDb1ElS4Q71qP8e8P6tW
	ozt0vopY4MCftJRqaxV1d25S9E0QUTIxgAg31IlJNO+w35ucM7mZgn5ahLMBtqX/lT0RxFkkUKzrM
	jTDhw/95lCB8WsWqD0UOjdsbIHZe0Sajj1OiB8h5r2Qvlwz8ZBoV5lJvxLqQW6xEE8dmYpBLat+xP
	audSJNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBrO-0000000Don7-3Laa;
	Wed, 13 Aug 2025 13:49:46 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umBFa-0000000Dizq-1t0f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 13:10:43 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-31ecd40352fso5812694a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Aug 2025 06:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755090642; x=1755695442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVrou259Nqx2mf6vUTvrTuOu7ushA+qQgGCR5MKGSus=;
        b=ZeH2cgeiatIv3J+u56Y18YyPHFfdTs2F1TlYZCiu2gU4hvMIyCSpc7SDL+nmi4oO/N
         2alcAJSCP1PLurtwL9BaeTjEO8JAB4Z/kYPvrlQ1G7mXLPSxPm81HnuoYrIYqyrIlKTs
         6kZGQtt0+V0BFOq0LrEs9FnbJxOOADW2IIHAsqW+cq5p+eMXxdVmlExMYtQGK9n/fc4I
         tfxxwoNPWMPQFCYCoXRZRbY4Kx/Tj6KegiallDtkrnnYn2xPApOwYXauXvTpvIBmj+mh
         xFddByIlTw64Wtk3WsUDk0abGpY45eFSyZHlJw78H1az/WP4iMb/qnrhLgTQ4vbAptHp
         sGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755090642; x=1755695442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVrou259Nqx2mf6vUTvrTuOu7ushA+qQgGCR5MKGSus=;
        b=F/R2dRsoNskpnrO8f90QkrADfWX5BZ7GFymtYZCsW5s9TbYkcN90FUHWss7qeDXuEe
         gT/FF3ETZtpqyuXQIPUtA4i1cQSMekXTLYfOE4msYwQZ6JX9EJ4vgSkLP7vlo5vVeOyz
         S/ZpDSF0fm/B2RFlXa3w2vVN01ZPAbfVApF5a/E/7gmSErP7TzB7/BCHGXDT1xXYGaA6
         Jf4DS1S3M1Xbg7siUWlimLuwEfIyq9jWzUs+4sIfpi2qzEWkiqjrowJGhOxPMqzsPP55
         pqwVQE05oRpVOjGGLPsbJpzNaKN13BW2GVkfpry+a6MkOIW4ST8wO0oH/4cOxtyPaQZz
         KkDA==
X-Forwarded-Encrypted: i=1; AJvYcCVViHGFLzV7gJGRIdgRHnLT5NYs24NNBZ0N1tOjYe9O+q+Y5lVPW/F4OTrQnqX8oe/hoHWgdKixOgGmPZ+iIfLs@lists.infradead.org
X-Gm-Message-State: AOJu0YwV3Ypy4TIJnohXiPaHX7MDOYC2U4ZklTGO7mZVKVQgu29xmuYB
	YLswRbtCPLNh7n4d5pZn1f4oRe43ENwgtZvIS57KTYns0+W+vV0gPUn4
X-Gm-Gg: ASbGncvOKLLwInEOzWB6h0gOqbWa5z6xEusOWVhYq2nUkd9JLEi9v5GtC/CXY4ZjUb3
	tAMxVDHBEKQDLtXXQhOzdFwV+T1MkedtX2tKuDnQohJQW2Na2jzyHmmUV9SAnprA4PkzejMyFOY
	sBBaBANykwKCm//fMaHzQ7QRSls74UXPLAKVj0mex513f14VGSiJTszs8fmYQ4zo75hNmBPbXCi
	dH2VvyWT4N4F65nObyJNIzLWBw+d9NNo1mUlRV493k9oH+DyztprHUWLFx4/tuSyPpE+902/LUh
	MuKf9VNFCJwdBNx3rkDb9x3AVs8wMmrc088sRYajJRGHSy0G6XTh2BeCMkqnRUCQDgKL0jjK0sj
	U3KJh4LVdLeZyTBpmLSgJQM6lo6ZUb0w=
X-Google-Smtp-Source: AGHT+IF9eIDvu72BaiBaVH/s5UjG5F3YVyyMdRM4uurQwBv+OhAFEyxqshUJkkmFATqSx/qzFuLPNw==
X-Received: by 2002:a17:90b:58e7:b0:312:26d9:d5b2 with SMTP id 98e67ed59e1d1-321d0b2940dmr4886750a91.0.1755090641390;
        Wed, 13 Aug 2025 06:10:41 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32325765df6sm161504a91.12.2025.08.13.06.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:10:40 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Mateusz Majewski <m.majewski2@samsung.com>
Subject: [PATCH v7 3/7] thermal/drivers/exynos: Remove redundant IS_ERR() checks for clk_sec clock
Date: Wed, 13 Aug 2025 18:39:47 +0530
Message-ID: <20250813131007.343402-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-1-linux.amoon@gmail.com>
References: <20250813131007.343402-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_061042_488634_6064DC93 
X-CRM114-Status: GOOD (  14.99  )
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

Remove unnecessary IS_ERR() checks for the clk_sec clock,
the clk_enable() and clk_disable() functions can handle NULL clock
pointers, so the additional checks are redundant and have been removed
to simplify the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v7: None
v6: Add Rb - Lukasz and Fix the typo in the subject
v5: None
v4: drop IE_ERR() for clk_unprepare() as its handle in earlier code.
v3: improve the commit message.
---
 drivers/thermal/samsung/exynos_tmu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index aa0726b33c84..5f017a78f437 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,8 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
-		clk_enable(data->clk_sec);
+	clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
 	if (!status) {
@@ -269,8 +268,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
-		clk_disable(data->clk_sec);
+	clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
 
-- 
2.50.1


