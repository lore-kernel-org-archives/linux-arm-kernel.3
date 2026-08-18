Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9544EC5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pnJSHEm0cKOLTTd/rL/PNENkG51D5ISDuMgN/1Gh3wY=; b=suwBdc6qTezAQMcG+B75EZZENC
	8aqIXE1Ds1B0QKQnDvdAjovENQc7As7Vf0GDjXOXHIGjQT6B0lmVp1gxILN895ZixrfewD82jrPCO
	PHidq1rxpvtHv78LCA80hQMxxlhko6HdxyhdPpVI9yN19oj+BV2dgc75gWjPRUsQIZfmeREhfGzqG
	Fb9VysJt4Y0Co+ic77xq3nIVlcWZnIHIbXEPUyLzO1k4WSbR1zHYgSaCVDyPKYB/wwBWYdLBFIcCV
	CUJqg5ZW1Chd2haMLgTytdfgLFUo7N/PmjkRx9uz45DkM1SdeeIvFOnNT91RRM5OGSU7N/jdsJWoU
	al4UXq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvO-00000007aBP-3uqZ;
	Tue, 18 Aug 2026 09:16:02 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvM-00000007aAe-0KwR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:16:01 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cc86a9ef97so88116135ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787044558; x=1787649358; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnJSHEm0cKOLTTd/rL/PNENkG51D5ISDuMgN/1Gh3wY=;
        b=gxlM37FXB/X+HQJVytQk8RwEqDKfbTG6srJzF0JJ7wK1A3kc9GLntoaS6KXNl7Dibk
         sXprLjZM5JkotK3dZjTrJpqADfa3LLLDOSfyci4kBFAd4ppOGCSVMpxMOpP9b7W6Rp41
         pnM4mGfaL0QPwHDl7MjOVfv1vR3UGZPoiogaUY3K250GOpVGl8c5EUKqZ72Q/iRj1+50
         87y9iF5P7tMhBl5GTbxNbpF8ipoTiwP3kF5E+NosfRM68SDJcmliPdJ6FcquplklNHHR
         P3H0/sFZ9uw9/eFB78IzsRtiGyna2/BvPTu9L9vsy7yJzdsVPK0Gsbiv7usG9BrMEEM2
         qvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044558; x=1787649358;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pnJSHEm0cKOLTTd/rL/PNENkG51D5ISDuMgN/1Gh3wY=;
        b=qtgu/ORZj8wlaBNzMw0bzKjtPIETtoP8wsmIcvLXJ3ZrcIfU+SZWNfqSbaQFQJZZDs
         U6zI/laSKbvDJB61Uhy5ATeBN+y0Rc0DMIq95b0Rj6FFwJA6NwIkhumEJ6bc/mjFem8p
         VRb6gEFFY9ch2ehsiVB9v657mBYRx6tI8CJ9t+laYMObqV2H8UYwfRlwang1nJD6nCEZ
         26xfQwjaz4Duz1JBasE9PSyecspVfW9wNYwiRJRHpCODxODVbu7AdpLgnClESW8VLtrb
         FFO/1XHNWVwtCab+Chc7GZCpBp69c6Kvpn2iqekW8v2HppTfinfOiYFDvRsWUxa8/Igj
         7oRg==
X-Forwarded-Encrypted: i=1; AHgh+RrdEvr/sNBZpO5aUWQGo1b52Rnjw7KooyKw6Yf1od8gNrITdt35wAvKGKqOeuvh53hNLZioJjE+FncMUHdAE6+u@lists.infradead.org
X-Gm-Message-State: AOJu0YxfQvwVD8IOmmPYbLONijfWozs4y5Uk/BbCWuQRHNEMNiupeRi3
	uvh5ZWRR+HY0V84JmijGL3mCLtWTfCYdwn6sN+c+Vf9C2mjtMzykVRU9sAKzO6p0tTPwO+F1JBE
	v/wn7WtSiwjwSo23qNzPdnUTiqg==
X-Received: from pllw5.prod.google.com ([2002:a17:902:7b85:b0:2ca:c162:e758])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f543:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d5c5381b3fmr73832365ad.14.1787044558177;
 Tue, 18 Aug 2026 02:15:58 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:15:51 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMcihGoC/32NQQ7CIBREr9L8td8ANi248h6miwofSmKhgUo0T
 e8u9gAu32TmzQaZkqcM12aDRMVnH0MFcWpAT2NwhN5UBsFExySX6GaaMURMtL5SwGWslY63SvS
 jUFb1UJdLIuvfh/U+VJ58XmP6HCeF/9L/vsKRYWulURdF1jz0zcXonnTWcYZh3/cvW5zXrLcAA AA=
X-Change-Id: 20260818-gmem-no-return-page-614927a29f97
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787044557; l=2663;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=8nfCX0wyujmL4llDuS/jfPqo2MBhNNnF8dgEODLCyh8=; b=SsJhnqW1UiCBC+kmoHXVvN7F9aUBGeKnwkUA52xWV7vWY6dfHFFLbL1X18fpaR+ijJHPWumDH
 S+ZTR8oXWHKC7FRxgrDLER+Jz8CIfVDEUeIbzEi5i6liEXv5AXMF2zy
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
Subject: [PATCH v2 0/4] Stop returning struct page from guest_memfd PFN lookup
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
X-CRM114-CacheID: sfid-20260818_021600_154634_7A227E87 
X-CRM114-Status: GOOD (  12.83  )
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

[1] https://lore.kernel.org/all/an5RJYTwlYeym--O@google.com/

I also split the patch up so it's easier to review :)

Changes from v1:

+ sev_handle_rmp_fault() does need to adopt the MMU invalidation protocol,
  please see reason in patch description.

v1: https://patch.msgid.link/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (2):
      KVM: SEV: Treat unassigned RMP entry as benign race on PSMASH failure
      KVM: SEV: Drop page refcount early in VMSA reload

Sean Christopherson (2):
      KVM: SEV: Drop page refcount early during RMP fault handling
      KVM: guest_memfd: Stop returning struct page from PFN lookup

 arch/arm64/kvm/mmu.c     |  4 ++--
 arch/arm64/kvm/nested.c  |  4 ++--
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 45 +++++++++++++++++++++++++--------------------
 include/linux/kvm_host.h |  6 ++----
 virt/kvm/guest_memfd.c   |  9 ++-------
 6 files changed, 34 insertions(+), 36 deletions(-)
---
base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
change-id: 20260818-gmem-no-return-page-614927a29f97

Best regards,
--  
Ackerley Tng <ackerleytng@google.com>


