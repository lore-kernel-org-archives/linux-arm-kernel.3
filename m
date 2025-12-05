Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EACD2E009
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 06:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEapCQ/YexkXbHbXZi0Iom6o7Nizx7gI9KIuPyEGjHs=; b=uw3EyFf6Z1QPZr/+G6hz/pzdu1
	goP28sdcPQUWGWPnA+J3pZeMenNPUAGwAk3pFkfvV2HClj1M3JzqMwlofpe+4rwg2htFGW40dOzhw
	IuQy7jsbk7Vu5QdFha8iR7dKAqM+8mnj6O1zXk1IoggIf/bTOiAbrfwsGB6JYeOZI/5q1+skZDksk
	AlqdbhT3eVxvn+Yg0B7Kl5lCcH/QbNcMm2SQPNhBzquUPH/3r1mfcN4B2tidZeLCfPLE33Ym3XxzZ
	YRM1Ewr8qfAicgl+LwFO2BFVEJlqhL6WovvyrcHb0TLEpJMBH2t2DWdLNxcOYlhETHBMTX7JHN15l
	BndXXNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP1W-0000000955L-1SSh;
	Fri, 05 Dec 2025 06:10:34 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRP1T-0000000954v-2IIS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 06:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1764915029; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=UEapCQ/YexkXbHbXZi0Iom6o7Nizx7gI9KIuPyEGjHs=;
	b=nDjTQWK6kuEBN3cMFzuIyYvpiyl8Ky2jI+kzmObU81CLR0HSJ4203WZgKjZsd6B8HJBFUg/hVN8hCDSZtaa22W54+MBRe0vXGy2/lDR7RMBXjBMGYNC2FfxU5tYdsqOdMds/rMnr68Jni/s1lOUadCRpDX5hTOurPvjSnep6bP8=
Received: from localhost(mailfrom:yaoyuan@linux.alibaba.com fp:SMTPD_---0Wu6v20O_1764915024 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 05 Dec 2025 14:10:24 +0800
Date: Fri, 5 Dec 2025 14:10:23 +0800
From: Yao Yuan <yaoyuan@linux.alibaba.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH v3 4/9] KVM: arm64: Handle FEAT_IDST for sysregs without
 specific handlers
Message-ID: <ibifd2p7fkwjmyfgfaerjdbzlmrabfdpepmn7zhure3s7k2aj7@wgqa7druilzt>
References: <20251204094806.3846619-1-maz@kernel.org>
 <20251204094806.3846619-5-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204094806.3846619-5-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_221032_083077_C869796B 
X-CRM114-Status: GOOD (  19.00  )
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

On Thu, Dec 04, 2025 at 09:48:01AM +0800, Marc Zyngier wrote:
> Add a bit of infrastrtcture to triage_sysreg_trap() to handle the
> case of registers falling into the Feature ID space that do not
> have a local handler.
>
> For these, we can directly apply the FEAT_IDST semantics and inject
> an EC=0x18 exception. Otherwise, an UNDEF will do.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/kvm/emulate-nested.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 616eb6ad68701..fac2707221b47 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -2588,6 +2588,26 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
>
>  		params = esr_sys64_to_params(esr);
>
> +		/*
> +		 * This implements the pseudocode UnimplementedIDRegister()
> +		 * helper for the purpose of fealing with FEAT_IDST.
> +		 *
> +		 * The Feature ID space is defined as the System register
> +		 * space in AArch64 with op0==3, op1=={0, 1, 3}, CRn==0,
> +		 * CRm=={0-7}, op2=={0-7}.
> +		 */
> +		if (params.Op0 == 3 &&
> +		    !(params.Op1 & 0b100) && params.Op1 != 2 &&
> +		    params.CRn == 0 &&
> +		    !(params.CRm & 0b1000)) {

Hi Marc,

May give a macro/inline function or local variable w/ name like "is_feat_id_space()"
can simplify the long comment here. Others LGTM:

Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>

> +			if (kvm_has_feat_enum(vcpu->kvm, ID_AA64MMFR2_EL1, IDS, IMP))
> +				kvm_inject_sync(vcpu, kvm_vcpu_get_esr(vcpu));
> +			else
> +				kvm_inject_undefined(vcpu);
> +
> +			return true;
> +		}
> +
>  		/*
>  		 * Check for the IMPDEF range, as per DDI0487 J.a,
>  		 * D18.3.2 Reserved encodings for IMPLEMENTATION
> --
> 2.47.3

