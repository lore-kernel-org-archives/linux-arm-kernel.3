Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B5CD767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDFhDh5Dsbm8CIbr2G+SLWNj/UFzwMVxtyg6fSq7G5I=; b=iC9YCy0vXkQyJU1csKvgpc0X52
	IgyZmiB9KYkMwsNrNyxxzXr4jCYvvnTUY0Sw/Sp7hc6uASLkXsnSUcmjhA/r72hcjGWETiHdgawvZ
	2FWmH9644X1/LbVzvMaRQVTcaN9VsQ9GSeGMgQBBmhLnw8j6H5MJQXBnU/cyALb1PEjrNCxWdLjd9
	HMqgBy0EhSidunRYXUttdxaTNuSOAspHMRn+HLPxftNoFPLAoQ/V1MN2GdzihGY9TT/MMoO8bdaS6
	YbWgIkqYBQrZTdCBGXYzooxD89fevk3OQErcBgdyElvRYGd/DGvJ+3Br/NY47hUNkwUI5TgKBNsVi
	aiShEMdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wgt-00000003u52-19Hn;
	Thu, 31 Oct 2024 15:02:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WfA-00000003tav-18t7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 15:00:42 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4316cce103dso10967535e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 08:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386838; x=1730991638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDFhDh5Dsbm8CIbr2G+SLWNj/UFzwMVxtyg6fSq7G5I=;
        b=r9JJJ6HQ7wMbETuuON352p9mb6aatVwu+emmzEgfG8CpCM0T4PLlpFhzeBK3Jt3JvK
         Rus8N/P1ttRelwwNx6c8uPRKLa5VDGNm3c7kJX4b6wrGOj4nanSLFKgSk6hJCV8cZjrz
         R9cgizk6lw9+o6KakPjO6W+CWe2Y/F5fIksr+PCixUyhSyKBafUVK+uwI3ATZkKgy8X5
         r6zPJXsyAqB6SKqERHjTMOKQklqTFKDcmmvCi6aRtIEuJNj0ChzBTYQ1NUX45omS48pK
         aHhE3wCKMc/pJmwgVkWu+nfSAFFM9/LO+Q2sAKLucuyFEEBIMG9hmo2y/mb5dc3vzmK8
         A9mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386838; x=1730991638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDFhDh5Dsbm8CIbr2G+SLWNj/UFzwMVxtyg6fSq7G5I=;
        b=Pa4eR9YntKwAZkC3UE7WTv0ncXMek95baAqB/aDw3zoIMhMJaRJPoNtw2GHb6MDMP0
         WBdQ8qVvN/5iDWwzQA/SEXEEDQs+At5Xr5YKOouBAZrBRqFGwhWr/VOg6kYwkUlx4rTp
         9r6D7l8SbU29HGWFUDhbyxKwt44gsN6FD/y+fxqNsKt/oOTqfX88A7uqV3yvg4Tjqxf7
         XvPVvgks6WevCLkg9/CKQ3kJThjAW+ZIowi84NjCCVpxETextStlYDG7LyG7REfoPG/y
         ec6XOFQb4njy7gzTYT0Lsy7kSoe7EIEAsQC1gD2Dl/K2PzSg2cAsSivVmW3kaEd7GqSG
         w54Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhEpp4KiKwjyuw/1WZxHWqgUzl3tCI98vRbBRDiB3upXbHEaQ8yLXQiJRLoXPQ2iLBSs+cb2zCH6rr5dZ3JGcV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywg3q8hecJ13s0YrqJWInpI4ZRmA/p+iqJJcya37BXZjPmwr92X
	H3d29BEAnegjduMDAXpd0rXXCgCxobXb7I0Y+BRcfwJA1Kp+o5pn21Cp6rFq+9I=
X-Google-Smtp-Source: AGHT+IGql7rcBkBJZy/lkpZXVd8eJAHNb/N13bQ4wyVM/GFRhvhCqwbQi4nJvY1Ydgt8QtXoBjQJgQ==
X-Received: by 2002:a7b:c459:0:b0:431:5f8c:ccb9 with SMTP id 5b1f17b1804b1-43283255a2cmr1881175e9.17.1730386837895;
        Thu, 31 Oct 2024 08:00:37 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:37 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/14] scsi: ufs: exynos: remove empty drv_init method
Date: Thu, 31 Oct 2024 15:00:20 +0000
Message-ID: <20241031150033.3440894-2-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080040_335203_E5391CCE 
X-CRM114-Status: GOOD (  10.15  )
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

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Remove empty method. When the method is not set, the call is not made,
saving a few cycles.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9ec318ef52bf..db89ebe48bcd 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -198,11 +198,6 @@ static inline void exynos_ufs_ungate_clks(struct exynos_ufs *ufs)
 	exynos_ufs_ctrl_clkstop(ufs, false);
 }
 
-static int exynos7_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
-{
-	return 0;
-}
-
 static int exynosauto_ufs_drv_init(struct device *dev, struct exynos_ufs *ufs)
 {
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
@@ -2036,7 +2031,6 @@ static const struct exynos_ufs_drv_data exynos_ufs_drvs = {
 				  EXYNOS_UFS_OPT_BROKEN_RX_SEL_IDX |
 				  EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB |
 				  EXYNOS_UFS_OPT_USE_SW_HIBERN8_TIMER,
-	.drv_init		= exynos7_ufs_drv_init,
 	.pre_link		= exynos7_ufs_pre_link,
 	.post_link		= exynos7_ufs_post_link,
 	.pre_pwr_change		= exynos7_ufs_pre_pwr_change,
-- 
2.47.0.163.g1226f6d8fa-goog


