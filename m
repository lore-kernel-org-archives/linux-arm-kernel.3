Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E52F5D0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ivh7+EYUuihJcPnZHjnVXOeazDxQAc1FZwbuTGARMJo=; b=k27xq5WmInrUfbYbxCyKwCd3Kj
	8t4GDUE1GiElQVlebqR0qRAkLs5i4aFlMs1CTxbeZ6UyNKdl6MPFvkxpn8prviVKmLV1CKu9w6B0h
	iMULFwZbccjuaOo40lvEipntqx6jMhWZchxxJ+pM1EFR+5kebZzFWXFcKjPwR60gLpIvaHg/66A5D
	I/vHRajI8/6tODYBeawmyZ2C3lRaCuy1ilcsD+0GG0VCY9Q0ICY1me7xue+qI4vgc7wR3CmLoudQb
	S+33NiUlJ5RpQqTmcEenvDfyO9J2bPlhARUKF2egc1vB/ySGl2kLvM6OIgLy9AbSMuNiyRXkrXLJi
	5AmTDk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KIM-00000003oE0-2OIJ;
	Fri, 25 Oct 2024 13:24:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9l-00000003mo3-34YQ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 13:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Ivh7+EYUuihJcPnZHjnVXOeazDxQAc1FZwbuTGARMJo=; b=b0QZk7cG+sYxFGtafPz/TztkZX
	d9iRyweJLOSHV6E5Wobjcau+Sz908FtzUbg9dc26Iu4oSUIhQwD0JG2GKgKgpn7OLbr97lmF5y5wt
	rIB/dobL7O81rb4otR6EvVVeeCZ8TOClVane8u4MukSnZOCz43ZTPfTw1dmiQ9+LHbquP1PI0Yvrx
	ft0ivju6algMUFsnwo+rNssBemT/VtC6T0MDhQUF0JqDhJUJbASdXObbZv8zqSbJaYd2z3rm8BUrU
	vc4Swc02zYaYxRF38i+l6sGj3qNTD14OTuJYGTH0eYhut1iD3fqJ1wjTktQZVdYlZEWUruKAKooO0
	NbQf4O4Q==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9h-00000008v4r-1Chi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315f24a6bbso19942605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862103; x=1730466903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ivh7+EYUuihJcPnZHjnVXOeazDxQAc1FZwbuTGARMJo=;
        b=VHOMVGVbrVsMgrqYmI49v4Dhc8MePUM31IdJgULqtiPNGFomQ2AMMe5+OLPb6j1jUJ
         N+1cPPyRbnQ188YEX1DPsEllxrP0dMc+88yd0JiRotYIHIu68GsLksmf689CeqBTP3Sz
         +tGCtSSMmGCDV015l5NniBBHHhd9ii2twl7wS+bwmW0mRl4X4UjUhPYsqZs/87nNyU8O
         jbdFO5EYipM3kHRtCC6zOSs8f3sOVXgSgTOXWNG5vs3Fonh5aeV6zBw29XUWgZNPRMCG
         X+OuSMUS30X20vz0McyZWkjc0G4Pzp2QZvgZFzYsrK74FOxBwMPAyUqAIGmeVjlqZnuM
         BzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862103; x=1730466903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ivh7+EYUuihJcPnZHjnVXOeazDxQAc1FZwbuTGARMJo=;
        b=l5hArxU+XjC9Y4Q+0kliw6tnM0GlMSW6Y51NgJLm942BMTp0Wz4OkrfDlcdvkbDj99
         Ylv98ezn9JA0DSpVD18/0XrLVWOrtGetCSBw/Mwp+Hu0zyLKxP/UtS8DMkZO7n7P6W4C
         NVwTyYz+2Y+4lOL/ZAc8c2ruABI8FSqZ0UJ+EXHsn2V5OH64SRrBZBEQPbrBiib+1MTq
         A6tAt6Nr1v7FnVnz4WKRB4W9JCyBNgsIyx8uu7ZHtP64+ow1l/Zp/j4dE9Ivxwjv1rke
         SGJj/bTYeJ0ODpJmNDmTvLQwaCJ8CHLSF0/2hX9floGbVm+7CE9a14tP8f8lmWOZwWB5
         /iOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVODiMo+TQkjA/BDPkmHjprJdXameMzwifm41+WOFkRw1lZFPbYss5o9voh+3eptMp4nqysiuI2YilwNvZNU+Fs@lists.infradead.org
X-Gm-Message-State: AOJu0YzLg9RFNxlDdSnzD9+ofHAo37BdyGn8fTvDqYkKXJXzW8u4W9c0
	6qQky+hcJKEwYU16vi3qhzzMvzCu1P1T1N2D+v4DlWTRpoEnWSNAYPKks0EQXUI=
X-Google-Smtp-Source: AGHT+IFHaCs0Brlywx2EDejiKT/SRxUFjAkp/495iouOQYJDyac2EtGgBL2CMBR/7/lJY4x2bivyMQ==
X-Received: by 2002:a05:600c:4f88:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-4318c6ea2f0mr54335655e9.10.1729862102813;
        Fri, 25 Oct 2024 06:15:02 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:15:02 -0700 (PDT)
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
Subject: [PATCH v2 10/11] scsi: ufs: exynos: fix hibern8 notify callbacks
Date: Fri, 25 Oct 2024 14:14:41 +0100
Message-ID: <20241025131442.112862-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_141505_454025_93E2FEDD 
X-CRM114-Status: GOOD (  14.58  )
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

v1 of the patch which introduced the ufshcd_vops_hibern8_notify() callback
used a bool instead of an enum. In v2 this was updated to an enum based on
the review feedback in [1].

ufs-exynos hibernate calls have always been broken upstream as it follows
the v1 bool implementation.

[1] https://patchwork.kernel.org/project/linux-scsi/patch/001f01d23994$719997c0$54ccc740$@samsung.com/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
---
 drivers/ufs/host/ufs-exynos.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index fa4e61f152c4..3bbb71f7bae7 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1529,12 +1529,12 @@ static void exynos_ufs_dev_hw_reset(struct ufs_hba *hba)
 	hci_writel(ufs, 1 << 0, HCI_GPIO_OUT);
 }
 
-static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, u8 enter)
+static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 
-	if (!enter) {
+	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
@@ -1562,11 +1562,11 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, u8 enter)
 	}
 }
 
-static void exynos_ufs_post_hibern8(struct ufs_hba *hba, u8 enter)
+static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
-	if (!enter) {
+	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		u32 cur_mode = 0;
 		u32 pwrmode;
 
@@ -1585,7 +1585,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, u8 enter)
 
 		if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB))
 			exynos_ufs_establish_connt(ufs);
-	} else {
+	} else if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
@@ -1672,15 +1672,15 @@ static int exynos_ufs_pwr_change_notify(struct ufs_hba *hba,
 }
 
 static void exynos_ufs_hibern8_notify(struct ufs_hba *hba,
-				     enum uic_cmd_dme enter,
+				     enum uic_cmd_dme cmd,
 				     enum ufs_notify_change_status notify)
 {
 	switch ((u8)notify) {
 	case PRE_CHANGE:
-		exynos_ufs_pre_hibern8(hba, enter);
+		exynos_ufs_pre_hibern8(hba, cmd);
 		break;
 	case POST_CHANGE:
-		exynos_ufs_post_hibern8(hba, enter);
+		exynos_ufs_post_hibern8(hba, cmd);
 		break;
 	}
 }
-- 
2.47.0.163.g1226f6d8fa-goog


