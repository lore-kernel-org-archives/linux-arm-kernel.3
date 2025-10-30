Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A97DCCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=; b=4MlMsM64d3qUGHgxBnVKyrlhft
	VR0TGpxC/+i9nRdWhPv9sx6zuot6FwbmNZ9f07mH3GishTNahUM8iaj5qNP7rYwN7LIB5drGcHM6q
	Ej8wYanOb5fFz0BQ260Kqk2Yc1OPYo/s1qEGCjLOWfeO4CW9pzN1TMly+nGRpd8CyRCCoa+IY5y1b
	UgGOWPu3fIkZrJvtVVDJuW2Di6ySXfwDWBiHMUHlECQtRWT6oJxocKxUfqqs+zNIzUwEhKAaY4Z0r
	R6wNhJt8Guo70IcGzETZQSI6yk5oP9MQcwlz/kFAvceedeXdJ79XKU20hw9EJdZnDdJEYQijGWBXn
	2n67E3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyZ-00000004jiI-3Arz;
	Thu, 30 Oct 2025 20:10:27 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyK-00000004jNt-4336
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:14 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-336b646768eso1559922a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855011; x=1762459811; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=gy8lPejeDVZXNYtzQGTLkNsiqx8JxuTzdiRKtETBXa0hSoCU3umgJkQykwJzpbDpwF
         cPYFPZJhW4pgV+jFRgMcA6te9BwGW+S3b1fI+Ys/PFiPXVHdmetDFu2Gazi6gV1RhV4L
         PajxL2LtJHhA+c0m1YqS40lHH9PQnO/cKjU09Gl30UT3NMPA7UivmlYYC6uPWbUIa9I3
         TyMga+Nn6/zhfjfvrLuVJD71NhNseK4JJeuHqnx7gtOf7qdpgfrB2+VP4cK7bz4/6kLa
         pFcdMPRaI3MBL8r8fTVL57DSFdLZKKls83LZ2g1JwkKQPZmMNsjWTl6BfeEtcKQp26NN
         GaGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855011; x=1762459811;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+88J8V2FFjpoCz/RKjLuOTT6WQDejtYqs45iSU51c=;
        b=O79e3HK2hWFQHqoVjx0mJdTow5hF3sAuXHdVbcNdnMIyaRWIOntK58rNndHD+8kjCB
         +hpAy+e+HlY+VS+fP1Si8oIkdUTV1CIyDSdAkhr6pChkd3h4fx1Z6TgPumzaeKO2J40O
         Gvr9AMFfsssJZ6UpxEIhMtd9thSnkrJaQKXf9/yaMxlLJDoiSmHBsTtLHB/2NoMOzQh5
         v4W3TOmKr7A+4n47SMzE33lEzmUYSr0bLGg4HcoTdJVj6Ml3c3XCJ00zS+Cis0qJ7Vd+
         n2GwGFUoHapSKPIuAKnB2ZyeZ3Bxq2ymzTMY/JbTLPx/k+BnvCdqKq5wUr4Jyn3HxZk6
         0p2A==
X-Gm-Message-State: AOJu0YwdV4r39cqn3gKWaHLa8i/FCIdhKhDAw1MNywFSg1dm3w2iViPg
	r7FS+n8/dfNeVAeNlu2navqXQnzwk8sTAZY3wxF6QXAPMW55uGtKo/+7e3vcvNvC9ZTA3YFn9wX
	1vgC73Q==
X-Google-Smtp-Source: AGHT+IHqKKH3jALoT7jRe2OHIQ2mXXV+pELYiJKGwKEjf4ZIM+twJ+5jG3TjV8eGRlfpIUNYgujs+bg0n4E=
X-Received: from pjji4.prod.google.com ([2002:a17:90a:6504:b0:33b:dccb:b328])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8d:b0:33f:ebc2:63a
 with SMTP id 98e67ed59e1d1-34082fc2cb0mr1192488a91.14.1761855011296; Thu, 30
 Oct 2025 13:10:11 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:28 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-6-seanjc@google.com>
Subject: [PATCH v4 05/28] KVM: x86/mmu: WARN if KVM attempts to map into an
 invalid TDP MMU root
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
X-CRM114-CacheID: sfid-20251030_131013_089273_C821A5CA 
X-CRM114-Status: GOOD (  10.01  )
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

When mapping into the TDP MMU, WARN (if KVM_PROVE_MMU=y) if the root is
invalid, e.g. if KVM is attempting to insert a mapping without checking if
the information and MMU context is fresh.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/tdp_mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index c5734ca5c17d..440fd8f80397 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1273,6 +1273,8 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
+	KVM_MMU_WARN_ON(!root || root->role.invalid);
+
 	kvm_mmu_hugepage_adjust(vcpu, fault);
 
 	trace_kvm_mmu_spte_requested(fault);
-- 
2.51.1.930.gacf6e81ea2-goog


