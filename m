Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8143C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp//RcAwkIiXsAoKBEHLPhtlbiTqLHItI9SAe/2cxJs=; b=KGANyqOfnNakQbIC8t2LUCD8tB
	OgNeW7H8Zz2O7SYzqty8ghQOTRkBMnjgunoeJUUbBWlCkiIsQh+6sdDwf1m8l9Be+/rGFDz67MBsx
	R44+QN2IgIvI1/bJo4F3ppiMOtU7pUFQVFKVY5tKZqk98fwTp77howLKqa+1xNJKX9O+xLptnyx82
	YR8LCxFsH+Lj0f8JEjtheVlrTafi2j4umXTVwv1pev/T3Gxfn5aIbHg/082HrYX8a9UOqeU58Hmhm
	lpwbYCZFLJjfhxEj4ViIjZwAjJ+WY9HDWjZyr0vmf9mMaxbGkfsQCvdpNMqESudLBsEZY9dUOqMsH
	/UoQhpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2XtR-00000007ojF-1xXH;
	Wed, 09 Apr 2025 16:03:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrf-00000007oQx-2vyM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BF6A615F0;
	Wed,  9 Apr 2025 16:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98B82C4CEEC;
	Wed,  9 Apr 2025 16:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214482;
	bh=zE7v3woldsAMp5t8tth/aBX09I084DJo6S8fLNtF7O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WKHj/ihLzaVxsx9LYPSFuiDXKhLQsvp6KqIvU2nkc/yIvaYy+EiEPFQxX3Ms57jfm
	 Z940FggY4/aox71fBytDCLb90Qye4YDUur+tEHuPBhM7fG8Cl92RxP75tGta9Ib1//
	 f0HKW2q5ldVsq6Sc1hYTRD1dXqCXpWOZqRvXkN9TIcQ73PpzbsNknRjLg4laaj0vZR
	 jGb28sog+VVhYm/ofQxn0A/wkZSjFSRoNj3uAQQQ2SbuC69rN7df3h9SiweEwEAx5b
	 fPKL05UETM0J8LHOLV1G5+YqvL451CMZl+go3zVhiGhVt1ptJdWjqd40fQ5UV0y9K4
	 Mr4hnx0CM/1OA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrc-003vQT-QO;
	Wed, 09 Apr 2025 17:01:20 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 4/6] KVM: arm64: Don't let userspace write to PMCR_EL0.N when the vcpu has EL2
Date: Wed,  9 Apr 2025 17:01:04 +0100
Message-Id: <20250409160106.6445-5-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250409160106.6445-1-maz@kernel.org>
References: <20250409160106.6445-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Now that userspace can provide its limit for hte maximum number of
counters, prevent it from writing to PMCR_EL0.N, as the value should
be derived from MDCR_EL2.HPMN in that case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 73d68ea37ac21..00b5396492d51 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1216,6 +1216,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 * with the existing KVM behavior.
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
+	    !vcpu_has_nv(vcpu)	      &&
 	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
 		kvm->arch.pmcr_n = new_n;
 
-- 
2.39.2


