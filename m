Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA3AD5CC8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XbYElkal5d6+0YzyWk0lUEIt8HVlxkiQ8cX9u9pIHz4=; b=qUTMU9xAP6NF8F1VJ9T2x3KvSv
	zISQeHNYaJ87UT9/yPXQh3jANIb3IDi7NW+agflH7BRUH6NXJHB9I/KgAIeU/PLRDyY9HDG/uFMOK
	7lXPahf/0oiQzRN4ad+wzpFTPdrxMRsNZrgN/nB4BKV6Y0gaxwYmcS7SvWpgmX6fJHt/9TdJxCjq5
	m+5/fdrMukLUg98N0g2YE+jTOzBDP1Nqo8o3qPw4WULtJdxBdy0YmcM4r+J0uRyhIzV5bjoTey7qQ
	jtSx/gI1rialiHUoQLWRTItuWgI7fpjey+3KdDaFyvzmCdfuMvJwI4vQ7TNxb23MPgegVcCYYBuXR
	ZyYQcIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t664N-0000000HZr3-36kr;
	Wed, 30 Oct 2024 10:36:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65v7-0000000HY5r-0zJ3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:27:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso63209205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730284039; x=1730888839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XbYElkal5d6+0YzyWk0lUEIt8HVlxkiQ8cX9u9pIHz4=;
        b=E71DSD3X0Okevp3ldKFBX4XGJWMAaFgTB1ND+Kfv8O2o8tILAgOvO9XyEvQJzsb9pU
         0RsOKIgMJoyhoqXLDp/M8o8SUdFKqM7pVl0H345Mwk0wY5QmZYfEc+6RV9hFAev+clKU
         22k0+rMwKgqB7jpic7eCD3x+O0SGJorb3HPWiam0EfAk/O48N0ks361l820pNyDY3tia
         SBqf/r97DIBS6+kPtVtSSpRFMvzyQzVrQmz+pleKMCbJndMxLMn4wM+dS6XcpXMuvAJE
         6DmabSPi5MOE1FiQ60VMM81YAebjG0iFZcpIoXJip5/C8a3gCh+8le1owqD2LQlCzNYM
         oPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284039; x=1730888839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbYElkal5d6+0YzyWk0lUEIt8HVlxkiQ8cX9u9pIHz4=;
        b=nMYeFD6mm+jZqCR1rC2PsZ8dk1m5j2RffzWcA+mZV2C0XcTH9kc8ifuDEZWRmhgVaq
         FpP/Lz9PRM/r3BOXJMiX5g7b20KPdtLTxVrSNYs4/uOoVD+zg427mi+Y/GPGd9kNSe5G
         WHRwKvcCwBBDqp+cNSdR2GiJNvFtBdXRu9Mod/1fxDGNKmjRQU+DfBybRo0NRdch2yJO
         tC49MX04NQPhKvJBXE9oB2S4KasuzBr9ug3hysQjbCvEBNS72p5zhGBcQN710QG6j8gv
         turMvSbREMHrxidPp2fL2B707n9oJxbDQF6Ngf/nMUWBVdYyOh07NiEnk3eaEU8Z+pl9
         3FoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWn4kRBA4WQeqG8OOvykefD1T6xStuVF8cgYKUMcr1exkNM3RZsrlTj96q5GEYJU5+ibpn3qv6GWFVgN7wVW7wt@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy5rm4f5xeQejmlAtxRFtj790F55QO/K5nb9ZEks1gHa34selX
	8wzodGCMSs/ej+jXpt0mmiILgAhBPM4dkhMOzxdnwin55OmDvD/fSi5011ZZ1xs=
X-Google-Smtp-Source: AGHT+IEBXlayGHv2GLllRn++oS/33OaG/rbc8trQcavkqXJ8lRHX4Tn/XZiU8Jv9/cKndo3pJPqlbA==
X-Received: by 2002:a05:600c:1390:b0:431:5d4f:73a3 with SMTP id 5b1f17b1804b1-4319acb226amr104551115e9.18.1730284039298;
        Wed, 30 Oct 2024 03:27:19 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm17074345e9.25.2024.10.30.03.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:27:18 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: krzk@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/2] scsi: ufs: exynos: remove empty drv_init method
Date: Wed, 30 Oct 2024 10:27:14 +0000
Message-ID: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_032721_329725_DA182880 
X-CRM114-Status: UNSURE (   9.64  )
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

Remove empty method. When the method is not set, the call is not made,
saving a few cycles.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..db89ebe48bcd 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,11 +198,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
-{
-	return 0;
-}
-
 static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 {
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
@@ -2036,7 +2031,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX |
 				  EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB |
 				  EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER,
-	.drv_init		= exynos7_ufs_drv_init,
 	.pre_link		= exynos7_ufs_pre_link,
 	.post_link		= exynos7_ufs_post_link,
 	.pre_pwr_change		= exynos7_ufs_pre_pwr_change,
-- 
2.47.0.199.ga7371fff76-goog


