Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E019C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 03:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFSEgy6bhQIuoHFCxLgQ/123rDMfWMt/9SioFz0ullY=; b=UHt+56Ng9ev0uJZlhzCxf9fthr
	5YSUIrDBlP3mYvkLbYPO3a/zkMIfWO0h59ZzPXk87MvhNftv1Ot43hTa5gKVgzKjTFOD+5KGI8+Ig
	h4N8Y+zusu7E9y91aiQ9s+EQhj7jyb0zIcAQ7rjvMzMtOFpIHYqM1Qhg+hqKZIAdBEFaWwW5p3Zq9
	VWalxHmdWgkgKfxgW14HJRgksSfoccH47QAWx8kTMZEIBSqJdPP7/8nY9OrWV3yW+94EgSCGLaCfD
	laSQBZj0ubM4dtWyhNoQxPidm4pE8kYNOEcD/JMcwPwgGL6UOOxB56vtw1BYOhLnfW2RDvDoZk0Pg
	JrLi7pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVJw-0000000183d-3sRq;
	Sun, 16 Feb 2025 03:27:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjVIT-000000017nw-3mGi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 03:26:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E0C93A400AF;
	Sun, 16 Feb 2025 03:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1771C4CEDD;
	Sun, 16 Feb 2025 03:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739676379;
	bh=xPxs9EGZOUB8OVEByI5GmnmSdMJ0bdd8pkV5n8kPmQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EHAF/EUUukABpePQNqnEyDMKwBXXAkMiwVJkYCnRypfkz5uy5jRqyArIqEStpbsZs
	 qBvytX3fCE61LQzRGMQaw5WPPept3cqmogo9dnft/Jt2dIVgwkTDuOrSU4AR4gaZQJ
	 IO9omqJ4440C0sDWlUazodFN6MQEI8JMNKTV5zvxNWVnbgBdcAcK9pmVV7USfaxfFJ
	 ycqf0eN4p06VKXxPboUct9YcPs3pQ8s+GANnX2NHbaNtWmbr5dZ4Oak321lljY+Zuq
	 Ug1LjL8zI/O0pIsUHjP2Pj/jD/lXksB+ogv62k+b0yuKHm3lDaG1QgiRjnkb3rztHN
	 G3nz+tOmZEagA==
Date: Sat, 15 Feb 2025 19:26:16 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>, fsverity@lists.linux.dev,
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <20250216032616.GA90952@quark.localdomain>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <20250215090412.46937c11@kernel.org>
 <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_192622_026576_0F9157B7 
X-CRM114-Status: GOOD (  14.84  )
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

On Sun, Feb 16, 2025 at 10:27:02AM +0800, Herbert Xu wrote:
> On Sat, Feb 15, 2025 at 09:04:12AM -0800, Jakub Kicinski wrote:
> >
> > Can confirm, FWIW. I don't know as much about IPsec, but for TLS
> > lightweight SW-only crypto would be ideal.
> 
> Please note that while CPU-only crypto is the best for networking,
> it actually operates in asynchronous mode on x86.  This is because
> RX occurs in softirq context, which may not be able to use SIMD on
> x86.

Well, the async fallback (using cryptd) occurs only when a kernel-mode FPU
section in process context is interrupted by a hardirq and at the end of it a
softirq also tries to use kernel-mode FPU.  It's generally a rare case but also
a terrible implementation that is really bad for performance; this should never
have been implemented this way.  I am planning to fix it so that softirqs on x86
will always be able to use the FPU, like they can on some of the other arches
like arm64 and riscv.

- Eric

