Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C2BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjTgu38sXvUYUy0LyZ0TZPxnwknuJRGQTm2vknWiP0E=; b=be0dboS8Py8Lejo1640c78oBCH
	yFxXUzAiF0XrHetl7ESsCX1rzYZLdpCDXIGdpT/JMWSNaglC8fqpPEVgRe0NIseNIlThrMxwQPDr4
	57q8wET7elECIcPOE9lhbW4BrAuDtwA6ZSwoTvPtZHo2aVWC+Uz6rhzygS1yyLebz/P+bsmd8CJb/
	qPxiMXyByP21jgWTH3pU06F7uN81rnrnk/X10FsK4xtT9DOA+feVj5GtIQ64ca96xChkjVgksLvF3
	uWuOpAkI5RFCnZ8S16ZB/U5GnRVkJryq0Z/47szMGJpjKPhwHxBQ6yhkLJkbmoAbwqwlivMUMHyxq
	iK+yPo/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjMAM-00000000VaI-3oX6;
	Sat, 15 Feb 2025 17:41:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjM7T-00000000Up4-2N5o
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8FA825C4277;
	Sat, 15 Feb 2025 17:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A79FDC4CEE9;
	Sat, 15 Feb 2025 17:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739641102;
	bh=RvUSEhI6cySQmIz8ZQ/36MwcnMPJHyHB8RpivDDZCT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZvE8lp76JHWDIZ+YoLeqobRmcKQlBxX+5GAAEV0eA3N+VacgrFup8o4/C4a9Wq+dn
	 T1VwXkeSPx2m3zIl/q+eoKCvCcFx8kPE7zWXnEzDp++uHS4oAgZiyin3glu7MFhyS5
	 76t2Yhzi2uYpfo8Th87d5PfVKv7rzGbQgHV7KUTtrUlBzYgwnrZ2o28i+DVoUx62+H
	 I5JxNMWeiCF6bMKayAjVDiSRnNW4cybBYoMoKpvfsKz42LYlde189rsTK8ezCvk3R7
	 fY4vdq0X21OWE9Clx4zkY7LXosg6TziYJ+82CD3jnrj9JRo5AgGLyeUSZvzdPHJq/a
	 jRpt5606qc6tA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tjM7Q-004Pqp-Sc;
	Sat, 15 Feb 2025 17:38:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 03/14] KVM: arm64: Mark HCR.EL2.E2H RES0 when ID_AA64MMFR1_EL1.VH is zero
Date: Sat, 15 Feb 2025 17:38:05 +0000
Message-Id: <20250215173816.3767330-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250215173816.3767330-1-maz@kernel.org>
References: <20250215173816.3767330-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_093823_649206_51C29508 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Enforce HCR_EL2.E2H being RES0 when VHE is disabled, so that we can
actually rely on that bit never being flipped behind our back.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 0c9387d2f5070..ed3add7d32f66 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1034,6 +1034,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= (HCR_TEA | HCR_TERR);
 	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, LO, IMP))
 		res0 |= HCR_TLOR;
+	if (!kvm_has_feat(kvm, ID_AA64MMFR1_EL1, VH, IMP))
+		res0 |= HCR_E2H;
 	if (!kvm_has_feat(kvm, ID_AA64MMFR4_EL1, E2H0, IMP))
 		res1 |= HCR_E2H;
 	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
-- 
2.39.2


