Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F87AC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WC4sArz2tKH+wjPmCs+Bj3DeYtgEPbRq63zRADPtWtk=; b=ZPa5Vd4dgHLlB7oXx3kxbXJuO2
	sL+l71y8/+nkltwBfsHSwVLUYf33G4iXKVQ12Vg9Zeyw6iiB6o94ZBGUuFGf1F61N+Xh3uSKTW99F
	ooDnK464y2kCrp0RGki01HWBxxg6wQZm3ow/1+pIopUaI6CRzW0wrV5S9For35l1vMXBU7yATUpzM
	lTAtP2IVh4UvUpTgv3dqzqm5VBAk6LGYwt9QHdGEcWnsGzx2N7AzZt91ZPse0+Zh5prBnqdjORTT0
	P0X53rnn1hdootpTScOhgMb1gJAg7UOduYPgf2wMQaJ5jQ2+tintfvL+lIu/H1CE3hdY4Hu/wCj+V
	624wn6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z61-0000000EeHx-3rZi;
	Thu, 24 Apr 2025 16:06:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7xLN-0000000EKr8-3Mx9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 14:14:27 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso668064f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504064; x=1746108864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC4sArz2tKH+wjPmCs+Bj3DeYtgEPbRq63zRADPtWtk=;
        b=ohdSpk179yng5iAGRMOQClzdQwwZMoq05mPj0WlgIOg+gxZ7ursHrcZHeSOqmFjFw4
         CF68yIEx6ZAqO9qS2MG9SGhMcXeShx+CnLat3dQ6JZGA9jFYfU+HVQxw4T5bxFOvfcTR
         E5IBD0cHAPs4Dv/3d/6LUoW96B263lRDasQyYcCFIa3WQiZYxGXV2H2enGEABrDHjNJD
         R1NIzqAW+weWi9675xzXjAEaQgseKOeH53nHP5vvVDnECZb7zHn5AbG9jPnRBdPQXNv4
         3Ji4bKenCtIfeP5j2pQZyJRpwUoYpYYHw8InL+/9rrGrl2gvecrpZ7N3x13Mgi2ENzqK
         VuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504064; x=1746108864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC4sArz2tKH+wjPmCs+Bj3DeYtgEPbRq63zRADPtWtk=;
        b=YImMWvFmpiewau4K8mPZQv7N7tu9FQvay8VNgFWp0NUrP5J0CpHVvO+zq2tfwLKPtV
         URqFml+NonNYh2BDlAqCwmfMf04k2AbrJLzcbPFevRufvnrZlcE9jgLmyO5/F2KEmSoU
         GducHOE8fBZ8iDoxWgfi7FsS/w3YWZ2TqOrmvRlirvBd+gYjf0hNBzaWNlqPX7Y74OU6
         BHm/ZqYiHY/Nv+demIl1PU9lOSN+KLtvIj00wReCSLOvC7JXQgDAk+W7msOsmf/CVRj3
         D5VOFXv4xpchjatR+rcE6LDzT8Ki/ql/ug2xIl5Y9bDVSTIRIQ4ik8wQQh+U+j+QGxuu
         Ws2A==
X-Forwarded-Encrypted: i=1; AJvYcCUhrTxZ3E2TzARdLaccgE0lmQxgGXjmNPYOLvqCSUe+nPa+cWmuKb8TWG1wiNEjMaapkxiDXDJ8R7AgrS/w0msd@lists.infradead.org
X-Gm-Message-State: AOJu0YwNVj8tYTcqlZ+s3PwfeV0LL1XfLGFi60tkcgkWKGhfyaJSpQ8h
	CuKSOgAUr1skz/BHCeEIQ1sIA4QivdnAaPNzkKJhbvvcw+zqrXuZqrXF/17vAE8=
X-Gm-Gg: ASbGncucFGCehgaPwu7L4omJL3dBgTkjJ6GHOmsdvPMpZ3KLAJjH1/cStfuc+T8Z731
	yt8/uaBVorP8FO4YQI1wI+jkaK+++0ZciF570VhKjF6JQsJBZD5mmyT9RqhcX+sRIRhJMldyzib
	5V6A+FUz6EnoLqswY/BlAvRlw9KZVuhGtR5yPeh7dKauQ6h4mgNDyVV+OojU7dbAB16UAI5u7jz
	aBkGOI5dWUEHJefqay9GSZKWvSIKkk5FsFUkUgp8grqe7gc8GovrszpqONThhMM6tuLKfMWFJs7
	2/C+xC5Ko5liCSEeEibQZ9dbLw/jWOFAvSXEtnLwlCh6b0oaGseTXlTmmnVGL00YAlUW+BGYVUw
	wPZmP9CUtOCbtPPSb
X-Google-Smtp-Source: AGHT+IGeGIUXl8vOV0aXlznupMFAAmbzGK8/bha/61z42fQMkuhHsWrpW3uTjHsZlOeGVmwfVkNdPQ==
X-Received: by 2002:a05:6000:18ad:b0:39a:c9ac:cd58 with SMTP id ffacd0b85a97d-3a06cf63742mr2096999f8f.29.1745504063860;
        Thu, 24 Apr 2025 07:14:23 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:23 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 29/34] gunyah: Enable demand paging
Date: Thu, 24 Apr 2025 15:13:36 +0100
Message-Id: <20250424141341.841734-30-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_071425_840244_5F8F5D1B 
X-CRM114-Status: GOOD (  23.74  )
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

Tell resource manager to enable demand paging and wire vCPU faults to
provide the backing folio.

When a folio is donated to the guest, PG_private is set on the folio so
that we can recognize it later when taking it back (e.g. to reclaim the
folio when the VM exists).

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 182 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 179 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 687f2beea4e7..e8037d636e8f 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -8,6 +8,7 @@
  *
  */
 #include <linux/cpumask.h>
+#include <linux/pagemap.h>
 #include <linux/kvm_host.h>
 #include <linux/kvm_irqfd.h>
 #include <linux/perf_event.h>
@@ -476,7 +477,7 @@ static inline u32 reclaim_flags(bool share)
 					GUNYAH_MEMEXTENT_DONATE_FROM_PROTECTED);
 }
 
-static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
+static int __gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 		struct folio *folio, gfn_t gfn, bool share, bool write)
 {
 	struct gunyah_resource *guest_extent, *host_extent, *addrspace;
@@ -573,7 +574,7 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	return ret;
 }
 
-static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
+static int gunyah_memory_reclaim_folio_locked(struct gunyah_vm *ghvm,
 		struct folio *folio, gfn_t gfn, bool share)
 {
 	u32 map_flags = BIT(GUNYAH_ADDRSPACE_MAP_FLAG_PARTIAL);
@@ -713,6 +714,144 @@ static int gunyah_reclaim_memory_parcel(struct gunyah_vm *ghvm,
 	return 0;
 }
 
+static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm, gfn_t gfn, bool write)
+{
+	struct kvm *kvm = &ghvm->kvm;
+	struct kvm_memory_slot *memslot;
+	struct page *page;
+	struct folio *folio;
+	int ret;
+
+	/* Gunyah always starts guest address space at 1G */
+	if (gfn < gpa_to_gfn(SZ_1G))
+		return -EINVAL;
+
+	memslot = gfn_to_memslot(kvm, gfn);
+	if (!memslot)
+		return -ENOENT;
+
+	page = memslot->arch.pages[gfn - memslot->base_gfn];
+	folio = page_folio(page);
+
+	folio_lock(folio);
+	/* Did we race with another vCPU? */
+	if (folio_test_private(folio)) {
+		folio_unlock(folio);
+		return 0;
+	}
+
+	ret = __gunyah_memory_provide_folio(ghvm, folio, gfn, false, true);
+	if (ret) {
+		folio_unlock(folio);
+		return ret;
+	}
+	folio_set_private(folio);
+	folio_unlock(folio);
+
+	return 0;
+}
+
+static int gunyah_reclaim_memory_range(struct gunyah_vm *ghvm, gfn_t start, gfn_t nr)
+{
+	struct kvm *kvm = &ghvm->kvm;
+	struct kvm_memory_slot *slot;
+	struct kvm_memslots *slots;
+	struct kvm_memslot_iter iter;
+	gfn_t end = start + nr;
+	int i, ret;
+
+	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
+		slots = __kvm_memslots(kvm, i);
+
+		kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
+			struct page **pages, *page;
+			struct folio *folio;
+			unsigned long offset;
+			unsigned long reclaimed = 0;
+
+			slot = iter.slot;
+			pages = slot->arch.pages;
+			for (offset = 0; offset < slot->npages;) {
+				page = pages[offset];
+				folio = page_folio(page);
+				folio_lock(folio);
+				if (folio_test_private(folio)) {
+					ret = gunyah_memory_reclaim_folio_locked(ghvm, folio,
+							slot->base_gfn + offset, false);
+					if (ret) {
+						WARN_ON_ONCE(1);
+						return ret;
+					}
+					folio_clear_private(folio);
+					reclaimed++;
+				}
+				folio_unlock(folio);
+				offset += folio_nr_pages(folio);
+			}
+		}
+	}
+	return 0;
+}
+
+static int gunyah_memory_parcel_to_paged(struct gunyah_vm *ghvm, gfn_t start, gfn_t nr)
+{
+	struct kvm *kvm = &ghvm->kvm;
+	struct kvm_memory_slot *memslot;
+	struct page **pages, *page;
+	struct folio *folio;
+	int i;
+
+	memslot = gfn_to_memslot(kvm, start);
+	if (!memslot)
+		return -ENOENT;
+
+	if (start - memslot->base_gfn < nr)
+		return -EINVAL;
+
+	pages = &memslot->arch.pages[start - memslot->base_gfn];
+
+	for (i = 0; i < nr;) {
+		page = pages[i];
+		folio = page_folio(page);
+		VM_BUG_ON(folio_test_private(folio));
+		folio_set_private(folio);
+		i += folio_nr_pages(folio);
+	}
+
+	return 0;
+}
+
+static int gunyah_start_paging(struct gunyah_vm *ghvm)
+{
+	struct kvm_memslots *slots;
+	struct kvm_memory_slot *slot;
+	struct gunyah_rm_mem_entry *entries, *entry;
+	int count = 0;
+	int bkt, ret;
+
+	slots = kvm_memslots(&ghvm->kvm);
+	kvm_for_each_memslot(slot, bkt, slots) {
+		if (slot->base_gfn >= PFN_DOWN(SZ_1G))
+			count++;
+	}
+
+	entries = entry = kcalloc(count, sizeof(*entries), GFP_KERNEL);
+	if (!entries)
+		return -ENOMEM;
+
+	kvm_for_each_memslot(slot, bkt, slots) {
+		if (slot->base_gfn < PFN_DOWN(SZ_1G))
+			continue;
+		entry->phys_addr = cpu_to_le64(gfn_to_gpa(slot->base_gfn));
+		entry->size = cpu_to_le64(gfn_to_gpa(slot->npages));
+		entry++;
+	}
+
+	ret = gunyah_rm_vm_set_demand_paging(ghvm->rm, ghvm->vmid, count, entries);
+	kfree(entries);
+	return ret;
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
@@ -772,7 +911,14 @@ static int gunyah_handle_page_fault(
 	struct gunyah_vcpu *vcpu,
 	const struct gunyah_hypercall_vcpu_run_resp *vcpu_run_resp)
 {
-	return -EINVAL;
+	u64 addr = vcpu_run_resp->state_data[0];
+	bool write = !!vcpu_run_resp->state_data[1];
+	int ret = 0;
+
+	ret = gunyah_memory_provide_folio(vcpu->ghvm, gpa_to_gfn(addr), write);
+	if (!ret || ret == -EAGAIN)
+		return 0;
+	return ret;
 }
 
 static bool gunyah_kvm_handle_mmio(struct gunyah_vcpu *vcpu,
@@ -1614,6 +1760,28 @@ static int gunyah_vm_start(struct gunyah_vm *ghvm)
 		goto err;
 	}
 
+	ret = gunyah_start_paging(ghvm);
+	if (ret) {
+		pr_warn("Failed to set up demand paging: %d\n", ret);
+		goto err;
+	}
+
+	ret = gunyah_memory_parcel_to_paged(ghvm, ghvm->dtb.parcel_start,
+			ghvm->dtb.parcel_pages);
+	if (ret) {
+		pr_warn("Failed to set up paging for memparcel: %d\n", ret);
+		goto err;
+	}
+
+	ret = gunyah_rm_vm_set_address_layout(
+		ghvm->rm, ghvm->vmid, GUNYAH_RM_RANGE_ID_IMAGE,
+		ghvm->dtb.parcel_start << PAGE_SHIFT,
+		ghvm->dtb.parcel_pages << PAGE_SHIFT);
+	if (ret) {
+		pr_warn("Failed to set location of DTB mem parcel: %d\n", ret);
+		goto err;
+	}
+
 	ret = gunyah_rm_vm_init(ghvm->rm, ghvm->vmid);
 	if (ret) {
 		ghvm->vm_status = GUNYAH_RM_VM_STATUS_INIT_FAILED;
@@ -1719,6 +1887,14 @@ static void gunyah_destroy_vm(struct gunyah_vm *ghvm)
 			pr_err("Failed to reclaim DTB parcel: %d\n", ret);
 	}
 
+	/**
+	 * If this fails, we're going to lose the memory for good and is
+	 * BUG_ON-worthy, but not unrecoverable (we just lose memory).
+	 * This call should always succeed though because the VM is in not
+	 * running and RM will let us reclaim all the memory.
+	 */
+	WARN_ON(gunyah_reclaim_memory_range(ghvm, gpa_to_gfn(SZ_1G), gpa_to_gfn(U64_MAX)));
+
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->addrspace_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_shared_extent_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_private_extent_ticket);
-- 
2.39.5


