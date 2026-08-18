Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CF5C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mMKkYkkk95GIb9XsCQRRxhKodLzIwxWFmxxwcGqUN7k=; b=fwSGqFTO/pHeBCiPXlQSo3PGy1
	VDB4W8wsTs/h7cV0q0U7Wx7d3M04aXHny8d+NHnYFC4wtBhMopCJER4GOJmZ5ZeAL89Jf81BC9uO/
	uh9b9kGZrVFKVPY1ciMxYfbmfTQ0OeHEzOIZLFSwnfZu9ZCwmYi1+dsh9lPfhD0B1qToW0xjoB13k
	llW1xnoI3gziVwzcyG/7T/gqjgwEwVSWa5CKq1vdoL1qwPevMV/ZiI70BzpXHSFcm4e9VnIsMEtpS
	F/feHC5rLJcfkYtkw1h+5o+Cl0v7bte7lBcjpGrzN4ENXn4TMCeuFZbMpeyeFUGKyI7f1MwSv3wXt
	UB3Gip+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwN-00000007UxB-1udj;
	Tue, 18 Aug 2026 08:12:59 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwK-00000007UwT-0KAc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:12:57 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2ccd1958e8fso70974225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787040775; x=1787645575; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMKkYkkk95GIb9XsCQRRxhKodLzIwxWFmxxwcGqUN7k=;
        b=Iov8Zp6T6fsPPpxzYb/pCUOrfxNKYQTBx1rWLlVCb+Vl2oaU6/J2K1eFakDjNhUDeI
         8b/Pl0Gd6rwEaN5L7VNjPGoVw2xQOonM3nDGhNnVSzU4W4JHdCDTBSh5Ipzjgg+N8+NZ
         Z+QAWCMFPPP6C8qK9hI+simtYGU9ShLYViVWPoVoHehA9ZiBiWVO9XehLW8KN64pertN
         wxI86hU2gxNFxM2up/c+AM2jOzJX58KRZTCaekFS+CnHFgBbq5Xq2YsrrK6jYgakUnTm
         8R2Vwah8X4i9yhBNA/EU4C7uC/b7vDUvi+U0QJK54N/vTK2w/Vfp+qfBsabdHoGtSHFS
         Sgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040775; x=1787645575;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mMKkYkkk95GIb9XsCQRRxhKodLzIwxWFmxxwcGqUN7k=;
        b=H2EzhVvMf2ritjnpwpKjHZG5+nwCiTd2A4PEE94Q59FvjyA08mtH9864OdsYcnK94H
         ykCMQ9EYacTYS3TC1swY2Nkb4HQXkijLaOEhHWQWr3IkYc1vdWnSTkUmz5QWdVbiMOU0
         eyIBsZdkCJx7WTp0HJzTc9Ol9aW+sycgZe/AeVcRf1tdLyyeMVBVqpdVa+g4U0yvb8Kz
         d+31kUsQuGdRHTm4fBbE4xOZuE1gDesLUipLs6srtfGfc82HF9hZGwGLD6soGqYmOPPI
         A2bnsyOCgYlomOwjUAbCOxy9xJ1+wT3hpbQtxq5tcZ29TxWVJajOtsBMBgE7W7/rxYsE
         Qu6g==
X-Forwarded-Encrypted: i=1; AHgh+RqPw6MoWTvvlxQKVNud5n3tD/OkmLFKzg18X4NVx/ochzN/RJbuNnCPWRdYBhrgn+u11PqFsMOMYw5ATGZMeddN@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLezjqZQVQKsrSKLHAxD2rj07ZdLCru4Jnnd4PEfX7zBSQQ1V
	bt7fAnC5zINg6LKYB/BIlxgZGZvSoIcYVuQxHSIsuFpGhHS6IJzv8yLZokAF8XgLefo4uH8m6RL
	kadmiD+uJFgF380qiobcJH82bFA==
X-Received: from pjbei20.prod.google.com ([2002:a17:90a:e554:b0:393:13be:cfa8])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5606:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3933b78b698mr33144681a91.6.1787040774461;
 Tue, 18 Aug 2026 01:12:54 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:12:34 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPIThGoC/x2MQQqAIBAAvxJ7biElMvtKdJDabA9qrBVB9Pek4
 8DMPJBJmDIM1QNCF2dOsYCqK5g3Fz0hL4VBN7pretWjDxQwJhQ6Tom4u6J0qrXaOG1Xa6CUu9D K938dp/f9AI9JCcplAAAA
X-Change-Id: 20260818-gmem-no-return-page-614927a29f97
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787040773; l=2686;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=KUoipSs9DV2GhPl9YTTVY+WfBDpInNarT6aPDX8hhug=; b=EgeFYXGdnee+DqtAZAuFl7wPqeYsRZalvhJWB/S8hZkwyGM7a68a6iJ22FyMAzillodZx4SYz
 nbxSWklOZHEDh9KJySZJXlhyxArVikRqndiYwykZKzHFaFyg+9DTUs0
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
Subject: [PATCH 0/4] Stop returning struct page from guest_memfd PFN lookup
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_011256_149098_1561F29B 
X-CRM114-Status: GOOD (  13.25  )
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

KVM currently expects kvm_gmem_get_pfn() to return a refcounted struct
page. Callers (such as x86 TDP MMU, arm64 Stage-2 fault handler, and SEV-SNP
VMSA / RMP handlers) hold this refcount across page fault handling.

Holding a page refcount across fault handling is problematic for guest_memfd.
In-place memory conversions between confidential computing shared and private
states inspect folio refcounts to ensure exclusive ownership by guest_memfd.  A
concurrent guest page fault taking a reference on the folio causes conversions
to fail due to an elevated refcount.

guest_memfd already notifies KVM of page invalidations, so users of guest_memfd
within KVM only need to respect the MMU invalidation protocol to safely rely on
guest_memfd to ensure page presence.

This series first prepares the SEV-SNP handlers by treating unassigned RMP
entries as benign races on PSMASH failure (which can occur on concurrent
truncation) and dropping page references early in the RMP fault and VMSA reload
paths. It then updates kvm_gmem_get_pfn() to drop the folio reference internally
and stop returning a struct page pointer across x86 and arm64.

Removing struct page from kvm_gmem_get_pfn() also moves KVM closer toward
supporting memory backends that are not backed by struct page.

I really want in-place conversions to merge in time for 7.4 and so I went
ahead to try this, building off Sean's sample code [1].

The main difference from [1] is that I think sev_handle_rmp_fault()
currently doesn't correctly handle the case where a racing truncation
removed the page from the RMP table. With that fixed, I think
sev_handle_rmp_fault() doesn't need to adopt the MMU invalidation protocol.

I also split the patch up so it's easier to review :)

[1] https://lore.kernel.org/all/an5RJYTwlYeym--O@google.com/

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (3):
      KVM: SEV: Treat unassigned RMP entry as benign race on PSMASH failure
      KVM: SEV: Drop page refcount early during RMP fault handling
      KVM: SEV: Drop page refcount early in VMSA reload

Sean Christopherson (1):
      KVM: guest_memfd: Stop returning struct page from PFN lookup

 arch/arm64/kvm/mmu.c     |  4 ++--
 arch/arm64/kvm/nested.c  |  4 ++--
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 17 ++++++-----------
 include/linux/kvm_host.h |  6 ++----
 virt/kvm/guest_memfd.c   |  9 ++-------
 6 files changed, 15 insertions(+), 27 deletions(-)
---
base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
change-id: 20260818-gmem-no-return-page-614927a29f97

Best regards,
--  
Ackerley Tng <ackerleytng@google.com>


