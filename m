Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1140D0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQgS5nIosT9WP+28fCSlQ/AHJVYYLIctL5rlsevVeIM=; b=ejsznp6muWBxN7UyE6KWkkat7z
	pUO8uYpB0l/EIqf94VnLDQ65wUoPW1rVEofA+uZljw7qerU4bRdzOhg7JoHYGuet3XkcXcSdhn79A
	xkPmPiHejPZ+VbCVXb0CJAjjWGUIiHrBR+gFjSmBniNk/4/AFFkpEVh3JZk1GwwtsKJtRyPQvcSPN
	2LUndoJaNstqAFkrzFdcd47EAPYXBZ9myoq03J4C6Q39TjTihwDMh+eDxm0S0CU+btBQTDZsaKC/q
	hwFkjGK6rZ20DNHUNnj4m5Hz88r9GGZko393T6BaPA4wZ2Dj1/rai3lZGAek/4RH+ASXx/R32IPAD
	F8mYEDzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KQ5-00000003pNg-3TFQ;
	Fri, 25 Oct 2024 13:32:01 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9W-00000003mix-3PSt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so20214565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862093; x=1730466893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQgS5nIosT9WP+28fCSlQ/AHJVYYLIctL5rlsevVeIM=;
        b=ulrL9JaLLmiCAHJmIS2waVvqfgUcy6ivEYHIbGpP/LJlCxYazAQGQ1COeGinhAEPi9
         lj/lC8fBbmpgYpUdNXXZRCRUcgcM7MqntXsGN1b3lNHUzynytMB/9XpQKHz/qIYADOM1
         TqAgR8WKWnWg1K7FYzoeL99lZ2tUsAjvmqBCHl7wdvKGa2WVvJnCmhIWbnPIy9GqmKl4
         ZRw3D72TVa1ciJVgSNXOd8JrZLyjjew+Z+vanpJQImCtajCn6t7bVUOOloyvIqwyrMGi
         F00E8iaPbTFTehL952jr7pXt2n/nKY6wZv0zH3IrxzBH8UC0k1mb9mGenSp6NvxZkHBA
         UlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862093; x=1730466893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQgS5nIosT9WP+28fCSlQ/AHJVYYLIctL5rlsevVeIM=;
        b=DipY5Bh76n8lGnLV2ugvoCcLtQkS2Pt1F6N0VF2VZaMVSUs4i0fup2ia/qBrTt92hT
         9m0s/CmMJL7u/Cea5ycqxFfi2cQfghTG0RxmZgjSh3NiPDXKhTBvoNwG7t0I+DnyDXs4
         tWiU2puj8nkcAAfRUXXLgy7P9opnbgyS6EpU6g6sPBUMklfSJbhX34aFWbWXCFX+naTu
         9jKVZqSyHRcEBDfdZUyDW7epg8dgKmTQpDJqd4/dIhtc9XrFar/mucef+wmv0hOy4WO2
         VgivKzJRnpN04LE/65tIHgsRIWSD5r8cj/rprvhMYxhMJLfpxfVt+OfftGKXMvRH2xWz
         beTw==
X-Forwarded-Encrypted: i=1; AJvYcCUldVS4PyqPxbEzWEDWNo/hsjxFX5Yx/BGEtUu6yi9DbMZb+UQXLiMHvA/E8zMltsN8Wm5s9XAQo+w3W2Oac2oO@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7BUwTLpnhv1xYJeznMD6Wi81ObsoOznhVK6XOqQ7VNUeby6Lt
	G13z7hOGpYDerhVr46KHZt/UE5kgHI12xoz2KKhyNC68dEjSsSDF/t4EwI2cNUA=
X-Google-Smtp-Source: AGHT+IFu6kZDvdli2L18ry096b5sZipxK9OsOWeDSxbyTNiVEAO1GAWmUbs/6CZi5Y3noCEY1ICL6w==
X-Received: by 2002:a05:600c:3543:b0:431:6153:a246 with SMTP id 5b1f17b1804b1-4318414a3d9mr88410625e9.13.1729862092697;
        Fri, 25 Oct 2024 06:14:52 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:52 -0700 (PDT)
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
Subject: [PATCH v2 03/11] scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
Date: Fri, 25 Oct 2024 14:14:34 +0100
Message-ID: <20241025131442.112862-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061454_871025_8EAE5BE1 
X-CRM114-Status: GOOD (  10.84  )
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

This flag is not required for gs101 SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 939d08bce545..d685d3e93ea1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2142,8 +2142,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 				  UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR |
 				  UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL |
 				  UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING,
-	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
-				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
+	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
 	.drv_init		= exynosauto_ufs_drv_init,
-- 
2.47.0.163.g1226f6d8fa-goog


