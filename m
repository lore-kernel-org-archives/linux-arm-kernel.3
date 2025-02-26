Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F29C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqQVvrSG700cJ8ivAGfcs4D2QICVIKls7c2wPxYXgmg=; b=vYhx8C2oOjHVRYOOO5B/5h6cn4
	w/kHU6JorkbrHXAn4/QcbQi4liB2Yy6aAgtFwwRHjGR1ibqSnbZBM8r+vAflsyPgwPwPo9XCRzDIE
	jXT3gVjupin6py4MBCPwTGBj5Tqbgb92+3koJbofy9mFKscfoFHh0CIDuWD8Mu8mANzybJrO+JBw9
	lQ87nWPw61wjv8O9xwyPMVshyoUqZueaowxJEEhUes8Ys4/7Xz/HAPXGPPe6wOCN86uoyuLFObFom
	x4bc2IoGS/bxxkhrkvrlC0GgZhRY18P1wZLmv0IgS5jZuTm8EnI9kk+YQy+XWlG5J4/QI5Lvtdcft
	y0coGHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPhJ-00000005aBH-30Ty;
	Wed, 26 Feb 2025 22:16:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPVy-00000005Y8r-2mFP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e6028214so5195375ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607466; x=1741212266; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqQVvrSG700cJ8ivAGfcs4D2QICVIKls7c2wPxYXgmg=;
        b=ekr7bUB5HNfX6xK0y+LIWBsZhnl9rT46gISPO8nPrsIte1+GcbOpsszFy7Cl2ubFvB
         eJzmLVyJYAY0grtvUO0KyfikJEAFDF5JJ7QPk5zSSlM14UQP+elaimVYnpWV9mZVSfyJ
         IhZytJyd9YUJpDJO85CEmGYfL2SF7Voq5pugkyc/c+a1bd9ZRkyVoUhrBKE5cIY7aA5l
         6LhNjIZSc2rndUqdlCGwyTwHzsvyuhnFyw69aPoLWBJUzDGdLd5AdBscnVQRi3rvA3RA
         67CFp8lFAYHXqr8gXkMpspDIU0OWzrBB1T3vjbHpLr3zG3WFtrjnOnEsqXKAPL3+cp5l
         T6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607466; x=1741212266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqQVvrSG700cJ8ivAGfcs4D2QICVIKls7c2wPxYXgmg=;
        b=exaWSyypbyUNsSWJSt6VnQKQ6vtlyzvSVWmRVRZrb4aXgWFo7UMMDj8jP5E1TItw1y
         o4H7Za9j6eeEcyQHLQj4TWh2bjHGdN50CseYTTFWlM10f5aYq55LhO3ZOlytSfEqCu+d
         pCE1R8Z64S1DnxrlCfyEaEGsm7FWQzTWkmfbXfJ1W1CGCUWAVN5Zw+rtvFlRhHquRvZo
         WiGZbsqTlttMgt7R1qgfouIOE6Y9pqBE0FPU6TmLLa5IxVLh7loq/hyEoWq3LHCUQnCw
         jwPDTfX6fuRZANZWkXq80AxOQZjemvpa8haq5W0JVgLXsExBaf97OVcPdndZpl40Tpv7
         NdMg==
X-Forwarded-Encrypted: i=1; AJvYcCU+MDqRCYhY/aCNZcPM/5YOEd8rrBemwvo+4dM5CJ12KssLJ0YLri/erUJr+bnR+l+uEN3He7UlRWNaWDBLbO7i@lists.infradead.org
X-Gm-Message-State: AOJu0YzHDnstVMHByFmaBDL2btWSJ8irr7cRBhYR/1zkmOjJwFF3++7k
	FJYi/eE2M5VLSjt64sRoYSR/0lQGoYqqunkSaKsTDva5gQwc9FSiHGo9/h/rUrQ=
X-Gm-Gg: ASbGncsX5jeLCxqhQoKnqJEMJPHFhcqe3cqHLOjEz5OU3WbP3ddo9kz+RR9Q0bPzuT4
	sDHUOT++RoaESctZtB95GWyfN/ROMFGCvlw0lIY+67IKkMhpcnguqp/HX9dmO1kpNxY4p4xzahq
	+bHjkK+TzOu6/dThvTWb5rW42zJCfeNs0f7n/Hb67TLO5j803eYoVF78yaT0A0VR7ddf8X3n4DJ
	ZzChd7D1+3W+saISosXRma7xUjlk9qldVvVScSlNR2lAR2GCYdmLRx9IAeIVQ29wujjD8ZtUi47
	Qm4fTSHQ+ie/SAXm14p70+QepOu5e7d7wHXGhfcJw0jN8pEsIOOgesyB
X-Google-Smtp-Source: AGHT+IH0ey8eRCvxcHgsNYYNwiwm9i82ds1xLg6pyL6Gx4FmTSqN0nYi+iPEnmvAXppRtAVsCj9cLA==
X-Received: by 2002:a17:902:f68c:b0:223:501c:7576 with SMTP id d9443c01a7336-223501c75e9mr6151485ad.12.1740607466019;
        Wed, 26 Feb 2025 14:04:26 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:25 -0800 (PST)
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
Subject: [PATCH 3/6] scsi: ufs: exynos: ensure consistent phy reference counts
Date: Wed, 26 Feb 2025 22:04:11 +0000
Message-ID: <20250226220414.343659-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
In-Reply-To: <20250226220414.343659-1-peter.griffin@linaro.org>
References: <20250226220414.343659-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140426_698850_2CBF474A 
X-CRM114-Status: GOOD (  11.26  )
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

ufshcd_link_startup() can call ufshcd_vops_link_startup_notify()
multiple times when retrying. This causes the phy reference count
to keep increasing and the phy to not properly re-initialize.

If the phy has already been previously powered on, first issue a
phy_power_off() and phy_exit(), before re-initializing and powering
on again.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index a00256ede659..943cea569f66 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -962,6 +962,12 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
 	}
 
 	phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
+
+	if (generic_phy->power_count) {
+		phy_power_off(generic_phy);
+		phy_exit(generic_phy);
+	}
+
 	ret = phy_init(generic_phy);
 	if (ret) {
 		dev_err(hba->dev, "%s: phy init failed, ret = %d\n",
-- 
2.48.1.658.g4767266eb4-goog


