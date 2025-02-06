Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 959B5C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 15:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X45a62k56lwR9fr8YuFWjT6Fie1pw0LqeLY7ejYlT1s=; b=eif1w5E+Nj7qZwYoJi7UuFBjTy
	j/MHCD4Nd26QkmDaZvLAdHc5I9p/d1QaHy3li8dqwN8EEQlRMuvSKiDxgbYPnFjwg8zlehdUpqqt7
	n1mEHJqA0Ktks45GtPYJYqN1LlIPb2bFJjFfns3hub6ruPVn8fDJmt/5B55VUEGstp4RS3b88PNZD
	WpzgHCTV5yb5kAlznb6pAsjEntfRnWe/0yH5vclEh5qDKN2F1wGQVBxHerP2R66DW9V+A0OOZZAwt
	3tKHtRU8ILRxF6XI5oDVQxVgsWVf1/u59prWvcdwo9klqtywvhkKj5I6YrIOauPXxV18olKk7Unby
	5iHzDqiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4F7-00000006m8X-2m6d;
	Thu, 06 Feb 2025 15:56:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg48N-00000006kxG-2kU3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:49:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CDC25C6403;
	Thu,  6 Feb 2025 15:49:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D8CC4CEDD;
	Thu,  6 Feb 2025 15:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738856982;
	bh=759YsdfsJcw2cqGhCi/rdhEHxXsqXffMe/i/ke2uCwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SmLFNkj7fmXAC/csfSbZSe4RW8YBzr1jJ8ZkcAvvGI3fYCUKJJahYH+LQmsYYlrIT
	 qcBEUSgxJzS+e52s587dRZjsDi3PHb6dRShR1KKsMtPQp1Cf8nIXGnE1pn6u2WuQ/b
	 Lzlxm88jzaJxMmH1y5YmOcES5O5KnpMzniI4v/1muqDghZdkB6HG84XXMY14H8/p8R
	 74zVUMu3bvmbWpXM0WDbZmOMJco0YpK6A2babAC64KKltIlnZ4x8rP9XoEaoSvt5EA
	 ZwabSBD9oFdLPwUDHIEGrKqxAsCgs139FgednhbgYo4QdmBvtx2rbxwidsZGnltgNS
	 Jp0PXUIW2HYqQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tg48K-001BOX-L9;
	Thu, 06 Feb 2025 15:49:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v3 07/16] KVM: arm64: nv: Sanitise ICH_HCR_EL2 accesses
Date: Thu,  6 Feb 2025 15:49:16 +0000
Message-Id: <20250206154925.1109065-8-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250206154925.1109065-1-maz@kernel.org>
References: <20250206154925.1109065-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_074943_754304_37196C54 
X-CRM114-Status: GOOD (  10.27  )
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

As ICH_HCR_EL2 is a VNCR accessor when runnintg NV, add some
sanitising to what gets written. Crucially, mark TDIR as RES0
if the HW doesn't support it (unlikely, but hey...), as well
as anything GICv4 related, since we only expose a GICv3 to the
uest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 33d2ace686658..1cb113ee1e17a 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1289,6 +1289,15 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 		res0 |= GENMASK(11, 8);
 	set_sysreg_masks(kvm, CNTHCTL_EL2, res0, res1);
 
+	/* ICH_HCR_EL2 */
+	res0 = ICH_HCR_EL2_RES0;
+	res1 = ICH_HCR_EL2_RES1;
+	if (!(kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_TDS))
+		res0 |= ICH_HCR_EL2_TDIR;
+	/* No GICv4 is presented to the guest */
+	res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
+	set_sysreg_masks(kvm, ICH_HCR_EL2, res0, res1);
+
 out:
 	for (enum vcpu_sysreg sr = __SANITISED_REG_START__; sr < NR_SYS_REGS; sr++)
 		(void)__vcpu_sys_reg(vcpu, sr);
-- 
2.39.2


