Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E6FD6AB17
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 23:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q8Ji+VkGi/Kh/iXrwXR4D1R50m6wHjt7UU3vThFFKes=; b=1ZOalU5DE527U6hKQK8DW/nKX7
	WV4o2B0dI+eAptIIbClLHYFMHMg3Dq7P6lpWtURkyViyAGcK14DIEl1cGuZGAxCWvBUZqC6aAZ8ed
	fCbqv+91lGleHv4yHizatMHItz662p5CI7BOMzAJwEIqdnTBsLpOi7rYka7mN4c/jirnbdoCs/ubZ
	KEA9cetjTrZ7ivqfk0P/Nb7Inf44VWTnykCyioC3P6JZMLeBBNVxpl5I5liDgF68IOfH3PR8oRkbl
	BCy+XMB3opucf9O8P5ke7xRUtLtBUFVtmM+vmQEQJQqPl0HjtvGLgFlSvJFIMa1RrwUh/UgDFnsFe
	OhGBsByw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RCx-00000000vIo-2O64;
	Thu, 02 Apr 2026 23:12:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RCw-00000000vIf-2MAW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 23:12:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EB7160008;
	Thu,  2 Apr 2026 23:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF4BC116C6;
	Thu,  2 Apr 2026 23:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775171533;
	bh=AlQcHq0q3oR6NEiP4jcaPQ2aCDBphhzMdw3wZ91g/MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tRI4AqK8e/TacyNpwXSTBMfh2L3lbi6A+5ll/Pju1P9ZQdw2GhsNNw6idKf2EEZa6
	 lpGpcYt/GSBDUXNGvefebyTOVUzGdklJWMZt7JZBVc4ciOuISjuHyvYxbM3RVSok9d
	 h8Bp6ghwWoEjX2meOTGuxfpnprt40657QSAF1DrhmkX21yWWtL/k/+6+c7E+4ptOk+
	 5NBLV+xMPVIj6oEvfhztnlW03n6YOtRGgqMw1V1MoWoImr1a2pnme5hYI22O9bwlWV
	 ByKe9dqEbF51zKX5hB70HDxn2CSu5QzzPDazLKWxOK3g3ii4c2btwkpIZwqRYySz/b
	 Bw8FCpQpTnmsQ==
Date: Thu, 2 Apr 2026 16:12:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/9] lib/crypto: arm64: Remove obsolete chunking logic
Message-ID: <20260402231209.GD2910@quark>
References: <20260401000548.133151-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401000548.133151-1-ebiggers@kernel.org>
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

On Tue, Mar 31, 2026 at 05:05:39PM -0700, Eric Biggers wrote:
> Since commit aefbab8e77eb ("arm64: fpsimd: Preserve/restore kernel mode
> NEON at context switch"), kernel-mode NEON sections have been
> preemptible on arm64.  And since commit 7dadeaa6e851 ("sched: Further
> restrict the preemption modes"), voluntary preemption is no longer
> supported on arm64 either.  Therefore, there's no longer any need to
> limit the length of kernel-mode NEON sections on arm64.
> 
> This series simplifies the code in lib/crypto/arm64/ accordingly by
> using longer kernel-mode NEON sections instead of multiple shorter ones.
> 
> This series is targeting libcrypto-next.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

