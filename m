Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EADD5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YUH2BZzthzEXo7hEUioBbWsSt3qoc+SC22xhMIafrmU=; b=2dyMzO/5YKYL83E8Dc3wRKNss6
	oSXWI9t9qbDQbH6CxSw52loEJZqOAk3tRmB3kapgXyEPr5w5fdVTqc4cm9XyMBw/KWqZXokgi/MX9
	AhCsfEF0vuTCJI/oOh7gFiwgAhd2EiDH2KYApjrDsQHTrAIT6dWnKXOKqWICNTGgJ+czSAECvhBLo
	6ObLhxzjSgEnqPAkV4mud2ATIf4Be9yPz0oikdUjTgy/h/GvcarVy0B87DAEP4dBhUuuLazEnGR8N
	Wx19zCB1B3W1oG09Tdai7RFV34WsK6LHJBDj7Z0B47xTFI0SJ0C9t0QHjQ5QkWxK26+IjK02sXaxX
	4fkltElA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68sH-00000000UtG-2xoH;
	Wed, 30 Oct 2024 13:36:38 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68is-00000000T5e-1ukI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:26:56 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so4773844f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294812; x=1730899612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YUH2BZzthzEXo7hEUioBbWsSt3qoc+SC22xhMIafrmU=;
        b=EVYGi8bzSwhHzmuguLkvYdZqnTIeRdrRdJf0rWmXJg8C/RplBlf0NO1yG9K8+12dwq
         bUuKqN7LkIsMD1ZfMjomAOUrYUtYE5XuVEEbxfimmjs7WoUaZjlEcuFql2D7ARpWKnK/
         EBJntbq0kKvRH4gZXDohNHJAVN3PQdvM4gE3Ss9lVPwwyoR96Qd63ZNLGL5S4vbmXsao
         swNhs/MWinJobUgfATgItYzC9QmLXYjMigeCkq+AAESlBHlu/Dwj8Om09utOHhgS5qX4
         5pawYZn2LhyKKRJDS6OYG6tDHp/towV4oBq8EcFLDAWauCQWjG3vTWUlvjE8+SdmnEfJ
         4bSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294812; x=1730899612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YUH2BZzthzEXo7hEUioBbWsSt3qoc+SC22xhMIafrmU=;
        b=YElx7ffkUscHt93IzW4fJjDkUmwx+fuDJQrpMzrcOpwruJjJchBnYL3rEV/MU/eIgE
         yyr1drgGQesKeG64YGXqJ5nYKujlOzaJwhQn/bBZ1/kE+4ziXlH2tbbA0p6ImCJ/WDNG
         XAlDeoodlsOlyT4otI+bTsZWrhICuCOY6DZokfy19ITtQcyShbHUsJ21psXO4TMB3o0C
         okwYy6eeJ5LLdirxuxj3FhQoW1estcSX3SAJPlEW+h5e++gyQwWId59Pk689f4g5uLha
         vIW4+LsL5lINHTsR2R5mrbVoPIHVaE4vjKVsFrMoPQzAGH64a6ZQbZzLadvWGoWWaTbd
         zu+g==
X-Forwarded-Encrypted: i=1; AJvYcCXPZixN23h1ozqP8sfkIDZrcmP6U5J0JZ2B7WeyBR/uueXhAkVqihZXpfvxpFes+PesSEcm3skUZk71pDd/78fV@lists.infradead.org
X-Gm-Message-State: AOJu0YyKPLgTrukn5fOTg04N6juKac0M414Q5H+rKiQ7jEue0dHccTqw
	ToEYnmRRndbb4sRC1xtpGP2EaRFE6cSFdDME/C3TID0sKp6/qMgDMjY/ioHqOaw=
X-Google-Smtp-Source: AGHT+IHIMdJDEaCeqIXymbskBOdadZaANy4sAJ7qeopzQzAgJpTpoJyPxtp9v9pMK+6XU1FesTsuxQ==
X-Received: by 2002:a5d:4602:0:b0:374:baeb:2ec with SMTP id ffacd0b85a97d-381b7076530mr2335207f8f.19.1730294812459;
        Wed, 30 Oct 2024 06:26:52 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm15356836f8f.30.2024.10.30.06.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:26:51 -0700 (PDT)
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
Subject: [PATCH 1/2] scsi: ufs: exynos: remove unused tx_linereset_n/tx_dif_n_nsec fields
Date: Wed, 30 Oct 2024 13:26:48 +0000
Message-ID: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062654_521112_479D3F61 
X-CRM114-Status: GOOD (  12.38  )
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

tx_dif_n_nsec was used to compute tx_linereset_n, but the later is not
used afterwards. Remove both.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 5 -----
 drivers/ufs/host/ufs-exynos.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..91c09309c1c1 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -548,8 +548,6 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 
 	t_cfg->tx_linereset_p =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
-	t_cfg->tx_linereset_n =
-		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_n_nsec);
 	t_cfg->tx_high_z_cnt =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_high_z_cnt_nsec);
 	t_cfg->tx_base_n_val =
@@ -1970,7 +1968,6 @@ static void exynos_ufs_remove(struct platform_device *pdev)
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {
 	.tx_trailingclks		= 0x10,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
@@ -2046,7 +2043,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_trailingclks		= 0xff,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
@@ -2074,7 +2070,6 @@ static struct exynos_ufs_uic_attr gs101_uic_attr = {
 static struct exynos_ufs_uic_attr fsd_uic_attr = {
 	.tx_trailingclks		= 0x10,
 	.tx_dif_p_nsec			= 3000000,	/* unit: ns */
-	.tx_dif_n_nsec			= 1000000,	/* unit: ns */
 	.tx_high_z_cnt_nsec		= 20000,	/* unit: ns */
 	.tx_base_unit_nsec		= 100000,	/* unit: ns */
 	.tx_gran_unit_nsec		= 4000,		/* unit: ns */
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 1646c4a9bb08..e64fe20d50c1 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -136,7 +136,6 @@ struct exynos_ufs_uic_attr {
 	/* TX Attributes */
 	unsigned int tx_trailingclks;
 	unsigned int tx_dif_p_nsec;
-	unsigned int tx_dif_n_nsec;
 	unsigned int tx_high_z_cnt_nsec;
 	unsigned int tx_base_unit_nsec;
 	unsigned int tx_gran_unit_nsec;
@@ -195,7 +194,6 @@ struct exynos_ufs_drv_data {
 
 struct ufs_phy_time_cfg {
 	u32 tx_linereset_p;
-	u32 tx_linereset_n;
 	u32 tx_high_z_cnt;
 	u32 tx_base_n_val;
 	u32 tx_gran_n_val;
-- 
2.47.0.199.ga7371fff76-goog


