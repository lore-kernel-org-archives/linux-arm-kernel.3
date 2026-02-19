Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AE6C531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 22:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81pERVSJFWcDlhN7H8BeVfNSMbWsEHVgYzIfoBCtGlk=; b=FdePc62SlMZZ1zWNBODF9Lb8Se
	gEPnoLZomluQ3tYPdZr298/9vPzUvfn5uZ/AVJCFsYZYgFr55v5J7fTwL/jbGQVPaAS7GTVRPdMO0
	bkguIjSt4T4iaSJA/ME2EX+SzbHc6F3pz6LvupTqe4NnbUh4vXzaoF56cVi/u4WPgQ9YOweyp7sDH
	gnUPPUdgFocyWY1dEkpOWBUnYhw5t4XL1qQva63Ttq/mipFL+SG9g0vD0KSeTm3tdg7I4ulFwK23N
	ofzsd6B0ErfvDyqP9Quz5nDFHNht0BKqlKwAIK3k73Pqv+wQkLfNTQfd+qguRIsahv1Y0eKPC6kNC
	qZtlf8Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCJ2-0000000C8Oi-1ztR;
	Thu, 19 Feb 2026 22:15:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtCJ0-0000000C8OS-3q4P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 22:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1EE560054;
	Thu, 19 Feb 2026 22:15:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25630C4CEF7;
	Thu, 19 Feb 2026 22:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771539329;
	bh=eD3uqcKS6urVjsBvU1YIr7SWeYT2YskOxTQEK12NAqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmVqCS2yIsWtdVpijjEW6bI5Is/3qWKsiDhBA3IUKbSX+J3JVTVSim+ub4xvj1DZ0
	 nXGSAqVuJTjpUVRNiXuBHwihkyKiKLJsan0vgdg+GGhQK1XOzvkHLHN9n2SihjA3AZ
	 nlozFVy5cF6QDOCosPXITEEAmidlFg6JCWj2C7M+LnHMHTJ5tsSDy99srR4wS4ifdl
	 mgpZUuwBdU2/y0JZam9YBERXaDID0G3U2VO8/dcfBdpxyMiEB/8j2440EKA5WgV4ZP
	 qLjX/y1F5lSuFQNczWLWLzXCfZCEUlUFtAmrnRwci9/W414mczTYusgS0OEK5TCOMt
	 fY13VGQLkIjkQ==
Date: Thu, 19 Feb 2026 14:15:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 15/15] wifi: mac80211: Use AES-CMAC library in aes_s2v()
Message-ID: <20260219221527.GC32578@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
 <20260218213501.136844-16-ebiggers@kernel.org>
 <c62915b1956ee4c5d4bad9315f2bc44aeddbb9bc.camel@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c62915b1956ee4c5d4bad9315f2bc44aeddbb9bc.camel@sipsolutions.net>
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

On Thu, Feb 19, 2026 at 12:01:14PM +0100, Johannes Berg wrote:
> On Wed, 2026-02-18 at 13:35 -0800, Eric Biggers wrote:
> > Now that AES-CMAC has a library API, convert aes_s2v() to use it instead
> > of a "cmac(aes)" crypto_shash.  The result is faster and simpler code.
> > 
> > It's also more reliable, since with the library the only step that can
> > fail is preparing the key.  In contrast, crypto_shash_digest(),
> > crypto_shash_init(), crypto_shash_update(), and crypto_shash_final()
> > could all fail and return an errno value.  aes_s2v() ignored these
> > errors, which was a bug.  So that bug is fixed as well.
> > 
> > As part of this, change the prototype of aes_s2v() to take the raw key
> > directly instead of a prepared key.  Its only two callers prepare a key
> > for each call, so it might as well be done directly in aes_s2v().
> > 
> > Since this removes the last dependency on the "cmac(aes)" crypto_shash
> > from mac80211, also remove the 'select CRYPTO_CMAC'.
> > 
> 
> > -static int aes_s2v(struct crypto_shash *tfm,
> > +static int aes_s2v(const u8 *in_key, size_t key_len,
> >  		   size_t num_elem, const u8 *addr[], size_t len[], u8 *v)
> >  {
> >  	u8 d[AES_BLOCK_SIZE], tmp[AES_BLOCK_SIZE] = {};
> > -	SHASH_DESC_ON_STACK(desc, tfm);
> > +	struct aes_cmac_key key;
> > +	struct aes_cmac_ctx ctx;
> >  	size_t i;
> > +	int res;
> >  
> > -	desc->tfm = tfm;
> > +	res = aes_cmac_preparekey(&key, in_key, key_len);
> > +	if (res)
> > +		return res;
> 
> Same here, maybe, technically, but also doesn't matter.
> 
> Acked-by: Johannes Berg <johannes@sipsolutions.net>
> 
> johannes

In this case aes_s2v() wouldn't otherwise be able to fail, so ignoring
the aes_cmac_preparekey() return value would indeed be a simplification.

However, since the key length isn't a compile-time constant here, we'd
have to rely on non-local validation, which isn't ideal.

To ignore the return value entirely I'd prefer a static_assert that the
length is equal to one of AES_KEYSIZE_*, which isn't possible here.

It's actually not clear to me where the length validation happens before
here.  nl80211_associate() for example just copies the length from
userspace without validating it.  ieee80211_mgd_assoc() only checks that
the length is at most FILS_MAX_KEK_LEN (64).

- Eric

