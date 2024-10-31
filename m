Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5C1D767DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iCEaeDborMpChWpG+09oPpilTDmpwNme21uFJErGw+s=; b=ipeZyGf5XzA5E7WSGvQfoubwsj
	jMzrOiUQ7zL+X26h42A2zSalaBBDOmHYuUbAWZ7KovK+eBG7S+wwXuDwDOyr5cAYYAOUbjxh1j7ek
	Ub23bFPCURkcUpieA02GOL2+VlxbduBC+SMfTotoqoG4EP55l4Lbw9wvvzQqkOlH7iQdasYqL3Mh4
	B4jY31yUCVStA7S+da0i2anaommnMMBryHb0o8ounwa7HZhvZ3v+t89yfYiyuljMZuz+B1ZhvPgax
	4teZxoN2EfK0PYmLi7x/ufJ2TGr7U3aOGzHdE1kveuU87Ey1q9nJ66+DTmAfKluL7HBm3jx6cK6E2
	t5sKt7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WiV-00000003uXa-2y0y;
	Thu, 31 Oct 2024 15:04:07 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wf9-00000003tag-2srz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so8601475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386837; x=1730991637; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCEaeDborMpChWpG+09oPpilTDmpwNme21uFJErGw+s=;
        b=vfU5KNjFAs/iKEzVzbJIy00NTd6KrIF4DRNq7L6F2doEuUGuTpmdWAXFuDk0M8vwoC
         cpHoVRK5dyZoT4+UeRn7/tv02caYyip9V883OKwT+/0y7tlEm63wLgNH8qUvfx8anu/C
         ChjG2Sc4AQKDPIH+iG9rWPFTB4bGS642X7ZH79rUCSym3nY7Lxx7KeH67UD3knrDTYdX
         wkR0Ztx5Q58iy4f0Q5CcfTlD5bIjAL6vPKFhEuucr2xuVKKspaGvez9l90XgBauNAmw+
         d2zOtj/4chSi11hI7IMD/yxQv/hZlcscQxq4EUC3BeTKADjFiwJ+lNXxrl4iKKIVlIQ0
         JTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386837; x=1730991637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCEaeDborMpChWpG+09oPpilTDmpwNme21uFJErGw+s=;
        b=GX0LUHVP64a+wZ/xb8+U8yMuPFhm6jkENWjuN4stn2lJngi9W5SMZ3/pgf7nHYuSVg
         ER9cUhKm3dtaCcwuAb8GqGQW2syfIL1EEJxt1rZJQ6Q5vNGcchVvlOS9swgV1dj6D0Vv
         xksGMUZmo2ubtQSJMqMh8TBIA+xcm5BObgwyh/HIgCD6HF9woJ6/y6i5FPULj7gV/iEB
         YUv4kfwg0dJL6K1K+QqjmOR7xcBGKUu9Gsv4CkJQT9WA1N7heMKV79cW7pkHWQHxvmqf
         eQnhAV17lTEXlb06KYT8176lUr93qI/Kubj2vaFKdeSK1CrrVM0wauGtP9UhpqkHlowK
         gIGg==
X-Forwarded-Encrypted: i=1; AJvYcCUWYNxY83iwkHXgi+S21wZSjAvegXTb7AEH4KEc8JXzKQdxOrUQz+yqRq7ggPTD1hSIQXnnwabCaZ+zR1+/YECr@lists.infradead.org
X-Gm-Message-State: AOJu0YyNynGY+tkiW9+M19XaSJ0+KZiX1uoC+hZGhlC0FUf95Vk7r+Ic
	LiMdRBribil77iUpsRUfV1OgIq4hYfNiJcOUN/hRRzdedDyof+p4/2eGg7ih+HM=
X-Google-Smtp-Source: AGHT+IH+HfNSNGik5mKCBBG/5S6M1R2AxyBfXCc47oa7MI7ol35//vP5TNbBTsLrmHg9i1EHWx9Okw==
X-Received: by 2002:a05:600c:4f14:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4328327ec52mr1208565e9.25.1730386836669;
        Thu, 31 Oct 2024 08:00:36 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:36 -0700 (PDT)
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
Subject: [PATCH v3 00/14] UFS cleanups and enhancements to ufs-exynos for gs101
Date: Thu, 31 Oct 2024 15:00:19 +0000
Message-ID: <20241031150033.3440894-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080039_758373_87FDCCCB 
X-CRM114-Status: GOOD (  14.17  )
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

Hi folks,

This series provides a few cleanups, bug fixes and feature enhancements for
the ufs-exynos driver, particularly for gs101 SoC.

Regarding cleanup we remove some unused phy attribute data that isn't
required when EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR is not set.

Regarding bug fixes the check for EXYNOS_UFS_OPT_UFSPR_SECURE is moved
inside exynos_ufs_config_smu() which fixes a Serror in the resume path
for gs101.

Regarding feature enhancements:
* Gear 4 is enabled which has higher speeds and better power management.
* WriteBooster capability is enabled for gs101 which increases write
  performance.
* Clock gating and hibern8 capabilities are enabled for gs101. This leads
  to a significantly cooler phone when running the upstream kernel on
  Pixel 6. Approximately 10 degrees cooler after 20 minutes at a shell
  prompt.
* AXI bus on gs101 is correctly configured for write line unique transactions
* ACG is set to be controlled by UFS_ACG_DISABLE for gs101

Additionally in v3 I've added 2 minor cleanup patches from Tudor and also
an update to MAINTAINERS to add myself as a reviewer and the linux-samsung-soc
list.

Note: In v1 I mentioned the phy hibern8 series in [1] that is still under
discussion however further testing reveals hibern8 feature still works without
the additional UFS phy register writes done in [1]. So this series can be merged
as is and has no runtime dependencies on [1] to be functional.

[1] https://lore.kernel.org/linux-arm-kernel/20241002201555.3332138-3-peter.griffin@linaro.org/T/

regards,

Peter

Changes since v1:
 - Remove superfluous struct device parameter to exynos_ufs_shareability() (Peter)
 - Add patches 8-11 (hibern8 fixes, WLU support etc)

Changes since v2:
 - Add 2 cleanup patches from Tudor to the series and rebase (Tudor)
 - Fixup various commit messages as per Tudors review feedback (Tudor)
 - Collect up reviewed-by tags, and CC stable where appropriate (Peter)
 - Add myself as a reviewer in MAINTAINERS for ufs-exynos driver
   and add linux-samsung-soc list. (Peter)
 - Added blank line and split hs_tx_gear/hs_rx_gear into separate lines (Tudor)

Peter Griffin (12):
  scsi: ufs: exynos: Allow UFS Gear 4
  scsi: ufs: exynos: add check inside exynos_ufs_config_smu()
  scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
  scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
  scsi: ufs: exynos: gs101: remove unused phy attribute fields
  scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
  scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable
    WriteBooster
  scsi: ufs: exynos: enable write line unique transactions on gs101
  scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
  scsi: ufs: exynos: fix hibern8 notify callbacks
  scsi: ufs: exynos: gs101: enable clock gating with hibern8
  MAINTAINERS: Update UFS Exynos entry

Tudor Ambarus (2):
  scsi: ufs: exynos: remove empty drv_init method
  scsi: ufs: exynos: remove superfluous function parameter

 MAINTAINERS                   |   2 +
 drivers/ufs/host/ufs-exynos.c | 136 ++++++++++++++++++----------------
 drivers/ufs/host/ufs-exynos.h |   2 +-
 3 files changed, 76 insertions(+), 64 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


