Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24355C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3aVbkVNhxYHlYXphDsNPgHjvQlt2dPh9HCkGNdiiPok=; b=ji/Kn7vuUvha1lAYUuVh7y0eUe
	2eO930hGJdhW1BwhyjycztCmcijZBqG7RJ2AYcG203E1/9AVp5ww17QyB3zTvwmkOB1C+57zOExdz
	uijPzm5jfJ+bUruSzD6SBQJfRNCiymWl6deb32YA5wUpoItQImJp2f5U0zW5g8f53FFlfSxXsWGUV
	rGLST/NziL55CtmUif1eVMFermDjgqq931FKhdfyFnCdsPRXq98rj9nwtaPGgcFa2UZA31n1aR6WK
	lmHR7NdP+FTg2gbo7y2X1RIpLo0Rg6HmnIYDcM9xNwjAJhX0S7xfBrGNZDJuVi49RRRHMrLGRxyCy
	6uFPQD4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Y3x-00000007qoj-0SEH;
	Wed, 09 Apr 2025 16:14:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrl-00000007oTG-2xtj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 16:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3aVbkVNhxYHlYXphDsNPgHjvQlt2dPh9HCkGNdiiPok=; b=G5IakAVzMgsF/qBXLysMnHY25l
	ZUKxrXlbiJYkONmIVXmQCO2Nsh1NIynswUJrIb969/OHtTHj4qxTHI4UCc2b5NvDWrIg2bHKSWkeJ
	5XJfPmJdxXYEs9crp/tlXgNRwb4ckO3Yl5N47nK/lOsVRCtpVESCNS9FBsOAq52y4FHOduKkHLY6p
	QOWqrTV7CeUkIET730e2Dkt3/fZbiiuAZMMfjsN7IUSxOqJIu30eE2vJSEuLvhYXe974N4Z7zhnGW
	iW9CkJOx0yV6RTNIxsAdRzCTbPDUaXuaeODj4FiPVjhMdbIujsr1/n3aDKx6OQWlpFlkS5712DL1o
	6tNvXrzA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2Xri-00000008eH1-2ts0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B43EBA42F31;
	Wed,  9 Apr 2025 15:55:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FE3C4CEE2;
	Wed,  9 Apr 2025 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214483;
	bh=rYySAFkrUl3rwkTZVsA1ukPFpQ8n71LCbrbnKAflhS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=igF6mfntyVeu9ndFC0ATZNSViG9A+1J9Oryak/8aIUQmx+yWfdJFJzEUnmdzyEUPz
	 mA2jxM0Q1D0TEt+iGJKaqMnqX6esuR+ek/DiY6ZrSfEl1R3WTFuBX3XA1oIaDlFVZR
	 Sjm9ALCsG0jJ0GG6Zjq1khMnEGDuiTHLJ8Op5Q5qSUh4+fRLFzQrmhtseO/LperUZc
	 lIDBo7nErKGjuDSqbYkKJAdb686T0Lm5KgqAuowccdxXlLgyI19Qju/hey4hjZuMjG
	 e+j0iGEiYU/AZv5rhVauXE2KcxmuiPWI2VMKXpF/2Z0L3xa0IFXl5Yl5iqoO8pQky+
	 +BP5pHtqxVWUg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrd-003vQT-7f;
	Wed, 09 Apr 2025 17:01:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 6/6] KVM: arm64: Let kvm_vcpu_read_pmcr() return an EL-dependent value for PMCR_EL0.N
Date: Wed,  9 Apr 2025 17:01:06 +0100
Message-Id: <20250409160106.6445-7-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250409160106.6445-1-maz@kernel.org>
References: <20250409160106.6445-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_170126_885568_4E1D2141 
X-CRM114-Status: GOOD (  11.11  )
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

When EL2 is present, PMCR_EL0.N is the effective value of MDCR_EL2.HPMN
when accessed from EL1 or EL0.

Make sure we honor this requirement.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/pmu-emul.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index 01fda19b0c825..f9edd0a2427c2 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -1295,8 +1295,12 @@ u8 kvm_arm_pmu_get_pmuver_limit(void)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
+	u64 n = vcpu->kvm->arch.pmcr_n;
 
-	return u64_replace_bits(pmcr, vcpu->kvm->arch.pmcr_n, ARMV8_PMU_PMCR_N);
+	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
+		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
+
+	return u64_replace_bits(pmcr, n, ARMV8_PMU_PMCR_N);
 }
 
 void kvm_pmu_nested_transition(struct kvm_vcpu *vcpu)
-- 
2.39.2


