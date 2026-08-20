Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A826FC5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 23:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9DlHJtu4nYE/0Q7Tlo35sv+3vAygx91goMAZ3ynrq4=; b=qt7O/7LmAplTRbcRM3CvfxQWkf
	xVmQAAzVbNJhVcC/oTzbvy8tC1ORfg2QftgHAsCKTSEbFctcCmHsZtXuFOAEJJnnZkw0EhKUPc4ir
	lliwD0NPuLnhsVTTdAXpwCHkRx8lliNSetMcwLppyDw3lYFrNEn15wXkCRDhr8Am4zsmh15H1xAcU
	nJzcGlQGiUfQpuBeI2o5XJK0BBu2cOd7TnuxgMPcRnCU+37eEjJ8JycvX6k/VcE2BdW69JmGT7VAZ
	f15CachQgk0Xm1h27MzKW/yTIzIkRbANZxUl3iw2aPc7aWbKDg/c2IbgQM0LQRiRcjBrUKMbZfBtz
	mp12cM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFe-0000000CLdx-2ECQ;
	Thu, 20 Aug 2026 23:32:50 +0000
Received: from mail-pf1-x445.google.com ([2607:f8b0:4864:20::445])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxCFa-0000000CLcI-1mSD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 23:32:47 +0000
Received: by mail-pf1-x445.google.com with SMTP id d2e1a72fcca58-84e1da97175so483013b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 16:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787268765; x=1787873565; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D9DlHJtu4nYE/0Q7Tlo35sv+3vAygx91goMAZ3ynrq4=;
        b=h67yW1nPxNDidSVgK1acvqWUh7yqif5T3xzWUwVKT0DNt9tDClLTrFrrB+nw/GqZjd
         +RkToaNuntfQhZCb7QLnWTjhYEM0gBAXED2ht4TB/upBSdcwWNasljIZ/ORZOrQAHotv
         nU0AIbaZ1kokAlvNTnlpLnZkldHdTNXKD4zcdQBKFIjepoj6NtbR3jgqooBwsibKGopK
         fJrjrPKhDGvwMYxpES4prUFSTKRJ0kUL8DvZTwRii/2hmDwqXWamDf/DN0QHCAyP5W8d
         rDcoyRNpSLkmdBiHSsRZIB5lyQw+W7Ie4Kmc8GpQ+8Sw/xHNOsMUL0/YtWSK9daMnfmM
         tjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787268765; x=1787873565;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9DlHJtu4nYE/0Q7Tlo35sv+3vAygx91goMAZ3ynrq4=;
        b=NpuloPVpNm3Igok1nEhbhqaO7NnV5jNxEMUvypdfo/hb/WnXoP9VADFKlsUXC4K8R5
         E+CpIRFcbvtWk1+UgAlYNT5/igrsXjxB0oif+Kjlr0LVQhn2TkLmuqu5joROUOxQeMN9
         c0gSCtbfERDjRznxisVZGl6VQj6jMm50uv5ZzX3hudWrDe5oQbtW1fktMt5oFD/7sOqz
         I4NdVAguva5rKpGqGcnSm4IIkKdNsPIOKa15JXkzowrBGRdsWxaidC4uv0X8ScwKWtTm
         88gzBMzRuk0Gu7UQCVOw0XHIxKy+h05OheyqCfv6JGhU7xxOBbFwG4ivg18ZuNLI2dko
         zU3g==
X-Forwarded-Encrypted: i=1; AHgh+RqTlNr3koWWg1V7hsW9XaUCc6LuDnaG/LX7rZM6TnY2vYiWYwf91k/Ngmnm4FaSsBaWNJS9s7sjoBjdu331XEnR@lists.infradead.org
X-Gm-Message-State: AFuF++kOiEG5IDURjPYkjf1NiqzKFvjlnDj6pdCthYXw8F9GYaA0EFDW
	kS/JRLz0Bs86V1kp3xJ5Jqgsd0iGfMhn46jYEh8BTEYikR0Z5IpZxWZnhM+2XleYWYilSi2SNal
	9uNYN5fKhb3U2f/m+xTXN2s2H0w==
X-Received: from pgsb12.prod.google.com ([2002:a65:67cc:0:b0:cc1:4df5:5acb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:8010:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-851f9aa7714mr2971480b3a.8.1787268764952;
 Thu, 20 Aug 2026 16:32:44 -0700 (PDT)
Date: Thu, 20 Aug 2026 23:32:36 +0000
In-Reply-To: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
Mime-Version: 1.0
References: <20260820-gmem-no-return-page-v3-0-3bf8f80a7b4d@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787268758; l=1353;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=1sJotEgA8ehiPs3J9DAGu4AbZ2bnjjEWvNkwbMlJckU=; b=x9w/WvPH12uIL2DGAb5DL+tydH0mG6AFPF/kocY0XpSFzUkQYU6qgERR2lFjs4T457yY7MM0c
 q7HGbnpu+exD47dSoIA22tQ/jsBNKwgkYwIbWfbJghtPXWJ6s+RH79A
X-Mailer: b4 0.16.0
Message-ID: <20260820-gmem-no-return-page-v3-3-3bf8f80a7b4d@google.com>
Subject: [PATCH v3 3/4] KVM: SEV: Drop page refcount early in VMSA reload
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
X-CRM114-CacheID: sfid-20260820_163246_469372_953EAA5B 
X-CRM114-Status: GOOD (  12.75  )
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

Reviewed-by: Michael Roth <michael.roth@amd.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 arch/x86/kvm/svm/sev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 563870342a2ba..0375ef709ee2c 100644
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
2.55.0.766.g2966f0265a-goog


