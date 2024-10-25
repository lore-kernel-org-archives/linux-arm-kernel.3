Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC1AD0C60D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4p/a/n3EAi1phVyfP45uoVE5rF3xsXeLLa3VUUHv34=; b=DlWxSS2nNLLfH5LaPm/I7e0YN3
	cTAO5AvVdu/Ko1NrUNuYoid3B0bhcKiX0ySJZPY5C+NFfucIbW+tsAnod3SmG+A7yOCXD6yQPG1Pz
	OPfNDjkIYUaYtKHLTuh+rAiL4rFS+C9heS+nk3eJFb2Xx76Z2Fv+MtwrbS8vnpIq7xSbIY8R1waYi
	0UZGILvXlgW4dj12fNkVV/OeR2EdarSl/jObrVGLHXCsshR6gBlvNcno3koMr18OzDBjLuWXa5E/e
	yoQdMulKFNDXE6rcLgcWSGmK327SyGEZJKHBBgM7XJTJ38dg4HqtHgcIxXPcsZRYU4yqkwnU2/H8X
	lTqsQ1jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KTF-00000003q0U-36Jt;
	Fri, 25 Oct 2024 13:35:17 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9Z-00000003mjr-0k4a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:22 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2263555e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862095; x=1730466895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4p/a/n3EAi1phVyfP45uoVE5rF3xsXeLLa3VUUHv34=;
        b=QOrKLSmlBkseiJwCc5rSfGXBRM7Gtw/4iIsMw3L6kqN4NT/wVXRwNl9IOHMhD0S8lN
         hIRMBuK5lc6vc+lbDiYhbZE3Yckzex89IV56BMwaJz/rrx31kn48HsbZHob1Wzsiv7Ah
         caMDBtVy2VUk4o/SEFq9kARRJz7gknb590jRv2iHe2bEZP9ZbDMm/kecPvdX8ABkbnwG
         UKLAhNzysVgXZIVQjNjBsvodqEq0ZR365Akbg4waXIjMCuVBhVYGzG45/0fCVIYsExkv
         HIqY4Ybv+wn9MFo67T9FGoRn/8l21RtKFVmEVlt9k7o+rmRBllzAf/J3l54cNlP/zwOS
         4HEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862095; x=1730466895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4p/a/n3EAi1phVyfP45uoVE5rF3xsXeLLa3VUUHv34=;
        b=bdqBgxKXqSz32yBYurL/CBURsnopQESdtJryant1LwlzU44qWXIXjszt7MTU5vRYUN
         /Vogp4zsASmb1cEFbcMn4swOK/9U7CcpcFvHtPDP/jtKeGzfsiFlbFO6sS/r+Dwoo0sv
         5O0gCxXMz2Jb57i1QBVzaOO0zQgzmzyfo4suZlS5F9caiStJN5/GlLojnQS3rxBylERb
         5+BXli7e33X0XfVoCZA6xjFgO3ZZt/97tn7OaZY60jAeDAh5tvtyH4uDFuk6wgdVc2zy
         AYMXc+iQmUPv5+Mu9RXjalXwEKT8qV/jh/qxcyB6LO3Y9+B0xw1M9Wg+J4QFnqrA8VWY
         ClVA==
X-Forwarded-Encrypted: i=1; AJvYcCXbNc8UojK5MxqZgeOlLQvqqCjNKSA4XVqlsVIx+7cXpGV/2ANHn2wDew//fXJBotRyhDFpM4MijDh8PbFMNEz/@lists.infradead.org
X-Gm-Message-State: AOJu0YythL/9OodsXlkJNBb0BqRmrlCjw2mxYj1t7yojY57UxE0y1bsq
	fXSDBNyj9IXGRnI2ICzQ/SslziH532HA7YvxFgbJK75YHWZLY3YWyo60RJbGTVA=
X-Google-Smtp-Source: AGHT+IF1nqwM65nZ/hmqcna4gL0pzIQdq9UtAly6V9yqCaP7b5l/UQUT68oG19uDiQ23I6pznxiPSw==
X-Received: by 2002:a05:6512:234e:b0:535:6cde:5c4d with SMTP id 2adb3069b0e04-53b1a2f1eebmr5293668e87.3.1729862095389;
        Fri, 25 Oct 2024 06:14:55 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:55 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ebiggers@kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 05/11] scsi: ufs: exynos: gs101: remove unused phy attribute fields
Date: Fri, 25 Oct 2024 14:14:36 +0100
Message-ID: <20241025131442.112862-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061457_237082_E61697BD 
X-CRM114-Status: UNSURE (   9.96  )
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
---
 drivers/ufs/host/ufs-exynos.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index a1a2fdcb8a40..9d668d13fe94 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2068,26 +2068,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 
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


