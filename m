Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD9CC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 06:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXV7/tYBc8Oc7wqFagoZzmcLWztp8gxjz/PSgOgeoqA=; b=3jJqnxLDGWW7U4MnCygR5Jlc8m
	6XZ94GEerZeHANrbhxxHlMy1q2+WVNpJFsJ3w1DUTQUNPceG8zGkuxBuw5qNxKxdc1hvOZu/saXpx
	nbKvDUF0dXZYxo58Hfn3jegX53ragbJMa53FZStAsi5Jg69XmzJsAbe0g52QIYvcKmip3rCA6QqUq
	BWJrcYQzLUqDGEnaah2jHSJZUlYLQwpM6N3eUfRQ27VZasPg30lOZV0TNrRDDQ9N4nrYAEYPeuUsn
	A1fFVkdCF+MlLMfvHVv1WLVX46vyW8Ol9zz4f/U4ZF+bo/Kkstl1k52BMvondwO1YKL9k6kXNp19I
	Bl/du2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4pb-0000000HRwn-24n8;
	Mon, 28 Sep 2026 06:27:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB4pZ-0000000HRwh-30U8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 06:27:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C2AB460204;
	Mon, 28 Sep 2026 06:27:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EFDDC2BCC7;
	Mon, 28 Sep 2026 06:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790576836;
	bh=WcTHDnTmvOWE1C59mZdXUFRa8r2t2+nheTWFYpchz7Q=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=loomeO2nSRVAbBLtzicM08Hf/4WfIMCMKgsuyzEVofabOPj9tpiuevFNFD/n8+zml
	 pzeWIcopCVAU6J9WQCATT9frMlnBGvmG0cCh8AKVqGmwis4RbghOJqJZHw1gONw1Bm
	 YKCo0y9Zn4NffMn6zl9nxfSZBkz5130PyQji2covfkUlfNo7zbTOC6qjFN7DFOyiZz
	 J2iwFeNBM1IQzqteouQsVwP9gMGzaOFiH/dtOvoYFtT07mG1PPhuUrvY0PpDldfdh4
	 UhmX8EpFCNSEdVBc8JUTNnxhf0UkhssjLXagca2J/urmlhGRaWruaEjO3SaWoeamTR
	 8nEW4I6MkyY3A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AD89C9832F;
	Mon, 28 Sep 2026 06:27:16 +0000 (UTC)
From: Sam Day via B4 Relay <devnull+me.samcday.com@kernel.org>
Date: Mon, 28 Sep 2026 16:27:15 +1000
Subject: [PATCH] iommu/qcom: Invalidate TLB during context init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-qcom-iommu-clean-contexts-v1-1-c88fe2b4ff48@samcday.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQrCMBAF0KsMf92BGEupuYq4CJNRB0yiSZVC6
 d2FvgO8DV2baUegDU1/1q0WBDoNBHnG8lC2hEDwzk/u4if+SM1sNecvy0tjYall0XXpfBZJcXa
 juDlhILyb3m097utt3/9mwOBJawAAAA==
X-Change-ID: 20260926-qcom-iommu-clean-contexts-3ccda804c08d
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Joerg Roedel <jroedel@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sam Day <me@samcday.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790576835; l=4431;
 i=me@samcday.com; s=20240502; h=from:subject:message-id;
 bh=dBYP37Vw4lAFJ1/z626JMlsCqPvHWtUxsdH66DNtfjA=;
 b=DC/qs/AsRRQp10M7IFKDFE5qD0b0QaKZ7OQIDMMQU93+okhiU9MCBOUXNBxJeGaCW5GyuQmyo
 0R5tch/VaArCcPtPvZbTlApYW3PAyqLI9XCU6ysGOlySHjcxNjSenoa
X-Developer-Key: i=me@samcday.com; a=ed25519;
 pk=bzyS0akxWMqr9+AXzgBRIp28KKpEOs+GjYMc2yf+aeU=
X-Endpoint-Received: by B4 Relay for me@samcday.com/20240502 with
 auth_id=595
X-Original-From: Sam Day <me@samcday.com>
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
Reply-To: me@samcday.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sam Day <me@samcday.com>

qcom_iommu derives each context bank's ASID from DT data, so a kernel
booted via kexec reuses the same ASIDs as its predecessor.

Programming a new TTBR0 doesn't discard entries the SMMU has already
cached under that ASID, so these residual and stale
translations/table-walks will go into effect as soon as the context is
enabled again.

On MSM8916 devices (I confirmed it on both a Samsung Galaxy A5 and a
DragonBoard 410c) the result is MDP5 taking context faults on
framebuffer IOVAs and stuck in a continuous underrun storm during scan
out, if the previous kernel had itself initialized the display and
programmed the SMMU.

arm-smmu invalidates the whole TLB in arm_smmu_device_reset() before
enabling the SMMU. qcom_iommu can't do that on these TZ-managed devices
(SMMU_SCR1.GASRAE=1), however.

Instead, qcom_iommu now invalidates each context bank by ASID whilst it
is still disabled, before programming it for the new domain. Secured
contexts are protected by TZ so they're skipped.

There's been previous discussion on the list (see link) about how to
best deal with this kind of situation. This patch opts for a fix in the
incoming kernel, rather than the outgoing one. This ensures newer
kernels will always behave correctly, and also covers the kdump use
case.

Fixes: 0ae349a0f33f ("iommu/qcom: Add qcom_iommu")
Link: https://lore.kernel.org/all/20240319154756.GB2901@willie-the-truck/
Assisted-by: LLM
Signed-off-by: Sam Day <me@samcday.com>
---
Tested on my DragonBoard 410c. Starting from one unpatched kernel
scanning out at 640x480 and kexecing into the same kernel at 1280x720
results in context faults starting at the first IOVA past the previous
kernel's mapped extent, with continuous MDP5 underruns thereafter.
During this time I observed an all-blue HDMI signal. With the patch
applied, the same kexec hop is free of faults, and the HDMI signal is
clean throughout.

Further, it was proven that kexecing into an unpatched kernel and
causing the fault storm can then be resolved by subsequently kexecing
into a patched kernel.
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b982..a37955cd90d5e 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -111,23 +111,26 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
 	return readq_relaxed(ctx->base + reg);
 }
 
+static void qcom_iommu_ctx_tlb_sync(struct qcom_iommu_ctx *ctx)
+{
+	unsigned int val, ret;
+
+	iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
+
+	ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
+				 (val & 0x1) == 0, 0, 5000000);
+	if (ret)
+		dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
+}
+
 static void qcom_iommu_tlb_sync(void *cookie)
 {
 	struct qcom_iommu_domain *qcom_domain = cookie;
 	struct iommu_fwspec *fwspec = qcom_domain->fwspec;
 	unsigned i;
 
-	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
-		unsigned int val, ret;
-
-		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
-
-		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
-					 (val & 0x1) == 0, 0, 5000000);
-		if (ret)
-			dev_err(ctx->dev, "timeout waiting for TLB SYNC\n");
-	}
+	for (i = 0; i < fwspec->num_ids; i++)
+		qcom_iommu_ctx_tlb_sync(to_ctx(qcom_domain, fwspec->ids[i]));
 }
 
 static void qcom_iommu_tlb_inv_context(void *cookie)
@@ -270,6 +273,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		/* Disable context bank before programming */
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
 
+		/* The TLB may still hold cached and stale entries for this
+		 * ASID, if a previous kernel programmed the SMMU before
+		 * a kexec into this kernel.
+		 */
+		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
+		qcom_iommu_ctx_tlb_sync(ctx);
+
 		/* Clear context bank fault address fault status registers */
 		iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
 		iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);

---
base-commit: 3339792beb5fb1c9c423c544ba2fbc235e7d7f75
change-id: 20260926-qcom-iommu-clean-contexts-3ccda804c08d

Best regards,
-- 
Sam Day <me@samcday.com>



