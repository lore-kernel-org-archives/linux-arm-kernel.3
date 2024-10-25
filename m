Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D8DD0C5FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ndmeeqYmXUmeG3ahgXNOhxMW6zZzHIs2RxYCsW225E=; b=Ty2ISc/ITQx7QsGsKjGfp+sNyc
	qEDODE/DR8wIBFoUsGA5Cvox/LOLWogOBk+vhLhZ6GY0uuSqGecO3LttCITpRlwzh0LWwHN0pOTf4
	95QD9jk0pTVG+ChY+F6IX2fnBeaujkEu8f6J1SB+qBs1/xolXnFwPhh3v7SYZ07iRygfrvfKyRCF2
	nw3obW7O3qcU2KHL4BvGhAiC1TFkXZUas91uHJKG8sv/Rg+CBR73XutmXGKO3r2YnpaHMrvm5C6xw
	j70c48FiydM/2TjPrnYT6ffON8U4GA8th6jQevlUkh6fIepQrydEoJXEMqToiNfuI75rUQ6zEFVLz
	/flGfVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KMz-00000003oxu-2aNd;
	Fri, 25 Oct 2024 13:28:49 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9V-00000003miq-3VjL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:12 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539e8607c2aso2359111e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862091; x=1730466891; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ndmeeqYmXUmeG3ahgXNOhxMW6zZzHIs2RxYCsW225E=;
        b=n+BxK/GFVc2KWPtjTEnTlmVHkdMUeVKKb56KYGEWQBuCpozv79jHiDchr2KTKrqYwG
         VeCcHUL+e3WgyQq46edsKJi8RGD7MGz7FW7eVdqFaFusCVcaQJv/WVx7sIe1cNkAt0T0
         vM3vcHGxswDCJWXjoj8Uj3uoA/va9M0j3H97UEb/5SdrWZbtkR1fV5x8IE9KVHuPJC71
         dW751+gKfJ+xuFhfwQ8oggMczFPGxcm/VQk61bQKIYbg6GJNo4YEAoLVAzNoKUWk1/1M
         7WuwvveMHTpL7Jm4wqsFheqcgbHBLWRZiyGwwRBCqRu6XbbniKRGy68XdOODPK5tM+ej
         k/uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862091; x=1730466891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ndmeeqYmXUmeG3ahgXNOhxMW6zZzHIs2RxYCsW225E=;
        b=NDhn0tYglf1JkD3nFbVICL8UNFhlC7ANoIzTjKhvNneXjx8l0ApBRp1qVhVpeS1ieY
         po2QNigEjD0gSg68vOt5+5lwuw8bgAspqFnDEgmFp1sF3bsIDtON20TaaQ6Fc/U5qUxx
         Sx5zaj5FTLD49F8LCmW1dvya3kNsiGU1o3wwtLIvGS9xdAVLbgeLypm3UOIwXRMb3RLM
         bi5b3iidJ2hrYVOENAbC8eLTmK9ic/6g4L0+aXnd+AIZlBJTpG50dwQxqJTUqtk5wYqn
         XByWmzwBf7Z6AnhPdG0p5Mtdmr8xRj78zF6gcq1DWbZQSiYyYMJq4QQYRqEzpesuAt90
         defQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDvwMvH1kqp8GMggoitIBj3E/WcZEZn/MijVfJ63k9jjDmoYO8PXM76I1gSvWQhFlgUw5O/MoAm0fXKKjJGDV8@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ4DXCs7grcHHMbbQvt+u0GvEreEwW2/fXdfcgx2e6RLw/3ZLv
	NWWy7zfbrnPaiMZJhf9MQrAX66vh2MyhwSAo2TekFtasrncsV3Qb8bu7Vfqi9VY=
X-Google-Smtp-Source: AGHT+IGqC8HKU9NrjiBFGdut1et0Yr+WYmeKxlnHqZ/w+vIyRSTfXiYFfbHCJ6h5jr2qgVPoi7F9Wg==
X-Received: by 2002:a05:6512:6c3:b0:539:e279:b3da with SMTP id 2adb3069b0e04-53b23df5806mr3664939e87.18.1729862091324;
        Fri, 25 Oct 2024 06:14:51 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:50 -0700 (PDT)
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
Subject: [PATCH v2 02/11] scsi: ufs: exynos: add check inside exynos_ufs_config_smu()
Date: Fri, 25 Oct 2024 14:14:33 +0100
Message-ID: <20241025131442.112862-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061453_895053_51DD231F 
X-CRM114-Status: GOOD (  12.76  )
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

Move the EXYNOS_UFS_OPT_UFSPR_SECURE check inside exynos_ufs_config_smu().

This way all call sites will benefit from the check. This fixes a bug
currently in the exynos_ufs_resume() path on gs101 which will cause
a serror.

Fixes: d11e0a318df8 ("scsi: ufs: exynos: Add support for Tensor gs101 SoC")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index e25de4b86ac0..939d08bce545 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -724,6 +724,9 @@ static void exynos_ufs_config_smu(struct exynos_ufs *ufs)
 {
 	u32 reg, val;
 
+	if (ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE)
+		return;
+
 	exynos_ufs_disable_auto_ctrl_hcc_save(ufs, &val);
 
 	/* make encryption disabled by default */
@@ -1457,8 +1460,8 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 	exynos_ufs_specify_phy_time_attr(ufs);
-	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
-		exynos_ufs_config_smu(ufs);
+
+	exynos_ufs_config_smu(ufs);
 
 	hba->host->dma_alignment = DATA_UNIT_SIZE - 1;
 	return 0;
-- 
2.47.0.163.g1226f6d8fa-goog


