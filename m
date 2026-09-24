Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB97C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/Sjq5h51RyI3GHB4u4jBTaGi29xukntF3qhviZ3NXg=; b=mjeS8FnETCgq8navln2Wzl7F8k
	d0UNEn1QLfKkfziKTx8Mapvti72G8r2IGHtnUJv8aVrXCnfa5RF89wRz3BQp0yXv3T6/CxCGb6Ulo
	5fZ94hSpeR3p8QsyUYYznbfx4PsnG+WG6PpVJjD9QgvzRQrFeg00HM56xWzDi7ay57J0TbmyXBW/v
	cNQW1r8OU7eW/SsLi2A0xI9q4oThcFgjunVKf/9UDOLu+ZmAP0xR5FGPfsgrNzEEHN4pvrrrzAga6
	Pcl/Qb8CszaT7GnrJgw2G1aO1V/tpncvHxyEcU/iKu6TbJMR3cc/ddP7lMXGRSfN+PTRbbURb6AGq
	fNGmjeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHm-0000000BkmO-2MtU;
	Thu, 24 Sep 2026 17:31:06 +0000
Received: from mail-oi1-x248.google.com ([2607:f8b0:4864:20::248])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGW-0000000BjwU-2P00
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:50 +0000
Received: by mail-oi1-x248.google.com with SMTP id 5614622812f47-4b2f2b8d88fso216314b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270987; x=1790875787; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/Sjq5h51RyI3GHB4u4jBTaGi29xukntF3qhviZ3NXg=;
        b=hsaAd/senLokoX/plpK+tXLncnQUtpGGk/0yx9f7r8gXblNaKI9/jl3YFRQBOOmPna
         Bc6L88b3uSHO48TqwfAjrueLcRLyv3SeieqE6ye/PqTh5YsGHNCAbYYYvG9OJBPS38em
         RFYk9BH7TQ5ipjgfhJIhjASKk1hlY3p2jhohcwt/E9kXejfK7EejFN9W7ujdT3CFNFxe
         +CUvFpcLlez/fwMTxZrIVx3HqKWN+9zALKg+a8eELsRQJi2qBpi2S+XAdJiHGuJ0acHY
         HW57H/ayACO7YPLeZedjlGqVfO+mnlmhvGqQPcoLudBTmkzQubdrXIGhKLvBqBJgpBmp
         FyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270987; x=1790875787;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/Sjq5h51RyI3GHB4u4jBTaGi29xukntF3qhviZ3NXg=;
        b=qvIXZZsOrcSWDJl1xpKUZ484UhAujnSIpJ7jBQFw/tNG4k/RxdEIbqIvSodWlb1Iau
         b2Vkiztibw/gXSgybW0nzmz6Xx83RNIMe8Rwx00FCfS6FXBa9AWsL0l/GyjfznrTZJv+
         woCRPNrUKM8w9bq8UOLAi/jtjcOsVHQ1GXDHq/ukctaWxA3jh5WZdycacX0BerxMtUbe
         VmP/JVodjkOgtJsMElA50AUbNxzRLM+F2eYtY3bOnHYI8GWbx1cEp8rTDMKF11wXv8iT
         iv9CwFGRzdfE0yMIvMxGWymeKbA7z0XQ4wCmYG7e4am0PrIfh/B7Loz77kYdsg1UUIvN
         5BiA==
X-Forwarded-Encrypted: i=1; AKwUvBxziRHsrXCUNVAbCXBIothGkCJVb+OKGcPGGEYjnz/jHHzsaM0klSUB+/f2Zmehmq+2GVW2V6simUmM1mQIIBxV@lists.infradead.org
X-Gm-Message-State: AFuF++l9utGxYfP3k73vfGa+tQVHkJzjcaZkduNIyJ6yMEGXulMaxuFS
	9Dq/Efn4q7JCxSYwXcDVHKPre3p+VSrdv8bzIj8pN8TmHcjksGgympg+xjY0TO1zGFGhDf7+Y1u
	hBAyBxjV+SUYZcZbTqpCWYdNTkg==
X-Received: from ilbda5.prod.google.com ([2002:a05:6e02:3cc5:b0:509:8793:a27a])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2222:b0:4d6:9133:23fa with SMTP id 5614622812f47-4d72b43c64emr3766576b6e.48.1790270986738;
 Thu, 24 Sep 2026 10:29:46 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:17 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-12-coltonlewis@google.com>
Subject: [PATCH v9 11/22] KVM: arm64: Set up MDCR_EL2 to handle a Partitioned PMU
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_102948_962516_535D9133 
X-CRM114-Status: GOOD (  17.07  )
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

Set up MDCR_EL2 to handle a Partitioned PMU. If partitioned, set the
HPME, HPMD, and HCCD bits. If we have the ability to use Fine Grain
Traps (FEAT_FGT) also, unset the TPM and TPMCR bits that trap all PMU
accesses and set HPMN to the correct number of guest counters so
hardware enforces the right values.

Protect vcpu->arch.mdcr_el2 updates with local_irq_save() to prevent
races against PMU interrupt handlers modifying MDCR_EL2.HPME.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/debug.c | 39 +++++++++++++++++++++++++++++++++++----
 1 file changed, 35 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/debug.c b/arch/arm64/kvm/debug.c
index f4d7b12045e8f..a722fd4594e09 100644
--- a/arch/arm64/kvm/debug.c
+++ b/arch/arm64/kvm/debug.c
@@ -37,14 +37,16 @@ static int cpu_has_spe(u64 dfr0)
  */
 static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 {
-	preempt_disable();
+	unsigned long flags;
+
+	local_irq_save(flags);
 
 	/*
 	 * This also clears MDCR_EL2_E2PB_MASK and MDCR_EL2_E2TB_MASK
 	 * to disable guest access to the profiling and trace buffers
 	 */
-	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN,
-					 *host_data_ptr(nr_event_counters));
+
+	vcpu->arch.mdcr_el2 = FIELD_PREP(MDCR_EL2_HPMN, *host_data_ptr(nr_event_counters));
 	vcpu->arch.mdcr_el2 |= (MDCR_EL2_TPM |
 				MDCR_EL2_TPMS |
 				MDCR_EL2_TTRF |
@@ -52,6 +54,35 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 				MDCR_EL2_TDRA |
 				MDCR_EL2_TDOSA);
 
+	if (kvm_pmu_is_partitioned(vcpu->kvm)) {
+		u8 nr_guest_cntr = vcpu->kvm->arch.nr_pmu_counters;
+		u64 hpmn = FIELD_GET(MDCR_EL2_HPMN, read_sysreg(mdcr_el2));
+		bool hpme;
+
+		if (hpmn < *host_data_ptr(nr_event_counters))
+			hpme = !!(read_sysreg(mdcr_el2) & MDCR_EL2_HPME);
+		else
+			hpme = !!(read_sysreg(pmcr_el0) & ARMV8_PMU_PMCR_E);
+
+		vcpu->arch.mdcr_el2 |= (MDCR_EL2_HPMD | MDCR_EL2_HCCD);
+		if (hpme)
+			vcpu->arch.mdcr_el2 |= MDCR_EL2_HPME;
+
+		/*
+		 * Take out the coarse grain traps if we are using
+		 * fine grain traps and enforce counter access with
+		 * HPMN.
+		 */
+		if (!vcpu_on_unsupported_cpu(vcpu) &&
+		    (cpus_have_final_cap(ARM64_HAS_HPMN0) || nr_guest_cntr > 0)) {
+			vcpu->arch.mdcr_el2 &= ~MDCR_EL2_HPMN;
+			vcpu->arch.mdcr_el2 |= FIELD_PREP(MDCR_EL2_HPMN, nr_guest_cntr);
+
+			if (cpus_have_final_cap(ARM64_HAS_FGT))
+				vcpu->arch.mdcr_el2 &= ~(MDCR_EL2_TPM | MDCR_EL2_TPMCR);
+		}
+	}
+
 	/* Is the VM being debugged by userspace? */
 	if (vcpu->guest_debug)
 		/* Route all software debug exceptions to EL2 */
@@ -70,7 +101,7 @@ static void kvm_arm_setup_mdcr_el2(struct kvm_vcpu *vcpu)
 	if (has_vhe())
 		write_sysreg(vcpu->arch.mdcr_el2, mdcr_el2);
 
-	preempt_enable();
+	local_irq_restore(flags);
 }
 
 void kvm_init_host_debug_data(void)
-- 
2.56.0.rc1.310.g51773c2048-goog


