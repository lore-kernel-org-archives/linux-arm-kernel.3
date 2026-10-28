Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A960A2633
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kqZhZGyq;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nki9NboK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=; b=kqZhZGyqu0snBtcAJcepX1TI29
	uOdpNR+4IcZ8rF+Phm0DWSZJkUvb4SPp3VIAqzzh56/rfX9uLkXX7vWPmKsdLUtr5frwN4nU1hlQk
	HyPJ0H+JEsU0R75E/WSyiwvYMrtYPAme8JpI9TBs8EelvqnIcP44nH+oQqiG98E4TV32O6lirLO7T
	9DETrAwqwY/FquqA6jH2IDpo3dbD0x0Yc3EDouv1lqR4c95JSePFqo7ktRt5f0ztYlHFRpMkQHU3/
	c5APxNo0egCH9DH25Ma10YtvBnsIQWUCpL96Wx8gj5qnyovGs/LYClmVzFOPiReTJwp/H8rhLV3p8
	wMzxu9iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8w6-00000007oOy-3BWc;
	Wed, 28 Oct 2026 19:03:46 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vY-00000007nZK-2Z9C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:13 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so69987a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214191; x=1793818991; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=nki9NboKYqDh08ELnKVIwhQbr4z1h8wBKd5PZcwSai4LcJrgeluQ9ONw0FRMTU0uTo
         AJYVqze2qCBLkhk/GkSiWYc4bV9rU+yNXbyYs82Fq1jrP3/8k31mymshTJZIR4LKHomh
         MJukydeRaCP5icsULlNbT8QsAJ7YLlfFlJ2rDu3HAN0XqprAFl5UNYS/BDQ+QcUwjWcY
         5FINNDlIr/nGxKPJ1qWSkTPvR83EIlcfEKsqEb50XJGiwNq7VShHWqdRlSbF8j3I0vCG
         EnH3CQISGnxTgrBIg5Muyxk6bX58ISr51+IRCnInF2SWnAtlgAXghWtUvJvLq40B9c9j
         mITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214191; x=1793818991;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jCCEmu80ia44kI2vyDb6i59VDXRIs93I0WproZ1Xw/A=;
        b=XLqohZYrQwaPDxlCaIMVX4lQKXH69ntZFAwkY8XJyjd+s9YKHAuqXpoWlEIEPMQ+pN
         5NAQFC48TNiHe5koTcJDT+WK8N8/QmW+8/uAeI3MDGIAM90mlVC0UD48IopFVFlScYp4
         Euu1T28KsRaS2xMS8Zxu4zE2ihB4mL1/EqGk6qeR53gA5xj01nJU1KRHDJPxflBQ5fSR
         BJ33QHdAA21k8ZtG1Mj/tlZgLMGCD7pwiwa4ez7dxX68pX6ZpDf27XMn9NfPFbRV/FC2
         jv/5QHPQ3/5Lz43T1dQAsrxMurD5lgw7uNOspERfKs7/z+vs2jfl87owD4A9UC/3h02m
         gWrg==
X-Forwarded-Encrypted: i=1; AKwUvBzTuAjSJ91bepqKh1/dzWkXArHjQQS/BLpyp+Pm/W9G+g8bXVWz5xdd4li1jK+pZzsnuW9RrShr3YqYYPlde9o5@lists.infradead.org
X-Gm-Message-State: AFq9FYI/hka0Zc3XrjEFMwnaGTOwshwn4EWhVAydMuc6YIOmQ2Bdmwym
	MkSP5G2d4ojj4cXQX9TQQxHVxEE/dibcmg5cVlhlWvLVVnoIsDRPeEIF9IQ0DLuP1SUyVyzFH0h
	Yq6+UNw==
X-Received: from pghv3.prod.google.com ([2002:a63:f203:0:b0:cd6:b233:e4aa])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b06:b0:3ab:b64:5893
 with SMTP id 98e67ed59e1d1-3ae581bc654mr2418362a91.53.1793214190430; Wed, 28
 Oct 2026 12:03:10 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:59 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-8-seanjc@google.com>
Subject: [PATCH 7/7] KVM: Drop kvm_vcpu_should_kick() and use kvm_request_needs_ipi()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120312_649703_5DA2468F 
X-CRM114-Status: GOOD (  19.57  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop kvm_vcpu_should_kick() in favor of kvm_request_needs_ipi() to fix a
bug where KVM will fail to wait for a vCPU to exit guest mode if the vCPU
was already marked as EXITING_GUEST_MODE by a concurrent non-waiting kick.
Because kvm_vcpu_should_kick() (was kvm_arch_vcpu_should_kick()) only waits
(and sends an IPI to do so) if the target vCPU is fully IN_GUEST_MODE, the
sending task will proceed even though it hasn't actually guaranteed the
vCPU as fully exited the guest.

The flaw is most problematic for SNP VMSA invalidation with in-place gmem
conversion, as KVM invokes kvm_gmem_invalidate_start() => rmp_make_shared()
(via kvm_gmem_make_shared() in quick succession when in-place conversion is
enabled.  I.e. if the target has been marked as EXITING_GUEST_MODE but has
not yet received the other kicker's IPI, then updating the RMP will fail as
the VMSA is still in-use and subsequent accesses to the page will encounter
unexpected RMP #PFs.

Note, the bug exists and affects VMSA invalidation even without in-place
conversion, but is significantly more difficult to hit as PUNCH_HOLE and
.release() have to wade through a lot more code and several locks to get
from invalidation to kvm_gmem_free_folio().

Note #2, currently only x86 uses kvm_make_request_and_kick(), i.e. this is
a glorified nop for all other architectures as the KVM_REQUEST_WAIT path is
never taken.

Fixes: 309d28576f0a ("KVM: SVM: Fix SNP AP destroy race with VMRUN")
Fixes: d1a3c2162334 ("KVM: SEV: Forcefully invalidate SNP VMSA if its backing gmem page is zapped")
Reported-by: Stefan Teodorescu <fane@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1792256576b..f99a714698e3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -191,7 +191,6 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(vcpu_put);
 
-/* TODO: merge with kvm_vcpu_should_kick */
 static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 {
 	int mode = kvm_vcpu_exiting_guest_mode(vcpu);
@@ -209,11 +208,6 @@ static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 	return mode == IN_GUEST_MODE;
 }
 
-static int kvm_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 static void ack_kick(void *_completed)
 {
 }
@@ -3935,7 +3929,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 
 	/*
 	 * Note, the vCPU could get migrated to a different pCPU at any point
-	 * after kvm_vcpu_should_kick(), which could result in sending an
+	 * after kvm_request_needs_ipi(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
 	 * vCPU also requires it to leave IN_GUEST_MODE
@@ -3944,7 +3938,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, int req, bool force)
 	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
 	 * effect for unknown historical reasons.
 	 */
-	if (force || kvm_vcpu_should_kick(vcpu)) {
+	if (force || kvm_request_needs_ipi(vcpu, req)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog


