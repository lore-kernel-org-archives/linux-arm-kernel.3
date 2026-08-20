Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911CCC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AMZ8TZYQN/8a08d3ypLOFhqk0OwFZ/bONgMFOnHGK/o=; b=hxf5aD0iiSopQuaNvcaG6OtfJG
	EXKMxuU9XMAfjZFoqrE09UVttYcgP6ejAP3hRd+KrwGGWMTCoSBUbEJ4LASyd73vtciIRCYueeMdd
	pT3w3RsSwbfTXb69Yh/MvrCG8SyuYXIJGbfl4khE7n3wUnbS6rGkggp7oChiI/ahyTEUdIOOXdWME
	XJ/xoGRemd0GxGETy1euNHTbg0TOHCLrx6oPN2K31b4bzIzbvTmBvlNHef9NrdFkrq8WzffybbvZb
	T3bQ4o2Wb6LpgkU9U4Vnjb9rPs+zhvW7dZb9I5kHYBuFLpUDJ1tcBa3w0QHCU/6SbaHYaruwXDHGw
	CGJUokXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFX-0000000CLbc-3Xv2;
	Thu, 20 Aug 2026 23:32:43 +0000
Received: from mail-pl1-x648.google.com ([2607:f8b0:4864:20::648])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFV-0000000CLap-32on
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:32:43 +0000
Received: by mail-pl1-x648.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so4584935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268760; x=1787873560; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AMZ8TZYQN/8a08d3ypLOFhqk0OwFZ/bONgMFOnHGK/o=;
        b=Hj25T2EUjGXcBW1npws8MdGWBJXNzpN8yp9yq+z3kQmV5adEafcOIwPz9um6Ueouna
         KuwAueqlvjpJpmhplBBK8ZolGk5J3XKioRWuEp+U+hILeIaCvTGUYXX88Jnr4R1Y6Ql8
         rRdFi9FjlA8JpsQulv9ON8VW6e99DtAsJFCydBcqN7AHws4WZG12rbNe6vYyg6t7W5RB
         +5RDKqW3ZeOVUmjtLeLacaFqOoyJY+E6DgF1vWz5Vr7TnyZJMaWunzOMCcuuPXZZxkZy
         lHrtEi0YNcneuXbggZ/TE5jUdCDL7ldyr6B73J4HSZ/IOAR/7PneCU3gppjN5dJC6Mey
         gjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268760; x=1787873560;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMZ8TZYQN/8a08d3ypLOFhqk0OwFZ/bONgMFOnHGK/o=;
        b=ZuGKHMpplemyy89B6rfeDNnXuStHFvW02VtEwqKNe5Aq9F1lcgpbWkoa8n+Vi18Xea
         pHjwR637HBZOD5iN9JCFfnXUeFyTbYN+AhWSmllaRrgBknh6vJ0rzceavWmK2Byf0xaS
         yZxxfit0JDc6NdZj2IsfjT9him9lXvgUY78OSCMK01BprUlWq2WiHGTsYcx/IWoT1zlz
         jSJt5zZlLQE0CJb+DB2UQ3DxhXxWiPx3hqspaf3oiYIdnCFFtoRKzZnHUL2OuuWIZII+
         +48rptYvyLZg00FxjyFUCx0Vf1s2fw0HXmBw+U4msQfUlkE9zL4iXdNJo5p2QauGC0dK
         BYww==
X-Forwarded-Encrypted: i=1; AHgh+Rqfxl9zmEZC6SSUUKD+CBv1M0jDqJRW4VwqiNZtCzlhGUh0q87rQCYnWomvb2dTB1u+mLB6K8CqvK64f0z3r6BK@lists.infradead.org
X-Gm-Message-State: AFuF++lEW9ECymWkxUxKN9lxLN/lT3K4pUPrzsJxtPkVsGepSoXvDfbq
	QZ80ZlEIl2/scP4L/oZU0MWgxoFXREqy5/7aSFYAV28DR0wqduippfaLuOfOL/OWFOSQtkMIfZP
	a4nsF2dB5zBXsyrftHQyL7BLcUw==
X-Received: from plpl10.prod.google.com ([2002:a17:903:3dca:b0:2d2:c22c:7b8a])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:90d:b0:2d3:6cb4:e79e with SMTP id d9443c01a7336-2d64d2f0e55mr17242035ad.5.1787268759872;
 Thu, 20 Aug 2026 16:32:39 -0700 (PDT)
Date: Thu, 20 Aug 2026 23:32:33 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJGOh2oC/43NwQ6DIAyA4VcxnMcilSl42nssO6gUJJlgwJEtx
 ncfettl2fFv2q8riRgsRtIWKwmYbLTe5ahOBRnGzhmkVuUmUEJdCiaomXCiztOAyzM4Ond5pWZ
 cQtOB1LIh+XIOqO3rUG/33KONiw/v40li+/S3lxgtKddCyUqiVv1wNd6bB54HP5EdTPAHAhm5g BSag+Ky77+Qbds+wNxaIPwAAAA=
X-Change-Id: 20260818-gmem-no-return-page-614927a29f97
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787268758; l=3107;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=0qkgLp/4gNYJUuC928LKmD9dsDMVKNfciXFJMMiMswQ=; b=ogJoOeNVzQpGoZquHAyFAMhLUlsTEwH4nWVvd8g1viOFNq1LGLdgW09j6Da0GMCMrYkPKCI0R
 YUrVrSgZ40hDPh7cUE96XyRxIlKhPEVMZJb7/gE2D0pbDbN+uO8UwO2
X-Mailer: b4 0.16.0
Message-ID: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
Subject: [PATCH v3 0/4] Stop returning struct page from guest_memfd PFN lookup
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
X-CRM114-CacheID: sfid-20260820_163241_772003_A095C707 
X-CRM114-Status: GOOD (  11.94  )
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

CoCo shared-to-private conversion handling must inspect folio refcounts to
ensure exclusive ownership by guest_memfd. A concurrent guest page fault
taking a temporary reference on the folio causes conversions to fail due to
an elevated refcount.

While this refcount is also taken on host userspace page faults, that
refcount is taken on behalf of the host userspace page tables. This
refcount will be dropped when conversions unmaps the page. Either way, once
there's an mmap() or userspace mapping, the pages are open to way more
refcounts, transient or not. This series focuses on just dropping refcounts
before handing KVM a page.

guest_memfd already notifies KVM of page invalidations, so callers within
KVM only need to respect the MMU invalidation protocol to safely rely on
guest_memfd for page presence.

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

This is built off Sean's sample code [1].

[1] https://lore.kernel.org/all/an5RJYTwlYeym--O@google.com/

Thank you everybody for your quick reviews and testing, I really appreciate
it!

Changes from v2:

+ Picked up Reviewed-bys and Tested-bys
+ Addressed comments

v2: https://patch.msgid.link/20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com
v1: https://patch.msgid.link/20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (2):
      KVM: SEV: Treat unassigned RMP entry as benign race on PSMASH failure
      KVM: SEV: Drop page refcount early in VMSA reload

Sean Christopherson (2):
      KVM: SEV: Drop page refcount early during RMP fault handling
      KVM: guest_memfd: Stop returning struct page from PFN lookup

 arch/arm64/kvm/mmu.c     |  4 +---
 arch/arm64/kvm/nested.c  |  4 ++--
 arch/x86/kvm/mmu/mmu.c   |  2 +-
 arch/x86/kvm/svm/sev.c   | 53 ++++++++++++++++++++++++++++--------------------
 include/linux/kvm_host.h |  6 ++----
 virt/kvm/guest_memfd.c   |  9 ++------
 6 files changed, 39 insertions(+), 39 deletions(-)
---
base-commit: 1b731e5ded480bd1e5546aed35584238661ce72e
change-id: 20260818-gmem-no-return-page-614927a29f97

Best regards,
--  
Ackerley Tng <ackerleytng@google.com>


