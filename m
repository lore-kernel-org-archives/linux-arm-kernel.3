Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB44C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvPW7wKGOhZ34dEtOElqCP0STW8GW9Yph3VIV+NYOy4=; b=WeZCEvrU1WQqlCUxZUJT3DR0aj
	1/YZB242XNLCOHUMB0nc1HxD+rTQYS9aDQDi4Gwe0dna1jpOa7OlQ91gb4oy9+Gwm1y6FX9iL9ixJ
	By/ICNV4XJX7PVj2vvWcIHSZHUDJIPKSIm4+CeIb6KADDho0QZ4byt2/wTP6fQxAalcBYz7XIq4Ou
	kluTLyrrhl5vawl6uQWV16nLHCpVX6U0jsBOiP87unmSv6eErjdQnU2ojAatF109u5LVry5/Tl5Gg
	F4GO0/gqNCKlE+uQMpsn9oW1BpS2J7Fw3Huu+bVdvRwaBHlQ8zyLgF96zpx+eN3/N2TQ4mFsbRjP6
	C+bYYW4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50ov-0000000Gh5G-0243;
	Fri, 11 Sep 2026 12:57:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50ot-0000000Gh4g-3Bzp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 12:57:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EBE144801;
	Fri, 11 Sep 2026 12:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55C4D1F000FF;
	Fri, 11 Sep 2026 12:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789131451;
	bh=KvPW7wKGOhZ34dEtOElqCP0STW8GW9Yph3VIV+NYOy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ABtrpNHQBjrHI8UNkItVZR13xICohMB9qqyHFacl9IWKzwCWekVxNVh66cHEYgczo
	 BtKsUAEFXVc9VuCD1LSZC+IyjyysF5WAvEqE4bUF7bhlQwY3PHp+KSoK9wJxZLL+XV
	 ws0ZabKyxvxgrtobDy9Akib81YVkhPSrAimCON33XJSgbURaNvUDJ99eZPkyXLHtPJ
	 xgP3twIB0iw11wfuZX1l83lNpTQ3baF+JMypaK70NnlX73D7cJixy9zghAaYndHYVn
	 iozTTbGVYxe2s1/qCO23ZDZIlwV2l2OX7EIZF4PKCM/M1zDAGIpNoinKMDsea59qUY
	 4O5FOyfX8o6fg==
Date: Fri, 11 Sep 2026 13:57:25 +0100
From: Will Deacon <will@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH 06/21] arm64: Store 'current' in TPIDRRO_EL0 instead of
 SP_EL0
Message-ID: <aqP6tdHf-3hnTLhf@willie-the-truck>
References: <20260907164247.17223-1-will@kernel.org>
 <20260907164247.17223-7-will@kernel.org>
 <20260908141950.37e9ed3d@pumpkin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908141950.37e9ed3d@pumpkin>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Sep 08, 2026 at 02:19:50PM +0100, David Laight wrote:
> On Mon,  7 Sep 2026 17:42:31 +0100
> Will Deacon <will@kernel.org> wrote:
> 
> > To make SP_EL0 available to point at the per-cpu kernel overflow stack,
> > we must relocate 'current' elsewhere. With TPIDRRO_EL0 now restored late
> > in the return-to-user path, we can otherwise use it to hold 'current'
> > and update the various accessors accordingly.
> > 
> > Move 'current' from SP_EL0 to TPIDRRO_EL0.
> 
> Is it worth having a #define for the name of the register that stores 'current'?
> (And probably the other similar registers.)
> That would avoid the bisection problems with the following two patches
> and might make other code a bit more readable.

We don't tend to reallocate 'current' all that often, so I don't think it's
worth the indirection tbh. The following patches are to a GDB script and
a bpf selftest, so I'm not going to lose sleep about bisection.

Will

