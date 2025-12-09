Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A74D3B7F3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 20:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zQsEiABUjsdMkMEnByRoAgIWKd7GLr6DjLwzP+aDHY=; b=DiJYcCR4HffpkzF+7AwUl87IFJ
	pcgAufzIC6L6aHLpXvScAEGWnZBNtBzrmST97f3zqPPIqGkxmV3i1sCpye0yRuYAqIaGsJ0N3fLAk
	FSlNu+Yz2s26pVqgw4x8tAfNhW3eef2/DG24wtDXbFH+fn8Rlxkrc8UY6yzUGClmQcOU4ngiMMilL
	okW23jfdldC/WPvq56kIFeHPY1JRN1Tq1bDLsuuvRrIpiLEZvUJjuiUciaPHnILsfu7U+1GMQq2si
	ZiKHevVFjEpvrUNr+Je2N9GzrzmJpN58DUnduX+tiKziRNjdzeCBij+mQgZw0giWDeGV5IbH3j30Y
	VAfmiovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hc-0000000El27-0jld;
	Tue, 09 Dec 2025 20:52:56 +0000
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT4hQ-0000000Ekkb-0Vf9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 20:52:45 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-3ec7ae7492aso8321583fac.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 12:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765313562; x=1765918362; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zQsEiABUjsdMkMEnByRoAgIWKd7GLr6DjLwzP+aDHY=;
        b=od14WUkzP66jE4rlNisOi4BrX8M3vhCREvZIoOlaZ+V+tyYv/sP8EoGn4bEASi63Zp
         B5EP/0KmRNeYQDdPL7AQt4pKgDi6u/CQr+KK7Wl0r9HDcAPI0EwwO5Aya7waO9+HioFD
         EdWmkb4gBZ1G2DobO3dyb+rGuz9nOpaKgKfMLBxef3vHuJXJ6QpLzPQoUX1hfKCnW11u
         Q5oW+rDgqMexjiPTRjrOWOtcEGnbqC3/p2p8NgsqB9Q/25K3GaWUx5TymwV1SK8U++qf
         CYMDMnMAqHdngBEDxfP73toMMkNtqitDysOypnvHboQgCcYNFF3g4iWVS9+4V0TXSizy
         Vblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765313562; x=1765918362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0zQsEiABUjsdMkMEnByRoAgIWKd7GLr6DjLwzP+aDHY=;
        b=Ei0/6D3In269H3UNVMLkl8PAEoJg36w4Uf/Vytr+JnyKMYTCuhE60b5s454hSqaU4S
         8mbaevpRg1aDGxs/vWh/RJ/11V97mRcjLGtCnj+M+BE6ntZDPA/JRKFw/zqscjE4AEuo
         6HrL+Dc23LxkuE3Ni58IVCu4Ipq+sNo8ET11Wa+fHrZ62VlIUsTcXgXz5Wan/QUUXRz/
         xIm1vgldhe7e5g3Aqpp8yGS7PgTUMtRB4CeNp7BTmyD5Dwo9c7t8qKIjd8rNYmqFEtig
         zkM0pWfu/FgQfPAMJHqEchmN45jg+TLKkbsnLk3A1XQtP0VB+H4tZJiMbbulU3ScTrj1
         LC9w==
X-Forwarded-Encrypted: i=1; AJvYcCUVFUNdeFmKnKd+D1AGS2HHUkXX9nJWoX4HyTYSxSVxWAEUugaXJhBYlIEgv1HIvQaFx+/zEJQdh5DvHczCYo9L@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3N1Yy+UEBP9uFEhvEPiWl5on3vYUbaohyJvSZ5JWofikIVPfu
	h5MxQlb3PsNyFrdfKrYEJHt6DLgM1Kn+RmNebhqyq4CoGcfUMorT0vt53yOLPrF8xAGBD/vlsYC
	1sh69dh2Qd3bRc/qiloxPnv/GnQ==
X-Google-Smtp-Source: AGHT+IFRKHeoUmjGuNFSlsmzEp/JswAlPAyHOqJKqkJs0+bQVeMX9v3ykC4h/RUbKQXV9XNTVLE12IZWXk6mEzWBCQ==
X-Received: from oahn5.prod.google.com ([2002:a05:6870:3485:b0:3ec:4657:83cc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:8208:b0:3ec:3b3e:4f38 with SMTP id 586e51a60fabf-3f5bdbe25e0mr227516fac.36.1765313562359;
 Tue, 09 Dec 2025 12:52:42 -0800 (PST)
Date: Tue,  9 Dec 2025 20:51:13 +0000
In-Reply-To: <20251209205121.1871534-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20251209205121.1871534-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
Message-ID: <20251209205121.1871534-17-coltonlewis@google.com>
Subject: [PATCH v5 16/24] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Mingwei Zhang <mizhang@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_125244_204011_197BC1E5 
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

Make sure reads and writes to PMCR_EL0 conform to additional
constraints imposed when the PMU is partitioned.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c      | 2 +-
 arch/arm64/kvm/sys_regs.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 1fd012f8ff4a9..48b39f096fa12 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -877,7 +877,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu *vcpu)
 u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
 {
 	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
-	u64 n = vcpu->kvm->arch.nr_pmu_counters;
+	u64 n = kvm_pmu_guest_num_counters(vcpu);
 
 	if (vcpu_has_nv(vcpu) && !vcpu_is_el2(vcpu))
 		n = FIELD_GET(MDCR_EL2_HPMN, __vcpu_sys_reg(vcpu, MDCR_EL2));
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 70104087b6c7b..f2ae761625a66 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -1360,7 +1360,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *r,
 	 */
 	if (!kvm_vm_has_ran_once(kvm) &&
 	    !vcpu_has_nv(vcpu)	      &&
-	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
+	    new_n <= kvm_pmu_hpmn(vcpu))
 		kvm->arch.nr_pmu_counters = new_n;
 
 	mutex_unlock(&kvm->arch.config_lock);
-- 
2.52.0.239.gd5f0c6e74e-goog


