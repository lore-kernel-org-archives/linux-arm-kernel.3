Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD1FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1cEKllUDRF88QZantA4oZWA6R1GfNmcP8NTDHKSoM1g=; b=w/sz7ozKFkuDgNR6ffmzJUWj+r
	uF7uMqsGlLGk4K10n31c5bZ0GqOKnPjXSwlBP7jiKnm224i18IVv3b29GDJmniyInpxhv5m4vwoSl
	W5d0jPaOdXXdjw6NLwba91RVKGmzvWy8MG6YLb95px1UVOrCi2/BEN10zhiOMeNUKpSH81s90PSyk
	yYR+XmN9G9Dtqu6ZTmQXetL4ktkv7pueCdtizS0CQ9t53XnpsMtpXeG/ITRPs/cGT1pkxbgMphO2q
	Vejk0n08UkncY7d0WK/G/v+SqwdR4nQhMSAX1tkglcIWNA/nILiZi4rw75NXZ8/zhW9eaPgvaCdDB
	kF0o5L4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWj-0000000DFiq-2OAd;
	Mon, 06 Jul 2026 17:54:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWa-0000000DFd4-3shE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 06 Jul 2026 17:54:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1cEKllUDRF88QZantA4oZWA6R1GfNmcP8NTDHKSoM1g=; b=YEeZYXiOmPFrdOaR8r09Me00MO
	uvcOUZEui0Bt5SDqZfxvLzyoL5pSKLIUk2YbHJeTlaZreM5/Exnn9EOzHTI45OSEafCU9r1YdRFiB
	mZqwVq26GJz+mItVTqkbATTHvTGnQsxZklMAH8qCq9KjEp3pDoDEX9OblSWa+gap3mOhLclVe2rXC
	w3TJvtn4OaZDLAI1xNNdmHcwTUV9byRpzEpd69rdc4zSu5hBfG6oUg2x8zrS9JQtNjuiyevLoDq5D
	Zs2ARKFR80Dv8uFqBk0du2AkTf4BJIaA2bAQj9BVhTXUAL42pRrJI75yv11X0pMqbZzSs3ZUojKY3
	bi4VjYcQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wgnWY-00000006p3Y-15OD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:31 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490c56e2576so22128005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360468; x=1783965268; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1cEKllUDRF88QZantA4oZWA6R1GfNmcP8NTDHKSoM1g=;
        b=ZEpn4P+3jkBvLtLY5nP6iKQljiKZEWgX4649ysn1lT4zu2dQR2akmkyGgMsAMX78Ls
         g43oOyMqzRL74jFeQ8VvCaomoWuVlL3NkT9EiAzkMO3n6jDAZH6T3xkAJfal4RPfnkq+
         gu4i91T93Xuxs7pBrDKlLLsF5QHWHhBKISXfhrjPgDJrY4rZV+6xmMmrQB+bym3lePmc
         m/tGWOTu/Eog32hyI/fgWoy2Ud8ZY8W9Qj+hxYk9mJeGuA4GTInkDNWyJSh6zqVbW3ek
         pO9EutwLm6Y67/171pbI7VLRLDNxGmjrm5/GenGPd/T833CBwpB6DsobuKOH6H25SYg8
         LjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360468; x=1783965268;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cEKllUDRF88QZantA4oZWA6R1GfNmcP8NTDHKSoM1g=;
        b=tG3fkwLoIFrI7xESsoo4BNHy6nNjKDOCzTnHluXzombhZi5y+R+GLocRPijUowWnk3
         WSoFlVCJmiPCUOh1RPVD/zkz1PnjRj9fDh8VFXl3skxDSwHqvZvIZuWm+S4hFA7ddqQM
         ndqI5TpTtNHUTxHlscfSvBYyCb9f2MF+4QKLYzRJBcD1uzUVtaH2KR3q7KigArAn9z2j
         Ad0A+xUoNwrntUZHUEkYq7hDF2YmDmoj2i/vBkTua2Ld06xgQOOtpLp4sO5w8sK9+yeM
         DePbYl65cbMGwGY9PZv98f6PtqrAqXO1GKT2/a1y06o0YSt41C2aYqcuOaxMTsRQbV9L
         w3LQ==
X-Gm-Message-State: AOJu0YxVdobAwIOgO17wmbmJ7A1rmRD2078ll+atWRif/VtSj/evTSBL
	ajFKp++APLC9pBcd8UB0yPKo9tNH2madGl8egcGqWnCG1zIineULV5DyZOQ5X3aGF4U4KHq6Unq
	Evkfqmm4ub7t0V6nJRpbiKw==
X-Received: from wmbg16.prod.google.com ([2002:a05:600c:a410:b0:493:d230:b1f0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6413:10b0:493:cefc:d113 with SMTP id 5b1f17b1804b1-493df0b6a9amr14684925e9.5.1783360468200;
 Mon, 06 Jul 2026 10:54:28 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:03 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-7-vdonnefort@google.com>
Subject: [PATCH v2 06/18] KVM: arm64: Add topup interface for the pKVM heap allocator
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_185430_356884_3156FB26 
X-CRM114-Status: GOOD (  12.23  )
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

Introduce a host HVC interface and a host side helper to allow refilling
the pKVM heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 043495f7fc78..681b7bf8ac08 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -114,6 +114,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_load,
 	__KVM_HOST_SMCCC_FUNC___pkvm_vcpu_put,
 	__KVM_HOST_SMCCC_FUNC___pkvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___pkvm_hyp_topup,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MAX)
 };
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 74fedd9c5ff0..870f7870bb62 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -17,6 +17,10 @@
 
 #define HYP_MEMBLOCK_REGIONS 128
 
+enum pkvm_topup_id {
+	PKVM_TOPUP_HYP_ALLOC,
+};
+
 int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
 int pkvm_create_hyp_vm(struct kvm *kvm);
 bool pkvm_hyp_vm_is_created(struct kvm *kvm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index d3c69de698f4..e270a974fa37 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -15,6 +15,7 @@
 #include <asm/kvm_hypevents.h>
 #include <asm/kvm_mmu.h>
 
+#include <nvhe/alloc.h>
 #include <nvhe/ffa.h>
 #include <nvhe/mem_protect.h>
 #include <nvhe/mm.h>
@@ -632,6 +633,30 @@ static void handle___pkvm_finalize_teardown_vm(struct kvm_cpu_context *host_ctxt
 	cpu_reg(host_ctxt, 1) = __pkvm_finalize_teardown_vm(handle);
 }
 
+static void handle___pkvm_hyp_topup(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(enum pkvm_topup_id, id, host_ctxt, 1);
+	DECLARE_REG(phys_addr_t, head, host_ctxt, 2);
+	DECLARE_REG(unsigned long, nr_pages, host_ctxt, 3);
+	struct kvm_hyp_memcache host_mc = {
+		.head = head,
+		.nr_pages = nr_pages,
+	};
+	int ret;
+
+	switch (id) {
+	case PKVM_TOPUP_HYP_ALLOC:
+		ret = hyp_alloc_topup(&host_mc);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	cpu_reg(host_ctxt, 1) = ret;
+	cpu_reg(host_ctxt, 2) = host_mc.head;
+	cpu_reg(host_ctxt, 3) = host_mc.nr_pages;
+}
+
 static void handle___tracing_load(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(unsigned long, desc_hva, host_ctxt, 1);
@@ -762,6 +787,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__pkvm_vcpu_load),
 	HANDLE_FUNC(__pkvm_vcpu_put),
 	HANDLE_FUNC(__pkvm_tlb_flush_vmid),
+	HANDLE_FUNC(__pkvm_hyp_topup),
 };
 
 static void handle_host_hcall(struct kvm_cpu_context *host_ctxt)
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 8324a6a1bc48..e2c8714e8ccc 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -85,6 +85,33 @@ void __init kvm_hyp_reserve(void)
 		 hyp_mem_base);
 }
 
+static int pkvm_hyp_topup(enum pkvm_topup_id id, unsigned long nr_pages)
+{
+	struct kvm_hyp_memcache mc;
+	struct arm_smccc_res res;
+	int ret;
+
+	init_hyp_memcache(&mc);
+	ret = topup_hyp_memcache(&mc, nr_pages);
+	if (ret)
+		goto err;
+
+	arm_smccc_1_1_hvc(KVM_HOST_SMCCC_FUNC(__pkvm_hyp_topup), id, mc.head,
+			  mc.nr_pages, &res);
+	if (WARN_ON_ONCE(res.a0 != SMCCC_RET_SUCCESS)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = res.a1;
+	mc.head = res.a2;
+	mc.nr_pages = res.a3;
+
+err:
+	free_hyp_memcache(&mc);
+	return ret;
+}
+
 static void __pkvm_destroy_hyp_vm(struct kvm *kvm)
 {
 	if (pkvm_hyp_vm_is_created(kvm)) {
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


