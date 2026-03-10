Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3B6FD2D6F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 12:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjEHtrJ78MYHEp21ejNh5LanY+xm4uc/Zo9pOF+NIDo=; b=zj5dLaiIYDPHgYPppXQzx615BJ
	YGfb54Aj0GekfKJFZWK2K3xc5vjj0I9Mz2CVvDNzFc7eTnGyGyTTYhpEZ73G88GuZhI4bYBzgrwec
	MC+Nhlzt9TphJwfZ+UUuFKREcEbOaJLJTgy094obOBZj583ubapeMWQyN+n+oeOYln5E4vkXTDttD
	oCJXV3cLDk/t6xUAo6z0A0PjFQuDW6pIkkqN2C1zSDz4PBi0V0EQxA3jSx6PW6i9xVD4xBOWDRw5v
	8oFPHi6qO65L7rMUKYmK2ta2eH4XvaThJuAl23BmeQiZ0zxnLTLqddK7iSr9TpWHlwcQS3Q/vHlWQ
	Uk+Vbu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWz-00000009W4b-0KBW;
	Tue, 10 Mar 2026 12:49:49 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzwWw-00000009W2h-3bWP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 12:49:47 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-483786a09b1so16870995e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773146984; x=1773751784; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjEHtrJ78MYHEp21ejNh5LanY+xm4uc/Zo9pOF+NIDo=;
        b=HLw6NixXuVp4Xh4y1JOKIyUtX1pnsjTAoARfrOzWYLwY+QuBc6w9ebxsuc3NRzTYm2
         cdNHIDVmZwuEeoxut90FxaQBjsQidmKW1YFU3XuH2RUvePROYY+2JkEjYyHrRzqPY13c
         WUf6RP0rXmdm1+yxQjLes2NwyBslGJaGqKPOViKKf/k1zsF6wZnOwW2DenWAbMTDXibl
         jp76N6P+kPxe4z72meiwZFRczkim1sLUgOoezNhQUg7j2tk5bMzGfoPm6r5qw2oxGotm
         P/sZ+iZ/KGb6N0nz07eQgQc90f7dKnniximpFxX2Q96uVZFBBpsXAYpAz7bPj6Ke/E4G
         JM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146984; x=1773751784;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FjEHtrJ78MYHEp21ejNh5LanY+xm4uc/Zo9pOF+NIDo=;
        b=gDQRblC4dGPm9+o2uVm2XuDjLPq2C362Sw5EBGzf4S8LOjaSqRZg8p6B7v1BXtXFv4
         qLincW4+FHvSkqhGNH1SvBHx8ElyWUngb+e7DZNPno0nkg/ZZN7sLgyFF0fujnXCITca
         JZ1UyNseQlkL7Mh5hzBgtOn/bI58cWiQ36si6mfjtxelQXTbx4MDgyGOjTcZ2hNYqytQ
         0zlkqtVugfxUkqgtmgk4X7KZo978QgDhKdlQoUqt7QDXZfKxeaP421WoVgH7f9cHgSiU
         GqSxgR3Q938vkGhX7QMUxa8s/QN+Dq/7AeYDtc7YHRuKu8JROTA4T7oZ1AEoSriL94ZM
         1RFA==
X-Forwarded-Encrypted: i=1; AJvYcCWabArSk7PnmSElbqoC67J+45z6KZOj8r8EvfRBanVxkHIQzZR9JuW94qc0vMqizez/FO7/khKDHMeElUxHFn+q@lists.infradead.org
X-Gm-Message-State: AOJu0YyckuNplxL/fyDeKNiYZm9PrD/MFYecQ4NBsstqUL3hTSs9q9cR
	gHQvSRnCpP3oQBXerDIDDQFDP3Z77qOlzPx+XH2W7koTRubLzKkymUI9spyv3uYRQ7MRO5IN1Ho
	tGxZGx2kFTlszTGSMDLgozNJHE0+yAg==
X-Received: from wmqn19.prod.google.com ([2002:a05:600c:4f93:b0:483:a1ee:5eb8])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc5:b0:485:3b34:2f62 with SMTP id 5b1f17b1804b1-4853b343050mr131705485e9.14.1773146984437;
 Tue, 10 Mar 2026 05:49:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 12:49:21 +0000
In-Reply-To: <20260310124933.830025-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20260310124933.830025-1-sebastianene@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260310124933.830025-3-sebastianene@google.com>
Subject: [PATCH 02/14] KVM: arm64: Track host-unmapped MMIO regions in a
 static array
From: Sebastian Ene <sebastianene@google.com>
To: alexandru.elisei@arm.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com
Cc: catalin.marinas@arm.com, dbrazdil@google.com, joey.gouly@arm.com, 
	kees@kernel.org, mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, 
	perlarsen@google.com, qperret@google.com, rananta@google.com, 
	sebastianene@google.com, smostafa@google.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vdonnefort@google.com, bgrzesik@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_054946_933757_75620AF7 
X-CRM114-Status: GOOD (  16.02  )
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

Introduce a registry to track protected MMIO regions that are unmapped
from the host stage-2 page tables. These regions are stored in a
fixed-size array and their ownership is donated to the hypervisor during
initialization to ensure host-exclusion and persistent tracking.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/include/asm/kvm_pkvm.h     | 10 ++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c |  3 +++
 arch/arm64/kvm/hyp/nvhe/setup.c       | 25 +++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 757076ad4ec9..48ec7d519399 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,16 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+#define PKVM_PROTECTED_REGS_NUM	8
+
+struct pkvm_protected_reg {
+	u64 start_pfn;
+	size_t num_pages;
+};
+
+extern struct pkvm_protected_reg kvm_nvhe_sym(pkvm_protected_regs)[];
+extern unsigned int kvm_nvhe_sym(num_protected_reg);
+
 int pkvm_init_host_vm(struct kvm *kvm);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 0808367c52e5..7c125836b533 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -23,6 +23,9 @@
 
 struct host_mmu host_mmu;
 
+struct pkvm_protected_reg pkvm_protected_regs[PKVM_PROTECTED_REGS_NUM];
+unsigned int num_protected_reg;
+
 static struct hyp_pool host_s2_pool;
 
 static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index 90bd014e952f..ad5b96085e1b 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -284,6 +284,27 @@ static int fix_hyp_pgtable_refcnt(void)
 				&walker);
 }
 
+static int unmap_protected_regions(void)
+{
+	struct pkvm_protected_reg *reg;
+	int i, ret, j = 0;
+
+	for (i = 0; i < num_protected_reg; i++) {
+		reg = &pkvm_protected_regs[i];
+		for (j = 0; j < reg->num_pages; j++) {
+			ret = __pkvm_host_donate_hyp_mmio(reg->start_pfn + j);
+			if (ret)
+				goto err_setup;
+		}
+	}
+
+	return 0;
+err_setup:
+	for (j = j - 1; j >= 0; j--)
+		__pkvm_hyp_donate_host_mmio(reg->start_pfn + j);
+	return ret;
+}
+
 void __noreturn __pkvm_init_finalise(void)
 {
 	struct kvm_cpu_context *host_ctxt = host_data_ptr(host_ctxt);
@@ -324,6 +345,10 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
+	ret = unmap_protected_regions();
+	if (ret)
+		goto out;
+
 	ret = hyp_ffa_init(ffa_proxy_pages);
 	if (ret)
 		goto out;
-- 
2.53.0.473.g4a7958ca14-goog


