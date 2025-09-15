Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863D1CAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzqurcLa/IDxwrO1DhsDScwJC44x+bCYYD2lYvy2Qkk=; b=DNxvoGXkLPkSUZwTg1LS5bkcbB
	dt8aoVZdaRuzefexDBEVZPs9KVNTCYZcvJkODdbMgJmmg82NjR5r/o62XUhugivfi103BOP+N9ooH
	XfqjsRKfHGRtaiIS7DVFV02WcJwFlJcqdfdJQUYB3WhuWTO5TgL9L+IQDnF37pV8pAXlc16oQGmSj
	L62FSYqjZiGt2saJ2UNSW+UfjTTaBqVxP/WQqC3MwbSS4YK5+4PI81aNSRmoNvoovFruzYhLgimfe
	vRDNF8PcCt4ziTIEAc29SHHO5FCqYKnHC8KigC+nDNFd7qI56oYafa5zMPi9qAGnNOq6X59GKTRPD
	KoBdQM7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e3-00000003xxh-3tgf;
	Mon, 15 Sep 2025 11:45:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dh-00000003xdN-2eg5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:44:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59D6B44615;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A98CC4CEF5;
	Mon, 15 Sep 2025 11:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936697;
	bh=QoWf3Hz1oVVZPWlTAUphYRlyMtJu/P8QeR87ZvAxATI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VmotDdEtmPgy341cUWBhaW9COs0ksZ/KnCnD9xpA+NRsK8lMA4YtY69Vi2Sdq0EKs
	 rEvGCjNpIBDEwKzqEYT1+X5CtRlLUEmAQHI5Caqz1VmGD+0uDXvJzX8Y9tGwLbjzR3
	 dRONzDT61cTzR3wT39m9WNFYgrvc37Dc5tWO95Es2PrMRDF3jWUQMgXttB/yKv2mIz
	 Kh0qyUs96UUqgrHmVojNZ7g0aOnwiMPqRxxfstj5XTDPR/1eQLrxVXrB1DKOA4xHFM
	 nPX28CiSYWbwKW/6TiWxx4QcIX9eLvE1lggeM6D7HRNAABuElHlEB5jb8ZN3qOv1Wd
	 Ine0GH2jLvMGw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7df-00000006MDw-1Iy4;
	Mon, 15 Sep 2025 11:44:55 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 02/16] KVM: arm64: Account for 52bit when computing maximum OA
Date: Mon, 15 Sep 2025 12:44:37 +0100
Message-Id: <20250915114451.660351-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250915114451.660351-1-maz@kernel.org>
References: <20250915114451.660351-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_044457_708296_96EBE116 
X-CRM114-Status: GOOD (  13.49  )
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
index 8e275ea68cfa8..96452fdc90e2b 100644
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
index 77db81bae86f9..cb36974e010af 100644
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


