Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ECCBE9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zzN+9tLqwjQ+bn8xHkDPkcRVE1Cb1c3LsD64ID6TjU=; b=gzykGFZ+KHrXRvV76gGSudEWvP
	++aG+pVIL3Iyt09yN0QiA/uhqcjk5vnmgNcuT8d8tdfgSY8o4kitYY4NvQvrsToGiOYGobsSbWN17
	jIr62qjl74UdXFoq3pdiqHSALeO0ooE2mhPhdoIhpp5FPWZkE2NY7xisyNciyHg1/DfFJKE+j+Upu
	SUcFHCAuLXupgqIsjVLp+2oW6qJRtAh2hnDCcCNAEJuM/dbzvagwUod/XWXnndSMM9HQ1wIqFj14W
	75SwEIZCP2uF1t+599l0ZOcCrrv3UBL12wDg6s1HK4fGmnYsJE3mHXW4pziPMLTiHEKlMSYxdcX1X
	kJ42hAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1md-0000000BFjX-0NA6;
	Thu, 19 Feb 2026 11:01:23 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1mb-0000000BFj6-0A9f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=2zzN+9tLqwjQ+bn8xHkDPkcRVE1Cb1c3LsD64ID6TjU=;
	t=1771498880; x=1772708480; b=Cu3qFRq+4ue70yHGXCNhyCdBKrrJX7eGrkgE2/HV+OsJtVV
	fLofSYNwc5hkzZlUBOhC9jt7yEE6Yj5oDI7GDFM74fRfnzrSlf+cCrwn5Mv8l7eHztn+CqBBe03Uz
	x3vzZeNj4+dk5VJLnTlZwyTf/TpUuc24zSFQCVakRtSgykuc0GKLlVk1NzItHmfj3RxAj81dDEjgP
	0douVWrEz74IpmBHnS3q3Z+T07l4hC9rTdvyP2ZZ98i2+thBx9gEcGBk6wgE/daWtDtYLdOyAX7ED
	jjDkGimfJBZ+RJv7gDOwHy+t7keSR0DByXn2Zfe+TE7ZkFfVY+G5w1ORwFyxGnCw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vt1mV-0000000D9fX-31Ja;
	Thu, 19 Feb 2026 12:01:15 +0100
Message-ID: <c62915b1956ee4c5d4bad9315f2bc44aeddbb9bc.camel@sipsolutions.net>
Subject: Re: [PATCH 15/15] wifi: mac80211: Use AES-CMAC library in aes_s2v()
From: Johannes Berg <johannes@sipsolutions.net>
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A
 . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-wireless@vger.kernel.org
Date: Thu, 19 Feb 2026 12:01:14 +0100
In-Reply-To: <20260218213501.136844-16-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
	 <20260218213501.136844-16-ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_030121_078414_46A714BB 
X-CRM114-Status: GOOD (  13.40  )
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

On Wed, 2026-02-18 at 13:35 -0800, Eric Biggers wrote:
> Now that AES-CMAC has a library API, convert aes_s2v() to use it instead
> of a "cmac(aes)" crypto_shash.  The result is faster and simpler code.
>=20
> It's also more reliable, since with the library the only step that can
> fail is preparing the key.  In contrast, crypto_shash_digest(),
> crypto_shash_init(), crypto_shash_update(), and crypto_shash_final()
> could all fail and return an errno value.  aes_s2v() ignored these
> errors, which was a bug.  So that bug is fixed as well.
>=20
> As part of this, change the prototype of aes_s2v() to take the raw key
> directly instead of a prepared key.  Its only two callers prepare a key
> for each call, so it might as well be done directly in aes_s2v().
>=20
> Since this removes the last dependency on the "cmac(aes)" crypto_shash
> from mac80211, also remove the 'select CRYPTO_CMAC'.
>=20



> -static int aes_s2v(struct crypto_shash *tfm,
> +static int aes_s2v(const u8 *in_key, size_t key_len,
>  		   size_t num_elem, const u8 *addr[], size_t len[], u8 *v)
>  {
>  	u8 d[AES_BLOCK_SIZE], tmp[AES_BLOCK_SIZE] =3D {};
> -	SHASH_DESC_ON_STACK(desc, tfm);
> +	struct aes_cmac_key key;
> +	struct aes_cmac_ctx ctx;
>  	size_t i;
> +	int res;
> =20
> -	desc->tfm =3D tfm;
> +	res =3D aes_cmac_preparekey(&key, in_key, key_len);
> +	if (res)
> +		return res;

Same here, maybe, technically, but also doesn't matter.

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes

