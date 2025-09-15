Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A2ECAC59D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC/TD3VO+3fDtbwq6obyge3nfCI5RdYzk+GsorJv/Ak=; b=Q0mD4BvqX28OEj3hIvbEeRTAtF
	xCmW1Zxx5Qitg6EHYsSCx/7BnBkfOBzGyB8bcHccDLdhq/bZ0iTabPmDuYo1fl3pU1cihelEiHdmB
	/UTomJYmIQREkhSw3X1o7c7cjD10qUvcvyepOQtyIohGNSulca7PzhCZZKC8WHqzYL/E2MmOK6RAw
	ry92bMsfPPGf35wwVTJgCG/86Pd3HRaid4jB7rmqU9O2bMh9qSxlxxuJIMshquUnCttQ+i+UVtv2E
	5E8WWrFSXOGcIWWCdYwu0GJatuiBUnCNlgZtgq9cJ5P7nmU0w/DlcsvY5qMrWLgXVd+aVYnw+2BAk
	LV6cvrRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e4-00000003xyK-1AA9;
	Mon, 15 Sep 2025 11:45:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dj-00000003xeO-3Tvi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BA8F60237;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B914C4CEFB;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936699;
	bh=cuS9SHuGG3F79ODO0qmZswZFWO7i6E8RahYMo63RrsA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IU+xPNqkSPTmBziaDo6mj2aQO/ljEmiikR7hLb3dKcb0N19BV2Lkuzg9t+OgX3BZk
	 afTzQzfXmFeqAhjNeUmSW1NS7Uv2kaTkkXTQVutCw73pSm0UqUtemQ6WhSAnWPfTJn
	 4BDGpcSb5xYE4WI+iY6OuOHMw7jVNQVten4M1dj9KyewHChIxNr81bsVJ618QY+OI3
	 4nlFzP+jH7uANi8S3KyhSAUK8VSrTilVmhYCckU16/wbTj735LYT15OeGNCoDgVo00
	 eHIh7Iglw7UPoB25PTPIOjKpSXLWb6vEb5msges14zSYneMesOP3N7OwLIz+X/dAkI
	 zQiPCDV7g/rPg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dh-00000006MDw-32D7;
	Mon, 15 Sep 2025 11:44:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 14/16] KVM: arm64: Add S1 IPA to page table level walker
Date: Mon, 15 Sep 2025 12:44:49 +0100
Message-Id: <20250915114451.660351-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

Use the filtering hook infrastructure to implement a new walker
that, for a given VA and an IPA, returns the level of the first
occurence of this IPA in the walk from that VA.

This will be used to improve our SEA syndrome reporting.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  2 +
 arch/arm64/kvm/at.c                 | 65 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index cce0e4cb54484..2be6c3de74e3d 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -353,6 +353,8 @@ struct s1_walk_result {
 
 int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		       struct s1_walk_result *wr, u64 va);
+int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
+			     int *level);
 
 /* VNCR management */
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index c099bab30cb0d..117ce1ff5e767 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1578,3 +1578,68 @@ int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	return 0;
 }
+
+struct desc_match {
+	u64	ipa;
+	int	level;
+};
+
+static int match_s1_desc(struct s1_walk_context *ctxt, void *priv)
+{
+	struct desc_match *dm = priv;
+	u64 ipa = dm->ipa;
+
+	/* Use S1 granule alignment */
+	ipa &= GENMASK(52, ctxt->wi->pgshift);
+
+	/* Not the IPA we're looking for? Continue. */
+	if (ipa != ctxt->table_ipa)
+		return 0;
+
+	/* Note the level and interrupt the walk */
+	dm->level = ctxt->level;
+	return -EINTR;
+}
+
+int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
+{
+	struct desc_match dm = {
+		.ipa	= ipa,
+	};
+	struct s1_walk_info wi = {
+		.filter	= &(struct s1_walk_filter){
+			.fn	= match_s1_desc,
+			.priv	= &dm,
+		},
+		.regime	= TR_EL10,
+		.as_el0	= false,
+		.pan	= false,
+	};
+	struct s1_walk_result wr = {};
+	int ret;
+
+	ret = setup_s1_walk(vcpu, &wi, &wr, va);
+	if (ret)
+		return ret;
+
+	/* We really expect the S1 MMU to be on here... */
+	if (WARN_ON_ONCE(wr.level == S1_MMU_DISABLED)) {
+		*level = 0;
+		return 0;
+	}
+
+	/* Walk the guest's PT, looking for a match along the way */
+	ret = walk_s1(vcpu, &wi, &wr, va);
+	switch (ret) {
+	case -EINTR:
+		/* We interrupted the walk on a match, return the level */
+		*level = dm.level;
+		return 0;
+	case 0:
+		/* The walk completed, we failed to find the entry */
+		return -ENOENT;
+	default:
+		/* Any other error... */
+		return ret;
+	}
+}
-- 
2.39.2


