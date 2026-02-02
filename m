Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C706E7DEEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oAjikNL9aKxXVoFr1gwDuLMFriclVmBsIFi24gSjNE=; b=Y5MPxu+3cUV7ILl4h+RSz7OqUV
	fCbg/+d6A6SEKItQbDFFpQjay5rs9ii41LVsyuw1XiriWuSgmxkxvpgGHywczUmeVUDi2FhLiZrYV
	N9GuyMvuA+s3E7Tcsa+VQocpPiNfoHz+GSUsQP4gRx8PvvB5aKWtYJwmpxXfde8myktXFCXFxAx7U
	4qzJFZCHSADGL5aktJfByjCzG4V7AbuFr+wmglFRXqWSRbi6JWUzFmbilNqTW1ea1ouS+Mw9QxVn4
	jPJAh1X0S88DS6CQMKEeJDGrSG3Zj61TTHLPw6Fu7bfV/XXkZJ+fCpMDdJOJ0Q3LEqt5KmU7sx2+3
	3RZk+4Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvAZ-000000057Xz-1VAE;
	Mon, 02 Feb 2026 14:44:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvAX-000000057Xo-1Gfm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 14:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6845360008;
	Mon,  2 Feb 2026 14:44:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2823C116C6;
	Mon,  2 Feb 2026 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770043488;
	bh=ZFnamcvL9YDfDLilFFtNjPwFqDU7uoFgqRsFVNPfaV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DPQKp679K+AkqubSFOl4P5rG/HStTEKeGw+W490uoyrNzySMgpBhtHuWPULxH1FqR
	 dBbbb/WSSvsYuGXcPE1ciIkkmcIrbFGGw2hUFu9QBF3lJ4gl3br1tyezlBx6WVToeH
	 qCN/FIcDTAO67+9ROtDq7aNwk/lW1HHM4Gquw/CFGVRNEqB7TrocRjc+CtgiaPYjOu
	 gmo4BGM2JlP6nLAusjJGygupOfsEvr24Ugxt5ngeBh8xfS998mpsnbrfUsGqjcWPbq
	 uzVmiMOmO+gQYcebS67y5aN+sa8gY3YKeK5GdKnm4Xj1DJMgkZcvVum46HUknnnKQ5
	 0Y90ZA74bvxfQ==
Date: Mon, 2 Feb 2026 14:44:43 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/gcs: Fix error handling in
 arch_set_shadow_stack_status()
Message-ID: <aYC4WygNsqtGePnq@willie-the-truck>
References: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130-arm64_cgs-v1-1-c9b6942b6b70@debian.org>
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

On Fri, Jan 30, 2026 at 01:43:09AM -0800, Breno Leitao wrote:
> alloc_gcs() returns an error-encoded pointer on failure, which comes
> from do_mmap(), not NULL.
> 
> The current NULL check fails to detect errors, which could lead to using
> an invalid GCS address.
> 
> Use IS_ERR_VALUE() to properly detect errors, consistent with the
> check in gcs_alloc_thread_stack().
> 
> Fixes: b57180c75c7eb ("arm64/gcs: Implement shadow stack prctl() interface")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> PS: This was compiled-tested only, given I unfortunately don't have
> a hardware to test on _yet_.
> ---
>  arch/arm64/mm/gcs.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
> index 6e93f78de79b1..efce7642b1d7b 100644
> --- a/arch/arm64/mm/gcs.c
> +++ b/arch/arm64/mm/gcs.c
> @@ -199,8 +199,8 @@ int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
>  
>  		size = gcs_size(0);
>  		gcs = alloc_gcs(0, size);
> -		if (!gcs)
> -			return -ENOMEM;
> +		if (IS_ERR_VALUE(gcs))
> +			return PTR_ERR((void *)gcs);

Why do you need to go via PTR_ERR() here? 'gcs' is an 'unsigned long' so
can't we just return that directly?

Will

