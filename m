Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C7AC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nWk1tmUv6R6ofIovz55Q8Qebo6k6REo/VNEY88i+dbU=; b=ZNAyWJoUourorROmRsJeP35zOP
	pRdTwzFNeg5yFY3JoCnoj9sa/UBaKpiY9RaSE/k455QcMRyHxTrU2yFePdKdkugBYofrGP8gJWgwU
	LzAadFehRf8s+KZd74oOZ+CQinmpL/1N+3pmpvf2skbS39NI0j8DnSQSb/YHBHVJZLbh1aCIRODkY
	sYatRUcw+Pz7oKm3V2X0ZmRq6rx+6koRUee5kJk1HYYMyt83bdBya2bTpHLAzbcuP2Al6qm6mgdXH
	VXAya/9yC0vt7lryqPdl1ayNGf9B5x/U+9u7Hk/18AszmgTZX6j6r7RQ257DI7CTlGTjGaHYsDRON
	e63nhGEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thS7V-0000000HGJM-12qz;
	Mon, 10 Feb 2025 11:38:33 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thRq6-0000000HC1z-2eH3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 11:20:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43944181e68so8225195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 03:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739186433; x=1739791233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nWk1tmUv6R6ofIovz55Q8Qebo6k6REo/VNEY88i+dbU=;
        b=TG+kK7CDYAP7GKHJrHuLidqc2NS1XTMQ/TQh0rpToptOMffGWNPQH+9pOq6ioJLBlI
         zEw59BdLk7OJpGBkxEO4hnIW+tfnGWxplKLTQ8y0mFWqPBXSIz0uAVWbtXTCUKQbY7PK
         BxX5vjsqhk6qqs2IHWFTC4q8eS8tWeHvYaGMW1AXB2EHZ2W0diOxT9/Xfq6F9xm93zFZ
         t5fpBQ532FKF2I9YuZImXNlL/XIRfzVmxpVciniwky6XChtpcR8LZ076irnbBDCo6Z5v
         m5R4ss46zfNk5jUwnJT2oefuBva2KlwqP73yJfTiZ4zDBgNnsZ+SJzXVTQfSvlXOejCh
         R5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186433; x=1739791233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWk1tmUv6R6ofIovz55Q8Qebo6k6REo/VNEY88i+dbU=;
        b=Hjp0yhB0kq9Dbr0quPxP4vUNm5RgXUgyvmUv5JCPxaMK3l4ME86+Dz0E1zieyCc7+i
         CzO+7mfTzRtKhoA9lwssjPm0dcrPiXwF7oJUECW8bBkuryVm4KuHRD5VKjbgWYpEudgo
         iulFQjt6L77rt2xv+ASSGKhqoKcFGzdDBEo8quvSZR8Z6hKjucg1ERtl7Nz9aIKGTaKE
         nQxibTBWBCl9R2TM7A31zdTpaigMLqcNIuYhDzi5Abgeu9Mi2bedaDEPzkQt3OALt7nz
         MsLPfkeiplrrDRkYycp3EPvgs1WL9DUZGH0hr7aWQFD1H8j27oHswZUSXZt3XwhLJyKI
         Rz0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5eNB9JOKKPIzF/wAufLo5GKP4ZVDLBPvJyQkm65dpQt4M7PXsCKj6Nh2Y7FbXEVIhkFr3kGG0lD+wfI1Ge/W4@lists.infradead.org
X-Gm-Message-State: AOJu0YyvPev6+s9FI+Znko8veXi71XjUQ8txHmtq4Xic4THWJzqqPTOn
	4Pp0Ndi/7ejUvMLjat3lfuEjrws3QEzN2JIZLCJIH1zr1H/OhkV3
X-Gm-Gg: ASbGncujNpP/FhXnnFoCy+Y/3EgZp+cMSFAZ7ZdOX65zPqb/MRofQB7pRrka6YNlQq9
	OuD/4Ir6GjyCUhG4XAwgC3Un2z8oJC0M4tLhvhC1EeZhxtLxBxLp/g+Iem5WS4sDcWCmrNATe4N
	TkpU6JcxN3nq4an1/mZ5QqQ74/04s0Isp291yx983OJOehp7F2b0vcq5G0lPF/G2LK71YqS0qMd
	36pSTbFSMtj1b7ynOTPCz9svnYJr0LK/iiRLZEsF0pa+A9hLKm/oYrRpQsQo/sISdp2DS8Lh+xt
	yBHTkdIEiDms
X-Google-Smtp-Source: AGHT+IGbRwLLu9tR/y2eBa/u7toSv7se05o3znHII8V/vw85Z3xbe+EWFjbGzJGpwzoJnEMDsZOF7A==
X-Received: by 2002:a05:600c:3503:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-439249cddf9mr124532365e9.31.1739186432404;
        Mon, 10 Feb 2025 03:20:32 -0800 (PST)
Received: from void.void ([141.226.169.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbdd1af07sm12174656f8f.15.2025.02.10.03.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:20:32 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] iommu/exynos: Fix typos
Date: Mon, 10 Feb 2025 13:20:04 +0200
Message-ID: <20250210112027.29791-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_032034_671700_385AA15A 
X-CRM114-Status: GOOD (  14.33  )
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

There are some typos in comments/messages:
 - modyfying -> modifying
 - Unabled -> Unable

Fix them via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/iommu/exynos-iommu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index c666ecab955d..69e23e017d9e 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -249,7 +249,7 @@ struct exynos_iommu_domain {
 	struct list_head clients; /* list of sysmmu_drvdata.domain_node */
 	sysmmu_pte_t *pgtable;	/* lv1 page table, 16KB */
 	short *lv2entcnt;	/* free lv2 entry counter for each section */
-	spinlock_t lock;	/* lock for modyfying list of clients */
+	spinlock_t lock;	/* lock for modifying list of clients */
 	spinlock_t pgtablelock;	/* lock for modifying page table @ pgtable */
 	struct iommu_domain domain; /* generic domain data structure */
 };
@@ -292,7 +292,7 @@ struct sysmmu_drvdata {
 	struct clk *aclk;		/* SYSMMU's aclk clock */
 	struct clk *pclk;		/* SYSMMU's pclk clock */
 	struct clk *clk_master;		/* master's device clock */
-	spinlock_t lock;		/* lock for modyfying state */
+	spinlock_t lock;		/* lock for modifying state */
 	bool active;			/* current status */
 	struct exynos_iommu_domain *domain; /* domain we belong to */
 	struct list_head domain_node;	/* node for domain clients list */
@@ -746,7 +746,7 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq, exynos_sysmmu_irq, 0,
 				dev_name(dev), data);
 	if (ret) {
-		dev_err(dev, "Unabled to register handler of irq %d\n", irq);
+		dev_err(dev, "Unable to register handler of irq %d\n", irq);
 		return ret;
 	}
 
-- 
2.48.1.268.g9520f7d998


