Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA388CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BjlPgXNwXeFHjDTHfAecQAjmNwOoUuZdzNZWTJemW0E=; b=NbMKkWUdXlBWty7s2cuew0EYEe
	qL9MH3Ewiqy43kgi1etUk2wc6GlhdMSacKnV9W3VcdN23HA7PZ8Yvun4aHhTpn/HCNVYIDtOtLCBk
	3a5/pFIHN/K2cMryggI0P/ARRdhpLu4qvuzCLnTAU2ySIAkDB2EgbMDSB+ZtpEZZ2x1/T0mofMLrS
	WzO/4wC7OmSJyEBeWsA0EmZ+vtQiq4j7RdYOORwRUVmkFEzOc9kEEHxBuvrft690ySgIZtvN2Fs1W
	51c1m3mUEHAkRaN0x8KGCYI3hJvykMk/A5eEXuego39zIah5D5M95kJSOrR8BB3fc9rhyxMrycV30
	19LiBckA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0h3-0000000EM9z-2UcH;
	Mon, 04 May 2026 21:19:09 +0000
Received: from mail-oa1-f73.google.com ([209.85.160.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK0gr-0000000ELo1-1qLl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:19:04 +0000
Received: by mail-oa1-f73.google.com with SMTP id 586e51a60fabf-42393e9b4aeso5441553fac.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777929535; x=1778534335; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BjlPgXNwXeFHjDTHfAecQAjmNwOoUuZdzNZWTJemW0E=;
        b=PhK05WglmNlMapcXHfa9M/aHv6Xs2klice54nUt249mzGsjBn6sOnlZPi7Cg0IGKI/
         DcqUlyIrYsHrABbg3iYUGb3d8r1obNc7uTLM1nK/oKvC3kroQ7AXbDGUmLHuhPgX6UdB
         qI7J9u9QWPXNVJDRCGNurWF632wOGBum5tlIb+NGa/luyymZxiOM127QCv1+hbZp0TyQ
         F4CI5R4pvKRApVAUzPAVYjCy1u4cnUFxcYj650BbC90+JfWzuewjJ5/EBAxwUguKGntd
         QpVmSLsomS6sGIrj+QbOS5+B3X8KSzmwIypwA21Gfj6RTR23P6vRS6gxoQxpICKnH5qP
         CMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777929535; x=1778534335;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjlPgXNwXeFHjDTHfAecQAjmNwOoUuZdzNZWTJemW0E=;
        b=V+urmg8KnUk21qblhgzjWTSa9v2kbUvpyT/Lh49yV8tMQIT1EiYpS9MrTykNkgurXX
         wyRrw8f3SGK+6jEGdCQfsRCthZmFLfu63mj3sBCb/ruUHrzO5TmW94f4pOG/RCJyFJKh
         pT5R6V/3aSAZz7y9bkiokFgXYz2YkWkiaZkuybazcOf+nBjRWDPmnlGn9UeE4Jq5rifz
         d+xqvT049JB3Y0XDaSWZPkB/SsoBQdpxEn24cLABJnV8HjBKE/Cuf/Ux+lTCOp6tzt1z
         6u8TaNGhkMwgC4D9yBqaEaIWP2kQlSCyrzst7bLT7t+bqR++x/eC4ro8KZoqHCZ/HiBC
         kWAg==
X-Forwarded-Encrypted: i=1; AFNElJ862X5pqxyPxC7bhrZD38qCxJePyoxUhNXI8k6E0YdUmfWckiuntqISQn5B1B8RDGNy1GMg7ceMgpjVsOlbSC//@lists.infradead.org
X-Gm-Message-State: AOJu0YzZIyX/0WTUgWIArelIrUb+AQIJVFDSv/sFhZUV8QnYrPiWpfYM
	6vBpShogddKNsHxUYtjs0+qltAJp+WGnmYLYAD2LuA19fMUAgeWsMUJj8m3L5R2w0aaB525xTw/
	gkN/aTzDPM5U3mzP5KVE8oUenig==
X-Received: from ilqt1.prod.google.com ([2002:a92:cc41:0:b0:4fd:69a2:6072])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:81c6:b0:694:8fb2:2c35 with SMTP id 006d021491bc7-6998a59a043mr161048eaf.2.1777929534601;
 Mon, 04 May 2026 14:18:54 -0700 (PDT)
Date: Mon,  4 May 2026 21:18:13 +0000
In-Reply-To: <20260504211813.1804997-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260504211813.1804997-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260504211813.1804997-21-coltonlewis@google.com>
Subject: [PATCH v7 20/20] KVM: arm64: selftests: Relax testing for exceptions
 when partitioned
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mingwei Zhang <mizhang@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Shuah Khan <shuah@kernel.org>, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	James Clark <james.clark@linaro.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_141857_584076_DE258AB9 
X-CRM114-Status: GOOD (  16.75  )
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

Because the Partitioned PMU must lean heavily on underlying hardware
support, it can't guarantee an exception occurs when accessing an
invalid pmc index.

The ARM manual specifies that accessing PMEVCNTR<n>_EL0 where n is
greater than the number of counters on the system is constrained
unpredictable when FEAT_FGT is not implemented, and it is desired the
Partitioned PMU still work without FEAT_FGT.

Though KVM could enforce exceptions here since all PMU accesses
without FEAT_FGT are trapped, that creates further difficulties. For
one example, the manual also says that after writing a value to
PMSELR_EL0 greater than the number of counters on a system, direct
reads will return an unknown value, meaning KVM could not rely on the
hardware register to hold the correct value.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 .../selftests/kvm/arm64/vpmu_counter_access.c | 20 ++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
index 9702f1d43b832..27b7d7b2a059a 100644
--- a/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
+++ b/tools/testing/selftests/kvm/arm64/vpmu_counter_access.c
@@ -38,10 +38,14 @@ const char *pmu_impl_str[] = {
 struct vpmu_vm {
 	struct kvm_vm *vm;
 	struct kvm_vcpu *vcpu;
+};
+
+struct guest_context {
 	bool pmu_partitioned;
 };
 
 static struct vpmu_vm vpmu_vm;
+static struct guest_context guest_context;
 
 struct pmreg_sets {
 	uint64_t set_reg_id;
@@ -342,11 +346,16 @@ static void test_access_invalid_pmc_regs(struct pmc_accessor *acc, int pmc_idx)
 	/*
 	 * Reading/writing the event count/type registers should cause
 	 * an UNDEFINED exception.
+	 *
+	 * If the pmu is partitioned, we can't guarantee it because
+	 * hardware doesn't.
 	 */
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
-	TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	if (!guest_context.pmu_partitioned) {
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_cntr(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_cntr(pmc_idx, 0));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->read_typer(pmc_idx));
+		TEST_EXCEPTION(ESR_ELx_EC_UNKNOWN, acc->write_typer(pmc_idx, 0));
+	}
 	/*
 	 * The bit corresponding to the (unimplemented) counter in
 	 * {PMCNTEN,PMINTEN,PMOVS}{SET,CLR} registers should be RAZ.
@@ -459,7 +468,7 @@ static void create_vpmu_vm(void *guest_code, enum pmu_impl impl)
 		vpmu_vm.vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_ENABLE_PARTITION);
 	if (!ret) {
 		vcpu_ioctl(vpmu_vm.vcpu, KVM_SET_DEVICE_ATTR, &part_attr);
-		vpmu_vm.pmu_partitioned = partition;
+		guest_context.pmu_partitioned = partition;
 		pr_debug("Set PMU partitioning: %d\n", partition);
 	}
 
@@ -511,6 +520,7 @@ static void test_create_vpmu_vm_with_nr_counters(
 		TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_SET_DEVICE_ATTR, ret));
 
 	vcpu_device_attr_set(vcpu, KVM_ARM_VCPU_PMU_V3_CTRL, KVM_ARM_VCPU_PMU_V3_INIT, NULL);
+	sync_global_to_guest(vpmu_vm.vm, guest_context);
 }
 
 /*
-- 
2.54.0.545.g6539524ca2-goog


