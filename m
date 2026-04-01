Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B88D35176
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS9PF57/C1bk2tmpDLOGh6WDuLdtt2ZCyoEjWJ37rHw=; b=2ikbi1fTakwZ67MCs800k1Y76w
	NfTXwP3EXnWOdqdlwuzgj83L4qhJrrSbduOVDrrjskBCcWIP1T4gIFwPnbJlpM5sBbjAnyfocih5F
	N3FxDjQPCNQDHivlMyFl84GUSyqHNnUSizZn3KBAB8WrhlkP5yfoNmj4vkd+IcZGoM/LfWCv+ERrM
	1xntFe22fkZnpVNugYxbx0E4EnOPj6v31g3Qqonn7j6XjRQSqlasxSozZNRA2c+1eHqQJo1UrkTru
	Vx/EGq2UmIYKuBmmAFPrWzGu0//kli61VYTFlW6kSGnLMXLX+NKmKOBZ115I8VUbg4PC8zX2q6UiZ
	atd/qH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swC-0000000EWMa-18Cp;
	Wed, 01 Apr 2026 10:36:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw5-0000000EWCD-1JzZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F35D340820;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6758C2BCB5;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039792;
	bh=3N8Es+J9SHXb1LH4kFixxcN/1+h78f4vRX6JJRGxg6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hx+B6sD+msfwXlp8i73Z7Ny5eibir9ie5wxDidGL6n5CjpeLoQrxM/TL0H8oOcWY8
	 I6YQXhbelfO8sdjAPunu5ElLlz5jRb6q6mwA9yteqRqfXXUCVx9o6aJ+OIRC0kRkXA
	 OV8+mTn8I0y7agJ3YW/r1x+QIGj3XnHuzl5QhMYtbvr3uH+nnYBZndkuAb4c97Z39F
	 fhZy9zX62pkNOunqkI7WC8cjjHtdHXoEO7itYUfPA1fpJ2fe8TP+Eu0JuxLF0PujkV
	 QtHvMAIeArpN2XrnDey8I2Dt1IN0oarkB8ZZkA12RJZ9OJqFHYUbWiWYvdrEvHBqHP
	 ELmLhKmZ1uExw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw2-00000007oRQ-4169;
	Wed, 01 Apr 2026 10:36:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 08/16] KVM: arm64: vgic-v5: Cast vgic_apr to u32 to avoid undefined behaviours
Date: Wed,  1 Apr 2026 11:36:03 +0100
Message-ID: <20260401103611.357092-9-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033633_370902_CCAC2749 
X-CRM114-Status: GOOD (  15.22  )
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

Passing a u64 to __builtin_ctz() is odd, and requires some digging to
figure out why this construct is indeed safe as long as the HW is
correct.

But it is much easier to make it clear to the compiler by casting
the u64 into an intermediate u32, and be done with the UD.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: 933e5288fa971 ("KVM: arm64: gic-v5: Check for pending PPIs")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 422741c86c6a8..0f269321ece4b 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -212,7 +212,7 @@ int vgic_v5_finalize_ppi_state(struct kvm *kvm)
 static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 {
 	struct vgic_v5_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v5;
-	u32 highest_ap, priority_mask;
+	u32 highest_ap, priority_mask, apr;
 
 	/*
 	 * If the guest's CPU has not opted to receive interrupts, then the
@@ -227,7 +227,8 @@ static u32 vgic_v5_get_effective_priority_mask(struct kvm_vcpu *vcpu)
 	 * priority. Explicitly use the 32-bit version here as we have 32
 	 * priorities. 32 then means that there are no active priorities.
 	 */
-	highest_ap = cpu_if->vgic_apr ? __builtin_ctz(cpu_if->vgic_apr) : 32;
+	apr = cpu_if->vgic_apr;
+	highest_ap = apr ? __builtin_ctz(apr) : 32;
 
 	/*
 	 * An interrupt is of sufficient priority if it is equal to or
-- 
2.47.3


