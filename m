Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 18:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b57fUmXrFyOVzzlOsTfO/957aLg/iVp6bk7RPxjuoQ=; b=BG6/omvM/IyagQE3OlakLAbwhO
	byFF5vumTZAwkFqc2J1j67sDAcPleBx2kCoX9g+IwP+TrKz9Qbl4e9+tNPHTag7QELqmhCxBx01Px
	UH0oQOVvZAf1X8TShPqs6/BGluew+KBRtAsw/esDkKZf7TTx6aTsjA1MkVuNEp6hefWeJtsD65YqD
	JxA9/D1lCzRQ2ji1KTEoNOlL898BXBsk8rCtx8/nVfHVCLLV7+XTzhh5UEvZTZRPQV7BQV1DKT4Vv
	4j8wmqzJMr1Kj3BmV/hmwcxFFC1rj5VpvfOyP1ulKwpcd8B8tlhUFdG1KMxM4YMN4wIP46090BQ9s
	awgBUlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsa-00000004uMg-0m1I;
	Thu, 02 Jul 2026 16:03:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJsU-00000004uCs-1gNz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C122B601F1;
	Thu,  2 Jul 2026 16:03:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77C271F00ADB;
	Thu,  2 Jul 2026 16:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008181;
	bh=3b57fUmXrFyOVzzlOsTfO/957aLg/iVp6bk7RPxjuoQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hGD/5/isl1tuVmv4gPdYEju4C4j/QC/2bzeGeO6fLt78Wrcf5aOFZMpynKQwILnBQ
	 KV01VT2CKjp9ob3F86U0N/eOh928NCykEvhmRg26XRkDxg5G9M9Dak4EiGUJGLcnyj
	 SrcOsrNvD0xwb7MW6t4sVVJyTkBPXGyq+nbxYEwvI58CGM5RbhWFd0KxekWjae3vSM
	 5DDO/0TcVvBG7d8Ak8alGnhSQ2A5RccdwMequV+KX5mfPcYkDCvvsuyBU5CRgNc7+y
	 /rg2UYHBldjh89aB/HeEZBi2GZy6uCD6cuGIZ5Z4PoyK2jJUQH4Ug3aOYMMoI1IWkZ
	 0jr/f8CLY1oXg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wfJsR-00000000ojd-2FZi;
	Thu, 02 Jul 2026 16:02:59 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 07/28] KVM: arm64: Don't evaluate HCR_EL2.NV on ERET fast path
Date: Thu,  2 Jul 2026 17:02:27 +0100
Message-ID: <20260702160248.1377250-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702160248.1377250-1-maz@kernel.org>
References: <20260702160248.1377250-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
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

We currently avoid using the ERET fast path if the guest has HCR_EL2.NV
set. This is an odd check, as  NV doesn't mean much if HCR_EL2.TGE==1.

Replace this bizarre check with is_nested_ctxt() which makes a lot
more sense: if we are running an L2, the ERET trap must go to L1.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d5..3b76e0468317b 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -349,8 +349,8 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 	 * Unless the trap has to be forwarded further down the line,
 	 * of course...
 	 */
-	if ((__vcpu_sys_reg(vcpu, HCR_EL2) & HCR_NV) ||
-	    (__vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_ERET))
+	if (is_nested_ctxt(vcpu) ||
+	    __vcpu_sys_reg(vcpu, HFGITR_EL2) & HFGITR_EL2_ERET)
 		return false;
 
 	spsr = read_sysreg_el1(SYS_SPSR);
-- 
2.47.3


