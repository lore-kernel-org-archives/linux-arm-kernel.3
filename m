Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4273EC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PDu19BjiI9AhkjE5BIfUBslC9MAuLaoj6YB1o1XS/ZM=; b=gENfGQU9Akcf6IYz3GXbd0oIxf
	jiaXpp9aFFN+WA5W7DEOr0I+d8CINrpyiGuTeoJlO+6MmX2Ta6AtHUqD+UY8sgDvzQCN0xelEPzW9
	JsYHbGrz22dGzYXdzpAEjyD5z0rpPurqrtRDUEIcxNxzjvO10MKpvVVVkLmj+BWK+8ly/anTGVxF1
	3jfMDg8HeppHSjbq/jqAzEn7sLUMFwuQKwVIZ9tIjWPXtIK8vRGfLDI8vkLeZbRqlitvo0KDmbjKE
	FLFMEJDD73o8fS3gTS3vz/XRJgeRZ2tbpiibCEiaW0i9h+IjjJ5qQD/fPaBKRUXpAF/kAyAekg0qn
	4FqavKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AE7-000000009kY-19w4;
	Thu, 03 Sep 2026 16:23:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AE6-000000009kK-1lUr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:23:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A41E8601EF;
	Thu,  3 Sep 2026 16:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0B61F000E9;
	Thu,  3 Sep 2026 16:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788452625;
	bh=PDu19BjiI9AhkjE5BIfUBslC9MAuLaoj6YB1o1XS/ZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hlg0F1E0VCrtl/SDZ8Eode7rB/skCUp1JgvIBAx6yBzM9pnGYY2hhZdxzGgmIkjKc
	 zDGwVMntVC6G7YM24UgUB+xTVeyL0swXoVBpk51V6uBWdjTQaTs10olHtbwMx6+Piv
	 AZ0o2F6wxCamWCeGKw5hOqWcg98oxW2PNBRbYDHUcRcXWtIFrZCu8uvGmMlhC0icaz
	 bfoywEMZTn2hAltlYZ50yZUo08BmBFb6zhMDPGDWLdUFHdr9f/wpGeMXTuO9r9N/My
	 PTKnaNxz7Wu+M+Jgv4icSs12riikr8UwqExehgxVgPf6coilEFtxAmioXmzpoMuh17
	 Zm2wACI1ZgEwg==
Date: Thu, 3 Sep 2026 17:23:38 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 02/14] KVM: arm64: Fix FGT mapping for
 HFGITR_EL2.nGCSEPP
Message-ID: <apmcDT8YTjS6eXE0@gremlin>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org>
 <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-gcs-v20-2-f31750bdfadb@kernel.org>
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

On Tue, Sep 01, 2026 at 10:47:00PM +0100, Mark Brown wrote:
> The encoding to trap mapping currently maps a FGT on OP_GCSPOPX to
> HFGITR_EL2.nGCSEPP but as per DDI0601 2026-06 this FGT controls trapping
> of GCSPUSHX and GCSPOPCX, and not the separate GCSPOPX instruction.
> Update the mapping to reflect the architecture.
>
> Fixes: 863ac38984a82 ("KVM: arm64: Add missing HFGITR_EL2 FGT entries to nested virt")
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  arch/arm64/kvm/emulate-nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> index 625604019fb3..3806ff0920fe 100644
> --- a/arch/arm64/kvm/emulate-nested.c
> +++ b/arch/arm64/kvm/emulate-nested.c
> @@ -1445,7 +1445,7 @@ static const struct encoding_to_trap_config encoding_to_fgt[] __initconst = {
>  	SR_FGT(OP_AT_S1E1A, 		HFGITR, ATS1E1A, 1),
>  	SR_FGT(OP_COSP_RCTX, 		HFGITR, COSPRCTX, 1),
>  	SR_FGT(OP_GCSPUSHX, 		HFGITR, nGCSEPP, 0),
> -	SR_FGT(OP_GCSPOPX, 		HFGITR, nGCSEPP, 0),
> +	SR_FGT(OP_GCSPOPCX, 		HFGITR, nGCSEPP, 0),

Yikes, yeah I see from the doc I referenced in 1/14 that that's the wrong
instruction ([0]).

I guess this wasn't visible before in any case because 9/14 is required to
actually enable this in practice?

>  	SR_FGT(OP_GCSPUSHM, 		HFGITR, nGCSPUSHM_EL1, 0),
>  	SR_FGT(OP_BRB_IALL, 		HFGITR, nBRBIALL, 0),
>  	SR_FGT(OP_BRB_INJ, 		HFGITR, nBRBINJ, 0),
>
> --
> 2.47.3
>
>

[0]: https://support.arm.com/documentation/111107/2026-06/AArch64-Registers/HFGITR-EL2--Hypervisor-Fine-Grained-Instruction-Trap-Register

--
Cheers, Lorenzo

