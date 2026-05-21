Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B57CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcxdHOKzYSh28oVM+92+Sl2qXUwj5KIsOOEhTqQ5qbU=; b=Q0riUAaMIevYWg0ws27VSieoox
	R0EcG0dluGoTqAQKuuiDe6jPra/MGoNbv0MLg7JZlAJkihE0Xq67wEDfz4vfb3gq2nZb8FaJZAATR
	RQHtL8v0jJuNlnb4pRXZT2sAxY7oyGyDPeBmT8ipT9U51G8V4Y4nnBNZN7BvllvbZpBpZVHQiMMTG
	HAzmsBtANoc3JHB2MFbuqIY/BwD5ZNMCLQzvDwrZmguNSnF5qiSmXlS/omwR+o+sQsjA7/6qwhwBK
	kKG/gZD8sywvhPEOue4KF03W/VkTe3ZTg/TYlOndx1rQ1BKzyfpzfVaGFq8a6Qv0Trc037OntpiC2
	l63xT3WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vr-000000085jq-3TuX;
	Thu, 21 May 2026 14:36:39 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4Vn-000000085gP-1d7L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:36:36 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-67fd8c53ccdso1527279a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779374193; x=1779978993; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcxdHOKzYSh28oVM+92+Sl2qXUwj5KIsOOEhTqQ5qbU=;
        b=u4hWV0pVkTRErBopzBX9CgOkBYI3XPMrMcbJusfX4/vB3J0avWR2B/q2jej7aTkgv6
         QSuefatqOUMnYiJxF8xdf+jXJBgJL33y/f71NYBMCY40u/uk/eeP+5LnIpo4X1Suv0rM
         UKeEGZlDmZ3fVT/nMAsbhvhcAKEbadWNnf4xorXYYAtIK9oHf9+rFsd8LmRF6f5hGvgG
         3lT8ch5GYKCy8Yj5Aw6Z6R9GYwGvH7Z7OnQAWIHMy9+q/VMw7F8D/N4XIi8CNxJVq6GC
         WPkIvLiblBVv+AicFdoas/kJF5eSoZ737FG3VcNM1oglbay0W742ShyKWNy7modQp4PM
         uY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374193; x=1779978993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qcxdHOKzYSh28oVM+92+Sl2qXUwj5KIsOOEhTqQ5qbU=;
        b=em49n48+AnO0uQ5DcGYsJXaEPCMkLNWKog2lCKghn8SQtnbV+IgiSJxgxc0XkcwzzG
         irFJuCC8C4fbLH9IDA5q5hy+FYpT+BiLic3qNzsv1RRV8dQRD0mnqbFWbhs6uSMoSUT2
         45lPFnazf76TIc3zmAI/fMCoPKblILesWeDLwcLR07r5kzAPC6hgqv9bPOGWaj90ydRZ
         IOnRzAhGYaeY4mJmktlVpl4KpB3xSAjEH6tk5SCOkLmxuV3HG6rw3l9kvEAXOvw0frB1
         T0S2x+Ue5atnfwA/jOYPVlL7vzsQ/bmkE1iGCEfFstytt3aEVFYfylISOUbePMNlvoaD
         MdFQ==
X-Gm-Message-State: AOJu0YwjGg7QUaqMdjZCEodLz8nbNe3EpFKqxBcjkiW39kANUUdApSdm
	VjoMcyVQyb0RWm92LR2zymrkjOtwqsu2dddwV/GwE74TvsRpPJz7MD+Q89yCgfWWdbAnY7VQFNt
	O8zMQ2ki6IiZRDWGRkx240Q==
X-Received: from edvr23.prod.google.com ([2002:a05:6402:197:b0:683:5306:a54f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a28b:20b0:688:24dc:9152 with SMTP id 4fb4d7f45d1cf-688367d4eddmr1089728a12.16.1779374192287;
 Thu, 21 May 2026 07:36:32 -0700 (PDT)
Date: Thu, 21 May 2026 15:36:26 +0100
In-Reply-To: <20260521143626.1005660-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260521143626.1005660-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521143626.1005660-4-vdonnefort@google.com>
Subject: [RESEND v3 3/3] KVM: arm64: Add fail-safe for refcounted pages in __pkvm_hyp_donate_host
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_073635_445228_AD452236 
X-CRM114-Status: GOOD (  10.94  )
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

A previous bug in __pkvm_init_vm error path showed that the hypervisor
could leak refcounted pages, (i.e. losing access to a page while its
refcount is still elevated). This poses a threat to the pKVM state
machine.

Address this by introducing a fail-safe in __pkvm_hyp_donate_host.
Transitions are not a hot path so added security is worth the extra
check.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 986e0ac1f2d8..fee55e49c132 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -854,6 +854,16 @@ static int __hyp_check_page_state_range(phys_addr_t phys, u64 size, enum pkvm_pa
 	return 0;
 }
 
+static int __hyp_check_page_count_range(phys_addr_t phys, u64 size)
+{
+	for_each_hyp_page(page, phys, size) {
+		if (page->refcount)
+			return -EBUSY;
+	}
+
+	return 0;
+}
+
 static bool guest_pte_is_poisoned(kvm_pte_t pte)
 {
 	if (kvm_pte_valid(pte))
@@ -1052,7 +1062,6 @@ int __pkvm_guest_unshare_host(struct pkvm_hyp_vcpu *vcpu, u64 gfn)
 int __pkvm_host_unshare_hyp(u64 pfn)
 {
 	u64 phys = hyp_pfn_to_phys(pfn);
-	u64 virt = (u64)__hyp_va(phys);
 	u64 size = PAGE_SIZE;
 	int ret;
 
@@ -1065,10 +1074,9 @@ int __pkvm_host_unshare_hyp(u64 pfn)
 	ret = __hyp_check_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
 	if (ret)
 		goto unlock;
-	if (hyp_page_count((void *)virt)) {
-		ret = -EBUSY;
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
 		goto unlock;
-	}
 
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(__host_set_page_state_range(phys, size, PKVM_PAGE_OWNED));
@@ -1131,6 +1139,10 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	if (ret)
 		goto unlock;
 
+	ret = __hyp_check_page_count_range(phys, size);
+	if (ret)
+		goto unlock;
+
 	__hyp_set_page_state_range(phys, size, PKVM_NOPAGE);
 	WARN_ON(kvm_pgtable_hyp_unmap(&pkvm_pgtable, virt, size) != size);
 	WARN_ON(host_stage2_set_owner_locked(phys, size, PKVM_ID_HOST));
-- 
2.54.0.746.g67dd491aae-goog


