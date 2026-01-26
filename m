Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EF4CF65E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 12:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GliRK111jjZc9gtPdMKyxDMN9aXhYfkwRGnXRwgGVZc=; b=C21dgGgn8FhI98KNvArkH9334O
	1UDq+BfQEcRu+5THPizTMYN82mlPFqNCjz6Qpd/eLyJ/8cv2a7DVx2wXf9oYNEVECf3NzVKqcpTNp
	mgahse3qbTngO5dbFhxkc31DIZsXBuSo4mx8ximJycMEi7qEi0B6g1R1iqexIrvABwSMTsTRY+bNK
	d8318S9Rp30okT5fCybInRIxsaI842qKRhMXslAVvjkoh9KlvL/EGLg5IXDnAGQpWK76MAXAYeXfu
	LN7oeBTUfDWfTe0J11f2JorBVByZggPUcS51+GBm5z35jWt8B3nNzHxkaYW0iyMOs+EZ9kzVB9nKZ
	FRWiQvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXS-0000000CV2v-2y06;
	Mon, 26 Jan 2026 12:17:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkLXD-0000000CUrR-1Xhb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 12:17:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0ADBD4433F;
	Mon, 26 Jan 2026 12:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA77C116C6;
	Mon, 26 Jan 2026 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769429854;
	bh=oBYAGLow77dO0fWYfBQJjR0bVNFLQFasCbUMJ19cc4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AmQ+qLuWOcv+C8wQTt+Bu1KLM99h1dRUWh7B6iw66A4vS3B3Iiv6nmpfAUWxOQt8Y
	 l1FErAK8gva6TvNHCe0BuJZbPXLPt2ZkeUhOwWhtpAHfWqtI6pUl20rZRYupcUikd0
	 2X47w8bORNXCFRDXruSNF12WD15as3KBcYLxnloMv9TmIjd+L6WpAHsQj58KVTZDUj
	 49EM6Wr4Iww0Mx8EClrpyu44sRLipjRXBAJPn9DLv61X4+GDEdtK7s45GYmsEabQ8i
	 SZnvQAMURc2r7/EwgwQZdtbLWLmIHlv2o4JHI9HCHlvPhMlC/d/C7J2XSZDPSXwAou
	 a//W1XGGkha1Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vkLXB-00000005hx6-0DPL;
	Mon, 26 Jan 2026 12:17:33 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 06/20] KVM: arm64: Inherit RESx bits from FGT register descriptors
Date: Mon, 26 Jan 2026 12:16:40 +0000
Message-ID: <20260126121655.1641736-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126121655.1641736-1-maz@kernel.org>
References: <20260126121655.1641736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_041735_440911_43269058 
X-CRM114-Status: GOOD (  10.74  )
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

The FGT registers have their computed RESx bits stashed in specific
descriptors, which we can easily use when computing the masks used
for the guest.

This removes a bit of boilerplate code.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index a907195bd44b6..8d152605999ba 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1344,6 +1344,11 @@ struct resx compute_reg_resx_bits(struct kvm *kvm,
 	resx = compute_resx_bits(kvm, r->bit_feat_map, r->bit_feat_map_sz,
 				 require, exclude);
 
+	if (r->feat_map.flags & MASKS_POINTER) {
+		resx.res0 |= r->feat_map.masks->res0;
+		resx.res1 |= r->feat_map.masks->res1;
+	}
+
 	tmp = compute_resx_bits(kvm, &r->feat_map, 1, require, exclude);
 
 	resx.res0 |= tmp.res0;
@@ -1424,47 +1429,36 @@ struct resx get_reg_fixed_bits(struct kvm *kvm, enum vcpu_sysreg reg)
 	switch (reg) {
 	case HFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgrtr_desc, 0, 0);
-		resx.res1 |= HFGRTR_EL2_RES1;
 		break;
 	case HFGWTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgwtr_desc, 0, 0);
-		resx.res1 |= HFGWTR_EL2_RES1;
 		break;
 	case HFGITR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgitr_desc, 0, 0);
-		resx.res1 |= HFGITR_EL2_RES1;
 		break;
 	case HDFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgrtr_desc, 0, 0);
-		resx.res1 |= HDFGRTR_EL2_RES1;
 		break;
 	case HDFGWTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgwtr_desc, 0, 0);
-		resx.res1 |= HDFGWTR_EL2_RES1;
 		break;
 	case HAFGRTR_EL2:
 		resx = compute_reg_resx_bits(kvm, &hafgrtr_desc, 0, 0);
-		resx.res1 |= HAFGRTR_EL2_RES1;
 		break;
 	case HFGRTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgrtr2_desc, 0, 0);
-		resx.res1 |= HFGRTR2_EL2_RES1;
 		break;
 	case HFGWTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgwtr2_desc, 0, 0);
-		resx.res1 |= HFGWTR2_EL2_RES1;
 		break;
 	case HFGITR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hfgitr2_desc, 0, 0);
-		resx.res1 |= HFGITR2_EL2_RES1;
 		break;
 	case HDFGRTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgrtr2_desc, 0, 0);
-		resx.res1 |= HDFGRTR2_EL2_RES1;
 		break;
 	case HDFGWTR2_EL2:
 		resx = compute_reg_resx_bits(kvm, &hdfgwtr2_desc, 0, 0);
-		resx.res1 |= HDFGWTR2_EL2_RES1;
 		break;
 	case HCRX_EL2:
 		resx = compute_reg_resx_bits(kvm, &hcrx_desc, 0, 0);
-- 
2.47.3


