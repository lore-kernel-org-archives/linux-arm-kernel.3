Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D263E63C8C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Li/gbhn2JCn0D0Ifg0lm6nhWOlmNoBVuLJWakHpqNmQ=; b=X/mJxJu6D34pExapDdfLZ1dDTq
	NpLs46xOL3C3dQ66IVvvqpc3XIV7vWunfPBJ5orgvf2AJ6gOfSgEnLoA8HzhyZakAWbODo5/6ppPz
	5aBWjuDzFual4J59kXUXRo+jrhz8omkqQLF1BRZa9Nmi8nr7vMvzb23PlSrxwtnoqNamtuoOa3rQP
	FCx07h2/6Viykc+cIPI5r2yg/dWuiU+0YwKl+EioBLfX6k95rxiKbn97R2YdMGtKMNK9pK3EVGehK
	+kN94jFajNhmrPhifDOcdFX+FqUxRKMS09YjqazemW01RsYNLaNmnn426qoT+/q5Cee7nBrH7HDOh
	1jWDOLgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyu0-00000005RME-13nB;
	Mon, 02 Feb 2026 18:44:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytk-00000005QzH-3leo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 09C9C43713;
	Mon,  2 Feb 2026 18:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6A7FC2BC86;
	Mon,  2 Feb 2026 18:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057823;
	bh=dkRNnZvotmXRB/vj0OlRDTCSt4bIScd43i7BNBYwMwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Msu0h31e8XpNNom4YOWsQP8CdQpY2GxdLi0l9hkeEVElVUFyWWA0lP0FVGIko3y3F
	 FsP+e7R4yrXGrSLRNYYQuur/oFE+trrp+HIOAlxByxwKU74w8+pwgkKAehHt8d/LW6
	 wwiT3EekUJQB/69BLqFU7ofATQFnGzZPqODKWnOELiQgFl3tRrSb2kiYiYDA0l5ysA
	 FMI3j7MVgrdVxXa5P0T4aFb0UipajMS3GFq685BPi0+mjHdkUSZYE2K2wDWgb2YgbB
	 zWinAA4y76pbsIDvhHISWbWv7PdU3zAFBG4zncXIChrUC0HKdgJ2zdbUmPTFr7r4AF
	 WtoRM4daO14Kw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmyth-00000007sAy-3pZl;
	Mon, 02 Feb 2026 18:43:42 +0000
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
Subject: [PATCH v2 14/20] KVM: arm64: Simplify handling of HCR_EL2.E2H RESx
Date: Mon,  2 Feb 2026 18:43:23 +0000
Message-ID: <20260202184329.2724080-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104345_000640_B90E4E3C 
X-CRM114-Status: GOOD (  11.06  )
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

Now that we can link the RESx behaviour with the value of HCR_EL2.E2H,
we can trivially express the tautological constraint that makes E2H
a reserved value at all times.

Fun, isn't it?

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 474d5c8038c24..ae72f3b8e50b1 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -388,16 +388,6 @@ static bool feat_vmid16(struct kvm *kvm)
 	return kvm_has_feat_enum(kvm, ID_AA64MMFR1_EL1, VMIDBits, 16);
 }
 
-static bool compute_hcr_e2h(struct kvm *kvm, struct resx *bits)
-{
-	if (kvm_has_feat(kvm, FEAT_E2H0))
-		bits->res0 |= HCR_EL2_E2H;
-	else
-		bits->res1 |= HCR_EL2_E2H;
-
-	return true;
-}
-
 static const struct reg_bits_to_feat_map hfgrtr_feat_map[] = {
 	NEEDS_FEAT(HFGRTR_EL2_nAMAIR2_EL1	|
 		   HFGRTR_EL2_nMAIR2_EL1,
@@ -1017,7 +1007,7 @@ static const struct reg_bits_to_feat_map hcr_feat_map[] = {
 	NEEDS_FEAT(HCR_EL2_TWEDEL	|
 		   HCR_EL2_TWEDEn,
 		   FEAT_TWED),
-	NEEDS_FEAT_FIXED(HCR_EL2_E2H, compute_hcr_e2h),
+	NEEDS_FEAT_FLAG(HCR_EL2_E2H, RES1_WHEN_E2H1 | FORCE_RESx),
 	FORCE_RES0(HCR_EL2_RES0),
 	FORCE_RES1(HCR_EL2_RES1),
 };
-- 
2.47.3


