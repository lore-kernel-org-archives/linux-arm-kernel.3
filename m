Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8D1CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0NVzA0RssgZmBwPsMPQrXHwqZYSq1RpFtucbk/ffCh4=; b=3JtWpc7rTnlQRLDn6LE35yCE3Q
	Sh8DDZbzZVViZMb+T9A4meCYg/h+bLH5DIKwHdgYY9rAdkHCQT+whdxM+33ftm9cN1+MV3zMpieF+
	FI75gd4wkQNDPQwuDppSEsAvTvGXT6GKSWqC0/0g4vaS25ZAyiQwZ9cElDq5BBbPoMt2mhbNSIUUT
	YV1vvUgXK9xhc7KUuCmNN7w/bYra7ppGkqYb1Hf3AIIqKNMYU2jjFmJB/zvMU5YbOYDA0dLSV2xcm
	spN2jXjO1bSL7Fl8xiPgmSH608TslbwKvC/mzyiHxLENxEGbUXBUk7p7M6lr1XUZpacqNmkRJeRUj
	fFq28ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRpv-00000000e9g-2GNJ;
	Fri, 07 Nov 2025 19:09:27 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRps-00000000e9I-3JkB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 19:09:25 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b99f6516262so2181305a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 11:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762542563; x=1763147363; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0NVzA0RssgZmBwPsMPQrXHwqZYSq1RpFtucbk/ffCh4=;
        b=EnoOs9Xx66diEPgyDJETL/5Czfifs59BEliEUTT/ZTyTwSC1XchQdE+2SkMWslc3P7
         g5s9Tnl12P+hHSwq0ZP6OzepMVmVSYyRajQuuc8kKS1xPxQqiJlEtIOnPEqoZLoxJspl
         sQDo375nbEx2EM8zwN7HU/cMPZfY0jd0Jcyj7tYRXkiO4pU2gYScpNlW4QeFobZ4SLQh
         Mvdh0uyBEiht2CVJvm5VH1MZfjwJsfHWhiAVC7m7L0B0FPRO/6fuk2UOx5hGcNhFkFsj
         rb7nG855XfSWLnzt4ATBXnEtGwVhM5QJHUz6X2IGQxxldDizq34QVCWar5ebYNO45oUg
         dhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762542563; x=1763147363;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NVzA0RssgZmBwPsMPQrXHwqZYSq1RpFtucbk/ffCh4=;
        b=c5CuvARe86JxoGe33VTOEhMVZf7cRj3WgTKoybHBhbNvamlC1MQ8TWltwYVw7TaVJB
         MRczJH5iQokUZhzqEogzDoxGFWQAwTag3My1zr0yobwJyzYflXOiJyjd9iEr4lBmSxYl
         bRpxNp62XNrYxen9rEQQu45bnDWpNYjGQCiHBGFeOnE3YAuDCAqkpnAhkmK+7n9fnIDY
         /tlot5T92cNd7dRos9AfCFw0GIyzSY9fWCwStbCd2+TxZRO3IsTG9QNxSeoov02ygEr0
         iWuHF3twIklbkbLeBou6nCjkjAdOrr3GQYtFoGJ2wxBWYaLDcMA0sklR60t0F6FElf4m
         yXfQ==
X-Gm-Message-State: AOJu0YxkhQhBoVMuTiyiGK9ZgGl+2vTfh/yiuW9JNhtonNz3AzzUcI5y
	T3N26xLIPAz8W0kw7/jbTCniLfDPztNmqO8G9o2JlvkGP2biwmE7sAKleYZ+8yM0PPr/eYJ3g19
	s1TRwLw==
X-Google-Smtp-Source: AGHT+IERV/3DbTV3WeqT5ErpZeSNkgmJgFP4LV8NkvrM2+uwaUCdMTQHV1trZquhgmdySuzjgVBwK8cSeuo=
X-Received: from ploc8.prod.google.com ([2002:a17:902:8488:b0:290:b156:3774])
 (user=tzukui job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:94e:b0:297:d6c0:90b3
 with SMTP id d9443c01a7336-297e564e7b0mr2374475ad.23.1762542563521; Fri, 07
 Nov 2025 11:09:23 -0800 (PST)
Date: Fri,  7 Nov 2025 11:09:17 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251107190917.2858684-1-tzukui@google.com>
Subject: [PATCH] iommu/arm-smmu-v3: Fix error check in arm_smmu_alloc_cd_tables
From: Ryan Huang <tzukui@google.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Kevin Tian <kevin.tian@intel.com>, 
	Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ryan Huang <tzukui@google.com>, 
	Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_110924_857753_F5B5ACBE 
X-CRM114-Status: GOOD (  12.63  )
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

In arm_smmu_alloc_cd_tables(), the error check following the
dma_alloc_coherent() for cd_table->l2.l1tab incorrectly tests
cd_table->l2.l2ptrs.

This means an allocation failure for l1tab goes undetected, causing
the function to return 0 (success) erroneously.

Correct the check to test cd_table->l2.l1tab.

Fixes: e3b1be2e73db ("iommu/arm-smmu-v3: Reorganize struct arm_smmu_ctx_desc_cfg")
Signed-off-by: Daniel Mentz <danielmentz@google.com>
Signed-off-by: Ryan Huang <tzukui@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 2a8b46b948f0..9780f40ba3e6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -1464,7 +1464,7 @@ static int arm_smmu_alloc_cd_tables(struct arm_smmu_master *master)
 		cd_table->l2.l1tab = dma_alloc_coherent(smmu->dev, l1size,
 							&cd_table->cdtab_dma,
 							GFP_KERNEL);
-		if (!cd_table->l2.l2ptrs) {
+		if (!cd_table->l2.l1tab) {
 			ret = -ENOMEM;
 			goto err_free_l2ptrs;
 		}
-- 
2.51.2.1041.gc1ab5b90ca-goog


