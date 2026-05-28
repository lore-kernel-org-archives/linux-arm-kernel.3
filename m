Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F14BCD6E4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 20:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=; b=xQgz7ZBBTv0E2XrPNG0JcpKyBD
	7/+dTWFjmMvNB78I8f3Ts+6qjbqLMfDVFdbWafphhPH3XQiVWeKSlV+khNlZXHE3gSmdBG9LvI3XX
	KNxuQGlhWH2+jq2X4KFZ4REqeSF7L9ohjDAE3T2aT0WkStIa3cBxmOeAnnJZKLHORP1cebycwoEjF
	72V3CizgikazKqeCrLNUiMmBLk+UyoYA6OBqq04WUtikqKlsERheeMYU7mU44wiHzddoOGm7cMCCp
	6tpfWvwji4ps8kQItCyTwG5QbXQjjX/JmnjKSOrQX7+d2HOGpQtJs16J7RIfSBPG8nlM5nMZw+4Bn
	EmFjIFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShH7-00000006Kz1-1hdk;
	Thu, 28 May 2026 20:24:17 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShGv-00000006Ksy-1lCc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 20:24:06 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ba718173d1so90980415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 13:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779999844; x=1780604644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=;
        b=T6lCHW38jK3RaYmN9WGWYaL029ReoYxNjgp+QY3qBfOoXQCGhiEOi3IiAsuL7dmMdU
         +r3LupdNJIdHuBR2tt1iayeoCySAHnkSaC47auhJOOmhvldu8uuUGAY3Or11J8oMUVST
         4Kv3jrpydwOk7/F4+kyESZ4pEWvGOSzgdbd4/BFRhvn9hIZvhZbEvm0Wy/WMQuPMw0rI
         1vma2LViUpoBv2LdkeKEycI5tfkVnAwdQ/tSq+kZIj7+d+x+sZeg+bLnYIx3G3GyNgtN
         GdwUtZVoL1snQ2XQd7m04bQDQJnfp321SWul76GNkCTvdGSv9DlaJQRdc3XfRbkgDgm8
         J/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999844; x=1780604644;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8knH7UioVOHGAK4eKxBC8130k96uQrzRV3kgHSLvOkg=;
        b=KNuACAsVcUMULkMV0UKd12xyK++k8gz/3YYR3MQpY5Yqg1wXScwDZ8h7HCshdLhfTp
         T3d2ML+gjbtioJJUA+KKwhSN4gtxcb6FsFhGmGvsEevYq48ruBShVO1CYk7FEhjNka8d
         BTHl7oIiZ5RaE85zYewnEbkXj2sGXaemgBVTkPxk6CYEHj1zhDGarJglS4zdPoQrdI96
         mjQ0uzDREYSi/SRVcKP5IDo0DqQw5UNaumgN94arK715x5VhbOcWug8f/EVR0YY+6kCb
         1t5b/Tk6tzPeRgM+A7194jKx9+/jtMXV+aBg5BRgSdbnqMusIDqGgbErbc+HryBUA7QP
         a3hg==
X-Forwarded-Encrypted: i=1; AFNElJ/FJpZLy4OIMFb8EC1iCJnZi8Rc9vz3frBuYbiiy1SrNKTojvhQiH6Cm/4Asqu13QcrzTlDPDVz06rgFds3E9+1@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0y1tLdroFc8LA14Bsq+ZQSz6bDkTGD8eP7HmUgX1DWUjHhxWM
	1zr7SL60U2MoPpeTwn1C5eH6qiMkfRlEdkSMR9ksIvh/gNf8Xkn/R2XL2t2iGdUicKGEOBtvaG0
	sTQ==
X-Received: from plxm11.prod.google.com ([2002:a17:902:db0b:b0:2bf:1b22:9616])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1ae3:b0:2ba:6ca2:bca
 with SMTP id d9443c01a7336-2bf1eb9710amr3927415ad.26.1779999844039; Thu, 28
 May 2026 13:24:04 -0700 (PDT)
Date: Thu, 28 May 2026 20:23:50 +0000
In-Reply-To: <20260528202353.3422206-1-praan@google.com>
Mime-Version: 1.0
References: <20260528202353.3422206-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.823.g6e5bcc1fc9-goog
Message-ID: <20260528202353.3422206-5-praan@google.com>
Subject: [PATCH v5 4/7] iommu/arm-smmu-v3: Standardize ATS enablement failure reporting
From: Pranjal Shrivastava <praan@google.com>
To: iommu@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Nicolin Chen <nicolinc@nvidia.com>, David Matlack <dmatlack@google.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz <danielmentz@google.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Mostafa Saleh <smostafa@google.com>, 
	Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132405_463965_5B7143F8 
X-CRM114-Status: GOOD (  15.92  )
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

The SMMUv3 driver currently has a two-phase commit in its ATS enablement
flow. During arm_smmu_attach_prepare(), it predicts whether ATS will be
enabled using arm_smmu_ats_supported() and accordingly increments
nr_ats_masters and merges ATS invalidations into the domain's invs array.

However, the actual hardware enablement via pci_enable_ats() happens
later in arm_smmu_attach_commit(). If this call to pci_enable_ats fails,
the SMMU driver's ATS state tracking remains polluted, i.e., the driver
tracks ATS as enabled on a master that is not actually using it. This
leads to an incorrect nr_ats_masters and triggers a warning in the PCI
core during detach:

 1 [  127.925080] ------------[ cut here ]------------
 2 [  127.925084] WARNING: drivers/pci/ats.c:132 at pci_disable_ats+0x94/0xa8
 3 ...
 4 [  128.068169] Call trace:
 5 [  128.070603]  pci_disable_ats+0x94/0xa8 (P)
 6 [  128.074688]  arm_smmu_attach_prepare+0x104/0x310
 7 [  128.079292]  arm_smmu_attach_dev_ste+0x128/0x1e0

The issue was exposed under heavy load when running a VFIO-based DMA
map stress test (iova_stress).

Following the addition of the arm_smmu_master_prepare_ats() [1] helper during
device probe, failable ATS configuration (STU setup) is now handled early
during probe. This ensures that any master reaching the attach phase is
guaranteed to have a valid ATS configuration.

Update arm_smmu_enable_ats() to use the WARN() macro for any
subsequent enablement failures during the commit phase. Since probe
checks now preclude software configuration errors, any failure here is
considered a kernel bug.

[1] https://lore.kernel.org/all/cover.1779392420.git.nicolinc@nvidia.com/

Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index a10affb483a4..aaebd72bc48d 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2956,8 +2956,14 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
 	 * ATC invalidation of PASID 0 causes the entire ATC to be flushed.
 	 */
 	arm_smmu_atc_inv_master(master, IOMMU_NO_PASID);
-	if (pci_enable_ats(pdev, stu))
-		dev_err(master->dev, "Failed to enable ATS (STU %zu)\n", stu);
+
+	/*
+	 * Any failure at this point is a kernel bug. pci_ats_supported()
+	 * and pci_prepare_ats() have already verified the hardware capability
+	 * and programmed the STU. Thus, pci_enable_ats() should not fail here.
+	 */
+	WARN(pci_enable_ats(pdev, stu),
+	     "Failed to enable ATS (STU %zu)\n", stu);
 }
 
 static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
-- 
2.54.0.823.g6e5bcc1fc9-goog


