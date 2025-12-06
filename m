Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7D1D3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=; b=InGFC0DlR6whr6mrTaFDvJXHzA
	jImZeRp+Lz1YeFT4Wkb+iaLL/VRykKUkNb3TDSGZwFVn2gtuAj7GnFnuOvXJiWRL1Q4p+RKomjlEv
	vugi6axY+yR9Se+NsWFMYWfxBf88XnB1zOQ7mXybsZZaJL0ns4lrOmLJ4WDe2GjpCVI0PaFVwcNL8
	rPrKTCSRb7I58YKou6FpAIppGr2hVZyRievtlYmGvNAWR/+0e62+iX4HWP1dr4sGtlCjsHLwUu5mM
	WiNzZ6F511NKQdtclz6KSBMqqysHJ2oiBAjdGrGETv46LPOUtesUnp8FD0BItYOlzlNYBaEfdFYpV
	gbFYUc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2O-0000000AJfT-1OyJ;
	Sat, 06 Dec 2025 00:20:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0k-0000000AGJ2-0xvk
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=; b=YwYaE3l53s8aLG4EJ/TB+LYkxx
	G7wB8vuc7LDG4hQ9192KE42jnjOhbrvzAGzRGeqwTO+UHCo0eDR+lpe5r0ISZg3tjSuWJxy0L4UzF
	MqmkuwYYnRex7cKhs0gqZZQrSL8jJMt5WNFJIOrcJ/oXyOoIL96lZlYg4rF8hSUn1ibdeyjx1qaUY
	6wSCm4P40tQszeM7PjBhTyzKsR9v4ugU66XTiGCQy9fi1jaUl5S8oJPW/bYP2xKuwX+qeC7tTiMWO
	iB4/6VTd6AUtK+fT7BnmLgkje380Pk0NFY0nmQk8+lkrej7oaoe108QDNazpdKC0un/qbt0I+UuGS
	21gk3IBA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0f-00000006Skb-35P1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:52 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34566e62f16so3090449a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 16:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980326; x=1765585126; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=;
        b=aJS1l01y0RXN3DhJh+egHkjGRuoRFVL7/GAbI4id7y79YNEdS5GBZGEH2HurTcrVrF
         F/xFEuhkBLe24WJgS4NuSL2TjuX6roS8+rmTHH9JyA3JlkyKLScmISuOnzdtsJXPcxTd
         lrtmgOLj7wiWr43SYrctx8GIYllnT04JHx5aHZt+Zu0oVTvfRI089EnYwE3ogn7glU0q
         FEY+4KYpPDMcbYbpW/+FKOPM9sSYD1svbI0rOGMD1wxslbA/ImtK5I3IIy+HFJfcngY7
         tRPzuDB+undJetbOhgzwt/npu7PYERBRB7mOi+tgfh+Gal7+HqLS8v6DaUwmFWkWuNAr
         52mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980326; x=1765585126;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OETTgwJdKjLOXcIOe9hfqxKY+IkrMGSVX3FLBG1neIA=;
        b=AvxQ2OTasf+RJ0OPHkkWGHTfqJz8EQIdN0LwBK1OcgtFY8CGUrRckIXFWdRLlHZ1ty
         BTqHzZxgLMrUKveYAdm0+wA42fqFIRWd/apFJXcQpsoYgq8FMDiqNfFoAQh0BUMj2tyg
         ms7ZYc6qH0LHmBjVVyfjhr3WfYBbBoJYBXaOw/Mq4Dr2tbBQIHTXqAZ4xNpItoK4gTzs
         0J2GKzLeJlMSXZA07dAjGG6ozaCB5Yydom+bpKkwr95sGT12OU0mCPQeWs8JF4F4Kb2B
         rlTCmP+H7snuPuvYBYVOke4eIbf5j5HEiX0zIrLuYqSzO0AWe3Kq0INe8GIrwWe0Zi/u
         uwzg==
X-Gm-Message-State: AOJu0YwsiMmOE2jeo8u9eSlk4s/mRheFiskJKjwezaI3mNWacRkvJJQi
	fnynyXXB7SH/gwCgaKun61GN36HX5RLJuW5Gn7oeTVQO2cyRVaDjIwZITQCDMz9AVvJdW2QocKe
	IJruB5g==
X-Google-Smtp-Source: AGHT+IEhe1pZpq0MW23HxJ1d0U2ymT/Zcg6wxeHV4r8IvmytRP6tpgYpoHJSoQtNjxepJopTb3+TB9OPRJk=
X-Received: from pjis4.prod.google.com ([2002:a17:90a:5d04:b0:340:b1b5:eb5e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3ecd:b0:340:f05a:3ec2
 with SMTP id 98e67ed59e1d1-349a25fb8c0mr658162a91.17.1764980325670; Fri, 05
 Dec 2025 16:18:45 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:15 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-40-seanjc@google.com>
Subject: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load list is full
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001849_939588_86E9321F 
X-CRM114-Status: GOOD (  12.47  )
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

WARN and bug the VM if either MSR auto-load list is full when adding an
MSR to the lists, as the set of MSRs that KVM loads via the lists is
finite and entirely KVM controlled, i.e. overflowing the lists shouldn't
be possible in a fully released version of KVM.  Terminate the VM as the
core KVM infrastructure has no insight as to _why_ an MSR is being added
to the list, and failure to load an MSR on VM-Enter and/or VM-Exit could
be fatal to the host.  E.g. running the host with a guest-controlled PEBS
MSR could generate unexpected writes to the DS buffer and crash the host.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 38491962b2c1..2c50ebf4ff1b 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 {
 	int i, j = 0;
 	struct msr_autoload *m = &vmx->msr_autoload;
+	struct kvm *kvm = vmx->vcpu.kvm;
 
 	switch (msr) {
 	case MSR_EFER:
@@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
 	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
 	j = vmx_find_loadstore_msr_slot(&m->host, msr);
 
-	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
-	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
-		printk_once(KERN_WARNING "Not enough msr switch entries. "
-				"Can't add msr %x\n", msr);
+	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
+	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
 		return;
-	}
+
 	if (i < 0) {
 		i = m->guest.nr++;
 		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
-- 
2.52.0.223.gf5cc29aaa4-goog


