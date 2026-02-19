Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CBDE9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hVztZvH1pvWHSVib9BToglFjSYjgzw3jR0ZRl+Y3fro=; b=RwSENSYcJCs3ZZUIANj0gnnauS
	lDC8Pz4t68TIjojR60TlnQR5UAVp/etxvqCFvVbXxOX5X2p+495lhqoNfbCwkTtRsbhGV3G+XEYLI
	IoXcjA7Cf2unOmBF3iJLK3Q5CbkG9dsHQRX/VI9zhGXicSi90/1AfOCXIHheQkl+HV5nabq7+y5hi
	lmwvmcWeluZ3PXAXHATYri4O3ANcLUjKQBILe/VKj1BxJJFaoFRMQu/3Stl5tICRR8ZW4Jvasre8T
	lTlfVL8Svr1isuL/rJX5lAVzIFX/5uykAiPAF/LhK4DIgMgtBP9NVIdcoivePzRCCko77gbxpOs4P
	8jGXE58w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC6F-0000000C7rz-2GTz;
	Thu, 19 Feb 2026 22:02:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtC6C-0000000C7rc-3EhD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:02:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AAD244822;
	Thu, 19 Feb 2026 22:02:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DB1C4CEF7;
	Thu, 19 Feb 2026 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771538533;
	bh=i4s5I7+0DySZg05blGIiMhp5ILHD+X+eP+E1bMlRf28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIrCqCYNBgDL27CfO2GlC4purKVTbFYTe2fvm08v5SA9/v0q/5aR8e5X/1PZh5BnS
	 ih+F6QsNAXcd+7+6J6NUY86hWqm0nez6C5U1uBXS4ZU3F8UjNRkb+hFB9/zypXRCm1
	 6RqDFJTEBxQpZfPHQ9FCMVZI/IcYxkaXxW4vEI9814YayfPkCuLFHWXoX638WMNQIQ
	 1ADrzHQs/lJOY96JCnLdxNNQY1+bg5rfMzalpXPiTluzrHCP/r8FuWfBJ6x/yGyTKM
	 DE7rDAKw5wHAB1aMvfEtdGU16jq4BH9OjXKNoz1XnFq+iTQKAI+O5RGVG7RgIDv3r3
	 nxAuPH+Z1mgTQ==
Date: Thu, 19 Feb 2026 14:02:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 14/15] wifi: mac80211: Use AES-CMAC library in
 ieee80211_aes_cmac()
Message-ID: <20260219220211.GB32578@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
 <20260218213501.136844-15-ebiggers@kernel.org>
 <c3b53ea083fa26c863c6a954d13bbd2ef91e1732.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b53ea083fa26c863c6a954d13bbd2ef91e1732.camel@sipsolutions.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_140217_060626_D45C4F35 
X-CRM114-Status: GOOD (  25.84  )
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

On Thu, Feb 19, 2026 at 12:00:03PM +0100, Johannes Berg wrote:
> On Wed, 2026-02-18 at 13:35 -0800, Eric Biggers wrote:
> > Now that AES-CMAC has a library API, convert the mac80211 AES-CMAC
> > packet authentication code to use it instead of a "cmac(aes)"
> > crypto_shash.  This has multiple benefits, such as:
> > 
> > - It's faster.  The AES-CMAC code is now called directly, without
> >   unnecessary overhead such as indirect calls.
> > 
> > - MAC calculation can no longer fail.
> > 
> > - The AES-CMAC key struct is now a fixed size, allowing it to be
> >   embedded directly into 'struct ieee80211_key' rather than using a
> >   separate allocation.  Note that although this increases the size of
> >   the 'u.cmac' field of 'struct ieee80211_key', it doesn't cause it to
> >   exceed the size of the largest variant of the union 'u'.  Therefore,
> >   the size of 'struct ieee80211_key' itself is unchanged.
> > 
> 
> Looks good to me in principle, I suppose we should test it? :)

Yes, I don't expect any issues, but testing of this patch would be
appreciated.  I don't know how to test every kernel subsystem.

> > +		err = aes_cmac_preparekey(&key->u.aes_cmac.key, key_data,
> > +					  key_len);
> > +		if (err) {
> >  			kfree(key);
> >  			return ERR_PTR(err);
> >  		}
> 
> Pretty sure that can't fail, per the documentation for
> aes_prepareenckey() and then aes_cmac_preparekey(), but it doesn't
> really matter. We can only get here with a key with size checked by
> cfg80211_validate_key_settings() already.

aes_cmac_preparekey() indeed always succeeds when passed a valid key
length, as documented in its kerneldoc.  But in this case I recommend
just checking the error code anyway, since ieee80211_key_alloc() can
already fail for other reasons (i.e., it needs the ability to report
errors anyway) and the key length isn't a compile-time constant here.

> Since you're probably going to send it through the crypto tree:
> 
> Acked-by: Johannes Berg <johannes@sipsolutions.net>

For library conversions like this I've usually been taking the library
itself through libcrypto-next, then sending the subsystem conversions
afterwards for subsystem maintainers to take in the next release.  But
I'd also be glad to just take this alongside the library itself.

- Eric

