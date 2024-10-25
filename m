Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B955DD0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aTUxFFuuS7q4apCNsR9KGVB+f/W8Symh/UfMC9/XY8=; b=v0uukkCVYWcpgiwoNxOhhFNP/x
	p7/hy/QUtayYpwTRGo2GdFiPPRsLqUIR3n6DOUkEru7p0jlBwxreHumk4bd9Bzm5+l91cGviKjMqM
	yMc5Rhh2reVAFnNL8YWhksF/KHJ7nign6/u5sOJbSfhbUm7GU75NTIzKoL/nlzw0MGNnQeRfYt0+x
	xNGvFJerUBPj/dv/xMqqVK7GL9fWyIoy4lkRtNMXC8UorJK/ZCLmokpqF75XPLmjwfjQ4cfctb+8G
	XpHHpt2Xn9f6Qyv204dFCop4fwOZJC7jwyfPclN7mepX+kwq2ObiaRhEFkH/oXriyZ6WQ1EFGIEMy
	eoTdHcVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KJu-00000003oYt-3CeZ;
	Fri, 25 Oct 2024 13:25:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9m-00000003moF-3e7S
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 13:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0aTUxFFuuS7q4apCNsR9KGVB+f/W8Symh/UfMC9/XY8=; b=gskBDtFztJnSOiLYyhzZUzkzo4
	n4BHFHANTZaTz5St4kU6rmybn2/4qxQNpP/d2yX8pmKGpafq/WgwSBIfLcRzARNWuBzpPxPUj12mJ
	PftgsvbIEsBS8x1mIrtw1TI2DCpnr+97WC9a5Izd1eUj0dEAjJ66xPflS/b3/dLmTsEZPCF+2ZmBi
	SC+KCU3yR0WllbRGH8ryc9X/ddcg+gEpJfIQXNCndkq+/E1fWEdw/4OHPuDwQ3Uw/LQS3pDu6rKJk
	YpeVM+dzFVHYkDNI/4NQ6JxI28k7zNqhhWlSsixEM9v+6exw7KumF1JNHgyuPA5QF54ofm13wODg3
	YdtEuDTw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9i-00000008v59-3PVj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-42f6bec84b5so20842885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862104; x=1730466904; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0aTUxFFuuS7q4apCNsR9KGVB+f/W8Symh/UfMC9/XY8=;
        b=RHBMQ+q6u0YNDpwUotiVaFOEKA1apj+yQWzmEwUwJkD5jWntu5EvzoNOJbgKsYDktQ
         K7tF4ANqSWcJpC99K/znhwodTUEHDBf6/L+FQbvcivJDHITNELACtkMCTPP2MTksmkz7
         WeivnYpXeTfjN76e1gEZ7jag+Zp5kff6SRrQe5yxiLFU43s6g2kS1ZIs2y0RFMOXUWQe
         XVrG9rstq0IWfmy+36vk2PyvrVNyfdo0zrw3XHED5mJGF3Ucrlfu1uB3N66ZxYmjtn87
         itBgp5eyvII0X2YVMphbGw9F78fOnlaWp30+htTDlR9Kx4s5tgkxwqdEnAZMViEC/+aX
         rBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862104; x=1730466904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aTUxFFuuS7q4apCNsR9KGVB+f/W8Symh/UfMC9/XY8=;
        b=nVv0vjtOMwXuWelDO/JLntNEAUiZK8iW9efHnMYVvHDESXZhH6bNWZM6VUeoMq5kuL
         yMTVE4pwUMI8dsDZkV4Ye2J/laKVvTMY5iWfzuHSu7RVWUuhpovZJ+ZkHAIL0ZdzxmFQ
         HLlS+LyN6xWocBjUPDF+hEha9pWq3hm4086WlNblTEbQZ+5kkSe5T0C8tdac52KjqYsq
         mO97aPD6Ct6yr5GjirRYlpPC2hNISzwZdRUSHPNhTFi9khtq+cuwhC9nntfkthELd5J2
         NLcfuvt0Z1KRjppmW/K3M2/yL26G31lDvwaiq4Vw4uCxERSJzeJxTPbyf/V8boXiTLgW
         Gdwg==
X-Forwarded-Encrypted: i=1; AJvYcCWCDOVjObUxgWpHhL/gBOEHaOJJhY6m8EYHT/5T8BvnsKLHdtbz6Fv/IfsuuPyamN0f1zAHIz1VF1QBG/dU96lS@lists.infradead.org
X-Gm-Message-State: AOJu0YzFB/jmhx0n05H7CpkkAPQ2QDYKWZr37Z2ccdv7jVn027v+CLwW
	fRxfiF4bt01mQGXAjpA1cZ1/+/j3GyWRuTSc4+RGomtzb4AcNw1bvbQxC5zM8ZY=
X-Google-Smtp-Source: AGHT+IFn4umTFqPxopB2GAJY2aOrR7RfiFspVJ8SdEfcnoO13PLJi0jzfHRWD2Ee5O6gR0xA2R/rxA==
X-Received: by 2002:a05:600c:3b2a:b0:42c:af2a:dcf4 with SMTP id 5b1f17b1804b1-4318c754f00mr39202585e9.27.1729862104292;
        Fri, 25 Oct 2024 06:15:04 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:15:03 -0700 (PDT)
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
Subject: [PATCH v2 11/11] scsi: ufs: exynos: gs101: enable clock gating with hibern8
Date: Fri, 25 Oct 2024 14:14:42 +0100
Message-ID: <20241025131442.112862-12-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_141508_159508_B585C40D 
X-CRM114-Status: GOOD (  15.12  )
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
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 3bbb71f7bae7..7c8195f27bb6 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -229,6 +229,9 @@ static int gs101_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 
+	/* Enable clock gating and hibern8 */
+	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+
 	/* set ACG to be controlled by UFS_ACG_DISABLE */
 	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
 	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
@@ -1566,26 +1569,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
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


