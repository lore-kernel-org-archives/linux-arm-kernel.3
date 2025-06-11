Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C8FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 21:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMbYh+mvfZWc0V5rtVvIhx1pWFWh3YJyYvc1MF9EcGw=; b=wN+WLG1ka/60wa+QwJZ4LZnI/A
	6ZNyP/7KaPjimg3K/W65ir33wnM8cXhNDjVsumX5cZZKTPHPf6GxfEkeZdlri6E9z6vRLMHuLv/L+
	zgYdxbLP8PyCH1uWSg+FD9smSgyDjCcxz0bsB01XWEQszxb7i3TQEL0MdG7BlRHX5u7KFy2AmH1ID
	LpR/V/1mLjF1p/l8XuiaSjkAi7le0hzkD1eYGhk/4o5sBWiuw69B3LPYpUsUm2Hpf63WCDKrS9imO
	eCFLnA1ApHYXdk/I2eqEVsvHHMC/pQVQd/J5fz9wONJ0LQak8K/SjPxwyRSr4qFc2FrsC6GXCpbSG
	WDygVOsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPSoJ-0000000BGYa-3ujL;
	Wed, 11 Jun 2025 21:16:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOPg-0000000Acuf-1izP;
	Wed, 11 Jun 2025 16:34:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A58CBA516A8;
	Wed, 11 Jun 2025 16:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A1BC4CEE3;
	Wed, 11 Jun 2025 16:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749659695;
	bh=YnBjJCjZGkkrgSbru8fgRTSfROvOQq67aVGW6ZpVPgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dB+LPFkpPB50dxO2SwKdjRyNRaC4GTJSF+jgfUyoydG4rqDU1/cAhbNfTSc4Zi6Df
	 cV8hG9u7FZ6UAF7suixSuRhW4+uJrn7i3DRvt3R0wPygCK3FUGNKhxalSjH8aXsUPd
	 pxWXAGsiEuQRHVLDEtNQkLeJJJu+Isfkoau6xj9RGtyfbdMSE9GH5KAjxfgOwqu/Oa
	 4hTDzIFuHtOcc8hbq1nVmumB6UOvemPyeCnkPO3/L89aimaVaFZt4DFf0+Oge2dYJF
	 k5oBFgO/bq0TEWR0qyGieLeOrCEvvx8lei1ZR18LWITEp/URmXPA/H89o8+Fsvy2UL
	 XG9XKd3xyk6TA==
Date: Wed, 11 Jun 2025 09:34:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: linux-crypto@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/7] crypto: testmgr - replace
 CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS
Message-ID: <20250611163430.GA1254@sol>
References: <20250505203345.802740-1-ebiggers@kernel.org>
 <20250505203345.802740-4-ebiggers@kernel.org>
 <DAJOCL4UQWZ1.2CB0NH55US5EI@cknow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAJOCL4UQWZ1.2CB0NH55US5EI@cknow.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_093456_576467_D8E63EC6 
X-CRM114-Status: GOOD (  32.53  )
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

On Wed, Jun 11, 2025 at 01:41:06PM +0200, Diederik de Haas wrote:
> Hi Eric,
> 
> On Mon May 5, 2025 at 10:33 PM CEST, Eric Biggers wrote:
> > The negative-sense of CRYPTO_MANAGER_DISABLE_TESTS is a longstanding
> > mistake that regularly causes confusion.  Especially bad is that you can
> > have CRYPTO=n && CRYPTO_MANAGER_DISABLE_TESTS=n, which is ambiguous.
> >
> > Replace CRYPTO_MANAGER_DISABLE_TESTS with CRYPTO_SELFTESTS which has the
> > expected behavior.
> >
> > The tests continue to be disabled by default.
> > ---
> >  <snip>
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index da352f1984ea..8f1353bbba18 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> >  <snip>
> > @@ -171,20 +171,26 @@ config CRYPTO_USER
> >  	select CRYPTO_MANAGER
> >  	help
> >  	  Userspace configuration for cryptographic instantiations such as
> >  	  cbc(aes).
> >  
> > -config CRYPTO_MANAGER_DISABLE_TESTS
> > -	bool "Disable run-time self tests"
> > -	default y
> > +config CRYPTO_SELFTESTS
> > +	bool "Enable cryptographic self-tests"
> > +	depends on DEBUG_KERNEL
> >  	help
> > -	  Disable run-time self tests that normally take place at
> > -	  algorithm registration.
> > +	  Enable the cryptographic self-tests.
> > +
> > +	  The cryptographic self-tests run at boot time, or at algorithm
> > +	  registration time if algorithms are dynamically loaded later.
> > +
> > +	  This is primarily intended for developer use.  It should not be
> > +	  enabled in production kernels, unless you are trying to use these
> > +	  tests to fulfill a FIPS testing requirement.
> 
> I built a 6.16-rc1 kernel [1] and its config is based upon Debian's and
> that has enabled CRYPTO_SELFTESTS [2] (due to Debian bug 599441 [3]).
> 
> I then installed it on 3 Rockchip based devices and booted into that.
> 1. Radxa Rock 5B (rk3588)
> 2. PINE64 Quartz64 Model B (rk3568)
> 3. PINE64 RockPro64 (rk3399)
> 
> The full dmesg output for level 0-4 can be found at [4], [5] and [6]
> 
> The filtered dmesg output for Rock 5B:
> ERROR:
> [    0.709822] basic hdkf test(hmac(sha256)): failed to allocate transform: -2
> WARNING:

https://lore.kernel.org/r/20250610191600.54994-1-ebiggers@kernel.org/ fixed the
HKDF failure.  It was caused by a patch that changed initcall levels.

> [    8.877288] alg: skcipher: skipping comparison tests for xctr-aes-ce because xctr(aes-generic) is unavailable

That's expected if you have CONFIG_CRYPTO_AES_ARM64_CE_BLK enabled but
CONFIG_CRYPTO_XCTR disabled.  Some tests are skipped in that case.

> [   14.172991] alg: ahash: rk-sha1 export() overran state buffer on test vector 0, cfg="import/export"
> [   14.202291] alg: ahash: rk-sha256 export() overran state buffer on test vector 0, cfg="import/export"
> [   14.230887] alg: ahash: rk-md5 export() overran state buffer on test vector 0, cfg="import/export"

That means the Rockchip crypto driver is broken.

It may have been broken for a long time.  Hardly anyone ever tests the hardware
crypto drivers, as they only work on very specific platforms and are often
useless anyway.  The software crypto is much better tested and often faster.

I don't think broken drivers like these should even be in the kernel at all.

For now, you should just disable CONFIG_CRYPTO_DEV_ROCKCHIP.

Anyway, the more interesting part of your email is that you pointed out that
Debian has the crypto self-tests enabled, precisely in order to automatically
disable buggy drivers like these.

And actually Fedora does this too.

This seems kind of crazy.  But unfortunately, the crypto/ philosophy seems to be
to enable as many untested and buggy drivers as possible, then rely on them
being (incompletely) self-tested in production.  So, aparently this is a thing.

But of course the distros won't want to enable the full set of tests, which
would slow down boot times significantly, but rather only the "fast" ones (as
they were doing before)...

So I'll send a patch that adds back a kconfig knob to run the fast tests only,
which I had removed in commit 698de822780f.

- Eric

