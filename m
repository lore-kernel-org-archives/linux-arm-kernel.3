Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537C5C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbRxaKlUuHAcCVOLOqHWcjXZo8Uzm/9NfQH6A8RUPPo=; b=B62Lmg4MTCoGABdew49hr0vpae
	nI78nXmpfj6aJ2E1jllIYac9t6EN4uboVwg/ba0/t6/JBtd0RKW/38RnvbdAFGlBNYpfi0lB6HFlN
	MIZNwsRvZ3QYtjCb38IQXZWkn6DodVXzPgEm84tz/u3tHOg1gzKfUIKcQdET13Hd+RT6pM0C9Nxws
	LiVfv11kRNMPmNrqONbmYw5vxtFvC46zGnjJ7bd/d9/LqpC/cv0VaLmMrnJaooKTWtwxf7EpqquL3
	1CuNgxhm8nUjwRcXpAhH6deycQ88o5Ega97khI4uC1BDDX1ufnaGbLu3ujES3ATYCOJoNTop+j4D1
	IBjvBnVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvSJ-00000009P8B-1CQb;
	Wed, 19 Mar 2025 15:35:43 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvNJ-00000009Nzv-13yo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 15:30:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so47348825e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398231; x=1743003031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbRxaKlUuHAcCVOLOqHWcjXZo8Uzm/9NfQH6A8RUPPo=;
        b=xPqlT1szpKLZLN+NmQNXXi/7L15eMKmBB2Wbw3JrPC75AIX8/od0P/fXU011iPAeuh
         ohi69dbZVL9vZKm3FpIA9vHr4WLidWIOZsDFhlAlAq62QrNaVFHYS1YT/KFXsYaGzvle
         gXuEnvhNB4VxxJBF5EkMCmPAhWfapnyTsllD8W3TBr9GBjyWtHp8cgsjKavKJFK16eSO
         fGPglLY5qpr1G5Ui4nU2vjHOxIhD0MUg3h2nHSbMg24Rtwvcd9uNVitmgtNFnHSALH5e
         mJb0t3pwbKtWZ+7cQjQ3EsDS+6wrYB7wzMTbyiXZBbLg3n04TqTdV4F1vbavD2OyHjvc
         zwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398231; x=1743003031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbRxaKlUuHAcCVOLOqHWcjXZo8Uzm/9NfQH6A8RUPPo=;
        b=XunumKau4gwnU41aJa3W+M0AOUasrZ4hfN2PJ+dzX7VZcCp4ktmLC71sded3B7UcW7
         4RGTGKt0bct2hWcTLmPmPMR63So0Oo00F/NTnUtd8bsLFkyiLLkZC3LJzi37d7Gwc66Q
         3xyZc6neevoICvXOknkH3n+NZk2DSaRtRnAeyhUoLrNmu09AFvJ9ADlp2URQkGQ+vq+t
         z+rGQLuWgLwrdiyfuI8Ylm9BhZVbfsFH/Uiwu0x088B9NspPo3xPf2dSH8M+DTgVRdmn
         wGar4lZtlxeG+XRf2FjkVVjXCKYuLRCSFLLsapuLDMqGDI04frUCPq8cITJ850z08YUV
         3+JA==
X-Forwarded-Encrypted: i=1; AJvYcCWzKJwelN9Smf/sSKFpjbHHJEKwJ4zJ1vqQzLU8mApEAo0FdBYhhWPsTcoWKzLGg0IJPwJwGDLtEkNplgS8DpUQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0gteapUEh7qjvCZRmlfPI+dZqd5An7Bir8KjuIkHj2KTU8Ane
	r+LneP1okevv2tbt9Zzmyb+ZzAW3Q3uywEzClo828WWTk8TIWA2N2sHgdhuYxsc=
X-Gm-Gg: ASbGncvrYUV+FnJReKkwKCxflOK9XOogRcvqRJAzLx0Q6mgKLppcS/AveKqoj0eGUnK
	6zD9/9K3LniGAdcndLJdZzQPa3kJhUodsvt1wiPOnBOdTOeP/zue5xyYjg9vtBHYDCqmPr2OOG4
	1RVU/BGupGXd3PdUSzRR59OwCjqaZ2SDzb+oij4hbuF/Df0SFDn+eGu3yWh/X0Od0ZzFT4Rog64
	WXu+XZ/oPkWVsPw20jXyzwztpXMdkw1I7AOBa2j0f/30KyJeSVWwpKKcMg8LhQCaPTgo500rF9O
	7sKS+a7NtZbZCXJ8Fl2yFC7HO1nc/zvSnRyTh6LjEUq+qCwxhOyfQOdFFi05CD1p4+Bmi/7Jvgs
	b
X-Google-Smtp-Source: AGHT+IELKtB9DSmyHJ5USLUFwjbcpHPlTWl70nzCTJQEQMbPy4AR/0qWpG/lQtpCuf9vNJ/yfeJDGw==
X-Received: by 2002:a05:600c:1d18:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43d4875087cmr10638485e9.10.1742398231440;
        Wed, 19 Mar 2025 08:30:31 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:30 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:19 +0000
Subject: [PATCH v2 2/7] scsi: ufs: exynos: move ufs shareability value to
 drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-2-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3658;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=kk2fMHoWjrLcXHxUi5sF6uFu10/CFkKdnFWw4ZC84VE=;
 b=kA0DAAoBzui41gI0croByyZiAGfa4xDIJTsN0uisLZOrLYYCRsUsZ9bj4xzs6meMp1naqn+9m
 IkCMwQAAQoAHRYhBA78jm9VeHUNVrVJ/M7ouNYCNHK6BQJn2uMQAAoJEM7ouNYCNHK626MP/RX1
 hguCvwUaqq1KsdNef95QH4hzFhmOnCDMHgq6vkV/3KzUCesSc5/uIcRUjzonwsuY/X8Z6SuoDWl
 fRguDV0JgQjP9AQWyoPuorF6XLuZBGlFe1uoueH8WgK8A4nE445OeRNb9g5Qxs6vChRvbPZryVD
 x7Z3L5Kgdv+25WRmpp2NxMcUl26IywhKBGw0a69w43ERY315QLo539L0eUhdO2LrJl7Y52DShDl
 O/CgBENeYlvos96Z5QM6pqVw5h4aM2FQAHnK1B3ItnXZQNxP93ACgYNJX6Uub5Dm1ECCZuRyDig
 idFAShyOwK/LsU70tQQR97PRYlkGIqEMQiM0BGS/TtJ0+FZbKcEAuMdo9QRwVQEKizkIKQu1PSH
 hugssFgNx5yQDMOK2bj1JVCvYe/FuIAW3RdthgoO+15dBxjY9SXt9Dy+uT1opsf6E6l+SG1Qys+
 k/JeytF/wU98FfsW3cqStRGEyShGp82LwY+4yPog6OVxfU+0T0E85e59Jqpo1n/sytK6XVbWE8t
 2akSDrZTd7mNmrAgwjOQ1pDs3UVOSHayKeMYSYzNjdJCv64uWdalQfozeCwIHKAnepCiHK21+4i
 XbNhRMDt6YcpeoSfc/RYNE7XcRSqpA1rD+ib8NY8qYObuzk4sGVH1+K8HdvxDsADpHyGiJsJZ5/
 KC1Ax
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_083033_296055_249408A1 
X-CRM114-Status: GOOD (  15.71  )
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

gs101 IO coherency shareability bits differ from exynosauto SoC. To
support both SoCs move this info the SoC drvdata.

Currently both the value and mask are the same for both gs101 and
exynosauto, thus we use the same value.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Fixes: d11e0a318df8 ("scsi: ufs: exynos: Add support for Tensor gs101 SoC")
Cc: stable@vger.kernel.org
---
 drivers/ufs/host/ufs-exynos.c | 20 ++++++++++++++------
 drivers/ufs/host/ufs-exynos.h |  2 ++
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 0c8c2e41e851cdbefc80a66d87273b7e8fcf9d4d..f393d42a659f821225e67e3e5d323478456ca3af 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -92,11 +92,16 @@
 				 UIC_TRANSPORT_NO_CONNECTION_RX |\
 				 UIC_TRANSPORT_BAD_TC)
 
-/* FSYS UFS Shareability */
-#define UFS_WR_SHARABLE		BIT(2)
-#define UFS_RD_SHARABLE		BIT(1)
-#define UFS_SHARABLE		(UFS_WR_SHARABLE | UFS_RD_SHARABLE)
-#define UFS_SHAREABILITY_OFFSET	0x710
+/* UFS Shareability */
+#define UFS_EXYNOSAUTO_WR_SHARABLE	BIT(2)
+#define UFS_EXYNOSAUTO_RD_SHARABLE	BIT(1)
+#define UFS_EXYNOSAUTO_SHARABLE		(UFS_EXYNOSAUTO_WR_SHARABLE | \
+					 UFS_EXYNOSAUTO_RD_SHARABLE)
+#define UFS_GS101_WR_SHARABLE		BIT(1)
+#define UFS_GS101_RD_SHARABLE		BIT(0)
+#define UFS_GS101_SHARABLE		(UFS_GS101_WR_SHARABLE | \
+					 UFS_GS101_RD_SHARABLE)
+#define UFS_SHAREABILITY_OFFSET		0x710
 
 /* Multi-host registers */
 #define MHCTRL			0xC4
@@ -210,7 +215,7 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 	if (ufs->sysreg) {
 		return regmap_update_bits(ufs->sysreg,
 					  ufs->shareability_reg_offset,
-					  UFS_SHARABLE, UFS_SHARABLE);
+					  ufs->iocc_mask, ufs->iocc_mask);
 	}
 
 	return 0;
@@ -1174,6 +1179,7 @@ static int exynos_ufs_parse_dt(struct device *dev, struct exynos_ufs *ufs)
 		}
 	}
 
+	ufs->iocc_mask = ufs->drv_data->iocc_mask;
 	ufs->pclk_avail_min = PCLK_AVAIL_MIN;
 	ufs->pclk_avail_max = PCLK_AVAIL_MAX;
 
@@ -2035,6 +2041,7 @@ static const struct exynos_ufs_drv_data exynosauto_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
 				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX,
+	.iocc_mask		= UFS_EXYNOSAUTO_SHARABLE,
 	.drv_init		= exynosauto_ufs_drv_init,
 	.post_hce_enable	= exynosauto_ufs_post_hce_enable,
 	.pre_link		= exynosauto_ufs_pre_link,
@@ -2136,6 +2143,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
+	.iocc_mask		= UFS_GS101_SHARABLE,
 	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index aac5172761899a5dd8ad98f9ee34b1671dd27880..17696b3768debd641188b5089585b6d303de7451 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -181,6 +181,7 @@ struct exynos_ufs_drv_data {
 	struct exynos_ufs_uic_attr *uic_attr;
 	unsigned int quirks;
 	unsigned int opts;
+	u32 iocc_mask;
 	/* SoC's specific operations */
 	int (*drv_init)(struct exynos_ufs *ufs);
 	int (*pre_link)(struct exynos_ufs *ufs);
@@ -231,6 +232,7 @@ struct exynos_ufs {
 	const struct exynos_ufs_drv_data *drv_data;
 	struct regmap *sysreg;
 	u32 shareability_reg_offset;
+	u32 iocc_mask;
 
 	u32 opts;
 #define EXYNOS_UFS_OPT_HAS_APB_CLK_CTRL		BIT(0)

-- 
2.49.0.rc1.451.g8f38331e32-goog


