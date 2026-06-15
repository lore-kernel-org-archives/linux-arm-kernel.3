Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0757CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 06:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHx1+R/J17dYEVk2E+ls+XsmeltEygUylDakA0bf7co=; b=sIKp9OmLsp4GjzMOQqzgoRFRCw
	P6yKN95/vXpSxArIQQWG/9X5VRXqU8RrNrH66f/6RPeHSjx0er5wAB5T5xUXGKlkXqhW0lKw8QuFF
	y3oyYHQA9xLRh7ZXHGKVRgQE0Ps9h5HhAwpSsFGLn8Gz+1qO/p2XyU2u4+METyUoCetQQeTHFHz9I
	hh1EaTrETJdXBFu7R/yKqPzcTWtQTJs5JN0dr9hJOWhUqZ6X7SSy5jHwOmBWZBJyO7SwPxorQ/Yuk
	06m2zqwlyvpg7VmgGvKLxBwVLaqVeICYyyMxp60s8S4guBPbSTHiIrzR32UJBBUVLZaKq/O0fHDFd
	ZtdPBZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19Y-0000000DiBZ-2h7Z;
	Mon, 15 Jun 2026 06:50:36 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ19V-0000000Di8Y-2mb1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 06:50:35 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-304e83724bfso4118627eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 23:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781506233; x=1782111033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHx1+R/J17dYEVk2E+ls+XsmeltEygUylDakA0bf7co=;
        b=fA9a1OOzlroY9Widjm95IWKf1UNcMrLlP+Cixe5FgX0HyluQRNYa8v74WrHHQg9fxO
         z0b4VayEjqESMXbuH06GM5rE4vPxvc+IevqJt3xnuFaTNJ1WzB77Q1zC8OQFLNT82Kvw
         PBjo3qdshrA8Tsc0DON7nKQP4J7/ET3y0wnEqY30zp0XynMZkbz+LI7fd37qhsNY+HHU
         oLFGZnLrYZHPUNBILckPMS8BtIdv5wuwPQxYxnzDj+FhDhYdvmvQ1mVGKY4XyqoBYJTU
         7tDsZLNcFTCZZ/44jYcSFNZe9AKHFRuYiCK4ncopoj0TAfHasyErem5weRH28o6UYc53
         IfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506233; x=1782111033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IHx1+R/J17dYEVk2E+ls+XsmeltEygUylDakA0bf7co=;
        b=Fa0DTiFY0h1za1xfHCYYvCmIrXD+KPV+A/dbOoF+FBTAh+nwNRpmyEUv5N1lRGpAr1
         d3JgUP6oP85ZbrXNqPrbY2Hd4HGVIAMg8wZ4QEzl6f6ygoO4oedv1p6Xy8Lq1xFZfNIv
         hGmINqzMRCDeiRXEAzWEhyKCzg1c0nHGJmmfkpciYPEtbR9Gn2iUAdwRDx9D2FF+UlZL
         Wv/uSQwis35Bs5Kg8A0APc8mI9gcVGW0pjiTMvWe4+O8U+rBc0x+XVU3grYbYQ2JRjUb
         eQwD6TY3bzhhr1QW4+TolfS/rq+PAFt8oj/QeBtSFgYB0R7RZvOpHeDhaKg+mcSDHJqS
         07ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hz7KHVwW9wxWOgvzw7B7SYas/kvuILQF3LmZSO6qR5577DqI2F3DqUExa10D0/PTOJVMOTY4cnMv2HkTauLQ4@lists.infradead.org
X-Gm-Message-State: AOJu0YwMepekR5KecW/EkvitYHR99zX7/wSREjiMf6B2MEmPgP8svasB
	o6i+Qet/BhUxB94hnC2RIM5DNrVW7aU+9CB+BJXvaag7ysnomfJPXfCi
X-Gm-Gg: Acq92OGHayFfvI9PiUfUtN0FRH0oWZKPmXXaiXBjxp5i4vFufJOhNSfGOnfM9l4zb8a
	a1z5ckUbubkX8aFMP9NUMXuVRjEwT/db5+HAj52R0CtLYTX4yzhHr57/LR6U9FTXQ8+Fb1sP0UF
	tDIfBmLzSOviBg2Tyy7kGMc4gbnu+zobjPG/nevIhUhlR1ADLXOtDZpzCX1q7F3zT4q0OUXG9ea
	dDpXb+Abblq4LhklrwTutqFvoHdp76fmAxOKYoRMGeuV90Q3lqRoTIDq5gUieBehFC9OKE4Pe33
	/SJuPqa0zSIWZfZvddsiS3BhIVvznGX/iPCSR4Yglc8QQKqOaEFrI16ihvEPY9bKcj4R9rmMY+D
	7V9qWP/SEcURSDcIRufipIdASzi5A+o6hfOGbWp/o1+3h/RUB0TQvabO4dAU2YcV1sldtE3J/2a
	ub9uQA5abdvyQXVQJh8L6mG8M3HV+aZi+TusBKsl6L9OfK7AmEmNvAf8eM7K/Z8EU+N9dQf8JNl
	211G/szhsgh
X-Received: by 2002:a05:693c:3b09:b0:304:819f:5029 with SMTP id 5a478bee46e88-3081ff3dc01mr6294428eec.2.1781506232688;
        Sun, 14 Jun 2026 23:50:32 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb9a2e7sm13516812eec.30.2026.06.14.23.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:50:32 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v4 6/6] drm/verisilicon: extend Kconfig to support ARCH_MA35 platforms
Date: Mon, 15 Jun 2026 14:50:03 +0800
Message-ID: <20260615065003.76661-7-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615065003.76661-1-a0987203069@gmail.com>
References: <20260615065003.76661-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_235034_193735_BDCEBD4D 
X-CRM114-Status: GOOD (  12.99  )
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

The DCUltraLite hardware ops and HWDB entry added in the preceding commits
enable the driver to work on Nuvoton MA35D1 hardware.  Allow the driver
to be built when ARCH_MA35 is selected; this dependency is meaningful only
now that all supporting code is in place.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
index 7cce86ec8603..295d246eb4b4 100644
--- a/drivers/gpu/drm/verisilicon/Kconfig
+++ b/drivers/gpu/drm/verisilicon/Kconfig
@@ -2,7 +2,7 @@
 config DRM_VERISILICON_DC
 	tristate "DRM Support for Verisilicon DC-series display controllers"
 	depends on DRM && COMMON_CLK
-	depends on RISCV || COMPILE_TEST
+	depends on RISCV || ARCH_MA35 || COMPILE_TEST
 	select DRM_BRIDGE_CONNECTOR
 	select DRM_CLIENT_SELECTION
 	select DRM_DISPLAY_HELPER
-- 
2.43.0


