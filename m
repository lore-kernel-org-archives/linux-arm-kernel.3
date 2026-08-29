Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D7EC61DD9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4YK9Dq6rotWkd/pf3xzF4hJ8sm6WaIJ3Gr0CUwDZTA=; b=QBRJM/AH1BOLQ4Y4kQehiOCpYu
	2e6Xl0RZFhqmdHGSuBNlL5PmjCEYtKJGJG/kvyWiTuxXuX9wvyS3nWloyL2V35qck6Ol3tYchOF/X
	UDO79NFcQcn2iwFAmvpt9+YsYU6FXwHELFMebh6+SmT3ND44I0d2cvLhIbeTtagjCpNsd0PztsfFx
	NScmKMU6M7mPRZaraRpdi5QUNZKeeA4Ean2WgSjYpAY3ra+w9puB2Qzktl4JYoBen7NBcEkhGR+IZ
	lA9U7D9DBwuthuCmIR5kHrMyHlNiCIqD+ZIIN1XzPXtQqfiS1Eep7D1U1PpDKzyyS01naqtKpPw7r
	krwgxzKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kc2-000000072q3-0bL6;
	Sat, 29 Aug 2026 15:04:54 +0000
Received: from out-132.mta1.migadu.com ([2001:41d0:203:375::84] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kby-000000072pW-1teA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 15:04:53 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=x/JQhwvlkrIqW5ek4nBfeiZRWKci9ObkZOfoQkBKemw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788015882; v=1; x=1788620682;
 b=qi0GQnLWOBpcQvxMiPN9YKcoVrv+OvuKqyzWbsq/Qd+t87WaMrnNK1xKsTpGVjqKjfIPzLBE
 ND+OJ0KpPeHwMPR6vNHs12+EoiCnmePT/BvcnZ/mJ65dSWS+qTrFJInpqYIclVB1IqFqEY4ZqWS
 5a/Byjj6UXI6dk/RE2rW6ANU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id fb2f7a55c8a92879;
	Sat, 29 Aug 2026 15:04:42 +0000
X-Mizu-Trace-ID: fb2f7a55c8a92879
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b2a8173142so2305e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 08:04:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzv5ytJaeCzCTlucuNc0T9QBheoN8vXGBnFuNlkqXj3sNThKecqLIiMFQ6LVcDfFm5iLp6SLTlVeTB8NwFMDzYq@lists.infradead.org
X-Gm-Message-State: AFuF++krVlTpKI4jZAGCq8tgNxQtBiCxrUO93OhuHzukPqdwcwyHtY8v
	hdZi+C3GY5NwMqGR9ixYK6AnDO36hmcwJJl/f6M60mdQazo3H0+MFn7wJ7YWP21CHnbEeVIZNIW
	rc4iKbjO1Ndd7N1x4AgfcaEx33b+oQNTBQfsBf6wF
X-Received: by 2002:a05:6512:224a:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5b5ef1fb727mr121680e87.8.1788015877648; Sat, 29 Aug 2026
 08:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260829054856.70549-1-kmehltretter@gmail.com> <20260829054856.70549-2-kmehltretter@gmail.com>
In-Reply-To: <20260829054856.70549-2-kmehltretter@gmail.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Sat, 29 Aug 2026 16:04:01 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
X-Gm-Features: AcwNN1WqEb1cXih1LXw2p4NMTSnPI5p1Ks0puLT5RmXOdUojQc3MhAEKYKD99sE
Message-ID: <CA+EHjTzQM0bf1x2X-Y+eMmUHSYUmJXpt_jQ4Csu7JpkjtFT72Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Return -EINVAL for an empty SMCCC filter
 range at base 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_080451_903487_2F94EF53 
X-CRM114-Status: GOOD (  17.97  )
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

On Sat, 29 Aug 2026 at 06:50, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> kvm_smccc_set_filter() only rejects a range if its inclusive end,
> base + nr_functions - 1, is below base. That catches an empty range
> (nr_functions == 0) at every nonzero base, but at base 0 the end wraps
> to U32_MAX and KVM tries to insert [0, U32_MAX], which overlaps the
> reserved Arm Architecture Calls ranges. KVM_ARM_VM_SMCCC_FILTER then
> returns -EEXIST instead of the -EINVAL that the smccc_filter selftest
> expects for an empty range.
>
> Reject a zero function count explicitly.
>
> Tested with a userspace reproducer on an arm64 VHE host under QEMU TCG:
> EEXIST before, EINVAL after.
>
> Fixes: 821d935c87bc ("KVM: arm64: Introduce support for userspace SMCCC filtering")
> Assisted-by: LLM

nit: this should be `Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1]
[TOOL2]` rather than LLM

> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

I think Sashiko is onto something, but that's for another day.

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Tested-by: Fuad Tabba < fuad.tabba@linux.dev>

Cheers,
/fuad


> ---
>  arch/arm64/kvm/hypercalls.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hypercalls.c b/arch/arm64/kvm/hypercalls.c
> index b11b8821c9fb..dfa25bb6f25d 100644
> --- a/arch/arm64/kvm/hypercalls.c
> +++ b/arch/arm64/kvm/hypercalls.c
> @@ -185,7 +185,8 @@ static int kvm_smccc_set_filter(struct kvm *kvm, struct kvm_smccc_filter __user
>         start = filter.base;
>         end = start + filter.nr_functions - 1;
>
> -       if (end < start || filter.action >= NR_SMCCC_FILTER_ACTIONS)
> +       if (!filter.nr_functions || end < start ||
> +           filter.action >= NR_SMCCC_FILTER_ACTIONS)
>                 return -EINVAL;
>
>         mutex_lock(&kvm->arch.config_lock);
> --
> 2.39.5 (Apple Git-154)
>

