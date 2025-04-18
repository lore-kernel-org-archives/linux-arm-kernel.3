Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDE0C369CF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 04:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIFSwc7XDuTG9PRBFfqSSrQ+KkySnv+n/+/xZV7nfBY=; b=18H0JQXeJqP/uYj9eDNd7iUL38
	XIbjvUhGp1TaRyFGBxptX8/CkRSM3YIdxCVaNqt6/OjrWYOjI0/Ts1DmhNXYx8+2jK2r5lL4fXcnb
	AZ2MIqwNhl9MbqcVbSyHKc4FGOBfUlzEFQd2g9Eq49EK0yvF5pj9EXiHywXxrgLj8S1wl76fdZ+ga
	Xi8YpKgmAANl0hVJKN6+m2t+1U+H8Ksm8prJpujRf+rtiHHMr5q7m09ojEq96ZjePjWjvjldPLHs6
	zStHo8M9AoNYiR7o3iB8vzMDp8zxlwDMDHvuaXtQPsG1BB2AXtKk7kCVJ4coEcfzHFNn6ndgUxBp5
	wpjQBD6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5d5n-0000000F4CN-2YRW;
	Fri, 18 Apr 2025 04:12:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5d2m-0000000F3yn-0ORy;
	Fri, 18 Apr 2025 04:09:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 422A95C59A2;
	Fri, 18 Apr 2025 04:07:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4682C4CEE2;
	Fri, 18 Apr 2025 04:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744949375;
	bh=X9HWpDJKGelzlCUQTDiF/+gV2vBAm2QsT8zUpHUuxwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qvEGyPSlADMpXrpDb39mtYQWbsr4vDvXWgXhOxwVcm+1/ZyO98L2tTR17xtXq7F5/
	 3Qnp7bu0pCI8eUyKzpE8NMQIi8gQ7qzp2jVxGCRMaZi9PCDQfEcJUTXYSl6qD5k3Iw
	 EW8ujRSii79rvabBW6nRoZ47tshuQ22cty32TIYzGvaDdlUR0EKwklKONC+9qeq+Mr
	 xCahi/xTQTtPwJOoE1tuLuQ5EqHwUPXxKn09ORAOZJk0Tt9BgDXFTBTWPPu9KfOry+
	 P8NwdCgERlt1WKwblR+V1KrFCxMo1RXDgXojcv40y0KcrjrcWMgsjFNPaCTnlktyKU
	 TMqgU5iBTFq8w==
Date: Thu, 17 Apr 2025 21:09:31 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418040931.GD38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_210936_186602_6EE8B572 
X-CRM114-Status: GOOD (  14.70  )
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

On Fri, Apr 18, 2025 at 11:38:46AM +0800, Herbert Xu wrote:
> On Thu, Apr 17, 2025 at 08:32:36PM -0700, Eric Biggers wrote:
> >
> > I don't think that would be better.  The 'if' would be up to 400 lines long, and
> > it would be easy for people to miss the context when editing the file.
> 
> We should separate the symbols for Crypto API options and the library
> options.  If you're worried about people missing the if statement,
> how about splitting the file into two? One for Crypto API symbols
> and one for the library symbols.
> 
> In fact we could move the library files into a different directory,
> e.g., arch/x86/crypto/lib or arch/x86/lib/crypto.

arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
was just hoping to avoid a 4-deep directory.  But we can do it.

- Eric

