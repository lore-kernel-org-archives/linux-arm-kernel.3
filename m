Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B831C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcYyJmxeOItQm57PoOzTDELkKzo8NHBgHiqMw1DpJFo=; b=sLJ2iZue9gNRdFD3WMnZQmurok
	PYRs9dUmWReT49WsXuxjsW+SszZlXM/bw2ERNaRh5Vh4F8BunD9PLUbE1b55qBJHkNarfBGflCNSO
	FSq8r8gspmtNbpttHJfwbwCxLXiv4cBhpJZWOM8h6gVPLyXTZOdmOF3Do1Y4NHLPgcfpmQQ+rAwEg
	mKRu3ifA8Zl5YQUuk+uDL8YxCBBR5TVKxo4BFpiHp+MW2zumDHzjVV1/1HFvGgnwcKOcCOAp+EUI9
	3e4LgvWwDHfGPQuhxPr/1x54dwG/f/hjLa4XyVlXfLRtlUrGVEhGUoiMAmIUQtOpKQAPCRE8r3mXB
	8+K1yVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFva-00000007aIZ-1TRb;
	Tue, 18 Aug 2026 09:16:14 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFvR-00000007aD3-1eeN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 09:16:06 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2cacf17c7e0so67317475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 02:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787044564; x=1787649364; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JcYyJmxeOItQm57PoOzTDELkKzo8NHBgHiqMw1DpJFo=;
        b=UcEsB5wobbRbN3BLHd1Ksj99DLHl0D+J5pUqSCr9TB1ZsYSH3xU4l8u1zW9An/zUnw
         1t/6Ay9x0iKQfVu2CJPuRasX5YtcH0RlUuT3xWweBqhinetstktpf2PlBPpp9uakNeyz
         JvRnUjinEvxlfDQpJB+n7z1TQBxl191uv/xuuUWskNdwaoRXFAsNwTO01rf/dSVvBcYt
         cJaUy73c33wDzJScFPyXtUO0TyTOfPTCyz7AYScUEDQ5oUZZf8aiiCbKi/NjftK5+fVH
         ZlPrCrbeGfIO3dZ9WB3KDFkBWV40RHhZZMoy1dVaDMP6IE1OlQFRGFVeThztT7q2MRmJ
         BqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044564; x=1787649364;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JcYyJmxeOItQm57PoOzTDELkKzo8NHBgHiqMw1DpJFo=;
        b=FF5Hz8qKSlFlxi2/Y2q0FL0IbupSsqDj4hklogzOKMSMlV5oE7yQH4ccHPSr/VUNB0
         xbkTDWNdXom1yNXiG6J27gVZij5ThkJzsoGzBIFKG+lHOtBsAYI0CdcSbxVvAuGNbLzB
         laZ8QBazWErJ9N/sVlXF302uMRvX0lHvAuuxWlG32zWzvJAZBgAQ1ObCh/3Ahmyrb/7d
         +5wcymnj8C7+cIQrdDjwGjGNQ6JC1MfToPThC+11FsOjrHM+6S5k6RPIhg3IAtaf3HrJ
         U4QuEv+VZc88ZxPcR/F3/pQSS5oXroZeC8cS2ucWMaWaEOKOpuJpKYy4hmQnRSAleReJ
         YPow==
X-Forwarded-Encrypted: i=1; AHgh+RrzE1JyA1Jb6M/lw73VSrPO7hhb2emJe2lrehrbVs+EwSsR0KtiFCr71hkQgLs5okcHAsn+JdXRey4P20rhS+H/@lists.infradead.org
X-Gm-Message-State: AOJu0YyZpV9kOqpwih4UCI9rJ+ZRhJ3rLbrhAyvS5o1z/EhynpcAR6yh
	kp1aNhccOWkiDy5tRyzGttop10qCBVXGn298HHJ9QCfbqF2w/TFFqLR0Hr3SGqXk9Rrn2ewiGSl
	r2UwtJQqGyxqxbMy3A2ZcGwWFyQ==
X-Received: from plbz21.prod.google.com ([2002:a17:902:ee15:b0:2c7:de3c:549e])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:b0b:b0:2cf:9347:f445 with SMTP id d9443c01a7336-2d3b0c7ae46mr360869955ad.10.1787044564080;
 Tue, 18 Aug 2026 02:16:04 -0700 (PDT)
Date: Tue, 18 Aug 2026 09:15:54 +0000
In-Reply-To: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
Mime-Version: 1.0
References: <20260818-gmem-no-return-page-v2-0-5298f42d49bb@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787044557; l=1303;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=Eu6toHOdCgS02ZJDxNjsrmINE4rufXfvVtLn/P5Q6r8=; b=4r394TRlnUkgQelNG88PQ96qVChnPFNFyot7lT1B9nuxLhLRLmkhypwFy2Q1Jy4P+LuelDJE+
 4XIVWacJ6u5CilOKJv5z0iQvoHdCGx3UqOwDFsxlX70DzaNRuHKHs6f
X-Mailer: b4 0.16.0
Message-ID: <20260818-gmem-no-return-page-v2-3-5298f42d49bb@google.com>
Subject: [PATCH v2 3/4] KVM: SEV: Drop page refcount early in VMSA reload
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
X-CRM114-CacheID: sfid-20260818_021605_439404_4139B503 
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
index b34b11d7f8fad..d3d620bc04dce 100644
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


