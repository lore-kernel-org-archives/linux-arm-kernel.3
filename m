Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB180CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 18:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=liULdT5hPG3Hs3MVsuBYqbmNhVl/Zh1MhxhFa73l698=; b=OwBh23Qt1jNXEKVBHNJmY3Rf5c
	wZjSzdXpKXAI27OVXadJKMyKFcvUlCk8km9uBo1BCpYVlaHWwsLnOyrMstC8JTfxWT9X+qshW9dLI
	J4McDugjZRofUFN2uQtF+071i6Hw+98nJXkoR5g3xOHEj41w2qTB2pAWsAcLQAeriudZW6F7mUnXc
	sMyD025B49ZQZiACBG9D9RPF9v/78GmD6hoTwzJ2FJ6wnAcHLSU9WZkSCNVuQ5XEMsiFE2JB6L5Ph
	U+wOlmrLz9mspT1LsaQec1rfycMy9l3IMQD0HbiBUY6QCRLzqVtEOlS4TwUVUH0JYm7800P/RGRto
	Anoc8mdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSJQC-00000004eU4-3IfY;
	Wed, 27 May 2026 18:56:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSJQA-00000004eTn-3k9L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 18:56:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D950F6057B;
	Wed, 27 May 2026 18:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C151A1F000E9;
	Wed, 27 May 2026 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779908161;
	bh=liULdT5hPG3Hs3MVsuBYqbmNhVl/Zh1MhxhFa73l698=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dP6ly0G9qXtPakMjOJ5zrOUCUfpqM9+qBvvNugELgTNwDZhk9vDhIXM3lkgvo64H1
	 vPO5lINGavUCUdfxIqR2GD7X5PvkjsCV/EyeHVCW6mTXOmkyNZe9ln9cQRWx5Bqzhl
	 J5hopodkj4fUjifJUtiLdkceAghSStOLmdZVl0/jmdsaUXJ6MV+uLg92bzmN8+XVQT
	 dSj4f6Nw/y+FjXQJ7ir+dcMde2lKGmROBUf81E0X5hCDj9lxZvy8OCv65o2XmNcsCq
	 aS7KRB4rNvFcISCxQAyzpWi0j6jwYlh+N3UvYf2Sq6K7+ZVHLHPtmY3NK9XEtXAk1P
	 En+j8KLCuIelg==
Date: Thu, 28 May 2026 00:25:56 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, catalin.marinas@arm.com,
	jens.wiklander@linaro.org, sebastianene@google.com,
	vdonnefort@google.com, sudeep.holla@kernel.org
Subject: Re: [PATCH v6 1/6] optee: ffa: Add NULL check in
 optee_ffa_lend_protmem
Message-ID: <ahc-PMwAbFfo-4Q8@sumit-xelite>
References: <20260527150236.1978655-1-smostafa@google.com>
 <20260527150236.1978655-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527150236.1978655-2-smostafa@google.com>
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

On Wed, May 27, 2026 at 03:02:31PM +0000, Mostafa Saleh wrote:
> Sashiko (locally) reports a possible null dereference under memory
> pressure due to the lack of validation of the allocated pointer.
> 
> Fix that by adding the missing check.
> 
> Fixes: 2b78d79cdf96 ("optee: FF-A: dynamic protected memory allocation")
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/tee/optee/ffa_abi.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

> 
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index b4372fa268d0..633715b98625 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -698,6 +698,9 @@ static int optee_ffa_lend_protmem(struct optee *optee, struct tee_shm *protmem,
>  	int rc;
>  
>  	mem_attr = kzalloc_objs(*mem_attr, ma_count);
> +	if (!mem_attr)
> +		return -ENOMEM;
> +
>  	for (n = 0; n < ma_count; n++) {
>  		mem_attr[n].receiver = mem_attrs[n] & U16_MAX;
>  		mem_attr[n].attrs = mem_attrs[n] >> 16;
> -- 
> 2.54.0.746.g67dd491aae-goog
> 

