Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C6EC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNaAio5F1cBCNtxlrEFoP4xklnbz677Jx5ey+mk7fOE=; b=t0LkQrHTO2d1/kHKMkoFrgnh67
	/D5K8Y6dQo68n0d8mWydR4icCRpLAPQBtTS2ETZDH+0w/qIxkGLbx64liRP0B8/u6Qu10hS9TrvUs
	ZF6YUw4Qzhpk8csYbU/Hj5rOW6yG81OstaudWJU3qSDJ7w0gq2jjlFyGQmSNiOfEtDYKq2ea14M4V
	pbvURzS4Xf3ksb4ufcb0iU31zBcJrM0S8L1yD1qDz0eABZ2RUk0TEehqCC1A6wes6esNP/FbipmnT
	jEh+okQu4HCWKop10rPVeKnZxpkGEgrlwYFrAhFl1PrcFT2MxL7c86ryQgBC+YPuEE0rpBCDZNr9r
	xY2qjmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WR-000000028Em-1LVv;
	Wed, 26 Aug 2026 09:02:15 +0000
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9WN-000000028CC-0kzu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:02:12 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4a46e8eec4bso351090b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 02:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787734929; x=1788339729; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TNaAio5F1cBCNtxlrEFoP4xklnbz677Jx5ey+mk7fOE=;
        b=Evhkuu/meMUfVQiEtrZHzqVIC0OMiCvrJA83z1uAAxDpZCAkqbRVM0w64yyUjCuJYl
         8O+PeYVt+vsgEFtLrHi2dVeDOD/CjptuTQE8WGoZnfAu1cjr4ZON5FIJ/puGTkhch9vD
         Vbos/e5QGEidSl1sYfXhj5iN2CCbmr3QMubB8UeWv8qsfGG/HjDGCW+H476RswCLvHLJ
         r9/tgXxbZAHam9l6bkmjQqmInlDNrn2p0BJFIlqp8SmjEt2UJQlVKzMqj3a/MBaV/WYl
         Ow7xpYIdIv7kl6NBGdWEi29K5g0BX9MJt2ByxKR9vk92L0YjlzsfNoXAEGzk41YNkaWS
         74iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787734929; x=1788339729;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TNaAio5F1cBCNtxlrEFoP4xklnbz677Jx5ey+mk7fOE=;
        b=lYMz9bgettBBijuSGyhmPBb2ntAd7h2EqK/7JpUCVCnCiOSv4Z/Ov7S8VvliDffZAU
         +OpnLyrIbay7fknI0Qt504dkfKZ9Ekr1KdiRPkafwh+8Uvc5+yw9ojbzJaO6PPNAYzoQ
         kfh+euS28fmaOHZp3IrBmxHws1temvjD/iqCxdUKFPeyjvGBffv9hoT1/3qQco7FtCG0
         gVO9tFzjaIbMmYUVVmeM3T/38nGVOgveNOcQiOgIahAj1boSH4iXBs3crDWhGVkFQ4iy
         AsNFUUE+pCCFAlHVWtqOmXLcgzgk4eFwvu5myqPy0BsYReyK+CbeCk6Mfwb595Ju3SA9
         hPzw==
X-Forwarded-Encrypted: i=1; AHgh+Rrcaa9hGrBppEQlamwA512BeoMEMlMXBJuansFC19fh0n469EkzwNenR0c22wXG2kabAiElWzfIV5ZqI3sU4aZj@lists.infradead.org
X-Gm-Message-State: AFuF++loiG00kNvbstn6a2B3r3v62Tq7GwTeT2/6Gp80sQKl62mCZXf5
	zRp1fS7xQ5+w92l37EGpm3BjMLUemRdkFhgvBBqmQy2uQ3nkDVfXSQ2Y0+qooNt2Q9FB5n1Ctqc
	TEyC8kh60xzuFzUqa4zekCAFFoQ==
X-Received: from pgnm16.prod.google.com ([2002:a63:7d50:0:b0:c88:90c8:13c5])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2f18:b0:496:11f1:f2b5 with SMTP id 5614622812f47-4b366a4fac4mr6019140b6e.10.1787734928803;
 Wed, 26 Aug 2026 02:02:08 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:01:49 +0000
In-Reply-To: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
Mime-Version: 1.0
References: <20260826-gmem-no-return-page-v4-0-3bb9c1ddb4e3@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787734920; l=1353;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=wJOyfULGjQ7JJwE+0qiErJO6uCXLldGcRp+nAP+aV5k=; b=z/jEqpUrNgcyUxL/Z8M0h+X83m4nMTDrvNZG71fmUEG3iFGsl8CB+iONKXlWeTPtqJt/DJfsA
 fXBzpO0jrAZBZvXSyzkSiu1twbOvJ+XRsMxmMGFlpjbWacNRwyM4Zwe
X-Mailer: b4 0.16.0
Message-ID: <20260826-gmem-no-return-page-v4-4-3bb9c1ddb4e3@google.com>
Subject: [PATCH v4 4/5] KVM: SEV: Drop page refcount early in VMSA reload
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ashish Kalra <ashish.kalra@amd.com>, 
	Michael Roth <michael.roth@amd.com>, Brijesh Singh <brijesh.singh@amd.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	"Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_020211_250721_F04A5E54 
X-CRM114-Status: GOOD (  12.52  )
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
index f9dce8acac8eb..f094b19226b92 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -4078,6 +4078,7 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	 */
 	if (kvm_gmem_get_pfn(vcpu->kvm, slot, gfn, &pfn, &page, NULL))
 		return;
+	kvm_release_page_clean(page);
 
 	read_lock(&kvm->mmu_lock);
 	/*
@@ -4092,8 +4093,6 @@ static void __sev_snp_reload_vmsa(struct kvm_vcpu *vcpu, gpa_t gpa)
 	else
 		svm->vmcb->control.vmsa_pa = pfn_to_hpa(pfn);
 	read_unlock(&kvm->mmu_lock);
-
-	kvm_release_page_clean(page);
 }
 
 /*

-- 
2.55.0.887.g758fc8c411-goog


