Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB07C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 17:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8JODXIaSFJC9qN9KmTlMz7Gcx5C6dm9DycX2u8LOJSM=; b=ytFBuBJjg2JIkQuliOfQrlxHdd
	nFqP2M4gj5YMg1OL4gupHnoh3ZXEXe+H9kA51ZKrlIIRnawK9f3zmtz5WaZ5eFziH4yq3dF4QtaG3
	NjJdTchwhvLYrCJ/xSrXdS3Zy+dU6AWjT9uJd5344Apejawx3ZfJ1VitCPrStqcHC6GuQFIbYmDqm
	dp/fbCmA/4VgT4YLBuw5wYcNAxYsUHNKGP/UuHOhcF/JGzlyuEdxcJkGlZIWhZIbc+JXoQbsRuf07
	MmSTSQGM+ZnojTUvo3jI0mwqFmKE1eX81dzB7HEE2j7Ip6eP/6aaAxVMTBvTFUMklRMd4stgAF2k4
	LjTWimKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93xV-000000069Mk-0zeA;
	Tue, 22 Sep 2026 17:07:09 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x93xS-000000069M5-3iyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 17:07:08 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso141835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 10:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790096825; x=1790701625; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8JODXIaSFJC9qN9KmTlMz7Gcx5C6dm9DycX2u8LOJSM=;
        b=kTKcBvCe5WKTupD7UIs1wQssoZt9Zc/EMuMAq2GLINP1BV+v3OnJu9wKpBERQe/TOu
         Y0Imhtv5QAumKcIQamdVddrwqmNjgiuquIOf3271Mzm4J2ANjGc82pjEZBaa/mnl5zN/
         lWrclje9Bhkzia/bx2iospT067B7cYmHRXOCFawin9Q589xuxSNAw5/Xo3cNEyf2A/j4
         KX0Hi21cDOFVDS2ywYA+8pydiBpeoVZRJXWbhMhV7eDiqzmLhAVuOgEFZyKedknSjOGk
         I40L+BigZGlMvfdmPWfcmINHdRPMU9c/5v/XE7s7Q85k3rnT19F5nVUGvs8eSO3N37DN
         NcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096825; x=1790701625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8JODXIaSFJC9qN9KmTlMz7Gcx5C6dm9DycX2u8LOJSM=;
        b=Wi1ZI9Q24+0wwHfh19OYaS727e/UNYu2vLSf/pbYBAipzsel1bE/8lo6FHxK7ry90T
         MilOIOuD8o9iBQwhCZfA2Om/Caif5hnhgs03RJ5vJg1oRdUIvQQOV/8A0SUxdMnM0vZI
         fCrtwp1C5ON56tYdVOBUYagFOkIVCUhEqlbMDqtqtGBc8buwo0u7tz2FR9zSvAog4/Cj
         ujPvnLbwAWMHVtOqEcCjTy1Ts99pDEZtjGZ9gfs9z+4ScCqQtM7W7i1StrggIbY8sLYz
         EtYgVwSNWqiw+RiMZQYuTDJ2EyDzgRyCnz86c8DLiSnpy3TczQ1O5dqgle9BXvP7PWE/
         Ezyw==
X-Forwarded-Encrypted: i=1; AKwUvBzU+bhOpGIfOD359aDV/B4tu2dhFccSGli+XKcrKq/bITZV/KrWJjnklhMViSkBZHyh0H/S6f4J45Mb4UUE4tjk@lists.infradead.org
X-Gm-Message-State: AFuF++kz4rUKOUkKVekriLxwvI2r0onQxk8I8TbnwTlg+RDWfKgTYMQP
	d1W8U2rMkWgfCDiBo0topBsQmmC+UzDsrSgKVS+udlZg3uiBnAzdJAHSxGpADyemh6jKJf4hgNs
	IwMS++Q==
X-Gm-Gg: AYBFou0IG4Xh20rg03jNPrwEUaKMcJk7K762qHBbrphseqdEEsondZkmlmTGa6ibPep
	RmUgRBmLNOTBHGAPG8tDw9ffzvbuWL+7WrlRyzxPQz864a4zGCFdOdmDtnA5CDCHWJF8oCOEvZl
	99Zt9kR8Qfp/YSfT14+sBPkbb88hHCim1YsBi1Nc7olVvil6TUHxs5VI853kQq8f/JU1yx1fhRH
	PCL3UvDjbI12Fqow6EBK0m/sGDBwKN4E6n2Bc7MZY14JnGSDcTk7ZSMtZRS7kKbHo5cMTnPLD3+
	LTN1uNH/fqKTUMpxIaazfXAXxJg101eDczY0WFWwHjGZ6n2K7oXtutpYsakFNWMm3aXhhg9kcP5
	mlDTvkOJ7z8/J7u3Zx9W2oGkMWrdDllyeIDYE1jsiNxMGhHBosciihTvbGHBrw6zTfb9Oi80uqo
	RGbmbgtJWEey2o4Io4YWcV+D226BbljqZXoj+fNUgUSCizjy/Df0bLM3H/b7dUmRkuiDEbgDhUR
	40kbA9r4BZap5p0dMyAwPp8EpguD9hMPW5A7/+1EoY=
X-Received: by 2002:a05:600c:5487:b0:49f:bd3c:bc1e with SMTP id 5b1f17b1804b1-49fc573a0damr223240355e9.25.1790096824351;
        Tue, 22 Sep 2026 10:07:04 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1ccb90sm4537125e9.6.2026.09.22.10.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 10:07:03 -0700 (PDT)
Date: Tue, 22 Sep 2026 18:07:00 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v3 10/18] KVM: arm64: Handle PSCI calls for protected VMs
 at EL2
Message-ID: <arK1tHUEJsCQEKzn@google.com>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-11-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113338.159227-11-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_100706_955536_7A0F5DC5 
X-CRM114-Status: GOOD (  33.80  )
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

On Mon, Sep 14, 2026 at 12:33:30PM +0100, Fuad Tabba wrote:
> EL2 implements PSCI 1.1 for protected VMs: CPU_ON, CPU_OFF,
> PSCI_VERSION and PSCI_FEATURES are decided at EL2 (CPU_ON and CPU_OFF
> still exit to the host, which only schedules or parks the target),
> AFFINITY_INFO, CPU_SUSPEND and the platform power operations are
> forwarded to the host, and anything else returns NOT_SUPPORTED,
> including the TRNG calls and the functions above 1.1, SYSTEM_OFF2
> among them, that the host handled for a protected guest until now.
> TRNG for protected guests is a follow-up. AFFINITY_INFO stays
> with the host, which returns OFF only once it has parked the target:
> the host is what a guest polls to see a CPU_OFF complete before it
> issues the next CPU_ON, as Linux does on hotplug.
> 
> Three consequences follow:
> 
>   - A protected VM has one primary vCPU, the first whose hyp vCPU is
>     created with mp_state RUNNABLE. A second one, or an mp_state other
>     than RUNNABLE or STOPPED, fails that vCPU's first KVM_RUN with
>     -EINVAL.
> 
>   - CPU_ON finds its target among the hyp vCPUs, which exist from the
>     target's first KVM_RUN; before that the guest gets
>     INVALID_PARAMETERS.
> 
>   - A vCPU EL2 holds powered off doesn't run: handle___kvm_vcpu_run()
>     returns ARM_EXCEPTION_IL, reported as KVM_EXIT_FAIL_ENTRY. Its
>     existing bail-outs return the same code instead of an -EINVAL that
>     handle_exit() didn't recognise, for every hyp vCPU.
> 
> Non-protected VMs keep power_state ON and accept any mp_state.
> 
> Each protected vCPU is OFF, ON_PENDING or ON. CPU_ON moves the target
> to ON_PENDING, and the target's next run resets it and moves it to ON.
> The racing transitions are cmpxchg, and the reset state is published
> with a release/acquire pair, documented at each site. CPU_OFF publishes
> OFF with a release, so the target's clear of reset_state.reset is
> ordered before it and a CPU_ON that then wins on OFF republishes after
> the clear. Rolling a CPU_ON the host failed back to OFF needs the
> host's return value, which the per-EC marshalling patch delivers along
> with the rollback. Until then such a target stays ON_PENDING, and the
> reset has no observable effect: flush_hyp_vcpu() copies the host's
> context in on every entry until that patch removes the copy, so the
> target enters on the host's values rather than the ones EL2 reset.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  14 ++
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  25 ++-
>  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 283 ++++++++++++++++++++++++-
>  3 files changed, 311 insertions(+), 11 deletions(-)
> 

[...]

> +
> +/*
> + * Returns true when handled at EL2, false when the host must wake the target
> + * vCPU.
> + */
> +static bool pvm_psci_vcpu_on(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	struct pkvm_hyp_vm *hyp_vm = pkvm_hyp_vcpu_to_hyp_vm(hyp_vcpu);
> +	struct vcpu_reset_state *reset_state;
> +	struct pkvm_hyp_vcpu *target;
> +	unsigned long cpu_id, ret;
> +	int power_state;
> +
> +	cpu_id = smccc_get_arg1(&hyp_vcpu->vcpu);
> +	if (!kvm_psci_valid_affinity(&hyp_vcpu->vcpu, cpu_id)) {
> +		ret = PSCI_RET_INVALID_PARAMS;
> +		goto error;
> +	}
> +
> +	target = pkvm_mpidr_to_hyp_vcpu(hyp_vm, cpu_id);
> +	if (!target) {
> +		ret = PSCI_RET_INVALID_PARAMS;
> +		goto error;
> +	}
> +
> +	/*
> +	 * vCPUs race to power on the same target. Relaxed: reset_state
> +	 * is published by the release on reset_state.reset below.
> +	 */
> +	power_state = cmpxchg_relaxed(&target->power_state,
> +				      PSCI_0_2_AFFINITY_LEVEL_OFF,
> +				      PSCI_0_2_AFFINITY_LEVEL_ON_PENDING);
> +	switch (power_state) {
> +	case PSCI_0_2_AFFINITY_LEVEL_ON_PENDING:
> +		ret = PSCI_RET_ON_PENDING;
> +		goto error;
> +	case PSCI_0_2_AFFINITY_LEVEL_ON:
> +		ret = PSCI_RET_ALREADY_ON;
> +		goto error;
> +	case PSCI_0_2_AFFINITY_LEVEL_OFF:
> +		break;
> +	default:
> +		ret = PSCI_RET_INTERNAL_FAILURE;
> +		goto error;
> +	}
> +
> +	reset_state = &target->vcpu.arch.reset_state;
> +	reset_state->pc = smccc_get_arg2(&hyp_vcpu->vcpu);
> +	reset_state->r0 = smccc_get_arg3(&hyp_vcpu->vcpu);
> +	reset_state->be = kvm_vcpu_is_be(&hyp_vcpu->vcpu);
> +	/*
> +	 * Publish reset_state.{pc, r0, be} to the target vCPU. Pairs with
> +	 * smp_load_acquire(&reset_state->reset) in pkvm_reset_vcpu().
> +	 */
> +	smp_store_release(&reset_state->reset, true);
> +
> +	/* The host requests KVM_REQ_VCPU_RESET and wakes the target. */
> +	return false;
> +
> +error:
> +	smccc_set_retval(&hyp_vcpu->vcpu, ret, 0, 0, 0);
> +	return true;
> +}
> +
> +/*
> + * Returns true when handled at EL2, false when the host must stop scheduling
> + * the vCPU.
> + */
> +static bool pvm_psci_vcpu_off(struct pkvm_hyp_vcpu *hyp_vcpu)
> +{
> +	/* No other writer runs while this vCPU is ON and executing. */
> +	WARN_ON(READ_ONCE(hyp_vcpu->power_state) != PSCI_0_2_AFFINITY_LEVEL_ON);
> +
> +	/*
> +	 * Orders pkvm_reset_vcpu()'s clear of reset_state.reset before OFF, so
> +	 * a CPU_ON that wins on OFF republishes after it. Pairs with the
> +	 * cmpxchg in pvm_psci_vcpu_on().
> +	 */
> +	smp_store_release(&hyp_vcpu->power_state, PSCI_0_2_AFFINITY_LEVEL_OFF);

Is there an issue either with the comment or with pvm_psci_vcpu_on()? the
cmpxchg is relaxed. I would have expected cmpxchg_acquire().

> +
> +	/* Return to the host so that it can finish powering off the vcpu. */
> +	return false;
> +}
> +

[...]

-- 
Vincent

