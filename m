Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78F1D5CCB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 10:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Dc4LLdCmlkY4EowmjvFRKco8cy143ukTnzbekLwxxo=; b=Q/XqnX3BYN5MKororc3jig6w4U
	F4ZJO2thtPmnvkK1e02vipW+4y2Bzk2fNZoHD6dkNKHKN0MchQP/Zxk5lDJ1u7X8em1znq+58EiVd
	xowNNnDv0q9nAqRiMoR+WtYg47Hlths/+whII/sXQ+UUm8+lu5PdeZ0aH+DcorhBW2cJI6sNHJK2D
	KJLoUIaAN34UrjQj1MO0kYjAtLpre4k4pqrm+GOGoMnxdEoo+he26uyegkEbMLJJvGgewxinrkESc
	uinCDrIVtHGoD1gJGKfxrU+HNPN/d9SVLyI33Wh8dRTct0pFJSL6dpy5AEStIaLXNMHVb5MUqZJ1s
	nIBDxdtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSL5-000000052ZY-2QPC;
	Tue, 16 Dec 2025 10:31:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVSL0-000000052WZ-226x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 10:31:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EF3B1655;
	Tue, 16 Dec 2025 02:31:18 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8FEEC3F694;
	Tue, 16 Dec 2025 02:31:23 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	qperret@google.com,
	will@kernel.org,
	tabba@google.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 4/4] KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()
Date: Tue, 16 Dec 2025 10:30:53 +0000
Message-ID: <20251216103053.47224-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216103053.47224-1-alexandru.elisei@arm.com>
References: <20251216103053.47224-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_023126_570710_DD9E0656 
X-CRM114-Status: GOOD (  10.52  )
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

synchronize_vcpu_pstate() doesn't make use of the reference to exit_code,
remove the parameter.

Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c        | 2 +-
 arch/arm64/kvm/hyp/vhe/switch.c         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index c5d5e5b86eaf..afecbdd3c1e9 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -854,7 +854,7 @@ static inline bool kvm_hyp_handle_exit(struct kvm_vcpu *vcpu, u64 *exit_code,
 	return false;
 }
 
-static inline void synchronize_vcpu_pstate(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline void synchronize_vcpu_pstate(struct kvm_vcpu *vcpu)
 {
 	/*
 	 * Check for the conditions of Cortex-A510's #2077057. When these occur
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index d3b9ec8a7c28..779089e42681 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -211,7 +211,7 @@ static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	const exit_handler_fn *handlers = kvm_get_exit_handler_array(vcpu);
 
-	synchronize_vcpu_pstate(vcpu, exit_code);
+	synchronize_vcpu_pstate(vcpu);
 
 	/*
 	 * Some guests (e.g., protected VMs) are not be allowed to run in
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 9984c492305a..9db3f11a4754 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -536,7 +536,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 
 static inline bool fixup_guest_exit(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
-	synchronize_vcpu_pstate(vcpu, exit_code);
+	synchronize_vcpu_pstate(vcpu);
 
 	/*
 	 * If we were in HYP context on entry, adjust the PSTATE view
-- 
2.52.0


