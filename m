Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48349D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usrOkYEIhJMHpNEH11NB+5bvhSO9JoP7forJzaG92bc=; b=0y8NYZewxQMiPzZ/bzxS5oPHNJ
	Sca2WcIKLlnEDZ4h96QG3ZWiqUv3pUfi0uh3dv0Ddg1aS8EpP53e88zJh6XB1xrAvnbpqhQDd7RAc
	M5b9jcqXgwexVZs7oVL/VIeWvM8RISdmOd805pSQJUkYYPsVC5S6WRcsblDmONHMruJ/b/p4Mh3Ti
	RedtFKVS2pinNiWXF1upCPH2b3tiMfq7FcKkdj8+BdmfWtnFRH10dwPMQfwEXn0i+6wH/QE8RCXvt
	fiCrwaOnjzbJKz2GfLZc5VV6lTT69sKDFeAw0vik/9bOqAJJNq891r9o3BG06NmAQ926aazdmSRos
	QHgZzLBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WnS-00000003va3-1Txb;
	Thu, 31 Oct 2024 15:09:14 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfF-00000003td0-1LTI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4319399a411so9004195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386843; x=1730991643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usrOkYEIhJMHpNEH11NB+5bvhSO9JoP7forJzaG92bc=;
        b=iLZzc5hCY8RgngjmDBDTxnCURQvLBVYT745HHF41DfRqkE9EXz19PZibCsq460zyhe
         tSEy0oreYFmrdjCe64dWMNelEwV5myl0r11Sh739Ay/cxYSgRwaje9izIXS0Xyh2Rvk3
         j8r3GprEzdv4adwuzWj8PRUAzs3F8o2t0LX2K+hO6E3hhwkU3QQ9vxgKg9L1NOweTvxP
         yJ1OVqj2IP+CK4noK4T9Yco12hgCfWrar+dL6/k09yqFCyy4yfDFOAIwX1uVI+dtK+F4
         eowG10h0Y53igru0otfOFHBzkhkbfoIyMDqu85JyrDYcw0bwZeB6gbGia31O3SRJsHw/
         nqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386843; x=1730991643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usrOkYEIhJMHpNEH11NB+5bvhSO9JoP7forJzaG92bc=;
        b=tptwU+bq7zi/fxcM7U6Al6AgBoxIEQKNr4IOei0vKQIE/pinhQp91PFYt1QrgemaZx
         bY7Ak4iHNuhRtjes4Jlpnp8plfoopxGUysT9gYm1a0md2Y4ReecCgbKdbG8cX4aVVBhv
         LDkiU28t+seiPvDAiB8enBHVtaQljOISsxz8QZoomJCoAcXX/BmRBZjSMN8BBI1A07jc
         nVtOeBxdek9cAxKRdIwFTcWsUrj5ag1xbAFGC6CGdEDazjzw+o1Xfbs65ZgnU0SC6Oep
         0m4njXEIJ8JTYND+CLvvjY5iKD/8bynY3D8mbCrpIFP3UcpnEyIC14RSTYR8IN6rBd3r
         wGRw==
X-Forwarded-Encrypted: i=1; AJvYcCV/oT02qXLnqiXhYNPxvvI54SKFds3qG8xDYG5AjOh9YlNssM97fx1BhTKgPFhSA8U2i2y38t7CrDBc6/1AgBOP@lists.infradead.org
X-Gm-Message-State: AOJu0YxFWL6lr5EzFgNg8VUGqYc2AUkQCIt1VeemFzh4oQ05XdA74fof
	dVHmDZJxYwP6OhPUnPkxrni7DJFNfYIQbxBw16KltpKlPvzZJiuqZg7sv13N/xA=
X-Google-Smtp-Source: AGHT+IE2nRqDWcprFbqsyiRnRrZSmdUyGUKgVh+UN0C5kREuaiIMyson1wnaLb7mms/VbQSk1nr2fA==
X-Received: by 2002:a05:600c:4a88:b0:431:9397:9ac9 with SMTP id 5b1f17b1804b1-431aa292eb4mr115733635e9.15.1730386842144;
        Thu, 31 Oct 2024 08:00:42 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:41 -0700 (PDT)
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
Subject: [PATCH v3 04/14] scsi: ufs: exynos: add check inside exynos_ufs_config_smu()
Date: Thu, 31 Oct 2024 15:00:23 +0000
Message-ID: <20241031150033.3440894-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080045_378466_541347B4 
X-CRM114-Status: GOOD (  13.10  )
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

Move the EXYNOS_UFS_OPT_UFSPR_SECURE check inside exynos_ufs_config_smu().

This way all call sites will benefit from the check. This fixes a bug
currently in the exynos_ufs_resume() path on gs101 as it calls
exynos_ufs_config_smu() and we end up accessing registers that can only
be accessed from secure world which results in a serror.

Fixes: d11e0a318df8 ("scsi: ufs: exynos: Add support for Tensor gs101 SoC")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: stable@vger.kernel.org
---
v3: CC stable and be more verbose in commit message (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 33de7ff747a2..f4454e89040f 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -719,6 +719,9 @@ static void exynos_ufs_config_smu(struct exynos_ufs *ufs)
 {
 	u32 reg, val;
 
+	if (ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE)
+		return;
+
 	exynos_ufs_disable_auto_ctrl_hcc_save(ufs, &val);
 
 	/* make encryption disabled by default */
@@ -1454,8 +1457,8 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	if (ret)
 		goto out;
 	exynos_ufs_specify_phy_time_attr(ufs);
-	if (!(ufs->opts & EXYNOS_UFS_OPT_UFSPR_SECURE))
-		exynos_ufs_config_smu(ufs);
+
+	exynos_ufs_config_smu(ufs);
 
 	hba->host->dma_alignment = DATA_UNIT_SIZE - 1;
 	return 0;
-- 
2.47.0.163.g1226f6d8fa-goog


