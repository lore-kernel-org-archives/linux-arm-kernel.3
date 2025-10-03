Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9764CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1pjrsHvqvWcIvX2/A5adXAaq38O48aqC9LBqkoR5OI=; b=WhsJpBAFfOOv+OpH75waD9Y42v
	df7kj/ZJnf9M3YUnbe1/L+YxpLlQgYMY/OL6OK5QVclHxO9Bezj3YXkiMCqfDjjtbYuS04vYH7taH
	Qc4eDIJhqdjo3rhk3ipusAxscWJUHlAAo8IqgIXKEmsli45MvkzhO8to6/dZfKHPIuumuLIM5QqI9
	pm6pa4A67nGbMCv10nU/bFrb40jDS3HOGqCDAaE1TQgCaerA+oXzqSO6Cg1MsvON3LL2tguhQgGDY
	Vtu7vegvvjEIr+SI5mUVQxxqJ4N32IPVFdqU9mXo8ndl15anC/leIhirYyqPj9caz5+ouf+jsnVC6
	MFatkYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ghO-0000000CY2Y-0ATG;
	Fri, 03 Oct 2025 14:23:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ghL-0000000CY0o-2ILo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 14:23:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E77B043C22;
	Fri,  3 Oct 2025 14:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A75AC4CEF5;
	Fri,  3 Oct 2025 14:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759501430;
	bh=vrqQ/uunB3QJ/L4U5wadBAHA2oI5nDh2QtaYKaOQA8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eLbPn1Qkc5Hh3mJE5C6B1Hd2fp6R7O3RszHc6FCqPd/WXmv+Vu4k1mkKPwTTYpBF1
	 adZmmlpSL4ZATMWG93PUMfAXvwcfPR/os5M1AnAk7sxPboD48rTGHEa5iDhl9xM8+u
	 kzKzPntdp+prpoJSrypes4/3r/0dGcu3GnsQogpwOi22ZHlQV1xFcUKhX/3uvPW0os
	 AvUx6skBfn2Gvtzfy0NiIV6ih9OwCiywkpQRYJx6T6BOBE+35bkD7pqNm3XMEWDA8w
	 fYfvu4dqfB1XiErY+R4v9FpUUYRUs4q+tnghvnSTgd8XDgVwIFFUcCJpfPSOpSK/ip
	 QnxzKpvJzUymA==
Date: Fri, 3 Oct 2025 15:23:45 +0100
From: Will Deacon <will@kernel.org>
To: shechenglong <shechenglong@xfusion.com>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stone.xulei@xfusion.com,
	chenjialong@xfusion.com, yuxiating@xfusion.com,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] cpu: fix hard lockup triggered by printk calls within
 scheduling context
Message-ID: <aN_ccUJZQVMmk1V-@willie-the-truck>
References: <20250918064907.1832-1-shechenglong@xfusion.com>
 <20250924123247.807-1-shechenglong@xfusion.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924123247.807-1-shechenglong@xfusion.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_072351_623306_C6CDAA0A 
X-CRM114-Status: GOOD (  21.97  )
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

On Wed, Sep 24, 2025 at 08:32:47PM +0800, shechenglong wrote:
> relocate the printk() calls from spectre_v4_mitigations_off() and
> spectre_v2_mitigations_off() into setup_system_capabilities() function,
> preventing hard lockups that occur when printk() is invoked from scheduler context.
> 
> Link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250918064907.1832-1-shechenglong@xfusion.com/
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: shechenglong <shechenglong@xfusion.com>
> ---
>  arch/arm64/include/asm/spectre.h |  3 +++
>  arch/arm64/kernel/cpufeature.c   |  9 +++++++++
>  arch/arm64/kernel/proton-pack.c  | 18 ++++--------------
>  3 files changed, 16 insertions(+), 14 deletions(-)

Thanks for posting the patch!

> diff --git a/arch/arm64/include/asm/spectre.h b/arch/arm64/include/asm/spectre.h
> index 8fef12626090..6fe29df41788 100644
> --- a/arch/arm64/include/asm/spectre.h
> +++ b/arch/arm64/include/asm/spectre.h
> @@ -118,5 +118,8 @@ void spectre_bhb_patch_wa3(struct alt_instr *alt,
>  void spectre_bhb_patch_clearbhb(struct alt_instr *alt,
>  				__le32 *origptr, __le32 *updptr, int nr_inst);
>  
> +bool spectre_v2_mitigations_off(void);
> +bool spectre_v4_mitigations_off(void);
> +
>  #endif	/* __ASSEMBLY__ */
>  #endif	/* __ASM_SPECTRE_H */
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index ef269a5a37e1..7d1f541e66a0 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -94,6 +94,7 @@
>  #include <asm/traps.h>
>  #include <asm/vectors.h>
>  #include <asm/virt.h>
> +#include <asm/spectre.h>
>  
>  /* Kernel representation of AT_HWCAP and AT_HWCAP2 */
>  static DECLARE_BITMAP(elf_hwcap, MAX_CPU_FEATURES) __read_mostly;
> @@ -3942,6 +3943,14 @@ static void __init setup_system_capabilities(void)
>  	 */
>  	if (system_uses_ttbr0_pan())
>  		pr_info("emulated: Privileged Access Never (PAN) using TTBR0_EL1 switching\n");
> +
> +	/*
> +	 * Report Spectre mitigations status.
> +	 */
> +	if (spectre_v2_mitigations_off())
> +		pr_info("spectre-v2 mitigation disabled by command line option\n");

nit: Let's fix the message here for consistency and use "command-line".

> +	if (spectre_v4_mitigations_off())
> +		pr_info("spectre-v4 mitigation disabled by command-line option\n");

I think it would be cleaner to have a new function in proton-pack.c, say
"spectre_print_disabled_mitigations()" which can then print the messages
for spectre v2, v4 and also spectre-bhb (currently done in
spectre_bhb_enable_mitigation()).

While you're at it, spectre-bhb is weird because it also prints a message
when the Kconfig is disabled. We should actually just get rid of that
Kconfig option altogether (in a separate patch) like we did for the other
spectre mitigations.

What do you think?

Cheers,

Will

