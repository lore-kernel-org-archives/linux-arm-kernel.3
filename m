Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE623108B8FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 21:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Np+muJSPlZbod40sapsZGz2P3odLvjj8gXyziZsaBA=; b=eW+1FfvAdbw8XCZJoFYk57UcsN
	dXKGozS+UwLbg2FA9KgPuy3/rgGpKA1GWIXZhMNX+1chhguXX8c6swhdC7C1ZJR3JA9HND0aHeufg
	5S4luMkyv9/bA+ilcDZe2ZU2RzJlSG5UJRBdSPHUNf5KdFmHpz/IAs0NsGOiuAAaDHWuXFw8Mt52b
	BlJJ9X1YN5aTMA2YRAxR9L7HJgH8owzb0Xn3PwJmbAYiJg8MKY+dAOdC6nZnf9C8IzZGwp+sLibtz
	AWbhcPR9xPOcnefOLze6pBSYUEqcMvjLmx2o2HTu2zHg/7sdf7er5WjWv2y5HZMOmWOT4dQQdIPCu
	nfIq5Xdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oM-0000000Enq1-3Nju;
	Sat, 21 Mar 2026 21:24:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43oG-0000000Enn9-1DKi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 21:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88E844454D;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C0ACC2BCB2;
	Sat, 21 Mar 2026 21:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774128278;
	bh=Onaqa9IKbnLKX/Vmgh2xBDMn59TUFd4xYAihYdZV7qk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNXVYwjLRTx4u9BNEE7LDSjuVNIww05omx5sxRRCxlQZ0xxk1Mhuy70J+4Xio00BK
	 4Yp59rAXiCsV0RIb9ISxzYteCEePrpZ+os4PwRxbbxuZYRMrjl/qj+ktWuXs43SRGz
	 fx1xFhsr7TC04yWtUfxDY4LsU3vyhBu01laQfRrpRU/rpc4YAHnK7XRb/x/552UkIL
	 qiFLfVRiA5t2Tg6WPHFoNNEh1ds1M6wKgPloH2qy7AJYXl1SCJ1kRFD6UqZuPBOcuh
	 E+rxmlQc0PSkJh6q80aasYVKJ44DOqURFkWe0wLAARz7paGq3M0sxl7RDZoYNWUk8/
	 4umdJU5/RX8Wg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w43oC-00000004NPB-2Cot;
	Sat, 21 Mar 2026 21:24:36 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH 3/5] KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an inner label
Date: Sat, 21 Mar 2026 21:24:17 +0000
Message-ID: <20260321212419.2803972-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
References: <20260321212419.2803972-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, smostafa@google.com, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_142440_343894_1974A735 
X-CRM114-Status: GOOD (  10.02  )
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

__kvm_hyp_init_cpu really is an internal label for kvm_hyp_cpu_entry
and kvm_hyp_cpu_resume.

Make it clear that this is what it is, and drop a pointless branch
in kvm_hyp_cpu_resume.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/hyp-init.S | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-init.S b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
index 55e0dce65dc56..2e80fcbff2dff 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-init.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-init.S
@@ -175,7 +175,6 @@ SYM_CODE_END(___kvm_hyp_init)
 SYM_CODE_START(kvm_hyp_cpu_entry)
 	mov	x1, #1				// is_cpu_on = true
 	b	__kvm_hyp_init_cpu
-SYM_CODE_END(kvm_hyp_cpu_entry)
 
 /*
  * PSCI CPU_SUSPEND / SYSTEM_SUSPEND entry point
@@ -184,17 +183,8 @@ SYM_CODE_END(kvm_hyp_cpu_entry)
  */
 SYM_CODE_START(kvm_hyp_cpu_resume)
 	mov	x1, #0				// is_cpu_on = false
-	b	__kvm_hyp_init_cpu
-SYM_CODE_END(kvm_hyp_cpu_resume)
 
-/*
- * Common code for CPU entry points. Initializes EL2 state and
- * installs the hypervisor before handing over to a C handler.
- *
- * x0: struct kvm_nvhe_init_params PA
- * x1: bool is_cpu_on
- */
-SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
+SYM_INNER_LABEL(__kvm_hyp_init_cpu, SYM_L_LOCAL)
 	mov	x28, x0				// Stash arguments
 	mov	x29, x1
 
@@ -223,7 +213,8 @@ SYM_CODE_START_LOCAL(__kvm_hyp_init_cpu)
 1:	wfe
 	wfi
 	b	1b
-SYM_CODE_END(__kvm_hyp_init_cpu)
+SYM_CODE_END(kvm_hyp_cpu_resume)
+SYM_CODE_END(kvm_hyp_cpu_entry)
 
 SYM_CODE_START(__kvm_handle_stub_hvc)
 	/*
-- 
2.47.3


