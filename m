Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14769CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hX/U36pu+btUiKMTGpxWXuvgYMFqfHpYvSZt+8MNmUg=; b=T4H90OuaDBE6ASaJ0CCkMr5iqt
	/eXPXu8a+AAzRR/XSdPMmXFYi2uXwrFGXrZCqKxMZIF8o4tFrPGSeZgxvaOaL70NFfNE+Qv4QCs9g
	T8Dx8E0+MIZFlXZEG1bvXyYis1eMSIuzVvOhBbJl2/Ggp0XkYKJsbNtayfk4h1MWMxxF3QFF+Yr3n
	Le3HlBV1flJSp8nHr6pLOsQF4SWELQMaQdM1DOy0tmIAMStNWRZ9u3T6ABZBHXv3CmYkVB2eJ/ged
	z657JYIhmTrgVosY2gEgJJ2lazg0sYovbphGv69UOPNLi8AR39Nr+Yzcbs3TO5ai8ZD+EIVO3uTyp
	PmfLjaNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwY-00000006eqY-0UiI;
	Fri, 01 May 2026 11:22:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwV-00000006em6-2fNi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:22:00 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-ba70cda6755so149298666b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634517; x=1778239317; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hX/U36pu+btUiKMTGpxWXuvgYMFqfHpYvSZt+8MNmUg=;
        b=toRS6x72RSE+dEnOK9XsHrOJ2ZoFxvtdFMR0fGA2z/cy5VtBQfpDWGdjrqKyf77juA
         bAYuBg2kw6TQmhXabaelI+D4CRcbZr9Gl9LHsENh4yXe9Qp/b6F0xooqoFMc0lXWsUxc
         cW/3WMXLa0duxliebNc3H+ibJwmm4sKK28Pj0/LhYcfGsrjIE9Tgk1Exi4mc3FoadCJU
         mTa7Lu9tIEJg8TImLs1HTvf3DKFNLI9iL36U+cmTfOkMjAxD3sm8Mor7pOv2iOmt2HLc
         EE+6dhy2CHp5B41PdXjST9kpSlFTj9//ZDQJ+DA7P5nE34W+awATuVqLPFlfh4/bFjyM
         husA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634517; x=1778239317;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hX/U36pu+btUiKMTGpxWXuvgYMFqfHpYvSZt+8MNmUg=;
        b=muYQOq4fYbxnrrWWoN9js05rKyyrJeMZopI450IzvGiiybZxP7qEutRZYczw5bhAJ1
         zuLVvVnwtQDFmzpbTPG/sabukPkfkKHw/2UKKyzf+HHw4gOC6X/POsghoE0RQPQ6EGC2
         xv2jHc9W8l6/zCtUDlYrGNSOXzIyk6blWKLaRY/0joQlo07pCF2m5jenj27B/IwXjTj3
         dEkA0h7fgOgF8aPvArLZRzYSt8z/wleQu/yS1xICY56Ghvqkb+TuDrZQuom1ZUHyb74y
         iPKgDeDYv7iJuAfio+HHxJm/HUJoztTrkh/kodfvk7mSANie+0bBsOJBSvFHP+OSbtyI
         YeRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+davppDYMVqcGUXSOaqrEuZy/wWysoP9F9TEEMasPP7FG78JvLnUuE/hVQolGHi+94/lDSnEA9N7iMwt/InhgN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7aAW7yd6PZJLkp5JfKEm02hORMLJL/oTqUY6xEupQQAjNfJvO
	3XxwnKKCvEB9Tpu5h6wwWQZkKs8fY8MDoHWyjn/J/pmR/SfEqB7JPkE2Co9AqIuUG20yZRKOxyC
	N1w==
X-Received: from ejbwt14.prod.google.com ([2002:a17:906:ee8e:b0:b98:23e7:c41])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f58e:b0:bb7:be6a:7671
 with SMTP id a640c23a62f3a-bbac5ac10c5mr381051166b.6.1777634516878; Fri, 01
 May 2026 04:21:56 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:48 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-6-tabba@google.com>
Subject: [PATCH v2 5/6] KVM: arm64: Pre-check vcpu memcache for host->guest share
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042159_691654_80D4FF1D 
X-CRM114-Status: GOOD (  15.73  )
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

__pkvm_host_share_guest() ends with kvm_pgtable_stage2_map() to
install the guest stage-2 mapping, after a forward pass that mutates
the host vmemmap (sets PKVM_PAGE_SHARED_OWNED and increments
host_share_guest_count) for every page in the range. The map's
return value is wrapped in WARN_ON() and otherwise discarded,
asserting that the call cannot fail.

WARN_ON() at nVHE EL2 panics, so this assertion is only correct if
the call genuinely cannot fail. kvm_pgtable_stage2_map() can fail
with -ENOMEM when the stage-2 walker exhausts the caller's
memcache, and the host controls the vcpu memcache via the topup
interface, so an under-provisioned share request would otherwise
turn a recoverable -ENOMEM into a fatal hyp panic.

Bound the worst-case walker allocation in the existing pre-check
pass so that kvm_pgtable_stage2_map() cannot fail at the call
site, using kvm_mmu_cache_min_pages() -- the same bound host EL1
uses for its own stage-2 maps. If the vcpu memcache holds fewer
pages, return -ENOMEM before any state mutation.

Fixes: d0bd3e6570ae ("KVM: arm64: Introduce __pkvm_host_share_guest()")
Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 28a471d1927c..e428304f94f2 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1369,6 +1369,22 @@ int __pkvm_host_reclaim_page_guest(u64 gfn, struct pkvm_hyp_vm *vm)
 	return ret && ret != -EHWPOISON ? ret : 0;
 }
 
+/*
+ * share/donate install at most one stage-2 leaf (PAGE_SIZE, or one
+ * KVM_PGTABLE_LAST_LEVEL - 1 block for share). kvm_mmu_cache_min_pages()
+ * bounds the worst-case allocation: exact for the PAGE_SIZE leaf,
+ * conservative by one for the block.
+ */
+static int __guest_check_pgtable_memcache(struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+
+	if (vcpu->vcpu.arch.pkvm_memcache.nr_pages < kvm_mmu_cache_min_pages(vm->pgt.mmu))
+		return -ENOMEM;
+
+	return 0;
+}
+
 int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
@@ -1453,6 +1469,10 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 		}
 	}
 
+	ret = __guest_check_pgtable_memcache(vcpu);
+	if (ret)
+		goto unlock;
+
 	for_each_hyp_page(page, phys, size) {
 		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
 		page->host_share_guest_count++;
-- 
2.54.0.545.g6539524ca2-goog


