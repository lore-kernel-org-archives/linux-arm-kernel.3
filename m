Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B3FCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 22:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PXnh59nBcFWNlYT0v6PXDwQhFAtGG7ySSricjDezmZI=; b=b2umjdDG4A/FJMv+ANrKYX4PnT
	ba0B3CCuOQ054x9DLxcvxUMOrfoSmtmAu3Jr9fuNLlYIq9NrfxnzdeFpH3i6/m0JGRnsSLfm+18OZ
	JQHefAG7nLgOz6gZgUQRSwlQ547hVsq84EyHJ71U+D/2uxKnLCitlHTE0VtJcMmpGicieDxNkqo9b
	TtGeDD82vAHZtwf7JbZfr2M5n+l79Xd89F9DTsUtvVGmZ6PQHz+N90+ezf+UIogYqU8nzUBulKGjD
	C6qQQyNdB5jO1L2FqlNLSnVMmzPXN8tNLixkCSdyz8E52QzH7O4w73KQ9VckuZTkNqMkk9GOW8fCs
	DBi5/lew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrkg-0000000GitR-1xGu;
	Tue, 28 Oct 2025 22:01:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDrke-0000000GitK-3oog
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 22:01:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 107EC603FE;
	Tue, 28 Oct 2025 22:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A86C4CEE7;
	Tue, 28 Oct 2025 22:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761688871;
	bh=axkFG9sBBk92SZMcb2CWNRulpTDXD1Y8N5Mk/ScHrDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QM0AKc5DCU3iBAaMAaoULokkQsILBOAEqZhala/2ILEwKDeRFwKfN9E2ZmXf+ClUt
	 qWcVJfO6x6GOsDKqVD23u1SIhKoHzgputa6M4WzjV7S2YnOy3w7Hqpm8agAnf2zrxE
	 PkcxM0zFoHY1EC4SD2JFlQdf+g8TlGXAdoWkv/H4AOiVt6MTmz+BGoOS4NSifJpcQW
	 a2wcNWebFB+7QJJe/sZ5znEkG17uL8Rk3q7kCUs6WJ4VSaX27iCQbqKox/IToLeP+w
	 T0gTgUj/FYKWhneLLpKO8ZHwhBA0ZBTBd/UxpvT2SnX727l2ky+QE0R0NecZyiUGez
	 PEXDI4rQ41Heg==
Date: Tue, 28 Oct 2025 15:01:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Kees Cook <kees@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Russell King <linux@armlinux.org.uk>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH 3/3] libeth: xdp: Disable generic kCFI pass for
 libeth_xdp_tx_xmit_bulk()
Message-ID: <20251028220105.GC1548965@ax162>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-3-ec57221153ae@kernel.org>
 <dfc94b21-0baa-4b1f-9261-725d8d5c66f0@intel.com>
 <20251027205409.GB3183341@ax162>
 <5eb7ba26-8ecb-4a39-b9ed-961fffe4aa97@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5eb7ba26-8ecb-4a39-b9ed-961fffe4aa97@intel.com>
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

On Tue, Oct 28, 2025 at 05:29:30PM +0100, Alexander Lobakin wrote:
> From: Nathan Chancellor <nathan@kernel.org>
> Date: Mon, 27 Oct 2025 13:54:09 -0700
> 
> > On Mon, Oct 27, 2025 at 03:59:51PM +0100, Alexander Lobakin wrote:
> >> Hmmm,
> >>
> >> For this patch:
> >>
> >> Acked-by: Alexander Lobakin <aleksander.lobakin@intel.com>
> > 
> > Thanks a lot for taking a look, even if it seems like we might not
> > actually go the route of working around this.
> > 
> >> However,
> >>
> >> The XSk metadata infra in the kernel relies on that when we call
> >> xsk_tx_metadata_request(), we pass a static const struct with our
> >> callbacks and then the compiler makes all these calls direct.
> >> This is not limited to libeth (although I realize that it triggered
> >> this build failure due to the way how I pass these callbacks), every
> >> driver which implements XSk Tx metadata and calls
> >> xsk_tx_metadata_request() relies on that these calls will be direct,
> >> otherwise there'll be such performance penalty that is unacceptable
> >> for XSk speeds.
> > 
> > Hmmmm, I am not really sure how you could guarantee that these calls are
> > turned direct from indirect aside from placing compile time assertions
> > around like this... when you say "there'll be such performance penalty
> 
> You mean in case of CFI or in general? Because currently on both GCC and
> Clang with both OPTIMIZE_FOR_{SIZE,SPEED} they get inlined in every driver.

I mean in general but obviously that sort of optimization is high value
for the compiler to perform so I would only expect it not to occur in
extreme cases like sanitizers being enabled; I would expect no issues
when using a backend CFI implementation

> > that is unacceptable for XSk speeds", does that mean that everything
> > will function correctly but slower than expected or does the lack of
> > proper speed result in functionality degredation?
> 
> Nothing would break, just work way slower than expected.
> xsk_tx_metadata_request() is called for each Tx packet (when Tx metadata
> is enabled). Average XSK Tx perf is ~35-40 Mpps (millions of packets per
> second), often [much] higher. Having an indirect call there would divide
> it by n.

Ah okay.

> >> Maybe xsk_tx_metadata_request() should be __nocfi as well? Or all
> >> the callers of it?
> > 
> > I would only expect __nocfi_generic to be useful for avoiding a problem
> > such as this. __nocfi would be too big of a hammer because it would
> 
> Yep, sorry, I actually meant __nocfi_generic...

I figured, just wanted to make sure! This series needs to go to mainline
sooner rather than later, so maybe xsk_tx_metadata_request() could pick
up __nocfi_generic as a future change to net-next since there is no
obvious breakage? 32-bit ARM is the only architecture affected by this
change since all other architectures that support kCFI have a backend
specific lowering and I am guessing very few people would actually
notice this problem in practice.

Thanks again for chiming in and taking a look!

Cheers,
Nathan

