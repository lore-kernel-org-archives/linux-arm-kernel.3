Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507CCC5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=py9oGM3siJXhjPmyy5yHILORKpTNDQOmPG7vid7oKT4=; b=VYZYwnx+FnXsQzz507XHwhG5FB
	FPDdebqa5yailoOCw2FMeVOqrXCLt/y5G1YALpTjk5PmJibRhT5SdwWZ7EfvvkrzTXguCQozuivxw
	LdvUMsnV/afaCGPiyWbRV3JXfqUre5qSKaKIgaCWWdOq5RLfmxLS1METhxaKJKQCfmvnUpXW5B4m+
	glK58vlOtnNk8bzlaPPdAPJQX3odow2EbrqOZ0bXrv/WLKgR/Oe9Ye6veOPz4tlQ08QP+PLtd9QPT
	6RzU5BZ8gpfuHzD+voGDfz5Q8X8I9e2+kz9U3mGZIJhTiwEEhXPThEY1TdMdZ9dwmhznc8wFaksZx
	Amom8xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwS-00000007Uzj-3Khl;
	Tue, 18 Aug 2026 08:13:04 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEwO-00000007Uxg-2zwG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 08:13:01 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2cacf17c7e0so66299365ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787040779; x=1787645579; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=py9oGM3siJXhjPmyy5yHILORKpTNDQOmPG7vid7oKT4=;
        b=wQxkL3yxkvZsXGhIXSYxB/+4LWNbX0n8mhJOXk+bO2HMS1Ua6JW/EQmaHMT37o7YkL
         I+hcuQ4ArFmpUPtqWfWJzltedA0j20ARIvBIqffbwV/THYL/oevVUHP1vA9JkUU920lr
         zw6xUlRuZOrrAn+WpIDh3sla8kYRaw5rplVGzfoOMojzMhnoqW3LhQKWMzRXwVbw8MIt
         VSyIGR71a6PepPFFqNLrwAs1UnmQgyCXx4LpylKXFcnwHOrI4odHRecRo9f592yIw1zW
         jfdmQnXln22uj2QUbleC87UYYY5JJlk5I1FF8BB5XUcPR8eA3F2CLs8okCB5THWsFZHb
         onVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787040779; x=1787645579;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=py9oGM3siJXhjPmyy5yHILORKpTNDQOmPG7vid7oKT4=;
        b=FBMjqfR7tnSPVY+qq2PStr/eYyqphpjfoH5kY9z1+AfG3uB/qcqsqtwhRfBX1JrE6u
         DESjNkxJR0+XZbM+82sWgpDXpywX4aJCgbVLE+9su/NlwmsRqWjwiNTNDL8OeOMIkun5
         9jDgSgbV8T5CpFU+cu6ybC3mo0bXFpycJvl45c9Scs03XMaD98Hmfrm1HzycJiFirWG+
         XkITMp87lGTAg27qOKVL63V1unTXeZyxiireUXVkKkPqMKvM7J3n3ODaK4VPC9CiFSCf
         SHbajrR7gwRcBfwW5Ca4D0q+uc6dgdYfQVR6C8HmNX3tK+M1DgU/SV6zaytSe7cK8hap
         rnAg==
X-Forwarded-Encrypted: i=1; AHgh+RrsmdHHML8h3rtiHfxFZJxilc7Bvjosu2Zr2SgG9WxutTJOxtMG2DGMK0vVZObOUC3k8LFUABK4EX+e2vz03ILD@lists.infradead.org
X-Gm-Message-State: AOJu0YxwrFThzXIuUWTdVTSMy4LkbnE9jwpD51fbnA6XEtwcoBH5b5z5
	weGiaSPjZ7bxRW9cDOOqcFmwBNcHQ7f0zpU9onRjR0CFNTounSUBfM6H8Vip6LD+rdUq/J1FXlL
	AOWFaYIoAXphXy4VSC5hgzAsf9g==
X-Received: from plpw11.prod.google.com ([2002:a17:902:9a8b:b0:2cf:2ac5:9098])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce04:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2d3b0d5e658mr384056035ad.12.1787040779293;
 Tue, 18 Aug 2026 01:12:59 -0700 (PDT)
Date: Tue, 18 Aug 2026 08:12:37 +0000
In-Reply-To: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v1-0-4f8d939efdbc@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787040773; l=1303;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=HBAMvv39sFk8+6D6cJKyVCd7nwzLeY+DW3CPjKwbem4=; b=mOyqx2L3EUevN+HReTiR9BLbQbbIVJKA9Szdy3xkBVDx5LW4GH0t8FRgmGB1JMIT6leK1f26j
 KObbm72z9rQACvWlEFb2sbi6pWXRCUOdCOO3xSedy+PeOf8JyXHnclA
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v1-3-4f8d939efdbc@google.com>
Subject: [PATCH 3/4] KVM: SEV: Drop page refcount early in VMSA reload
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
X-CRM114-CacheID: sfid-20260818_011300_759225_C60DE41A 
X-CRM114-Status: GOOD (  13.12  )
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

When reloading the guest VMSA for an SEV-SNP vCPU, KVM retrieves the PFN
from guest_memfd.

Drop the page reference immediately after retrieving the PFN instead of
holding it across MMU lock acquisition in preparation for a follow-up patch
to stop returning page pointers from guest_memfd PFN lookups.

This is safe because the page's validity and presence are governed by KVM's
MMU invalidation protocol rather than the page reference.

No functional change intended.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 19c31fa944e34..3fc582fa343cc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4062,6 +4062,7 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	 */
 	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 		return;
+	kvm_release_page_clean(page);
 
 	read_lock(&kvm->mmu_lock);
 	/*
@@ -4076,8 +4077,6 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	else
 		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
 	read_unlock(&kvm->mmu_lock);
-
-	kvm_release_page_clean(page);
 }
 
 /*

-- 
2.55.0.699.gb54405d56f-goog


