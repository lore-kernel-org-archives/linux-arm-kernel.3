Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E23D6DDCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 04:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQUvtnS3qluMHTld2rZ3ZN+B4sN7fghTJyJ5F6xsX+k=; b=FI1vhO1sbM6rO0htB4+ipV/NaF
	rf2rj6HWA0UVXXg13KbtOqan39QRGwMYKc5bCv6Jpo0gQugokdUNgeus0uohLYP+zKQP268minQ/r
	v9VjmSRzKdKdbx+L0hkrBdkskapjk2lWbOKT+IQ5qpeFIzSdXiRKO3wdpp+04K8XSRCC3M3LsCgZc
	iyDPU/VCOG8C2QPq4Ger7bIczNelvyKWiUUzj06qzK6mxcn1btC3ROPUcrtDOfhIvb4W5MFngTSRz
	JbUCXxwCMsTt/jYk/PVnLUhNL/iXaQBSMhZmau+c1ZFg8N4+qtUNg5rvh3nrif2ncWzokjq7V84me
	kwE1WcsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBnux-00000001a0D-2rZ1;
	Fri, 15 Nov 2024 04:26:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBnu1-00000001ZtO-1Yok
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 04:25:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB66315BF;
	Thu, 14 Nov 2024 20:26:14 -0800 (PST)
Received: from [10.163.45.151] (unknown [10.163.45.151])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9651C3F66E;
	Thu, 14 Nov 2024 20:25:40 -0800 (PST)
Message-ID: <5e836e52-bc10-462b-b819-f3e4d33bf876@arm.com>
Date: Fri, 15 Nov 2024 09:55:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: Refactor conditional logic
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 will@kernel.org, broonie@kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Joey Gouly <joey.gouly@arm.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241114142333.18210-1-hardevsinh.palaniya@siliconsignals.io>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20241114142333.18210-1-hardevsinh.palaniya@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_202549_494245_3D6160B5 
X-CRM114-Status: GOOD (  18.88  )
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

A small nit.

The subject line could have been more specific to where this
change applies (example below), otherwise it is too broad in
the entire arm64 platform context.

arm64/cpufeature: Refactor conditional logic in init_cpu_ftr_reg()

On 11/14/24 19:52, Hardevsinh Palaniya wrote:
> Unnecessarily checks ftr_ovr == tmp in an extra else if, which is not
> needed because that condition would already be true by default if the
> previous conditions are not satisfied.
> 
> 		if (ftr_ovr != tmp) {
> 		} else if (ftr_new != tmp) {
> 		} else if (ftr_ovr == tmp) {
> 
> Logic: The first and last conditions are inverses of each other, so 
> the last condition must be true if the first two conditions are false.
> 
> Additionally, all branches set the variable str, making the subsequent
> "if (str)" check redundant
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
> 
> Changelog in V2:
> 
> - remove str check 
> 
> Change in V3:
> 
> - Add logic in commit msg 
> - Add review tag
> ---
>  arch/arm64/kernel/cpufeature.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> index 718728a85430..728709483fb7 100644
> --- a/arch/arm64/kernel/cpufeature.c
> +++ b/arch/arm64/kernel/cpufeature.c
> @@ -989,17 +989,16 @@ static void init_cpu_ftr_reg(u32 sys_reg, u64 new)
>  				/* Override was valid */
>  				ftr_new = tmp;
>  				str = "forced";
> -			} else if (ftr_ovr == tmp) {
> +			} else {
>  				/* Override was the safe value */
>  				str = "already set";
>  			}
>  
> -			if (str)
> -				pr_warn("%s[%d:%d]: %s to %llx\n",
> -					reg->name,
> -					ftrp->shift + ftrp->width - 1,
> -					ftrp->shift, str,
> -					tmp & (BIT(ftrp->width) - 1));
> +			pr_warn("%s[%d:%d]: %s to %llx\n",
> +				reg->name,
> +				ftrp->shift + ftrp->width - 1,
> +				ftrp->shift, str,
> +				tmp & (BIT(ftrp->width) - 1));
>  		} else if ((ftr_mask & reg->override->val) == ftr_mask) {
>  			reg->override->val &= ~ftr_mask;
>  			pr_warn("%s[%d:%d]: impossible override, ignored\n",

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

