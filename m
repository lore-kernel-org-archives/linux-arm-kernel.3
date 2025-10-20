Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99998CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxyQGLFJiDfo9EbmIoP7N27VSgBp0AMlllTAAYrklG4=; b=jJoywfeg8QKK2eTmC1aCWvG0eU
	akXfI54cLG4eMCEaulQe8Ll6PbDVhtRiX9GkH9HWdTdG7uiDNVNw3f8p7c+rWgzJu5gFYo4Xbk2aE
	I+R0Fd9yT6MsMAUqXCKRLTSDWxEENGTg/pgqfl51R7HkZCZXaptOiE8YTBAX1GT+WySlUhTdcXF73
	RRQ6ZFQaQrvYLYHS7tMxQLsJh0u9694qHF1yulEjhWI16EYCdhE9ete840cNgvlTl3wBgUbypbirU
	euhvd4bSS7Hy2Yf11eONFov0dbGKLRscCH9+F9NmQ5XEnE3S+EbO7t6cxxvflQrmgLIb7/BJiszXj
	R0Svsugg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtvi-0000000EWrP-3fq9;
	Mon, 20 Oct 2025 17:44:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAtvg-0000000EWqe-2NjX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:44:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F354243E39;
	Mon, 20 Oct 2025 17:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048D2C4CEFE;
	Mon, 20 Oct 2025 17:44:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YZ8T1a4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1760982257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qxyQGLFJiDfo9EbmIoP7N27VSgBp0AMlllTAAYrklG4=;
	b=YZ8T1a4oUMWrj+x0InaaoJC7QwohPIHM/oqgsXcNnhFikzBW5pdNCQ+OkZmI7PTDLwwB3j
	2eerl5yZ7sP1Xvm1HlB3ah6lk0cewWUi0Fh8dNijlcf2aWfoWRwyh//gUG37MAY4kZ+FAj
	QnEF1HeHczvHxDYGVKxHa0PA03T7mlw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f88f6c01 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 20 Oct 2025 17:44:16 +0000 (UTC)
Date: Mon, 20 Oct 2025 19:44:13 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 01/10] lib/crypto: blake2s: Adjust parameter order of
 blake2s()
Message-ID: <aPZ0OU75EuC3tlxn@zx2c4.com>
References: <20251018043106.375964-1-ebiggers@kernel.org>
 <20251018043106.375964-2-ebiggers@kernel.org>
 <aPT3dImhaI6Dpqs7@zx2c4.com>
 <20251019160729.GA1604@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251019160729.GA1604@sol>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_104420_850848_2E0D1614 
X-CRM114-Status: GOOD (  15.20  )
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

Hi Eric,

On Sun, Oct 19, 2025 at 09:07:29AM -0700, Eric Biggers wrote:
> On Sun, Oct 19, 2025 at 04:36:36PM +0200, Jason A. Donenfeld wrote:
> > On Fri, Oct 17, 2025 at 09:30:57PM -0700, Eric Biggers wrote:
> > > Reorder the parameters of blake2s() from (out, in, key, outlen, inlen,
> > > keylen) to (key, keylen, in, inlen, out, outlen).
> > 
> > No objections to putting the size next to the argument. That makes
> > sense. But the order really should be:
> > 
> >     out, outlen, in, inlen, key, keylen
> > 
> > in order to match normal APIs that output data. The output argument goes
> > first. The input argument goes next. Auxiliary information goes after.
> 
> In general, both conventions are common.  But in the other hashing
> functions in the kernel, we've been using output last.  I'd like to
> prioritize making it consistent with:

Hm. I don't like that. But I guess if that's what
every-single-other-hash-function-does, then blake2s should follow the
convention, to avoid churn of adding something new? 

I went looking at C crypto libraries to see what generally the trend is,
and I saw that crypto_hash from nacl and libsodium and supercop do `out,
in`, as does cryptlib, but beyond that, most libraries don't provide an
all-in-one-interface but only have init/update/final. So however you see
fit, I guess; I don't want to hold up progress.

Jason

