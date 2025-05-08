Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBEDC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrMh/2wiSkYQT91ZxSHOrsixg9buFnJV0y6uLi5jFyk=; b=K3ps5AJ2qUkbrNhR/kaYBCn0cS
	cZmJgFHbLYzhxUNNdE6bKSunSTw7yxioWzOKD8NlT0aQqLQLnhDVTI0m/w0W6uxzJiMAs1amQObDW
	dSMtieb/clJQplDoAQc7G6HJq+wHrVI4SE2QBUxKguPnxDzBVKD/Nt80sMeo7BKE3qEB2eV74cwOh
	1K4o9PmuUAmSK2DRZOlVOyjnG6AZAACbrs/61pNBXds7XTIFf40cjdU6V9eP2cF/WfKQl42wStUKy
	ZECqwUW/8huZjnR/PrHFQsmd959nqiHVBniRvOa0eATZDnPUiou4q2SHqUHHLK9cgJ3dSq+3dTMYN
	omGSq2Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4vt-00000001NH5-3VJE;
	Thu, 08 May 2025 17:21:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD48B-00000001I3N-2BEd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 16:29:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AFDD8629DF;
	Thu,  8 May 2025 16:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575D7C4CEEB;
	Thu,  8 May 2025 16:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746721793;
	bh=td0/W1n9aOEtk0epnkPwUaZiByTowJBXnpm1ysKQLbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H8yVftdYn0Keq8UVjV3B31mLlJzlC/VdjbYSrnPZgX9bB5sLHwM3uJAM+wusIR2R7
	 N8FHP7zm0LXVWL2BTs+spGkZRHcuAi9E9me72T90cxkcvlD/6UhrvwivbYiVVNEnj6
	 cbaJRk89RE+6FBBXvhlMNQxep0axJwkaa3vowHzGLQBe7wiYIf5D3/ABf8MC2CGeqK
	 FTOR3/Ij3Kb13VxjqNs/0sWcy8zacL5fyfcUkmGMs1Z071OpPUTv7kblhdnLmW+/k4
	 KumLLr3FRRu8uIiXlxGzhgCjt1vw2dmSeccMukJ3XRp1pNQjBP/wM5Mvfz02oaaWCP
	 1WAXwqdFmj5hQ==
Date: Thu, 8 May 2025 09:29:50 -0700
From: Kees Cook <kees@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, kvmarm@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	oliver.upton@linux.dev, broonie@kernel.org, catalin.marinas@arm.com,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	elver@google.com, andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH v2 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202505080929.95B2310@keescook>
References: <20250430162713.1997569-1-smostafa@google.com>
 <202504301131.3C1CBCA8@keescook>
 <868qn8hfnp.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qn8hfnp.wl-maz@kernel.org>
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

On Wed, May 07, 2025 at 11:35:38AM +0100, Marc Zyngier wrote:
> On Wed, 30 Apr 2025 19:32:23 +0100,
> Kees Cook <kees@kernel.org> wrote:
> > 
> > On Wed, Apr 30, 2025 at 04:27:07PM +0000, Mostafa Saleh wrote:
> > > Many of the sanitizers the kernel supports are disabled when running
> > > in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> > > (and makes more sense) to integrate than others.
> > > Last year, kCFI support was added in [1]
> > > 
> > > This patchset adds support for UBSAN in EL2.
> > 
> > This touches both UBSAN and arm64 -- I'm happy to land this via the
> > hardening tree, but I expect the arm64 folks would rather take it via
> > their tree. What would people like to have happen?
> 
> FWIW, I have now taken this in kvmarm/next. A stable branch is
> available at [1] for anyone to pull and resolve potential conflicts.

Thanks!


-- 
Kees Cook

