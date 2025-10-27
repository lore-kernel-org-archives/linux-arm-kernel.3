Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9045ACCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LOIk4XAej1gR4QcJU4+DlomoMUz/xZxsuIi12Hlnlo=; b=hbQL6oDzxQ19PGNfb7z0PYjzJS
	gNsz+0dp1qfGuyOtfRPvvl3lyPQVwnGYv32LRbZfVlZqw73P8CUCcmMr0ghbd9yB1LJJaBoPY6TX6
	UwSlIF5VrYT42oGeP3hKDMGANXOajfIeNnXjQ6MYG+Xxs7gKbF4C5toteFlORa3G2ePh4EmEIVNl1
	aWbhWbY5RCz8lFyuejQPC5gkUISCgL20P+wFY5igPRxaIQKs7pJMwFJxGOsSH/E2Kj4Aqo2N7AOgj
	HT6GmfrXNYZHiSN8d390pU8wsHXY9Jj0BdxE3eyMvhYhFnRmJNggfvrneLHBZ0OxE90mUjQX8nLDv
	XS4/gJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUEM-0000000EkxN-2SfV;
	Mon, 27 Oct 2025 20:54:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDUEL-0000000EkxD-2BGF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:54:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7892A6149B;
	Mon, 27 Oct 2025 20:54:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7267AC4CEF1;
	Mon, 27 Oct 2025 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761598456;
	bh=uUiV7M0JZyX2CSv7f9ahj+RSKvrXNw1GjFMW/sbepkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bv7swv2Vy5HIoJj0IeNA/HUdm/7Tvm2TPzj5ffzqBQn3VCjiHehnp7EgYx1tQdL8X
	 Olr8Fit+1wuR5JT133eEO/hhTStqcqSeHC7xw2a3lTxD3sOPImFYH1HKDOXDAMADnX
	 04PqLJ88APKr4lZvK751n8qXcjcrMn7qiIyLND547vY+Uo93h11HmKeLYLQ6EX1ToO
	 7rm9tcb2dXSaOzzQ7rp51psaIbb/s6Fu2plViBCz1TLY5UPApAy/Hckld7+r+Mtgz/
	 2kzXgT7y0UTuneT84Wpk5n67Bees6h1/OkHwzR+WOECr978M5Y3PmdUK2NN6Vm3lHA
	 juAb69oS+a4Fw==
Date: Mon, 27 Oct 2025 13:54:09 -0700
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
Message-ID: <20251027205409.GB3183341@ax162>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-3-ec57221153ae@kernel.org>
 <dfc94b21-0baa-4b1f-9261-725d8d5c66f0@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfc94b21-0baa-4b1f-9261-725d8d5c66f0@intel.com>
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

On Mon, Oct 27, 2025 at 03:59:51PM +0100, Alexander Lobakin wrote:
> Hmmm,
> 
> For this patch:
> 
> Acked-by: Alexander Lobakin <aleksander.lobakin@intel.com>

Thanks a lot for taking a look, even if it seems like we might not
actually go the route of working around this.

> However,
> 
> The XSk metadata infra in the kernel relies on that when we call
> xsk_tx_metadata_request(), we pass a static const struct with our
> callbacks and then the compiler makes all these calls direct.
> This is not limited to libeth (although I realize that it triggered
> this build failure due to the way how I pass these callbacks), every
> driver which implements XSk Tx metadata and calls
> xsk_tx_metadata_request() relies on that these calls will be direct,
> otherwise there'll be such performance penalty that is unacceptable
> for XSk speeds.

Hmmmm, I am not really sure how you could guarantee that these calls are
turned direct from indirect aside from placing compile time assertions
around like this... when you say "there'll be such performance penalty
that is unacceptable for XSk speeds", does that mean that everything
will function correctly but slower than expected or does the lack of
proper speed result in functionality degredation?

> Maybe xsk_tx_metadata_request() should be __nocfi as well? Or all
> the callers of it?

I would only expect __nocfi_generic to be useful for avoiding a problem
such as this. __nocfi would be too big of a hammer because it would
cause definite problems if these calls were emitted as indirect ones, as
they would not have the CFI setup on the caller side, resulting in
problems that are now flagged by commit 894af4a1cde6 ("objtool: Validate
kCFI calls") in mainline. It sounds like it could be useful on
xsk_tx_metadata_request() if we decide to further pursue this series but
given we could just bump the version of LLVM necessary for CONFIG_CFI on
ARM, we may just go that route.

Cheers,
Nathan

