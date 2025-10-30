Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E27CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=; b=aKM+MZdJS4gXNyZUpzP31IykqT
	HrwJ1+0R0u6EUXVdLQtq6LV+aWho9L3UaykuRmqZaTwHB6c3IWhEnZaWQBfg/WBqUbRINjMfTuXA8
	cT2Cx7o2o07iJPGgoCR08L/vVFXqpGRAQG9kGtsXofTyrv6fd1lqJMgiQQIz8HOlBdT+axeVd1liE
	tqkuaV8+4bAmE+vyOlSdcUy/pydO/+I3E+RUbf50QZvga1kT1u7LOeLUP3V2teWqUgymoJ1T+xs/1
	f839H32ct59ktxI7bQsh1McvkAEpuv67wc6aNVOwl9Jo0feXxg62YIAOxPWYmnDDsf0cVbfKLFSce
	JwOcb5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1e-00000004nSB-36Ja;
	Thu, 30 Oct 2025 20:13:38 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzD-00000004kTm-3IsF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:11:13 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-340299fd99dso1343277a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855065; x=1762459865; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=KVcSia2MIbjphOdVN9G57u1A7kfG1lD9E79WfByl7EsJ2oxmkoMUM7BzajShsJKQAQ
         +KcEUbFNxAFL33w0C/MtHUt1WadBBnJS3fci2+MBA2glHlwaZFsm12i/DhX5tci7zAMD
         vRlQvQmY4hXmUZjYbRKKrFEt/gTxzRBwIyCfexOWY6kZMNT62kwYbCurq038HhsW4mum
         TYe+Kacqt0nKB4ma/z3tK+ly5H7uj8W36dQdMCxuWr9MBm2vlUf8mZXpbqMCIOHe7yfG
         ej2jsBbnfqgjoeRx70rn9WBLNQQq6voLFv5zuljdPnVSXaF2GR2Ku/7vmx6+zlWD6M1M
         QE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855065; x=1762459865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJtCncfCK9X54oXx991KGpYhmmpTyjjcLT5mmtOhZeY=;
        b=oYUvRFqnItQuDMlAFcg6e7/8kRaCvIdcEnYg00kftTvdd+2+eQ5S7yQiXG7gjw6jxh
         B4tmefxjrg6eSFyyKn6DgyOkHd4Z0Q4N8pqcRgEwgmHCigAj+PO9odkSY29mFoBpute2
         vS1hZwwvCEVPL43rVkkSsDyUaof7nSgREKyCD3am2xAl5df3Bs9sI6Ga02OFind+xgj0
         sx5SfscpXLWhRPk/G0S5Ka9x6wBV8RRSKmQjCpz2jZZZnzhskujfBqNFkfnm7enP+Zgc
         FxSxwn/Jo/zu2BxGIDlUC2xswx6JTwXtr4ps0nEuXBSlsrmGoTX4pdsucC9IsqluWfIr
         kwaw==
X-Gm-Message-State: AOJu0Yz46CLl15GCfgPBWFoGgsbZ971dAdBl+xKcmWc1kGKU9eTGRy8o
	7J7o3dFRlhoBNZFRkZ7/+8pG21C5t3qQ9lAmVqBRrbQriocsuiZ9aLHy1isW61e1VKqiB2UN/4O
	gNaItRg==
X-Google-Smtp-Source: AGHT+IGHOQLpfyFznvDWNUH7H5RRwumwXl+ad4M1fU9LKzyWdjNf4lBkOJxqkb3vWAdXWhUIZ0D4LKjuEDo=
X-Received: from pjd14.prod.google.com ([2002:a17:90b:54ce:b0:339:ee20:f620])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3e4d:b0:32e:528c:60ee
 with SMTP id 98e67ed59e1d1-34083055b02mr1449393a91.24.1761855065570; Thu, 30
 Oct 2025 13:11:05 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:50 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-28-seanjc@google.com>
Subject: [PATCH v4 27/28] KVM: TDX: Bug the VM if extending the initial
 measurement fails
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
X-CRM114-CacheID: sfid-20251030_131108_072642_E453CE96 
X-CRM114-Status: GOOD (  19.43  )
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

WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
measurement should fail if and only if there is a KVM bug, or if the S-EPT
mapping is invalid.  Now that KVM makes all state transitions mutually
exclusive via tdx_vm_state_guard, it should be impossible for S-EPT
mappings to be removed between kvm_tdp_mmu_map_private_pfn() and
tdh_mr_extend().

Holding slots_lock prevents zaps due to memslot updates,
filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
vcpu->mutex locks prevents updates from other vCPUs, kvm->lock prevents
VM-scoped ioctls from creating havoc (e.g. by creating new vCPUs), and all
usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT entries that
can be used for the initial image.

For kvm_zap_gfn_range(), the call from sev.c is obviously mutually
exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT so the same goes
for kvm_noncoherent_dma_assignment_start_or_stop(), and
__kvm_set_or_clear_apicv_inhibit() is blocked by virtue of holding all
VM and vCPU mutexes (and the APIC page has its own non-guest_memfd memslot
and so can't be used for the initial image, which means that too is
mutually exclusive irrespective of locking).

Opportunistically return early if the region doesn't need to be measured
in order to reduce line lengths and avoid wraps.  Similarly, immediately
and explicitly return if TDH_MR_EXTEND fails to make it clear that KVM
needs to bail entirely if extending the measurement fails.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 8bcdec049ac6..762f2896547f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3123,21 +3123,23 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 	put_page(src_page);
 
-	if (ret)
+	if (ret || !(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
 		return ret;
 
-	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
-		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
-					    &level_state);
-			if (err) {
-				ret = -EIO;
-				break;
-			}
-		}
+	/*
+	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
+	 * between mapping the pfn and now, but slots_lock prevents memslot
+	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
+	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
+	 * zapping flows are mutually exclusive with S-EPT mappings.
+	 */
+	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
+		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
+		if (TDX_BUG_ON_2(err, TDH_MR_EXTEND, entry, level_state, kvm))
+			return -EIO;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *cmd)
-- 
2.51.1.930.gacf6e81ea2-goog


