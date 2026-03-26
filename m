Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65FA310A88E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eazg1xSEr+aLTfVhcW0AjsiDqQScz15Si7eSLhZIig=; b=U0HtXicLAmjXZxex57p+xTID5X
	HbDDumkn0pg08h8xMbsIktoJvTF3zoAYhDUwxME/IdCGj/y7RUE/yz+QACj3o1RcQfYxKhAY/us+G
	4+uGJPPasLOlxKv4H0eE6rQTvG/vLOh+rhCRoh48Jvce0dlxN8vWiYJbloWAGUB9XzZ3akYkcSqdH
	M7sGP3aF9US0Qj5LNVigBWXXLJ9a7U0SlvBXlk7OXK1Qp4mVnkgyK6mLnJz7vVLL5+9/xZW2VJaJQ
	syoHTmJXryXVTeJ4Ak9iGXHx4pxWshnpUabhIFHeUGrpbBPrwRaYpzARe8S1Itc3UUAf2WUzzfYel
	r55e3qTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkS-00000005lJD-1okL;
	Thu, 26 Mar 2026 15:35:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkG-00000005l5v-2KdC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D9F744537;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821A3C2BCB0;
	Thu, 26 Mar 2026 15:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539338;
	bh=X2z8X6rHDBS/ktebmAl20fvzse7Qj/XBiyUddzvLCrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UK98II3EpKXhME17ddEr7eGlZV+vBC8M+crQBDRlwl6gqnAzfRbq92io3BqfZDOX8
	 JEMCRspC2uA/2f27pUJQzO9UnxUXUSprsnaB2jfvyiSqYxK55KHFAdZpX4HhoW4AlX
	 SU90DrJzMFfRMkAzQvX0X3Yn6QeEky+wUdiW4UIeOaURgsnfOs5Y8CGZ/d7BnDko58
	 27Efo1OOFIKGxLyNq5n2W1sgvc5J44ZkGW3b4ObGEKENeLMcPvyyYn/HTsdxw0NUKR
	 udod/3sNfHrFDsDw+S0IfuSD3HZqnaJHXOTAJQQX0gHienIEueOHvcSBTL9XCpgJUQ
	 wntOhpw1MWY6Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkC-000000060II-3TUj;
	Thu, 26 Mar 2026 15:35:36 +0000
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
Subject: [PATCH 12/15] KVM: arm64: Remove evaluation of timer state in kvm_cpu_has_pending_timer()
Date: Thu, 26 Mar 2026 15:35:27 +0000
Message-ID: <20260326153530.3981879-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083540_858084_92D35DD6 
X-CRM114-Status: GOOD (  14.12  )
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

The vgic-v5 code added some evaluations of the timers in a helper funtion
(kvm_cpu_has_pending_timer()) that is called to determine whether
the vcpu can wake-up.

But looking at the timer there is wrong:

- we want to see timers that are signalling an interrupt to the
  vcpu, and not just that have a pending interrupt

- we already have kvm_arch_vcpu_runnable() that evaluates the
  state of interrupts

- kvm_cpu_has_pending_timer() really is about WFIT, as the timeout
  does not generate an interrupt, and is therefore distinct from
  the point above

As a consequence, revert these changes.

Fixes: 9491c63b6cd7b ("KVM: arm64: gic-v5: Enlighten arch timer for GICv5")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/arch_timer.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 37279f8748695..6608c47d1f628 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -402,11 +402,7 @@ static bool kvm_timer_should_fire(struct arch_timer_context *timer_ctx)
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 {
-	struct arch_timer_context *vtimer = vcpu_vtimer(vcpu);
-	struct arch_timer_context *ptimer = vcpu_ptimer(vcpu);
-
-	return kvm_timer_should_fire(vtimer) || kvm_timer_should_fire(ptimer) ||
-	       (vcpu_has_wfit_active(vcpu) && wfit_delay_ns(vcpu) == 0);
+	return vcpu_has_wfit_active(vcpu) && wfit_delay_ns(vcpu) == 0;
 }
 
 /*
-- 
2.47.3


