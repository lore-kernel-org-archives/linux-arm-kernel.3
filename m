Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B6CCAC59E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 11:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juVlkaqc60SCZZV4qb/RKOdcFDaO35Z2ogMnii6jLCo=; b=37KUIo6062M+hJI6dDf1/OaTPI
	mj8QBba+Q3A4qFYb9+7sl/FjN0GTk4X8MDrO4SMGUDq+ED72YoeuEKsDEpbN33GzF0tral5U1ZVda
	AxQWkRVSGwRHiDto8Rtzct9ZMgr4iF75ExiZzENRXO4N0TqfNztrO7N6O53kAffviYdKhuTA7cz8Z
	tRAfPlqTSoI/NtAYqLmzLJL04KOTWWcm6qWd3U+Xzm7FbnkcKmiJhjk6T1p3y2KTQh1S2y+KNLbPC
	IDsfkj+hI5U9d+nODvyu05Ua9a62SSv8rF72yZ3cMxMZz0v6cOlKoGEPgR4hKYnLEX3i01/a+/Qnk
	KLYpZ3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7e4-00000003xzI-4A5N;
	Mon, 15 Sep 2025 11:45:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy7dk-00000003xeM-0LMa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 11:45:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D9A2160250;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8320C4CEF5;
	Mon, 15 Sep 2025 11:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757936699;
	bh=z2QNt9RWN4zT8Ci51cyrFFeAAtDEFGBEVB1qDDNY7qw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J0Xq/kLBiiv/ouO4uVwk2aqCB5U6PtbxQWGSwhfhR+MITR5M5Wq0R7ZKw0SqaUFzn
	 9njR3osRvpNSKnQcUYEvd3Bfw/S3vD9okXHcflEVSGNZj9Tx+JhOpifwu2fg3pawZ5
	 6OmH1mwxJdzECiGQGuWoRrp1bcXEnIY3iTdf0eBVODRssLICOCBYJTjw5ybTZBXlkx
	 1kkT+x/CXfbunvRr/DQDYL/zIxVSmtDzdN+2CBAPRT80vqhjoU9IR553zbQ9emcDuz
	 jUmIaUiEyFM65NyVBy1Hn+e+LAqW1aqLRyZyUKi1xCpVKMzK1yeUFpQXYNEkFf+J1q
	 YZZ98a5e5JgEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uy7dh-00000006MDw-3r8g;
	Mon, 15 Sep 2025 11:44:57 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 15/16] KVM: arm64: Populate level on S1PTW SEA injection
Date: Mon, 15 Sep 2025 12:44:50 +0100
Message-Id: <20250915114451.660351-16-maz@kernel.org>
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

Our fault injection mechanism is mildly primitive, and doesn't
really implement the architecture when it comes to reporting
the level of a failing S1 PTW (we blindly report a SEA outside
of a PTW).

Now that we can walk the S1 page tables and look for a particular
IPA in the descriptors, it is pretty easy to improve the SEA
injection code.

Note that we only do it for AArch64 guests, and that 32bit guests
are left to their own device (oddly enough, I don't fancy writing
a 32bit PTW...).

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/inject_fault.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index 6745f38b64f9c..dfcd66c655179 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -106,7 +106,30 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 {
 	unsigned long cpsr = *vcpu_cpsr(vcpu);
 	bool is_aarch32 = vcpu_mode_is_32bit(vcpu);
-	u64 esr = 0;
+	u64 esr = 0, fsc;
+	int level;
+
+	/*
+	 * If injecting an abort from a failed S1PTW, rewalk the S1 PTs to
+	 * find the failing level. If we can't find it, assume the error was
+	 * transient and restart without changing the state.
+	 */
+	if (kvm_vcpu_abt_iss1tw(vcpu)) {
+		u64 hpfar = kvm_vcpu_get_fault_ipa(vcpu);
+		int ret;
+
+		if (hpfar == INVALID_GPA)
+			return;
+
+		ret = __kvm_find_s1_desc_level(vcpu, addr, hpfar, &level);
+		if (ret)
+			return;
+
+		WARN_ON_ONCE(level < -1 || level > 3);
+		fsc = ESR_ELx_FSC_SEA_TTW(level);
+	} else {
+		fsc = ESR_ELx_FSC_EXTABT;
+	}
 
 	/* This delight is brought to you by FEAT_DoubleFault2. */
 	if (effective_sctlr2_ease(vcpu))
@@ -133,7 +156,7 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
-	esr |= ESR_ELx_FSC_EXTABT;
+	esr |= fsc;
 
 	vcpu_write_sys_reg(vcpu, addr, exception_far_elx(vcpu));
 	vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
-- 
2.39.2


