Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A06CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owMpJomD9HktZXrYn67PIBgyXHZh+dj149j6UZF5idE=; b=t67Rzhb5JvJVlvXpEV2oLSJuge
	D9UsqldmkCBzVIeRMKS6CwOEdnv1Qv2r+F3041fwW1I4g1EcEYhPLpwawBvEEkY0nnQ6Pu6OX3e/0
	S5dFF+O92VjtfUrziUCYVJgfpXP1l7z8W/XcnIaX5H943sFQn1UcDV4MuwwLw7vtcRSvqmIiQ0WBI
	XJ8LcjLpzT07KbR/KVgvvS47LgSiFOyTa/kSXHN+ZzxBs11j5eGE9Rq222CsqIDYKNvHh5NRy+aOT
	xn96Zt6QPWWKFMfheFmF+y1suRoFK7nTEYBwoT+LpXmt2s78gDn6LpvTQedEOfMg2L7HbA8TeHbBy
	FWvzJJAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1zb-00000008tfk-1aqr;
	Tue, 09 Sep 2025 17:18:55 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvyWb-00000007R7d-25pD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 13:36:46 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3dc3f943e6eso3564304f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757425003; x=1758029803; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=owMpJomD9HktZXrYn67PIBgyXHZh+dj149j6UZF5idE=;
        b=Fyx9zCEBbSmBJa8pEkqug+rnMQzDGzrfJKp+oJAwgzsLi+xipNHnUkX4wcVrtvB7hN
         W4ocxVBvifwptf0sK/Di/KHpCd/xVKFgw8IarMCXoYvDl2AfyjsRmzlDYx5LlSH0OnsI
         vHbxn5s+wUlNmIHDJxR+sY2P160ejInmuqWg+A82fiGuBPqUUG3GYNRl9BHG8pXpIAkC
         N8SSpPldbQGx+/0wt7Uf6P4HstRXShcXGFN276q3EmDcJF0BFyzSe46p95Ew2RY53NUR
         iJ6e8Oi/cDP3f5fWWNEE+wAjJE8vTEpGjm+SLbD+lfBK2IA2YECKw4c2aRWyNDkTMs2Q
         9Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757425003; x=1758029803;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=owMpJomD9HktZXrYn67PIBgyXHZh+dj149j6UZF5idE=;
        b=KUXn6wyayW0h9KZfE/m66JrNkdcT/jC1b5D+x3MTzEWrqLRqLfwjEJuOjiyhSCrtEd
         Yi6SiEZ8O4/QRvREyoWWyufBjPIW2K6iNOqNURKJfQfHrYHLs3i2rXiRn3nZkXlpUqO0
         asugaD8dHGHZ4COGXfgJZbjMJHy4sqFylrmVtWUVhZwuMb0OjYnsRflW8HzU+2s5fVoP
         K1oI/zOrf7gRUjMIVdQ5yj76ftQx16M5EYwu2+e3SZxcvTFu78z/5v8GC+AorHUIQyOH
         scsczu+anh6C1hRXVF6UhaznS3mFb53pAbcKgfg2kZqMs8XQacJGr2L1PmpL47vxd7US
         uWQA==
X-Gm-Message-State: AOJu0YxCmxF+y4SVKKdpCyJSFb0CebkVh7mPoo9gWFRA93lS1XMBIHYD
	/SoFPvHnZNjjyeUJJGkhYEs1KH1TZ10Pc2Ai9xT3rtt8vs1W18wDi110CUW36PFJMLDjBTJiIaL
	AGmtW4z6v9N41iwIYbETl44oUSTAsq3k9CwVdheaKWqL8TOd67ueWOoFagQqW5LHk7olTxpf7vU
	sUSAySCitEk+wSGbiXFMUuICRpxh0QkcS7Ln04S1iFQPA9NHHCvw6CoaN6tFTRcDpSKw==
X-Google-Smtp-Source: AGHT+IFb5uZ+yXEAm2ul5d4u0zb6FcIArGntIYWXEsNgKuqjWpTpJjl0OgQdZTnmi211wUNW182dBv2tNknMLA==
X-Received: from wrbfq12.prod.google.com ([2002:a05:6000:2a0c:b0:3db:2c3c:8268])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c9:0:b0:3c9:b8b7:ea4e with SMTP id ffacd0b85a97d-3e637370e00mr9580515f8f.19.1757425003090;
 Tue, 09 Sep 2025 06:36:43 -0700 (PDT)
Date: Tue,  9 Sep 2025 13:36:31 +0000
In-Reply-To: <20250909133631.3844423-1-smostafa@google.com>
Mime-Version: 1.0
References: <20250909133631.3844423-1-smostafa@google.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
Message-ID: <20250909133631.3844423-3-smostafa@google.com>
Subject: [PATCH v2 2/2] KVM: arm64: Map hyp text as RO and dump instr on panic
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, perret@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_063645_542182_C2809BB6 
X-CRM114-Status: GOOD (  16.76  )
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

Map the hyp text section as RO, there are no secrets there
and that allows the kernel extract info for debugging.

As in case of panic we can now dump the faulting instructions
similar to the kernel.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/handle_exit.c    |  4 +---
 arch/arm64/kvm/hyp/nvhe/setup.c | 12 ++++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index 99a8205fc104..d449e15680e4 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -560,9 +560,7 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 	kvm_nvhe_dump_backtrace(hyp_offset);
 
 	/* Dump the faulting instruction */
-	if (!is_protected_kvm_enabled() ||
-	    IS_ENABLED(CONFIG_NVHE_EL2_DEBUG))
-		dump_kernel_instr(panic_addr + kaslr_offset());
+	dump_kernel_instr(panic_addr + kaslr_offset());
 
 	/*
 	 * Hyp has panicked and we're going to handle that by panicking the
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index a48d3f5a5afb..90bd014e952f 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -192,6 +192,7 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	enum pkvm_page_state state;
 	struct hyp_page *page;
 	phys_addr_t phys;
+	enum kvm_pgtable_prot prot;
 
 	if (!kvm_pte_valid(ctx->old))
 		return 0;
@@ -210,11 +211,18 @@ static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	 * configured in the hypervisor stage-1, and make sure to propagate them
 	 * to the hyp_vmemmap state.
 	 */
-	state = pkvm_getstate(kvm_pgtable_hyp_pte_prot(ctx->old));
+	prot = kvm_pgtable_hyp_pte_prot(ctx->old);
+	state = pkvm_getstate(prot);
 	switch (state) {
 	case PKVM_PAGE_OWNED:
 		set_hyp_state(page, PKVM_PAGE_OWNED);
-		return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
+		/* hyp text is RO in the host stage-2 to be inspected on panic. */
+		if (prot == PAGE_HYP_EXEC) {
+			set_host_state(page, PKVM_NOPAGE);
+			return host_stage2_idmap_locked(phys, PAGE_SIZE, KVM_PGTABLE_PROT_R);
+		} else {
+			return host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_HYP);
+		}
 	case PKVM_PAGE_SHARED_OWNED:
 		set_hyp_state(page, PKVM_PAGE_SHARED_OWNED);
 		set_host_state(page, PKVM_PAGE_SHARED_BORROWED);
-- 
2.51.0.384.g4c02a37b29-goog


