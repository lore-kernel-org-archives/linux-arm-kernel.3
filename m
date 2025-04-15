Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40FEC369B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 06:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooQHzbAMz0SdHQJX/DZVBgSy5/tFldKrH+svmaGXeyM=; b=YMnNhwsWLBpGbcjrgsNi4hVPR2
	GkfTqPbXl6/+REQZkCpksRS2kVCZvcbGTot2T15Ha0tCnjrOKfoS3CmUVlX3l6nEkmaFU1H9NNB2y
	3TxwPnynCTKt/z71K17c/IVLvA4WX64vmRanxLVmIjYNP3XNExyCIY1+TpUaMf/pvM8g5faXLEfqM
	yzxFBxgP0dLXhthVzeUGABouW2qb4xIUWpdwk8ekN/ECIFwvynv7PT0YXQvUiX2HGlaBQNCCkI+ZZ
	+nLd0HX9dNJ31f5kNDFaqnTJIVBuZHphS6aHXY9ksEA8Ywe0cMgAtHxoZCyJRrjK9pJcyRjtCMBGS
	rzlB9yrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZwI-00000004gpL-1tYC;
	Tue, 15 Apr 2025 06:38:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ZuS-00000004gWJ-3OVi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 06:36:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEFA415A1;
	Mon, 14 Apr 2025 23:36:37 -0700 (PDT)
Received: from [10.163.49.104] (unknown [10.163.49.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00C033F694;
	Mon, 14 Apr 2025 23:36:34 -0700 (PDT)
Message-ID: <f998cbba-bda0-472b-8f4a-a972a29f21ef@arm.com>
Date: Tue, 15 Apr 2025 12:06:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kvm: Replace ternary flags with str_on_off()
 helper
To: Seongsu Park <sgsu.park@samsung.com>, will@kernel.org,
 catalin.marinas@arm.com, yuzenghui@huawei.com, suzuki.poulose@arm.com,
 joey.gouly@arm.com, oliver.upton@linux.dev, maz@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, cpgs@samsung.com
References: <CGME20250415012410epcas1p42b48977934c21b5db0b19f4185f7a63c@epcas1p4.samsung.com>
 <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1891546521.01744691102904.JavaMail.epsvc@epcpadp1new>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_233640_892210_03513422 
X-CRM114-Status: GOOD (  10.98  )
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



On 4/15/25 06:54, Seongsu Park wrote:
> Replace repetitive ternary expressions with the str_on_off() helper
> function. This change improves code readability and ensures consistency
> in tracepoint string formatting
> 
> Signed-off-by: Seongsu Park <sgsu.park@samsung.com>
> ---
>  arch/arm64/kvm/trace_arm.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kvm/trace_arm.h b/arch/arm64/kvm/trace_arm.h
> index c18c1a95831e..9c60f6465c78 100644
> --- a/arch/arm64/kvm/trace_arm.h
> +++ b/arch/arm64/kvm/trace_arm.h
> @@ -176,7 +176,7 @@ TRACE_EVENT(kvm_set_way_flush,
>  	    ),
>  
>  	    TP_printk("S/W flush at 0x%016lx (cache %s)",
> -		      __entry->vcpu_pc, __entry->cache ? "on" : "off")
> +		      __entry->vcpu_pc, str_on_off(__entry->cache))
>  );
>  
>  TRACE_EVENT(kvm_toggle_cache,
> @@ -196,8 +196,8 @@ TRACE_EVENT(kvm_toggle_cache,
>  	    ),
>  
>  	    TP_printk("VM op at 0x%016lx (cache was %s, now %s)",
> -		      __entry->vcpu_pc, __entry->was ? "on" : "off",
> -		      __entry->now ? "on" : "off")
> +		      __entry->vcpu_pc, str_on_off(__entry->was),
> +		      str_on_off(__entry->now))
>  );
>  
>  /*

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

