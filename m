Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56179C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 00:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=; b=wylqZ8sEBR24nWyBl2vY1KXzHj
	8l9tjtEgijW/BFu85YxU4YsaHUaxK9Yzh+O8GsEJhR70NMg5O3xoK3PFCfX4HR6gvfhdIQOschMbz
	/fT/gqgDmXx27VoLLf/Ku2NkKgN4a7OARHtQHkN9WIRS1rdeyZ9jXLu8nxVxJAr72G0w4N1XwtWAQ
	K+epjUkr+uqoMHkscYv0oSXxW8BFVO8aeMeDmuxnbV44njHFoupRtmlytaWQjSjape6QLqo+ETXK2
	M9gXZNXRVYA52iD992Rh6UmuossIeKAA8BB4t6brtc1FLciYrV8ylZFTjefblMsPu/LVkmZtsRHDJ
	5mUy3yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiOm-0000000FZka-1Xvl;
	Tue, 25 Feb 2025 00:02:08 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmiIi-0000000FXwz-0JFp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 23:55:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-220fff23644so34907315ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 15:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740441350; x=1741046150; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=3nh84VgVLnx0IeX/0dOOd1PrUaTs9ZeMugaA8ECFuK2BB0AY+JFlSu2f3CXz4+g69C
         n+FnDOeoluJdpalQLDG/P88ZkawgOWlRW7tN7xaHrvIlkWimsHccRRWdcc80mCZbu1K8
         2KPVFxobEVV8HbNxT07BgGaUqz8seg0OBq4mncbVCGQZYlKy/LToFfBR33A7E1pN7KZ6
         /+uLZJnkyAKN7Hre1fW0EZaDmypRwRNLmQtrHtXHz1HUNI3nyhBNHnDVXFPQEb+S7IJN
         KFrwkuFbsn+Amy7din4sWE7oXVQ5aNmc6LCzljehXc8oRRwQXp0FahhTgDajN8ItpyAL
         aa/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740441350; x=1741046150;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cX82JgrIVLcCgP8NY5WI6d8YhxJG+M3Mihkk6f4MOJg=;
        b=ENRhdzX271GgZg90vV/IHr0sY0bbfQ03y0ni6VVBgTOQdF3JUzBAxRSjBJn0JC/fhT
         ctCzvqW3rkUD+PJ218jaBG27ZT0f0Sjj8cOZTX9TeG5ZZAuV86yqFOv0Flz2Ws2xgw+Y
         /tii6PFQz1GNOVTdGYiOmisFXxaXztmEybe5LHcd7BKvrSN9z92I2yXiQd4/EdiwUezq
         YPsDG3eDBFj0sOTT3MjWkxfsfbjkl/cIP9fvedlLz3yVQQqTu+yeTXSOZ+n8C/J0OeJW
         c+6r7N0kh95z9Bg/I1Z2SY9zVdBnYtJhQdlAjEQ/XFikOHJjaFL/AjG7iwperV1DHmcc
         G2Yg==
X-Gm-Message-State: AOJu0YzWSKHHd1gjCrfxdmUv/LagjiUZiLAO8no4aJy0SOo2XmSaByiG
	hUTOVVNqH3A+V2kjRwSmi6vImRnMgCaINvegk7KUPEfn9tuJkF5ELIY94E+ZnWq0jaJx2YSU2i0
	mNA==
X-Google-Smtp-Source: AGHT+IGsyGC9C+MeujnUnW2nPba4jsQ7IgXXOkNko0b7VAiFOZ5bP8OY6ummej4/xlJQLwWUr2RcXaF45Ig=
X-Received: from pjbse14.prod.google.com ([2002:a17:90b:518e:b0:2ef:78ff:bc3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f8d:b0:220:d81d:f521
 with SMTP id d9443c01a7336-22307e72198mr15100345ad.51.1740441350608; Mon, 24
 Feb 2025 15:55:50 -0800 (PST)
Date: Mon, 24 Feb 2025 15:55:38 -0800
In-Reply-To: <20250224235542.2562848-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250224235542.2562848-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250224235542.2562848-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: Assert that a destroyed/freed vCPU is no longer visible
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Aaron Lewis <aaronlewis@google.com>, Jim Mattson <jmattson@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_155552_113056_FAFDD0BD 
X-CRM114-Status: GOOD (  12.10  )
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

After freeing a vCPU, assert that it is no longer reachable, and that
kvm_get_vcpu() doesn't return garbage or a pointer to some other vCPU.
While KVM obviously shouldn't be attempting to access a freed vCPU, it's
all too easy for KVM to make a VM-wide request, e.g. via KVM_BUG_ON() or
kvm_flush_remote_tlbs().

Alternatively, KVM could short-circuit problematic paths if the VM's
refcount has gone to zero, e.g. in kvm_make_all_cpus_request(), or KVM
could try disallow making global requests during teardown.  But given that
deleting the vCPU from the array Just Works, adding logic to the requests
path is unnecessary, and trying to make requests illegal during teardown
would be a fool's errand.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 201c14ff476f..991e8111e88b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -489,6 +489,14 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		kvm_vcpu_destroy(vcpu);
 		xa_erase(&kvm->vcpu_array, i);
+
+		/*
+		 * Assert that the vCPU isn't visible in any way, to ensure KVM
+		 * doesn't trigger a use-after-free if destroying vCPUs results
+		 * in VM-wide request, e.g. to flush remote TLBs when tearing
+		 * down MMUs, or to mark the VM dead if a KVM_BUG_ON() fires.
+		 */
+		WARN_ON_ONCE(xa_load(&kvm->vcpu_array, i) || kvm_get_vcpu(kvm, i));
 	}
 
 	atomic_set(&kvm->online_vcpus, 0);
-- 
2.48.1.658.g4767266eb4-goog


