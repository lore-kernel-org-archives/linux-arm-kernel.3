Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C7AD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+843px0rCbg1sKJc99pP4x3dOG1mc5oHs0HJIyYuQ44=; b=grAhBRkUaVzLl1PnzKISUiVUBL
	pRxaEkIsOOFMTqMyyWj2n5qh2DA7RlF6X5F3BR05uTXLDNFgvcIgQs645+avGSvS/NCLdIt9SB2r+
	ozd4v07KekoBtTNbXFg/om2HUZeO+kUmOC+U33whEkX3VE7vOeSNafdWxHqnwWA5NKnfXCyhgu5XT
	J+0yv0TcLjo6SIywM0hvEtrvf7thg2kVqEtQ1EhvcjMOeHhe81FfXTI+XSsjfTrSI+P0RlKAjlesu
	4ctuTOx4q5v/UOl2Fa3jC5///kaAFThNqlzC7lRW17zxvO2PjewswDQx/eAQZDyBZ0dNbQOi26hWz
	U786mLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAi-000000040aN-0hkQ;
	Thu, 31 Oct 2024 15:33:16 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfL-00000003tgE-1nJu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so9182015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386849; x=1730991649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+843px0rCbg1sKJc99pP4x3dOG1mc5oHs0HJIyYuQ44=;
        b=rm4RS/bkSEgK+6YshUOhJZ248kXksQA/1Jdnvz8KI5zVLQfCeNS/xz8ePsVyVL4wvG
         kLbUQektS8doZxUpsXLwC4TRUxraQEQAjwA5bfH+TnisEQQ85A3xCayopt8/3zXOtl01
         wC/7IB/4B55hXkKd0dMuSfauNfiImMmXjieZ/EP9iRIhtI4VLhNsLlYtprEMsrGg3bP8
         jj5HJsnudXcVdVMuXdT3WtpP+w7rHXtgyjp39bLVNQ2FCZSTuTl+t83iOD+MorLRva9i
         2IlTzFV+V3sCNeuDdTcRLqUqa6z7EjVfncsCxqbbG+LzBr7wHHUpjI1fLXfwRxCqfdt1
         YraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386849; x=1730991649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+843px0rCbg1sKJc99pP4x3dOG1mc5oHs0HJIyYuQ44=;
        b=ISBpS2NkUjcImI9mHtskuF1y3YgBsYt9FpYhd4ev2mRc9j/gY6ybaA2TKRu4BH6pIV
         gYiHHJrw9GzdEGQAEdGNMyeueFFPLwUdzPF6nPg+vFah3YBoBuXyR7GcaVzaM127BmcN
         w0Py6CyNCuVSZnxQ1H78tfj0/nWJTVpwFzzg/rbQekTHBW7W/c4RVcO/kczM4PB3x7oW
         IOzokdpm75yl5DPeKaeFdzjzaw01AkKmSlFd9ouR8pCo/PPolY/eOE2vWdeAWMQVOTeD
         kgB4WAHdggDDKOlTMNtxXnhPyI3BC7/0cLj20zp0sQM8isRRCX04+/xJwbrpTWzHHxGP
         AQjw==
X-Forwarded-Encrypted: i=1; AJvYcCU6L5TJhDQLN0jPdSsOntEj1knxT5xXAw1hpTyDoAumTbIwQ4zDAegDdIBq6sXYliM95yKCVWbYU8CtJifyJwN4@lists.infradead.org
X-Gm-Message-State: AOJu0YyKczpwjTropXw9Qv7bF8zkGt5VIhpvaY0O4va4KmMiISKfXDfZ
	I+gjBqyuuZnrZglZCGgMH2klrjuyUX2z0byN912l+9uJ/cvtU86Z10oHlPkWRQ0=
X-Google-Smtp-Source: AGHT+IFz1+UYr4hSStn9sPc2pavAOWRlpkPtO9pHTEtEu9q/PXw/hM8RRdJlrb371+ewLtzLK5Lt6Q==
X-Received: by 2002:a05:600c:3587:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-4327b6f464amr27709765e9.6.1730386848476;
        Thu, 31 Oct 2024 08:00:48 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:48 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 09/14] scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable WriteBooster
Date: Thu, 31 Oct 2024 15:00:28 +0000
Message-ID: <20241031150033.3440894-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080051_583264_D6FBD861 
X-CRM114-Status: GOOD (  13.73  )
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

Factor out the common code into a new exynos_ufs_shareability() function
and provide a dedicated gs101_drv_init() hook.

This allows us to enable WriteBooster capability (UFSHCD_CAP_WB_EN) in a
way that doesn't effect other SoCs supported in this driver.

WriteBooster improves write speeds by enabling a pseudo SLC cache. Using
the `fio seqwrite` test we can achieve speeds of 945MB/s with this feature
enabled (until the cache is exhausted) before dropping back to ~260MB/s
(which are the speeds we see without the WriteBooster feature enabled).

Assuming the UFSHCD_CAP_WB_EN capability is set by the host then
WriteBooster can also be enabled and disabled via sysfs so it is possible
for the system to only enable it when extra write performance is required.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: update to new drv_init() protoype
---
 drivers/ufs/host/ufs-exynos.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 378c16d905c1..d59e1933b64e 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,7 +198,7 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
+static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 {
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
@@ -210,6 +210,21 @@ static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 	return 0;
 }
 
+static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
+{
+	struct ufs_hba *hba = ufs->hba;
+
+	/* Enable WriteBooster */
+	hba->caps |= UFSHCD_CAP_WB_EN;
+
+	return exynos_ufs_shareability(ufs);
+}
+
+static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
+{
+	return exynos_ufs_shareability(ufs);
+}
+
 static int exynosauto_ufs_post_hce_enable(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
@@ -2120,7 +2135,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
-	.drv_init		= exynosauto_ufs_drv_init,
+	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
 	.pre_pwr_change		= gs101_ufs_pre_pwr_change,
-- 
2.47.0.163.g1226f6d8fa-goog


