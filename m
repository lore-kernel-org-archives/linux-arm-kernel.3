Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A56FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS0xwMso+yCcvok/r94MuYfB3etF03m4rrkTQaFJ/mA=; b=OQgsfFewq0/DR5CLpWgQmmnEf/
	ZVzpSmZxaRcuEqTmIfGOb91gW711BqxRzO5biG0APUqsy4GwJb77KeNvsofKiGBbifzkmDFArtUk8
	jl3OCQ6LkPEOSvuHSo/EN93j7e80k8AnOz1sUmK0bs72dgxn/8aMiH2lXvkKLePeySJ8clCK4ePWy
	PLJ9PASv9FF9Je/jpd6aOmGjME7n53HF1esV/MwAbLxqFM1ceXRDBxnZJHLYcs7SjUBC/5Ug0CA0o
	B5CKTLAEkJJv7F3mVcqZcUGLXARDUjDAkRBpauyBfxWDUbLWXkgq/zJAQfr5a6PLUJElmAft3M8xl
	+abQCDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27Zm-00000003uie-2NUq;
	Tue, 08 Apr 2025 11:57:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26ZO-00000003kYh-1ogv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:52:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EC1F7614B8;
	Tue,  8 Apr 2025 10:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E056C4CEEC;
	Tue,  8 Apr 2025 10:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109561;
	bh=6xnfxO24XeMhZUOFnH7AZVi9lO940gonY1iIvv10IoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XkaEMeWL7T3raAwIOg9GQo3401h7UNEQWGsIrXyJHpCrTVkmLEhvqwrmDHI0oHx3m
	 Yjn5/CtG1hefl7Ihm50qVNiHYbR+w7dGSPuRtR0Dq4SeRXOfTz2ExoX8q1/ZKpITFg
	 xwjy0dTnCjxqE2jdgJd1n+N1KmT7MxxBkujgvNAQrEIUEQtFTdJpbbZ2JqHAlOV1sV
	 lQHkdjloCOY0xI5r1Fq6YqBg8oAHrOE5ijoJ8MkvT74qg42pP5gkLexZnWv4v50z6Q
	 bbv7F9FbpS4h8MPUakE0RVnUmuDNUugDrI+3smd8Qf6RXdDbZ6ZTOaJsLAGkLUbwn9
	 B6q05JjDWsWPw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u26ZL-003QX2-UZ;
	Tue, 08 Apr 2025 11:52:40 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 15/17] KVM: arm64: nv: Remove dead code from ERET handling
Date: Tue,  8 Apr 2025 11:52:23 +0100
Message-Id: <20250408105225.4002637-16-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250408105225.4002637-1-maz@kernel.org>
References: <20250408105225.4002637-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com
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

Cleanly, this code cannot trigger, since we filter this from the
caller. Drop it.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 0fcfcc0478f94..5e9fec251684d 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2471,13 +2471,6 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
 {
 	u64 spsr, elr, esr;
 
-	/*
-	 * Forward this trap to the virtual EL2 if the virtual
-	 * HCR_EL2.NV bit is set and this is coming from !EL2.
-	 */
-	if (forward_hcr_traps(vcpu, HCR_NV))
-		return;
-
 	spsr = vcpu_read_sys_reg(vcpu, SPSR_EL2);
 	spsr = kvm_check_illegal_exception_return(vcpu, spsr);
 
-- 
2.39.2


