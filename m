Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9901C88E66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=; b=0bPxApVdBETu4NhcqN384uOq+M
	vfjLCNzFWOQCiZ364A+zZ96I37EawDA4Q+8hq+3M/9iz+ptuXC8/QyiDFH6JsF3tbEgwoTr2OUt8z
	6RVHc1umfvqXwKJT9I+a0S8/LFGZGV+Z1auxa4aLPLyZE6hoGiD9xVlc0ucQbt4R1bgbCm5EwiSSG
	j66nGEIJhY8TY7DG2D4S4s7UfthxJoXqiDz8f4lVDcKrsH8eivMTcu5KRxorKhcvkUvhVNw5v29M7
	JxqQXP/3hSft9DKgwr0+Gu8N4fM0mLPLGnHd00+RdEjk7ustpghOWBS2JAPA+bbzvrvO+wqgZ2r+n
	Yh7b5oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgE-00000001kRY-0K2O;
	Sun, 13 Sep 2026 14:59:42 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5lgA-00000001kPx-2Ipz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 14:59:40 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso1277099a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311578; x=1789916378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=WmSuXkLTI5pYPXLr5I7EVX9+EIurhIFSOoa26G/G+lYOXGUbhDa/Zv6uhJNvRWiWiw
         YqUS6Fh+V8uNhFi0gI3e0sZI9fIiXnXkT6qZuFtIqJRMmHkLtCS84ZmzUjpKR6rg16vS
         JRCZLAUhrXzRo5CkizMS0y/XZ4XJFQt8CgpQR8zcVKQq4KUM9JWk76wY1XHRSGTtFkcI
         AipSox9nEkEir44x5i6YMPhqW/5CRxQBOBUFUj14ulkITCcsjnJ9f7XkkvHbWf7UiXtx
         +aHWbIu9ll7vhZqC/C4yv+WDj4iPUAUEH8vsfCX19y6XxpBH+tmuHpuN50m7GDChdVq3
         hNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311578; x=1789916378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6v0v0q/G/gLroOU57+Sotz0AlKiMNuB5Ilcu2TBSVco=;
        b=fQHxT4g4q9V6GbiDlSUo8YtkbhYZJN9qXxqUHOYaJb64nTQKzCSPprxyXvNEfc4fMG
         ZoL8gNjP/ZpG7Idcvq3opNSiBTOFmzIgWZsYuHug+7eknpfHBrLD7yT08pWX5idd63pf
         Yg/lb5wEVoPeT6JEuTZvqnEEBkk/lH4V36FrYAjJCzDnLotuMVzooyVCAuv0uEfTwz3i
         YWgGkqlcbWi32v7GeSGhT4sTPj1DiXSLTibB6g4gbgwM3kiNieK3W2sehiIKelj/AzHz
         GQrPpLJY/K/j7nEBIpy/wGmU8+cWxlFOIPxQr8pePrq+EXQnDchTEkkg3BeETyIQCi2U
         qIOQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0kzfyHjcNyej8R35mLGtNM3mvYM9p6ZFgUqIlP/W8X0nZ2KrraeKqNc8jlU/sjcDhCv9YhIzhjJ1SPwuILSfA@lists.infradead.org
X-Gm-Message-State: AFuF++kv+KC8KwYwmqmctm6kMeeZphcZSka6ZLsd0GTIjHp0ttDEdflG
	ANmThh5Qw4pFZsRODHMGhjB9Ps5z/6+uL7ArpxJx5yQxWOjfcsIM6de6mDDfMw==
X-Gm-Gg: AYBFou3moLCGNwrlJt2Pk/FQa0xzR8DBXxwb1QiuIvjMugVmHPwAXK+g5mWjtyypsGV
	avBSgFNlBeQaRTxD1sNe14lsJeB04QZa7U7XuhqrhC5xZ51FZ61mqa33lz0EPh2EGRZ2CCZogex
	/4RrFA5+/9gOUf58Ct6d+J4AfNTGT8XnOAJxD/JyopHmGLxBvq0Cvl5mGnhRCLklVm/bTmlWTwe
	tqK2GSg7+P87heS0OPrOqeMvOiyg0bpd0fgYxzIMAfe387LHcQGaBEBnrt7dn5fM6kSqF7MIiro
	3tm7CQloNWq5iykYSoyy3VxasNN2jfS1XHpiyFVCu1UG7SUvwoKsfcqE8x/hyIbGJwIy+CwddhJ
	P09HHpJ7eaxSJl5U9LVIWygP0xVRO5MLhav6d11YnpsK7dqzvBgrTGfghGWDDmtDCAjbYdFG7F3
	Y89KkPSHtNNRGzn0eDPbaqwGeSLMdXOzqQXCCKJj4gk1o2qWvKC7FxYlo8AeCnZ6cKuTR7J3utU
	g==
X-Received: by 2002:a17:90b:2588:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-39d9bd99cc7mr24628579a91.10.1789311577951;
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
Received: from archl-rock5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm17536306c88.11.2026.09.13.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 07:59:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-pm@vger.kernel.org (open list:THERMAL),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v9 3/9] thermal/drivers/exynos: Handle optional triminfo clock correctly
Date: Sun, 13 Sep 2026 20:28:31 +0530
Message-ID: <20260913145905.9404-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260913145905.9404-1-linux.amoon@gmail.com>
References: <20260913145905.9404-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_075938_596823_043FEE4B 
X-CRM114-Status: GOOD (  15.18  )
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

The triminfo clock is obtained using devm_clk_get_optional_prepared(),
which returns NULL when the optional clock is not present.

Update the clock checks in exynos_tmu_initialize() to test for NULL
instead of using IS_ERR(), allowing TMU instances without a triminfo
clock to initialize correctly.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/thermal/samsung/exynos_tmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 825dbdef0b9a..a64b11e6acdc 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -258,7 +258,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 
 	mutex_lock(&data->lock);
 	clk_enable(data->clk);
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_enable(data->clk_sec);
 
 	status = readb(data->base + EXYNOS_TMU_REG_STATUS);
@@ -269,7 +269,7 @@ static int exynos_tmu_initialize(struct platform_device *pdev)
 		data->tmu_clear_irqs(data);
 	}
 
-	if (!IS_ERR(data->clk_sec))
+	if (data->clk_sec)
 		clk_disable(data->clk_sec);
 	clk_disable(data->clk);
 	mutex_unlock(&data->lock);
-- 
2.55.0


