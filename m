Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783BDFCC07E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N39oyvQPNQCUONNt8UyytgVkJPJYuj42xoBjqqKCYS0=; b=ccMHMNJ2zOkzmV6G0cDzxeNAtq
	SBcGfakmlo7cy5Lx5uxy48yETHXveh/GEZNIwrGVTzqDZ7Gq1p0OrZZFdGuPziwBgMJgAc3ILHn8x
	hboQDSKm1uMH+kpAc/0go05LIFJxDPyq1u7z3gJiEdj6Sv71Ll/V33wFkHdgbrVgmeFZQKoB3PFS2
	qfUDk6uXUrnoeYJIZmFNLpFS7kr2Mv3nbYIg+A1cSTA6zsHhqi6gN0I9A5u31nD4bzyQPnwc3qBFF
	fayg4sdhOZugtgz4P6Wa3STD5jvPFrm6c/g3dwd6mA+f+Esq6481FWEzpWG/zlDsqdD74hUZhFe8R
	M+96tYmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycp9-00000004XC4-175H;
	Fri, 06 Mar 2026 21:35:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycp7-00000004XBY-1Lm9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 21:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDF8860053;
	Fri,  6 Mar 2026 21:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2754FC4CEF7;
	Fri,  6 Mar 2026 21:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772832904;
	bh=a26CKCAuN0e+AQQ0s400WD7JDj7RShgZZsSMsEYZLOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YI1Tx+BpOwYKUOSt+7Cv+ovahSQrK49t8Z4jzkF+72b07lRCMddjsopN1H9nAg9jY
	 htJESw7R8DQNXRGoi8aX8f+sj7JyNiwqZKlg9plFSfXKA27TmWVkz/V4GasvvtUWXL
	 g3BslE5zHApzYL/B0Z4FXM1/XHzHHCcHffJNEro/2mI7E0MmaCgoPQvBlabmqMrsGH
	 8SP/0lMbMRStiEAGxb98KUG+lSKdYwO4DHWA/s0ab3/g+ixUUzMbUjPhWmCt+PAPju
	 gcdVwGOmRJAkW06IcU3ocTDzJH/D2fXqrrblYSy1xDbh4oDsdVSpeG1oIfAScOKYn4
	 xH/yUr16X2LWw==
Date: Fri, 6 Mar 2026 13:35:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>, herbert@gondor.apana.org.au
Cc: davem@davemloft.net, catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v2] crypto: arm64/aes-neonbs - Move key expansion off the
 stack
Message-ID: <20260306213502.GB9593@quark>
References: <20260306064254.2079274-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306064254.2079274-1-yphbchou0911@gmail.com>
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

On Fri, Mar 06, 2026 at 02:42:54PM +0800, Cheng-Yang Chou wrote:
> aesbs_setkey() and aesbs_cbc_ctr_setkey() allocate struct crypto_aes_ctx
> on the stack. On arm64, the kernel-mode NEON context is also stored on
> the stack, causing the combined frame size to exceed 1024 bytes and
> triggering -Wframe-larger-than= warnings.
> 
> Allocate struct crypto_aes_ctx on the heap instead and use
> kfree_sensitive() to ensure the key material is zeroed on free.
> Use a goto-based cleanup path to ensure kfree_sensitive() is always
> called.
> 
> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
> ---
> Changes in v1:
> - Replace memzero_explicit() + kfree() with kfree_sensitive()
>   (Eric Biggers)
> - Link to v1: https://lore.kernel.org/all/20260305183229.150599-1-yphbchou0911@gmail.com/
> 
>  arch/arm64/crypto/aes-neonbs-glue.c | 37 ++++++++++++++++++-----------
>  1 file changed, 23 insertions(+), 14 deletions(-)

Looks okay for now, though as I mentioned I'd like to eventually
refactor this code to not need so much temporary space.

I'll plan to take this through the libcrypto-fixes tree.  Herbert, let
me know if you prefer to take it instead.

I'll plan to add:

    Fixes: 4fa617cc6851 ("arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack")

... since that is the change that put the stack usage over the "limit".

- Eric

