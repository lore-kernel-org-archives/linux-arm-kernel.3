Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174C606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fkEnJvCh;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h6k7JA0p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wPmH0exl60o0i/rkyexMG4I50dKwLyjpyUdCUkH8L4k=; b=fkEnJvChVhST+USgLyqOTNPk/g
	wM9SGCGpAmsAYQo5Z+0GY6yeAOUQLeokoVwbcryrRU7503uvk/JMzozQ3EXBwM3oZz3+oK76nthXZ
	7gQ3rSajkDA8+Q7DU1EhAGJ1fdBH6xzvk8bkW4b94LiQtSxS+gBm+qqBPdwSUk+4l8rMCrNb4A+ym
	Nf4pfaurK/1rCTtJmKVUa47HGkvJJSVaNkR2ZSbG9z19mMwEqNlQa7Ct8gBILMtfNPtRYlgugPrLY
	zHCrzm/OG59A3ORYC6Sk+eZG5156FgZNIU4DYTy2JJuXZtsX2xVHLfT+i4ZvLYK7WK8Uh5KiT03pb
	yiBN6J9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjqH-0000000BOVX-0TLu;
	Fri, 30 Oct 2026 10:28:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMjqF-0000000BOVK-2Hcu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 10:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B0D060626;
	Fri, 30 Oct 2026 10:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2C7C1F00A1E;
	Fri, 30 Oct 2026 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793356090;
	bh=wPmH0exl60o0i/rkyexMG4I50dKwLyjpyUdCUkH8L4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=h6k7JA0pKS6CDdHgjoc3P3z386lmR8880hX/v7FV9uv4B9veUSkWvVTM3/TSWxgF+
	 5hk3NN14Bn9VUvpbHgM22PW++wzmw6biqd5K+lPDB4ZGiXQFodN9a9KVBMc6aG7Jj8
	 M/g5Epxtvzd1cYH9r6ni+Qi/WW7JXfu4sR5huhvQAjrHQO9D6z7tOpIoPzbQd3QMQO
	 w5Zu6ueogKLQFadBsdAeb9QkeXqAGZ8fO8vaXqNug86NJLDtMdAeYPEhspSfHGafoo
	 UHmqN/IJOW9YMXHcP8V9Ck0Tzl4Yta/5C8FJqmTmJd9aikf86txlHskizJteLlb1tN
	 0LeB7F0xSbBrw==
Date: Fri, 30 Oct 2026 10:28:04 +0000
From: Will Deacon <will@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kas@kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] arm64: Kconfig: Don't select CPUMASK_OFFSTACK with 64K
 pages
Message-ID: <auRxNDAe_tv-mCvk@willie-the-truck>
References: <20261007-arm_stack-v1-1-b48dad5fa8b2@debian.org>
 <auCSG2OmNMQKp3dq@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auCSG2OmNMQKp3dq@gmail.com>
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 04:59:52AM -0700, Breno Leitao wrote:
> On Wed, Oct 07, 2026 at 12:58:16AM -0700, Breno Leitao wrote:
> > arm64 selects CPUMASK_OFFSTACK when NR_CPUS is above 256, which keeps
> > cpumask_var_t off the kernel stack. With 64K pages the kernel stack is
> > 64K as well, we have enough room to keep cpumask on the stack, avoiding
> > extra alocation and possible performance penalties.
> > 
> > Skip the select when ARM64_64K_PAGES is set. A 64K kernel can then raise
> > NR_CPUS above 256 and keep cpumask_var_t as an inline array. 4K and 16K
> > page kernels are unchanged.
> > 
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> > Based on Will presentation at LPC, I've decided to have a look at Meta's
> > stack usage, and I found that this might be an small optimization!?
> > ---
> >  arch/arm64/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 5f2db2cecf9772..b73371327d2a47 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -111,7 +111,7 @@ config ARM64
> >  	select CLONE_BACKWARDS
> >  	select COMMON_CLK
> >  	select CPU_PM if (SUSPEND || CPU_IDLE)
> > -	select CPUMASK_OFFSTACK if NR_CPUS > 256
> > +	select CPUMASK_OFFSTACK if NR_CPUS > 256 && !ARM64_64K_PAGES
> 
> Does this one sound sane?

It doesn't make an awful lot of sense to me, to be honest. The page size
and the number of CPUs are two independent variables, so tying them
together like this looks a little odd.

Will

