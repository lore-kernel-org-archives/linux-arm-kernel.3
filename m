Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B100ACA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 17:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efhPlHl0mwuo/YmEbezr7uVAgnsDqK5bzZYmj7qssNg=; b=cg4LWr0wzzuN3Bfs4bER6Ef4pJ
	NUoDqnchktqFBj84u24spB5biYUn2kEe6ufo+l3qH2t5dm4ba019ATF3pnyjdbqAdw1Epr9B+coJC
	DU3Sk5HsnPJet6SVI984crOmtyC7yngQ6Gs16oegSm2NsUFinZT/oJtee5+hvsBW6ifqfvOhhVb19
	YKWfzBIbEcVsAuoct5Uu0dftR+uqVAXkiRI9mHfWzVHyYWHhVFwzqVETFEBiqCtpVJX9iDpbb75Tj
	b9b2VAtEsLdqJz6CFj58ct3XgtATla+wkY/ADsKzPYd8tIBIJzWz6u9rTm0oXo7FpnboUE1VnLaWW
	jBBwE1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqapZ-00000008oB9-3bqD;
	Mon, 25 Aug 2025 17:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZsI-00000008d9H-3CAI;
	Mon, 25 Aug 2025 16:16:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=efhPlHl0mwuo/YmEbezr7uVAgnsDqK5bzZYmj7qssNg=; b=Vx4q1Tx8JOcamCHSRKbolFFc/f
	45VY4a4WDN8RkxgiRFzCUgc4vLLeN2r04gcloQbXhxXdGDIonKUAc+WZzNY+OOcbxtIXb0UJuyoVz
	/0UVZaIyc63nYjUQmSzBsbaFT6zvTHxDrV6PQAv3YxZGT+/nUcsh3mY/NZAM4nxbj7tvQeiAuBPME
	ak1hWUQKYAhmm8lueydvceBWM6VD7MHadD78PZ57BcD0oDgSSmx13xehRzthTGwlvcKAl5Mgb+Mqq
	chLEl3P4h3lmbdFN4hEenVUwRL3llrNd2PZlrU9dod12FZ7DsN/gsrSqKdvBndEa/jOOhxvV7PA6W
	vYU4N5+A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZsF-00000001vos-3XIg;
	Mon, 25 Aug 2025 16:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6E00419DD;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6A4C4CEED;
	Mon, 25 Aug 2025 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756138605;
	bh=9C0JTroVYJnMkJclSuilfgsfM6RmsoK/moXeHS/dRAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HfFYvZXMBbgRSX0K3rOpSm2H32pNwz0EEz0H4S8bd5+3uFOutsnu/gA4+ctEHS7ur
	 VtzlPW/aRP0P5S9aTe+JhuI3FChzXIEqbC+aN2veGXaOG1WRIWV4Psi+l4ONt+ohTF
	 RyjzwfR0rTyuppZ+FJ3jNBUbzMZaGKzzoFEBXFRp23llVJvWbp47wn+tZBjZQGeoWB
	 tb71D1+B7nImbFFmi9AowNEy8a6DHnwM8VKGxCarOVIkIRzF9fk369PfmrjngRV5/s
	 NiocBqHCJ5uUXBhjX8UU+eppr7zFxbil46Apb7ckJhm0LZaf7z5J34/iQwh6ScYl9O
	 CfcB+v7OD/pyg==
Date: Mon, 25 Aug 2025 09:16:45 -0700
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org,
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 3/5] x86/cfi: Add option for cfi=debug bootparam
Message-ID: <202508250916.6424C531F@keescook>
References: <20250825141316.work.967-kees@kernel.org>
 <20250825142603.1907143-3-kees@kernel.org>
 <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825155923.GY3245006@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_171648_129319_BE73729F 
X-CRM114-Status: GOOD (  12.41  )
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

On Mon, Aug 25, 2025 at 05:59:23PM +0200, Peter Zijlstra wrote:
> On Mon, Aug 25, 2025 at 07:25:50AM -0700, Kees Cook wrote:
> 
> 
> > +	if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> > +		if (builtin && cfi_debug)
> 
> You could just make that cfi_debug and add:
> 
> 	if (builtin)
> 		cfi_debug = false;
> 
> at the very end of __apply_fineibt().

Oh sneaky! Yeah. Will do.

-- 
Kees Cook

