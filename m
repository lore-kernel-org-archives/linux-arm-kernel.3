Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEFED767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2Vb0OX4E/WTGDIc/yOnji+pIDApby9HKvJHMTYprvI=; b=K8BzHq/bb93k28+uwXRPz6xYWc
	AkQNVz52I7fAe655GXRxJHaU/5Ft6fHV2z0qeFhVf1vIqHcybmDH1+8UisJgJncIvCu36A0JRbzhD
	VHHGK9QAZIeXJeHwJYtO0UbAelQl86M5kMLlCTQ0VQ4fTAtj9iU9ZIyqsGqAmgIAdVrN68bUPb8hp
	dJWNifh+ab/TGsl49lNWgca1a9runiM4Sn0FfTGzxIoOBieRSjcLuR8bnf2LDkNPOk4gBcMz3lMdv
	UHPPEgVE/fBSqfHA8yinIVTDCw97fksTHEX19OK0WDYe2o3Z+r/gPZQiXshkX0q+9CJVSLbNg6ZO5
	fufxsezw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wlo-00000003vOU-3OJT;
	Thu, 31 Oct 2024 15:07:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfE-00000003tcU-0GeO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:45 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so756334f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386841; x=1730991641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2Vb0OX4E/WTGDIc/yOnji+pIDApby9HKvJHMTYprvI=;
        b=pARvwh4GN/LFeOOgtNK823fU4z5vio2hmX5DooLCzgDRgSz1tJHhnk/z0XQd5Xuo/3
         cuLjB3Tj7CCtqMlfRlv83AQ9J+2lqEbLo4UX2iTE/UVOszJdZNFZeVwVnfMv8UUrYaBi
         b0ynPA6pQU+qbfI2lYMUT6+f0R5ZdqU18cBsflJmdjB4BQ1R3bTH8cIl5ES5L1Y4Q0/M
         C52OVWKlrXT+nfS5M+NALgXD/19Zu7VbI1hoozQftRwgIdFMffdt6QsKTRabnnLwmhw8
         zSQFEo+zeQi5D0P4AR9r2Ys/ry+25WMiVL4aKw/PNuHJPdp8jiiUHx5vpmM46zvvKhHz
         hDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386841; x=1730991641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2Vb0OX4E/WTGDIc/yOnji+pIDApby9HKvJHMTYprvI=;
        b=oMAiYbMf339HBDyMTx6MHH+YRwuPVZ3z1eesh6H3vqWeNkZ5cnt4Scc8NOIu0o3sAC
         SzgdeWma76i3YQIk7CnpWQ3X4FPHylRdsttP5FdG/y29DVkfAmtgXbSEkUB+qeCMvxlb
         7QpBBPOzWIBx32zxOBgwGTbkuQRbPqc04Q/cFpWY4Xf7Qj2EK32eTPafiiQGWPwM9zbu
         qB3ZuxSZebn0mJSKoeDe5/e7QNglQONGvUmc3fPFbBCWj+a07Ce5ksT44Fje++CcAwZ5
         iHQs8zUhHkoclRt8IMzW7beHYNc/G3wdQcnMJzVd/eP0f18u6h+V4KDPLTX+EVtfhfM/
         BVrw==
X-Forwarded-Encrypted: i=1; AJvYcCVsGdaHkil6yLMzt6mjdd/V+RkjtE8QRpSie51T5fmG5ackosm1+8N0h22uINgL72lpqARoVb1ClcjKXSQjoPPW@lists.infradead.org
X-Gm-Message-State: AOJu0YyEx0grEBt3dUugzkCXkeiExmF54WPyPqdf/adJ6NZkr86h3nx7
	v+uiC3zATJgsXozi17FZtoY6TBA5c+HMymoduVluThdQY2NBr58isqWQ+5aJzLI=
X-Google-Smtp-Source: AGHT+IGXtCtOp+k+YpkFkrrnLo8FdCOGm8rJP9u1NXSvYnnTVw6wLqsMEn/qZwk48etVCRMN23bvZg==
X-Received: by 2002:a05:6000:1a85:b0:37d:4125:5cba with SMTP id ffacd0b85a97d-381be7d8c46mr2818779f8f.32.1730386840477;
        Thu, 31 Oct 2024 08:00:40 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:40 -0700 (PDT)
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
Subject: [PATCH v3 03/14] scsi: ufs: exynos: Allow UFS Gear 4
Date: Thu, 31 Oct 2024 15:00:22 +0000
Message-ID: <20241031150033.3440894-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080044_122416_1421CC4B 
X-CRM114-Status: GOOD (  10.52  )
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

UFS Gear 4 offers faster speeds, and better power usage so lets
enable it.

Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
so even if the device supports G4 we end up negotiating down to
G3.

For SoCs like gs101 which have a UFS major controller version
of 3 or above advertise Gear 4. This then allows a Gear 4 link
on Pixel 6.

For earlier controller versions keep the current default behaviour
of reporting G3.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: Added blank line and split hs_tx_gear/hs_rx_gear into separate lines (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 7e381ab1011d..33de7ff747a2 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -766,6 +766,21 @@ static void exynos_ufs_config_sync_pattern_mask(struct exynos_ufs *ufs,
 	exynos_ufs_disable_ov_tm(hba);
 }
 
+#define UFS_HW_VER_MAJOR_MASK   GENMASK(15, 8)
+
+static u32 exynos_ufs_get_hs_gear(struct ufs_hba *hba)
+{
+	u8 major;
+
+	major = FIELD_GET(UFS_HW_VER_MAJOR_MASK, hba->ufs_version);
+
+	if (major >= 3)
+		return UFS_HS_G4;
+
+	/* Default is HS-G3 */
+	return UFS_HS_G3;
+}
+
 static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
@@ -783,6 +798,10 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 
 	ufshcd_init_host_params(&host_params);
 
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
+	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
+
 	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
 		pr_err("%s: failed to determine capabilities\n", __func__);
-- 
2.47.0.163.g1226f6d8fa-goog


