Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4831FC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=; b=EEPE8hDijQlAzBuE9AgO/Xoiz1
	pBzWeoXMF/tvtkx55g4J5dmxGdovtdIaMTPLXswu+anY8pIlHthhZObmZhARmSvxXSd2uIHTboff6
	8nRubkzlF/CXGlJKtmAlcOk6GpkRC+IJM7Fp6b0HGr/oowOBxDmeHiHd9VS5kk7rBp5zvGr2nSJ+b
	t0wTcWYFCGPVkBm5tYPltj3l0P0vu+LuytXyJP11KFCWCcyuYdqdfoizr8C49+nkhN5IP+En+BuqP
	/r0GgrqqLRrNzG7Rf1WW/Fgc/NquKRkrh0otY9anqE2t/cTCBZ4GdKazG5agur6Q+pPthLkcFHVtg
	xvUcMWxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxdU-0000000GFJJ-2bmw;
	Sat, 05 Jul 2025 07:48:36 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxQd-0000000GE9I-2TLv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 07:35:21 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so2778346a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 00:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751700918; x=1752305718; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=;
        b=XkFtvnIGj5e2HUxUOe0nA9l94DWj+tzK60cvrrjegt1PqBfMH4opJeL98/XF6x8kuW
         OKSOxpB7X5ZKtxtX51SYUFk5kW7m+yLF4s1/3UlpMSnJTAA/yvjyzfKiFzbwZqhu0esv
         +28JK+l3wEOWOC6oK3LcV++Undm8Q2d8T9kERwpCcB/LneSMVyntmS/+eTnQLG4Rv1f5
         7IVwOAP3YXXg7BT+sH506OLJmIXYfP6H+QbfseANwA7YENyLLihkKs8/y9BkWL/D/Z/W
         Y7c1sl65gj1nooriNsyALm/HuNnElokGA7wCQR2LgAdK/vVNN1O/d17WBxVLoHYiFARV
         tArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751700918; x=1752305718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipNd1HQQ2Ma2pisa7/gO96wA/WYXb5+4l3FrYAWC8qA=;
        b=RfIJ6J2x8C16C9C6KYlscYn2I4O4a+Syaxnjyls43eEh68WpJpSKGw9t/4KWmwZcf4
         A/7iZO6VnyBgX2fyUCYDGJ/Lu0w1hOBtFToT/8dBPQ8qwJop+MHyg3/76bs095V4n24G
         uw0Mgb3FpENFmX37gdW4d3cTTgmUmhp3uT0uQArGdXa2deAIwFeLuxtN7qskMS8MS5Z0
         fVYq+IGmvW0IAtItn7VpXLG6yMV3FOlJYOmhwNAH6yBUqhig4EnVaRNs6BtZqxCEy8RI
         e3wvP51hvacVoq5VIBUW56atHmBsKDF8f7IBfWhF3Rg6VFs2aQ4WfZmGeIZPv3CqhkRW
         A49Q==
X-Forwarded-Encrypted: i=1; AJvYcCXM0HtlgWw87QwsVVDEdXIIVMooxzu8yVT+gav2wOnWVlvfNP6bWE2KSVJTnl/FZRRV1k71tdFGQQUJSrmjYfEk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3F8kUYVSnqGPRhds4WcFhVlBn+dKaxWer4pPI+l2N38z7soh+
	p2XilF9yoTdmOdeCpj/LuBN/xf0ciDcOew3vBM9yWFn5o1EYhCtUZpID+ZuGi6l5JWdRzYV1rO7
	Anv2+
X-Gm-Gg: ASbGncsuWBTNBX9gwi1zYHLfWLsYDi1lQaa0wFv8JhEXOgSiMuH0/BqRzvlFWVRCYd5
	A3+qt9BShi5Xsj5AdMQN7PAc0B01hvb9p6G5+NZG7dkaUkLrf1/y9UnOhemaz/P2FMqU2v2Qu2K
	PFz65MUNDkcDBcI+7QM/7ACeE+r7prscQw/p5IQ7Qb+iQmUTNmz2fQmr75wenBeLXPENvG+iQ/g
	vC26h/MHh2OxVfkeehhcw/oZav8SLDdpKMO8dLzkqo+XeT9QIrp7FasC3Hn3netoc8HRhXtKsLz
	FfcAKg9kZpChdefmDbtK5gvvk7eHG3l6iT6le4l9i2aqSCWtudjNA+aOt5uAZajyhF/cmjtM34O
	OCQ==
X-Google-Smtp-Source: AGHT+IFxMK52Ys26C4f3voCZTaLQ1Z4j/f7jjualB3g4BAkzo8LsAb43BYWlC0Jml4RwTMj13AKgTQ==
X-Received: by 2002:a05:6402:1611:b0:602:bfc6:f99d with SMTP id 4fb4d7f45d1cf-60ff3e20afdmr948476a12.24.1751700917862;
        Sat, 05 Jul 2025 00:35:17 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60feab9b483sm758267a12.22.2025.07.05.00.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:35:17 -0700 (PDT)
Date: Sat, 5 Jul 2025 09:35:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
Message-ID: <5v5u4nzvlryu5vqaihufqpkzd2v4xqhbdsgqgrxbj4r75oeu5c@sjtdsmjd7tqf>
References: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5hbbon3em7477z23"
Content-Disposition: inline
In-Reply-To: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_003519_814156_1428B783 
X-CRM114-Status: GOOD (  12.60  )
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


--5hbbon3em7477z23
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
MIME-Version: 1.0

Hello,

On Fri, Jul 04, 2025 at 07:27:27PM +0200, Uwe Kleine-K=F6nig wrote:
> After enabling the clocks each error path must disable the clocks again.
> One of them failed to do so. Unify the error paths to use goto to make it
> harder for future changes to add a similar bug.
>=20
> Fixes: 7ca59947b5fc ("pwm: mediatek: Prevent divide-by-zero in pwm_mediat=
ek_config()")
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

I applied this patch already to my next branch and will send it together
with
https://lore.kernel.org/r/20250704172416.626433-2-u.kleine-koenig@baylibre.=
com
to Linus next week.

I'm still accepting acks and reviews anyhow.

Best regards
Uwe

--5hbbon3em7477z23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmho1a4ACgkQj4D7WH0S
/k786wf/WU3raOHbDhvJS1ZL3utHhPXKLF/aFzrojFTP+stDBRrBRc3kKsyxUrfE
On/ZlJYNchwG1kTUh0i3kzgInRxvJTZADwkmsVuBjp9TTbMWVDywhJeQXDkF+r3Z
VbVDNnInWH2DytpwCoTPzppMtLzEk+UaKaboxHfL7t5izNKeuat4UXqHKX+C5i1s
45wZVhPeMFnzN6s8bqeLNGIbkl299gAqU/IgpgUYz/RhlrSKkfl+Wa3OXsuO+riK
O4xK6BXGwS4H5DOHpJXB8/5iagEoEJyWrk2mfDKw0yTxoLjSJfNbzINnHY+mNs3D
qJDLigEtxsN3ZNv+QkD90zYP+E5tHA==
=VHIx
-----END PGP SIGNATURE-----

--5hbbon3em7477z23--

