Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF92FCCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=; b=a6UY9Ya1eehJGNpFYj/HVIws27
	VrVSr6Du4LwTREleHypKW5nGAmug9lT1EhB2psNl3a/d0shW1QnvPDInFAdedN1N/s9Fzyd3qiReU
	waXdwP56hhIMZ0Vqh8800kJescnSR6ezoRdjceblnE1N3Kqo5GNrES4iGuwfMHv3nxo7CJILlITmC
	mMxEr8v5HNbzpCT6yh3F03xgY7it5di7VyNd0EhwuGPjHwytEDo7Z6s3TnfGQK6QzIS2QQmi7pA6e
	DJ9rme0kKMzxWg4TMzpTKYzKgYUvHdfYLlhPm1GFm8u7pXzN6i4zzdvny4YEyY0s5HNB+Q0V0by+L
	Dkn9JXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzM-00000004kf6-2Dfe;
	Thu, 30 Oct 2025 20:11:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyb-00000004jit-304S
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=; b=D46Vw2TNQJeZJkizmcyOH6VE3F
	/nf5a1OXscAdaL0QQEIgooAPUv3s1BK5Vw8c7fuzktyEJ0yl28KsHxh7jCUGjPs2yN0uo7z5l+XPl
	U7qbqbI05UCoFTb2Wn9X5KOWDs4f/J4y9KfSM97gTVdDLQ9AO0JQU51daKh7RsbSnkd08sYOMRMDb
	loZxw9l+QvqsPTpQUfiCbPDx4icHdKcVU73RYJTUdram5YZBhbP9/woucFwGK4qvFB1D7DJcmpoyN
	h1oqbMPccVX6AP93EmsImVvo85JYgyYA60uOcwchmgB8rlsJ8HwSNscAZA73ZWSiuU8ebvylbMQMO
	AVTGtISw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyW-0000000C5PP-3VUN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:28 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1121541a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855021; x=1762459821; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=;
        b=3dEKK0BOuXUq/kvQ62z1hnB9Wdd+ffhDNm9WNsEY6MJB3z7IOfGMhI68ITHvxG5wFe
         8t7f8chZRc3A7DpbOkXHNeJ5FIeoBS3ww7ts8lHEvxvMBXDNrPPr7IEweZcr9EYkPmsR
         URSns1NCEQHx3whOjtgr8wXuh7f/zbWyOLHvRd6VflbMFuzXxUi4XwaaMI74IUn0WNUg
         yylsYouV0nrltuLXPI7aXDEZoZWEma5A+GZBniUeWuMecqbXtjIlewON2vuKEde7zm+e
         nGmglywsznQKBZpsssymXh77IONwHlQ76imwkRwHl8UnO8XZfOn6Wk8Y2Wh1Hro8XTnd
         3Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855021; x=1762459821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=;
        b=MDPEi1msZPV6hfNzWtxJvbYWy2A9B0+qeG1D1jN1dq0vyWDbpKOrIZa9A6d3NrXqZ3
         ugqrdSL9ZYW+IPXYcR12xAEkleyk4baZClfhchJIxwRnKSngy6FKMVX0B1XjMAPCZyBc
         o1KUJj1kfaUpgKSeI0dNK5GfCfUFhAjeR2T3WFsOITakq6PgHWa6V5fuYjNZFynuV6Gg
         3EXoYURFPf4A0ETyQY3yCTj5v27SL6DEj5E+f7t7g7x3cNZL4sk8qktt/S/krLfjNqM6
         9GFKV1sg1Rvbu64EF0m83+vwilsVRsqeMIluTT7INhE99p/cZPhqUm3wjOk3AIm+32XG
         9mPA==
X-Gm-Message-State: AOJu0YxJucyYSt8xuWkoBXkxQ+MESh0AcoiRhgGuQoqdSxS5q1xd1ZJw
	GfgwHhhBFEtrXwKa1bMB7eqV8aud6RoP5H0beAfKGWOp0dWaG4HJu/WsA758C0KehxZvI+G27Dg
	VXWWCKA==
X-Google-Smtp-Source: AGHT+IG+gFwz9Ni5D6YjNM4YmwfrZ1OxqSQdFqNs3bWhzX+cRsNM16o/ggLOmTawQXyQElnAsV5VYAZIDy0=
X-Received: from pjvp23.prod.google.com ([2002:a17:90a:df97:b0:339:e59f:e26])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e83:b0:33b:c5de:6a4e
 with SMTP id 98e67ed59e1d1-34082fa592cmr1221665a91.5.1761855021014; Thu, 30
 Oct 2025 13:10:21 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:32 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-10-seanjc@google.com>
Subject: [PATCH v4 09/28] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_201026_187916_0EA8A9B0 
X-CRM114-Status: GOOD (  10.92  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Return -EIO when a KVM_BUG_ON() is tripped, as KVM's ABI is to return -EIO
when a VM has been killed due to a KVM bug, not -EINVAL.  Note, many (all?)
of the affected paths never propagate the error code to userspace, i.e.
this is about internal consistency more than anything else.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c3bae6b96dc4..c242d73b6a7b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1621,7 +1621,7 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
 	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
 	atomic64_inc(&kvm_tdx->nr_premapped);
@@ -1635,7 +1635,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
@@ -1658,10 +1658,10 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * When zapping private page, write lock is held. So no race condition
@@ -1846,7 +1846,7 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * and slot move/deletion.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * The HKID assigned to this TD was already freed and cache was
@@ -1867,7 +1867,7 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-- 
2.51.1.930.gacf6e81ea2-goog


