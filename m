Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7379FE83821
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 18:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l2AvSSRlaXVJb7/w7Tk1weJEeTXvEX63lHs6sjttYiM=; b=i2P31gxD38EI4zD77CcMv/cmhc
	3mVGuW3Y8ACELNvSxy1qsZq9ApgISdiDI9yGn4uLSMgHxuL2Ofd3Q0K/RC8jccmBmzYsy00n1VeTr
	/jAQXVnaXvdLS2SMjmipsxQI/4zJ6a2lEZ9pldUmU+2l0BOPImLws9SiUs2+cnBt2mmPIiFGN5xrU
	mk3LgzXyN7V/3eVY0zRajPbsp6/ub2smGWBqJHpRlIo9LIC4LVZEhKOyr8q8jEwIwgvLma+F7/9ar
	KlEbZwS6lUVGgHzTDue2zNKJvjQbP8KxbpIhW0z67/SY5/QpClCKCojhmolF+EUlDU64VIVYNxjkQ
	KjTpwCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3fv-00000007AXf-22A0;
	Mon, 16 Feb 2026 18:50:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs3fr-00000007AXC-0yLO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 18:50:26 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-385e7cafef9so29262191fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 10:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771267821; x=1771872621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2AvSSRlaXVJb7/w7Tk1weJEeTXvEX63lHs6sjttYiM=;
        b=Gj0AgxOdYPootAFKq9NuEmzCX1TZWjrvV/+omVkqIROzTIkuYN9FSk/GKE838K4Z3f
         1KDhbr/oYFobQBwTCNNlpikPlTjoKm7NIZTw9F8J28qmviTyotPRIqkWZC0u0CvEYW9y
         XtQQ/4w25dmtMnpjpPkOAQb1F6p2PMe3HU3FQwuUE+alyo7pd/2i1TUx/9kIGA/gbN0H
         VOyYakLMy0wF0Ox+7K7PGZpPgHJrxX0gMG2w71W1WA5gdD3hfz4wCm0zKPXWl7X4wtnQ
         JRPx4Ag3Kk5xss1U6gGwN9UionYl03woWcHqJXPJFecOtbSSNQw255emR+y3nn8Abxzp
         +mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771267821; x=1771872621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2AvSSRlaXVJb7/w7Tk1weJEeTXvEX63lHs6sjttYiM=;
        b=YkkeUymQ4tEUtyOhE0wQp/Wk9CaczX+1A8P9rlFDTCuYy1gfoeImdgPNdeiX8mRVbR
         wESMTq/mNPrcfU1RgOZTLJMJke7H1rAwyr31zwiez9cP8WOMCaOjPhicty6ktmxVihiG
         +xcgY+c2I6hXfbZvxkL7IvjZ33cB4jLgQtKRifoZlbe7dqhB1airROHje7N60EBBhKb4
         tUDwPIw1V0MvQsjxw92xvRKIWpa56TSFkn92ZWg/da3XyWNy3Rg9UEm7dxX7v+VRp0ig
         qIZlQs0rW/y+94ybK2wzx9L/i7fxHb90FJlAKLfZmNqoz2X4uvn1RVWOSttghYdTDoCv
         Qt5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTyWUJrbEShSwlI7ylGm4quGb3I4cgebnzCxgX75YgRAt69XVbPei7NAbFwgPEUWyX6IIWZ0ZrqgLsB9qaW+U3@lists.infradead.org
X-Gm-Message-State: AOJu0Yy49tGiBsWXZDUJI2n4oZFVUeaMn19Dq6Lnfs/5vXqILLk5yzQD
	jyGgQ+6ZykQvV1UpZEmCPyM/DBAVl8Tm1tnD1fwqGGOpFQWjcHN0MZIVZW8buQ==
X-Gm-Gg: AZuq6aJvnZyBvpc4SqSXrhPtJm1bSRYSygg5VV0n7EzXNPiRcWp7MvW61tDHi56vpqp
	WPrpKvRFuySukRLcjs2IC62v5siUo36DKrf8TaG5EG9a939GrUdlF9PsGNoePcSBw3QIcYZ0Mhl
	kAFdB8xYpidYm6na6htErGpmhlsbHWUeOzHKQS0cbA1wCcNvJ0K80wMv6UrO0oc6bX9QyrJ0bly
	uZHIUFK/wM31Ilglja+gR6lZqhbpYSj4fK+G6vuneSw96iBwBUhUT+plon2mDzdnNIatW3Xg+Ew
	2utf8ksgQw3gaPmNGk9GVbdSU3zU4J45Rmd3zuwHXsTmAnN8E4D9wG1Cdk16/Rsg24GBpSgTFkx
	RagZ6Q8nvKTwMgAHPeKFlZcsfKeBahmSvueahLSLJ3H4rJB5Kd6HsdQoDDCN7ufnSMYz/mOd4OY
	uEVa42Nz6Hub97ILgEMiUcuJU5Rc1GZj7nFKc6WOElT9ycqN6OhiLm6E1onC8e
X-Received: by 2002:a05:6512:33ce:b0:59e:64d4:12f6 with SMTP id 2adb3069b0e04-59ef97f1e64mr3239213e87.16.1771267820730;
        Mon, 16 Feb 2026 10:50:20 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f5fsm3399455e87.56.2026.02.16.10.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 10:50:18 -0800 (PST)
Date: Mon, 16 Feb 2026 19:50:16 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <aZNm6LSK9C8DHC8U@gmail.com>
References: <20260216-i2c-mux-v6-0-9be28ecfd7e3@gmail.com>
 <20260216-i2c-mux-v6-2-9be28ecfd7e3@gmail.com>
 <ab7090f3-4c03-098b-b118-4cd7a68af8f0@axentia.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pemrsl7Yj+LEV701"
Content-Disposition: inline
In-Reply-To: <ab7090f3-4c03-098b-b118-4cd7a68af8f0@axentia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_105024_659129_3847B3F4 
X-CRM114-Status: GOOD (  16.84  )
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


--pemrsl7Yj+LEV701
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Mon, Feb 16, 2026 at 05:40:37PM +0100, Peter Rosin wrote:
> Hi!
>=20
> > +static struct i2c_mux_core *i2c_mux_first_mux_locked(struct i2c_adapte=
r *adap)
> > +{
> > +	struct i2c_adapter *parent;
> > +
> > +	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
> > +		struct i2c_mux_priv *priv =3D adap->algo_data;
>=20
> This assumption does not hold, making the cast pretty wild indeed. There
> are other i2c_adapters with a parent besides muxes. See e.g. i2c_atr.c

I see. Hrm, not sure how to decide if it is a mux or not. The best I
could come up with is to look at the i2c_adapter.lock_ops. E.g.


	while ((parent =3D i2c_parent_is_i2c_adapter(adap)) !=3D NULL) {
		/*
		 * Check if this adapter is a mux channel by verifying its
		 * lock_ops. Only mux channels use these specific lock operations.
		 */
		if (adap->lock_ops =3D=3D &i2c_mux_lock_ops ||
		    adap->lock_ops =3D=3D &i2c_parent_lock_ops) {
			struct i2c_mux_priv *priv =3D adap->algo_data;

			if (priv->muxc->mux_locked)
				return priv->muxc;
		}
		adap =3D parent;
	}

Or do you have a better idea?


>=20
> Cheers,
> Peter


Thank you in advance,
Marcus Folkesson

--pemrsl7Yj+LEV701
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmmTZuIACgkQiIBOb1ld
UjKMwA/9HbiaQBz/bkSFRLB6Z6Shz2Gp7lfqO/+FS7Ri4hgMDb//wcrTF2757mG8
eCGPnGGAd0hpF+HX5bJ5JIvCDKPeBY1UtTCMJo+s7tfD8oVOabC/fKP6p3FKPtE3
TA5MSGmprqTOrZLI1qv018S/UiGaxAriBqTeoMVD9xswh4llcQmQbmvB5yXTL59t
Vqtlq51mmnHmcBA7UOUdbhthj8otdjs/mDJAFkBHpFAxfnpgFBncCH+cNQxJEtxO
FqwP+vVD7nScYal3F7zayAWRiATY4ElxzcTY44N59Q0bg0kcP/raj5o4ZTAB97J1
E8ij5R/c2BCweaUJsOUD6iNsxk80e1grDm1bqhBrZ0Hq+kzMnK5XjCc7ugb0dvND
NvaH4q1GuNhpUIncPJk9gDTgO8+Pi2f+JBJCEYgktsO9yS8buL30GElw0XDukKa5
P2TzX+W5Wt5W078ZHvA2387ZeOUSD88sGlJluvXKjo+W8Y6w3rVOa6WGUwQ1bpoK
A0xXh2zwT966dimSnI63Vy2MudAlUudnQoyl89+HQoCS5EUCDtVpvQn4GhV/8+oe
ANRL65P5hxThDvw6vo6DT09kl/xqat2LUKmTFw6E3NhFSwL7fkvKrAE5AgynFnde
/eEGiirU2/gPW6hXmBkvuHF/9/F06HxyAtJYyjSNpdCdqM/duYg=
=PrHK
-----END PGP SIGNATURE-----

--pemrsl7Yj+LEV701--

