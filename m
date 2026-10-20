Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F73606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OYzqWCXH;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MCSUENK7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+D6NBtn95HNaLxufZNtWrZ1fBMzOt5cfhIvGqJ6zuQc=; b=OYzqWCXHjQ90WpR05ucpXPpeEe
	p5COKr79TeLMwhE4yU+DWOX+hpzZtaKiiyngh2L4kIM6uCVK5l3XcQykCLFRqkDF+KJY//OUmC98l
	GXL+1RIx1e1MJQdQeDDR3thahyrku/ncIiHr+h7mG8rCqmcfVcZHzxgTi4oGVItHVQbrTyG0EQtV8
	NC+o/kG05MUP+jlZlKEKmWn5uPGyRcLRcIBm4jw37X2Jg3HinmpyZdOlx/whs7MvH4DBzJ2Zw3vA/
	d2idNpeUGCZRgvsHLKZMa6oT5TSlHN1GPMPRYYK4+WVTjCaTXJkoNOSedrgQ2wTApSTv9rJeHxOmc
	9K/xhEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Rm-00000009MRg-324V;
	Tue, 20 Oct 2026 09:47:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ6Rk-00000009MQz-0krG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 09:47:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 366CD1595;
	Tue, 20 Oct 2026 02:47:45 -0700 (PDT)
Received: from [10.0.152.204] (e121487-lin.cambridge.arm.com [10.0.152.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4924C3F7B4;
	Tue, 20 Oct 2026 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792489668; bh=yzwTBJkkMsTfYuWPXsd+9ri4ACEbXa+SNPLHIPCEj9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MCSUENK7W5XYuVtCe1ECWDWpz2b4zJC+606GUA9o5CvxbCjrvVfO09/TvvBM2hySK
	 MMM/7UdjRO/gBwg6p4MuOgavcufOrX69a8nsU+Ki+x9f2oU2wiQmF/BQBcMPGgu3LN
	 P4h3nI/g2QKsgWF5d3rodZGr9GZTufa5iiyJ5+VM=
Message-ID: <afce24f3-b85a-49ff-b0e1-51d32ba2b960@arm.com>
Date: Tue, 20 Oct 2026 10:47:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: insn: fix system register inconsistencies
To: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Tejun Heo <tj@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Lucas Wei <lucaswei@google.com>, Sascha Bischoff <Sascha.Bischoff@arm.com>,
 Barry Song <baohua@kernel.org>, Oliver Upton <oupton@kernel.org>
References: <20261016164648.251258-1-ada.coupriediaz@arm.com>
 <20261016164648.251258-3-ada.coupriediaz@arm.com>
Content-Language: en-GB
From: Vladimir Murzin <vladimir.murzin@arm.com>
In-Reply-To: <20261016164648.251258-3-ada.coupriediaz@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_024752_309947_48594381 
X-CRM114-Status: GOOD (  18.93  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/16/26 17:46, Ada Couprie Diaz wrote:
> Two registers in `enum aarch64_insn_special_register` are defined
> incorrectly :
>  - SPSR_IRQ is named SPSR_I*N*Q
>  - SP_EL2's encoding is incorrect and does not correspond to ant register

Nitpick: s/ant/any ?

> 
> Fix those issues and re-order the registers by value.
> Update `enum aarch64_insn_system_register` values and order to be in line
> with `enum aarch64_insn_special_register`, so that we can make
> `aarch64_insn_gen_mrs()` use the same mask as
> `aarch64_insn_extract_system_reg()` while we're here.
> 
> This does not change the behaviour, as `aarch64_insn_encode_register()`
> always masks the lower bits and the top bit of registers are always set.
> 

I think aarch64_insn_encode_register() is not relevant here since
before the change bit[20] was set via aarch64_insn_get_mrs_value()
which returns 0xD5300000. With the change we'd do not rely on
aarch64_insn_get_mrs_value() any more.

> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> ---
>  arch/arm64/include/asm/insn.h | 12 ++++++------
>  arch/arm64/lib/insn.c         |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/insn.h b/arch/arm64/include/asm/insn.h
> index c91a8431c961e..2e45f6e80d15f 100644
> --- a/arch/arm64/include/asm/insn.h
> +++ b/arch/arm64/include/asm/insn.h
> @@ -119,27 +119,27 @@ enum aarch64_insn_special_register {
>  	AARCH64_INSN_SPCLREG_SP_EL0	= 0xC208,
>  	AARCH64_INSN_SPCLREG_SPSEL	= 0xC210,
>  	AARCH64_INSN_SPCLREG_CURRENTEL	= 0xC212,
> -	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,
>  	AARCH64_INSN_SPCLREG_NZCV	= 0xDA10,
> +	AARCH64_INSN_SPCLREG_DAIF	= 0xDA11,

Reorder, as promised in commit message

>  	AARCH64_INSN_SPCLREG_FPCR	= 0xDA20,
>  	AARCH64_INSN_SPCLREG_DSPSR_EL0	= 0xDA28,
>  	AARCH64_INSN_SPCLREG_DLR_EL0	= 0xDA29,
>  	AARCH64_INSN_SPCLREG_SPSR_EL2	= 0xE200,
>  	AARCH64_INSN_SPCLREG_ELR_EL2	= 0xE201,
>  	AARCH64_INSN_SPCLREG_SP_EL1	= 0xE208,
> -	AARCH64_INSN_SPCLREG_SPSR_INQ	= 0xE218,
> +	AARCH64_INSN_SPCLREG_SPSR_IRQ	= 0xE218,

Rename, as promised in commit message

>  	AARCH64_INSN_SPCLREG_SPSR_ABT	= 0xE219,
>  	AARCH64_INSN_SPCLREG_SPSR_UND	= 0xE21A,
>  	AARCH64_INSN_SPCLREG_SPSR_FIQ	= 0xE21B,
>  	AARCH64_INSN_SPCLREG_SPSR_EL3	= 0xF200,
>  	AARCH64_INSN_SPCLREG_ELR_EL3	= 0xF201,
> -	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF210
> +	AARCH64_INSN_SPCLREG_SP_EL2	= 0xF208,

Correct encoding, as promised in commit message

>  };
>  
>  enum aarch64_insn_system_register {
> -	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0x4684,
> -	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0x6682,
> -	AARCH64_INSN_SYSREG_SP_EL0	= 0x4208,
> +	AARCH64_INSN_SYSREG_SP_EL0	= 0xC208,
> +	AARCH64_INSN_SYSREG_TPIDR_EL1	= 0xC684,
> +	AARCH64_INSN_SYSREG_TPIDR_EL2	= 0xE682,

Aligns encoding (we basically account for bit[20] of mrs) with
aarch64_insn_special_register, again as promised in commit message

>  };
>  
>  enum aarch64_insn_variant {
> diff --git a/arch/arm64/lib/insn.c b/arch/arm64/lib/insn.c
> index 5c37f3a4c402b..94ee1aae2f5b7 100644
> --- a/arch/arm64/lib/insn.c
> +++ b/arch/arm64/lib/insn.c
> @@ -1566,7 +1566,7 @@ u32 aarch64_insn_gen_mrs(enum aarch64_insn_register result,
>  {
>  	u32 insn = aarch64_insn_get_mrs_value();
>  

insn is 0xD5300000, bit[20] is set

> -	insn &= ~GENMASK(19, 0);
> +	insn &= ~GENMASK(20, 5);

bit[20] is clear

>  	insn |= sysreg << 5;

bit[20] is set

>  	return aarch64_insn_encode_register(AARCH64_INSN_REGTYPE_RT,
>  					    insn, result);
> -- 2.43.0
> 

FWIW,

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


