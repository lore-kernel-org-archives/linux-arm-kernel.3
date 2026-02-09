Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4DBE9461C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 22:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TKm1gU8lTLqEcn/8yRmMV0Zp5pYjSJjWs0bsDB+GUI=; b=ES4JIvv49Ey8lMUM6IbG9IZybS
	DRSxBh98oJZYg0WJzMJy6LXbLHvL9p6qxKYAdgGNnTA3nfyISXigJ+oWohO4JTD9xiHfZuXK+hvLO
	lVBQzy73EH5fxpvqBPQE5FO3PftBA80N3/12ub2ArrDdG/dGRo/pGje9DOfAFQrY5nApdepszmDmh
	OS8t/Vu6gXMOkxkeNTNOT1VYEDKP6ZS8MhBrwrtfSiEBFjxpHd8Lgzi5E4vtD5zBW+RtjPDVTZn3a
	tvHyCv2ANL7U3uL3C91d44hUmxsHzlB0E0bgnD3Niulv7ta+AtdHKiJ7sOrIXbqztTaUzX3xbZV4g
	HNHM9WQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwj-0000000G82c-1Ocr;
	Mon, 09 Feb 2026 22:41:33 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpZwI-0000000G7Tw-2MvX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 22:41:08 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-662f839d680so9455163eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 14:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770676865; x=1771281665; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TKm1gU8lTLqEcn/8yRmMV0Zp5pYjSJjWs0bsDB+GUI=;
        b=nD0oxc/t4nvu6sOtEh2A5GLsZHNVwTDXWPjEhylEsi2KQOEMFndYBFJ16Ji9fKNnb9
         Dc2hIB7yA/foPhn6fgy0O0xKoWD2cWoVgbN4NVY6VmMWDcIRfan5onaQCHBBTsC4z8V4
         ubjRtlXyAd0kFL5xCLcD5B/4eNj5Q+8/ohN8jrN7uE7sxFEGV2XM1k+PXbqdZf9+Kcna
         ERrPjD8/ie0FOrWnHZBYjHchP97ks1ZgyeSSIOZyUV4jKIF9hBrWfAot2zV8W/sJUo+u
         Vn4QbnsAru4sSI/SzDFoev+0BkzKhOrjGLdVgNoJkWwLBtGl9b2lehRnhYMMPhm0AmtG
         Ktnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770676865; x=1771281665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TKm1gU8lTLqEcn/8yRmMV0Zp5pYjSJjWs0bsDB+GUI=;
        b=Ym99B5SiOlfvvgYNLRRjic0D3XxQEv2XlIYWisoqRXjGVrXws2gc3eZUaFT5N7ymn5
         CMvNxg6gpi/mH2ZAUk/xgfVddeQh+qgXiTvCjbRPTf/FvdnZZzjaBoaMUuQjax6xsTEz
         94pUBbTmzYmcTVeqO//S264A2+8TQ3kO0dRgqlnA52hl0Jhiv7B2ISAp/BrrEx4J8BKH
         3X7Inw5An8rWCNaaM9gi8dAwQsUV8rr36aRYXQAMaIvSrlYCuqnHAezfMVh6SET05B9D
         a/HV6nsDXDlvzkSe87Xrl5ABOF+m4dKpa8F7xW4ntmwi2qEiyzUBEdDC89pBRmH4uPGw
         v2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXvGtGhKYD2uPBeNWw+KerQ9INdtcFM2CuCOVfSePsmTr33VTOiJTxVaqAi+LP10ea+VHLodf05iuUX7j7H86Qa@lists.infradead.org
X-Gm-Message-State: AOJu0YwgvJMf352jYYSw8Bep4CLTwp3sCIEfim+aF/Wgp8oz2BXKwl6G
	cuxdYI7YCDR3NZSsG6oQJopSu2xee8KS57ccH/pkysi1x2ogv4Su5So3NsJrP36rdiTR+60oJHV
	Lf+Yzd4Z8W4FHnFlTeBz9TGymIQ==
X-Received: from jaox17.prod.google.com ([2002:a05:6638:111:b0:5ca:fdfb:2007])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:f015:b0:663:610:cb67 with SMTP id 006d021491bc7-66d0a477b40mr5663839eaf.28.1770676865086;
 Mon, 09 Feb 2026 14:41:05 -0800 (PST)
Date: Mon,  9 Feb 2026 22:14:14 +0000
In-Reply-To: <20260209221414.2169465-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260209221414.2169465-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260209221414.2169465-20-coltonlewis@google.com>
Subject: [PATCH v6 19/19] KVM: arm64: selftests: Relax testing for exceptions
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
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_144106_671003_61CAADCF 
X-CRM114-Status: GOOD (  17.00  )
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
2.53.0.rc2.204.g2597b5adb4-goog


