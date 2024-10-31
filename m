Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21883D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86sA0f6Os+pjSfGkaxQ4yImAusqnRJDENyNfYooIZr8=; b=VPjr/W6hryyjKdbpxWeskLXiuQ
	NXIG0Tr5JcHwTbrR+rwC5sWT1Ql8eelBqLXP4zUQri0RBUyxp8P/USF+Dy+sQLGzSlH96ykLPgdqp
	CDY/v1oYNxgKUi6QPU4k32Upt+egB+2dFRfF3wS+IsCrMJSxTqs0HTdX3oSx54JCJonMOumX1YHFT
	jhTvilYN1g80NBNfRJTiAvZPd2JBxR5qzGOOCwKbKieCf/G1WbP33SKjFSdwFSj2TAy3IWZ12MgtY
	davsO5l7W11pJ7m5YH3EpyJny8BaYMlM/MIlS5ycDGbYMu94BASJMgIlCiSsjiEpDYXcyAr1bOn1G
	r+pRUP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wp4-00000003vlc-2DgA;
	Thu, 31 Oct 2024 15:10:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfF-00000003td3-3FHJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-431695fa98bso8029245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386843; x=1730991643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86sA0f6Os+pjSfGkaxQ4yImAusqnRJDENyNfYooIZr8=;
        b=PucWpU4GJfLg6W2wulrAygLJjniv/T2MPeL03fOVNUa6Y5/RIUe3fSy0FS2YICfOxo
         0R2zqH/G7cY94Ec+Dwn65ihmIZinG+wkDeg03+9cgVqOSkMEAlTS3H2WX3z8tXuDoe/p
         wdMq/brHN06PNUCwxagtslWUAagFpyQb81fxh+iu47Y9Gf4ux/VUhAXNH6HBiQNHBH/2
         0dquUydNmNZy/Wiitp2va8IcWopeK0xpgmb38LYNyXh96mcNqsH9kdHGWuvBOs3wObaU
         7O3OLBAQUyf5nKQLBC9GOie8jwEwDtCBz5C/UVOl4Hxi6yvKSw7U3r70yM5ErrnzuWYi
         x1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386843; x=1730991643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86sA0f6Os+pjSfGkaxQ4yImAusqnRJDENyNfYooIZr8=;
        b=dHGIavEUMR2CglHFHO2vAbOePvoOM+y4GVT/bmN+oUES5DXibqwwPfyjVz/ZlFYsL2
         OASH8UojbvtdStacrtkuYRtm8KU95f10J489igm8e6vaKU63yWOsU+nm0XhLPtK1LKWq
         kER1CtZOjJ3TNNiHnOhJlYH05rNg5XZQwv2ieU5jpMl5H5NI5qkle1VFhbOGOgJOdBFF
         ISVD56sUI/1iu88XeqQxmyep5dtfbRk+gPGO7sqzdzgsEWDleTVU+HtR4x61EV0PNrdD
         eTwBpZXSO6OM46mQIq939aq9jMDiu7XkV+HoUGfYrz2Jm4d81RWtcRQBU15ztmaJqTmO
         MuiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv1fjyhs/NPi2LaCFlXNYswVBicqw3yFj4wAN4F8mneEqA4akPMgnASllwXzVPFiV0Ke3u9SKQUapqngvgk18c@lists.infradead.org
X-Gm-Message-State: AOJu0YwJpaCc9jJIWD+XNm9n1+uj6v2dL+v+5w45bWQJvnEVs6ktp1gx
	Xt111WxEAGRJ5OEqZEkiuhrmwvPGEmboAxs23Sg22sWf2T4Y6U0g6Rb1IBxwvAk=
X-Google-Smtp-Source: AGHT+IHBzn01GkaFrVY+fjAehvpLRixtUxLHicSEaRnq3vqepb6mFx2FPf0yhN2kuBANtTE7+uHjZw==
X-Received: by 2002:a05:600c:46d4:b0:427:ff3b:7a20 with SMTP id 5b1f17b1804b1-4319ad049a8mr154531185e9.27.1730386843327;
        Thu, 31 Oct 2024 08:00:43 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:43 -0700 (PDT)
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
Subject: [PATCH v3 05/14] scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
Date: Thu, 31 Oct 2024 15:00:24 +0000
Message-ID: <20241031150033.3440894-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080045_836675_18378412 
X-CRM114-Status: GOOD (  10.24  )
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

Auto clk control works fine for gs101, so remove
EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL flag.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: Adjust commit message to use imperative (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f4454e89040f..2c2fed691b95 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -2138,8 +2138,7 @@ static const struct exynos_ufs_drv_data gs101_ufs_drvs = {
 				  UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR |
 				  UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL |
 				  UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING,
-	.opts			= EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL |
-				  EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
+	.opts			= EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR |
 				  EXYNOS_UFS_OPT_UFSPR_SECURE |
 				  EXYNOS_UFS_OPT_TIMER_TICK_SELECT,
 	.drv_init		= exynosauto_ufs_drv_init,
-- 
2.47.0.163.g1226f6d8fa-goog


