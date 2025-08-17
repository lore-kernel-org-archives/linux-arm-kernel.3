Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3A9CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 12:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RAaDDS9MZ8YdEaZ+j1UVCdv1mpYXirWWgJMgPaCD2y8=; b=ORNnW+c0zK65Vg1ixzZI+lgRNa
	KqsfBq1+fh0hEF7ok58jRIf35cc44CaZSf3kKBLzQE4jlAZO4rr9CdX2schrv7kHmWhofNz7fZtVj
	QngIjTlvVr53jRBFosZ1jYggfHHiNp0Fq7RQgxF4sU7efRO86rNBExgArJEn98MGTdGO9zE2xa0//
	PO/vB9aGRGFlLfP/ZZNEj6ugZaNE0XqGCSsJuE+qY+4IBTMqhzIleSWgBBf1tCEbr3arHHsZ8JVtT
	Q9pHwlztpZehQryspgv2pwzm81pDSMfEkpkIq50CzRsPoi8RcfMr8D608FStJN1LCK7CfF2QJpeZz
	SYWbk6MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncOt-00000005eFW-2OE7;
	Sun, 17 Aug 2025 12:22:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uncMJ-00000005e3M-0X6I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 12:19:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FE1560008;
	Sun, 17 Aug 2025 12:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDB3C4CEEB;
	Sun, 17 Aug 2025 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755433172;
	bh=6O3ZVvHdrs8pMLhU0xKvwyNZZW4I8MNdbGA++gTccPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=haZkg418UdG9q9K+quCbAsm664rxL+8kNtzH18ZgS0fCfu+nlW2yriUpd5A+IneKH
	 L2DV8LO4FU29iZlcMrPqqgPfyaynqRnj1grCZ5MEzwNFEyVPdAX3rBcN+VDuCM62Bi
	 VhR6RDzCWMxs+2KzBvXB6yGY92n1MSyUwsYFbLQJvElZek2LXwXDWbH6ZevoRJsY5X
	 skx+sVw7EHFn8Y5CHcBIC1CJ0LLWk5nlNCPga/jsO/L43Pk44Bu5TIryBg4C4Lk+oM
	 VjhslD36wcNmubmOOK+seE2GG0lqqdC/1kMDQkNt2gRkboV8KlALGBkjyFyQbpBPZc
	 dzUQeqSebYRPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uncME-008L0z-Hj;
	Sun, 17 Aug 2025 13:19:30 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH v2 1/4] KVM: arm64: Check for SYSREGS_ON_CPU before accessing the 32bit state
Date: Sun, 17 Aug 2025 13:19:23 +0100
Message-Id: <20250817121926.217900-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250817121926.217900-1-maz@kernel.org>
References: <20250817121926.217900-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, volodymyr_babchuk@epam.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
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

Just like c6e35dff58d3 ("KVM: arm64: Check for SYSREGS_ON_CPU before
accessing the CPU state") fixed the 64bit state access, add a check
for the 32bit state actually being on the CPU before writing it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/exception.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index 95d186e0bf54f..3e67333197ab2 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -59,7 +59,7 @@ static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
 
 static void __vcpu_write_spsr_abt(struct kvm_vcpu *vcpu, u64 val)
 {
-	if (has_vhe())
+	if (has_vhe() && vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
 		write_sysreg(val, spsr_abt);
 	else
 		vcpu->arch.ctxt.spsr_abt = val;
@@ -67,7 +67,7 @@ static void __vcpu_write_spsr_abt(struct kvm_vcpu *vcpu, u64 val)
 
 static void __vcpu_write_spsr_und(struct kvm_vcpu *vcpu, u64 val)
 {
-	if (has_vhe())
+	if (has_vhe() && vcpu_get_flag(vcpu, SYSREGS_ON_CPU))
 		write_sysreg(val, spsr_und);
 	else
 		vcpu->arch.ctxt.spsr_und = val;
-- 
2.39.2


