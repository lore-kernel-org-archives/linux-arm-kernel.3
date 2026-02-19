Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C9CE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 11:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGEXhCb/JrKgOHDO/XlMyvu/gxAXdGksPJCwEvSJR/Y=; b=a8Ay0h5l4KO2SWq/wF8SuA4a1c
	np06LSQ3YfxA1lDW93Xltr9mOyKIs9Av9IvrjOzfrU6kGPWrq/sNkE/WZgdmY3gYD/znyP34p6XYn
	Zg22YNMtKICA88heGv+vbvBSFNgwqWA6r3YvGcO8+M9bJeZc1iVQrgYtBZAvMrZYsVaULnSV3k9dR
	PS3poDHZC7ivBNc+lf0TbexQnsvAR72kYhchgNqMlfjFWibJNhqEmzstkeUKsF7Ny7nNo4scXv2qy
	4LYZIbl1fenPcrNW0SDWLgia8zN3sKw9M4gQNaQXIkqqTvUA7N0iQn2MIMDYpAoFq/4T6BlSL12oD
	hxLzaGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1la-0000000BFaQ-0Zso;
	Thu, 19 Feb 2026 11:00:18 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt1lX-0000000BFZv-1kD9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 11:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=xGEXhCb/JrKgOHDO/XlMyvu/gxAXdGksPJCwEvSJR/Y=;
	t=1771498815; x=1772708415; b=ASjxEB8go1g+9vlCnpAgAgshThhpouSNUcDA2faNUhD25dI
	3nwTDfsCvutbPVIhi39G3o457nlozV6DAGvNcgF+qqhBizGNp8TI1Emtb3QtloNEO8see8VY/pD7e
	MWw+3LIbu+baaKGb5s2JEe6KwU8E6CWEh1jnIHJNQMufIBifpOpPom6/KllQxpqFv7G/frI/V5oWn
	RQs9Tqhw8lEq51CPNlr0cTxmlgUpvyEyPFgz0+CAIASIn1ZkYXE7U2V+12YTFCn5icu3WGVX3dlMl
	NhsCCaIbiG53CpWJucP2yGvx2i9TLgBZnHXHa08I8e16NSTFn7cV+8pGPMCu7cUg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vt1lM-0000000D9d0-0Tcr;
	Thu, 19 Feb 2026 12:00:04 +0100
Message-ID: <c3b53ea083fa26c863c6a954d13bbd2ef91e1732.camel@sipsolutions.net>
Subject: Re: [PATCH 14/15] wifi: mac80211: Use AES-CMAC library in
 ieee80211_aes_cmac()
From: Johannes Berg <johannes@sipsolutions.net>
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A
 . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-wireless@vger.kernel.org
Date: Thu, 19 Feb 2026 12:00:03 +0100
In-Reply-To: <20260218213501.136844-15-ebiggers@kernel.org>
References: <20260218213501.136844-1-ebiggers@kernel.org>
	 <20260218213501.136844-15-ebiggers@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_030015_521294_3422322C 
X-CRM114-Status: GOOD (  15.02  )
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
> Now that AES-CMAC has a library API, convert the mac80211 AES-CMAC
> packet authentication code to use it instead of a "cmac(aes)"
> crypto_shash.  This has multiple benefits, such as:
>=20
> - It's faster.  The AES-CMAC code is now called directly, without
>   unnecessary overhead such as indirect calls.
>=20
> - MAC calculation can no longer fail.
>=20
> - The AES-CMAC key struct is now a fixed size, allowing it to be
>   embedded directly into 'struct ieee80211_key' rather than using a
>   separate allocation.  Note that although this increases the size of
>   the 'u.cmac' field of 'struct ieee80211_key', it doesn't cause it to
>   exceed the size of the largest variant of the union 'u'.  Therefore,
>   the size of 'struct ieee80211_key' itself is unchanged.
>=20

Looks good to me in principle, I suppose we should test it? :)

> +		err =3D aes_cmac_preparekey(&key->u.aes_cmac.key, key_data,
> +					  key_len);
> +		if (err) {
>  			kfree(key);
>  			return ERR_PTR(err);
>  		}

Pretty sure that can't fail, per the documentation for
aes_prepareenckey() and then aes_cmac_preparekey(), but it doesn't
really matter. We can only get here with a key with size checked by
cfg80211_validate_key_settings() already.


Since you're probably going to send it through the crypto tree:

Acked-by: Johannes Berg <johannes@sipsolutions.net>

johannes

