Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA0CC54FCC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoU/4x8R6qlfBpKUL3kf+2mK3W6ZQH9KLxd9zBZ2Oeg=; b=gN82lHw/v33nPHRYFDS2A5g0ZW
	TSPyubtjX2/A9c6zeZXT16fCXmzM1iPQDxdoPgQcZW0jbRDL4X5mL4hRURFPYpuSK4mZwaP1s8Fa1
	LIhIYw03E8Qig+KatAm4oqwaf6mfyBt0fydgZvAim6O16oeIqs9uIqp8/P6mU8okDcWK4qomI6xyC
	94BqXiDYz7xx9gP+S4LuUxVTHWrTy5GVOdQ88ft6jRG/NC2QtXtjBgsHUr+4KhgrfHVjMXSYMVm3Q
	B1hXwZrsXgnN19ztbLxLXsBT9u5eEUXsLsIQnPdvMvu2L8ZdaXAKlAiUkw1tjwCxHTLNlfN1FUwja
	VJ5RJMsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMAx-0000000DREa-2scb;
	Fri, 20 Feb 2026 08:47:51 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMAv-0000000DRE2-1kAD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 08:47:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=qoU/4x8R6qlfBpKUL3kf+2mK3W6ZQH9KLxd9zBZ2Oeg=;
	t=1771577269; x=1772786869; b=jkPznVBQKXeVBaUKqT0NGJksWdTRppCYJEvqUD3jBuXIaGI
	PashKdzSOwJj7tAOBF+TNh41d3PiUbVkFqc2ZebXD+I6a9iDu69mHuW1/cyI9MEZaOqjGwMXdEwmX
	YbQDRzMRAsHF2C1c3atKoyBgZHe3gSwrW1KTYpvKe6qsNSRRoGtS+FboHkBty2nJ/KoqUy6CPbUsh
	xeSatAdh7TV00zLfOUPGKUlM/1ujWB4Dks2PQDjbtTZ+g6SUDE0xz+Qru5VhQHW1jiPKnv9bHniab
	hZdNFuKen7/wEAwSxm6Cqted5E2/Fx1Lw9+BsJCqdX5UckZQ18OrSwVZxtvsbp1A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vtMAo-0000000E3WL-3Adh;
	Fri, 20 Feb 2026 09:47:42 +0100
Message-ID: <6f14c73b7d513de1da06431d0e421e4792a43655.camel@sipsolutions.net>
Subject: Re: [PATCH 15/15] wifi: mac80211: Use AES-CMAC library in aes_s2v()
From: Johannes Berg <johannes@sipsolutions.net>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Ard
 Biesheuvel	 <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu	 <herbert@gondor.apana.org.au>,
 linux-arm-kernel@lists.infradead.org, 	linux-cifs@vger.kernel.org,
 linux-wireless@vger.kernel.org
Date: Fri, 20 Feb 2026 09:47:41 +0100
In-Reply-To: <20260219221527.GC32578@quark>
References: <20260218213501.136844-1-ebiggers@kernel.org>
	 <20260218213501.136844-16-ebiggers@kernel.org>
	 <c62915b1956ee4c5d4bad9315f2bc44aeddbb9bc.camel@sipsolutions.net>
	 <20260219221527.GC32578@quark>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_004749_501139_BB1BAD85 
X-CRM114-Status: GOOD (  15.40  )
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

On Thu, 2026-02-19 at 14:15 -0800, Eric Biggers wrote:
> > > -static int aes_s2v(struct crypto_shash *tfm,
> > > +static int aes_s2v(const u8 *in_key, size_t key_len,
> > >  		   size_t num_elem, const u8 *addr[], size_t len[], u8 *v)
> > >  {
> > >  	u8 d[AES_BLOCK_SIZE], tmp[AES_BLOCK_SIZE] =3D {};
> > > -	SHASH_DESC_ON_STACK(desc, tfm);
> > > +	struct aes_cmac_key key;
> > > +	struct aes_cmac_ctx ctx;
> > >  	size_t i;
> > > +	int res;
> > > =20
> > > -	desc->tfm =3D tfm;
> > > +	res =3D aes_cmac_preparekey(&key, in_key, key_len);
> > > +	if (res)
> > > +		return res;
> >=20
> > Same here, maybe, technically, but also doesn't matter.
> >=20
> > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> >=20
> > johannes
>=20
> In this case aes_s2v() wouldn't otherwise be able to fail, so ignoring
> the aes_cmac_preparekey() return value would indeed be a simplification.

Right.

> However, since the key length isn't a compile-time constant here, we'd
> have to rely on non-local validation, which isn't ideal.

That's true.

> To ignore the return value entirely I'd prefer a static_assert that the
> length is equal to one of AES_KEYSIZE_*, which isn't possible here.

Indeed.

> It's actually not clear to me where the length validation happens before
> here.  nl80211_associate() for example just copies the length from
> userspace without validating it.  ieee80211_mgd_assoc() only checks that
> the length is at most FILS_MAX_KEK_LEN (64).

Oh, right, I forgot this was FILS and mixed it up with the previous
patch. We probably _should_ check it earlier there, but it won't be
local here either way, and we have the error paths already so that's
fine.

johannes

