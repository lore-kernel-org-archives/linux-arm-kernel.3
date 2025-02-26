Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F9FC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTcDz5+Yk2Rd6PndDa6YwrNqhNuGseEibA7R+3Q+jN0=; b=p6ebqPdABNfT34Pk31exP1uibi
	qIbAJa+SUroPl+ywdMlsze6RK45XB7Vi0UGStGRKaM71SvdHut2+fciO4h52R/S/+5gKbCtcd8YGO
	RFMdN2hH8WLTl3Zhnu9olDCk5cIG2M7tzGX0AOqi0fyRmDAcglvO3lqukiIf4+Q934rEh5dzANRwh
	3sJy3vPiKxuNFttpQPYaqqX/uS26d2UP2HsHar8o1sbPgPnv2DLBQ5tgkC9KMphVskRM/njvS13Ij
	aLbgNgAx2HTDO44hmIjbSzn26wZXcDPE6AecTeAViiG6ZD+Qx1dS139upXrgMwQ98ZquGtS5h8bJG
	/zATCA2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPeJ-00000005Zdz-1Ytf;
	Wed, 26 Feb 2025 22:13:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPVv-00000005Y7l-1KdU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2233622fdffso4242175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607462; x=1741212262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTcDz5+Yk2Rd6PndDa6YwrNqhNuGseEibA7R+3Q+jN0=;
        b=kiLT3VMYkj0RTOaVJ0lAFcSD96HOKydx6GOrl+nIP0i9qFAoe6I8UNFFWMxM0AL7dK
         Lsw//R40CjA4h9KeNkL/1yDoMPaB+jGgFh2+jWlKArA9OqpoabRbWX7mHrLdd+SwWrGh
         ufM6vc6Z0Wuz8YsnmqFMtgMeQ4H5a8Gk1z/eDURMFwnNVRnZi6w9XJfofOlO3NlSO2um
         MlkJY3l+IfzNT95DbX9lLlhAM6kJ7M0xiMN72zO7mVV8q20dKmX5yyl8ALKhfbmFnkP/
         oRtIs5WxRm5JXb8oCj52Lfj0SShlZH35aEQcryCFyYL0N2pYIPuslKL6W+A569zOlkAu
         S1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607462; x=1741212262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTcDz5+Yk2Rd6PndDa6YwrNqhNuGseEibA7R+3Q+jN0=;
        b=uaBmVWbDp9abRSPJ2jpnYqHCA0LeKG8FYTldK5G12Dc6a2nmGY9zCBpgPR+/juvTJW
         v8W60jSAVRJ0AcYp6u9AVSLyRQs8ciEgPYqnHdIJ3XlmIRBYcfRQ/4Ps8DQF6s7emwl9
         HobxGn22nNJVjDGfWCw2SclRYTfSF3g9HLy7AjjOgRv4gfAY1M3cYyXUkbaEW9jm5Ba/
         IaUGV50Q767l0XOoQkx/qWFyFqYFd0QeWg4VitZo6675tfpQWqAbv3FvRRhhBb5ynmwT
         A0gMLQ5F+nkBNnCYKpBJJTZQsYP5JWIQuD7UvCgfgTmGe2scw1rOL58QjSm1EOBwjBQY
         Z69Q==
X-Forwarded-Encrypted: i=1; AJvYcCWahaoVDckASrDRb9tdBtfiyjKP73UuSp4RwOuX9+NUr5OqNhsB+1NhlZGXDkkawyehfU8Pq5na5B5EPeCZOATp@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgs9wVY3F8ThpAazTqeqdeKXXZW8Zb4o1es6+Jczu1+1sXW6Pz
	tzBiAWXV40+STtIhRbYZiysBiCnWOijRrtzOVO6atwoOQ3Q1sHvgqI6C12t4z4E=
X-Gm-Gg: ASbGnct1yVMr7QE8WmNkAV7MJQd797ynB3yjAoXMUBhOALM6/s7gEUzAP+B7ViwEj8F
	je+9IZmNjner1bfuXNmTfu/SR9EsIzjtonQsGC1cHj4k6p1vk1UqxEJn75l+sfLx1B7JqzbP/sJ
	ZZ6++dDkLaMgmqkncXnrDwRiqLDPz3C1kIILBdIi/Z3Zd7ff+zXzXnCQKuz5wAE5ruHjSivp4SH
	x7ZirCgeNXngDNDIPGJlJ4t4AYApq8dy/PY903cgSXbZPhgaL6ySEdxjJBz9hkTft5FPEr/JULJ
	fl42ADKzP4gA2VQcq3j0aAicyPGtyMft45OsDZIicU/SYHpw7czxnc6z
X-Google-Smtp-Source: AGHT+IGveFL5jaPvmaU/Mebx9uyRVH5JU7x/sn/aSccHmWkURMmnvFmqMMw5M5iqYS+8/nz1Dtqa6w==
X-Received: by 2002:a17:902:dac3:b0:221:133:fcfb with SMTP id d9443c01a7336-22307b4bbcemr129932265ad.20.1740607462686;
        Wed, 26 Feb 2025 14:04:22 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:22 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	krzk@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	ebiggers@kernel.org,
	bvanassche@acm.org,
	kernel-team@android.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 1/6] scsi: ufs: exynos: ensure pre_link() executes before exynos_ufs_phy_init()
Date: Wed, 26 Feb 2025 22:04:09 +0000
Message-ID: <20250226220414.343659-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140423_354339_915A3A63 
X-CRM114-Status: GOOD (  12.33  )
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

Ensure clocks are enabled before configuring unipro. Additionally move the
pre_link() hook before the exynos_ufs_phy_init() calls. This means the
register write sequence  more closely resembles the ordering of the
downstream driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 13dd5dfc03eb..cd750786187c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1049,9 +1049,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
+	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->drv_data->pre_link)
+		ufs->drv_data->pre_link(ufs);
+
 	/* m-phy */
 	exynos_ufs_phy_init(ufs);
 	if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)) {
@@ -1059,11 +1064,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 		exynos_ufs_config_phy_cap_attr(ufs);
 	}
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
-
-	if (ufs->drv_data->pre_link)
-		ufs->drv_data->pre_link(ufs);
-
 	return 0;
 }
 
-- 
2.48.1.658.g4767266eb4-goog


