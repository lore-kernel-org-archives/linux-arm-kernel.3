Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16BED767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=urpAMkkpNWFIk6PVSyaaYZWs9YFQU6kSEcUKCd3ox2A=; b=sjapOnkyCna5LiTQiUTm2CqQII
	quuBJaP2NMPvaP0Nh2SiaR2iu5D7TIiAirFhE3XTBK9QoJKPEP5AFhwVDVlWuhyCHTZH3kGKenoIG
	K8svLYBxkSAUDFtPDGru1rjgG3YzmamQKrzZu6KritXbB1kIDgwUERLCAdxYD6+ozw1gd2BYEAZWh
	VacOgQcrTb1RDYWmHrbuxgnxtJdJwhuAgUcCoMGqSiYoyF1AWwKE/8krOLIHYEIYxCY38MCWTXH78
	dO/OUkniPZnEa78QgqVmcWSaDwT8IJbwq/SLY5Okr4ibXqL0vPad2R3Spii87hCw7xH5Emi4qmB6F
	rJ/FEKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WkA-00000003uxu-1xvR;
	Thu, 31 Oct 2024 15:05:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfB-00000003tbQ-3n9x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431695fa98bso8028515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386839; x=1730991639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=urpAMkkpNWFIk6PVSyaaYZWs9YFQU6kSEcUKCd3ox2A=;
        b=oSJjBZiiVY/M2tIhIjzME18SPDIm1T2vQj6OnBzb+G9Djaj+n61+8SiqUTHHxcjnKS
         PKr4QkHTQnA4VnST0+EcX5mvo7KpC7PuVtX9cPsEdacUYFToMIPn16ACRfkEmIipd/PX
         hb7RjvYDRP5R8MM/YZGL567Sc1gDaRQKXPe07Yuz7H6fauzjrh26onJ0AfE2k8PTA1qn
         urvd7mv2cTy/vZ5gRFQ8PB5FksrjIKPa7GILyPscI/ejHReEa7SMLPudCOQshm1qgmbM
         L5Lgg8b2FKLp0AZnXMpC59u5DOvpwNRmUSQm5F9CmKSvsM09CPIbAK+mhDC+MK7WquQw
         KN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386839; x=1730991639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=urpAMkkpNWFIk6PVSyaaYZWs9YFQU6kSEcUKCd3ox2A=;
        b=Fzd0juwFtq/5EuyMB2lAuRueZHrawBlw/EqDlYz6Ce6C4F1z01Uk3vINfC8I8XJbQl
         mk0uiU7coOyH0fQd+spmWh96UH1pwzBQMhRTZQN3OSJNXLq5+ykq7VEaOq3H/ac2Ju1Q
         +5jEyQ+LKu5hLuBQ9agSLJPWaTTw3ahXtVc2T9tI9sYgskzIMe1ori65PoStuo91WhhX
         O4F2p7deUWINAoTyLPRytqC1TWtg23jLWo8nuNz8N3JaKVzs7C1yKJ8t8KpN+FgfQ8ed
         Tee9rZF4SgPR62FYow1MQZSMaG83TpDk0d59pKD7ufglNbc6BLoDIzzniMqIlM2OzWIx
         v1tA==
X-Forwarded-Encrypted: i=1; AJvYcCV/XXOBN3t9fNB9uoXPsJ1RzpYLut34yDaL4YBDZUZnawfNHN82ruo2cQk9I5O+wtOde4tibkgv5/DhmLE/hfcw@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9U9CosmW4y9ISKhTwOTUu40QZiqekNYLjz3uY2xj2Sp8wSmAw
	7EPbJYLtkPVD9YcQ/wm9IqPLiqCaAhQwhR9V2sy3Wfzo6MKLdBcWNDT1rqhzG4I=
X-Google-Smtp-Source: AGHT+IFTosXWqLxskayZ0wRDzdlL1GztSsFX/UDdCXtOBwG7ObEMDNWxQFLNrN1eK+iWQPCODsvrkQ==
X-Received: by 2002:a05:600c:19c8:b0:430:54a4:5b03 with SMTP id 5b1f17b1804b1-4319ac6fad6mr150296415e9.6.1730386839067;
        Thu, 31 Oct 2024 08:00:39 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:38 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/14] scsi: ufs: exynos: remove superfluous function parameter
Date: Thu, 31 Oct 2024 15:00:21 +0000
Message-ID: <20241031150033.3440894-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080041_968774_09AC54CB 
X-CRM114-Status: GOOD (  13.47  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

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
2.47.0.163.g1226f6d8fa-goog


