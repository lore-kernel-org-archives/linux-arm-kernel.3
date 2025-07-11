Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C766C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmaKxm/VmiEPcbL87CsCSjMPkOq/8ZNs8tYEfygZixg=; b=PADwf/PsGmnZUxmoBPBxPlrH5s
	CpLnWfJLwEESxXR6O90At23zkl9mllOn2S6PpRT16waSiJUrhtYgQdTVNs+P6Z3I7YEHfU4myHFT5
	P+Hsh+SYwn+mo8BAyhuzu2ww+wGuBwVw03O7iczEfL/B4TCJLkgsSuvRsK1E5kYVIZzT7varOmMCb
	3Js0i6OdJ2Fch4C3j8BrjmASgJxPQmlXr54rBt5jMQ/gaQmAvkOANLCi35AY0KFBKwgFZakphp1M2
	YuMnEi/zy/ZTRw8hmh7SCbP1goNsu5bBkVTsqrN3zwWRhvgcVkJg9avT2i4MvKn0s2RpxvO+K2dEj
	SIwidSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaKeK-0000000FoOx-0iBS;
	Fri, 11 Jul 2025 20:47:16 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaJgB-0000000Ffoy-38aA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 19:45:09 +0000
Date: Fri, 11 Jul 2025 12:44:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752263105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qmaKxm/VmiEPcbL87CsCSjMPkOq/8ZNs8tYEfygZixg=;
	b=kH80zFXK3lACL0sgsmmLCLehTpzI+Pr6JxI1qYdKcOWqbbM5SYC5fwpCSgFYmaYCCOr6PO
	4jVXPBefLC5jxfzRabsaGEVXLdBcQxQaXkPOqE6FUtSAxlLmqA/W2MOnFqNLWTiZoSy6pu
	SIbSGrDfGAaj/dtkyXxQ6kd6y2n716I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	duenwen@google.com, rananta@google.com, jthoughton@google.com
Subject: Re: [PATCH v2 5/6] KVM: selftests: Test for KVM_CAP_INJECT_EXT_IABT
Message-ID: <aHFpt0qJF-Rvb2bS@linux.dev>
References: <20250604050902.3944054-1-jiaqiyan@google.com>
 <20250604050902.3944054-6-jiaqiyan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604050902.3944054-6-jiaqiyan@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_124508_064013_09B692F4 
X-CRM114-Status: GOOD (  22.67  )
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

On Wed, Jun 04, 2025 at 05:09:00AM +0000, Jiaqi Yan wrote:
> Test userspace can use KVM_SET_VCPU_EVENTS to inject an external
> instruction abort into guest. The test injects instruction abort at an
> arbitrary time without real SEA happening in the guest VCPU, so only
> certain ESR_EL1 bits are expected and asserted.
> 
> Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>

I reworked mmio_abort to be a general external abort test, can you add
your test cases there in the next spin (arm64/external_aborts.c)?

Thanks,
Oliver

> ---
>  tools/arch/arm64/include/uapi/asm/kvm.h       |  3 +-
>  tools/testing/selftests/kvm/Makefile.kvm      |  1 +
>  .../testing/selftests/kvm/arm64/inject_iabt.c | 98 +++++++++++++++++++
>  3 files changed, 101 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/inject_iabt.c
> 
> diff --git a/tools/arch/arm64/include/uapi/asm/kvm.h b/tools/arch/arm64/include/uapi/asm/kvm.h
> index af9d9acaf9975..d3a4530846311 100644
> --- a/tools/arch/arm64/include/uapi/asm/kvm.h
> +++ b/tools/arch/arm64/include/uapi/asm/kvm.h
> @@ -184,8 +184,9 @@ struct kvm_vcpu_events {
>  		__u8 serror_pending;
>  		__u8 serror_has_esr;
>  		__u8 ext_dabt_pending;
> +		__u8 ext_iabt_pending;
>  		/* Align it to 8 bytes */
> -		__u8 pad[5];
> +		__u8 pad[4];
>  		__u64 serror_esr;
>  	} exception;
>  	__u32 reserved[12];
> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> index 9eecce6b8274f..e6b504ded9c1c 100644
> --- a/tools/testing/selftests/kvm/Makefile.kvm
> +++ b/tools/testing/selftests/kvm/Makefile.kvm
> @@ -149,6 +149,7 @@ TEST_GEN_PROGS_arm64 += arm64/arch_timer_edge_cases
>  TEST_GEN_PROGS_arm64 += arm64/debug-exceptions
>  TEST_GEN_PROGS_arm64 += arm64/host_sve
>  TEST_GEN_PROGS_arm64 += arm64/hypercalls
> +TEST_GEN_PROGS_arm64 += arm64/inject_iabt
>  TEST_GEN_PROGS_arm64 += arm64/mmio_abort
>  TEST_GEN_PROGS_arm64 += arm64/page_fault_test
>  TEST_GEN_PROGS_arm64 += arm64/psci_test
> diff --git a/tools/testing/selftests/kvm/arm64/inject_iabt.c b/tools/testing/selftests/kvm/arm64/inject_iabt.c
> new file mode 100644
> index 0000000000000..0c7999e5ba5b3
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/arm64/inject_iabt.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * inject_iabt.c - Tests for injecting instruction aborts into guest.
> + */
> +
> +#include "processor.h"
> +#include "test_util.h"
> +
> +static void expect_iabt_handler(struct ex_regs *regs)
> +{
> +	u64 esr = read_sysreg(esr_el1);
> +
> +	GUEST_PRINTF("Handling Guest SEA\n");
> +	GUEST_PRINTF("  ESR_EL1=%#lx\n", esr);
> +
> +	GUEST_ASSERT_EQ(ESR_ELx_EC(esr), ESR_ELx_EC_IABT_CUR);
> +	GUEST_ASSERT_EQ(esr & ESR_ELx_FSC_TYPE, ESR_ELx_FSC_EXTABT);
> +
> +	GUEST_DONE();
> +}
> +
> +static void guest_code(void)
> +{
> +	GUEST_FAIL("Guest should only run SEA handler");
> +}
> +
> +static void vcpu_run_expect_done(struct kvm_vcpu *vcpu)
> +{
> +	struct ucall uc;
> +	bool guest_done = false;
> +
> +	do {
> +		vcpu_run(vcpu);
> +		switch (get_ucall(vcpu, &uc)) {
> +		case UCALL_ABORT:
> +			REPORT_GUEST_ASSERT(uc);
> +			break;
> +		case UCALL_PRINTF:
> +			ksft_print_msg("From guest: %s", uc.buffer);
> +			break;
> +		case UCALL_DONE:
> +			ksft_print_msg("Guest done gracefully!\n");
> +			guest_done = true;
> +			break;
> +		default:
> +			TEST_FAIL("Unexpected ucall: %lu", uc.cmd);
> +		}
> +	} while (!guest_done);
> +}
> +
> +static void vcpu_inject_ext_iabt(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_events events = {};
> +
> +	events.exception.ext_iabt_pending = true;
> +	vcpu_events_set(vcpu, &events);
> +}
> +
> +static void vcpu_inject_invalid_abt(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vcpu_events events = {};
> +	int r;
> +
> +	events.exception.ext_iabt_pending = true;
> +	events.exception.ext_dabt_pending = true;
> +
> +	ksft_print_msg("Injecting invalid external abort events\n");
> +	r = __vcpu_ioctl(vcpu, KVM_SET_VCPU_EVENTS, &events);
> +	TEST_ASSERT(r && errno == EINVAL,
> +		    KVM_IOCTL_ERROR(KVM_SET_VCPU_EVENTS, r));
> +}
> +
> +static void test_inject_iabt(void)
> +{
> +	struct kvm_vcpu *vcpu;
> +	struct kvm_vm *vm;
> +
> +	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
> +
> +	vm_init_descriptor_tables(vm);
> +	vcpu_init_descriptor_tables(vcpu);
> +
> +	vm_install_sync_handler(vm, VECTOR_SYNC_CURRENT,
> +				ESR_ELx_EC_IABT_CUR, expect_iabt_handler);
> +
> +	vcpu_inject_invalid_abt(vcpu);
> +
> +	vcpu_inject_ext_iabt(vcpu);
> +	vcpu_run_expect_done(vcpu);
> +
> +	kvm_vm_free(vm);
> +}
> +
> +int main(void)
> +{
> +	test_inject_iabt();
> +	return 0;
> +}
> -- 
> 2.49.0.1266.g31b7d2e469-goog
> 

