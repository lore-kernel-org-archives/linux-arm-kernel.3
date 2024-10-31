Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB7AD767DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dhr5+lgkwJp/4xdbeZNcQAzRLkNmuREPhlR8Kw0nM4=; b=3Jv3dQ8UzFhCzAy1ut3BL39IFK
	NP/DiYM0o77p7jrYZNuD9bFlWU/mTSua7RBj/6sldD0oNC5O5MRS55ezZ85zw91PSNx25ifZVO+36
	Ph/5v9eztwMt8ePHnd3BXZkENpbIFNBlPcILuYaalzuHRdPtoQSNqgw34koKLNn1KF1JygOpSQwwT
	3/Zg4/xhX8goQ4W4iBxRdgs5lgLkCJKOPa2uNg8eZH21TNmUB/gX/CJ3gwLvrgDN9xjVQyFXP5BKv
	Vj2TRgugDttkdgcJZ5AROAsxiekCb+Xgys6Gq64PiYvDWM9WZ1VqnoRBzL28BADF9fryusfBmTiDz
	vv606yRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAj-000000040bI-2HOy;
	Thu, 31 Oct 2024 15:33:17 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfO-00000003ths-1eec
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-37d3ecad390so1382144f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386852; x=1730991652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dhr5+lgkwJp/4xdbeZNcQAzRLkNmuREPhlR8Kw0nM4=;
        b=xZ19lwjQwSotFCKOkslDP8h/Zv5YDXH2VmfFDrZ/o4t2ir64hK67tXlFkVJkc69pfc
         V3qAqOq/5NdIlviJDrOXuLvjqpmYtQCC6QtwK+aI69d1yvAeEVHUlicRb/wrR2LXGrg/
         0t3l/7ZVG3HLit+UzLWSfJQPpK4reUdaE0FAxdE925iYZhcCpLNnMs5GvjO0O0vqVrwK
         zI3MVSzXGW+XujT6N/DAERdL3feYZV4nPsmiU79P+5c5R/+HJR0D4kJYX6/erYMJswT1
         QoC6UDs0Vv1MQ9aecRk/9zmLTrUGIjKODvtlP3NKu06UrGe3Hm9CYr0ELoIh6jo6euRc
         C0XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386852; x=1730991652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dhr5+lgkwJp/4xdbeZNcQAzRLkNmuREPhlR8Kw0nM4=;
        b=v4EPVVawZOHL3Yy5VHfgISeqU21FP5cFEF3lx2OOJMEaAAVuR2i5k4dcMkKP8vjxU6
         QG4zOF6MFrIshMQnHH5O4eaMHTXa/gUrBVLL6Pk+Xrr58eLcVhjleOi2cOhTDIIu6nIz
         fRZnLabd7hBi7hO/vtfs4jo/IJRjMgXp9EjiDxQ3Uc2W06RlftXgHDEIR4ZLqqih1k+9
         pqEtcK3thri1ZsISNGCLvN57td91YCIrfKDVLtlbAOUsdeU0EA9PygDPBAv6aFRhaHdH
         OlVzmnlAPpt9/W+M42keHH6Wi8ES8Zv1g3sSAGPeRXwND92zWxcsp3eceh6m3QiUrsWk
         oWzw==
X-Forwarded-Encrypted: i=1; AJvYcCUeDojpLoKyNoAbuHv3gIO1WNGmxnZYrw5dGO41RB9Y9SDR67FUaAI0Ty3JfbLNgAApZDUQlZ8azFrNl+wJEJXb@lists.infradead.org
X-Gm-Message-State: AOJu0YxGwdHpbL1UYo+Wqo2xsO53qZNPm223SJI/rIJ+FTUVxR5sqXkv
	NYW3hN4JUpn43XwqlCVuUbzJpUMTRBQBLk2Uqr1Iu1XHHbTJwMTrnDXRVpZTSqw=
X-Google-Smtp-Source: AGHT+IHKfc7pJ6Zm8piuDfmKaMIbjSaLV4oLGDh35XiuzbNsP65XFtHQ4OrcCPyxEHtqyv/uMEAbZg==
X-Received: by 2002:a05:6000:1566:b0:374:cee6:c298 with SMTP id ffacd0b85a97d-381c79e3662mr280380f8f.21.1730386851639;
        Thu, 31 Oct 2024 08:00:51 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:51 -0700 (PDT)
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
Subject: [PATCH v3 11/14] scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
Date: Thu, 31 Oct 2024 15:00:30 +0000
Message-ID: <20241031150033.3440894-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080054_466273_0598CBCF 
X-CRM114-Status: GOOD (  12.10  )
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

HCI_IOP_ACG_DISABLE is an undocumented register in the TRM but the
downstream driver sets this register so we follow suit here.

The register is already 0 presumed to be set by the bootloader as
the comment downstream implies the reset state is 1. So whilst this
is a nop currently, it should protect us in case the bootloader
behaviour ever changes.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 78307440107f..5078210b2a5c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -76,6 +76,10 @@
 #define CLK_CTRL_EN_MASK	(REFCLK_CTRL_EN |\
 				 UNIPRO_PCLK_CTRL_EN |\
 				 UNIPRO_MCLK_CTRL_EN)
+
+#define HCI_IOP_ACG_DISABLE	0x100
+#define HCI_IOP_ACG_DISABLE_EN	BIT(0)
+
 /* Device fatal error */
 #define DFES_ERR_EN		BIT(31)
 #define DFES_DEF_L2_ERRS	(UIC_DATA_LINK_LAYER_ERROR_RX_BUF_OF |\
@@ -215,10 +219,15 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
 {
 	struct ufs_hba *hba = ufs->hba;
+	u32 reg;
 
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 
+	/* set ACG to be controlled by UFS_ACG_DISABLE */
+	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
+	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
+
 	return exynos_ufs_shareability(ufs);
 }
 
-- 
2.47.0.163.g1226f6d8fa-goog


