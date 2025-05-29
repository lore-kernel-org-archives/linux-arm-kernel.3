Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99258C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MtkAfTOtokgdjv7gIn/IjoAQhtTTK4DWnbsWh0KRPqo=; b=krn87+ppWXzEa06nsdZeC+tEhb
	GQ9bPPrhBbEqz7WlUSc876zsLjqo3bsXY0pBiXOhxnIY4K8+ghpAiSoG5V6DZYalmvAcOo5T8sOZ5
	CCtGxI9b1MgJdUzUXGpIrBMpPWermrn6OZ8SNO/nh41n9DCWS25KzfPzQe6ZMOd7Jdy3Ejgg0MfIJ
	xli9R/J2DZK+1vpNqVRkSbhW+HX7PQwfciyeNHWUB3bKqts7jFII4+5CCqAEhC/tTv4oETS107Xcd
	8Ybp+bnHF/9UpzpcEe9N5rfhWDJ7ZeVxt95soootsgT9DI/6b/roA17Ekn3wuRiy8ASjKZMWntwUJ
	yIAiTuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcnd-0000000FnHR-2dA8;
	Thu, 29 May 2025 12:55:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcCu-0000000FiVh-45nQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 12:18:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB6885C4AF3;
	Thu, 29 May 2025 12:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91365C4CEE7;
	Thu, 29 May 2025 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748521079;
	bh=T9ZQY4CGugD2MH+iTUeDacs8pgXvAPcZYmxnuyRAiSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASMqB7f4OJsnn10KsXlKeQM/6y2euEGVS1tST7xQP41q2zFYIFm2pMkZYy0KeKxlv
	 lRyrOX1aodcUCzR/FXUyNQcsj8bPBY7XP+lKehhvIqua5iyr05BmGjtt6STEtWzXOX
	 2esSec+XG+Iy5UQE4hSECHcaRkfe278g2RlaECY+mljC000Rh33knCq0XcPookZng5
	 mOhHU8huR6bsWDo29BaNgX6/pYnltWyWmdtlxLPpYmyzIMSRN9Q8T8TFKjgLsaZawi
	 Bz/yI4DVbNjiqyL8vru1iItVnVjH43YjHF/4CDlhcD5BBTZjdUQaG+e5woFS2c+wbV
	 rAKKNUd3UN83g==
Date: Thu, 29 May 2025 13:17:52 +0100
From: Will Deacon <will@kernel.org>
To: perlarsen@google.com
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, sebastianene@google.com,
	qperret@google.com, qwandor@google.com, arve@android.com,
	perl@immunant.com, lpieralisi@kernel.org, kernel-team@android.com,
	tabba@google.com, james.morse@arm.com, armellel@google.com,
	jean-philippe@linaro.org, ahomescu@google.com
Subject: Re: [PATCH v4 2/5] KVM: arm64: Zero x4-x7 in ffa_set_retval
Message-ID: <20250529121751.GB29242@willie-the-truck>
References: <20250516-virtio-msg-ffa-v4-0-580ee70e5081@google.com>
 <20250516-virtio-msg-ffa-v4-2-580ee70e5081@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250516-virtio-msg-ffa-v4-2-580ee70e5081@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_051801_096326_5BDB5780 
X-CRM114-Status: GOOD (  20.50  )
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

On Fri, May 16, 2025 at 12:14:01PM +0000, Per Larsen via B4 Relay wrote:
> From: Per Larsen <perlarsen@google.com>
> 
> FF-A 1.0 references SMCCC 1.2 (reference [4] on page xi). The results of
> an SMC32/HVC32 are returned in W1-W7 in SMCCC 1.2. However, W4-W7 must be
> preserved unless they contain results according to the function definition.
> 
> ffa_set_retval is commonly used to report FFA_SUCCESS or FFA_ERROR back to
> the caller. FFA_SUCCESS requires that x2-x7 must be zero (MBZ) unless a
> register is explicitly used in the function response. FFA_ERROR requires
> x3-x7 MBZ.
> 
> ffa_set_retval is also used to return results of:
> - FFA_VERSION which requires x1-x7 MBZ
> - FFA_MEM_FRAG_TX which returns FFA_MEM_FRAG_RX or FFA_ERROR.
>   FFA_MEM_FRAG_RAX always requires that x5-x7 MBZ and x4 MBZ
>   at any virtual FF-A instance (applies to kvm).
> 
> Messaging interfaces such as FFA_MSG_SEND_DIRECT_{REQ,REQ2}, will not use
> ffa_set_retval.
> 
> Given the above, it is safe to zero x4-x7 in ffa_set_retval.
> 
> Signed-off-by: Per Larsen <perlarsen@google.com>
> ---
>  arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..b3d016bee404ce3f8c72cc57befb4ef4e6c1657f 100644
> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> @@ -101,6 +101,10 @@ static void ffa_set_retval(struct kvm_cpu_context *ctxt,
>  	cpu_reg(ctxt, 1) = res->a1;
>  	cpu_reg(ctxt, 2) = res->a2;
>  	cpu_reg(ctxt, 3) = res->a3;
> +	cpu_reg(ctxt, 4) = 0;
> +	cpu_reg(ctxt, 5) = 0;
> +	cpu_reg(ctxt, 6) = 0;
> +	cpu_reg(ctxt, 7) = 0;
>  }

Hmm. On reflection, isn't the root of the problem actually that we're
using SMCCC 1.1 to communicate with TZ, whereas FF-A requires SMCCC 1.2
(and we even enforce that in hyp_ffa_init())?

If we moved all of the hyp FF-A code over to SMCCC 1.2 unconditionally,
then we could just assign everything from res back to the CPU context
without having to worry about zeroing. That would also simplify your
later patches because we wouldn't have to deal with SMCCC 1.1 at all.

I'm aware that we're carrying a patch in Android to permit SMCCC 1.1,
but that's only for Pixel 6 iirc and we shouldn't worry about that
upstream.

Will

