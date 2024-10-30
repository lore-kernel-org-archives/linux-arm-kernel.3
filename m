Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A97D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzoMFJwewUJr88TLCzmafGB2re8jMyauaVwVQzw6WY0=; b=jtaLb75giufnfgdXOaCU1WOhye
	Awxj1k4gb6qGME3cnQMmqcN1jBPw+zOisYBg8zWmoMSX/LCds/A/NOfIC9GlZblz3vdRBjAoHsblj
	ydhCsmey9RgUcRUmRpl/XXh+k77+cB+w4vlux68Z4oq+RSXCtVg9YnF0WZ0N0tyFzbaY7Aq+lyRr8
	slZ9TuWuxWq1uGRpwY2KrkRQ8xccUlxY7vZmNrtMmLv18GbthGFCjARyiW5EA9ydomt9sZ5TfsWf9
	Cindo6FWNDoiBW9WG+k/Hhw2J3Mz1FiNjHcqmqyKFLfYv4iQaGMOgytq2vLPLUzw4ZuB53Kl42qM1
	3j4djnOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68tu-00000000VE9-2I19;
	Wed, 30 Oct 2024 13:38:18 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68is-00000000T5k-2ZnB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:26:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so63389385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730294813; x=1730899613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzoMFJwewUJr88TLCzmafGB2re8jMyauaVwVQzw6WY0=;
        b=fggoQ1E33nW7JS+QVSTt5fjFmsluDgW+UcpgPYlcEgQidOFBWUvHIZD3rXKbZdXDMt
         GCD/ADrnqjKFbtcArAlwqFsWtcKLgsSejnd48YFPvS8FPGbEAmXnrDn+rYRFsqdhAiVQ
         OVvd0IlB7f5yxcM/Yt9u3aGjw5BNHQBH84l+6pHUt2QNH6vkXmJfCW/in8A6NIhXM73w
         zQbwJiCpL5UmIxsp0Zg2GLgaBgsFuqsoP7QaEu0coGK/JNIsuGP4KuHnVD3uLCZkp8Hn
         4DoA6zqvGvIF/lSSrg0rqmNu3rC6cU2ydbchbD0B1cfiJhO2RSDSWel7Ge2FLexAzzO7
         S8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730294813; x=1730899613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzoMFJwewUJr88TLCzmafGB2re8jMyauaVwVQzw6WY0=;
        b=Z59He3lLGvp4P05nj6TFmNheqv7oFiQXORjYDg5+ygG/fixyjRIG8oxcLiFsYeHv/k
         xaI5ns+pkFYQp3MUt2WI5EmNCs0lqm0O4Il0p06zZHT/bqY2cdpVl/25UXSDHxdDDNFs
         YsRLeNThHOj8HCsbbtZadAw9QGuZNg268h36x3Lq9XC5Hm6ECz3uiYrbGI6DmdD8w5My
         uS08svvPm3lkgDSm+dAKlnfQ0Yr1+b7eE6J7n1p790GZIR7oaVd7p3uJi/N07b7a7xTP
         mPFciHERBvD25aqq9mH4l7uA3ZPA0UW33gaXd4gpUxoDPvmHNQTQ19vGcgptCsV9K+Rg
         +4yA==
X-Forwarded-Encrypted: i=1; AJvYcCVPoN3g0svrIZkhijAGNAPaMiD7OsF/+XtEBWdufVAe9ZnkDhL1yLC+P2Pc8YBqvgG6LENTVxYPFK9TcOJslcwN@lists.infradead.org
X-Gm-Message-State: AOJu0YyDV/hiwvmkY31lB3K7tvoW1ZPSzDWkx7BXsKTh84QLLv3AXWzj
	n7WYQAs8Ot2fTk8qpAjbGxIe1AGcjFe/gxpFK8ntRZTLqlRTcHragivdWcY/uw8=
X-Google-Smtp-Source: AGHT+IHvCVDH97OPRIU78dk2sv1dUkZXYpRkqnVZcPXDtJpr/JmOXd9IkvC3KGa6t702TR8hj0iMNQ==
X-Received: by 2002:a05:600c:4f06:b0:431:5021:32 with SMTP id 5b1f17b1804b1-4319ac74308mr110456545e9.6.1730294813080;
        Wed, 30 Oct 2024 06:26:53 -0700 (PDT)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm15356836f8f.30.2024.10.30.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 06:26:52 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: krzk@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 2/2] scsi: ufs: exynos: remove unused rx_hibern8_wait(_nsec) fields
Date: Wed, 30 Oct 2024 13:26:49 +0000
Message-ID: <20241030132649.3575865-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
References: <20241030132649.3575865-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_062654_709596_F3D2AF07 
X-CRM114-Status: GOOD (  11.87  )
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

rx_hibern8_wait_nsec was used to compute rx_hibern8_wait, but the later
is not used afterwards. Remove both.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 5 -----
 drivers/ufs/host/ufs-exynos.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 91c09309c1c1..fd86252ab2ba 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -559,8 +559,6 @@ static void exynos_ufs_specify_phy_time_attr(struct exynos_ufs *ufs)
 
 	t_cfg->rx_linereset =
 		exynos_ufs_calc_time_cntr(ufs, attr->rx_dif_p_nsec);
-	t_cfg->rx_hibern8_wait =
-		exynos_ufs_calc_time_cntr(ufs, attr->rx_hibern8_wait_nsec);
 	t_cfg->rx_base_n_val =
 		exynos_ufs_calc_time_cntr(ufs, attr->rx_base_unit_nsec);
 	t_cfg->rx_gran_n_val =
@@ -1975,7 +1973,6 @@ static struct exynos_ufs_uic_attr exynos7_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
@@ -2050,7 +2047,6 @@ static struct exynos_ufs_uic_attr gs101_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
@@ -2077,7 +2073,6 @@ static struct exynos_ufs_uic_attr fsd_uic_attr = {
 	.tx_min_activatetime		= 0xa,
 	.rx_filler_enable		= 0x2,
 	.rx_dif_p_nsec			= 1000000,	/* unit: ns */
-	.rx_hibern8_wait_nsec		= 4000000,	/* unit: ns */
 	.rx_base_unit_nsec		= 100000,	/* unit: ns */
 	.rx_gran_unit_nsec		= 4000,		/* unit: ns */
 	.rx_sleep_cnt			= 1280,		/* unit: ns */
diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
index e64fe20d50c1..b7fe725c7f8e 100644
--- a/drivers/ufs/host/ufs-exynos.h
+++ b/drivers/ufs/host/ufs-exynos.h
@@ -144,7 +144,6 @@ struct exynos_ufs_uic_attr {
 	/* RX Attributes */
 	unsigned int rx_filler_enable;
 	unsigned int rx_dif_p_nsec;
-	unsigned int rx_hibern8_wait_nsec;
 	unsigned int rx_base_unit_nsec;
 	unsigned int rx_gran_unit_nsec;
 	unsigned int rx_sleep_cnt;
@@ -199,7 +198,6 @@ struct ufs_phy_time_cfg {
 	u32 tx_gran_n_val;
 	u32 tx_sleep_cnt;
 	u32 rx_linereset;
-	u32 rx_hibern8_wait;
 	u32 rx_base_n_val;
 	u32 rx_gran_n_val;
 	u32 rx_sleep_cnt;
-- 
2.47.0.199.ga7371fff76-goog


