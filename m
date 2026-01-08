Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CA0D1D484
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 17:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwftNRQeJjUI0ZbN3tMvhSxKTUiZnovd3LdICquhFY8=; b=qC75jvmq3LQs7zyhlMFye62bp8
	QGzjdXKWKGjh9Fe/Yi2NJglmmDZeNMxIh0bfS8PdvTHgDh2trikQtdhAzlSUXiEaBmcXk3LLEDVaE
	f8V9E0OQcc2hkXfCNUVJH0RRvFnZVwlKvnLF5in0G3Rra3cI+sb3+TikavSus+nF+j0BYh0MiMEu5
	n4z+NNbZzVadRM+UdKH8lCv9phBkALzHuKoCSYWvnJxwPYDzdeBv3SRzll6VaZacl6sxm/GRZi5CB
	DIS6Xh6tRsmjex6DRMJ25B4AFAYz8spaY2ogDIi4FClJFnkMwuhJ18B3LL7XclGN1LBpbpx9R9yFU
	jPW1RfQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsK-00000000PUD-4Aep;
	Thu, 08 Jan 2026 17:32:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtsG-00000000PP4-1aIx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 17:32:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C871944382;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A6DC19423;
	Thu,  8 Jan 2026 17:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767893559;
	bh=Xj44DQdqV1S1FH+CaQ8UHzwqnVw9PNPNWxqnBoyEVeg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MVUsMFRYkph+uER7WXoXMczyseLyTDVw8fPZ9MRccIFRoQ23E2SfziK2peQDgNUv8
	 s7dyFi2m1SzJAE2nuk3pAVssSH/99yGWYZCn9OMcVCJtcXYWmXLO0jDlACSN9tHMK+
	 //iUYbgIDJsJJTl5hp7td1HvsH5McM/QL30I9tTiw2BdHmXuSIIH2XdHt9MQnRyvQs
	 ACETvTRGZPeMPKrfT4YH7NSh3wX6NEaaYyLgapkldMlI9wZKmPuE44iOSoKHE2vdjU
	 NRCi9LG7VFHIQNiZ20jvNrnJqVgZtMDIDiZ+8kp+4Z+MIk86uRnGXz/8rX2MYTb1Ro
	 fRmTpTbp1L4og==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vdtsD-00000000W9F-2zKy;
	Thu, 08 Jan 2026 17:32:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>
Subject: [PATCH v4 6/9] KVM: arm64: Force trap of GMID_EL1 when the guest doesn't have MTE
Date: Thu,  8 Jan 2026 17:32:30 +0000
Message-ID: <20260108173233.2911955-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108173233.2911955-1-maz@kernel.org>
References: <20260108173233.2911955-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, ben.horgan@arm.com, yaoyuan@linux.alibaba.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_093240_435995_430B2FAE 
X-CRM114-Status: GOOD (  10.79  )
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

If our host has MTE, but the guest doesn't, make sure we set HCR_EL2.TID5
to force GMID_EL1 being trapped. Such trap will be handled by the
FEAT_IDST handling.

Reviewed-by: Joey Gouly <joey.gouly@arm.com>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index a2b14ca2a702b..3de206b494849 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -5576,6 +5576,8 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 
 	if (kvm_has_mte(vcpu->kvm))
 		vcpu->arch.hcr_el2 |= HCR_ATA;
+	else
+		vcpu->arch.hcr_el2 |= HCR_TID5;
 
 	/*
 	 * In the absence of FGT, we cannot independently trap TLBI
-- 
2.47.3


