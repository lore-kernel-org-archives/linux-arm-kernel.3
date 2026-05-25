Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DFDCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PIC2nM3CJ35DU4tF0EpN+9rHstJqWdUiMemSJfIgpOg=; b=Lt+9ICdJQYY2YszBO6wuY7iP2f
	STDqVN/YvyILGw5rSjGY6vlMXuNLfgyh5x1NhLet3rkoee5VRnKaHHbxTHZg4Njx5iCWGG1PudZNb
	T2fq8sBDq8TQnCWnPF5WtfLQhwXGKJiOU1leQ8hnAdU2rzblpZTgUKoZeQpN5m3BOYPpI9Tvxts8H
	WQnZTAY2BwubS7KptwGUWXTRm+O0qxbCn+gODCNVI9Un4nYMH9w1lY+h56yekX6YnVo/GgZBNZcGf
	mo+gCOmZnA6nWCsSQKLBbvb6Fpq+5ny0H9Hr28Fz9z6U6fPrME+fz0ImCF0F+EMDpjl47NDi6sbYg
	7WfooQuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHZ-00000000G1l-2XFi;
	Mon, 25 May 2026 18:44:09 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRaHP-00000000FwP-1BFK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 18:44:00 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-c70ea91bfe1so5448613a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 11:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779734638; x=1780339438; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PIC2nM3CJ35DU4tF0EpN+9rHstJqWdUiMemSJfIgpOg=;
        b=Fx+5lqlJNwzN18rvuIyjRkk2Yg/B+blx+GVOzDVlwTEAnONt1NnuCILMtfgxPySZlA
         pq44vh/2IO67mOMDMwtNxSUba9BQvZfXqly+Qmr5zXchGNqzXRcxX09c6fAo/62lyyar
         Pv0J6BEKCXh3uBkpqNe+AYADfUoBHtNdnkUaH25wmyOe+eTyoy2fchh6TIU0L9ia1m6G
         pMd6nuP1ODwgZZ/qiPpm/mwrA/AA1Gsbd5k/XC00Z9KG3sYJOy85tKh6gLCxHCYDH9jP
         abEoan1Wi+TJeCeATlh8BzlAQcn7C40ikUnpWwCxXQug2xci4qZTNMywLZvF1Ccy5gFS
         qoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779734638; x=1780339438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIC2nM3CJ35DU4tF0EpN+9rHstJqWdUiMemSJfIgpOg=;
        b=kUZQffCzlcLLZEDSpOTtgs8wKrbagKoOIn4SN6MrhqWc08tjMEjhDxN95lvgEMbvTC
         APi3NFrTknaFxKUsURlkKJPZOXR5WVR6I6c8XJqJxna9SilHkN3yX06PLP6ADCD41/5Q
         yewMz8uV2Rd7TFutVeSw4V+tUIQ39o3TPFvePhwT3wkVghZCQJcJqgnvtdRpHpgN7L3n
         2dCwS98EBQrS+Kuc2Q9xOuuQPALrzx4cDihFvGANlNYgy4mvpE193ZltLnp/O3Qxsez4
         EwZaPOeOB06Kv2aafAAzFyg1NAFEwc5/Ot8y/YexRhXDmA08aX3g+UukXi6say3j9d7l
         9B7w==
X-Forwarded-Encrypted: i=1; AFNElJ+yw1HlbklI0n5LHAvYDPyd+aKV31VhkysxMR3d05+zfLHH/tamaovA8XOzUUuGW+8r71v3x4t9Zsd66amShM/c@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3SksUUcgAVvxdfVQIbuh9Aph8jMdvvZr9PVKk5bXF7xWM2J36
	wF0glVTyp8uEBovI0jqyaVJKjVlyoyyrfWCZUFs3U3hCTQAxvrJkpXFzRpdqRNtAwgTaNPQQLoU
	AJg==
X-Received: from pgbbq20.prod.google.com ([2002:a05:6a02:454:b0:c82:7805:9e52])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4389:b0:3a8:2af3:ce8b
 with SMTP id adf61e73a8af0-3b328c93ef7mr16114960637.14.1779734637814; Mon, 25
 May 2026 11:43:57 -0700 (PDT)
Date: Mon, 25 May 2026 18:43:45 +0000
In-Reply-To: <20260525184347.4059549-1-praan@google.com>
Mime-Version: 1.0
References: <20260525184347.4059549-1-praan@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260525184347.4059549-4-praan@google.com>
Subject: [PATCH v4 3/5] iommu/arm-smmu-v3: Fix ATS state tracking
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
X-CRM114-CacheID: sfid-20260525_114359_326415_F497A8A2 
X-CRM114-Status: GOOD (  20.32  )
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
tracks ATS enabled on a master that is not actually using ATS. This leads
to an incorrect nr_ats_masters and triggers a warning in the PCI core
during detach:

[  127.925080] ------------[ cut here ]------------
[  127.925084] WARNING: drivers/pci/ats.c:132 at pci_disable_ats+0x94/0xa8, CPU#42: iova_stress/12240
[  127.949761] Modules linked in: vfat fat dummy bridge stp llc cdc_ncm cdc_eem cdc_ether usbnet mii xhci_pci xhci_hcd ehci_pci ehci_hcd
[  127.961760] CPU: 42 UID: 0 PID: 12240 Comm: iova_stress Not tainted 7.1.0-smp-DEV #4 PREEMPTLAZY
[  127.970619] Hardware name: <REDACTED>
[  127.977655] pstate: 61400009 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[  127.984603] pc : pci_disable_ats+0x94/0xa8
[  127.988687] lr : arm_smmu_attach_prepare+0x104/0x310
...
[  128.068169] Call trace:
[  128.070603]  pci_disable_ats+0x94/0xa8 (P)
[  128.074688]  arm_smmu_attach_prepare+0x104/0x310
[  128.079292]  arm_smmu_attach_dev_ste+0x128/0x1e0
[  128.083899]  arm_smmu_attach_dev_blocked+0x50/0x88
[  128.088677]  __iommu_attach_device+0x30/0x138
[  128.093026]  __iommu_group_set_domain_internal+0xdc/0x228
[  128.098412]  __iommu_take_dma_ownership+0x118/0x150
[  128.103278]  iommu_group_claim_dma_owner+0x48/0x80
[  128.108056]  vfio_container_attach_group+0xc8/0x1b0
[  128.112927]  vfio_group_fops_unl_ioctl+0x578/0x968
[  128.117706]  __arm64_sys_ioctl+0x90/0xe8

The issue was exposed under heavy load when running a VFIO-based DMA
map stress test (iova_stress).

Fix this by ensuring that all failable ATS configuration happens
early during device discovery. Update arm_smmu_probe_device() to call
pci_prepare_ats() only if ATS is supported and fail the probe if
pci_prepare_ats() returns an error, ensuring that any master that reaches
the attach phase is guaranteed to have a valid ATS configuration.

Additionally, update arm_smmu_enable_ats() to use the WARN() macro.
Since earlier checks now preclude configuration-related failures,
any failure during hardware enablement is a noisy kernel bug or fatal
hardware error that should be reported with a backtrace while
allowing the driver to continue in a balanced software state.

Fixes: 7497f4211f4f ("iommu/arm-smmu-v3: Make changing domains be hitless for ATS")
Signed-off-by: Pranjal Shrivastava <praan@google.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..1d96064d314b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3065,8 +3065,14 @@ static void arm_smmu_enable_ats(struct arm_smmu_master *master)
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
@@ -4264,9 +4270,16 @@ static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 		master->stall_enabled = true;
 
 	if (dev_is_pci(dev)) {
-		unsigned int stu = __ffs(smmu->pgsize_bitmap);
+		struct pci_dev *pdev = to_pci_dev(dev);
 
-		pci_prepare_ats(to_pci_dev(dev), stu);
+		if (pci_ats_supported(pdev)) {
+			unsigned int stu = __ffs(smmu->pgsize_bitmap);
+			int ret;
+
+			ret = pci_prepare_ats(pdev, stu);
+			if (ret)
+				return ERR_PTR(ret);
+		}
 	}
 
 	return &smmu->iommu;
-- 
2.54.0.746.g67dd491aae-goog


