Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3ABD16816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5J5FE2rV7ygCFlHLBwb5hCWqtsTpEMKY5DEUv0AXHWs=; b=tE++lu2Gl5xHekqvwnzUUwC3Zl
	+FPDR9gwWwwIJ+b3tNJLfZIdtp18V0pcKUdcbW1tJ9hNzyKZuZ/tx5VCFLiFs3+Z8M6nJLqUfsACO
	OVnyFid9UaD4xYcppZI8tx9DylmLKZHfE0CXHXBfq+SdnK5xICGmCfaX+oVh/PkaNslyysC2NSGOp
	oMriIDl2nKsR/1505BiIP9xmxYeHKqmfVBsntS4MaYxu+w0hogUw0C9qsd0QQyG/UaCmAF1umkI6F
	nsl1rsVh1VOG1Ir5Z7OdxT4CHefbrBajeLxE2ZJ18Vyy9zBEUyJSJTm2NtcPhLWT2SwAMSASDKtX/
	tMEuHIrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAr6-00000002ERo-1dlX;
	Fri, 09 Jan 2026 11:40:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAr1-00000002ERO-1TBU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:40:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-42fbc305914so2805266f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 03:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767958829; x=1768563629; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5J5FE2rV7ygCFlHLBwb5hCWqtsTpEMKY5DEUv0AXHWs=;
        b=wcsOPBC9/BYX5/EdNt272MG00uNvZ5+OGQT2qbefLWodHmearB0tnxRgjLpwVohOcq
         eQSLff6MNRPc1FKUJJODtGqyktcKNWc4c7c+1p/VCYXAqqI0VTVNOvXrDccTN1FhGjFe
         2cQf3xicQ9RdYk1qBqibH5tabBQ5lWlXsbWmuhcLMZ8N9RGFbAkSHpB7kuArHXs1dw1P
         7nYgYDVNjRpQ9kpBpL+mjLbasM/bILkbjE1E0h50SfTnjZhwqUY4G1XN3Hdn8KHEXtVJ
         RbOzwVOLpNYQunYE3rgg29AI1rH73SDRowgz3lyJxCT3T1Q+SxYwpxE8NrfarA4UmypT
         FIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958829; x=1768563629;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5J5FE2rV7ygCFlHLBwb5hCWqtsTpEMKY5DEUv0AXHWs=;
        b=e13eQ/QwhHVFAzMzNd5oCeD2qgij8CSSM4aQ2kBnl4iNKMlmxGMRWvTWGWiRMj9/Gc
         2yjQb78tP0QrWYcNcRrgF5HPwq2LBdHVXEDVquA5EyxR4aMi1mHZcek/lL7gkxm3Sruo
         kPcDTM8jZJCuXL+F3Hls/IVZPFFYdqLzkNGb1huIL3P2Yhpk103txbkBzvK/Yvq+Y+By
         Pd7E/Lf1x8xZuuFp7O70gHkDFtz/xCa/e1RJYPAjyS/0YMzAhma34V6r1+NsOdfckoTN
         VEgk+GxHDGURcJ1M4KVV6afaBtH+cHZ902tfE5DwM5zbn3R68Z6ssoO+GPjHw0qx/A32
         /2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVO1rEEn7YHRZjYEx4mho+saQylXrY8LE1XMCTSoza+KrrT1vm5YqIiwFhgoH70twRXOTz4/Wjgycj6idZT2UmD@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3HZsBZmd1dXY5fygZD3SsP9qQG49qWtuQchfX8vWtduV1vHdf
	gCvyJ/dO8sHyMKlP63P5KUmZP+O5xD/yHrNpijJ4gad01nfi1ywFvJAs/xM76oqlqPY=
X-Gm-Gg: AY/fxX7EGuXLEbMgltiTYqppFAPBuk1FftO1vU8s6Epz9ufFoHrlY0KeoC3xCfB+Ijm
	oHBCa/NqxuiK+lSkTWix72RvGZfWzI84I/mDqXis04Nnlk5CLf/Z/HwC3WLH/GEBGaM5NS/J/eL
	U28Rp5wa2RZQJkK3m2l8THJ6BAls0Z1udVDP5BDMnH5bcoVRlhq4pgEAxiN9aE06Yrw1XAkHQLv
	7TZpxy9Uo/C2LRFE3xONNYoWTgXHT5F2MSMfcOVe/0ctRWvTyxpLAk/W6mddFIQDuRjESxxdRD5
	S90iGNMg+nA8eN3pMd2MPwdj0rM4TQyEcBRbi3FUY2i4+htTqvVtO+ptPxQ1dTTv/8thPORHn9R
	njvi3skoAOU+6aGDIeCuFgivYfhG9Ai9wDg3a8NDKhIXnA/qAgAtlmnUCSArxTwbuscxvQDjsoi
	701YP5B52As9/6J1Udc6V/ZbT6O0zq/kiXKABHWmViCH4=
X-Google-Smtp-Source: AGHT+IELE5v41GM1z995DCq/Vq26mXGNxF7McIPtRrpLDzdmNXt9k6T//iVWMpCwb1VhSb6sunaZeQ==
X-Received: by 2002:a05:6000:310d:b0:431:7a0:dbc3 with SMTP id ffacd0b85a97d-432c37983eamr11401803f8f.29.1767958828730;
        Fri, 09 Jan 2026 03:40:28 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:1e1:d32d:b1c0:70fe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0daa78sm22039102f8f.6.2026.01.09.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:40:28 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 09 Jan 2026 11:40:14 +0000
Subject: [PATCH v3] scsi: ufs: exynos: call phy_notify_state() from hibern8
 callbacks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-ufs-exynos-phy_notify_pmstate-v3-1-7eb692e271af@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB3pYGkC/43OTQ6CMBQE4KuQrq1pH/+uvIcxpMADmmiLbSEQw
 t0tGGNc6XJm8c0sxKKRaMkpWIjBUVqplQ/hISBVJ1SLVNY+E2AQs5SFdGgsxWlW2tK+mwulnWz
 mor9bJxzSimFel3ksqiQh3ugNNnLa/cv1lQ0+Bj/jPmUnrdNm3j+MfGv/nRs55TTKoyip0yyGm
 p9vUgmjj9q0ZKNHeHMJ4yz9xYHnoMwgFBADy8ovbl3XJ0YmBW0vAQAA
X-Change-ID: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, andre.draszik@linaro.org, willmcvicker@google.com, 
 tudor.ambarus@linaro.org, jyescas@google.com, bvanassche@acm.org, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2460;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oLaz/UPrpvvVLvgT2gPEOxUMrZw3BlciMhOBrJEZYCc=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpYOkrHReCSBWEN/TSNB6WKtGTGJD7Ov8Gz4YEB
 gvVHdsEOMOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWDpKwAKCRDO6LjWAjRy
 upYYEACZnZyKTZmwQfiAtYvOWkCyYxJZ/KNCLdxulf5MEB9TQcdgJPXm2lSC+TVjNbk0mqpwnpN
 WvTDw1mEeO3y5fYOJJSfDQJ+wywTFR6s9iqY9nK6OYg5hJU36KR7aL831JB5cj0D9EYLGW/Q8p5
 ylTTPbyfXWqyKkp9CM3+hdEcHHUyF1V0Dr7W1ftouPkX2RmnTa/1/DJaA028s33tfFuOt+NZoxN
 3M+Q9Sp+7KtyDJNsDzTciiZzce/R5uu56lfFGoWRS460/wRNMtDLhimdz1u4qY4X4bb/0bYsG5y
 jLjCNHCLLapTSzmCNtDoEpbL1de+l22NmhZjPJTnD1+rFqE2GjWVlTkRELM3H26PARMI3NGTSaB
 Gss8PVUjhXnEu4gX4MqgtIlTGC8kt6cjj5o8GC7oSRSPjWP1t6XXfbshv3htiCCbz1mpjAjq+hp
 QOVHyTbLBRPvEIpDXFJ2XW3AhhzHd7MoMEJNRtwER2JXkwtJKs0TeEwTeMf1WgjBE8TApVU3P3F
 nMk/93wGYaqnLB0W3pIpLyW3A9VllLKB8iHiaS8zFIcdddWd/GL7FV/zFqXrecSPWg8ZrgW689U
 ytnksczMBLuvSW23pK3ux7WliK0khF8I/0YL6jLW2AzqMGIBgJ2F0G4NcycVMWOtSPVL8alwBX9
 VGjzmjsQlsfw8mA==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_034031_453192_6BCA0944 
X-CRM114-Status: GOOD (  11.73  )
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

Notify the ufs phy of the hibern8 link state so that it can program the
appropriate values.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Note: The phy_notify_state() API is part of v6.19-rc1 and onwards.
---
Changes in v3:
- Add 'static const' (Bart)
- Drop Barts reviewed-by tag for now
- Link to v2: https://lore.kernel.org/r/20260107-ufs-exynos-phy_notify_pmstate-v2-1-2b823a25208b@linaro.org

Changes in v2:
- Collect up tags
- Rebased onto next-20260106
- Update phy_notify_pmstate() to phy_notify_state()
- Link to v1: https://lore.kernel.org/r/20250703-ufs-exynos-phy_notify_pmstate-v1-1-49446d7852d1@linaro.org
---
 drivers/ufs/host/ufs-exynos.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 70d195179ebaa01f38331faaee6f8349211c4c3b..76fee3a79c77b7117a2c02f380f8c78d702ad173 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1568,12 +1568,17 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	static const union phy_notify phystate = {
+		.ufs_state = PHY_UFS_HIBERN8_EXIT
+	};
 
 	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_disable_auto_ctrl_hcc(ufs);
 		exynos_ufs_ungate_clks(ufs);
 
+		phy_notify_state(ufs->phy, phystate);
+
 		if (ufs->opts & EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER) {
 			static const unsigned int granularity_tbl[] = {
 				1, 4, 8, 16, 32, 100
@@ -1600,12 +1605,17 @@ static void exynos_ufs_pre_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+	static const union phy_notify phystate = {
+		.ufs_state = PHY_UFS_HIBERN8_ENTER
+	};
 
 	if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
 			exynos_ufs_enable_auto_ctrl_hcc(ufs);
+
+		phy_notify_state(ufs->phy, phystate);
 	}
 }
 

---
base-commit: 6cd6c12031130a349a098dbeb19d8c3070d2dfbe
change-id: 20250703-ufs-exynos-phy_notify_pmstate-c0e9db95ac66

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


