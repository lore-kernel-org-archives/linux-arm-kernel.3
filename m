Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28E0FC36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 16:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HB/KeedHIcYBQwAdtlGj8UPJK3krx+Z6vyhXvdjuxV0=; b=L8DgeX0Av9wj1ETIbj48Fg5p3U
	OIxg4OLndAmFgYEN/5ZFWv++BQzT+ccvKJtgR1ftUj6nWChIVtb3TqBnSbhxmLqJ1X9wO4MXNGdCR
	b5p/Evp4wmxqiX8MK4oFQ2JyjXLx5vmuKPQYFhzT1hDD3EhIVSwC+Avvsnmve3qbKTVYw1v/+zyku
	FOdeo3zc4iwJn0VvJeAqfFXOnEBHFcWN7X5nhHPuj6X1tYvg89xpdVJrujnXWn7QPNCsLFgV5rFB7
	tw7LifK7KMBtAvQVzyo76bJeIuTdxsXwi+CF7bTNOFls5L5squlm3wOuKeJgpVnMKV0YmfBlWeo8n
	hgFiuA0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Y2C-00000007qVY-1J22;
	Wed, 09 Apr 2025 16:12:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Xrf-00000007oQy-1wHa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 16:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AE5D4A241;
	Wed,  9 Apr 2025 16:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B9AC4CEE8;
	Wed,  9 Apr 2025 16:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744214483;
	bh=8mEdxvOC5T+jehc1hdND2pdEUIdwpcqKS0/iY/34BZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbWfuTFT99xv6dy2IOfih3K2bOu/CSuaV96aTfpFZU+bGshZwqU7pu76gXrmO4RXH
	 bQslf8dJbkbNzI9vaOVfz0SZMZNnsPRxLl1MAFuVmaPa+Rq/X30aTX+BEAV/qLnLhc
	 NfMTFQpGOZG4RgogeABhJfRhP57nKI5qyxfpLklyAOjFcuoRVU2rzsckUbHa000nOy
	 W5HNCJVjgt/BINfJWk4rjh71LHTv/UzJJTUAMgtUpzUmRRX81YMF2sQxtIa1ir6FpL
	 xT1EKtTj0vbhtnRHY7yi/12sGr2EY/ZDgT9H1gr93z5O69+XCGug3PYj/e52JcekvH
	 uawdQb6y7/biA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u2Xrd-003vQT-15;
	Wed, 09 Apr 2025 17:01:21 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 5/6] KVM: arm64: Handle out-of-bound write to HDCR_EL2.HPMN
Date: Wed,  9 Apr 2025 17:01:05 +0100
Message-Id: <20250409160106.6445-6-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20250409_090123_524251_BF114255 
X-CRM114-Status: GOOD (  14.74  )
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

We don't really pay attention to what gets written to MDCR_EL2.HPMN,
and funky guests could play ugly games on us.

Restrict what gets written there, and limit the number of counters
to what the PMU is allowed to have.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 00b5396492d51..e53b8f82ca7f8 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2571,17 +2571,33 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
 			struct sys_reg_params *p,
 			const struct sys_reg_desc *r)
 {
-	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
+	if (!p->is_write) {
+		p->regval = __vcpu_sys_reg(vcpu, MDCR_EL2);
+	} else {
+		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, p->regval);
+		u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
+		u64 val = p->regval;
 
-	if (!access_rw(vcpu, p, r))
-		return false;
+		/*
+		 * If HPMN is out of bounds, limit it to what we actually
+		 * support. This matches the UNKNOWN definition of the field
+		 * in that case, and keeps the emulation simple. Sort of.
+		 */
+		if (hpmn > vcpu->kvm->arch.pmcr_n) {
+			hpmn = vcpu->kvm->arch.pmcr_n;
+			u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
+		}
 
-	/*
-	 * Request a reload of the PMU to enable/disable the counters affected
-	 * by HPME.
-	 */
-	if ((old ^ __vcpu_sys_reg(vcpu, MDCR_EL2)) & MDCR_EL2_HPME)
-		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+		vcpu_write_sys_reg(vcpu, val, r->reg);
+
+		/*
+		 * Request a reload of the PMU to enable/disable the
+		 * counters affected by HPME.
+		 */
+
+		if ((old ^ __vcpu_sys_reg(vcpu, MDCR_EL2)) & MDCR_EL2_HPME)
+			kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
+	}
 
 	return true;
 }
-- 
2.39.2


