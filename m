Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C280D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HABtOu8vBnUR430AFYIUSUDi3ELEcFC5jVUmm0tB11Y=; b=UNkII3bXXV3gMxeqXuzKoRjJf6
	ygWzBnv0gg71+3FUoPQ4buS5/5Wxg7amS8nt71WY0qyvrX0szLrsIIGufF8BjByoOf5Rnym47zzKi
	TvwdgtOKeR9DcAmBDTRIO63E8nVLLUIOeU5XgepwwVCb7i5A45y3buN1/3qnISyL5DZr7fIFC4G8B
	GwIvqDBI2ossk8XI6FptftO0IfbONRT7ZpoEKjYivr9Cr9OaD0L2XcvZrR0g7IwQo5czNkB5ls5h3
	iSOWfimW3Zf4b3s2h2IL+jCodHOaGsctOef0tl3JGVOEuSnIP/6KaUhCIv1FG5Qcv1Zf/0NssNbRS
	TlURnO6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wqi-00000003vzZ-0CnP;
	Thu, 31 Oct 2024 15:12:36 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfG-00000003tde-0iHZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:48 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so9262725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386845; x=1730991645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HABtOu8vBnUR430AFYIUSUDi3ELEcFC5jVUmm0tB11Y=;
        b=GRAfvvc+NiEOGxjNcc4vdWmBRuCyYPUEXsP+Nk5EDdr1tIaq048hnUWjMng0w1sXta
         hVk93acq5A5gIEJ/9kDTUYCiADgraA248sGgeXoR5faOynOxLkrPJSJd/B6OudC+kTYt
         OBNIzBc11cEo64EV9PU3ZZT5IbtHxy2/VbHHI2N4xguPxxqaQ668nFCeMUxed7legRXk
         gkWtBJMkODRMBUjDNTeRGxUup+YHV2L2VR3NN47vK5KETiJ9CS26WkcdxkaXc7Lr7XgA
         SdrQF1RtxZc1zBMtlKEuIuAWNkA1nKibFvH12FKvv4hsXSfVrltVoD2Ml20s3LKA7us6
         1q4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386845; x=1730991645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HABtOu8vBnUR430AFYIUSUDi3ELEcFC5jVUmm0tB11Y=;
        b=ddSiFzwUZdQSF5rJMVnokaBlK2WDC9RpEkRQ4EKOHUkoQOiH3E+dE9Uk06vpnXW512
         itzXta1b//+MfSitmDuZ7VGt9ENZbXB/WIBs2NzeFx4ALwXfHkh53bltD6HDrn1JZy3q
         LydELphxnsTv8kzFdRtA0v5yxCSB5OTWBPaBhdfYvHAmwGpPvG1edS7r5M9b/oqiL6u0
         YKDbKLzt3+4Dra9526fzlchhFXbOSQtp24Ic7sKaUuMoJshTa2U17asYCGAbiEuWBySM
         r7SgKTfMSWxC5kUZWuPkY+Y2ir1r3cks0FsJetSqG+gRCSsm1Kf8PRqPsOajgJNXnlcf
         9pOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqy9Vaa4tOUCkoEA7DFU9KFZ+IVUX20ErB2Z7+uhnemVIBR/2iws0+FbQ9RKp+0DiRBZ9BcLB7VI72i2MdordD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3z5hjBU6CK5orgoY0jOODUrtl47ICEOrs6oOlrPJQ76VY9Uty
	dcp2ng/aYSswM/glWmfmdfI/DpaYs5HylYNahXkaLQS6iTVjGvvbsEVIhfQLv68=
X-Google-Smtp-Source: AGHT+IHrOUYyAxFC1VJUc6y5oX3ddkyV0eSXyUdqL+WEdAPlUpCNJwf8n2c1O5ZakYFeCDJkSDGQIQ==
X-Received: by 2002:a5d:64a1:0:b0:37d:4fe9:b6a7 with SMTP id ffacd0b85a97d-381bea1c1f4mr3210183f8f.36.1730386844715;
        Thu, 31 Oct 2024 08:00:44 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:44 -0700 (PDT)
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
Subject: [PATCH v3 06/14] scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
Date: Thu, 31 Oct 2024 15:00:25 +0000
Message-ID: <20241031150033.3440894-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080046_236868_E79501DF 
X-CRM114-Status: GOOD (  11.25  )
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

The values calculated in exynos_ufs_specify_phy_time_attr() are only
used in exynos_ufs_config_phy_time_attr() which is only called if the
EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.

Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
return for platforms that don't set it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
v3: update commit message (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 2c2fed691b95..0ac940690a15 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -541,6 +541,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 	struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
 
+	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
+		return;
+
 	t_cfg->tx_linereset_p =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
 	t_cfg->tx_linereset_n =
-- 
2.47.0.163.g1226f6d8fa-goog


