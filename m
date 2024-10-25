Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134DFD0C60D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwJALAAeKO6DZ5STVB6W3oZmi4qjYoxF/2Uc+rthKgs=; b=SZEa9ZuiYfcr0coXF3S1x/znqb
	aGrw9cfiXiKvOWEVfRnR+HWhqhF4ImXKbhRhCJ8ZzQ4IXtTz/eGNmVVuV27bqzgwkQQEOgmf5Ij9X
	TnjUPVwezUm5A3Wz/RnxUy7v5FOsMNo5sGRkXlyofwYkNAvIDDv8Ba7UR4H/9hjLs1UpVIeFrJa+y
	TjCzeJzHvuWQNS3Y6KQoNb6LjQfPjMuEHPsUskaNTBEOGfdtkMtTJpYoA26S92O1uTuBY3ohjQBXV
	nGp292dwoYrajf2a7vjttiTdWTngiIatojug7LCtUoK5PlYwjFiUp9W8CqD65h73ofY2/0WYLDe/q
	cjzfcJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KXr-00000003qcH-44A5;
	Fri, 25 Oct 2024 13:40:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9e-00000003mm8-3uma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so20833945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862101; x=1730466901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwJALAAeKO6DZ5STVB6W3oZmi4qjYoxF/2Uc+rthKgs=;
        b=Ey6MVCxPvJp54nl/0X7IonjJTicTKTncSuMWvsIGVoO6fQvoap627q1lUY3eTAPBG4
         wP1UuuhSCff7++q86TghZEj0jaUghTH6SNugndrdPOp5yIWxVBXUOA/OwGihgHRT7yd/
         XQDR0mJPGlBw5kdyIvhmcbki4O1G3xXWeT+xqFaJanHFuFBmoGyceJljJuL93HgBFxx5
         RG1LL7ECU1UmYJLBa+e3srqv+aammOJyKdD85+AZBKAKZRDBnuBZKo6tXJU8QBHhC8SI
         QZjinm5DEf0I7BIyDHouxSQNVczTkDk+2C0wZMi6Z/HkRBa3OlDDoB+4DBQ3/89sartI
         6Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862101; x=1730466901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwJALAAeKO6DZ5STVB6W3oZmi4qjYoxF/2Uc+rthKgs=;
        b=IZeyZjO75K/1/FQ3lczqqhF00/XdWvFx3HdU8IeTC720fIgMp83SOMqb8mRabagzoa
         zFLOeaofq0TtPCGLRp9+vNfmBPhBf497duv2vRlSzbs0VHvT+8Tg/4QJfCdqxc01u3wc
         1AICo0WAiHZskElf/9FfHUNwQsMMD6ky2LDDmtOl4ypHBKu1OYtM29QlsOMMHrM9mYQk
         Ul26wXfzJVxxu2pRNvNSj0joDeFwNF1cOus2RK9RprAdP4xIcD8x1DjurUphAC1PuHFZ
         bhLop3IzHQ2dAulUQBWcBnNjgdOYLKEd1lzeN3VTDB1zOr+Qz4LBXeVIyivGcRYchg9R
         JhRg==
X-Forwarded-Encrypted: i=1; AJvYcCWvrVlMB6//ACEhDPwfYblnIXfpZY0d0X8wofkwJf5fTjDjJI3S/sQtUVB7siyqFNMEsGWz3xu0nF99Ah2pB2OG@lists.infradead.org
X-Gm-Message-State: AOJu0YwfhYbCyxDE83Z11TyP9sLg64oDMMRCaK+Cm/E2EPZdongrs8bw
	by0RFBhX97lhLmVEOPXnhlxilYYqGyHXHn9ReQi5lW3hPMTMJDE8y0INYgyBDKY=
X-Google-Smtp-Source: AGHT+IG93PjcVz+7+9Ks5a4tZOcJmfpGpRSJSrp4oHNgenqx8uAoLySbtv12lhSPEbntHZWJ76vNhQ==
X-Received: by 2002:a05:600c:1d8f:b0:431:5bae:c600 with SMTP id 5b1f17b1804b1-4318c780d48mr50376755e9.34.1729862101341;
        Fri, 25 Oct 2024 06:15:01 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:15:00 -0700 (PDT)
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
Subject: [PATCH v2 09/11] scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
Date: Fri, 25 Oct 2024 14:14:40 +0100
Message-ID: <20241025131442.112862-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061502_999240_5B417ED1 
X-CRM114-Status: GOOD (  12.47  )
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
is a nop currently, it should help with suspend/resume.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index b0cbb147c7a1..fa4e61f152c4 100644
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
@@ -220,10 +224,15 @@ static int exynos_ufs_shareability(struct exynos_ufs *ufs)
 static int gs101_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
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


