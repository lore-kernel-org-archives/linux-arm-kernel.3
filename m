Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D3D0C609
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6vAbSDgK0b1SDTMA/GPAVlnGTwcx5lchK0srsbvvoMo=; b=ObAnTKV42TExFRkKr46wJ6M5S+
	y38DondTbukxh8YJkZBgzp5rdQLAGk7JPATgFkHktFfDItSMe4yMVgz/n2K8RfrRGtjRfg1eRBhDT
	dbTdQawZiTpXTEwUyfixtXtqxY9zMbpIIh1uspo3ekhpUNmo9ookPp8ai2MhLLuL0a0ms6oz1MKEC
	LhcpI6Voblso5mw78B757tbdXQkOjvg2gpjRYG6MNHSxYXqiEGnwVy1ZQsmN00hUa7+Eh49u+I7K9
	7L5DkhSKn+HZytRqlYgq3zQ2tMfxy9swcJWAehj8c0WXI/eA4xK6iZhupRKZLO4KlUhovYy4tNr/3
	jgcxuoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KOY-00000003pCS-0rMN;
	Fri, 25 Oct 2024 13:30:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9S-00000003mhM-1vjD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:12 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4315abed18aso19895075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862088; x=1730466888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6vAbSDgK0b1SDTMA/GPAVlnGTwcx5lchK0srsbvvoMo=;
        b=trdXWh1uRPq1ea8VJx2zWJhQZqxK0ITlXL53IZRT3tkjwigZyaPVjq3Bx4LoJJM8hY
         +9aI0Co6c2Hv+925toOqF/KfLFPcHbbJY5l1MjUJKbEQbVR7cK3sdmx6boivrKtJWv95
         jstWXvQOxkwK9YKLqmJmGJMt3lODYe6BsOkqytOiW9agVf4D58ickDgq79fw/QIni3AI
         wjHia8n3BK8+TVXQ0kHTLCiKpoRxOsV/HF34mYkbtvNt4/TZ/qpOKZ7U1cOtjSd+bQOJ
         IjjcwvkZSWu+OYtsVESzetI5l8ujPhkt3kIpw1vsYvHAhjFSBtIAjL0gaOmCtKX9iXsF
         ep7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862088; x=1730466888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vAbSDgK0b1SDTMA/GPAVlnGTwcx5lchK0srsbvvoMo=;
        b=BKD0DvYrZRF6nxs+b9biWXxAaXZLFZ3ouOouAAq8U8rRCttk+E1aaUmctZTIW+BhXT
         S1jowE8pyNR/5L0eAPsInpJmsMzA8cmVHWwX+K5sKUDxv7FScDLzgf//0b4+zc7XLIm7
         mwMxxJ1sUAkW9io+EcmDxCkxEySLpEJLVODbswsqIzowp4VEXWOiXQuv/v5NDrDUE9AK
         P1ee2+oy9/IELGnst19vE3r3OiU3HwY4ZskNj6Hv12fGz4rVxR+iE79Ubb5lIbCzm1Ok
         ClTr5jYCkgxhOKtbi2FSAoVJ1emWmJ3KrH+SlF4Ocp4vy0ZqO6lSBTFBF/NgFVZBuFMK
         aHaw==
X-Forwarded-Encrypted: i=1; AJvYcCW31Vh2pqV9NVwDvt/pGfI3VQt2CIm6EdvZf565GMY2l56f9adoQdWE8NdpPIV1fQDxJod91X9c8a5M+zH79ic0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi7OuZCU+cjiKpjz0TCCVFKjwmSPXv6o+ik21+VG5w6JVyhPlS
	pfeK+U5TOD8PPfoC3ft4CIVyNHgIzb0fpWLVRbvd39Izabue54kTGmRKMwV2bGM=
X-Google-Smtp-Source: AGHT+IFHcTwJLU6dRFhjx0/7uuUyXfb0Sw0nQJJsfub37C8aAlLQ3WhmzctGx6Mxs5zTAXbGyd3rng==
X-Received: by 2002:a05:600c:3b90:b0:431:5ba1:a513 with SMTP id 5b1f17b1804b1-431841fdca7mr89863325e9.10.1729862087824;
        Fri, 25 Oct 2024 06:14:47 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:46 -0700 (PDT)
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
Subject: [PATCH v2 00/11] UFS cleanups and enhancements to ufs-exynos for gs101
Date: Fri, 25 Oct 2024 14:14:31 +0100
Message-ID: <20241025131442.112862-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061450_526975_B65449C9 
X-CRM114-Status: GOOD (  12.37  )
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

In v2 of this series additionally I've added following patches 8-11 which
add

* Clock gating and hibern8 capabilities are enabled for gs101. This leads
  to a significantly cooler phone when running the upstream kernel on
  Pixel 6.
  Approximately 10 degrees cooler after 20 minutes at a shell prompt.
* AXI bus on gs101 is correctly configured for write line unique transactions
* ACG is set to be controlled by UFS_ACG_DISABLE for gs101

In v1 I mentioned the phy hibern8 series in [1] that is still under discussion
however further testing reveals hibern8 feature still works without the additional
UFS phy register writes done in [1]. So this series can be merged as is.

[1] https://lore.kernel.org/linux-arm-kernel/20241002201555.3332138-3-peter.griffin@linaro.org/T/

regards,

Peter

Changes since v1:
 - Remove superfluous struct device parameter to exynos_ufs_shareability() (Peter)
 - Add patches 8-11 (hibern8 fixes, WLU support etc)

Peter Griffin (11):
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

 drivers/ufs/host/ufs-exynos.c | 126 +++++++++++++++++++---------------
 1 file changed, 70 insertions(+), 56 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


