Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB7DC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=; b=t8GirZPVhu/kJg2F+9nUhp1dOT
	qzB6eShZyyuh1eb8LVkxZjLKIUHOaoX2mNQQL8DfZztADp8EjLpqIqsgGKC9e8osiEAuzm3FRCDzM
	kM9yXb/+W2G43sVpcc1gs6oOnCDdigl/BIDcq5NHdE8HIssT+ZhzERH7caifBhZ9YJggomKSGSeT/
	vQ1Lgu0w7s10WaDKqOfc4sNn5h1KP5y3O0Yla12VsFhvgcUBVKsK0ebOTGWBnP68hY034JoOj3kjL
	bNtuv/Y8bAVnOmL9jAfva/7OEeakyTmkhS99Ugqb4OGcH1jqZynHbK38/InJnHtJynWkZQGJxGyyO
	Ht1t2sIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jxw-0000000FDHq-0ywV;
	Thu, 10 Sep 2026 18:57:44 +0000
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jxt-0000000FDHK-3bPH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:57:42 +0000
Received: by mail-lf2-x10.google.com with SMTP id 2adb3069b0e04-5b78e073980so10182e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 11:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066660; cv=none;
        d=google.com; s=arc-20260327;
        b=E6+/uxe7U4J3eRmXONheA566cPFKTP3pACll4FaXnTp12ET+6r4DN+gOdPV4inf8Di
         ssKmXxzpEFbbpWmWVSTioHxcWTx8tomBCySRwGjWQKzbIweiDaak/f91qRzBfGyXS3Pd
         JJ8fONR7SOX4eeRUvxObp664DGo6YDzXTPOdvTXw4ncj96wzVMvvZ2hriW8BvsFBFBY0
         UiTEqNJQP5SztpvvkrUlZisYReoh7ozwDx+YEinEm8GBVgLBkLJSEQgXEX94zcCNA6vu
         Nat4meKmJZuwLvfrrWPJr3Vd35M+nI/7qQyOPWp+LGurTT9f/JHkqcIcIUdYrzunZSwM
         F1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        fh=OJTw2sO8N1sQUnETY8VVHzsKd/h8BXBXla893eqOmwo=;
        b=TbXd+FFgRygIoEECqMso+GbN2MvTOcG7/tEGw1u7niFBePYRCrvNC+1Y3mDAsdFVSu
         O0UhuipjPiS8hg+MMMa2iXkBIx+FuQ8O8Jf1q0Y19EzknCaOHzSEhVko5z5i3zna9SOq
         B0SDeGG4pJOvnwor7wMAj2Ofh6aJB6xPl+wNniIfO7uYLbifJtIdl/XNSgh8O1580tkn
         G4JNU2qeo5EENcIVRQf/L6+OIjRwxH0Su3kLbidHgKNEfcV38cfOI19kdqB3ldoTumCo
         znMwhl5EfpUe4JeS7EPItBgBtTr1VL0SpEUm9Uss21/z8CV6jSyXS84K51sTzPd33/GP
         n3PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789066660; x=1789671460; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=r1jx/woF2cnvxb+zx1achflDOiiDHbk0wSOFxoRaWpnyq53YN8JafNeDbm+JVNKJhw
         kUTedeXwKbq41wBcZ1ffVPXrQhQGa2USvx8sscH141NxKm6DOolmVopzOjDv2gM4BAcA
         Dwy2aNM8VPYZdGUdCE09iSwgLBDJams+GXwmAlX7lOoBFRJObXxFhhhna3gjD2jB5193
         MltkxFKik9mmXjHBTgi5YgGOJcqGUGvzzpmImN7W1crjvWxzksrYjXWEiHYdmIc/EVvy
         uqx7T1S3iOiXdPLk/OOVNNyP+f48b6XVY14neDQsjOtoZ9e/Y6eD0Ogd3XA94Js+2+R8
         l+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066660; x=1789671460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZrdVF7ALBocEe70y9+Oret+TDRXY2tEOhMpJsYsf+II=;
        b=f/N/ZlmVOuo8G4WjzWhoyCxGQqXl24blbYTaL2FkBcVLOnSqW3VxHMu5j0g3eCkxYq
         s4p6NrWh4tc0S9qZk1k/0cyKM+rrf0KpNVl/Wjh5ttWlRY6n/2Dv6eipqYG1nx8MMO0S
         BMTy6wVAf6/gKONYSLPfuSrHcNAnvZt3CMvXuw5939erkrFOg9AiVZM/jy0xoiuDZk/9
         EbGrpKyevpOZOiOKmMfab0A+kBJmVPYW5UkhC0/M1kIiZXOPs71IGdi+omC6MfhqUrq8
         2U8GJ6dxNEQEs4zOTe/1oiA321z9CFRxsy3hlwQxQH5wrWWdVp8vz9RNdiPtv/QI+XXh
         4NyA==
X-Forwarded-Encrypted: i=1; AKwUvBz3lN4GPN8Fxz//jIP2uoNkEpb3Upe/ooR722lz/dX48evmlkV/PFu312monySi4rN2r46Hu0SJh0rdlpL4B26k@lists.infradead.org
X-Gm-Message-State: AFuF++lPnwh/xs+81nsuXAPkfu+r35garOjp7EWoDyZUU9HRYnFRJJOM
	4x8x+4qzfCqLZgHdm/NHB3dmluekGQP9IchOaGojFU7HQxeHHrmhCHPuu2FYFyRJWwqD9B7ULC0
	zrRTkR0MzHIz33PxgUcl3fNF5VidtPRBcCK47O15F
X-Gm-Gg: AYBFou3Lsf/S3nl9umgcNcKoCHhBZu3PNtqXwRax5COxdu4BfZ5I4emNZcNXKlxba56
	DMu8oKKO2mfrqxxYs+lHAxz9ks0d4PNUsMl856dnQPC22kifatIPK1fgrU0PIHrhsUfWqvxTiOW
	KfD7kLVRZ0CSaR/SCCtedK1WQXqZSDircHZqIr5bwv7sDxchpgBuyHrgD+OwtnNipOxwkmrwIdi
	syW972cSRNBpdPkNjU2OfI7/PnOMlkKvdjxcbxNGQnv6CxjcE8lAVujLALpifDUMTt7njKHqztr
	eI1SHIqP4yrsJOrBRvNyOJtIigrImUZ4Tz5JO0RhokCYn+iVDF/j0nTiH2owZ2rUZycwk4lHctv
	AqUYOR4fGyaUCPcmNXiDtheNk
X-Received: by 2002:a05:6512:108c:b0:5b2:a967:c0c9 with SMTP id
 2adb3069b0e04-5b8a07ad04amr18706e87.7.1789066659207; Thu, 10 Sep 2026
 11:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-kvm-arm-prefault-v1-0-befe8947702e@kernel.org> <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
In-Reply-To: <20260825-kvm-arm-prefault-v1-8-befe8947702e@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 10 Sep 2026 19:57:03 +0100
X-Gm-Features: AcwNN1WRbRt_RViN6lNXEa633ZkRLMSCIUfMJ0FeZLRCcdVLjr-AEUXzwXInRdA
Message-ID: <CA+EHjTy8m=b8D6sLOTv3AW05vXqFPRrTYvG7-t3D64Vt1+jAWQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] KVM: selftests: Add nested pre-fault test for arm64
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jack Thomson <jackabt@amazon.com>, Jack Thomson <jackabt.amazon@gmail.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Vincent Donnefort <vdonnefort@google.com>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Leo Soares Passos <Leo.Bras@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_115741_928398_A051ABB9 
X-CRM114-Status: GOOD (  16.63  )
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

Hi,

On Tue, 25 Aug 2026 at 17:02, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
..
> +int main(void)
> +{
> +       struct nested_s2_state s2;
> +       struct kvm_vcpu_init init;
> +       struct kvm_vcpu *vcpu;
> +       struct kvm_vm *vm;
> +       struct ucall uc;
> +       u64 npages;
> +
> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_ARM_EL2));

Would test_supports_el2() work better here? It honours the NV=0
opt-out, and since HAS_EL2 is set unconditionally below, NV=0 doesn't
disable this test as things stand.

Cheers,
/fuad

> +       TEST_REQUIRE(kvm_check_cap(KVM_CAP_PRE_FAULT_MEMORY));
> +
> +       vm = vm_create(1);
> +
> +       kvm_get_default_vcpu_target(vm, &init);
> +       init.features[0] |= BIT(KVM_ARM_VCPU_HAS_EL2);
> +       vcpu = aarch64_vcpu_add(vm, 0, &init, guest_code);
> +       kvm_arch_vm_finalize_vcpus(vm);
> +
> +       npages = TEST_MEM_SIZE / vm->page_size;
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, TEST_MEM_GPA,
> +                                   TEST_MEM_SLOT, npages, 0);
> +       virt_map(vm, TEST_MEM_GPA, TEST_MEM_GPA, npages);
> +
> +       vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> +                                   NESTED_S2_ROOT_GPA, NESTED_S2_ROOT_SLOT,
> +                                   vm_adjust_num_guest_pages(vm->mode, 1), 0);
> +
> +       /* Run the guest until it has ERET'd from vEL2 to vEL1. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_SYNC:
> +               TEST_ASSERT_EQ(uc.args[1], 1);
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       /*
> +        * The vCPU's last-run context is vEL1, backed by a shadow stage-2
> +        * MMU. Enable nested stage-2 with an empty root so that the ioctl
> +        * fails if it tries to interpret the userspace GPA as an L2 IPA.
> +        *
> +        * Prefault in two halves so that the second ioctl exercises a
> +        * repeated shadow-MMU attach and canonical stage-2 swap.
> +        *
> +        * (Note that an implementation that wrongly populates shadow
> +        * stage-2 page tables would not be caught as userland can't
> +        * inspect these.)
> +        */
> +       s2 = enable_empty_nested_s2(vcpu);
> +       pre_fault(vcpu, TEST_MEM_GPA, TEST_MEM_SIZE / 2);
> +       pre_fault(vcpu, TEST_MEM_GPA + TEST_MEM_SIZE / 2, TEST_MEM_SIZE / 2);
> +       restore_nested_s2(vcpu, &s2);
> +
> +       /* Resume at vEL1 and touch the prefaulted range. */
> +       vcpu_run(vcpu);
> +       switch (get_ucall(vcpu, &uc)) {
> +       case UCALL_DONE:
> +               break;
> +       case UCALL_ABORT:
> +               REPORT_GUEST_ASSERT(uc);
> +               break;
> +       default:
> +               TEST_FAIL("Unhandled ucall: %ld", uc.cmd);
> +       }
> +
> +       kvm_vm_free(vm);
> +       return 0;
> +}
>
> --
> 2.55.0
>

