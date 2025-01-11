Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9616E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 00:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=; b=Ng51qYKD1CYG3Ufaw0Sl5ah1ng
	BW4gcyqqqFmJRaLS5zSmfNRo9/h8zf2AzJx2o08CdEyItN1PNZ4hGS/hmurneDs6iWzrgeAPPxNQz
	XHxxEIzUN1JI+ir7dRbnyipSC3XbkXx7CawZ0VtedizGcY7UoA8JXYSTx3tsEdbs2Lh4oY2IWBCfh
	9tguUS28i4CTnOdWCEJawDgQxW5F4qf6134Gjis8K/H5tVxrnSnsiBK2SPhEmOe2ZWiMTL7crnOJM
	7k8sfeu9rAN0YmrHtbhzzEP//I1NDMEIpii67ZI1RcHiN+3FNH+Vql2pBHC/3HqaANcrjryDKvnNp
	v5L3clWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPn9-0000000HRU1-2HDi;
	Sat, 11 Jan 2025 00:55:55 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiP-0000000HQMU-2YQg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef728e36d5so4812823a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 16:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556660; x=1737161460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=j3Cl7emQhO0Gv8ADACM/NdBjmdKyvZlY2sfvUkjDV6PFQwegYBnWu6Jajr/MXZhTp8
         pPzJ6UiDTMOUhMVaMH8DIfLJeyFOrkJtzR8TkJcJ57NI5zY3of9cuJg6naCrwqIlpuHr
         V2ADM5L+WipPPTp/6mw23z9dscBQJ4M8xxd1Qtjoe6kBUTiQ+oEll0PtP1hU9N8/Eb//
         0ym9PNljJtv/zyXqjCmIesTnfiIEFZaTp7q13OW+5xuHLxHP3IeBaX0/Fzqc05JeU6yg
         dSdSE0jqbL8m9X2cYMu3mL4JmKXMr04KPqR1oJxN/jC3X/+CXZDdXtsNkyhT+jtCLAd9
         8nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556660; x=1737161460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=Hjpf3nys8FD4xibT/wc+CNxkdY8Az5CHbPPbAK20IYLWD/It5hyhzDi5CIPkgDauaI
         mVfVMxLJDw7aEyFasCVq5eW/WX6a4Bhx+nRJtlgl6yORhOyTDLKLm8fmXBRU4WlC7N/B
         ts2YQMdRnZtjgWsnM/oeDIuJUhda34gNxUyPx1OwramuZ3VERwY1W12OvqumD4EhXLou
         ERAkn+Wvw9T1GGd8AuwLpoL+E6LTTgRfhYDV4hep9mVN9n9xuf9UlCXq8B5u2FqOA0a2
         tv/geBfpxyszxJgFkACFRossV/TQ2Tz5ODu4zLmdi6DjzWDdQttnRE444P+dnMVvxWoP
         WxJA==
X-Gm-Message-State: AOJu0Yw+zat8Uk3tZfASUZuiAWQnPykzEH+zNPZWGUUPiNGQv7VfcFlS
	ClG7gMrkKDqC88KOdiGYxvF1jAe+UDmBZntaW34WUqWjPoswSm+p2blmzaouYdQ5va6bINcwQuZ
	w8w==
X-Google-Smtp-Source: AGHT+IFkTOLXQinvGI8s6GviRk7XKu9XJa8etcXjW5yAd+8/VTBQJ+NHE0WBibUOfLnKYqGfPAkdUeiGwEY=
X-Received: from pjbqd11.prod.google.com ([2002:a17:90b:3ccb:b0:2e5:8726:a956])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcc:b0:2ee:ad18:b30d
 with SMTP id 98e67ed59e1d1-2f548e98f31mr17356212a91.6.1736556660239; Fri, 10
 Jan 2025 16:51:00 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:45 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-6-seanjc@google.com>
Subject: [PATCH v2 5/9] KVM: selftests: Add struct and helpers to wrap binary
 stats cache
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165101_640129_971A7243 
X-CRM114-Status: GOOD (  17.19  )
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

Add a struct and helpers to manage the binary stats cache, which is
currently used only for VM-scoped stats.  This will allow expanding the
selftests infrastructure to provide support for vCPU-scoped binary stats,
which, except for the ioctl to get the stats FD are identical to VM-scoped
stats.

Defer converting __vm_get_stat() to a scope-agnostic helper to a future
patch, as getting the stats FD from KVM needs to be moved elsewhere
before it can be made completely scope-agnostic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 11 +++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 47 +++++++++++--------
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 044c2231431e..9a64bab42f89 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -46,6 +46,12 @@ struct userspace_mem_region {
 	struct hlist_node slot_node;
 };
 
+struct kvm_binary_stats {
+	int fd;
+	struct kvm_stats_header header;
+	struct kvm_stats_desc *desc;
+};
+
 struct kvm_vcpu {
 	struct list_head list;
 	uint32_t id;
@@ -99,10 +105,7 @@ struct kvm_vm {
 
 	struct kvm_vm_arch arch;
 
-	/* Cache of information for binary stats interface */
-	int stats_fd;
-	struct kvm_stats_header stats_header;
-	struct kvm_stats_desc *stats_desc;
+	struct kvm_binary_stats stats;
 
 	/*
 	 * KVM region slots. These are the default memslots used by page
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 21b5a6261106..c88f5e7871f7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -657,6 +657,20 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 	return NULL;
 }
 
+static void kvm_stats_release(struct kvm_binary_stats *stats)
+{
+	int ret;
+
+	if (!stats->desc)
+		return;
+
+	free(stats->desc);
+	stats->desc = NULL;
+
+	ret = close(stats->fd);
+	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+}
+
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
 {
 
@@ -711,13 +725,7 @@ void kvm_vm_release(struct kvm_vm *vmp)
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		vmp->stats_desc = NULL;
-
-		ret = close(vmp->stats_fd);
-		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
-	}
+	kvm_stats_release(&vmp->stats);
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -2214,34 +2222,33 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
  *
  * Read the data values of a specified stat from the binary stats interface.
  */
-void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
+void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 		   size_t max_elements)
 {
+	struct kvm_binary_stats *stats = &vm->stats;
 	struct kvm_stats_desc *desc;
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_desc) {
-		vm->stats_fd = vm_get_stats_fd(vm);
-		read_stats_header(vm->stats_fd, &vm->stats_header);
-		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-							&vm->stats_header);
+	if (!stats->desc) {
+		stats->fd = vm_get_stats_fd(vm);
+		read_stats_header(stats->fd, &stats->header);
+		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
 
-	size_desc = get_stats_descriptor_size(&vm->stats_header);
+	size_desc = get_stats_descriptor_size(&stats->header);
 
-	for (i = 0; i < vm->stats_header.num_desc; ++i) {
-		desc = (void *)vm->stats_desc + (i * size_desc);
+	for (i = 0; i < stats->header.num_desc; ++i) {
+		desc = (void *)stats->desc + (i * size_desc);
 
-		if (strcmp(desc->name, stat_name))
+		if (strcmp(desc->name, name))
 			continue;
 
-		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
-			       data, max_elements);
+		read_stat_data(stats->fd, &stats->header, desc, data, max_elements);
 		return;
 	}
 
-	TEST_FAIL("Unabled to find stat '%s'", stat_name);
+	TEST_FAIL("Unabled to find stat '%s'", name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


