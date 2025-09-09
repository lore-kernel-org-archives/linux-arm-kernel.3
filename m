Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312D6CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9g4wbhtXT0JBrht56SyaTEYS+KQol6CEwfFNxo8JkoI=; b=2ypVnqKZkz/JfR2yRGRQwqbAvc
	O7Dg/ewhWj0D/8AM27gfd+JKjDlVXb3H67ue0QyvnGMl4r6hv62jApUXj3gmBv4gDREVaONskx29S
	wXSMk3UA7gDC3erBDZZfAw2Qm34RzpYaLM6vFFWKHpt1WJQ9Pk6X7HvzbfBuA5+HSUxzi5fTcSGaK
	FDOiS7bkJv4mE+iwmoy9pGG3cnOEjF+UkAIEZ3u4bf7vSgTm8QCBvles4hO2wfqlQucnK/yVCbrw+
	K1zqq+5OFdl/A2ugy16AqOSVy39G3E400YhlRZlV4Sjzum7V5VBbsPd7GLntnjROLkwmLzKpZQF7Z
	2abuNPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsIp-00000004yAI-2clx;
	Tue, 09 Sep 2025 06:58:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvpyy-00000004CSn-1BXf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 04:29:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CBE612FC;
	Mon,  8 Sep 2025 21:29:16 -0700 (PDT)
Received: from [10.163.72.34] (unknown [10.163.72.34])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9094F3F66E;
	Mon,  8 Sep 2025 21:29:18 -0700 (PDT)
Message-ID: <bc0ae013-2314-4513-a759-cbf2b922aa6a@arm.com>
Date: Tue, 9 Sep 2025 09:59:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: refactor the rodata=xxx
To: Huang Shijie <shijie@os.amperecomputing.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: patches@amperecomputing.com, cl@linux.com,
 Shubhang@os.amperecomputing.com, corbet@lwn.net, paulmck@kernel.org,
 akpm@linux-foundation.org, rostedt@goodmis.org, Neeraj.Upadhyay@amd.com,
 bp@alien8.de, ardb@kernel.org, suzuki.poulose@arm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org
References: <20250909033236.4099-1-shijie@os.amperecomputing.com>
 <20250909033236.4099-2-shijie@os.amperecomputing.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250909033236.4099-2-shijie@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_212928_393990_B6BC7FF4 
X-CRM114-Status: GOOD (  24.70  )
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

On 09/09/25 9:02 AM, Huang Shijie wrote:
> As per admin guide documentation, "rodata=on" should be the default on
> platforms. Documentation/admin-guide/kernel-parameters.txt describes
> these options as
> 
>    rodata=         [KNL,EARLY]
>            on      Mark read-only kernel memory as read-only (default).
>            off     Leave read-only kernel memory writable for debugging.
>            full    Mark read-only kernel memory and aliases as read-only
>                    [arm64]
> 
> But on arm64 platform, RODATA_FULL_DEFAULT_ENABLED is enabled by default,
> so "rodata=full" is the default instead.
> 
> This patch implements the following changes:
>  - Make "rodata=on" behaviour same as the original "rodata=full".
>    This keeps align with the x86.
>  - Make "rodata=noalias" (new) behaviour same as the original "rodata=on"
>  - Drop the original "rodata=full"
> 
> After this patch, the "rodata=on" will be the default on arm64 platform
> as well.
> 
> Different rodata options may have different performance, so record more
> detail information here:
> 
>  rodata=on (default)
>     This applies read-only attributes to VM areas and to the linear
>     alias of the backing pages as well. This prevents code or read-
>     only data from being modified (inadvertently or intentionally),
>     via another mapping for the same memory page.
> 
>     But this might cause linear map region to be mapped down to base
>     pages, which may adversely affect performance in some cases.
> 
>  rodata=off
>     This provides more block mappings and contiguous hints for linear
>     map region which would minimize TLB footprint. This also leaves
>     read-only kernel memory writable for debugging.
> 
>  rodata=noalias
>     This provides more block mappings and contiguous hints for linear
>     map region which would minimize TLB footprint. This leaves the linear
>     alias of read-only mappings in the vmalloc space writeable, making

						typo     ^^^^^^^^
>     them susceptible to inadvertent modification by software.
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +++--
>  arch/arm64/include/asm/setup.h                  | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index db84a629f7b1..138e0db5af64 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6418,8 +6418,9 @@
>  	rodata=		[KNL,EARLY]
>  		on	Mark read-only kernel memory as read-only (default).
>  		off	Leave read-only kernel memory writable for debugging.
> -		full	Mark read-only kernel memory and aliases as read-only
> -		        [arm64]
> +		noalias	Mark read-only kernel memory as read-only but retain
> +			writable aliases in the direct map for regions outside
> +			of the kernel image. [arm64]

Should not the arm64 specific performance implications be mentioned
in the above documentation update as well ? But in case this appears
too much platform specific - probably do consider adding them above
or inside arch_parse_debug_rodata() as an in-code documentation. 

     rodata=on (default)
        This applies read-only attributes to VM areas and to the linear
        alias of the backing pages as well. This prevents code or read-
        only data from being modified (inadvertently or intentionally),
        via another mapping for the same memory page.

        But this might cause linear map region to be mapped down to base
        pages, which may adversely affect performance in some cases.

     rodata=off
        This provides more block mappings and contiguous hints for linear
        map region which would minimize TLB footprint. This also leaves
        read-only kernel memory writable for debugging.

     rodata=noalias
        This provides more block mappings and contiguous hints for linear
        map region which would minimize TLB footprint. This leaves the linear
        alias of read-only mappings in the vmalloc space writeable, making
        them susceptible to inadvertent modification by software.

>  
>  	rockchip.usb_uart
>  			[EARLY]
> diff --git a/arch/arm64/include/asm/setup.h b/arch/arm64/include/asm/setup.h
> index ba269a7a3201..3d96dde4d214 100644
> --- a/arch/arm64/include/asm/setup.h
> +++ b/arch/arm64/include/asm/setup.h
> @@ -21,7 +21,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  	if (!arg)
>  		return false;
>  
> -	if (!strcmp(arg, "full")) {
> +	if (!strcmp(arg, "on")) {
>  		rodata_enabled = rodata_full = true;
>  		return true;
>  	}
> @@ -31,7 +31,7 @@ static inline bool arch_parse_debug_rodata(char *arg)
>  		return true;
>  	}
>  
> -	if (!strcmp(arg, "on")) {
> +	if (!strcmp(arg, "noalias")) {
>  		rodata_enabled = true;
>  		rodata_full = false;
>  		return true;


