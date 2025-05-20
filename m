Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6126C54799
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8eV/b8y5mk2obyefKPJMTlOdN01tVjbRhdILiqDQGZo=; b=onmgbQ0J0YTMgTeGIEBj1m+FAW
	LjuK/AClDQ0/yQ7trRMpcQk769LgIjcxK5PUDG1IVUJBLbY4VnFeKcWhdQlJU6cZbkNINzgXK3GBl
	zeBinFGJj1DSn78kSnvaImBbM20U5GQZ3EkyAxcgygY1y1WUiR0S1P5Y4iKo/s3xo+APx3WUwcilm
	f+AhwNsj90GOlFHTSrmTClMI1LVr4EB5gh1nwlDDgeDd3TgQjys/ulz1JwXOEikVEY3aoG5A5n7E1
	XJ5dk4e4+Ujwor5TgQNAt0LVT2LwB8nF+F6/rRnf3BbdF1TNCpRr5oBXtwqBif6ZUbdXVvgQURJI6
	uAgBmyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJt3-0000000CI3N-14vS;
	Tue, 20 May 2025 10:07:53 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHIin-0000000C58W-2AIY
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 20 May 2025 08:53:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8eV/b8y5mk2obyefKPJMTlOdN01tVjbRhdILiqDQGZo=; b=Yw02emzRag4bHfQux3XNYSvtD4
	wHjNrixzU4izNVZFCUrRhqL1RfXMtosMxPKVBAcDB2Zq5Qb0gXm1JB1k28r0ryazgplO3H6Jqyg/9
	11iAH42bqW0Kz1lr8XIF+fkmu9nOJiVUQca5W/qMWKH4FfD0xOqL9CfqT6jaWvATk+oUmamCyHlDV
	x4gaWOvjl/SWNxCZs01qpf9DW8CmCbvpImCKh05mGQWsqdSA+ATJ0oCbm+tOXJ7Y1abt6PgOxZudx
	vH78xAL0YEv/IzMgOgqoeE7U5l7bVMIpdfLJnYeSyKuRP/KESnhMt6/wpbKUA2NOMnp7cOaILlezc
	3ceRgGSQ==;
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uHIii-00000000joY-1LYa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 08:53:11 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so40584515e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 01:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747731185; x=1748335985; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8eV/b8y5mk2obyefKPJMTlOdN01tVjbRhdILiqDQGZo=;
        b=b0PYlJtQ7YCQ+oZf9wVJdNM/ibh/0CZ8gflHSItD/epaRm93IpsTz2B0NQ6Qu2UfBA
         KCP3pW1HbAiy1MBSeoz10bdPEqx0pPnZ9+Gx0eiZQFTwCvmzZPfcLLo5wVpYKjQVtEcu
         eUW1egWMnj6l6xFAvSrfszaYkaD0ail33qLOeUxlOv7xC/L63VD0VvxuMuXX1ypJlAG0
         hB4rT5Unh+SSQ8SZ8Kkw+OHiKb+cJ9/OYcDorEh2r9+BDfOsvSBADsCXKtYVjiMEClsZ
         VgUVjWazfmHvcJDYVK6/jcunJ92JNTFDax1uEJ01rbxcU70ga4eLyy6ZWYo4Ff4aRJm4
         wh5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731185; x=1748335985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8eV/b8y5mk2obyefKPJMTlOdN01tVjbRhdILiqDQGZo=;
        b=Kyp8O7hC7WYdcP/Ge8+mhyepxLSnuulLBHycaQaZmyUtxLkx44ojEE53zU8dnD5giP
         MiSIZxDPmOYEZh7A+KyJ88xIL3Cn1z4HOOBn4uZLLfCMVb+7rN6LeN8Wd3OtQlrwdzQ1
         ga6MdmCzl1sjYwiSAqOKEOq+HMO1YIfEqQJpYzQ6svKoTS15+gzUETasKZChC5XT1OeL
         XitJF41iijxdVnx0XSHCACKa2PDQMhfOesHfVT4/93kHejzj9v66jvxf4zkMiFx6xTk3
         ut2zVCar8d4ci4xjALWTemrRFjPYsCEUYdNCdEoNDFqOPgFPgYHrK8n7ZXXvXoxHVU5x
         CChg==
X-Forwarded-Encrypted: i=1; AJvYcCWTaNX1wPDHnszk4TlgSsG5FHyj0GYTmgaXSqhJjJXMJJO/Ujhk6h/c0c2tTgA5+nApEpm5lp3Pinz+D+wyk4OW@lists.infradead.org
X-Gm-Message-State: AOJu0YxqzqreD3fI+CbLhXckXPdQ0bHMg+LmF4MdhVI+dGA+DcHnCrj3
	C2KzcO8eXrJUf7I3RVL94BDuEO/0YV+7MZKtcNE95d+DqeQHFqaE4SxKKxEvFPY58LIuuH2Sr/h
	1w4eDC1A1oYghwxfW7pJ7vw==
X-Google-Smtp-Source: AGHT+IGNQClPtb39kNDrZ/LoRUA+zgeQ/ywPgjx7YyU7q28JnkGlV8/zAlfQAZoYxyadZaqXQgpd/gTa3iD3bses
X-Received: from wmrn15.prod.google.com ([2002:a05:600c:500f:b0:442:ea0c:c453])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:548d:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-442ff03c228mr142671705e9.30.1747731185777;
 Tue, 20 May 2025 01:53:05 -0700 (PDT)
Date: Tue, 20 May 2025 09:51:54 +0100
In-Reply-To: <20250520085201.3059786-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250520085201.3059786-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1143.g0be31eac6b-goog
Message-ID: <20250520085201.3059786-4-vdonnefort@google.com>
Subject: [PATCH v5 03/10] KVM: arm64: Add a range to __pkvm_host_share_guest()
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095308_977776_67BB8B5E 
X-CRM114-Status: GOOD (  16.75  )
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

In preparation for supporting stage-2 huge mappings for np-guest. Add a
nr_pages argument to the __pkvm_host_share_guest hypercall. This range
supports only two values: 1 or PMD_SIZE / PAGE_SIZE (that is 512 on a
4K-pages system).

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 26016eb9323f..47aa7b01114f 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -39,7 +39,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, struct pkvm_hyp_vm *hyp_vm);
 int __pkvm_host_relax_perms_guest(u64 gfn, struct pkvm_hyp_vcpu *vcpu, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 59db9606e6e1..4d3d215955c3 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -245,7 +245,8 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
 	DECLARE_REG(u64, gfn, host_ctxt, 2);
-	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 3);
+	DECLARE_REG(u64, nr_pages, host_ctxt, 3);
+	DECLARE_REG(enum kvm_pgtable_prot, prot, host_ctxt, 4);
 	struct pkvm_hyp_vcpu *hyp_vcpu;
 	int ret = -EINVAL;
 
@@ -260,7 +261,7 @@ static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 	if (ret)
 		goto out;
 
-	ret = __pkvm_host_share_guest(pfn, gfn, hyp_vcpu, prot);
+	ret = __pkvm_host_share_guest(pfn, gfn, nr_pages, hyp_vcpu, prot);
 out:
 	cpu_reg(host_ctxt, 1) =  ret;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 1018a6f66359..8e0847aa090d 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -695,10 +695,9 @@ static enum pkvm_page_state guest_get_page_state(kvm_pte_t pte, u64 addr)
 	return pkvm_getstate(kvm_pgtable_stage2_pte_prot(pte));
 }
 
-static int __guest_check_page_state_range(struct pkvm_hyp_vcpu *vcpu, u64 addr,
+static int __guest_check_page_state_range(struct pkvm_hyp_vm *vm, u64 addr,
 					  u64 size, enum pkvm_page_state state)
 {
-	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	struct check_walk_data d = {
 		.desired	= state,
 		.get_page_state	= guest_get_page_state,
@@ -907,48 +906,72 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	return ret;
 }
 
-int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
+static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *size)
+{
+	if (nr_pages == 1) {
+		*size = PAGE_SIZE;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
-	struct hyp_page *page;
+	u64 size;
 	int ret;
 
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
-	ret = check_range_allowed_memory(phys, phys + PAGE_SIZE);
+	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
+	if (ret)
+		return ret;
+
+	ret = check_range_allowed_memory(phys, phys + size);
 	if (ret)
 		return ret;
 
 	host_lock_component();
 	guest_lock_component(vm);
 
-	ret = __guest_check_page_state_range(vcpu, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	ret = __guest_check_page_state_range(vm, ipa, size, PKVM_NOPAGE);
 	if (ret)
 		goto unlock;
 
-	page = hyp_phys_to_page(phys);
-	switch (get_host_state(page)) {
-	case PKVM_PAGE_OWNED:
-		WARN_ON(__host_set_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_SHARED_OWNED));
-		break;
-	case PKVM_PAGE_SHARED_OWNED:
-		if (page->host_share_guest_count)
-			break;
-		/* Only host to np-guest multi-sharing is tolerated */
-		fallthrough;
-	default:
-		ret = -EPERM;
-		goto unlock;
+	for_each_hyp_page(page, phys, size) {
+		switch (get_host_state(page)) {
+		case PKVM_PAGE_OWNED:
+			continue;
+		case PKVM_PAGE_SHARED_OWNED:
+			if (page->host_share_guest_count == U32_MAX) {
+				ret = -EBUSY;
+				goto unlock;
+			}
+
+			/* Only host to np-guest multi-sharing is tolerated */
+			if (page->host_share_guest_count)
+				continue;
+
+			fallthrough;
+		default:
+			ret = -EPERM;
+			goto unlock;
+		}
 	}
 
-	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+	for_each_hyp_page(page, phys, size) {
+		set_host_state(page, PKVM_PAGE_SHARED_OWNED);
+		page->host_share_guest_count++;
+	}
+
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, size, phys,
 				       pkvm_mkstate(prot, PKVM_PAGE_SHARED_BORROWED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-	page->host_share_guest_count++;
 
 unlock:
 	guest_unlock_component(vm);
@@ -1169,6 +1192,9 @@ static void assert_page_state(void)
 	struct pkvm_hyp_vcpu *vcpu = &selftest_vcpu;
 	u64 phys = hyp_virt_to_phys(virt);
 	u64 ipa[2] = { selftest_ipa(), selftest_ipa() + PAGE_SIZE };
+	struct pkvm_hyp_vm *vm;
+
+	vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 
 	host_lock_component();
 	WARN_ON(__host_check_page_state_range(phys, size, selftest_state.host));
@@ -1179,8 +1205,8 @@ static void assert_page_state(void)
 	hyp_unlock_component();
 
 	guest_lock_component(&selftest_vm);
-	WARN_ON(__guest_check_page_state_range(vcpu, ipa[0], size, selftest_state.guest[0]));
-	WARN_ON(__guest_check_page_state_range(vcpu, ipa[1], size, selftest_state.guest[1]));
+	WARN_ON(__guest_check_page_state_range(vm, ipa[0], size, selftest_state.guest[0]));
+	WARN_ON(__guest_check_page_state_range(vm, ipa[1], size, selftest_state.guest[1]));
 	guest_unlock_component(&selftest_vm);
 }
 
@@ -1218,7 +1244,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	selftest_state.host = PKVM_PAGE_OWNED;
@@ -1237,7 +1263,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	assert_transition_res(0,	hyp_pin_shared_mem, virt, virt + size);
@@ -1249,7 +1275,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 
 	hyp_unpin_shared_mem(virt, virt + size);
@@ -1268,7 +1294,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_host_unshare_hyp, pfn);
 	assert_transition_res(-EPERM,	__pkvm_hyp_donate_host, pfn, 1);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-ENOENT,	__pkvm_host_unshare_guest, gfn, vm);
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
@@ -1279,8 +1305,8 @@ void pkvm_ownership_selftest(void *base)
 
 	selftest_state.host = PKVM_PAGE_SHARED_OWNED;
 	selftest_state.guest[0] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
-	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
+	assert_transition_res(-EPERM,	__pkvm_host_share_guest, pfn, gfn, 1, vcpu, prot);
 	assert_transition_res(-EPERM,	__pkvm_host_share_ffa, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_donate_hyp, pfn, 1);
 	assert_transition_res(-EPERM,	__pkvm_host_share_hyp, pfn);
@@ -1289,7 +1315,7 @@ void pkvm_ownership_selftest(void *base)
 	assert_transition_res(-EPERM,	hyp_pin_shared_mem, virt, virt + size);
 
 	selftest_state.guest[1] = PKVM_PAGE_SHARED_BORROWED;
-	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, vcpu, prot);
+	assert_transition_res(0,	__pkvm_host_share_guest, pfn, gfn + 1, 1, vcpu, prot);
 	WARN_ON(hyp_virt_to_page(virt)->host_share_guest_count != 2);
 
 	selftest_state.guest[0] = PKVM_NOPAGE;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 83a737484046..0285e2cd2e7f 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -347,7 +347,7 @@ int pkvm_pgtable_stage2_map(struct kvm_pgtable *pgt, u64 addr, u64 size,
 		return -EINVAL;
 
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, prot);
+	ret = kvm_call_hyp_nvhe(__pkvm_host_share_guest, pfn, gfn, 1, prot);
 	if (ret) {
 		/* Is the gfn already mapped due to a racing vCPU? */
 		if (ret == -EPERM)
-- 
2.49.0.1143.g0be31eac6b-goog


