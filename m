Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86F0606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JIe+8pRe;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Tuu0f2NG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oxYYXzuA+KjDDtWBG7XEQK2PA3jUu3Ip09CfAk+HxQw=; b=JIe+8pRefHWphB0Dlu+Eip/TQ9
	UP9HiqdZH/ZYLH6MvKdEqS8aO9wFGF8l13ApI4V05HMzpUwr+OZn/WLfJ87kdw5HKNKRGDxngCdht
	1rbIC90aXqN3cAaXZ06MjHEYQSiRk3/tK43gK6DGu9lSP7qOuNq9v8ptXZt8FzMqxCpBmo9hsGprS
	jlkuctw71+dDkLv9w6au5sEom0emYP0DZuk4IaB9vSqZTw/6kGhvLBMm22u85KFZ0daBMGm0VhNGX
	6h9f5Bfra2HtbwrTHV8N1SAXWIg4+GAnMNhK6JVV/HBu7EuEoIzjIcsIX5jiFKQH7jyCP+a1T2QyF
	xZqYJj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiKU-000000053BC-3HPE;
	Tue, 27 Oct 2026 14:39:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLiKR-000000053AJ-2ACo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 14:39:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E33B515A1;
	Tue, 27 Oct 2026 07:39:01 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B347E3F7B4;
	Tue, 27 Oct 2026 07:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793111945; bh=n8NvRega0eGpWWLCqhMnQOQTEFhQaD4mJqw4M2cZC0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tuu0f2NGiSDtPpXzfxeF+d4TpQ+fcWm20gBIEXsO0TrAwfwSpBAajHfZIBBXglDR9
	 sCtiuyFp1Yw2vQ0AHV85TbuVm/Lcg5uEOpJs3qWEwOQjdq4hNf9gJ4qCyyivsfuhmO
	 SZCZG941AeMqFBwQdBA+pZDN7BbJlYuVgXupkXt8=
Date: Tue, 27 Oct 2026 14:39:00 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: idreg-override: Use property length in
 get_bootargs_cmdline()
Message-ID: <auC3hPZEu7zUPXoe@arm.com>
References: <20261015192810.395975-2-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015192810.395975-2-blum@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_073907_614853_9206F9B2 
X-CRM114-Status: GOOD (  18.83  )
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
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 15, 2026 at 09:28:08PM +0200, Thorsten Blum wrote:
> fdt_getprop() already provides the length of the bootargs property. Use
> it to reject a zero-length property before dereferencing it, and test
> the first byte directly instead of calling strlen().
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/arm64/kernel/pi/idreg-override.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
> index acaf56234973..588c8af2a567 100644
> --- a/arch/arm64/kernel/pi/idreg-override.c
> +++ b/arch/arm64/kernel/pi/idreg-override.c
> @@ -383,15 +383,17 @@ static __init const u8 *get_bootargs_cmdline(const void *fdt, int node)
>  {
>  	static char const bootargs[] __initconst = "bootargs";
>  	const u8 *prop;
> +	int len;
>  
>  	if (node < 0)
>  		return NULL;
>  
> -	prop = fdt_getprop(fdt, node, bootargs, NULL);
> -	if (!prop)
> +	prop = fdt_getprop(fdt, node, bootargs, &len);
> +	/* No bootargs for a missing, zero-length, or empty-string property. */
> +	if (!prop || !len || !*prop)
>  		return NULL;
>  
> -	return strlen(prop) ? prop : NULL;
> +	return prop;

I think the patch makes sense. In theory we may have a value-less
bootargs property and prop points to the next token (or some
FDT_END_NODE) but they would all have 0 as the first byte, so the
strlen() check would catch it. Anyway, the above is clearer, so:

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

