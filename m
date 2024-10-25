Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C3DD0C60D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNn15pq7FtlSd8hCdE286On7l4GZ1JdLdzQd70l8fTI=; b=Aw4dLQKyTB7YL8c32aeONuhG+t
	buWhdfwOR6yYKkX1cHmrXGKKhok1Y7AGf+sUU+Qwi9ddiG3Ri+P7+X9qVqZVMxWq0lQSObmdrth3g
	uy7szxSSTx3iJnKY6z7VcUwnouigmB3GWaYRBG8w9UMC8x9K4ewRtzpG68qy3j2P6ZZEOCRrlcqv3
	bRPbDNVZby/miRHZBgL5+NHsVS4aKife7HF+LyFWLCQnLEzyCY6I4bISAzAJZEdVx5FRAlp/oSvJX
	pXfpEk4HB4pLkC5thzcHafvndNSPsjblY/3CtyLHKz7RbC15e3I+DELEz9eXwbnPjOl8HYWaaX7Me
	OdffN6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KUm-00000003q9Q-3yo5;
	Fri, 25 Oct 2024 13:36:52 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9b-00000003mkH-01X6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:25 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso20688345e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862097; x=1730466897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNn15pq7FtlSd8hCdE286On7l4GZ1JdLdzQd70l8fTI=;
        b=G/FwnueGUcPOcS5iP0bPN0SoFhb2WOGhRVGqnvsVPGwuMQ8exhoKh+bT4CFFgeMnf8
         xBA7hpvGGUrutCWlSFHgkTojO2t/kHyUlaezrrSvTE6mVJQLa1jplff0BoloPy0k7tdI
         Xo/DGWW46BRQ7JL2P717qGoeHPV28gab9f8HxuDetiHg6Eig1K1fv7qPAf8ODh4ngtKj
         ZbeuXdw/8616DwGNA/AYniOg19yzpVN46iKq7414ba1xSvDD6Eoy3ZdHCWCovj71Qchh
         47v1fijEsM9qC4khlnDrwFUr6jcyZORF7Yt9Zt+vCXz9k2RYyF/CN5C6pg8s7or46TBg
         pr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862097; x=1730466897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNn15pq7FtlSd8hCdE286On7l4GZ1JdLdzQd70l8fTI=;
        b=aJoCCc4nz3/RRNL5Fi/y3fhCXtYK3BQ+ROiEC6qwAPf+GjYrOHlEis9jfcNwJi1Ikq
         pMXagxCr/Zn5hSquiU5U9uLnmGa/LGP/rpR8kndeO6dKw58cfBWI3vwevzykex7HM4e2
         tITC0MH9Gav2lFKGdo+cmYidwljsJn6stfreFWNhPoS3yXXyxG2R4XKDPWAYSP1HdyuN
         SODolKTfSWeUvxh0fxpqtPrAVxEVK9nEMHONk1iUsjvukBgQe63q/2lIOOhE9po8wxIM
         Z0YqRcHlYFvEebnzmgf540N7l0j2//zwdMaDhEfLsHsRWePsjNhXI97+p/6/sYMgfxxl
         kg4g==
X-Forwarded-Encrypted: i=1; AJvYcCWVnnzSy8K0r6Rn4BvcCBz8jFlqfaESn6XH8i+UXkz7SAuOkh6jWTaOn4TC18lkXd+Bbam3B1T5P+ggg0C9522a@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0O3vuI90YWgntav2thSYajj4vLQ9uKboz1pt5G5JKBBwvpjqm
	aULm2FK7rLjnpk/zSXlcdJfDvcwkgfX110VLDfLdeCktOs2r3xae6PnsoNh28uY=
X-Google-Smtp-Source: AGHT+IGmYuHoaUOEGVL/28LOiMK/A9Q47ttebm2jL0yHOWlag+R8pd+KgV3xQfuxq1xntOnAKAHD4w==
X-Received: by 2002:a05:600c:46c4:b0:42a:a6d2:3270 with SMTP id 5b1f17b1804b1-43184224094mr87230815e9.21.1729862096953;
        Fri, 25 Oct 2024 06:14:56 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:56 -0700 (PDT)
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
Subject: [PATCH v2 06/11] scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
Date: Fri, 25 Oct 2024 14:14:37 +0100
Message-ID: <20241025131442.112862-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061459_068497_6E6E68B5 
X-CRM114-Status: GOOD (  11.57  )
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

Firstly exynosauto sets EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR so setting
tx_dif_p_nsec has no effect.

Secondly this assignment can't get executed as samsung,sysreg dt property
is provided in for this platform. Meaning the execution flow will return on
regmap_update_bits call above.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9d668d13fe94..d4e786afbbbc 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -205,8 +205,6 @@ static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 
 static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 {
-	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
-
 	/* IO Coherency setting */
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
@@ -214,8 +212,6 @@ static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 					  UFS_SHARABLE, UFS_SHARABLE);
 	}
 
-	attr->tx_dif_p_nsec = 3200000;
-
 	return 0;
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog


