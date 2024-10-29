Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1456DD3A694
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 19:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=; b=ylSx5ioDn5CT/7JJ+HCzjc+Nsc
	0/BqJfWtLtNi0nf4sS/eEEjlDc8QGu1gM2ac62lhQ3jl2IH6HaaDDj0DVCwW4NZoT6AROejMvnfGf
	PRcAKgLxvHoTFb6BCJY6RugznXcGvJPV5LKwB7Fxhc05o5TsSfgHK0+nSptj6SjnHnV1jo4mc30oM
	/vdlH1vlJzyFfKJ2jtkU2g0NbAL8RdhsVECJU7jalmD1qeFcf5HV0MWWE2qgZBTrHdieG/PawbIwm
	Lz5E/Lfea0VWSnuOcCb1Se0XMRvx9ImgdCgXvH8icZ4tJTk42qH+3wgXwNWMSfvIOmTZ2+Lfn4JmK
	S6SIgyEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rec-0000000FdI7-3NMf;
	Tue, 29 Oct 2024 19:13:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rcv-0000000FcwZ-2WQf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 19:11:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so57019905e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730229095; x=1730833895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=Tl4jHymAxGFYO9SdAjTQwf2pIZ+TozSBR9QxICDzhELgMN/TyLlwibkcaOza191Zm5
         KuNd47v5XDjRpEvNPE1nMM1o23DhFdA2dxBqb3rlwZhMVEBAP6CgKf2G5wc7H9B8IvE0
         fRMOnjYCgU+4ubNVMcuUeLIAz3eaE4XGQZScUpIK9P7X/LlmLGumEvguA8g8w13lS7Xi
         qPkVWyD9u6nu+zTwmmbALaj+casfNDCC0XREkwn+pemhcGmpbSgiceDGD3XdWfuCzs0h
         w86+OYJBKhM0SJ3u9mVFwd/UWZJHb1I0v+d54KQaA/wAAzG1+UHyM+cndFJNK5wU/cOe
         SKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229095; x=1730833895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=RP40kZ/hqnOgmljiiHOcWP556sjlJ17902cQznLSTszLtMcP2XLeqeWdFq0RPFjcrE
         Ld1R/DxI/hDV4pE4HXVVw1dx9HOB6xbhGdMeB2Hx/+B4lz9CLckOm7IdBFz0NybKLvQ4
         7F3XsLNiA0e+/Et3dT0XAt0HRpK3szJ/C8xdmhPJhYrUqWaag3obyJu0SdW+KNxUlAay
         EMz+ZvYv9dyeVFlZ7GzQMwr/rvwFUbZpHx0DsyQ9DP79GPn6DEFPnWH+s6q40q2R9y8J
         9MPtD/UcvpZizR2Rym6jNualzuf5kvIRl0HSgfFHkXzCpve4baQNsEgzTLzZQtELeeVY
         DC+w==
X-Forwarded-Encrypted: i=1; AJvYcCVQwovctCSciGhw01wOwqA+sahq7vIAyZdEAXukngYkSPUXhmrUrg31r6vZgqzGxlqy9Yd2VODZ7OrzQjSiwkAM@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfoews87rwl3C+BDMM+GqAcnZTFwFOuAvkk37kjhVhmQLmJlRO
	NaljTmGMx4NznuAKIEmq9zuBB+VzchumBtg1rfHzCZeyRQoeK45JEZlpzSHiysY=
X-Google-Smtp-Source: AGHT+IFp4YehJs7QQecchQgE7zUujr1IPc5oNzBTFVOT84j09Z72l+JK7DtHPQFmUWtHpLEwEKBdQw==
X-Received: by 2002:a05:600c:4f85:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-4319ac7408dmr115069765e9.2.1730229094979;
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4724sm13318763f8f.115.2024.10.29.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
Date: Tue, 29 Oct 2024 19:11:31 +0000
Message-ID: <20241029191131.2329414-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_121137_709794_9C95AFA0 
X-CRM114-Status: GOOD (  14.95  )
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

This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.

Now that we can register a SoC specific regmap with syscon using
of_syscon_register_regmap() api we can switch back to using
syscon_regmap_lookup_by_phandle() in the client drivers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 +
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 684b9fe84fff..f3cd402e5795 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae..349d30462c8c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
-#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
-						 "samsung,syscon-phandle");
+		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "PMU regmap lookup failed.\n");
+					     "syscon regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.47.0.163.g1226f6d8fa-goog


