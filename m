Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA279CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=; b=s32+KsEktXwa3qZuAcdZbmLyOd
	7elWzN6A7GRy4ek9TO+QGpu7qmlxO7p5PeYtkdqq+N/ZPSDGIH1iRqQrykzjMcluyzP8IV4RUzdhq
	xNM3+3hTODgtZ6wDOTE6C1BkSHihuEowVhw628KGii92mOwkdYhcsIXgATtCdM73JxnUf4OyHdhvZ
	OFBlYRfP0fbEpgnSHOzWQS3o3qcPZVO0RGM0W8cobun2rSamAwgReqRnqLFHfLkFRq9+lakYOEqLk
	qqTkpmit7Xp2kzMLdDS8qQz822C+9oB6r4mFgLXlfkOVH/VPGQ8Ku6QNqeRUxCZlBzaiZNFEVf9GS
	hA5k4xow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzq-00000004lGQ-2jrI;
	Thu, 30 Oct 2025 20:11:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYym-00000004jwv-1vTa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=; b=CSgnteNqi7QfTPvs8qngHlXJRy
	K+dl/Wpdw4llucQNesK7qvUQAX/HxZryuVnzWs+X190xkH9X4qgHo35JxsXeGD6hYRFqXvJWxsZOB
	U2HPiZ9I6MRwa6/fDf7PBhY6aTIBw3XoOndqS+lq5IXUVJ9L73sK1zfcsf+xa+kwdqyuTv0eijvxS
	Lf5ITuo0HhaH/vwvau6jGTkjeiNBqZfu3n2pUN76OEJjtQ+LHFKmZmzy3eZPxIK2AF1LnJ5CoGx8S
	gGx5SQgZ3pEIQb46M8pNUXjv+vgzVTuIcrRsJSXnplJzL97rypbRYtrhMKB7dDHuCvbFYHPXxTNpE
	U/+fV6gA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY70-00000009tlu-1LzQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:07 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3406aa44a1dso1645062a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855035; x=1762459835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=;
        b=ZX89Aq/ELVkKVrX3b1MNjibThQWgOKJ22+madMVMyboPau/8RJfE5EVh7I0d6rS7Sq
         MjbIHah2f5VMC7Rp2tbmeqt0A77rS9sXYfcnQjrG+xK0HT01apqvoIr9h0vj/FmM8m6P
         PUqNL+WjHdR9dMlKj0anIcP2ir3uGu6PZtSnFQRuzRkSXcqdesPCS5uQgiPq5N3KACZO
         NjldPUgJty3RRmUp6Thb6Asxih7rtarETwOWjBPpMak195YM6g7LjcomWJ69rEyWyVHt
         py5EDDtb12N0Ra4AM49RixIzIoCJenm7SLWwicrOA02W0flcp2OU2dUsrIln8TJr9YN9
         fc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855035; x=1762459835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Qp65v2XVpj2mbgYoCIcn74lwhNS3G3VX8VrR6k2zs8=;
        b=R1x1HUXRBdVng8Nn3NuQFjmMIgaYY9UBHlmzuF0ABklagM3LsYmdN6apHYqUf5IqME
         8xmcyevSfw+rOnVEOBuMJ7ZPubOm9B9X55o0UzoxIRbAhCERnUt94ifemovD0QsJ8BjG
         jQCAiaPshpwrMrt27yEOEyGkaMI4HtMaAZD4EgrlkEBZQbTIPxkBAdbzbGYIpsS1IkJx
         uqe3Vw3c1PWH7DhBx4dJJgJdmQ63XhyTvrxCgUG3YqAHcRbQ+4NlRcICK6ScSFh8GApm
         Nj4iUlmwtu8xl6MCZtpXUBORDY3OI8PTAD//cwb5XhmycQU+GFxIvxvWDGBIETpSmVRK
         64OQ==
X-Gm-Message-State: AOJu0YwjdrRiiMzuTPjNt7MNfuV+/Dj7z3xp1KRm9zVwT0HqD12ddFg/
	XRNYUy21xiWSvsAdMWg5Yh520lHRO7Ziyute2rF11x5aw04awvs9QhGKe+rSWMegcfiilYIDP+A
	u7hvfYg==
X-Google-Smtp-Source: AGHT+IHtEBN2FzRvx/PBMIz+g6mN5JL6fejVbo3/Jj6z8BZ8mwuwi1S8UZTxug0dqnAA2vI1WFCMGP+gtTc=
X-Received: from pjph23.prod.google.com ([2002:a17:90a:9c17:b0:340:2aef:8b01])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3842:b0:335:2eef:4ca8
 with SMTP id 98e67ed59e1d1-34083088cfamr1279023a91.33.1761855034597; Thu, 30
 Oct 2025 13:10:34 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:37 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-15-seanjc@google.com>
Subject: [PATCH v4 14/28] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
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
X-CRM114-CacheID: sfid-20251030_191506_485348_26780639 
X-CRM114-Status: GOOD (  13.66  )
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

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index db64a9e8c6a5..99db19e02cf1 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1726,10 +1726,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3161,8 +3160,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.1.930.gacf6e81ea2-goog


