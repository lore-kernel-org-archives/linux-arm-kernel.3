Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7CDC369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 01:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nXUMIvgWAeZmH0GaKW1gBwUr2XT4Syvd7F811vqAbE=; b=H1t6o0ozNkXuyiuEyAJinkAguJ
	WsPA0nozg7GTtJf8qiXkSmMEyiH1xw6fTq13+tDKHpiVJAZogBxzbg8fOxZoCgoJBgYs45luRI5CJ
	9giMZtJwHKDe4ZvBbXgE7tMN1eLkUF7q/iV65a6PMd4yBX/Cg5pvPvbcmge/0gSIkCAqqGxu7WM7A
	NUWSuzA0pbLiwjc7M7OLBw5YmD7PNf2aAE0go8zXA/HcpxkbO+EDuKesBgeZpoqmHbPWzWNPUgHi/
	lbQjbAtrsER3vbYCJjTXw/Het16cCKVkI9NzQpDQ5QgvyjGiDw3TNlEsZXbQ62gsam+kTQhpumjBT
	xDuSUQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rCA-00000002kTC-2WNg;
	Sun, 27 Apr 2025 01:52:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8rAE-00000002kMi-3vdT;
	Sun, 27 Apr 2025 01:50:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 289895C34C0;
	Sun, 27 Apr 2025 01:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A863C4CEE2;
	Sun, 27 Apr 2025 01:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745718637;
	bh=e/U2hXsUieq0eplDUQMGjtnd+RdUdFnygdx2mCJfSjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A3hPlaXqbKMOOByqg0xO9XDGFN1r/8wVmxH9kT35oxzYfPaLGXzTgbk9sGuMRtTvt
	 44bXMlBlBZQMn8Ipp3JoqeVYAXxD538C1X82i3+WBwshE/qw9nPHmadZjz3sDag3pe
	 JEMPB13QpuEDebnwb5LL7f1z8/SGor7fWyhIXtEz2xGDz/C8I7rNgHiUFkybydeuCe
	 Ro3xou/0TbbO2aRPHU0DEuogQgtgdvMdA5WHna4/b4PQ7kTpgKpaJar1ue9GFDud7L
	 58cp3jMvLW6iFrbLOFJHG9nwrGeuGyAlLwD3YpV4I/HWA3G9v2H3W2WGYZSzk4OmcU
	 KiZ54jDdhgXpw==
Date: Sat, 26 Apr 2025 18:50:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <20250427015041.GF68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_185039_030924_F551A490 
X-CRM114-Status: GOOD (  12.09  )
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

On Sun, Apr 27, 2025 at 09:17:28AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 06:12:28PM -0700, Eric Biggers wrote:
> >
> > No, that would be silly.  I'm not doing that.  The full update including the
> > partial block handling is already needed in the library.  There is no need to
> > implement it again at the shash level.
> 
> shash implements a lot more algorithms than the lib/crypto interface.
> If you won't do this then I'll just do it instead.

But this one does have a lib/crypto/ interface now.  There's no reason not to
use it here.

- Eric

