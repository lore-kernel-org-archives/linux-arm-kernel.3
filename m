Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58CEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3rSHJreGoaADlAiRFL0ez0+/BHUXJFX6FSdatFOSpG8=; b=vor11SC3VCCrLS7Zl7RrjIfWgP
	w6/EznrVd0pNc8wqCRVXOA9ltUVzIFYRyhZ+2W4w4rNR4Fc2RT4hLfoOWd3Dk09yvnbqlIUazibDW
	sUG0ykezi8sVaRUHjfcqGcdZwI+LwLCtiFAUI/CUeF8xs4VfPEwQe9m+xYAl0eg+xmg1E51Zw8gMI
	yR1GziBwsgaa4vItPWH0XSXkcSHdGV4Zdby523pF5jZJzIa40kKR0LaL50xR6AN+BCIZ8npRYyXfG
	v6VhqX238DLV8y3EZTjJsbwfQIlGSAQyer6kWoUXtz7YdsTCuNCggd6GSCgQP5Crmw2L3TdQGNLzr
	FevrjpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMEd-0000000Btjd-42cn;
	Thu, 03 Jul 2025 15:52:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXKRv-0000000BZHl-3rPI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 13:58:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24F081655;
	Thu,  3 Jul 2025 06:57:49 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D8D7B3F63F;
	Thu,  3 Jul 2025 06:58:00 -0700 (PDT)
From: Ben Horgan <ben.horgan@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	linux-kernel@vger.kernel.org
Cc: james.morse@arm.com,
	Ben Horgan <ben.horgan@arm.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Fix enforcement of upper bound on MDCR_EL2.HPMN
Date: Thu,  3 Jul 2025 14:57:28 +0100
Message-ID: <20250703135729.1807517-2-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703135729.1807517-1-ben.horgan@arm.com>
References: <20250703135729.1807517-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_065804_019505_CA52F949 
X-CRM114-Status: GOOD (  10.07  )
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

Previously, u64_replace_bits() was used to no effect as the return value
was ignored. Convert to u64p_replace_bits() so the value is updated in
place.

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Fixes: efff9dd2fee7 ("KVM: arm64: Handle out-of-bound write to MDCR_EL2.HPMN")
Cc: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/sys_regs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 76c2f0da821f..c20bd6f21e60 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2624,7 +2624,7 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 	 */
 	if (hpmn > vcpu->kvm->arch.nr_pmu_counters) {
 		hpmn = vcpu->kvm->arch.nr_pmu_counters;
-		u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
+		u64p_replace_bits(&val, hpmn, MDCR_EL2_HPMN);
 	}
 
 	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
-- 
2.43.0


