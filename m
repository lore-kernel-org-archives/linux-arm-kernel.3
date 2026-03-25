Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD36106B538
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZklEH0mxskPORhMyaAAoIBXbzean90/R85Izbb27Qig=; b=12eORdEtwJeknznDDtbyvPgb/h
	/fU/NxASt8DpnpgLbnylG6toBziYNDgtPjoq5xwbf0RbxpmS5hSEJm4j94VGRhgXsLYEbTbna3rSq
	8gajBFYHGTsWCU5bp+QNYA/0iSctLUihgfE1fEqVaqjg0jheZ9wLLVeUmFK7NW2e05iuHOKP4YmH0
	6RvSlqIhW02lL7iuHPlUKB4LUHK9NkV67kLBZbas8G52M7Qf52aLyaIm77HRV9RnglBxfCuXX594x
	dnvfN1/luNFECYsC4ylQfpP8lXGDs+Q9YtuR3w86LA1tmsErxtf9hVQPCd/sS3vRknpeUuFpRGjT3
	lzC0Gfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OHR-00000003Ssu-3KYQ;
	Wed, 25 Mar 2026 13:28:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5OHO-00000003SsP-42Bs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:28:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 686AD1CDD;
	Wed, 25 Mar 2026 06:28:07 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70B933F836;
	Wed, 25 Mar 2026 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774445293; bh=30zKMFL8Hb0ceqS8MaQ+b2fIKFZMYlPT6yAmBpIOQwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6UmJBNt60706+y9MrrRwyLpyd1XQt65m4hcN5XnYV3ccYUakDUhR8c1KjFnRTSfN
	 rVDPql8iQic0bVnutRf2caoji8aL7CD6uPW3v/N8RXq4nKEzXU0dDMCVXOw+MnQshD
	 /lP7wJGEWvo4+vdk5cpZSDjPf1DoIs6lbMnRqmbc=
Date: Wed, 25 Mar 2026 13:28:05 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oupton@kernel.org, suzuki.poulose@arm.com, tabba@google.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPi5V0DgGcgHNGO@J2N7QTR9R3>
References: <20260325113138.4171430-1-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260325113138.4171430-1-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_062815_218702_AB95D97D 
X-CRM114-Status: GOOD (  20.44  )
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

On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> The ARM Service Calling Convention (SMCCC) specifies that the function
> identifier and parameters should be passed in registers, leaving the
> 16-bit immediate field of the SMC instruction un-handled.

That's not quite right; the SMCCC spec says callers must use immediate
0.

See https://developer.arm.com/documentation/den0028/h/ section 2.10
("SME and HVC immediate value"), which says:

| • For all compliant calls, an SMC or HVC immediate value of zero must be
|   used.
| • Nonzero immediate values in SMC instructions are reserved.
| • Nonzero immediate values in HVC instructions are designated for use by
|   hypervisor vendors.

> Currently, our pKVM handler ignores the immediate value, which could lead
> to non-compliant software relying on implementation-defined behavior.
> Enforce the host kernel running under pKVM to use an immediate value
> of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> error code back to the caller.

From my PoV, it'd be fine to turn a non-zero immediate into an UNDEF:

* For HVC, we can say any non-zero immediate represents a request to KVM to
  inject an UNDEF.

* For SMC, the dbehaviour is not defined.

I am also ok with returning a value in x0, BUT that's stronger than SMCCC
actually requires.

Mark.

> Signed-off-by: Sebastian Ene <sebastianene@google.com>
> ---
> v1 -> v2:
> 
>  - Dropped injecting an UNDEF and return an error instead
>    (SMCCC_RET_NOT_SUPPORTED)
>  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
>  - Updated the title of the commit message from:
>    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
>     smc with imm16 != 0"
> ---
>  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> index e7790097db93..4ffe30fd8707 100644
> --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
>  		handle_host_hcall(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_SMC64:
> +		if (ESR_ELx_xVC_IMM_MASK & esr) {
> +			cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> +			kvm_skip_host_instr();
> +			break;
> +		}
> +
>  		handle_host_smc(host_ctxt);
>  		break;
>  	case ESR_ELx_EC_IABT_LOW:
> -- 
> 2.53.0.1018.g2bb0e51243-goog
> 

