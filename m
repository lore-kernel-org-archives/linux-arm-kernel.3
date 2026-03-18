Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42296103E166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TkP7SaM/TXleGI75OgSTizEjIwsffPsOCVfJ7qof9gI=; b=YDoK7JzkYknbVUp6pIfmdzI/x7
	jEnUrMT5BcfJDYhKKGWfTU3/tpiyzRcQTcI6ZyfZJw7v+29rdKKS0ITQxJv5uHJFM7QEDiA+A3wRW
	wnAovyM+0wU6xqyfZmZsMLCgvFKJ+a23k6HnVPRtwI/zFRnkNOyQ8mMd1HyL1Gk0FkUgGQ+8LwB0F
	NKU0vvoHpyxH4VQSmGucQ4/2/sFATX4F8bn3bKLNomo6RY/qRKL7hov7YfCQTJqMKrJCS5HJgy6HI
	El7odN/gmZCvJZy7RB2BJ7ULqgcjPCM1PCK+978FAQ7wBasUpiTza5bEV85eP1Qk1ElSlvdIGWYhW
	7BG+52/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pCx-00000008JvY-3ZE1;
	Wed, 18 Mar 2026 11:37:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pCu-00000008Ju3-3WpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:37:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE7101E2F;
	Wed, 18 Mar 2026 04:36:50 -0700 (PDT)
Received: from [10.57.61.122] (unknown [10.57.61.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39AF83F73B;
	Wed, 18 Mar 2026 04:36:53 -0700 (PDT)
Message-ID: <ea827ef4-3a40-4242-adcd-790a11659493@arm.com>
Date: Wed, 18 Mar 2026 11:36:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: realm: Fix PTE_NS_SHARED for 52bit PA support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: mark.rutland@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org,
 aneesh.kumar@kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20260316161901.2410354-1-suzuki.poulose@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20260316161901.2410354-1-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_043700_929714_AC73D1A3 
X-CRM114-Status: GOOD (  18.85  )
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

On 16/03/2026 16:19, Suzuki K Poulose wrote:
> With LPA/LPA2, the top bits of the PFN (Bits[51:48]) end up in the lower bits
> of the PTE. So, simply creating a mask of the "top IPA bit" doesn't work well
> for these configurations to set the "top" bit at the output of Stage1
> translation.
> 
> Fix this by using the __phys_to_pte_val() to do the right thing for all
> configurations.
> 
> Tested using, kvmtool, placing the memory at a higher address (-m <size>@<Addr>).
> 
>  e.g:
>  # lkvm run --realm -c 4 -m 512M@@128T -k Image --console serial
> 
>  sh-5.0# dmesg | grep "LPA2\|RSI"
> [    0.000000] RME: Using RSI version 1.0
> [    0.000000] CPU features: detected: 52-bit Virtual Addressing (LPA2)
> [    0.777354] CPU features: detected: 52-bit Virtual Addressing for KVM (LPA2)
> 
> Fixes: 399306954996 ("arm64: realm: Query IPA size from the RMM")
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  arch/arm64/kernel/rsi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
> index c64a06f58c0b..9e846ce4ef9c 100644
> --- a/arch/arm64/kernel/rsi.c
> +++ b/arch/arm64/kernel/rsi.c
> @@ -12,6 +12,7 @@
>  
>  #include <asm/io.h>
>  #include <asm/mem_encrypt.h>
> +#include <asm/pgtable.h>
>  #include <asm/rsi.h>
>  
>  static struct realm_config config;
> @@ -146,7 +147,7 @@ void __init arm64_rsi_init(void)
>  		return;
>  	if (WARN_ON(rsi_get_realm_config(&config)))
>  		return;
> -	prot_ns_shared = BIT(config.ipa_bits - 1);
> +	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
>  
>  	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
>  		return;


