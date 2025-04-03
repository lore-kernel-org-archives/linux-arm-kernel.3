Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC27C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 10:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe2enAhJycZGqY3npam/BdMZDLypvUBnYJHzMcOUVMM=; b=PVT+7KdJ9fMY5Yzp8mpLnV8l10
	gu1l9vTfx88NBLqdaLVKUxdtLxlKAFKXaWtnJ5++u7Ike4dnuP2AkKOEAg1mgw7xv5TK6Gqlu3lCc
	E5Oq4tX1yCZlqlmPWbL+d58WJBr8lB/HsVL4KQqMZm7xdt3SmfU1CgPFUlRtIV4ZI/Ho0pwjlStHC
	Qj/7dQ2xF/h7vbV64RNkseH2/WJmKchviaQ8TkvihGFV7qy+nPGrot8ufCkLHGK6XMsYaKmtTF//t
	u0Yb8I8Q/7f6sx+1JEU++xISDGMjX5/VsV1gAqiqlV/o39aZH9VTzU9Qz2MQ9X5mo5frrKP11ZbT+
	8BSEyNkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0HRe-00000008TwY-0ewf;
	Thu, 03 Apr 2025 10:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0GVJ-00000008L5U-0Smf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 09:04:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1D12106F;
	Thu,  3 Apr 2025 02:04:52 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF29A3F63F;
	Thu,  3 Apr 2025 02:04:47 -0700 (PDT)
Message-ID: <957ccba4-2ae1-4358-b62d-3b5c44d7f1ca@arm.com>
Date: Thu, 3 Apr 2025 10:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] arm64: Provide basic EL2 setup for FEAT_{LS64,
 LS64_V} usage at EL0/1
To: Yicong Yang <yangyicong@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, corbet@lwn.net,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Cc: joey.gouly@arm.com, yuzenghui@huawei.com, shuah@kernel.org,
 jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
 linuxarm@huawei.com, prime.zeng@hisilicon.com, xuwei5@huawei.com,
 yangyicong@hisilicon.com, tangchengchang@huawei.com
References: <20250331094320.35226-1-yangyicong@huawei.com>
 <20250331094320.35226-2-yangyicong@huawei.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250331094320.35226-2-yangyicong@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_020453_192744_45996A66 
X-CRM114-Status: GOOD (  14.85  )
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

On 31/03/2025 10:43, Yicong Yang wrote:
> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> Instructions introduced by FEAT_{LS64, LS64_V} is controlled by
> HCRX_EL2.{EnALS, EnASR}. Configure all of these to allow usage
> at EL0/1.
> 
> This doesn't mean these instructions are always available in
> EL0/1 if provided. The hypervisor still have the control at
> runtime.
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>   arch/arm64/include/asm/el2_setup.h | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
> index ebceaae3c749..0259941602c4 100644
> --- a/arch/arm64/include/asm/el2_setup.h
> +++ b/arch/arm64/include/asm/el2_setup.h
> @@ -57,9 +57,19 @@
>           /* Enable GCS if supported */
>   	mrs_s	x1, SYS_ID_AA64PFR1_EL1
>   	ubfx	x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
> -	cbz	x1, .Lset_hcrx_\@
> +	cbz	x1, .Lskip_gcs_hcrx_\@
>   	orr	x0, x0, #HCRX_EL2_GCSEn
>   
> +.Lskip_gcs_hcrx_\@:

minor nit: For consistency, could we rename this "set_ls64", similar to 
"set_hcrx" ?

> +	/* Enable LS64, LS64_V if supported */
> +	mrs_s	x1, SYS_ID_AA64ISAR1_EL1
> +	ubfx	x1, x1, #ID_AA64ISAR1_EL1_LS64_SHIFT, #4
> +	cbz	x1, .Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnALS
> +	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
> +	b.lt	.Lset_hcrx_\@
> +	orr	x0, x0, #HCRX_EL2_EnASR
> +
>   .Lset_hcrx_\@:
>   	msr_s	SYS_HCRX_EL2, x0
>   .Lskip_hcrx_\@:

Suzuki

