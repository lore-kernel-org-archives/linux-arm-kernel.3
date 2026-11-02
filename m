Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BAC606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WxJP1dMQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjVLe1A7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0tR0C5wrSJK8oL3NG4NwgFXSd1VItIjr967cGvPECk8=; b=WxJP1dMQ+Z5LIfO4VHwHNxRCwm
	9I2FOC/4CqtzR4nISNfwxb990a/qJbcsa0bkUD/nsf+3Wmyahaw8mehXP9NEwWKEh503FFRlWYATY
	z/YckcjoQwnpUnomfDEA7qqUoWDaNucPECY7FQr9pH5DCvkA3ckn0kZK8MCTZUE2Y8GQD1Oq2QzOy
	MNHVZgCyJdn4ZtWZVdpoyOFXskplyQZb+8eXNKDTy+sDJTso5rgm8FIMaQcsWBpEqrX5qIB4UxVnb
	Fv7McsZChivv+D+gqIoTtpv0OlmjEsPgXrLGLfDCYBY3+lPP0ZhsSQ8AwQeUvnJyvibUOpjHhQbCA
	4h+gMd5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoo2-0000000G6uw-1tTE;
	Mon, 02 Nov 2026 09:58:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoo1-0000000G6ug-12jB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:58:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AF6EE60F35;
	Mon,  2 Nov 2026 09:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874D61F000C1;
	Mon,  2 Nov 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793613500;
	bh=0tR0C5wrSJK8oL3NG4NwgFXSd1VItIjr967cGvPECk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjVLe1A72Lan9Thr7mP0/FCl3sMiK9qhVNV/5ZyXPaBKA0S3mNHvWtbpkh1eSr9kx
	 FV+F3hTy4o8DKlrNBuKmLvpNdrR1YJqyNn8HKalTBmOYmUQqC38jZcvZzBFdW91m9N
	 wa/nWJ2FXpK1Dz6tzQotCzl+qlWLCduThKGq6GGdZNp9Xx0LdCArYW/c9QxlBwxbuG
	 zP+lFp9tYIV4nTwXUpPEzC8H/M8EMQxPfXbpLCW/cChxAbuaIPFO/WBlJg9dMn38zv
	 8ynzj7A3f/mvzea8xe2bcCgva73+PRHjSr5qITJOrN4ZlAkPzy7WLFMGnSVgxYjA2W
	 L+CuNQaMQC4KQ==
Date: Mon, 2 Nov 2026 10:58:12 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Russell King <linux@armlinux.org.uk>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Birk Skyum <birk.skyum@pm.me>, linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH v11 0/2] crypto - qce: make algos optional and remove the
 BROKEN label
Message-ID: <kh74or65txfcprntqqljabnszooj5ppuwizj35flv2r245zbvo@nfue4wdblicr>
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 22, 2026 at 10:57:58AM +0200, Bartosz Golaszewski wrote:
> This is the follow-up to the three smaller series fixing crypto
> self-tests in the QCE driver. It makes the crypto algorithms opt-in via
> a module parameter and removes the BROKEN label so that the driver is
> built by default.
> 
> The dependencies are:
> - https://lore.kernel.org/all/20261016-qce-fixes-sha-v1-1-3ee5a30d84f3@oss.qualcomm.com/
> - https://lore.kernel.org/all/20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com/
> - https://lore.kernel.org/all/20261020-qce-fixes-aead-v12-0-77a2e09abd0c@oss.qualcomm.com/
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi Herbert!

Gentle ping, can these three series + this one now get queued for v7.4?
The three dependencies have no more sashiko comments. The ones for this
one are minor about missing module params docs so can probably be
ignored or I can send a follow up.

Thanks,
Bartosz

