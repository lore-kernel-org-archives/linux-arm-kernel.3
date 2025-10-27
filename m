Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A6CCCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 20:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vYNu/V+yB8ESbhKG+qhmi2rqh8DEHzZMx+plWdaAhk=; b=mG38Y5oXrb4aGaWAbvImTWIR/H
	pGQnlbhxSULTr9szb8nYKcI/KnF14uk9a6iImOgZNX2JcbornToz444opnZIRvmwBQxQLs+TCFooI
	g/Qyw3DC2DauPKfPh2yUG99qbgyjd0l/kVtb8Dj6m9w5YhADcsWwFDr2laWelrHK1Xlx6OI6JAleE
	pmwdV4btk/Pe4bCFzuon2pd6XGlIVfmh+kXWFeAHzO167mocG9+ksz5/2pxZfj18KvlyLg26pZf58
	ZtsL/ck8CeDTc/dVt1iExmF4jItnBc+s4l2zy7WLRWAAxZ2f5Mb5ILkh6hPoMLlpyDM0QTkRNtCoa
	RQ47X9Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTxI-0000000EjxB-0PTr;
	Mon, 27 Oct 2025 20:36:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDTxG-0000000Ejwx-3TW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 20:36:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E21466059D;
	Mon, 27 Oct 2025 20:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57184C113D0;
	Mon, 27 Oct 2025 20:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761597397;
	bh=7vYNu/V+yB8ESbhKG+qhmi2rqh8DEHzZMx+plWdaAhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7dndVWKprOCSRBJDcOURDGTFrK7JuobTF+mTzjIHZk72c4FARzR4jiOUh37UXyUp
	 /G1kAYzF29MRtsLosHiivhVYIUnVCPfYWzE8tUmrwxfizg8yY061hr7lAcWDNF42JY
	 8yDvgvY4Qw/Mnf2dHilSANLgUvWmn+g4eRVLTD4C+8g83DRqj2QXyQd8a/mwpGhZ0z
	 iWjcs7LSlcBGsu6BIyQWIBcKaq7SJc2pqvi5gzHCPAi5pKHDpbphrVZP0+thl9N3Si
	 kcQ6g2jZ50aJLx0bC1jsEePTNV73o1C+SpRJ/2HGONCGVDnTjWtF6gmKZekOYJ7hJf
	 cakXPLlCr953A==
Date: Mon, 27 Oct 2025 13:36:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Kees Cook <kees@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
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
	intel-wired-lan@lists.osuosl.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH 3/3] libeth: xdp: Disable generic kCFI pass for
 libeth_xdp_tx_xmit_bulk()
Message-ID: <20251027203630.GA3183341@ax162>
References: <20251025-idpf-fix-arm-kcfi-build-error-v1-0-ec57221153ae@kernel.org>
 <20251025-idpf-fix-arm-kcfi-build-error-v1-3-ec57221153ae@kernel.org>
 <fa4487d0-a077-4582-80aa-2deeccee6270@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa4487d0-a077-4582-80aa-2deeccee6270@intel.com>
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

Hi Przemek,

On Mon, Oct 27, 2025 at 12:09:47PM +0100, Przemek Kitszel wrote:
> sorry, but from regular driver developer perspective, just after reading
> your commit messages, I'm unable to tell what the fix is about, and from
> that follows a bigger issue: how to write code in the future to avoid
> such issues (it would be infeasible to always wait for a LLVM specialist
> to come up with a fix ;))

Sorry about that! To be fair, I am not sure most driver developers would
write something as subtle as this code to get themselves into a
situation where I or another LLVM person would need to come along to fix
it.

> was the tricky case to call __always_inline func from another that was
> marked the same? Would it be also the case if one of the functions would
> not be marked with __always_inline attribute, but still end up inlined?

No, I think the tricky case here is that the code depends on the
compiler being able to turn all these indirect calls, as the (*xmit)()
and (*prep)() parameters in libeth_xdp_tx_xmit_bulk(), into direct calls
through inlining. I find that depending on optimizations for correctness
(i.e., passing the assertion that the result of a equality test can be
proven true or false at compile time) is risky because it can result in
flexible but performant code but it is also sensitive to interactions
with other compiler internals and optimizations, resulting in changes
such as these.

> what would be the cost of the alternative naive solution, to always add
> __nocfi_generic to functions marked __always_inline?
> (technically you would redefine __always_inline to have also
> __nocfi_generic for the config combinations that require that)

No, you would not want to do this because if any indirect call remained
in the inlining chain, there would be no caller side CFI code generation
and that indirect call would automatically fail (if I understand
correctly), which is why commit 894af4a1cde6 ("objtool: Validate kCFI
calls") now validates this rule at compile time for x86_64 (which is not
affected by this issue since it does not use the generic LLVM kCFI pass
like ARM prior to 22.0.0 does).

> sorry for my ignorance of not reading any of the attached URLs

No worries, I am not sure how much more they would help with
understanding the problem, which is subtle. If I can clarify anything
further, please me know but I am not sure it will matter too much since
we will likely just forbid using the generic kCFI pass to avoid this
issue, rather than applying __nocfi_generic.

Cheers,
Nathan

