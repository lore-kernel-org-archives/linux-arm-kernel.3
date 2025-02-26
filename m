Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C93C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRep6X28Bs3ILjeWVZF3puW1Rh7I5vgNM7w/7EHKDA8=; b=Fey2CFf57sqUh5CECB5ia15SQ2
	zpuG6hNUywdDBs+MF07xFU2xZVBeANx0CTpSvioKgjV9GYY8oGBmaa8lj9bCF5BrVnO3MOUi1Ro5v
	tNFAvfA0qWiqMHjAEzsDfQHDhEI4hzQByMV+7c0euPDHjEriP1BcdvV4UtXHTRFyWGvk41MzYEcIS
	pCSxV6ZxThtwQnGGgkHeDTv/3QOegEd3p3235UwW3c38nNPTxcLTY2ADW2AefSC4ELV4sfQ97X24Z
	CcuAPZO1xpTkP/YKOaETfniKZ3XzCbOtX5K6wYVJ1xG79SmYK6JTvMdTNBeVmgoNOcD+xUAIUMH9+
	2viGSWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPfo-00000005ZyY-06dT;
	Wed, 26 Feb 2025 22:14:36 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPVx-00000005Y8T-0yRW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220ecbdb4c2so5380445ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607464; x=1741212264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRep6X28Bs3ILjeWVZF3puW1Rh7I5vgNM7w/7EHKDA8=;
        b=YUW5Pkmu1FIV1UsNM+E5tmJbzKbB5F2SJdIn4+RcaHQezdlCG4HzgvvMrpiqRzIam0
         zNXZsZNsQ+Ufro8cZf1gjIQoheffCMFXujOC+C6WBuFLRmAC1qQclvFpi/a0pJ7zcB7p
         SEwew9uPxxr/kCQN5bXgDzthstvk4p0BL8uyK6dbnDxgvCvSJ2P7GedNRFo/Ty4HGsCJ
         qDKA6lxsQBnuDHto5st5LJQV6ealSjyOWXeonbDK3H/lXUDSpV91H6YLbWchbLwDWEZk
         lI59c0rkd2aplBgb/F7Na9ymZTUPnFWgygJFC6a6ncNVS3afDHDYuaqns/IrubgC0bvM
         mrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607464; x=1741212264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRep6X28Bs3ILjeWVZF3puW1Rh7I5vgNM7w/7EHKDA8=;
        b=jm6hp57b0ROHMXvhhOTR8jjzRmHqVc0m9iHpTH/X/JAhvxdhkufjit8femgH9NX5/z
         hVmI6SBDC7arDg2mHBkawJlAcTp7Teji1HJ6yyze316UFraqRgnlrtgsyzaozi/Y3SJ5
         pDJk539e5S7axrnR9h20hidLcSSaqeMeJLyyViHxqxDLDnU8KOMBYy8OhlVfV1ZWl5Q2
         4JKlfsi+3uREjER+tFqc8JULypVdLLUecXwkF7ZfgcIOyXuHKRbP2yEcQKivX9T/GW1W
         zNH2PirzqZQYGVBLdQ5xWURXCA+oZV7a0n0Q4N3b44y82FguSVB+v33rbV3WUpbQHqZT
         oXOA==
X-Forwarded-Encrypted: i=1; AJvYcCWJjCKQQviGQCluj9H4BXr7El7dNw7D8bDHW4aDB/fxDk1n7JEmgd9QoiRRoYAHyRfyObO+tIzGSbspRFhrnZ3F@lists.infradead.org
X-Gm-Message-State: AOJu0YxXwpHNzV3cNBnpTSyzaQOI4N4xydxpBmki8j0CrPUpoVBki0sx
	Dlm5mHhjxTQArHOdn1ViMY2qcQLyBP15MPrUJHAn/fAxL7ib21X5YZeCBoUPuCwZvB8D+oPTvcj
	PzVM=
X-Gm-Gg: ASbGnctc4AlbJsZzju9uw1xg+mLS0mj6b5BPiMh+biwa0hstnc08YCgPuLRQKjQYWl+
	aH/n95MiqzzAtmt5qknkuNbXyDmYVXixICZadNuN2mecfClZD/vJEkYmw/z6EiZudR5EV5KQcA9
	8gmbb6/PV2BoBfTZzM+WdYD6SM4mTws+P1r7O7bq+ozBqHP5bWCbWxJfERZ+qgk9QZ+bKPPqAPv
	GTWfkzWf34bUkEVqIlesUjurPTfxcrLiQnsbolA6s5wPApSResop2cphWVzciJwumk/pWb0cI1V
	T7APoEqELEMExPt24lQ+NLoAG13rSeCPSszXOZi0lVzRMuWsGmHnj09B
X-Google-Smtp-Source: AGHT+IEP9WBpfwUfNjcEv64MqjMjEFYBNBNT2/2tSm8WD1uShhaDmBPXB0CLzQORfjn3hNPrTtyIxQ==
X-Received: by 2002:a17:902:e752:b0:223:397f:46be with SMTP id d9443c01a7336-223397f4a55mr41038145ad.47.1740607464373;
        Wed, 26 Feb 2025 14:04:24 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:24 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/6] scsi: ufs: exynos: move ufs shareability value to drvdata
Date: Wed, 26 Feb 2025 22:04:10 +0000
Message-ID: <20250226220414.343659-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140425_268506_B8A358B1 
X-CRM114-Status: GOOD (  14.79  )
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
index cd750786187c..a00256ede659 100644
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
+					  ufs->shareability, ufs->shareability);
 	}
 
 	return 0;
@@ -1193,6 +1198,7 @@ static inline void exynos_ufs_priv_init(struct ufs_hba *hba,
 {
 	ufs->hba = hba;
 	ufs->opts = ufs->drv_data->opts;
+	ufs->shareability = ufs->drv_data->shareability;
 	ufs->rx_sel_idx = PA_MAXDATALANES;
 	if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX)
 		ufs->rx_sel_idx = 0;
@@ -2034,6 +2040,7 @@ static const struct exynos_ufs_drv_data exynosauto_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
 				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX,
+	.shareability		= UFS_EXYNOSAUTO_SHARABLE,
 	.drv_init		= exynosauto_ufs_drv_init,
 	.post_hce_enable	= exynosauto_ufs_post_hce_enable,
 	.pre_link		= exynosauto_ufs_pre_link,
@@ -2135,6 +2142,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
+	.shareability		= UFS_GS101_SHARABLE,
 	.drv_init		= gs101_ufs_drv_init,
 	.pre_link		= gs101_ufs_pre_link,
 	.post_link		= gs101_ufs_post_link,
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index 9670dc138d1e..78bd13dc2d70 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -181,6 +181,7 @@ struct exynos_ufs_drv_data {
 	struct exynos_ufs_uic_attr *uic_attr;
 	unsigned int quirks;
 	unsigned int opts;
+	u32 shareability;
 	/* SoC's specific operations */
 	int (*drv_init)(struct exynos_ufs *ufs);
 	int (*pre_link)(struct exynos_ufs *ufs);
@@ -231,6 +232,7 @@ struct exynos_ufs {
 	const struct exynos_ufs_drv_data *drv_data;
 	struct regmap *sysreg;
 	u32 shareability_reg_offset;
+	u32 shareability;
 
 	u32 opts;
 #define EXYNOS_UFS_OPT_HAS_APB_CLK_CTRL		BIT(0)
-- 
2.48.1.658.g4767266eb4-goog


