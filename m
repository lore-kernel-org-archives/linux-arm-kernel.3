Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA2FD767DD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNj/fO2D5WmaTEfTa8PNOYPo7uMWdpoJlT4sv1Vsh0M=; b=QAPwYb342Jqt2AugaEGx6tgg6p
	o9ym16HNrjsIrioxK37UuXjbiaUwk2uoy7qUDuvA0f6cf1uWzrIrdfDpBVKTla62GJi+Tk5DkRk8C
	JYQzFS82f0grPyReN46KFnHdFx2Cm87x4KXqld8hPleYnTIuW0z5iI21w3tpSYIUMV+PAr8BOUov+
	LCXy/EyJ5fCKg5Z59/K9xyL07XHsNg2TbgHbJ51q8URAMAKtm1PRiBGQPIvJ7T80s+6WsF2DBdZ2K
	bLevoJKjB3z5Y4SOHtT8bsfjqXd5gOucaZo4+kqQEIa13wJCxqwvPydqiGXF2X5HLx29nK3TY5iDM
	52zCdGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAl-000000040bt-0N6Z;
	Thu, 31 Oct 2024 15:33:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfR-00000003tjN-3mgr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so8990415e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386856; x=1730991656; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNj/fO2D5WmaTEfTa8PNOYPo7uMWdpoJlT4sv1Vsh0M=;
        b=lN1OPVrUvPBqCVfBhC7VR93ms1oZwvAscCMrMoezJpPKCGthF2Na+qCVFrv4npObuf
         cuQ0tGvRAomu3KhBqU/gVu/mb5Zx3ru95kiebmyFlj//cWZ67EsXqIFsHfzTBmgIEBoR
         KVxz4B7V8FAm6T+BDzYXC82WwlnvNeqzfapIQqkgnoltTdEJHtHWev0xuzA0jqTVLZtG
         uSLQYL/iGPZ4ZmAq2Eg1os4xodXVr5dbDHKw5s5Oy/BMlH5dBXV7kCrGdxK8mEsKa5qw
         gdYcl7fKaIkysnM82cCEb84pISaES+XJoXb/TF0RHyi+ToUITu18MM1DQCqNSYdITZ+P
         0t/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386856; x=1730991656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNj/fO2D5WmaTEfTa8PNOYPo7uMWdpoJlT4sv1Vsh0M=;
        b=OKaIT1rbFJGAsTLha74vXziYQld5dndoPIhpNjXcdl3BLZ9C38+A9o4tsfQfkhUqCN
         e8rfFJNKfNmtNsM88qlp9k4DJWno1K9iKqgSvZ2dfdZmMQgRTE/WoJ90DLJWiDcPUV+x
         8DRsgFiBFryNo84E7AUDrEBrSp2FIOoJH7DIdN6yEMQk4r9cHLEGljQR8RMs/kYzhP0R
         CndDVa+N6GTMwRjI63+UnbU/UelzFF3sFRwgR7jLhKG161rE83fnAPhispJSVUA/b/tg
         oc8P//m0XB0a+7tL/iKEyiKbtlL5PsMgCytXclNSSshu1dQzMbvdDTtts57PH82dms58
         b+PA==
X-Forwarded-Encrypted: i=1; AJvYcCU1YxXOt2YWna53BHV71qMOeX5uYSt1I9jH220I+bQRr8q5yeGPilLYcDnUs64UZMAAB3uCPIeBqvLEKZ2XLHip@lists.infradead.org
X-Gm-Message-State: AOJu0YwRMyJs0Rg1oZBPGW2a/EglQc0gZnBA/WJh1iobGbFi23CUmAtc
	AM4FtnJi0QlbHIix1CT8008QvxEGXPEaBuFkx6xaM2eraF9vW6hnvEraHBMrnSI=
X-Google-Smtp-Source: AGHT+IFk2eCgQm8YNMTKlqq1iucR50hnkbAH1iMz8u+bWLPGYs3QFvnZ+3u+58W5gWdqPaK2uS9iZg==
X-Received: by 2002:a05:600c:4e46:b0:430:52ec:1e2b with SMTP id 5b1f17b1804b1-4319ad2b89emr185435505e9.29.1730386854912;
        Thu, 31 Oct 2024 08:00:54 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:53 -0700 (PDT)
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
Subject: [PATCH v3 13/14] scsi: ufs: exynos: gs101: enable clock gating with hibern8
Date: Thu, 31 Oct 2024 15:00:32 +0000
Message-ID: <20241031150033.3440894-14-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080057_978925_0E28B71D 
X-CRM114-Status: GOOD (  14.00  )
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

Enable clock gating and hibern8 capabilities for gs101. This
leads to a significantly cooler phone when running the upstream
kernel.

The exynos_ufs_post_hibern8() hook is also updated to remove the
UIC_CMD_DME_HIBER_EXIT code path as this causes a hang on gs101.

The code path is removed rather than re-factored as no other SoC
in ufs-exynos driver sets UFSHCD_CAP_HIBERN8_WITH_CLK_GATING
capability. Additionally until the previous commit the hibern8
callbacks were broken anyway as they expected a bool.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9b6c4cfd7665..91827b3e582b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -224,6 +224,9 @@ static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 
+	/* Enable clock gating and hibern8 */
+	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+
 	/* set ACG to be controlled by UFS_ACG_DISABLE */
 	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
 	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
@@ -1563,26 +1566,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
-	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
-		u32 cur_mode = 0;
-		u32 pwrmode;
-
-		if (ufshcd_is_hs_mode(&ufs->dev_req_params))
-			pwrmode = FAST_MODE;
-		else
-			pwrmode = SLOW_MODE;
-
-		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PWRMODE), &cur_mode);
-		if (cur_mode != (pwrmode << 4 | pwrmode)) {
-			dev_warn(hba->dev, "%s: power mode change\n", __func__);
-			hba->pwr_info.pwr_rx = (cur_mode >> 4) & 0xf;
-			hba->pwr_info.pwr_tx = cur_mode & 0xf;
-			ufshcd_config_pwr_mode(hba, &hba->max_pwr_info.info);
-		}
-
-		if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB))
-			exynos_ufs_establish_connt(ufs);
-	} else if (cmd == UIC_CMD_DME_HIBER_ENTER) {
+	if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
-- 
2.47.0.163.g1226f6d8fa-goog


