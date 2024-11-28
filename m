Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12E1D6D258
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 02:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Agu6M4WZdSaan2rYdaSmo6PpiQZ+ciRGpotTGWqZBGc=; b=OKXFQMM8sILyeH3UZtkIuiyhuz
	vwoZGNkM/+J3khaebtzFMJm6jaj0PkxXS653BklYCXIyR+HRItaC2N9XpLSbeTQ8SPQS0fXaP5mua
	1DbY9f8OdxsIz9YpM1cZUZZsW29Qjy3rJ0amysTn0GDwZ+20FmGSdPYfwLRr3f5mknd+pycJY6Yrg
	POmvWiVxikNa9t2m+PN5LcaCx72cqS76QoHgXzqsezEt0UFv+ec1jyxl5CWsxEsZJU0aXVNUxt6Zr
	tYtPiXftHnXPE6yW9KZR+V3tyjzm9VWKI9ERO/A9lD7Zxp6VodB/z0f6NrxAFffg1kPciLZZl5YzJ
	JTx2PxZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUAJ-0000000EWj3-0t4J;
	Thu, 28 Nov 2024 02:21:59 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpE-0000000ELwu-2IIg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:10 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e95713327eso356866a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755367; x=1733360167; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Agu6M4WZdSaan2rYdaSmo6PpiQZ+ciRGpotTGWqZBGc=;
        b=sshUH0dWouhLM1oGMZu6iUtsXuqxSm1z6/S7fwfMxF4GQxJYTa6s5xbGSMAn3K3aI0
         44zBw04Co86oAbDKAxiCkJU8+544Vpu13uGoe3UtgBk0h1oqScbTIAfoxDqw+oUrwD1t
         wk8f+Fro82E6KMwkL7Ij4pWf4ZstepNfAClnO898kPk/WGnkqB0cIYZcJtROKKaIdC7M
         jh9abs2CrBqBttvW4TrBSW2pCP/l7oFr74SIbonIqrx/oOTsy4qx12h66PSbrWGV94Fq
         pyyGfW7xsfEJU4M4JBZTU7rKLL0YRAir4SvK7q7aW5xcB0UkMuWx+SRrXJTzqPy7awR4
         2CZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755367; x=1733360167;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agu6M4WZdSaan2rYdaSmo6PpiQZ+ciRGpotTGWqZBGc=;
        b=OdVRbI2dX7sa/nXf5SIfJr5oAVEWrWYR2I9JkM6NvZeF3lyMSlT12oNxJocBG11ZN/
         tKdthvn257UsZOkU3j1P6lkXrspda61smVM0K84vh0EdjG2h3wmn4pxR6+k8d/BAX4cb
         K0GVhkoOeXPEm4b+KXy3MvVcLeA/saFo9ZFmWaN3ptoxQonH7ZE1u/C4JgYkiRggQ59x
         0lteuBBcJeFH8v2J9wKdDD2IEdMIrhAN7vYQXzJujAL8Id7mCAXihFcLuwhaXgDFxz0Z
         aYV+NRidhVym17qGCoU5FJUnGa6EMYRWy23zYEKao0+temzvxMUUNGHDeUo7fnxwMd1U
         F92w==
X-Gm-Message-State: AOJu0YzpyLQs8Okak4t0LvJBux+KclyeWxETzDhKLoixZbxsqAQ511O7
	MMRXyebUdc2bExdr40oguOSSAk9y9rNb2xa6lUDTTkg7bkYklTPtG1oHp0ERC7v8bBtQEQOgxB0
	9UQ==
X-Google-Smtp-Source: AGHT+IHzlIPOR1Dozv2+kADz6uvilkOgvJy6Ih7MLR3sUMAMwXrp/UBNznMIvAz/TeA8dqsISkWCfiSMkjQ=
X-Received: from pjbcz13.prod.google.com ([2002:a17:90a:d44d:b0:2ea:63a6:d869])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c04:b0:2ea:7329:43
 with SMTP id 98e67ed59e1d1-2ee08e97ff9mr6674171a91.6.1732755367252; Wed, 27
 Nov 2024 16:56:07 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:41 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-11-seanjc@google.com>
Subject: [PATCH v4 10/16] KVM: selftests: Use vcpu_arch_put_guest() in mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165608_584320_C9CAA6DC 
X-CRM114-Status: GOOD (  10.60  )
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

Use vcpu_arch_put_guest() to write memory from the guest in
mmu_stress_test as an easy way to provide a bit of extra coverage.

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index fbb693428a82..656a837c7f49 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -23,7 +23,7 @@ static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 
 	for (;;) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
-			*((volatile uint64_t *)gpa) = gpa;
+			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
 		GUEST_SYNC(0);
 	}
 }
-- 
2.47.0.338.g60cca15819-goog


