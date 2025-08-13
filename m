Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8927DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 18:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DHr5Y65DV3cqelty19z309Jp5t+7WwudrPW9PN3r198=; b=Lg7b5cfECaioxei8udizkhGRpg
	HQQz9p+QZ8fCO5JbTsVq0CYiinCQMEwx9i4B6uBXOLwMWeyNNvKEYHBtmjye1H9JZqq0LK9jMwSP8
	m6X2pGtq4LXQftufOUXHxOZKgT4f0bL1udON3dSf6XHLq/h7KFIxTJ320avQTiLcSwj1l+wbHakdW
	VWoDKJrCNUTzTCGKKi8GnIfkSCc+MNxoqX3HHB9rP1eqYux/h56PkfGYeUWV1FruK82KkEYwiHy6L
	sAmMLbp4KFeHQyrZOuQMyELN9/av+rerx0ZXt1lh/zexesR6khK4zOKH+w4Z4DhQ6Hx0VmsZ7AGjP
	SGWPxtBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umFr8-0000000EeTd-0SDz;
	Wed, 13 Aug 2025 18:05:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umEU9-0000000ERJV-3X3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 16:38:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F7EF5C6B7D;
	Wed, 13 Aug 2025 16:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A78EC4CEEB;
	Wed, 13 Aug 2025 16:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755103076;
	bh=XaTAPeXA/rBryBYJZPO4Z48aKfyT2O49Yl0Pjy0EML8=;
	h=From:To:Cc:Subject:Date:From;
	b=Ej+BuRtHNSaFdrNsXUYWJ13uXDkHRinYP61Vfcdxg6xROgiNgaO+m6Nis3Jsj5nTO
	 JvYhaS0YtU1MIBnFOLff8vYl6xzbRcnf7SHVOcjq/owD2AULvMRAttV6QSCvNDAliS
	 m+SM1zqc6N6MS4SD05emaoFdD/YQ80NGVDHFmJCrQxogLbK9H9jMW6UntumOtd6J3y
	 6PeJRriiwkci9J9CoZUU7KboomxRduZvjBGnNEqEw+sXRyoGpWG7dKw1CIMzhLKqRh
	 hrhyTDrfplE5wcGcnojIFegzm5gTUVAkLJ9iqOslTidAn85sATnZB2GjVgkssoNkHa
	 xFNt/I+kLs4pQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1umEU2-0078fx-Sn;
	Wed, 13 Aug 2025 17:37:50 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] KVM: arm64: Correctly populate FAR_EL2 on nested SEA injection
Date: Wed, 13 Aug 2025 17:37:47 +0100
Message-Id: <20250813163747.2591317-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_093757_929185_432ED68B 
X-CRM114-Status: GOOD (  11.04  )
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

vcoy_write_sys_reg()'s signature is not totally obvious, and it
is rather easy to write something that looks correct, except that...
Oh wait...

Swap addr and FAR_EL2 to restore some sanity in the nested SEA
department.

Fixes: 9aba641b9ec2a ("KVM: arm64: nv: Respect exception routing rules for SEAs")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 90cb4b7ae0ff7..af69c897c2c3a 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2833,7 +2833,7 @@ int kvm_inject_nested_sea(struct kvm_vcpu *vcpu, bool iabt, u64 addr)
 			     iabt ? ESR_ELx_EC_IABT_LOW : ESR_ELx_EC_DABT_LOW);
 	esr |= ESR_ELx_FSC_EXTABT | ESR_ELx_IL;
 
-	vcpu_write_sys_reg(vcpu, FAR_EL2, addr);
+	vcpu_write_sys_reg(vcpu, addr, FAR_EL2);
 
 	if (__vcpu_sys_reg(vcpu, SCTLR2_EL2) & SCTLR2_EL1_EASE)
 		return kvm_inject_nested(vcpu, esr, except_type_serror);
-- 
2.39.2


