Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10FC9C44506
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK6JJLrtYdjUeALj48c7CkynRd/F55S7Z4V7ax9rj+E=; b=IPMHrGQ27sWyf5oPeWDaojzJda
	82zGrWIZt+QRox7qR4TmZchuORTTsSYT12K6vVMFoZvpbeXRT9sk0FBAnIw0jZQ2C/oxvyhe0Wz3G
	HWI0RXQNNa6U7PZhBMk9+rqx642gKGj+WtEg5LdNbMCwJaQzTEuqlQt/6FZUvIqMC6hWbOr7IHbFE
	VRxf1FaRYRdQQWe8d3hu35R89P6hekPIFl9OquW+O3SkcBtk2Fpi+51qjxNitVKxpYl0OMsI9HL/z
	YtWXBgdshaRLf/mFKYsSNFCqjtC3qX7EouFhxj4lAa2kcW/qjhDvkzmIePBChk62HrgOOQ41HcbcY
	9Q09F1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAb-00000008Qmq-0Zdj;
	Mon, 13 Jul 2026 07:33:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBAZ-00000008QmQ-49ox
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:33:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 305F560018;
	Mon, 13 Jul 2026 07:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956141F000E9;
	Mon, 13 Jul 2026 07:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928018;
	bh=YK6JJLrtYdjUeALj48c7CkynRd/F55S7Z4V7ax9rj+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FTljm3XC7PYrixU2x5qXuvq0zgoVZ/vdaSFjUkS3qnIRtIgW3LqKRDBMWCqA4vyz2
	 wver2ibuCFeaz8yAIFmelV46IC4YVJX21usDAIWS47K6A/oomcVhgEdhetuwS8mCLY
	 RHwT6v5JsDqBAa1JF0DqJIGj7u+4unUeNxU2Cfm+Yqoo7frtgFFO7XZ4uMbG8VgmPH
	 mrcbEPSyNNdygnw9yncJ2EaQIvDOAI2teBZBeicbjHACBaAkjb34ZNROiD2A0AqLwg
	 pP8bSd0W5LCm3XL2nOlWhwBY8Pg+P2Va2R7FlPuc5NomIhulJRV41Wq1cONcXcm1dk
	 XgyFFaYKQS0HQ==
Date: Mon, 13 Jul 2026 00:33:37 -0700
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
Subject: Re: [PATCH v8 01/11] KVM: arm64: Serialize userspace MDCR_EL2 access
Message-ID: <alSU0ZoIQ3sMLo0p@kernel.org>
References: <20260710-hybrid-v8-0-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
 <20260710-hybrid-v8-1-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710-hybrid-v8-1-621409f3a592@rsg.ci.i.u-tokyo.ac.jp>
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

Hi,

On Fri, Jul 10, 2026 at 08:14:55PM +0900, Akihiko Odaki wrote:
> kvm_arm_set_nr_counters() updates MDCR_EL2.HPMN for every vCPU while
> holding kvm->arch.config_lock. However, KVM_SET_ONE_REG currently writes
> MDCR_EL2 through the generic sysreg path without taking the same lock.
> Concurrent PMU configuration and register restore can therefore race and
> lose updates to unrelated MDCR_EL2 bits.

Ugh, we should just stop updating MDCR_EL2.HPMN altogether. Since this
overwrites the previous value (rather than clamping it) we could discard
a legal value set by userspace.

From the UAPI POV all we need to do is ensure the reset value is sane.
The documentation says that system registers are reset to their warm
reset values when KVM_ARM_VCPU_INIT is called. Which in this would mean
HPMN is reset to the number of implemented counters at the time of the
ioctl.

If userspace changes the number of counters afterwards, that's their
problem.

> Add explicit userspace accessors for MDCR_EL2. Serialize them with
> config_lock so whole-register userspace writes cannot race with HPMN
> rewrites, reject HPMN values above the configured PMU counter count, and
> request a PMU reload when HPME changes to match guest trap behavior.
> 
> Fixes: c8823e51b534 ("KVM: arm64: Fix MDCR_EL2.HPMN reset value")
> Closes: https://sashiko.dev/#/patchset/20260706-hybrid-v8-0-de459617b59d%40rsg.ci.i.u-tokyo.ac.jp?part=6
> Assisted-by: Codex:gpt-5.5
> Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
> ---
>  arch/arm64/kvm/sys_regs.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index d217530359ba..2b2ea33159e9 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -2949,6 +2949,42 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>  	return true;
>  }
>  
> +static int get_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +		    u64 *val)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +
> +	guard(mutex)(&kvm->arch.config_lock);

Hrm... I would strongly prefer that we *not* take the config_lock for
this register since there's no way for userspace to avoid lock
contention. ID registers are special and documented as VM-scoped, so an
aware VMM could potentially set these once (avoiding the lock).

> +	*val = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +
> +	return 0;
> +}
> +
> +static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +		    u64 val)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	u64 old, hpmn = FIELD_GET(MDCR_EL2_HPMN, val);
> +
> +	guard(mutex)(&kvm->arch.config_lock);
> +
> +	if (hpmn > vcpu->kvm->arch.nr_pmu_counters)
> +		return -EINVAL;

KVM allows userspace to write whatever it wants right now, we can't
start rejecting values that were previously valid. The architecture also
allows anything to be written to the field, just that unimplemented
values have UNKNOWN behavior.

Thanks,
Oliver

