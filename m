Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41150E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0y+T6stFGtCR9j5FAgTjlY8qyAsRTRHiL9/LUhHI998=; b=plAvOK1vn3+Id+fz7zKYnFS+wA
	c92fdcQ2pXCwSyzL0KTJ8GjS7MaVBRbPO6l0x/ReehG9UI0lRrhGD3AGVXdtkXnsxpFBlHdbDwTln
	2yoLdxnju2BLtrxFQjRpirBVbp/mm6AZTUJqkP7oXs7vLpy2lfdrKvN2XbftVmap52RbOW4CV9HQS
	7pI1jL5e2oQtd4TBPFD9WLMoRQzn7EPqjL9wwmUhgS9lUxmK4KUZ3g522zXLjWrVKPtbNp1TT3kte
	1y54pewqAoaFjStmUqDVj8MNGepuwHsoH3/FFraqfazKPfePL4A/NnqIYTgEvTOpPh8mBijUr6FJc
	LIVxoTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeKF-000000087jd-1gJg;
	Mon, 09 Dec 2024 14:01:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeFT-000000086hO-3LCF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 13:56:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D1EF113E;
	Mon,  9 Dec 2024 05:56:59 -0800 (PST)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7C843F720;
	Mon,  9 Dec 2024 05:56:29 -0800 (PST)
Date: Mon, 9 Dec 2024 13:56:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/4] arm64/sysreg: Allow a 'Mapping' descriptor for
 system registers
Message-ID: <Z1b3B2swQ0HrB3bO@J2N7QTR9R3.cambridge.arm.com>
References: <20241207190740.2607673-1-maz@kernel.org>
 <20241207190740.2607673-2-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241207190740.2607673-2-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_055631_878505_44E33508 
X-CRM114-Status: GOOD (  23.84  )
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

On Sat, Dec 07, 2024 at 07:07:37PM +0000, Marc Zyngier wrote:
> *EL02 and *_EL12 system registers are actually only accessors for
> EL0 and EL1 registers accessed from EL2 when HCR_EL2.E2H==1. They
> do not have fields of their own.
> 
> To that effect, introduce a 'Mapping' entry, describing which
> system register an _EL12 register maps to.
> 
> Implementation wise, this is handled the same was as Fields,
> which ls only a comment.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/tools/gen-sysreg.awk | 2 +-
>  arch/arm64/tools/sysreg         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> index d1254a056114e..1a2afc9fdd42e 100755
> --- a/arch/arm64/tools/gen-sysreg.awk
> +++ b/arch/arm64/tools/gen-sysreg.awk
> @@ -206,7 +206,7 @@ END {
>  
>  # Currently this is effectivey a comment, in future we may want to emit
>  # defines for the fields.
> -/^Fields/ && block_current() == "Sysreg" {
> +(/^Fields/ || /^Mapping/) && block_current() == "Sysreg" {
>  	expect_fields(2)
>  
>  	if (next_bit != 63)
> diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
> index b081b54d6d227..b6846c601df6c 100644
> --- a/arch/arm64/tools/sysreg
> +++ b/arch/arm64/tools/sysreg
> @@ -38,6 +38,13 @@
>  # Fields	<fieldsname>
>  # EndSysreg
>  
> +# For register names indicating a cross-EL access (*_EL12, *EL02),
> +# a Mapping entry describes the register it actually accesses:

It might be better to say:

| For VHE aliases (*_EL12, *_EL02) of system registers, a Mapping entry
| describes the register the alias actually accesses:

... and with that'd it's probably best to place this above the
description of SysregFields, so that people see this first and don't
copy the anti-pattern you're trying to remove.

For SysregFields we could clarify the existing wording to:

| Where multiple system regsiters are not VHE aliases but share a common
| layout, a SysregFields block can be used to describe the shared
| layout:

With or without those changes:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> +
> +# Sysreg 	<name_EL12>	<op0> 	<op1>	<crn>	<crm>	<op2>
> +# Mapping	<name_EL1>
> +# EndSysreg
> +
>  # For ID registers we adopt a few conventions for translating the
>  # language in the ARM into defines:
>  #
> -- 
> 2.39.2
> 

