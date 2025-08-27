Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745C1CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 18:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5C0IjY1Q7kEYYzjvJ+fVjjhDuWupgp52tBMGwc1RQg=; b=wysKBF0QHJle9hu+0YVNqxl6wH
	r74Aor1VrhxbUWrpGNgnFQkiL4KnN0MkFUJYJrdUXaICrFghr3KwEyjIuXrfhmd5/3/BlpA2s/S4E
	DiBIHjA8xjT5bQ4KlDw9gSPugfm8PBfIsf5ZwsgCevzf9r+ESOqPmWPFwAnSg1HQUUj0VOLnDemxf
	OZWk2lrE/A9f/dpAVPoP9VDrGlZzFosGAH97/sK46mk+cZYuI6GyTxSmKfFdMl65UeyN8LQXztN5H
	z3tYsuxODO/b9lbcOCsheR+rWxTvbPlvJhUFvm1W4FDfJAnkLlYlcXVHtPLl7kuINzOKzICmMxH1y
	gDG0XGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urKkO-0000000GS3q-2PEV;
	Wed, 27 Aug 2025 18:19:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjZ-0000000G8mQ-1ej0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 12B6D43878;
	Wed, 27 Aug 2025 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41C2C4CEF5;
	Wed, 27 Aug 2025 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311048;
	bh=/xmMjNJO1y5cdr7S0+GamClR1BgNvrEtoT4V7IyrfNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g6KWq1iVHeTpg1VBGcBlXr1UWKSuBHTgntnekPpnim+ff/iYs3ddQ45gsN8M8ImY3
	 v59u8ZAaMBWtlnGe8OAXiKbk3KDeKRH0UGQRnWSBcuITLM7I8s0hJNojA9JVzGrtjr
	 Cq1c5FT+8uUMbQ1NYMEhMuI7hKIEkS4T1NBeOKOv4C7DYPliHgeASzDVifWi/KL8lV
	 ex6LVmpOJmDc4r82szDbPhyewILhsbjVYMio0FHTK3grxG8+fbzv1LcCI0wQCtOHQC
	 wrGpBS8DzXFifBZyZj548ieRbwtryYGcUPMYOXs3GVmM17puHC7JfgWm7rMAHOyni/
	 cUoLYPBjmgCEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjW-00000000yGc-3qoE;
	Wed, 27 Aug 2025 16:10:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 02/16] KVM: arm64: Account for 52bit when computing maximum OA
Date: Wed, 27 Aug 2025 17:10:24 +0100
Message-Id: <20250827161039.938958-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091049_494856_BC64889B 
X-CRM114-Status: GOOD (  13.13  )
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

Adjust the computation of the max OA to account for 52bit PAs.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 7 +++++--
 arch/arm64/kvm/at.c                 | 2 +-
 arch/arm64/kvm/nested.c             | 2 +-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 038e35430bb2c..1a03095b03c5b 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -265,7 +265,7 @@ static inline u64 decode_range_tlbi(u64 val, u64 *range, u16 *asid)
 	return base;
 }
 
-static inline unsigned int ps_to_output_size(unsigned int ps)
+static inline unsigned int ps_to_output_size(unsigned int ps, bool pa52bit)
 {
 	switch (ps) {
 	case 0: return 32;
@@ -273,7 +273,10 @@ static inline unsigned int ps_to_output_size(unsigned int ps)
 	case 2: return 40;
 	case 3: return 42;
 	case 4: return 44;
-	case 5:
+	case 5: return 48;
+	case 6: if (pa52bit)
+			return 52;
+		fallthrough;
 	default:
 		return 48;
 	}
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 10484249f9d54..04b7ff4426303 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -295,7 +295,7 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	ps = (wi->regime == TR_EL2 ?
 	      FIELD_GET(TCR_EL2_PS_MASK, tcr) : FIELD_GET(TCR_IPS_MASK, tcr));
 
-	wi->max_oa_bits = min(get_kvm_ipa_limit(), ps_to_output_size(ps));
+	wi->max_oa_bits = min(get_kvm_ipa_limit(), ps_to_output_size(ps, wi->pa52bit));
 
 	/* Compute minimal alignment */
 	x = 3 + ia_bits - ((3 - wi->sl) * stride + wi->pgshift);
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 7c7cbe970797b..046dcfc8bf76b 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -349,7 +349,7 @@ static void vtcr_to_walk_info(u64 vtcr, struct s2_walk_info *wi)
 	wi->sl = FIELD_GET(VTCR_EL2_SL0_MASK, vtcr);
 	/* Global limit for now, should eventually be per-VM */
 	wi->max_oa_bits = min(get_kvm_ipa_limit(),
-			      ps_to_output_size(FIELD_GET(VTCR_EL2_PS_MASK, vtcr)));
+			      ps_to_output_size(FIELD_GET(VTCR_EL2_PS_MASK, vtcr), false));
 }
 
 int kvm_walk_nested_s2(struct kvm_vcpu *vcpu, phys_addr_t gipa,
-- 
2.39.2


