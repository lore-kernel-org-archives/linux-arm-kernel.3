Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC716D5CC8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 10:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xa7O9twJ6bmDbN5DQRcWJq8Kwm2U8nXjdv5M+G4ksMQ=; b=KWadJyL270dshO+FQYKYXPJUp1
	AQF3ybTo0H8UXIIz/Gt/tfsu/hB0hsYW1T6Pol932TXT4fgXcfCQtLh9saUxCVCpLXEzSh6VVq/z5
	jWhq+OIBm0KCHZVyTr1WvZtXO2qHfPWUP5a5+QzUh5l0/1a1oRJz+qdXw0iHzvvfR5PLJ6Lm2wZUZ
	HRXjBrBczcjYDLmNwHK2gkhbsNziQvz5/Y63bpCQB8h/ZcX0Pc/rXj/7D1b3bqR/R4nzc0l0OWFVH
	Z3a27pwoRXElv/mCWrWTVQHIC+Nf4sracQiRd/arMQbAOHa8jJTzFiZFcY42u7ftBVTMqfIaqCee9
	LtyPuFIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t665z-0000000HaAG-1bhq;
	Wed, 30 Oct 2024 10:38:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t65v8-0000000HY64-1RPh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 10:27:23 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so61798115e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 03:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730284040; x=1730888840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xa7O9twJ6bmDbN5DQRcWJq8Kwm2U8nXjdv5M+G4ksMQ=;
        b=A1ebXheQSaBtwold+Wn1g/jHnT/4OMqENPTFsI+q6grac131Z90KSqREqoh4i8c4pB
         aHc1ehLt08Jd8a4K7MNtT2sQrz5Uc9mShW0T+F5rG7sQN8HWf4WWRn77uwG5AOjQVdkn
         t0Ntx2zS9vGzWycg2p+sLCHjzSGhsgwVMUebHl01ClEWRkBTXguzaaFA+T4+7/KBxgO4
         JIwKhUySMg7wGD87stFbRZwGpw1lIz09QFK3cd+OwYuklK0TkZQhonTY4/szb4iO15fj
         dR1i9tVervcrGENi0uUIbNDU+MdB+tPhjaWyrW8LQuvxYFiE1A9I+5QaeJeq/xjPj2/A
         KZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284040; x=1730888840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xa7O9twJ6bmDbN5DQRcWJq8Kwm2U8nXjdv5M+G4ksMQ=;
        b=LSZk0xSKJoV52iqDlW7c5KeJOmIGdesBsQvfvaprFYJ13IAIVGPvX8d+ajul6n3wO3
         Da2nEU0XUnbKQcdzKmtVnUGbbgvp18r3MOS1HAr3E4mv1quZCugTBIkLWcCwxOvDAy/w
         pr16LR/5ftX0lYbm4WZkr7i77fUEqB5ih8YNFvnp8mtJzMOQO7S7fkVKrFhZSgXgp2Cn
         BPCIzpl5CVGujzuDpllDRtxgmuIJJLiZA5TYPQ8aky+AwOdbp52QCqZkpi+YhYX92llQ
         +/frlgDMLcS68dhyw507lUcuOqHe7rRmLGLwJoeBRU94itL33oUM+a1pz38ib7eXDQnn
         7lVA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOtc9OWWF5Qywoedrt8IUljPfZgXkh3QrmxtNXS1FFRxPiio/nYHPo8bTNcQRtNsIlGxlr4IStxWvS6PvpHAN@lists.infradead.org
X-Gm-Message-State: AOJu0YwzEq/FwJrhYyvkt8ioVVUvX1xdYoGtZbOvE9w3DgIsCE5qtJ3R
	viuhO0G5lLU8risFuctONdS435xM+OexbwJMPN/+pvDB6M9b3kKKds5VIug8Rj4=
X-Google-Smtp-Source: AGHT+IH3P/SUi2QfbJPyZVVflVQvstXkhGR0+ne23A7qXQP4p7DSlsWKQ60Mu7VBfsVT8CMLgRehCg==
X-Received: by 2002:a7b:c354:0:b0:431:7c78:b885 with SMTP id 5b1f17b1804b1-431aa80f822mr75969765e9.4.1730284040266;
        Wed, 30 Oct 2024 03:27:20 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm17074345e9.25.2024.10.30.03.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 03:27:19 -0700 (PDT)
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
Subject: [PATCH 2/2] scsi: ufs: exynos: remove superfluous function parameter
Date: Wed, 30 Oct 2024 10:27:15 +0000
Message-ID: <20241030102715.3312308-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
References: <20241030102715.3312308-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_032722_415670_4FABA4EE 
X-CRM114-Status: GOOD (  13.10  )
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

The pointer to device can be obtained from ufs->hba->dev,
remove superfluous function parameter.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 4 ++--
 drivers/ufs/host/ufs-exynos.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index db89ebe48bcd..7e381ab1011d 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,7 +198,7 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
+static int exynosauto_ufs_drv_init(struct exynos_ufs *ufs)
 {
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 
@@ -1424,7 +1424,7 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	exynos_ufs_fmp_init(hba, ufs);
 
 	if (ufs->drv_data->drv_init) {
-		ret = ufs->drv_data->drv_init(dev, ufs);
+		ret = ufs->drv_data->drv_init(ufs);
 		if (ret) {
 			dev_err(dev, "failed to init drv-data\n");
 			goto out;
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 1646c4a9bb08..9670dc138d1e 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -182,7 +182,7 @@ struct exynos_ufs_drv_data {
 	unsigned int quirks;
 	unsigned int opts;
 	/* SoC's specific operations */
-	int (*drv_init)(struct device *dev, struct exynos_ufs *ufs);
+	int (*drv_init)(struct exynos_ufs *ufs);
 	int (*pre_link)(struct exynos_ufs *ufs);
 	int (*post_link)(struct exynos_ufs *ufs);
 	int (*pre_pwr_change)(struct exynos_ufs *ufs,
-- 
2.47.0.199.ga7371fff76-goog


