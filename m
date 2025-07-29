Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78A1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wF2h8ScGoC7OanPGG/hP6EWf/t8cFJTqDkywcYBe2kU=; b=UZMM2zqF7P16fNWzbZa7+dBhOE
	aYHFqIxrVo8TmA7/NO8bOur924pLicZS8KgXk0FbA2hiEb2jdX51h5WqhzL5lQJXdLx8ZXjDkGRUl
	kfD8VUhnG25H+diK2UzJbhPHWV3klxLKKSYTpLDdOujTwJgnx1zfVZBpDwAiKhXHudpVB4iIlJWEs
	n6G0JFzxYURElWmIzy6qXRw04AivtZ7CV/jwxhWZuIVTKESQFCZgvdeVM/RVrqedbTlWP13vVChdx
	QyJFeO7Wl4Zh80zXdPU0hmPufcuhGDEl6xvKdWuJgBg1lBE9rHRXON9zw3pY+rbaw1CwRpkxIEXYX
	dQUR8gGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugu5E-00000000KgK-1F6c;
	Tue, 29 Jul 2025 23:50:12 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEs-00000000DvS-1u9V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:56:07 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-31327b2f8e4so5960074a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829765; x=1754434565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=wF2h8ScGoC7OanPGG/hP6EWf/t8cFJTqDkywcYBe2kU=;
        b=vzWVnkBjrlRcolJDUR6MpAhpuJ8dzT0diZ16n0HelpcpPmKaucBIUVr44bTNqtWizA
         i5iXO8F7soqd6Zy/OSRnRR24SPcZ5ljoBdxE14+gyxF2OM5hgl6jY5v7IdOqO2zyXBMy
         JY3mjRjXcU0ZP8ayda85gSJDEgEz+Rg1T5T2Souzp1DtvipGfK06i31AFtijeoMrSVNP
         dDqm/SC59BqEVd2jXnf23V/eQE06ODP/Ve/fVQ4y7jjCrVYMbrQv+i3ivOzZX48YDHkf
         hUwT+sw7azcwaAEYANDmydHsgrHdkMLtLLSm+MQiK8lJSKt6YbP2QLrZE2dAaq+uVc+z
         guoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829765; x=1754434565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wF2h8ScGoC7OanPGG/hP6EWf/t8cFJTqDkywcYBe2kU=;
        b=USQqN9qhzrQgXNjL9hQpgEzFXECnbpbF6HVtv0NaDEII9gZ5+CgBFlKrYzS0prvloX
         aSDtEpDVJFqRt1Fiw3pIqYzAWyiQ22kJUM1DCg2DILz6TgGhflNSG3CLY/mHJbJGCWiQ
         kab5DkLnnSkGqQ4Cl9LteAMe+bSncJbLxMmu1xm3Qr7zayxnHVAMWvlkK6ouSjwJEHI4
         onlJWeF4nO623JuKoMuImuNFV34vHFg3DqLYZb6aAl4n/jOmE1zcy9mNI8/zAKNgrehJ
         VwcjvDpOwJz13dXAsui/CLpfdbI4XjXhsm8FOIwp7OEwloUA3BqN3L+mVzUjsAAdGvfU
         7JJA==
X-Forwarded-Encrypted: i=1; AJvYcCVTTRW0fT1nA8rOJ64CZdoGe15f6ybuB+B296aKIq5m5YC92IXtF6kFwv2yFkdWqjL4+LYGzzAG5P7MqEPneslt@lists.infradead.org
X-Gm-Message-State: AOJu0YzsozCtK5Wx2rNRQ/Nn5JmdNnrxIx4P6hP3OTpbescx92IkCjQA
	AIDsA/EHQA/2RbL+XXae79NjuUI4qVv6iSmyK4ovY9fo+3Gz+y4iEArL0K4sC7VXm/wqSgDc9Nz
	AQdB4QA==
X-Google-Smtp-Source: AGHT+IEXfNMzWFuUnpYP1cCz6K5G+b+u3Xc0/pqStPWs0koB9KyFWEn1m6GJPyVim24B5D399fJqjTxhm1s=
X-Received: from pjyr14.prod.google.com ([2002:a17:90a:e18e:b0:31c:2fe4:33b7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:562b:b0:311:c939:c851
 with SMTP id 98e67ed59e1d1-31f5de2e6dcmr1392130a91.4.1753829765637; Tue, 29
 Jul 2025 15:56:05 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:51 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-21-seanjc@google.com>
Subject: [PATCH v17 20/24] KVM: arm64: Enable support for guest_memfd backed memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155606_492633_8E9477F7 
X-CRM114-Status: GOOD (  10.89  )
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

From: Fuad Tabba <tabba@google.com>

Now that the infrastructure is in place, enable guest_memfd for arm64.

* Select CONFIG_KVM_GUEST_MEMFD in KVM/arm64 Kconfig.

* Enforce KVM_MEMSLOT_GMEM_ONLY for guest_memfd on arm64: Ensure that
  guest_memfd-backed memory slots on arm64 are only supported if they
  are intended for shared memory use cases (i.e.,
  kvm_memslot_is_gmem_only() is true). This design reflects the current
  arm64 KVM ecosystem where guest_memfd is primarily being introduced
  for VMs that support shared memory.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/Kconfig | 1 +
 arch/arm64/kvm/mmu.c   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 713248f240e0..bff62e75d681 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -37,6 +37,7 @@ menuconfig KVM
 	select HAVE_KVM_VCPU_RUN_PID_CHANGE
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select KVM_GUEST_MEMFD
 	help
 	  Support hosting virtualized guest machines.
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8c82df80a835..85559b8a0845 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -2276,6 +2276,13 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 	if ((new->base_gfn + new->npages) > (kvm_phys_size(&kvm->arch.mmu) >> PAGE_SHIFT))
 		return -EFAULT;
 
+	/*
+	 * Only support guest_memfd backed memslots with mappable memory, since
+	 * there aren't any CoCo VMs that support only private memory on arm64.
+	 */
+	if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
+		return -EINVAL;
+
 	hva = new->userspace_addr;
 	reg_end = hva + (new->npages << PAGE_SHIFT);
 
-- 
2.50.1.552.g942d659e1b-goog


