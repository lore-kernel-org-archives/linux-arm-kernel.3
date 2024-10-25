Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FFED0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdoImO6OFfTM2Lw/aicaT3K93cFHqPSr98CjhrJS+DM=; b=SjmTh9kkyaZrVlpeWJcbjCOTe/
	9EOVdNFtmgaLwcpIvXDMj8XwoQ331HPKIRX7EcQ22XGQlR/rxoU6IzQqdXqkJ4CdoTft6tTtxRz23
	1kwEa9teA9Rj4D9sYCQsEjJMr7ZJv1xdHhuSGgknxrzoEn53XkzoNEh6CGs1OEOTpBb8Hqz2pioOs
	vkGxDZ6LNOl2HvuyREn4h7/x9AyYH3Omu/Zj9V6/eSzmvPNKw115lNMdwuzA7APtebHK3L1pW0btX
	baXxsa+Nm64wguBrF+JMkN4VfYVKieMZ0T2wBImAaBjC5ohGmpxqqpSCsLvQR6cwYKNSbLowI05pf
	GCvimbqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KRg-00000003pmM-39I0;
	Fri, 25 Oct 2024 13:33:40 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4K9X-00000003mjJ-3QdF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:15:21 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539fbe22ac0so2390755e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 06:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729862094; x=1730466894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdoImO6OFfTM2Lw/aicaT3K93cFHqPSr98CjhrJS+DM=;
        b=XRf80yYDmGADNjB9Eou7LVUKIXNzyU/UTCUR1CvswE5l5q03GoItbWx1nBaTiRnH9u
         YJlQZfbKbyg9Et7B3C+W/bKouTHErvr2P1GAu1f1iI3Dlt6KaOmSRWT2v4ZQqCdbLFxq
         huArdtIqnx1slT+xY0sJ8mTsC71iAMkfYjdRw/9yMEOKrWcoAETvvqJR56tyQMgi8VVX
         suvbMVMRmR1ZKJq+sj1EIrAUDKOMm51NeqseIAGVPQB3QJ9wKLrFU666dvqGYBiIKWq3
         xKLC085EPzWU5y69wFG93jJw2hLNRfDv+p6FQ/cdKVB0oSFAu92frNqg8pZpnPY4SDDZ
         K8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862094; x=1730466894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cdoImO6OFfTM2Lw/aicaT3K93cFHqPSr98CjhrJS+DM=;
        b=JOKQ7kTJBhv+Q5o9Z79vHfFDG7nfYg3Gkg0l7ATSPDcIll+nf4/VDac9LkOvkw080y
         MOlXSnda0CawR0b8Xlb6WYSsv+q4NDzJ/YjT7LEfUsIgWpOLKq2uSWxZYYIrx4X3+kIQ
         CFocyxhyOOhlBF6l3PrnVzaAjSSSH7qpDuYOK21S/Jwc/QwAM2DqddhMv/rrBUeJfmKe
         mDWl6CPtTs0lNP1W7ixVvqQ5yQp+QFBYkvF9o4poGDi2NJetkAMFcRdIxtTqu1d2SFJr
         DGdmyTRS8pPDyxFMGIXiEM36LbQD65RH+WyUVLPr++JS8Q3TkxvhvxD2+ZwBP1IyHDvc
         s0lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPPj2tmQRruhPifhVt/tOLXlAcLD/Cw+mhkp1BwyF/AahHLKykcvVOioWRO1r4puZku8A20Yat7fYdeam4zCj5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0fbV/1QlOVMBs1X4e8ecVfs0pnOTmPBROrlean+g0BHSYyecY
	UrMnd5lYYJar6/v6Zx3F6/3FxzC+7chY8mmIhTzWWxQrhH8/UbhJLG/TyDG2J4o=
X-Google-Smtp-Source: AGHT+IHBrQGT9pmxc4oL2n1+HSGkoaeL5c5Y5zzjK0zgLQAj/a//GEezqB7iJbnehPJAIoa5TXY2sg==
X-Received: by 2002:a05:6512:1585:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-53b23dcd34fmr3409903e87.2.1729862094046;
        Fri, 25 Oct 2024 06:14:54 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.67.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b58b6bdsm47616685e9.45.2024.10.25.06.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:14:53 -0700 (PDT)
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
Subject: [PATCH v2 04/11] scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
Date: Fri, 25 Oct 2024 14:14:35 +0100
Message-ID: <20241025131442.112862-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025131442.112862-1-peter.griffin@linaro.org>
References: <20241025131442.112862-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_061455_875748_775CAC8C 
X-CRM114-Status: GOOD (  11.08  )
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

The values calculated in exynos_ufs_specify_phy_time_attr() are only used
in exynos_ufs_config_phy_time_attr() and exynos_ufs_config_phy_cap_attr()
if EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR flag is not set.

Add a check for this flag to exynos_ufs_specify_phy_time_attr() and
return for platforms that don't set it.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d685d3e93ea1..a1a2fdcb8a40 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -546,6 +546,9 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
 	struct ufs_phy_time_cfg *t_cfg = &ufs->t_cfg;
 
+	if (ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)
+		return;
+
 	t_cfg->tx_linereset_p =
 		exynos_ufs_calc_time_cntr(ufs, attr->tx_dif_p_nsec);
 	t_cfg->tx_linereset_n =
-- 
2.47.0.163.g1226f6d8fa-goog


