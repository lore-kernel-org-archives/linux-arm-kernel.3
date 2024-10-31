Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C468D767E5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pek064Hz7CIKn8YheYCxRzKFA8nRolzJISWb5PBD7ls=; b=pDfIJVhIs2iv8vh34RKSj+RL9R
	GeA6IrfbcHk1bwcUeXas1HuBCDV3LDxZKJOEK66hQ0w5CDFMYaKcpRX3hlWMYyfx0Stei9fmnZ6wp
	f0b4Emf5fF7Efs6Sw68K/delDYFV7hClJDJRnH4KDvRFQdWyUvStcNutab2I5hn5Nmb3rPWv8vbyH
	3+McpKWswqdE5riHS780yEqo1E7aUbLu/1/s9EOexwNYW5N+11Ua+IVCj8k/WBPsXO9hjZy52S32y
	If5AOwDSpIqZVJMdZhOKjwEzLzaXfTfR3+e2e7dr3tF68YtIMJAA+cAHZwTTL4GCDPYtVn3YB+vbO
	GavSf5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAk-000000040bY-0vrr;
	Thu, 31 Oct 2024 15:33:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfQ-00000003tiU-027W
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so756479f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386854; x=1730991654; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pek064Hz7CIKn8YheYCxRzKFA8nRolzJISWb5PBD7ls=;
        b=cLiqBmiOUntAnaEUXltJ3ZAtQ/PtgjEHxEJl/7oybq3HnHo8XyRlziuSfhlj/YmglM
         R0G/OsWLeA6MwvYw/SwMlNYjZvAWZTJq4MKMHvpazbzuOiO6w76eiRkQXxrmD3Vfdzgz
         eXp4nCdzpU4M+kyciPI4zJvKWCtsQyq1zWO0/TXVYUxuYleUbM4+BxyCEC0iKSyeHbUA
         2nMwEnDfRmiQ+EfDLYyoHzZbiJaffdr87GWoe6oxGXG/ujJr8Dkq9VgLBxxXpqHPwLUr
         o6scOhsmuVTtPqpxYyqmp7IgwccfGfCICFInsj9QwiaDMEXbNsBz414CL1zUg4N7WS/h
         zB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386854; x=1730991654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pek064Hz7CIKn8YheYCxRzKFA8nRolzJISWb5PBD7ls=;
        b=kVrqclcI/L5q7UxlF+E9j4vuIOumz95C0AQ85tXMurx6wki+R/7ypjs+Hh+ALJEBiS
         wbf/iEuvaxVVslCAwIRoaHj0fj8tfhj/1w6L2rbdgalZuZ3tpxwksdq1BaEZhMVBoNck
         L8IEMYnqwoYuITemGOL4kbCPgLHzsfF5ilQL83p1gMBrrrCKtFoqNJF8X7IrtyN5odio
         y783vvRjyNfepk6y8nc+6lbhwClRaHOnnapqJZy05YJAmKa7NPy3xc2qVNNv0UjD68rr
         lvv/CHZiYYiq2RN7GhZ+Yw5jZZJ1KPAHT/fLbp2Ad1xLmwhoBDL6a8SfOrZWr5G55ddH
         gVkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXryIezhoIE4hTCjiVHvS8uEybW+KneJ7oge0vmcPzhQpmu88/wOQbRGXgPrbw4juUrvM4DT9tWfgZ1mkvvsoTv@lists.infradead.org
X-Gm-Message-State: AOJu0YzhMtLw/wnuVbwLgEU+sFGQ7crOUr3zvuxqpQTQYi6te4yDshXw
	HXbQyxTbYgjXHoI0mMfkPDfN8HoKbpSX/1WRNpTUcfRz5r3wLeNftcR2mx1X5RQ=
X-Google-Smtp-Source: AGHT+IFW5CC5JRXdKxYGdEgD1gfJan72KWcvXpNH/k/uV7fOOa8gSAbAZdmjlZXVCXNa52l8mJQzTA==
X-Received: by 2002:a05:6000:1a8e:b0:368:37ac:3f95 with SMTP id ffacd0b85a97d-381be7d8f8bmr2977899f8f.31.1730386853121;
        Thu, 31 Oct 2024 08:00:53 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:52 -0700 (PDT)
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
	Peter Griffin <peter.griffin@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 12/14] scsi: ufs: exynos: fix hibern8 notify callbacks
Date: Thu, 31 Oct 2024 15:00:31 +0000
Message-ID: <20241031150033.3440894-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080056_077739_3EF9FEB7 
X-CRM114-Status: GOOD (  13.77  )
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

Link: https://patchwork.kernel.org/project/linux-scsi/patch/001f01d23994$719997c0$54ccc740$@samsung.com/ [1]
Fixes: 55f4b1f73631 ("scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: stable@vger.kernel.org
---
v3: Added Link tag, and CC stable, and Reviewed-by (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 5078210b2a5c..9b6c4cfd7665 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1526,12 +1526,12 @@ static void exynos_ufs_dev_hw_reset(struct ufs_hba *hba)
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
@@ -1559,11 +1559,11 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, u8 enter)
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
 
@@ -1582,7 +1582,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, u8 enter)
 
 		if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB))
 			exynos_ufs_establish_connt(ufs);
-	} else {
+	} else if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
@@ -1669,15 +1669,15 @@ static int exynos_ufs_pwr_change_notify(struct ufs_hba *hba,
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


