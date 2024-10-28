Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C9BD13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 03:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfepWoHjCZNG7Hnofx9+U1FeKOBzJSKxe0L62gLgiEw=; b=H4nz6eysJS6v5xsfS2prDqQ/Tl
	715NcMJXd80EIjH0wZ8Tu5kTqgExBiZi/dQKyiLH17e8wZvFgCtaKOZ5NT74dLQArgSJot4mJjTtc
	G8HowHMZMvooOivHyl82IRnzKWa5Fot4DsnJNynE7N31uYDcC9Sf0qiwFt7XOWNKnDIR2oWIYK0kJ
	Mptm+XBip7ow+G+21jTPDHgzsQiJTMBQTvN1c6dZPOMKmUCd75t+R+TuhZHdgPmZVGA9NwSDRuYXp
	XN0x82Iy/JbXIOwaAP2gNcAOghLeesVNk7hFza1kz0rQF/sDk8wCxOPL1ZKYy9Nlm51Iy1iw/SG9L
	caEyNZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GnM-00000009U4z-0j2Q;
	Mon, 28 Oct 2024 03:51:56 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GlY-00000009TXq-2rwy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 03:50:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1730087334;
	bh=ZfepWoHjCZNG7Hnofx9+U1FeKOBzJSKxe0L62gLgiEw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Q4kXXmjvf/ibWt6l3MKLMYR2k+cgSWSaU73TW60lxgVH1DvnLf70gLUh5i3G0nrre
	 8/vZ3fBKX+uqdYc8dGuaxOgp9MWrDifqZ3/9IrXr5w2qDY4Xw9iBH7g7JXOyM+0lpB
	 Up/59/wmO3fa2k7+Mpf9Ha5nU04oD7E77u0T5A/Q=
X-QQ-mid: bizesmtp85t1730087307tdhqh0l2
X-QQ-Originating-IP: dCYFQrp0v7vMRUT66sXnuY2O2ebBilMy96q78ZgxUEE=
Received: from localhost.localdomain ( [123.124.208.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Oct 2024 11:48:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2145193820470880376
From: goutongchen@uniontech.com
To: goutongchen@uniontech.com
Cc: dmitry.baryshkov@linaro.org,
	gouhao@uniontech.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robdclark@chromium.org,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH v2] iommu/arm-smmu: Add judgment on the size and granule parameters passed in
Date: Mon, 28 Oct 2024 11:48:23 +0800
Message-Id: <20241028034823.22838-1-goutongchen@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241024100224.62942-1-goutongchen@uniontech.com>
References: <20241024100224.62942-1-goutongchen@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-0
X-QQ-XMAILINFO: NQUMxZLa5thm4xRs+e6BAyU8MEa4v1Ukbo2NA5f/ZsRBzbZ2YvgxoQMx
	X9UxtHdeGXbC4fhKbDcaqTp8R2LuBFuJN80dB/6Gb7pg75jkcZ9kKsQuFbeFPWo13InuE2J
	5OReAl0fIwuQaFyK4a4Rj9+OceainLGPd0/uk+BgCgIY23CpF077kui5/mYETGQpntHxN4h
	3b5/EILDINCbDzgOFehTU+NVMyzLBbS1bSUuAOlZS2Cn8aBdr4DJCSv5idr0igSF3NsSIpi
	2f1lqdsDNozx57w8gMA1WnJ2px5LA86jSSLhjW26zyCvnPPQADHcayucXYetN/JNhkNT+8J
	vj72s5ZQfwpHlrwciz+4WekpzHGg+CJzM0ykZmB71Oc01Wcr5z7UeXQcwcb/2bIF1HkO8eA
	92klhG6Gi0251f5MPBXmRSbO2mv3wXSEb4iJ3d9izaCXQgqKrimD1MvJB0GRJTRh8xwkYWP
	qVgA/MmT327xSmdxMdRh63EkKwF+uey17hbco6I9LSvFvmL2x4wYukt9SAuVDxdD0+ocuT1
	XCanopbBecLIaSffRIxeR61VZW+Oen3mQT0999z3xvVRKUfkcm1Ocz7SWc8GReDbrxibdoO
	jscSxx4sNVIa4KEe2z4KtSoNOPRivBpXD/aqf94a7eTEY3akgj/DI1MFeYZcssIPY5gAD7t
	jHYlTdbANyiTYmKQKzysPzxoV+2cbKiZdPd4/0Gm3V8ukDM9Uw3K7/n7X21eKtfycKQuUSZ
	IXpxcgCGmVJXCxZ1Bv+25SMvwBHa97KRh8y+fLuL2eG3wG97YJnESPNZBVYWZYPQL7uz9zH
	aqSis3LgjWvRT7mHQGI4wdYOgAHMmi93jcaA8MP9+kZEit7jcCe+y/yWUi+E41Q6sdlTtKn
	PYhr3Mn9mGou9f+mYQdASNH1pAqoJbcURP9r8Z0gS30JSzSDfZ7oGKU7aX1/nJQMAO2gipd
	RXRbTH/aSTmlW5NpaRiNkyHlN3cY4piDyZP8=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_205005_476560_38BF1FDD 
X-CRM114-Status: GOOD (  10.98  )
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

From: goutongchen <goutongchen@uniontech.com>

In the arm_smmu_tlb_inv_range_s1 and arm_smmu_tlb_inv_range_s2
functions, the size and granule passed in must be judged.
It must be ensured that the passed in parameter is not 0 and
the size is an integer multiple of the granule, otherwise it
will cause an infinite while loop.

This was encountered during testing, and was initially triggered
by passing in a size value of 0, causing the kernel to crash.

[    8.214378][  T675] xhci_hcd 0000:0b:00.0: new USB bus registered, assigned bus number 1
[   68.246185][    C0] rcu: INFO: rcu_sched self-detected stall on CPU
[   68.246866][    C0] rcu:     0-....: (5999 ticks this GP) idle=796c/1/0x4000000000000000 softirq=161/161 fqs=2999
[   68.247924][    C0] rcu:     (t=6000 jiffies g=-699 q=1 ncpus=128)
[   68.248452][    C0] CPU: 0 PID: 675 Comm: kworker/0:2 Not tainted 6.6.0-25.02.2500.002.uos25.aarch64 #1
[   68.249237][    C0] Hardware name: Inspur     CS5260F     /CS5260F          , BIOS 4.0.16 05/31/22 16:53:51
[   68.250029][    C0] Workqueue: events work_for_cpu_fn
[   68.250497][    C0] pstate: a0000005 (NzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   68.251188][    C0] pc : arm_smmu_tlb_inv_range_s1+0xf0/0x158
[   68.251704][    C0] lr : arm_smmu_tlb_inv_walk_s1+0x44/0x68
[   68.252189][    C0] sp : ffff80008044b780
[   68.252530][    C0] x29: ffff80008044b780 x28: 0000000000000000 x27: 0000000000001000
[   68.253212][    C0] x26: 0000000000000600 x25: 0000000000000001 x24: 0000000000000600
[   68.253857][    C0] x23: 0000000000000000 x22: 0000000000001000 x21: fffffc64e2e59000
[   68.254544][    C0] x20: 0000000039c1d1a6 x19: ffff3fe944c40280 x18: 0000000000000000
[   68.255240][    C0] x17: 626d756e20737562 x16: ffffb0e7e08c1008 x15: 0000000000000000
[   68.255930][    C0] x14: ffff3ef8c1ea15cd x13: ffff3ef8c1ea15cb x12: fffffcfba30e3880
[   68.256538][    C0] x11: 00000000ffff7fff x10: ffff80008044b6b0 x9 : ffffb0e7decd1b5c
[   68.257126][    C0] x8 : 0000000000000dc0 x7 : ffff3ee8c4148000 x6 : ffff3ee8c4148000
[   68.257822][    C0] x5 : 0000000000000008 x4 : 0000000000000000 x3 : ffff3fe944c40800
[   68.258497][    C0] x2 : 0000000000000010 x1 : 0000000000000020 x0 : ffffb0e7dfd6c3d0
[   68.259185][    C0] Call trace:
[   68.259451][    C0]  arm_smmu_tlb_inv_range_s1+0xf0/0x158
[   68.259933][    C0]  arm_smmu_tlb_inv_walk_s1+0x44/0x68
[   68.260384][    C0]  __arm_lpae_map+0x1f0/0x2c0
[   68.260796][    C0]  arm_lpae_map_pages+0xec/0x150
[   68.261215][    C0]  arm_smmu_map_pages+0x48/0x130
[   68.261654][    C0]  __iommu_map+0x134/0x2a8
[   68.262098][    C0]  iommu_map_sg+0xb8/0x1c8
[   68.262500][    C0]  __iommu_dma_alloc_noncontiguous.constprop.0+0x180/0x270
[   68.263145][    C0]  iommu_dma_alloc+0x178/0x238
[   68.263557][    C0]  dma_alloc_attrs+0xf8/0x108
[   68.263962][    C0]  xhci_mem_init+0x1e8/0x6d0
[   68.264372][    C0]  xhci_init+0x88/0x1d0
[   68.264736][    C0]  xhci_gen_setup+0x284/0x468
[   68.265121][    C0]  xhci_pci_setup+0x60/0x1f8
[   68.265506][    C0]  usb_add_hcd+0x278/0x650
[   68.265860][    C0]  usb_hcd_pci_probe+0x218/0x458
[   68.266256][    C0]  xhci_pci_probe+0x7c/0x270
[   68.266660][    C0]  local_pci_probe+0x48/0xb8
[   68.267074][    C0]  work_for_cpu_fn+0x24/0x40
[   68.267548][    C0]  process_one_work+0x170/0x3c0
[   68.267999][    C0]  worker_thread+0x234/0x3b8
[   68.268383][    C0]  kthread+0xf0/0x108
[   68.268704][    C0]  ret_from_fork+0x10/0x20

Signed-off-by: goutongchen <goutongchen@uniontech.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 8321962b3714..fdd7d7e9ce06 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -282,6 +282,13 @@ static void arm_smmu_tlb_inv_range_s1(unsigned long iova, size_t size,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	int idx = cfg->cbndx;
 
+	if (size == 0 || granule == 0 || (size % granule) != 0) {
+		dev_err(smmu->dev,
+				 "The size or granule passed in is err. size=%zu, granule=%zu\n",
+				 size, granule);
+		return;
+	}
+
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
@@ -309,6 +316,13 @@ static void arm_smmu_tlb_inv_range_s2(unsigned long iova, size_t size,
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	int idx = smmu_domain->cfg.cbndx;
 
+	if (size == 0 || granule == 0 || (size % granule) != 0) {
+		dev_err(smmu->dev,
+				 "The size or granule passed in is err. size=%zu, granule=%zu\n",
+				 size, granule);
+		return;
+	}
+
 	if (smmu->features & ARM_SMMU_FEAT_COHERENT_WALK)
 		wmb();
 
-- 
2.20.1


