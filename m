Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51564D0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mphjevL2wKBjhbt7qb95YXVF8X2HJNmvgdrJOySayeQ=; b=Qg8dql4K/XdPwAnUVl5BjGZMVV
	qJZhDnVOQZomn32MUDASc8R6O6n0PCbKojT3+YtxC6HgP9czetkUBADtj+scJbQWNZ/JeHIZAsI+a
	CTwnQOIVDe4BJBUcDpItc+dVOcTG4wBu356d5z/7V4Qmb4wy0jiH5Zg2VEDN4WLpjsIIMg+Odwa2+
	dAmypJ3OeBF1W8Gu7kSveKBRb5NPGvRUE9ftzE/QjjIzg+MMozt4eRdFK5NQL8Gtp/zizPB3Pmg7g
	rskbBSpPJQmHpxVvsREm60ozPJuujIfvE4T/q1K7Xq3ZYiJnBTLy7jU+eSnp1tt93skFaVZCel1o3
	3Xx0iaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KLT-00000003okf-1Rw4;
	Fri, 25 Oct 2024 13:27:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9T-00000003mhk-1L1K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:12 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-431695fa98bso19834145e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862089; x=1730466889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mphjevL2wKBjhbt7qb95YXVF8X2HJNmvgdrJOySayeQ=;
        b=JsJBJPQTRfQiPXB7BvEGOHkYsIBb87HZpeoq7Jm4Ow0VoPBuLun8YpfzF1OY23QEVh
         PzBAOXwGeZ6Ha18sacmwyxQWQ0xZdsFfQjZf7KvlVbN7pT3ZEOSpNddSPDzPflvSE2h5
         2RiTVNTZ/uBmdEN4WArNOLn2CZvfAGbr0pTMBboSDFcHOwUTI/YLk3Dx3s0hhAR8HRVU
         MLxASldwmlfYI5OAAaUg1sw4gC7vj4Yv/yFwH4FAyzRgbuxFf8SwHEdTtz0eBz9pnBbx
         k789KQW/6cx6TEMPxFnMuTbTQsXGLtapXhaxD/4Mt7NMy4aDs/CU8/oLJV5yhf2RfdWG
         gSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862089; x=1730466889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mphjevL2wKBjhbt7qb95YXVF8X2HJNmvgdrJOySayeQ=;
        b=Qu+urR8bupublMgKDEoDhe7pO+8bZsibVZSDHiAmMI+nV13BmM89WnSTWKfhM/cDtQ
         RX8qwfcUO8odEIovi0NZ+S/DTotq3QjNTfSaG0XBJ+KjHNt5ok5r8wJuSA3lGVQ8lr15
         tc6lGtBvSQZFQmGpxE+krCgTSDXYDqDa16JqYQC/BwaDPhgMcqAfrh0hKLzs4rWBYJRb
         la4lFcfCswMgqBmU8s3P3yRTPnvWUjZpNE1SblzCdO9S9akeFOAzOlBa2D6nSHuK+REn
         eVuNN3ZEp2WErKwvz5+tNPhpjsVgnbwCYIBJ8gaIKAuwwVBtdKainSmAYzHF/Zxk4ITI
         QtGw==
X-Forwarded-Encrypted: i=1; AJvYcCU9c4MMCR+pUCsrIhHWlMRew1U+h8CVLKvmo14YMh7uwAMXD766FUjqSDGIPKYFPhEXDG0aATSsOs/ATwOlB40B@lists.infradead.org
X-Gm-Message-State: AOJu0YwKjnyLrFlOrNh54Ob/Glp5pZKRvoqh0lBGzapEAdrWLefLPmWd
	ilxBmijhveZOePXtscvflCVm5N9AcsyFWefKh5u6Vh6y3Ph2ipUPGx/e5U42EjQ=
X-Google-Smtp-Source: AGHT+IEoUmmF2a29+b6OYTb4dbCjEKsfEZfPzHCBO3Ytnq8YsVvh+s+5uHtHvSiBw8IREAZ9aiGHMw==
X-Received: by 2002:a05:600c:468f:b0:42c:a6da:a149 with SMTP id 5b1f17b1804b1-4318c73a46amr48990985e9.25.1729862089150;
        Fri, 25 Oct 2024 06:14:49 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:48 -0700 (PDT)
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
Subject: [PATCH v2 01/11] scsi: ufs: exynos: Allow UFS Gear 4
Date: Fri, 25 Oct 2024 14:14:32 +0100
Message-ID: <20241025131442.112862-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061451_556633_0C60C2A3 
X-CRM114-Status: GOOD (  11.70  )
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
---
 drivers/ufs/host/ufs-exynos.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..e25de4b86ac0 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -771,6 +771,21 @@ static void exynos_ufs_config_sync_pattern_mask(struct exynos_ufs *ufs,
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
@@ -787,6 +802,8 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 	}
 
 	ufshcd_init_host_params(&host_params);
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
 
 	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
-- 
2.47.0.163.g1226f6d8fa-goog


