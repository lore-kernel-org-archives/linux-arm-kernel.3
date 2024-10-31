Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03312D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGlRIDiWOIW/oUdNVyUFBt1pPENWr+qbw5BPnPtDdZA=; b=M+Ec+eVg0hdgP4NGt19DH8QTKk
	KJ/QoqDrtQnw1iewi6qSPrVOep1QUfdUF0fumNVb0HLWclIrn69kuZdMM+pXopSqGvr/kF6i2HtoX
	jUOxyqb+e45BQpGWMMbA2woHWCI+YDjtsg738jBhu/laNmtTRGvmoEqoD3HFiXF25+/oIWqLBwghn
	rjyM1Hi7+Iw+nKdDebYa1LqDrQGcSj03spH7/x2aVUsy9fxAA/5TECD9NkbXhJC6nzppuRyWSho/M
	JQHgMfFRNdQDTRWtN3RKiintpes5u2jQkznk2uVbQWXANUQDHdi5RjBsx0xfLZ/Ku5F+FbI1pBeqE
	e8YFJAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WsO-00000003wRL-2jbf;
	Thu, 31 Oct 2024 15:14:20 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfI-00000003teu-2shu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:50 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-53a097aa3daso1007884e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386846; x=1730991646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGlRIDiWOIW/oUdNVyUFBt1pPENWr+qbw5BPnPtDdZA=;
        b=kyIyesYUtMeO1hNufFR2zWhFlYPfaU/XTE4zp+WWpJje3OTcCl+1hTa8XbiIcQ1q5X
         I4TZYZEQWceuZuipKnUssEJCsOHzasxiJ0t4RJOVlumI3xYT94+Fb9Vv6dHbzOP9Xhpt
         GEKaV9X4Lutm2fkxKp/xiWxM7axwIc+pe98NOZj9iUIw4PWrHi5cBzqd7obqJaRC7NCr
         gX3vnAjatpvA/zv05Ci9RAWJEndoUgYlLLebskB0a3DuGRRkT9p3o2fm3VzriAslh5Vm
         xrDrp5RjIOm4m4/FMcUSBQABWJ1VeV0gMm0y37ks5ioUfnH2+kYBK67Eg0e6U9P9QaWD
         qi9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386846; x=1730991646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EGlRIDiWOIW/oUdNVyUFBt1pPENWr+qbw5BPnPtDdZA=;
        b=YHiDid9uHkNI9BmyedRfV6lOT7ks1VURg3+COQ6cv3NVrbDnzQUKy6M/maFDbCFIS+
         qhKU76dND95hRwvXVMvE0L2/BYEH9cg7GAr3XHyUkoycQdOYu9H32JFUJgk8FFyWO563
         AIJo1bkdms/eZy8kzQNb04Rnc6a412ms6/OnGlMkZ8BXJqTXFHPLHuLoNyraJvsPG+1b
         67sRNOZv6BfFV8IvxxauOPmtLdlH62M/HMkvyqlmZCLABmUyNIDakqu0j0Eop4x/It2x
         /FigheVReNiTzCd7Hs9If3R99rQhirDe22tXUxPFSou2ytBKLX4+wT8TEAWmg6BflgPa
         3fIg==
X-Forwarded-Encrypted: i=1; AJvYcCVZGo2F/5vvEYOVzs3tm49u93+6ML59x04DGn9Ht199iEjcugwn+3RGSi6gZ2+CfYzv8j8spMrMcR+N/pjF/qxB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+M3TaZED05eLkfXOfS2NiSYUe7eWqZ9RrIliDNYJV5NKRVJz9
	7otxyTofCe9JMmMTuiovM6b0T0D+S5INnFnkUwLTgeXyVxbjCZNLX1zts0fXntA=
X-Google-Smtp-Source: AGHT+IEXzbBlOP0V8hZQy8KaxBb5hcC2ucoOBrtqsnAW7CPkAU8t5qtuC/NhFTjTUjwZ36RRBVibJA==
X-Received: by 2002:a05:6512:32ca:b0:539:93e8:7eca with SMTP id 2adb3069b0e04-53d65e02513mr162912e87.35.1730386845937;
        Thu, 31 Oct 2024 08:00:45 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:45 -0700 (PDT)
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
Subject: [PATCH v3 07/14] scsi: ufs: exynos: gs101: remove unused phy attribute fields
Date: Thu, 31 Oct 2024 15:00:26 +0000
Message-ID: <20241031150033.3440894-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080048_751579_DD3D24AA 
X-CRM114-Status: UNSURE (   9.08  )
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

Now that exynos_ufs_specify_phy_time_attr() checks the appropriate
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag. Remove the unused fields
in gs101_uic_attr.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 0ac940690a15..e477ab86e3c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2064,26 +2064,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 
 static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_trailingclks		= 0xff,
-	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
-	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
-	.tx_base_unit_nsec		= 100000,	/* unit: ns */
-	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
-	.tx_sleep_cnt			= 1000,		/* unit: ns */
-	.tx_min_activatetime		= 0xa,
-	.rx_filler_enable		= 0x2,
-	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
-	.rx_base_unit_nsec		= 100000,	/* unit: ns */
-	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
-	.rx_sleep_cnt			= 1280,		/* unit: ns */
-	.rx_stall_cnt			= 320,		/* unit: ns */
-	.rx_hs_g1_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g2_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g3_sync_len_cap		= SYNC_LEN_COARSE(0xf),
-	.rx_hs_g1_prep_sync_len_cap	= PREP_LEN(0xf),
-	.rx_hs_g2_prep_sync_len_cap	= PREP_LEN(0xf),
-	.rx_hs_g3_prep_sync_len_cap	= PREP_LEN(0xf),
 	.pa_dbg_opt_suite1_val		= 0x90913C1C,
 	.pa_dbg_opt_suite1_off		= PA_GS101_DBG_OPTION_SUITE1,
 	.pa_dbg_opt_suite2_val		= 0xE01C115F,
-- 
2.47.0.163.g1226f6d8fa-goog


