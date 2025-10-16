Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204A0CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 16:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o9SbmhQZwiusbuPbqM8RzBz4UGbORFM0qZTqA8aOS0k=; b=HjxyMeP9eDVYnCBdBt0CMSRh4+
	ooIwIKT6OIc6R/myNs5XIFVCyezPg3riEgathl4+tBq6M2PprtoIzY7I8MFtgQQQf8RBYZuwLzaXH
	/wMmvb9zEWLd/Nb89MV6X/BQKlmAaUZfR3+Ld3QgfhydoABaIYRdcL/eI3b9Wi985Gr7bdqVNKpqh
	DRpzkXkkCeVud3bZinFenQV6HLKQyuxeURLTglaVMI0+SsIw0rnpP+DxLlVCMD5GGENpgYPa5KwWR
	GbpkA4WegKsokhN059CufntvfbJnKuT0FBes0K9pq5FoGPBus8ulr46+67FmfJlkVzzeW0RCKh2BD
	6PBykYoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R6y-00000005SgG-2Lfq;
	Thu, 16 Oct 2025 16:45:56 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9R6v-00000005Sfm-16jY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 16:45:54 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-471125c8bc1so13429865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 09:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760633151; x=1761237951; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o9SbmhQZwiusbuPbqM8RzBz4UGbORFM0qZTqA8aOS0k=;
        b=2rImX+ULXVo38kuWQ4dS5TPfpmaaO4hYjEzyIe7ncsRwdeFgB/R2UJLd99n1dBZptO
         HrzgvZIBqVr9IjoUgJzl7WcWSG0C+3Os0wMPyi282yiGrIdVgD1GYjHiomqakP9BWBnS
         Otm+Y0J9U8rbjkKPvW6GuWkvq4Jqqd+ZLdpSrhxnvKqdG/qDuaoVu0b4A2ceRBL50lrT
         Rl8BSN4F3moWRsK8qUOvE6Khi3KBo/i81jyPpjSDRqHRME3Jw3In+HOHoJIi8k0YY74m
         hT2cLFerG9ptpFLm7BCuc1ixYTNwNZ12D6d/VZ8TGHH1fHYU8J3e+EIIIzrVcFlB5b0e
         a63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760633151; x=1761237951;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o9SbmhQZwiusbuPbqM8RzBz4UGbORFM0qZTqA8aOS0k=;
        b=f6ZjdQH5rbdFCZZjlsr3VYHxeSboOCAjvFrbQL+OPuCKAbyRWB0Khp20ph6RS+l4eh
         K7SVDIVO2VWYWfnlVqDwHNPn8qE7J7mnbW3LyaJxlGUHMug+R4Cdmhvy3QuQw2mNRcoB
         i7kfwtOSZcUycyS0ntKlWR9vhBBzARFWtjFv7oInTL3DV3Xh52OpIDSW8k1zXyCEs7Cz
         2n2rhkRe1xuKII1AtBpTOuVqHCqU337Mv2mgb68KEeH8hV6t7tsXtsmogj1tRYedlT6P
         E6NWCdx5XZm1ClnJkyLypDQ9RhCI+FqLQJ4QupLi9QgF93nmC0Hh7xV+AvvlGM0pyD//
         Vd/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNAuHhq5i7BsL3zW+jAxqQFwJ1eZfTB7DdFY8ZTEKm6GREBGLp61719jw+K3EgzDNM4lu3K4iP8F1e0tH7ihiC@lists.infradead.org
X-Gm-Message-State: AOJu0YwQJcIr7a99jEFwf5Ip3NA0LWmRj7XEa7pS6naorelgQpXfEB7p
	THAogz5lMqcGmLQy4xMjOjm4jm1sLcDMFGjF8HpM6DVP1kTbwStwc3Xh7ZVb4XWS47+CFt6Hkt7
	AYTjrwADQC3yxFPRkWwQdOA==
X-Google-Smtp-Source: AGHT+IHO7bMt3ey0cBeCObbuEwgWLkRaJtIUMULZrT5bRJWCOB4Klpu3BVpGfBvD91ceBxusLc/jdHvwsQsn2up0
X-Received: from wmbh9.prod.google.com ([2002:a05:600c:a109:b0:46e:2121:d406])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b03:b0:471:6f4:602a with SMTP id 5b1f17b1804b1-471179068f6mr5540055e9.23.1760633151113;
 Thu, 16 Oct 2025 09:45:51 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:45:41 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.869.ge66316f041-goog
Message-ID: <20251016164541.3771235-1-vdonnefort@google.com>
Subject: [PATCH v3] KVM: arm64: Check range args for pKVM mem transitions
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, sebastianene@google.com, keirf@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_094553_323088_6DA43747 
X-CRM114-Status: GOOD (  10.85  )
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

There's currently no verification for host issued ranges in most of the
pKVM memory transitions. The end boundary might therefore be subject to
overflow and later checks could be evaded.

Close this loophole with an additional pfn_range_is_valid() check on a
per public function basis. Once this check has passed, it is safe to
convert pfn and nr_pages into a phys_addr_t and a size.

host_unshare_guest transition is already protected via
__check_host_shared_guest(), while assert_host_shared_guest() callers
are already ignoring host checks.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

---

v2 -> v3: 
   * Test range against PA-range and make the func phys specific.

v1 -> v2:
   * Also check for (nr_pages * PAGE_SIZE) overflow. (Quentin)
   * Rename to check_range_args().

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index ddc8beb55eee..49db32f3ddf7 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -367,6 +367,19 @@ static int host_stage2_unmap_dev_all(void)
 	return kvm_pgtable_stage2_unmap(pgt, addr, BIT(pgt->ia_bits) - addr);
 }
 
+/*
+ * Ensure the PFN range is contained within PA-range.
+ *
+ * This check is also robust to overflows and is therefore a requirement before
+ * using a pfn/nr_pages pair from an untrusted source.
+ */
+static bool pfn_range_is_valid(u64 pfn, u64 nr_pages)
+{
+	u64 limit = BIT(kvm_phys_shift(&host_mmu.arch.mmu) - PAGE_SHIFT);
+
+	return pfn < limit && ((limit - pfn) >= nr_pages);
+}
+
 struct kvm_mem_range {
 	u64 start;
 	u64 end;
@@ -776,6 +789,9 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages)
 	void *virt = __hyp_va(phys);
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -804,6 +820,9 @@ int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages)
 	u64 virt = (u64)__hyp_va(phys);
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	hyp_lock_component();
 
@@ -887,6 +906,9 @@ int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages)
 	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_OWNED);
 	if (!ret)
@@ -902,6 +924,9 @@ int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages)
 	u64 size = PAGE_SIZE * nr_pages;
 	int ret;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	host_lock_component();
 	ret = __host_check_page_state_range(phys, size, PKVM_PAGE_SHARED_OWNED);
 	if (!ret)
@@ -945,6 +970,9 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu
 	if (prot & ~KVM_PGTABLE_PROT_RWX)
 		return -EINVAL;
 
+	if (!pfn_range_is_valid(pfn, nr_pages))
+		return -EINVAL;
+
 	ret = __guest_check_transition_size(phys, ipa, nr_pages, &size);
 	if (ret)
 		return ret;

base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
-- 
2.51.0.869.ge66316f041-goog


