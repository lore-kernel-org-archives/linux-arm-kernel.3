Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53BFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEJ5fjqsqgZR9DwKBl35hnhLDdYSJgMQMJxBh2HovUw=; b=SBtb49vIoZJgYxbrDEaH1tVDvH
	krkLJ6lqCg9ACfmI+tlCGXoWIWUxWQrJ6N42PRACOhzrVdz8qURlqXUqigLen/rA1BuLmYW2bqpll
	4yJpBysSxBXTCiQC//1z5PJ6XhCw+/YcK8bsmbDDi53Td9/Pzbj4dv4N4HNCiTeS3fHnNovH60Ra7
	So0utssrro99m86+Tvjp8hdn0lzwLdoRoTxO0ekkqK0ze2/xdc4+8WqSGBsS215aY8DhCwy4RHKnF
	M0IeK0LBeLW5kvFewQnPDOyGeND0QmDE6xOlFNdZ5stR3uIDoAZGRup0BfJtFlOhSfzbOTfLbUs9U
	bj7nngjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBIR-00000008TSZ-36Uc;
	Mon, 13 Jul 2026 07:41:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBIQ-00000008TSJ-1v5B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:41:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A55DC60103;
	Mon, 13 Jul 2026 07:41:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F25B1F000E9;
	Mon, 13 Jul 2026 07:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928505;
	bh=FEJ5fjqsqgZR9DwKBl35hnhLDdYSJgMQMJxBh2HovUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iogtmhqpAw5JpgL6uL8HH34fouldnGXX7dp9fbAxTWiuX4Na5u+o0uIjzmbTPwhy1
	 PuriTzlBRAnp2hYXcLH4lorCYwv3OVRiajgG0UCuRafhmHj0tR04D049PqZUoKQyHT
	 kZK/bggWGynH+SlUhVfxON2ksGRHkwAYN7siruOt56V23sjpiPId7QtC5nu+X3OrKh
	 cl0l9aqOu/bB0BWEAdl0YameoHoa5HLpTkTY81D/F3I39+4LP0w5gY9UaS1Gmns6g1
	 iZFRLJWpT26ArG8xkOqu7Q7UumJ/qu/ghBM/SHLMz6PGUPXz4PqXtJgRhQqICeM6lq
	 I1h714SiT0QXQ==
Date: Mon, 13 Jul 2026 00:41:43 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 09/11] KVM: arm64: PMU: Implement fixed-counters-only
 emulation
Message-ID: <alSWtwHVfYh0zdPy@kernel.org>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-9-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-hybrid-v8-9-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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

On Fri, Jul 10, 2026 at 08:15:03PM +0900, Akihiko Odaki wrote:
> @@ -813,6 +842,15 @@ void kvm_host_pmu_init(struct arm_pmu *pmu)
>  	if (!pmuv3_implemented(kvm_arm_pmu_get_pmuver_limit()))
>  		return;
>  
> +	/*
> +	 * IMPDEF PMUv3 traps are non-architectural, and KVM cannot assume a
> +	 * uniform PMUv3-compatible arm_pmu is available on all CPUs.
> +	 */
> +	if (cpus_have_final_cap(ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS)) {
> +		kvm_info("Non-architectural PMU, tainting kernel\n");
> +		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
> +	}
> +

This is an unrelated change, and really the taint should be added with the
.cpu_enable() for this capability. That's the point where we flip the
magic bit.

> +void kvm_vcpu_load_pmu(struct kvm_vcpu *vcpu, int last_cpu)
> +{
> +	if (!kvm_pmu_fixed_counters_only(vcpu->kvm) || vcpu->cpu == last_cpu || last_cpu == -1)
										^~~~~~~~~~~~~~

Does this do anything other than avoid a spurious reload on the first KVM_RUN?

Thanks,
Oliver

