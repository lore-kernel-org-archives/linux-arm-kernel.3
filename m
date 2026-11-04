Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FF7606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vsonG+wW;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=huvCLGAS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1Iv1WntciehPvxwu4Si0O6dND9HQk4iqVMScK44DvpY=; b=vsonG+wW32qsQw
	kmkOGVd/PtXUS/s05FDVJ18QajhkUIJet1GIwy94i+hi2Vi3HjMEVWu/3R+SJB/RQgAhgI0039UkC
	0zdHrwKQcngtpVpwnOLhgHi3YlExJKO/KC8P4jmLVfeBzkzPUiDBcyUWW/F0u4yBm7gI4RhjrHm7X
	8WbNuR4mamrlLiWjoeblxAqyT93UqHmbID986/wFde2FNTT0zuvhAsgaWcQwc45jxmhJAPscTrkvs
	cq6tUrd7FzyhJ42z8iUOALiC+2xJ+/iFIqknAzM+rrM31q9c9iHAXuZoASl1qFtYqYObdqxQh5qRH
	Lcur8vZIAZdtQlsLQ0VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYIm-000000050af-3irR;
	Wed, 04 Nov 2026 10:33:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYIg-000000050ZQ-2fLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:33:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 199121650;
	Wed,  4 Nov 2026 02:32:58 -0800 (PST)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20CC13F628;
	Wed,  4 Nov 2026 02:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793788381; bh=ae7gcM+IMAdW9ErHPxtXtAVPHeIA7G36McPY8luPyTw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=huvCLGASz1/wFbLPEMvJ9QNdH71xRG33Lth5bIXHLQ1/R5Or00zHId/QeEsd+HAUD
	 I4L0EyPxdW9YApzR621up9xFUiQirHDjEfmbothS3Q0/nd/TD4esY8pL+0n4OnR0TY
	 UDijcjSDFMdxQTtzg+WQFMV9LMZOovbG3dgbAook=
Message-ID: <0534c6f4-3bb8-4249-816c-502cf8ccb287@arm.com>
Date: Wed, 4 Nov 2026 10:32:58 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: cacheinfo: Simplify init_cache_level()
To: Thorsten Blum <blum@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104083632.65715-2-blum@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20261104083632.65715-2-blum@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_023302_714664_C0C64FC0 
X-CRM114-Status: GOOD (  19.95  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Thorsten,

On 04/11/2026 08:36, Thorsten Blum wrote:
> acpi_get_cache_info() already sets fw_level to 0 on failure, so drop the
> redundant check and the manual assignment.

This doesn't seem to be the case when CONFIG_ACPI_PPTT is not defined. Can the dummy implementation
in include/linux/cacheinfo.h be called from init_cache_level()? For the implementation in
drivers/acpi/pptt.c levels is documented as "Number of levels if success." and so would be good to
mention what happens in the error case if it needs to be relied on.

Thanks,

Ben

> 
> Use unsigned int for fw_level to match the expected type, and remove the
> now-unused local ret variable.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/cacheinfo.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
> index 309942b06c5b..881131fb4934 100644
> --- a/arch/arm64/kernel/cacheinfo.c
> +++ b/arch/arm64/kernel/cacheinfo.c
> @@ -67,19 +67,15 @@ int early_cache_level(unsigned int cpu)
>  
>  int init_cache_level(unsigned int cpu)
>  {
> -	unsigned int level, leaves;
> -	int fw_level, ret;
> +	unsigned int level, leaves, fw_level;
>  	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
>  
>  	detect_cache_level(&level, &leaves);
>  
> -	if (acpi_disabled) {
> +	if (acpi_disabled)
>  		fw_level = of_find_last_cache_level(cpu);
> -	} else {
> -		ret = acpi_get_cache_info(cpu, &fw_level, NULL);
> -		if (ret < 0)
> -			fw_level = 0;
> -	}
> +	else
> +		acpi_get_cache_info(cpu, &fw_level, NULL);
>  
>  	if (level < fw_level) {
>  		/*
> 


