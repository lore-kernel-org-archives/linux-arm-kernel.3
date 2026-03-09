Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B49EFCA188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 20:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQwVQP0SWXgvuS4YaFdHQtZM0TejdSRVuyE+Wbm1KYk=; b=H2/U2XWLBEapdEjtydkXVX+f3F
	FrhV41Oi3e2DNaD9z223El7xof/w3i97LpGqp1iH2baQrGFb3HWAkqm+NVrFgXKCYjp2OcgPmCUI1
	/LzUAUIitf0o8nCBFVa3sayT6g2pMEipMK0baLGYM5QcVYj1dqsUXovuBXsTE82nQWeT73WgaWolo
	gCwSDoc1YZ++QPGNNt9/3uEetyUH7lyY2WyOkFDr6C4qyw0BQS5eyycmOg9XAk+DSd/qeeEVg8dV8
	y3Qh0RIi5Ebcdxh997RKFL+BgBOb4sRVhNnJCDysPUyeFYeTowPYjVNf4FC3UrXKMmrvZXuWoFyiL
	5EcTga5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhWS-000000088QL-4B6l;
	Mon, 09 Mar 2026 20:48:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhWQ-000000088Pz-2OGV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 20:48:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF99D40E14;
	Mon,  9 Mar 2026 20:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3538BC4CEF7;
	Mon,  9 Mar 2026 20:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773089291;
	bh=Wz+3F7vwckC5eQhXk6NG/xcIuOMnL5SG2fVjLNGfWYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hz6HJi1Iha92kWoNbh368nUftSmTGsT2Kxlq/8McxQFC0PSr1+vnN5Y6+7slwVGim
	 XFUDoaG+s1i2qWfgg+EGV/llVjgan2E/xGb+Ly9fBUMdYZA0ZNChGEgHqz4VuBs2Jk
	 sIJQutfiId5/0JMcIIJwl6xGPAKphOi2T7CFYe4ax5SQKnFZRB9364bD5Ck9/7V0Sb
	 m6aQbjYXU192Bua+u5GFKaVHc8bkzMKH13S5htChImc35yRDP22l5qaB4c7sOPTqec
	 mCs+fMtbmdqhAJQeDa1ZcN4uB18Ynq6ELpYLlxSX/Ilc9wrZ9PQWC96YuYY5xRBkpl
	 Gl7Nc6alcnvEA==
Date: Mon, 9 Mar 2026 13:48:08 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>, herbert@gondor.apana.org.au
Cc: davem@davemloft.net, catalin.marinas@arm.com, will@kernel.org,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH v2] crypto: arm64/aes-neonbs - Move key expansion off the
 stack
Message-ID: <20260309204808.GC2048@quark>
References: <20260306064254.2079274-1-yphbchou0911@gmail.com>
 <20260306213502.GB9593@quark>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306213502.GB9593@quark>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_134814_640988_7DEF87AC 
X-CRM114-Status: GOOD (  18.90  )
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

On Fri, Mar 06, 2026 at 01:35:02PM -0800, Eric Biggers wrote:
> On Fri, Mar 06, 2026 at 02:42:54PM +0800, Cheng-Yang Chou wrote:
> > aesbs_setkey() and aesbs_cbc_ctr_setkey() allocate struct crypto_aes_ctx
> > on the stack. On arm64, the kernel-mode NEON context is also stored on
> > the stack, causing the combined frame size to exceed 1024 bytes and
> > triggering -Wframe-larger-than= warnings.
> > 
> > Allocate struct crypto_aes_ctx on the heap instead and use
> > kfree_sensitive() to ensure the key material is zeroed on free.
> > Use a goto-based cleanup path to ensure kfree_sensitive() is always
> > called.
> > 
> > Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
> > ---
> > Changes in v1:
> > - Replace memzero_explicit() + kfree() with kfree_sensitive()
> >   (Eric Biggers)
> > - Link to v1: https://lore.kernel.org/all/20260305183229.150599-1-yphbchou0911@gmail.com/
> > 
> >  arch/arm64/crypto/aes-neonbs-glue.c | 37 ++++++++++++++++++-----------
> >  1 file changed, 23 insertions(+), 14 deletions(-)
> 
> Looks okay for now, though as I mentioned I'd like to eventually
> refactor this code to not need so much temporary space.
> 
> I'll plan to take this through the libcrypto-fixes tree.  Herbert, let
> me know if you prefer to take it instead.
> 
> I'll plan to add:
> 
>     Fixes: 4fa617cc6851 ("arm64/fpsimd: Allocate kernel mode FP/SIMD buffers on the stack")
> 
> ... since that is the change that put the stack usage over the "limit".

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-fixes

- Eric

