Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF8ACD6E7B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=381Fq/TSXo/JXln0nP+8I3E908K7YAJ7UEBMT46S5DU=; b=WCJwMgl3yfe3s7+tniasmm7op8
	L4UGlyeCjMok69KGUJN9W0Hp/XVBGetQncNhhK9edKxtYJHaaI1e5/A3SJvjtmM88l2eUFk41gC1D
	6Psgucs8Wao5RKbTK6/29DV6wE+kmVHywALhJ0fBjl29E+8YtZDeUrG1Ypps6KMWxYwyym8UJHRe9
	lDHTxxFNrCnPmThbtPrTq34KSDuAIjQ7ikTBwnptfMTTBWRGX/8XsVwrUDohyoQaynulZcmcheFW0
	QudqZ8tXBn6j1cpwGYbbHRfH1GVC8kUwX3vrrXLGQ9Tmtn3B76EGVvnpKK+pHG6q9Dib7FGjTwKPA
	7ScdQG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZfW-000000014nx-2Kwi;
	Fri, 05 Jun 2026 18:53:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVZfU-000000014nV-0P46
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 18:53:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A84947D8;
	Fri,  5 Jun 2026 11:53:13 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D85C3F7D8;
	Fri,  5 Jun 2026 11:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780685598; bh=LXJ4N9M7Q2HKVuHJiqod/o5k82b/D7efOXXT+s8XorA=;
	h=From:To:Cc:Subject:Date:From;
	b=AMI5okhrpHUmhc5NVTNmDPnAOcbbGme/mmAAZmNe98E9+W2v3TU3lBPqxHGunxbZ1
	 G4QEg14jmqDdYWMJhgb0+sF6MYCihH4r3gzPtUTJ6I6/OURExxvW24WLcln3bzDeZE
	 VFEHXDmxegfxEzB0N7eqIHJ3TM1bnfIveyeEjOrk=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH] KVM: arm64: Fix block mapping validity check in stage-1 walker
Date: Fri,  5 Jun 2026 19:52:55 +0100
Message-ID: <20260605185255.2431996-1-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_115320_395916_E6D31E80 
X-CRM114-Status: GOOD (  12.10  )
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

For the 64K granule size, FEAT_LPA determines whether a level 1 mapping
is allowed. Using the result of has_52bit_pa() is too restrictive, as it
also checks the selected output addressi size in TCR.(I)PS. Fix it by
only checking FEAT_LPA.

Fixes: 5da3a3b27a01 ("KVM: arm64: Expand valid block mappings to FEAT_LPA/LPA2 support")
Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/kvm/at.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 2ddb5b5a055e..30e6fa8ac07c 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -564,15 +564,18 @@ static int walk_s1(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 	/* Block mapping, check the validity of the level */
 	if (!(desc & BIT(1))) {
 		bool valid_block = false;
+		bool lpa = kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR0_EL1, PARANGE, 52);
 
 		switch (BIT(wi->pgshift)) {
 		case SZ_4K:
 			valid_block = level == 1 || level == 2 || (wi->pa52bit && level == 0);
 			break;
 		case SZ_16K:
-		case SZ_64K:
 			valid_block = level == 2 || (wi->pa52bit && level == 1);
 			break;
+		case SZ_64K:
+			valid_block = level == 2 || (lpa && level == 1);
+			break;
 		}
 
 		if (!valid_block)
-- 
2.43.0


