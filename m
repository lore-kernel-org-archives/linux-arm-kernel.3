Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A6DC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 00:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+6BmEfyhCCNgybnQYOisonTljfDXQ1AGs4JLDc2NF8=; b=jvmMxw1QguWwVSE1sySUFMwQlD
	HNR7Awz6Vsh8X54SNqZv9GQX2pqoLx+9r1yOJm1bNZIz6MzFukbl0z+XuhUngheudpu//q83LnMiq
	///6VHeNBV+BixvtDrM0Aua4PFFfJ3E0MBF9y1HxgPy8dro5i3KzgK0TQ6tlPXVeLpY88qFsdIbKL
	LbfEaEvVuDXMcfni2h+b5KU1pXMlYRLdl930cq5dni5nLSx4pLZIeBAD55S+jl862t16fbwBlRWHE
	BC5AzzveUPB9Ju0evj6x6fCjpDO5jCpkssYXtMz1yeHc4uKn4udIV0pKHXnlI8Va2AQKgHN0w4lAi
	9IoN3M3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0lU-00000005iqW-1KVE;
	Wed, 12 Feb 2025 00:38:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti0jM-00000005iQ3-1YwH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 00:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0DC0DA40ECB;
	Wed, 12 Feb 2025 00:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F0DC4CEDD;
	Wed, 12 Feb 2025 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739320555;
	bh=IHSRysAps1kPO4mQdQ2PWZCTN+vLfajuUKA+LRmoBSI=;
	h=From:Date:Subject:To:Cc:From;
	b=KlXpZhrFsfYTIXkxGQMoJDS9aQlzLhEhxEMjiOtgFWUYbp/hCogvhYgR3sdx0uQW8
	 VBzdePQZ91zbrwdK9YqA2jWb2LUrVHwCXCKohOW14Va6nT2MNuhKDf/ODhJhgz0R5e
	 nNx9KL7apZwT7kC8o81sCaspUfbPYZ+RWV+7kzT/THy6mQT/0Qx4A5+Gm2AtaFBo9d
	 6aTDWCvQhJBl+ppj+y7FtBzUEfPdUR2xf5tNaN+4qgTdCaoVxT/Tx1ayk6ua0/B5bK
	 D/rFj8Iwew1OPSyybMDd/VQ7x2/vR1LB6pntbPqG+7o4bfDBXwvAn+Zxl3JzH/EkI+
	 b3vgq3+5vcJgA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Feb 2025 00:35:14 +0000
Subject: [PATCH] KVM: arm64: Use symbolic name for ID_AA64PFR0_EL1.RME in
 NV filtering
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250212-kvm-arm64-rme-symbol-v1-1-45d272c2108b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMHsq2cC/x3MTQ5AMBBA4avIrE3SNurvKmJBDSYUmSZCxN01l
 t/ivQcCCVOAOnlA6OTA+xah0wTc3G0TIQ/RYJSxymiNy+mxE59nKJ4w3L7fVzRlr21VWJc5BTE
 9hEa+/m3Tvu8H6VwuqmYAAAA=
X-Change-ID: 20250211-kvm-arm64-rme-symbol-28b15975c4c0
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1261; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IHSRysAps1kPO4mQdQ2PWZCTN+vLfajuUKA+LRmoBSI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnq+zoaS29eV6IcWGgLA7ZN4ZG85DsktSsCIJo9npw
 tfvlehCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ6vs6AAKCRAk1otyXVSH0Pq3B/
 95gsg9mQinUb1vZOecK757FVwxsEPeGs4rmG4pei3PQcT6F4w5onBwNZGOefJLTeB3TZocVLpPGVZQ
 XS2DKafrRA7M9wbMzS9zgBmfRtoiVnGL9LI4twFz7aohZ8fo1nnQGBlDjT/B43eNg2bvWyhHJu0Cy/
 OdeQKEZ3ArGXyNnmok9yD0gM8agSx0a4595OP37LHVt95Zoy+bQCkb7qbJis2pzwzOdJ+TnpwiBZgO
 DXLCcIRscv69uj/FJ9s2xocrbQB+D+CSFDGjhhN7pvATTkfFRP3EyqUUL5MohzPmItpuUCAf9scTXk
 BdqonTsruvL2Wg5pJETy4KRCqzi2MB
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_163556_486534_76618413 
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

We generally use symbolic field names generated via NV_FTR() when we filter
the feature registers for nested virtualisation but when the current format
was adopted there was no symbolic definition for ID_AA64PFR0_EL1.RME so it
was instead specified using a raw GENMASK_ULL(). Since the field has now
been specified in sysreg we can replace this with the symbolic name in
order to make things marginally more legible.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 0c9387d2f50708565b5aac1fc0f86fefffd94ea1..bf6ec0f499ae207a5c056a0ec157368527a71fde 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -824,7 +824,7 @@ static void limit_nv_id_regs(struct kvm *kvm)
 
 	/* No AMU, MPAM, S-EL2, or RAS */
 	val = kvm_read_vm_id_reg(kvm, SYS_ID_AA64PFR0_EL1);
-	val &= ~(GENMASK_ULL(55, 52)	|
+	val &= ~(NV_FTR(PFR0, RME)	|
 		 NV_FTR(PFR0, AMU)	|
 		 NV_FTR(PFR0, MPAM)	|
 		 NV_FTR(PFR0, SEL2)	|

---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250211-kvm-arm64-rme-symbol-28b15975c4c0

Best regards,
-- 
Mark Brown <broonie@kernel.org>


