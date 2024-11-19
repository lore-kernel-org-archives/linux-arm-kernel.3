Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4043D6C282
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 17:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sr9L5/9uMLYoOCbtjpfQCh02kNZLNfjp7kspe4awzRQ=; b=f+Ndx1HQlFJDy3olCkR9w6pY4p
	s9rU2gk0/XNWr7b0Z2bfyZoZfVeBihPnpfx4T7yoNZ9y8W8Ji9tvf9M8Sta6/bigQrusi7vY0QY8k
	BXSemISP0IV0e4jbYhgwBsNYr0lz5oVME8DpDezjYrBt4tWTERKxIt/+4zsKPBL50AYqRUgdfOKtg
	Da3a68sOGQgTJAj9ZiXKrF80GHVGwkeZ0lkIatF2YM6pzzvGfkilZDxvmJtd+W1WX3ulQbG/9M7Uu
	5dQBHIyyjJblYNNXJUdj2Z4SEx1L5U7pDPDaw0/R1F7SqYs689vt9kuqvS6zaLFG/fCTZsQpERIzA
	Kjzw3x/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSQl-0000000DHZe-2Yi0;
	Tue, 19 Nov 2024 17:54:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSPo-0000000DHQB-0vr9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 17:53:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B0C5E5C57C9;
	Tue, 19 Nov 2024 17:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A786C4CECF;
	Tue, 19 Nov 2024 17:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732038807;
	bh=xHBKbFoZ07Ku7Y6Que2kbEg3CxhDB6sSiE/pmczIBCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dgq5vDPYfQEAp9QcRlppUahsKWsHleIu2nooD2vWUTECini7qwskFf71OtQlAgHob
	 VgwbxcfTrGcj6SaEE0IA3KEVSJVN8o4buBI87cUyTlsrNa829jFX3FU+5LZ4z9dhQq
	 q6cDXdYeeLPq+875LdXusF+1Tdk/dUSpHerioqelqy+4g0QhpIBJX399a7cdJLXkZD
	 6pgVXWvXdZzIwmUu3NbsF9WYzW1YemgHn9pcK3UbbCT0WEWvTXNFg7dC+guUY8i+xq
	 PXnxAuCla2s+P3m8m0/Vmg800NCXq6a16c5ZNJy6umQgOI/GxDr2MKprgwfgns6Q7i
	 /E/BHKcA5Fe2A==
Date: Tue, 19 Nov 2024 17:53:25 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
Message-ID: <20241119175325.GB3833976@google.com>
References: <20241117002244.105200-1-ebiggers@kernel.org>
 <860a6acc-2c39-4eb1-8113-a3753f6531fc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <860a6acc-2c39-4eb1-8113-a3753f6531fc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_095328_300915_1CE06D61 
X-CRM114-Status: GOOD (  13.52  )
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

Hi Zhihang,

On Tue, Nov 19, 2024 at 06:05:58PM +0800, Zhihang Shao wrote:
> 
> I still want to submit an optimization patchabout CRC-T10DIFfor RISC-V.
> 
> I don't know if it would be more appropriate for me to rewrite a patch after
> your patch is officially applied.
> 
> What do you think?

Please go ahead and rebase your patch on top of this patchset, i.e. on top of
the git branch I gave at the beginning of the cover letter.  You'll need to move
your code into arch/riscv/lib/ and drop the shash stuff.  You can test it using
the new KUnit test I added (CONFIG_CRC_KUNIT_TEST=y).

After that I'll be glad to apply your patch when I apply this patchset for 6.14.

Thanks!

- Eric

