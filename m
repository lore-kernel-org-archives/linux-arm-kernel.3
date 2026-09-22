Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F1FC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 06:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLtGitIi2OiQg65dHRRJxop72DcmDI+o2e1E/zKQ5w4=; b=IuhJzxIKzvnhNlbKU6rJiAODWr
	7DcZFI635U7huKBK3zCwt3fY9j1HVr+cNvAcPiXPB0xYiTtre0G8gr/+N7InWcKNfx92Aoc76+yjD
	4WqrOCi7uTRAaNvlsoddtwL3DNj3ahlMwl8K9Y0o0HtENITo+N2RmYdyFn8coQxvJw3sTxLAoOAzV
	fjX6Ux7n6Np+DT2rWkPe1CqUuBcGXBS1wkR6W6xJKQSBmAn7wydmz4g5AR+oKZjUvJI/XeN8MfTvI
	SJbqOwWQJZ4b3H7yp7zPwEIAf/34zkA1SE+4hVm/A5+0wV6ALGdAmcIo/gLoXi8cZ/xDxAIRYwflT
	kUf35jAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uP8-00000004PUZ-05qp;
	Tue, 22 Sep 2026 06:55:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8uP7-00000004PUF-1oNS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 06:55:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1355340508;
	Tue, 22 Sep 2026 06:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D001F000FF;
	Tue, 22 Sep 2026 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790060100;
	bh=wLtGitIi2OiQg65dHRRJxop72DcmDI+o2e1E/zKQ5w4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y+XhOINwZrcWlKpSEiXQdt3+zD3L2auPC/GvaE9XFlhSeO55CilXFon618dPN5Bdv
	 uxufpsWcq93lGy2ApXIVLgqzT4PjyICZ1lbQpGF0GOaBTqi6nWl6MQ3RkEIcLDiE2U
	 1ckswNCmhQBlLRHZCgtcbzXOGstotD8lln9xpOUS9r9QXeAGj/Cm0nBiV9oCKAxQFl
	 eQYTiy4mTW3KSjJdc6ebQ7N+m3pkfwVFX4ENoNkHpVEfIwmu2f0wj+6X8n/yRhXl4c
	 TPqME9qdENyh0vk1zkBEOzJMe9tLlQXGXnxJ2lbdnHBmDNjtmshkXm0g8gZfz0evXa
	 ErmpPYPKqeVTQ==
Date: Mon, 21 Sep 2026 23:54:59 -0700
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
	Steffen Eiden <seiden@linux.ibm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Sean Christopherson <seanjc@google.com>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 09/21] KVM: arm64: PMU: Recreate events after
 MDCR_EL2 changes
Message-ID: <arImQ6SG7s1k9uJk@kernel.org>
References: <20260920-hybrid-v11-0-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
 <20260920-hybrid-v11-9-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920-hybrid-v11-9-03618771b0e1@rsg.ci.i.u-tokyo.ac.jp>
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

On Sun, Sep 20, 2026 at 08:15:50PM +0900, Akihiko Odaki wrote:
> +void kvm_pmu_apply_mdcr(struct kvm_vcpu *vcpu, u64 old, u64 val)
> +{
> +	u64 changed = old ^ val;
> +
> +	/*
> +	 * HPMN determines which counters HPMD and HLP apply to. Changes to
> +	 * these fields require new perf event filters and sample periods.
> +	 */
> +	if (changed & (MDCR_EL2_HPMN | MDCR_EL2_HPMD | MDCR_EL2_HLP))
> +		kvm_pmu_request_recreate(vcpu);
> +	else if (changed & MDCR_EL2_HPME)
> +		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +}
> +

Urgh... I'm not a fan of this. Can you just modify kvm_vcpu_reload_pmu()
to discard all backing perf events and recompute them only for enabled
PMCs? We set KVM_REQ_RELOAD_PMU pretty rarely.

>  	__vcpu_rmw_sys_reg(vcpu, PMOVSSET_EL0, &=, mask);
>  	__vcpu_rmw_sys_reg(vcpu, PMINTENSET_EL1, &=, mask);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 75624725adf1..7dd2cafce247 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -3114,17 +3114,22 @@ static bool access_mdcr(struct kvm_vcpu *vcpu,
>  	}
>  
>  	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
> -
> -	/*
> -	 * Request a reload of the PMU to enable/disable the counters
> -	 * affected by HPME.
> -	 */
> -	if ((old ^ val) & MDCR_EL2_HPME)
> -		kvm_make_request(KVM_REQ_RELOAD_PMU, vcpu);
> +	kvm_pmu_apply_mdcr(vcpu, old, val);
>  
>  	return true;
>  }

> +static int set_mdcr(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
> +		    u64 val)
> +{
> +	u64 old = __vcpu_sys_reg(vcpu, MDCR_EL2);
> +
> +	__vcpu_assign_sys_reg(vcpu, MDCR_EL2, val);
> +	kvm_pmu_apply_mdcr(vcpu, old, val);
> +
> +	return 0;
> +}
> +

Just keep the old ^ new test inline for access_mdcr() and set the
request unconditionally from set_mdcr(). In the usual case
KVM_REQ_RELOAD_PMU is already set on a vCPU that userspace is restoring.

Thanks,
Oliver

