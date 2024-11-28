Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FC7D6D255
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 02:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mFf9b1jkbcIPk1lRuUSamWoSedpUsq+XjDpJ8wT6fg=; b=Wr9xAi2qT4R4NYmmcxwrUEW6nn
	IJgnmyelWExMYmXxNzzXnHIVJsCxG7+3nA4sIfEW7xdLuuP+4CeL9+aZ0E2d5t8ruB+gPTOHG0vJg
	H2nJuhyayU6HJUymJJtPXhgrxPnviOLijzGEJrhpfE9Jk1slCm6G1/taxNDrBzZcfV4x1ZW7P0ISx
	tQYyLcRBgyyi4IJixF+GajcvqOFYbCqTHo2UgCfSJc50goGvoSJXYvTSz3XtPObpWkZ+2JTdQ/dVk
	yYA8X7cUFZKsr9FUUNANTs/56DJ3g6n+ttaR/aZJCvTEoCSXhe3F1A+dJjKt7aNLbm9AeY7IXk0PC
	xFXLGMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGUAJ-0000000EWj9-33IM;
	Thu, 28 Nov 2024 02:21:59 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpG-0000000ELyB-0CQs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:11 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7eb0a32fc5aso218416a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755369; x=1733360169; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/mFf9b1jkbcIPk1lRuUSamWoSedpUsq+XjDpJ8wT6fg=;
        b=BLiPHMx0mRejGHJO6NyYdSSJwGK/ElJElj+pdp4V4xQJTLLX3oI3aPHmgxJvQw81rL
         LBzChVQ1vijlWWSNWELGeK3V5plggcgW6vMcKPQNQgnARjl2Ft1QPJpHPe6jzR9HWWow
         0ooMcMKmwGPgMSFyfrfFukQS15V6QMUeZX07bsmASfIK0L9FPhvdjncDT0j989ofBPYy
         LzHeF6D9StjXnP39TnoMa8Cqg9b+3It/yYfnnCulswgMxn+WmXCFwlzwPNUOg3MO9Mlb
         qFtGI7dz4xfO8O5yWmR6Agg0QmaUubTprAhgSb93lpjxusAOBX3UQkSEDErA1e69xnRN
         CiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755369; x=1733360169;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mFf9b1jkbcIPk1lRuUSamWoSedpUsq+XjDpJ8wT6fg=;
        b=gEAUFE81sKBoD/0yZOPiE/DRRHKyv4D3i0IgMcCaAvz5qJJ3oNsbHyJ1PXh3tks2T0
         0Dr6HGq7hQ32FQkv1+tSY7fTW8EifaWxgXr+s3KOi3528c01kVJV260+/ByNwzxIjK2d
         RIb2Bvncc+PzxQEhy7+vO34Z5F/RZbbhMRfWYq8OfV6VeqZkPKJ9nCeZSFfHaNNevzCa
         hsLb3XTdxGI3OhYE22RfWpVYgybt/mQ5NkGyFh/d0mY+QxKKm2XYnRJhI/n8Bu1wH8AL
         ngQ3HoUS9ul2p54sS175PnK+WqTir3Mn2qeDZhSboD/+R8qUtQwIoWhIpkJa4HEwRghT
         HwhQ==
X-Gm-Message-State: AOJu0YxuuZdliDWh+4hCFiGX1MolBrr3SXSPi6RX54VOuKq976aDvkx0
	agaAYf4kLs3gF/vsPzJ9WpFog2Kn37cqveoHm4KpHJ+9wak2qa9tuWzSO+FdhTgtEf/6ZDDc15k
	7DQ==
X-Google-Smtp-Source: AGHT+IH5HVAxwH71e8ybYbHuEKxtEP3yXlkNICJu49WhynVenqzqkDMIejgXVsQlKc9eCbp1lS1lKkfrLgg=
X-Received: from pjbsc10.prod.google.com ([2002:a17:90b:510a:b0:2ea:d2de:f7ca])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a28:b0:1db:eecb:f7a1
 with SMTP id adf61e73a8af0-1e0e0b4f376mr8089233637.17.1732755368992; Wed, 27
 Nov 2024 16:56:08 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:42 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-12-seanjc@google.com>
Subject: [PATCH v4 11/16] KVM: selftests: Precisely limit the number of guest
 loops in mmu_stress_test
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
X-CRM114-CacheID: sfid-20241127_165610_084484_134C9592 
X-CRM114-Status: GOOD (  11.74  )
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

Run the exact number of guest loops required in mmu_stress_test instead
of looping indefinitely in anticipation of adding more stages that run
different code (e.g. reads instead of writes).

Reviewed-by: James Houghton <jthoughton@google.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 656a837c7f49..c6bf18cb7c89 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -20,12 +20,15 @@
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
 	uint64_t gpa;
+	int i;
 
-	for (;;) {
+	for (i = 0; i < 2; i++) {
 		for (gpa = start_gpa; gpa < end_gpa; gpa += stride)
 			vcpu_arch_put_guest(*((volatile uint64_t *)gpa), gpa);
-		GUEST_SYNC(0);
+		GUEST_SYNC(i);
 	}
+
+	GUEST_ASSERT(0);
 }
 
 struct vcpu_info {
@@ -52,10 +55,18 @@ static void rendezvous_with_boss(void)
 	}
 }
 
-static void run_vcpu(struct kvm_vcpu *vcpu)
+static void assert_sync_stage(struct kvm_vcpu *vcpu, int stage)
+{
+	struct ucall uc;
+
+	TEST_ASSERT_EQ(get_ucall(vcpu, &uc), UCALL_SYNC);
+	TEST_ASSERT_EQ(uc.args[1], stage);
+}
+
+static void run_vcpu(struct kvm_vcpu *vcpu, int stage)
 {
 	vcpu_run(vcpu);
-	TEST_ASSERT_EQ(get_ucall(vcpu, NULL), UCALL_SYNC);
+	assert_sync_stage(vcpu, stage);
 }
 
 static void *vcpu_worker(void *data)
@@ -69,7 +80,8 @@ static void *vcpu_worker(void *data)
 
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 0, write all of guest memory. */
+	run_vcpu(vcpu, 0);
 	rendezvous_with_boss();
 #ifdef __x86_64__
 	vcpu_sregs_get(vcpu, &sregs);
@@ -79,7 +91,8 @@ static void *vcpu_worker(void *data)
 #endif
 	rendezvous_with_boss();
 
-	run_vcpu(vcpu);
+	/* Stage 1, re-write all of guest memory. */
+	run_vcpu(vcpu, 1);
 	rendezvous_with_boss();
 
 	return NULL;
-- 
2.47.0.338.g60cca15819-goog


