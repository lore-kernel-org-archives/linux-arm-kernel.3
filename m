Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F206AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kyFN50mzARxoEv961GrQx/43IA9dhxw9QoBd7XIEQPY=; b=pIDGQMlsYd+WA0hCL4VUzGYxsS
	J8wjsthWVKBrCJ5KWmj+COVedC3jIbO3DXuH9ACGqsY1lD3VnUvQFyUIJmYndM+dEzN7spy3Ygwq5
	WhzODGWlvn/bvTYTEOm4WAMgVy0+xo7PY9+q1GdPKe+5cLsNYCaxQJ3DCVtIuXgpRNujlgLBsaoyG
	DcoK3Q8aCGXM4FY9Ukn5Z3dMpUxO9eL4Gp9oh4emB8k0uBueCRKbCMUoG4UhYMibCU/tpT/D+NqRp
	h3NB4SS+ZFDOkH5PvhfFFx2tUFbkEYZHz29utyxusuq1D08OxN/KWpRdbU5EbyyX0/QIbpeb9AmAr
	77OKrhiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPco-00000005ZHy-2eAZ;
	Wed, 26 Feb 2025 22:11:30 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPVu-00000005Y7U-1Rna
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 22:04:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-223480ea43aso5835325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 14:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740607461; x=1741212261; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kyFN50mzARxoEv961GrQx/43IA9dhxw9QoBd7XIEQPY=;
        b=FhBuicG8mRx1q7H7sk3ozOKETzzHcltNxTWPJ2V7aKS1XcU7p2kMByCAOo5rVBX4uh
         NR5SbxhOmfh2KQGdZj3izAyudWRlbVeWkHxPboEXeetNr19ZLJJVNxlYIYVqC7H6OXwo
         vxSj//3csXnkvJ0I8HP8yXqV8YAJ0jnRsBOIl7eoDIs9iLWNEs7KtA7Vyyrm3RwMA0FO
         HZcrxKnGrd9iyk9jlpsuTPqGZJSvQD9GNl+Zrps6oDp4eM+xN0XBXQrvXyAFYg7O3Z9P
         9mtLzyMW1E/lXBHvZi/ErjU9bp8mFMwewaGcX9A+f9Yc+ZUltWbvYOXJYbfZ3jdkgtNM
         xvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740607461; x=1741212261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyFN50mzARxoEv961GrQx/43IA9dhxw9QoBd7XIEQPY=;
        b=mDmtQz1KKNIRubFWNg/kuyjL2ATOvdOuP0oFQigzR1M/to3y6WSG+hT0WVaaoqSkp6
         LSb/Z7O7zp+Ece5UPfU7glNvEyMKno4A/ilz2q4I1nt9uGi8WW8HaKFNkxkHDCUD8rwb
         uplk4F9zCY2wEmibNQE5pTzHiXV5cbs89rq3m+RaAww96Vg+YrJzqsfrHIT/kDsCIMKk
         9dCvaBFqWIZkp3tKNW/4ae9nJGEO9NeOkJkTLYPffH5hNKfhEiQLxUGn6kvVTiTiJOEe
         laF8dBv98V92lF4MrIjX5nr/JKYUl2IMoVUC63EeQ/+4s3VgG0Jr5aY3JGLrodYG4f+A
         +Lug==
X-Forwarded-Encrypted: i=1; AJvYcCV0FK2Q6FvK60HKtUrR1m2w+HePxtRyDICkOiGmKPUV45YYbiGkzvwuiXQL7QgkznTp4yiFQUpF0YSvGZHnHd6O@lists.infradead.org
X-Gm-Message-State: AOJu0YxboTnvxZJ5s2/+97YQerCNDGBejn1HrkQH9DYCyUJ4nOA9AvpV
	9bGoYpoTwux4K9FVJLBcKQIUSoPYfraTaQXvR/fPz9NP4MjAxStvPqSt6YqHfJk=
X-Gm-Gg: ASbGncuRfn9KYUZ44VbHkU32t3W3PnpxyRDT0lXrb5q4rzVpSSOtKlu+TpQ1yDNpdh4
	Es3c5HmFyn2vT1u1aZLs6SqO1S6aOfEPvv7X489H05Ee9/7DOB1n+pOCwqGl7p8gGrsl763eHgS
	fWIYu8LCyDAbLWa3jLQoUBKvrLIHra9yAUZz1uu9wZF0dZye+BEypNSuVIb/UZVX9bCmZ1cQqvf
	J+HBwPgmImEf+7ONxOfYn2y+dUQKSo9mit6EoGzCwiO8f7sD/VFe1udJMpmxHWIAXJM6+pDKJsE
	m+c5O0kMiiHzDWrGpJkW8PFgKFw/Lss4AFwxBTlr7UDm4s0KKqVoBWtQ
X-Google-Smtp-Source: AGHT+IEJEmPRHAir0pC4JxiSC41YFyAd31zLaa4ACXPDw8wOhc4r3SARGvmSjNnM+NRArbU/MX0XsQ==
X-Received: by 2002:a17:902:f552:b0:215:94eb:adb6 with SMTP id d9443c01a7336-221a1149088mr411033855ad.40.1740607461056;
        Wed, 26 Feb 2025 14:04:21 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([104.134.203.15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350534004sm1044145ad.252.2025.02.26.14.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 14:04:20 -0800 (PST)
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
Subject: [PATCH 0/6] ufs-exynos fixes for gs101
Date: Wed, 26 Feb 2025 22:04:08 +0000
Message-ID: <20250226220414.343659-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_140422_399497_D190B19A 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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

Whilst investigating some stability issues with the upstream ufs-exynos
driver on gs101/Pixel 6 the following fixes have been authored.

Whilst some of the stability issues remain these patches do improve
certain aspects and make things more deterministic especially module
load/unload.

regards,

Peter

Peter Griffin (6):
  scsi: ufs: exynos: ensure pre_link() executes before
    exynos_ufs_phy_init()
  scsi: ufs: exynos: move ufs shareability value to drvdata
  scsi: ufs: exynos: ensure consistent phy reference counts
  scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
  scsi: ufs: exynos: Move phy calls to .exit() callback
  scsi: ufs: exynos: put ufs device in reset on .exit() and .suspend()

 drivers/ufs/host/ufs-exynos.c | 62 +++++++++++++++++++++++++----------
 drivers/ufs/host/ufs-exynos.h |  2 ++
 2 files changed, 46 insertions(+), 18 deletions(-)

-- 
2.48.1.658.g4767266eb4-goog


