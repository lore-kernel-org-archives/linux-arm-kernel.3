Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE0C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xmd/8SBDrA1Gb0C+zRAmJUhYPy6kVSRJonEW9B5eq80=; b=QJbBfq4MctteDNmQZW2q9rMhfj
	KxLWnDCsNz7aXsAk8gwUxqfzhSEUDq84+Ab+PGQd7qtjrGDykRSsuESoPhBbLuwAKldjI5xN+fhYu
	HQTcmS82IHVyLKwb9RnbRtCrneOKqWLdrElwEa49fXRfA7WPuNpHmfF4xFtIxMb9FplzBKh1jTO1r
	awfcIoFv04naDUP7M4m+OvRyslhhfEID5zLzQnoyfFyxItBK0LpSNo8/a28OAXYsWbrmsIIGKuqbb
	TRsmsVk7S6bQk4HqQyG6SyXsUo7Y7i5uzErZnuBZ01S17zfVZLQG2jlNkzfp259jtMAayW76odTUO
	W5yrNpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfLA-000000059Zf-3s3f;
	Tue, 15 Jul 2025 13:05:00 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubegO-000000053fU-0OxP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:22:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45555e3317aso23749905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752582170; x=1753186970; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmd/8SBDrA1Gb0C+zRAmJUhYPy6kVSRJonEW9B5eq80=;
        b=qSBMriIihvd3X3AwHqnNhtv5xB7iQ9/sguTC321TWwBYl3O2YZ4Bzf/LrLk8jay8sR
         OFNnpxt2k+wnmVMIF55gMHdw8YMP2/XZRmk0HfrHXbp5jWjDj46tEAWQPAC/nl/g1oNe
         r/kC6V0T0vrrDeFGKubakiVvCsjUc8NrJ8VWg+wHiHEvj4CQDwggla6V3y9oBXS/EfEl
         XYHT5S2W0LzVwb2GVH/qOKjf52z5hgfhJppydW4cNi/Dwv3tmRWen8VjFrbtpcZWxIgQ
         OtcNDLabnnVl2v+kLkckOoEUXsXYMhjNid8mTI3UVpAe9AnB0G/eaclOKr8j1Pzv9SZd
         m49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752582170; x=1753186970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xmd/8SBDrA1Gb0C+zRAmJUhYPy6kVSRJonEW9B5eq80=;
        b=KvFSr5yNyz2Hhy7E2qRb21lmXRHqYv+MSTQIzZa000l0hnysvYjbU8DRQO+J0KbBzF
         mUUgldkgTeNiH6EUTsxYIKbeQjn3Cz+IxYGyZbsaMGa27B65/pB0cZDzAfUBVSi7uy1j
         9UeCI6M0ztMTIMoOBjhHYEqregmkQvzvrnx3aJKsZ319wLYhWN5EvieTgihvnRovo4bf
         bGRx9OJXd7P5jEXF98BW/N8CbPZUKrux19gCbEMWwqXE/pwgAUOEGRxEqdAjI2mhOv26
         nvexedHdy4vdYgvYXOQumRnF7Mb4ybiNGuepPmffoK24DrTlgKsQdW8fYZHhYdVj0eUp
         lU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQPKgjb+flFBAbSUVztLDf9lJpjx+Ot3l2aLvnrsDLj+raktiTgbHBkmwdecjG6HbAUFbpOt1HOO2NhcGVA37R@lists.infradead.org
X-Gm-Message-State: AOJu0YwY5cxnTKFzDqNDPpE7C6n1SrWpDjadt9fR9AzXdjBq9GUr4tii
	JdENQwHGAwpcOCmDuul38qBps1CAdLn93Pdmu0qPueziT4SGPvfDY+W00RAaY7U/Qcc=
X-Gm-Gg: ASbGncs6NUy4B40gtFBAMv9YtP+/6laHiesN+Y4OV8bLSMEFei/mLr/UYHsDWKHvNxa
	4/ZLvzP0WTwMWRNhsk8LXEpTH3vxnLpesiCuQTov1/ZH10FPu5K8GNkZIAGvoudzIU5j5WJpXR3
	F2Ahfmzi5qGpUwlsnfiAFkUGalCJeV6v28xj0TzAkKtJtZONFsU1saOhW7f3jlFZoqwuVw+7IWw
	zofHtOlVxdFDjKRbc0LjI+EYNi+d/HJZxTAyZd/DKypNUVO2QZIFNOg9vg57cBN3zvjuikUYPGV
	1WAlNAZCVLqNHw2GSX8rRPMmq3i8WHtO76B9m9wkVHbicaosDm1NZLQeTRn7k26JuGZ8/d0Qwnn
	Ewx5t6p16G8JnvDvQtWSsR3PVD8bNjyxXJ6vLTJ/cdC9Fl8vh+Es63VyaIF8=
X-Google-Smtp-Source: AGHT+IGMRtiWeYVCYMElfz61z1ti+Ou58MocKqgLTppI7XTuQyjsyQV8LFvTq6sg4P0VQ4QxNtmmjw==
X-Received: by 2002:a05:600c:4f52:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-454ec14677bmr165238895e9.9.1752582170249;
        Tue, 15 Jul 2025 05:22:50 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd537785sm162850685e9.23.2025.07.15.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:22:49 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	willmcvicker@google.com
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH] clocksource/drivers/exynos_mct: Fix section mismatch from the module conversion
Date: Tue, 15 Jul 2025 14:18:33 +0200
Message-ID: <20250715121834.2059191-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620181719.1399856-6-willmcvicker@google.com>
References: <20250620181719.1399856-6-willmcvicker@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_052252_152691_60FCB49C 
X-CRM114-Status: GOOD (  12.84  )
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

The function register_current_timer_delay() when compiling on ARM32
fails with a section mismatch. That is resulting from the module
conversion where the function exynos4_clocksource_init() is called
from mct_init_dt(). This one had its __init annotation removed to for
the module loading.

Fix this by adding the __init_or_module annotation for the functions:
 - mct_init_dt()
 - mct_init_spi()
 - mct_init_dt()

Compiled on ARM32 + MODULES=no, ARM64 + MODULES=yes, ARM64 +
MODULES=no

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 5075ebe052a7..80d263ee046d 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -657,7 +657,7 @@ static int exynos4_timer_interrupts(struct device_node *np,
 	return err;
 }
 
-static int mct_init_dt(struct device_node *np, unsigned int int_type)
+static __init_or_module int mct_init_dt(struct device_node *np, unsigned int int_type)
 {
 	bool frc_shared = of_property_read_bool(np, "samsung,frc-shared");
 	u32 local_idx[MCT_NR_LOCAL] = {0};
@@ -705,12 +705,12 @@ static int mct_init_dt(struct device_node *np, unsigned int int_type)
 	return exynos4_clockevent_init();
 }
 
-static int mct_init_spi(struct device_node *np)
+static __init_or_module int mct_init_spi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_SPI);
 }
 
-static int mct_init_ppi(struct device_node *np)
+static __init_or_module int mct_init_ppi(struct device_node *np)
 {
 	return mct_init_dt(np, MCT_INT_PPI);
 }
-- 
2.43.0


