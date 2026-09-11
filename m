Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D221CC79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 07:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5WO1YBrP7HjAXnzBHltF9eV+QVQh8CB0Voi7rKsI0QY=; b=rdAJsLfv5Uqe2e6fwrqlhWIwbX
	NaY55+2PrkpTAf+vL8yXqJ7VL7VR5n4wEJB4vkuH6u4Qd+b6i2xT9JWWOGTI3bz9Xsgght1seo+41
	fzsHNNvP9b7IELfgVdW4Ay03uHQpqpl+sctgD1oe9iRxW1xGk7Up4cIX6jaAGvBdH7C05lQur2TLX
	0sJbpcvZZYicMKCVO9D2qu3Eet8arB9NMnm3PuS4CloWNUl4S/WI4EvDNm5Cu87cmU2zLCEWm77Cx
	qdjgNsRMHlylI9wnq6Xx59FuJV+ItejwLZRUGSOthCLdEZZBhPWvtAKxrEqfmNlRpAqYh8PxJ7x9q
	8DsfxP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4viH-0000000G1rH-2p82;
	Fri, 11 Sep 2026 07:30:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4viF-0000000G1r8-3joG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 07:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF7C42AA5;
	Fri, 11 Sep 2026 07:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E5C1F00898;
	Fri, 11 Sep 2026 07:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789111819;
	bh=5WO1YBrP7HjAXnzBHltF9eV+QVQh8CB0Voi7rKsI0QY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jQ6fO7MuZ3wOYvlXFdFiHiy5yaxhfBr+oTEGfVW2Jt0f8kL377Y1bO6eMzMhw9wOn
	 nvlqHuSaTSQHsN+UB3/R8vR5RXu/pjRtPw/xMx5OkHexquzRUEtswFyRGu/QuQDZLK
	 XnGMtmMmQ5PPEmUX0ekiV+3W3KoLinAvUQTgFznPnsfc/c98Rb2ipgZrlHM6XlIsDL
	 gQ3IeSMSI7kDFWJGOLpV+nrBFgesj2SPpzFRxz7NAsF4oXqdWpKVoejQhKivkio2X/
	 NMgXQGbpTsB2uRlJ64Cu9X/XUQpP0ayPwUxuGuI3EqQIcJzJQmrKT9cBXJjwDA+pkK
	 r/W27IcX7AWng==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 4BFE1198003A;
	Fri, 11 Sep 2026 03:30:17 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Fri, 11 Sep 2026 03:30:17 -0400
X-ME-Sender: <xms:B66javsr-YBIVAltbemhtrfdBQYr8mURp7D9dlQzpiEjTg8ZFGxcDQ>
    <xme:B66jarQPjtiPEyFzycJvYANNHj3PBXifr6U-BDef7vFao9BqXRWBZ8k8iQ5GZhtxU
    mYswoWUpXhnjSVwCRIBplJf9Z4NrWSdrsnKmc8yY4XYu7tyT564eYia>
X-ME-Proxy-Cause: dmFkZTFhO74tkXIgShyrPOQB4nZIB5C2Uyc/LIMWVkFgmGyN9/UZ9blZaV2CoNlFvFx1ge
    j3QjHxBKxmSbh9X/itnpyD7Dz1nC6rvoepwszc2jLLtvW1SLJ279eZNc3Ygp4huacA8s+P
    7dlbLKpXOjj9jXiauMNdJbBd7endblzLSYDBpbbt4Wts9wqCUyWzhiN3kfzFvTDFhYtV+x
    Q/jkuPtKd92hdif0eVovvI3G47DqwuFHAxzZUfFjKR5V1QfIGipC/rXARBSg9tu6Posw8V
    ZSebovirngK0qtregN6mlrrxvz4L4Ru99DKVVkN0qW7vatAhVY/gRRTD6wAaCl4CnenZsy
    3AGOKBQioYqabA57JSpU4rpT/4LPlTQIJ+MOHDCaoyOnBGQP0CY4bdhi3TLlWBzB5JyvaZ
    vCPt6lFrOM8CWztIirmkArAxlDrTcKqw8HMNOPJyrTJsxoHtNluBEjA35ogDTE26Ze52E/
    rA4Hm/rQKbAOmowPhQSrH2SwpwoCmz8InWIY1v5hvwJDkLlznletD7fbDCBKEgAznMAe7t
    wDMDoyieUv6Gv6rjAWkjV+DwW4Cc/LsYpq3BslnT98dungk8DollkyreZ6CnAPoLpoIv/Y
    4bktYcBUUOXdLTWDzoikyGWjaJ41mXwpDMBAFr4NpwJEdG3BSxArDQ0or7kA
X-ME-Proxy: <xmx:Ca6japXcmda8WL1kC0R65kItvx_QpCLJSlQ9-WTy9sBC6YBQIminGw>
    <xmx:Ca6jajopWn055Oplvk3OS5DCj3XJy7-pdIw43NWVJBv_YgiSYG3ZNA>
    <xmx:Ca6jalQFwCGnmvMTemsycqFImMD4_fILwtgVsxa4vT9G7Z3TnomtQw>
    <xmx:Ca6jat23ZDOEj4WcJIn-r2KJn6m-Q2Im0Zzo_RrPTeNeQ5-MG7D_yQ>
    <xmx:Ca6jahCVWxgqHudWCIPCBLke7MfsU-cKVqH0lWv3dSDmaG6_EuprD2fp>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5C6BDF8007E; Fri, 11 Sep 2026 03:30:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Fri, 11 Sep 2026 09:29:54 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Breno Leitao" <leitao@debian.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel-team@meta.com
Message-Id: <6e2b619c-4ef8-445a-a97a-19ff6e9c5aca@app.fastmail.com>
In-Reply-To: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
References: <20260910-arm64-hibernate-va52-v1-1-a584d9a7d65e@debian.org>
Subject: Re: [PATCH] arm64: hibernate: clone only the linear map that exists at runtime
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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



On Thu, 10 Sep 2026, at 15:53, Breno Leitao wrote:
> This is similar to commit 1537e55728ec2 ("arm64: trans_pgd: clone only
> the linear map that exists at runtime"), but in a different place.
>
> swsusp_arch_resume() clones the kernel linear map with
> trans_pgd_create_copy(..., PAGE_OFFSET, PAGE_END). PAGE_OFFSET comes
> from the compile-time VA_BITS, so a CONFIG_ARM64_VA_BITS_52 kernel
> booting on hardware without LPA2 -- vabits_actual is 48 and the fifth
> level is folded -- hands the walk a 3.9PB window while its linear map
> only spans the top 128TB.
>
> On a VA_BITS_52 4k kernel with CONFIG_KASAN_GENERIC in a 4GB VM, I see:
>
>   swapper/0: page allocation failure: order:0, mode:0x920(GFP_ATOMIC|__GFP_ZERO)
>    hibernate_page_alloc+0x10/0x1c
>    swsusp_arch_resume+0x70/0x320
>    hibernation_restore+0xa4/0x138
>    software_resume+0x15c/0x270
>   PM: hibernation: Failed to load image, recovering.
>   PM: hibernation: resume failed (-12)
>
> Fix it by copying the linear map that is the actual one, not the
> compiled one.
>
> Fixes: a6bbf5d4d9d1 ("arm64: mm: Add definitions to support 5 levels of paging")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/arm64/kernel/hibernate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
> index 7bf1174277772e..424291c547f02a 100644
> --- a/arch/arm64/kernel/hibernate.c
> +++ b/arch/arm64/kernel/hibernate.c
> @@ -423,8 +423,8 @@ int __nocfi swsusp_arch_resume(void)
>  	 * Create a second copy of just the linear map, and use this when
>  	 * restoring.
>  	 */
> -	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir, PAGE_OFFSET,
> -				   PAGE_END);
> +	rc = trans_pgd_create_copy(&trans_info, &tmp_pg_dir,
> +				   _PAGE_OFFSET(vabits_actual), PAGE_END);
>  	if (rc)
>  		return rc;
> 
>
> ---
> base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
> change-id: 20260910-arm64-hibernate-va52-f738ede2144f
>
> Best regards,
> --  
> Breno Leitao <leitao@debian.org>

