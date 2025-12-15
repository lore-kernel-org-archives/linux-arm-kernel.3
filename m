Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B0DD5B16E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 11:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPcPuWaIOsKMVKwQuBDbtIn+v4eCgwXzOAb5wQrm7Tg=; b=eUeUEv5H9GGztD5DBFTX6JKYE3
	RDUP0xVd3hsZHAKjuhzMnGEsHnRo4Qw+lH7aySstYBCLcGedma7+5tRN5uzvZyiue/BlFPyafKmC0
	i+zS4+vVfO5XaGvazZCwiYOFuUB4zEOaH+S9s2YphNQXOs37ddCiLXxakTuw9WsVkhmVJA6jz7bdH
	Al3WJeFLW9yQPnLGRGKc05CVtyBMiqaEE9iJ61iGZt06yAWKIaZZox4xoWkh8empjjka94MNxZEOi
	e5ZYXIdMhBVOH4UohUTfIClruOHEBDTYGCdFVADwVLIumnFrpmnMakEZurq2K6+z6bKEzlnJxq7qt
	UBlWMlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV70J-00000003Y3L-2xS8;
	Mon, 15 Dec 2025 11:44:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV70E-00000003Xzt-0oDQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 11:44:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBB621684;
	Mon, 15 Dec 2025 03:44:25 -0800 (PST)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46D2F3F73B;
	Mon, 15 Dec 2025 03:44:31 -0800 (PST)
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
Subject: [PATCH v2 4/4] KVM: arm64: Remove unused parameter in synchronize_vcpu_pstate()
Date: Mon, 15 Dec 2025 11:44:09 +0000
Message-ID: <20251215114409.212512-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215114409.212512-1-alexandru.elisei@arm.com>
References: <20251215114409.212512-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_034434_296302_2501F831 
X-CRM114-Status: GOOD (  10.74  )
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


