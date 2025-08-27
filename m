Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D477BCA0FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NoP/lOAHCJpXrXXNU1AjqjGGsgXEDOLartRf+dczAKE=; b=BhToLDABoUtexmO/MpeYyx2DpZ
	WYMhnme174pxms7wZP7ZbluoAn4p45pg1lY/pev95NLQjlATNg/AAaGeeJ9FNO4S0MBnYlfz8HZgJ
	PBDfIBAsAvMrSGmhTeu2Hx6G9b+kN2VoQcQy/TYsLOuq9SLCugCOxqQYe3Cii/4NQQHpi+YPsoTJH
	Z8avycEvIerFHXwDx9HoffEIx+6Pc/mb7B8XdjphwRFuQhuXpUH+T7gaD3v9tF7JSk9hWVkM4VlK+
	tgs3Rqyl/sF2tM8gWGinO2V4Y55UKw0gK9YIsw6Hj/E1k+PN18Khh9t8St1GHcUVchLcXH9jQIRDt
	cMM6X9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbp-0000000GZAK-18jr;
	Wed, 27 Aug 2025 19:15:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjb-0000000G8pE-3HM2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3388160263;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB04C4CEF5;
	Wed, 27 Aug 2025 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311050;
	bh=WGAcyYYKKfrubRZESqblkQKkoN12vcYQEG40OL+z1s0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dy5ZuCBjZ6nIpEAXUOkvlBh2x+jPXvauu+3bejaco+paybytZosks5wJw8Vmt6eWg
	 0bHtlrY7LO0R9wsAX1Jk6uPHM12FukCHW3X3nYhVs3+zYpypeSDVDvqZai7G+DMimA
	 tOI9Ay0P5BpEEOeSHWuMl24tTUM0/5G9WqmufEb6+w3u3tTnYO4BCKonHIwcWMailv
	 2ZGgo+3JsfZf4r5S30OAgUuwyNy9w20f5STiQ+tgekBiWIlEPLLyMH/4+5PAUZiP6A
	 vIqn9ZaLMUESQeNHBjF7lwONq6yeL7g0JBdxaMP2CjpQuSRmvAsKJ1LJUUMimcRzh7
	 zLQ+DCVWCMW7A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjZ-00000000yGc-0LZK;
	Wed, 27 Aug 2025 16:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 13/16] KVM: arm64: Add filtering hook to S1 page table walk
Date: Wed, 27 Aug 2025 17:10:35 +0100
Message-Id: <20250827161039.938958-14-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
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

Add a filtering hook that can get called on each level of the
walk, and providing access to the full state.

Crucially, this is called *before* the access is made, so that
it is possible to track down the level of a faulting access.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 14 ++++++++++++++
 arch/arm64/kvm/at.c                 | 11 +++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index f3135ded47b7d..cce0e4cb54484 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -288,7 +288,21 @@ enum trans_regime {
 	TR_EL2,
 };
 
+struct s1_walk_info;
+
+struct s1_walk_context {
+	struct s1_walk_info	*wi;
+	u64			table_ipa;
+	int			level;
+};
+
+struct s1_walk_filter {
+	int	(*fn)(struct s1_walk_context *, void *);
+	void	*priv;
+};
+
 struct s1_walk_info {
+	struct s1_walk_filter	*filter;
 	u64	     		baddr;
 	enum trans_regime	regime;
 	unsigned int		max_oa_bits;
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 6e767ae3c495a..f77c16225557f 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -413,6 +413,17 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			ipa = kvm_s2_trans_output(&s2_trans);
 		}
 
+		if (wi->filter) {
+			ret = wi->filter->fn(&(struct s1_walk_context)
+					     {
+						     .wi	= wi,
+						     .table_ipa	= baddr,
+						     .level	= level,
+					     }, wi->filter->priv);
+			if (ret)
+				return ret;
+		}
+
 		ret = kvm_read_guest(vcpu->kvm, ipa, &desc, sizeof(desc));
 		if (ret) {
 			fail_s1_walk(wr, ESR_ELx_FSC_SEA_TTW(level), false);
-- 
2.39.2


