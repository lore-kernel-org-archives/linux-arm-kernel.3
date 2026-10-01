Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF32CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on88P7izvphnCHCDc8e1Yaww3dTpsQnTne0sTtDZayk=; b=krMDtDCmddH9VCyfNEvF/AfUfm
	dig8pokaRaJCUGqVY3M8zAzaRkZOQgxqpmLbNtlyEfQW3ZNaMGueYcMOo7iHHVWIYuRiO0LYxDkXk
	3CAyDRqa0+MuzRi/LFIIIo0k9fTJftHkfAxZYNFdMhHC1BbFci8KYSKw6RI3jXrdaSJGtPq2PBkKw
	uNhoUcQSRttaqJqU04Q7bl2nQoB2XEbO22mzfMvm9nlZIs03yJIO80w5xHjSrvAWsGM3UjWRMKY2c
	WeXhg3EwjSP/v/6+xz5B/o3hedFU1tdmKT8hva8P1HjXadOy8B/fdI+JXf3rZ5ap0QrRQ/IZPUUfG
	YXSBELEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJr4-00000009keF-0Xln;
	Thu, 01 Oct 2026 16:41:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJr1-00000009ke7-3lwe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:41:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4F2784338B;
	Thu,  1 Oct 2026 16:41:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBDC31F000FF;
	Thu,  1 Oct 2026 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790872915;
	bh=on88P7izvphnCHCDc8e1Yaww3dTpsQnTne0sTtDZayk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PSaAw3rp4iuMnLC2doiY087YMDwz30kvUtFgDv8SFiWd82JL1XyBPYwZQH4D9szjz
	 869IgWaH459u48KKhV/iM/v5TVMxn63Yz6MevE5LEgk+2eUJfjY/Ni5RUaZQ4To0us
	 vlIbxDQTENO0/kaNv0dpPT9XQhTqRWFGahGNcs6fSoqMzEcrl4tvLeVVfESRc0HjFj
	 hYp6rGGOMLx0sqDqvUwS8SP17rXI8SsMhypDqJDyOyDeVDVkoW2rMLQjd5J7qH1dD1
	 i1DAoiZ4MomHCbTeEE4Bgy6JCl7PEhMuMxM4Plp6VATs471uvz8AAEYPP2lZareaGa
	 JLRKPdwYS/h0g==
Date: Thu, 1 Oct 2026 17:41:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Peter Maydell <peter.maydell@linaro.org>, 
	Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
	Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 13/15] KVM: selftests: arm64: Only restore SPSR_EL1
 and ELR_EL1 if they change
Message-ID: <ar6M4AqGoSUb1dkq@gremlin>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
 <20260930-arm64-gcs-v21-13-3556644cd927@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-arm64-gcs-v21-13-3556644cd927@kernel.org>
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

On Wed, Sep 30, 2026 at 10:48:23PM +0100, Mark Brown wrote:
> When EXLOCK is enabled for ELx writes to SPSR_ELx and ELR_ELx generate
> GCS exceptions. Currently the selftest helpers unconditionally reload the
> saved values for these registers regardless of if the handler didn't change
> them. This gets in the way of EXLOCK testing, making it hard to generate
> contexts which will generate an invalid ERET since we never get as far as
> doing an exception return while EXLOCK is enabled.

Sounds reasonable.

>
> In order to facilitate testing of nested virtualisation emulation of EXLOCK
> change our reloads into read/modify/write cycles, suppressing the writes
> when they would not change the value in the register.

Also sounds sensible.

>
> Reviewed-by: Leonardo Bras <leo.bras@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>

Also looks obviously correct (TM) to me so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  tools/testing/selftests/kvm/lib/arm64/handlers.S | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/arm64/handlers.S b/tools/testing/selftests/kvm/lib/arm64/handlers.S
> index 0e443eadfac6..367c22d61cba 100644
> --- a/tools/testing/selftests/kvm/lib/arm64/handlers.S
> +++ b/tools/testing/selftests/kvm/lib/arm64/handlers.S
> @@ -33,8 +33,18 @@
>
>  .macro restore_registers
>  	ldp	x1, x2, [sp, #16 * 16] /* PC, PSTATE */
> +
> +	/* Suppress redundant writes to support GCS exception lock testing */
> +	mrs	x3, elr_el1
> +	cmp	x1, x3
> +	beq	.Lskip_elr_\@
>  	msr	elr_el1, x1
> +.Lskip_elr_\@:
> +	mrs	x3, spsr_el1
> +	cmp	x2, x3
> +	beq	.Lskip_spsr_\@

Even as an arm64 assembly novice I can see what this is doing :)

>  	msr	spsr_el1, x2
> +.Lskip_spsr_\@:
>
>  	/* sp is not restored */
>  	ldp	x30, xzr, [sp, #16 * 15] /* x30, SP */
>
> --
> 2.47.3
>
>

--
Cheers, Lorenzo

