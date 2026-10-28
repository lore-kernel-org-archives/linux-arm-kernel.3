Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B257A606BF8F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O2EWKXVQ;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FSpEu+8U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=; b=O2EWKXVQZ6jKzNHr+wxOQxzjIS
	NiAmSaCJO/xVTp3s+0372rxf5r7yma+oWp8hV/edQV9OlJLHiu4PlU5FeSlhSs57Ix4IBId8UhYiC
	TDttB0Ui+bcay50r5Iud2/r6RLWbaXrTVoXRbnSzrE4fciWqmyIm3FfaFZ9w6bFEeD2q7f82s3qZ5
	/Z4mu7NKQwxZILqCFd7/1LOm+Q8tKd4yJ0TzqVgq9PgZUAZCCTvRElAYNb8JON1AQhk4PR828mFgp
	f0IUzCDb8dwBNVuyDsl+qPHC6z6KyU/E4XkZ4XenrQes9L/tUe3pFbkMd3YYZeVuFFDc5taSSZssF
	vQSxXidw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vZ-00000007nc3-2hqh;
	Wed, 28 Oct 2026 19:03:13 +0000
Received: from mail-pj1-x1047.google.com ([2607:f8b0:4864:20::1047])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vR-00000007nQL-0k9O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:07 +0000
Received: by mail-pj1-x1047.google.com with SMTP id 98e67ed59e1d1-3ac77c3ff6aso1841254a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214183; x=1793818983; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=FSpEu+8U15Vm0bgTC8EY/HhSLgMZ0M6dFLOZlAorxms7TmstMCzYy3MWzvYgvrhTZZ
         874GLFFn99kcJztnikt79ON5oPBFPy4RaWAUzTF2J+7EmtlsZ5PA9YMI359Eqv2B6Nuv
         MjH3wwGLZmTumTWOPZfioVfYUU/IIj9lKvyKC4LgISgQ8FDY2xPxnEFARzvSN3Gr1XIQ
         cviepxeuHkGul8kPbsVUJrpkFScqMWz0utuRbJe00J02m0rKsmk9uetJ8BRM+Nnhnvip
         H6YwpFNzNjPukZyjF0SeeUJO7zAHLG4L106H0r0ZfzNDhHx6dQQavtqaN0+koPu2rmlR
         SRRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214183; x=1793818983;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LaqWhYbOMD7sY9Ovf2nEN4IH4sn07uRJnSek/bjgEtY=;
        b=tj1I66Rc+2/5tx8fIDgeNXDUPECA9dZdUugeNhfV3qK+CfOnVgMKmje5HilL5bL1l6
         jpZJ/Lv54THvofuqeJZRZHUTzjqqNXw2JgM0EgQWtVylWsM7Yf1sonvrw6ORb7wMAKOE
         1TfHYdKNh58DC6i3bh/pn00Sk/DMVEF9gmwB0gLwXJ3xPdrOEjzGuZEIpUmAWvPG5+S9
         s4mACecoUouqt3F/rkQOj+Rdq5Ul9/oZk9NdoCFZogERok8bFNvHsbN2zVLvM9FiOzi4
         vrYvkJ2sicg18dgXK2zohC4DkWoPm8BTeG2LUnL1S0AlLOexSMqxiVKLi+0r2JQechXp
         g9+A==
X-Forwarded-Encrypted: i=1; AKwUvBxOxCGnYf76dv5WTbA+NT+x4AihBg0R12n6W2LE2k+myH2G5wCKhg/wCUujqLupHGk2/KzvlY5GmSZAD8SrMIfI@lists.infradead.org
X-Gm-Message-State: AFq9FYIN1J4LiA4miJztsceYA2BPrYCr+hjnXboBPRvjalhyfU8nZBxD
	mWcDRYxi77+sTdGVfxP0MBy4u8Dc7YMu6f0/b+Evxv2arrPPJGWQlb8G0v+lVCaVdAms9NFwL6A
	lxS8Xfg==
X-Received: from pjbmh6.prod.google.com ([2002:a17:90b:4ac6:b0:3aa:f38e:cb2d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264d:b0:3ac:9d83:8856
 with SMTP id 98e67ed59e1d1-3ae57e3d6c1mr2423992a91.9.1793214182870; Wed, 28
 Oct 2026 12:03:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:53 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-2-seanjc@google.com>
Subject: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
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
X-CRM114-CacheID: sfid-20261028_120305_213869_8BBD4AFD 
X-CRM114-Status: UNSURE (   8.61  )
X-CRM114-Notice: Please train this message.
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
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
is wrapped with "#ifndef CONFIG_S390".

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/s390/s390.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/s390/kvm/s390/s390.c b/arch/s390/kvm/s390/s390.c
index 18fb200f854a..9900a1a1c148 100644
--- a/arch/s390/kvm/s390/s390.c
+++ b/arch/s390/kvm/s390/s390.c
@@ -3922,13 +3922,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	/* kvm common code refers to this, but never calls it */
-	BUG();
-	return 0;
-}
-
 static int kvm_arch_vcpu_ioctl_get_one_reg(struct kvm_vcpu *vcpu,
 					   struct kvm_one_reg *reg)
 {
-- 
2.56.0.313.g2479322e68-goog


