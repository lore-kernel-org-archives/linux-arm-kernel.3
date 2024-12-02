Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4176D78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=; b=pTBBMQuEm8tzUqjehbyylGAwh5
	hKfvOaKTWEkMAky4EMU4HReuC8LxlDhkzbGcgjjy7lRYVp5UYs8G4bwGE+YnF8cdJf8QsxA6UeIqN
	hFPq3tCB320WdAfQoJwMfOH+TSAoYP6ZCmEX81kzwpzjDcGTmIPQ8se1+RygcBmfFPjUjj6QXh/45
	wTpXw5+J2l8XivGJWtMy4gfJjeYiVhTpnKRLwkU9HXeZE7eWlXxwCxo41OMe3Qkwv5FYlNWiH+VJ8
	qEKP+LHAGDrdLRqd7rW2/fMnHwOr5q6cc4ed7DiBjwcswSfZTbAlEtAyvV3CbBPoyNuskgh6ss5by
	j92LBFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Pr-00000006fQ5-3g7j;
	Mon, 02 Dec 2024 15:32:51 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8Or-00000006fIG-0Irr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:31:51 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-434a044dce2so55568685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733153507; x=1733758307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=IfYVFOSUpzuAHGS+/D1WFDR9ofomHQj5aPWoFm/EQfuyIUTekqpMCmcuP3tI5210dC
         WTtJvZw45/s3dNIkewrwNm9ol0CZPdGVDfbGIrv5UanuXwU5z1HYJSnGR+c6rGXSx/KQ
         b2CVJDGMg4z6zs0xFlHRgoMl6AckgXAycxE+s6zz1t99gDR85fKMs/FfXSbKqloTp6m4
         4QmPqrULhqne1blfTUkaHdrhTZ9WVqPrMer1EyToSjMk3tlLy/2mzFJoIcHSvVaHuHzV
         Ke5kKa4lPyjdy2FO5thNK8tLfJEk8KZMuoQgMpnCYGXltrNL9+hy+AAofYt2IkmZscL0
         gIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153507; x=1733758307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=G77PYv+c4mOYYtWLd3iKonRqICML9BG17qVUR6PUPwTGbJX/sbUzKZhUY8Smk2chht
         arowyh+leID6rF9NfpmOGbhdW2nPEz+ZWZnGb/EuWOBZMrNoFOFbmDec0jde+jFkUSNq
         DAJNCeWF8Nqgpa5gZvht4aeRTI7hDhh4525v26dxmylpwFTQunE3K1uspUuiPAsOjr+d
         SmVhcOQpP+uk0lcBcztjhcPf1WaMf9oSop5niRPyPau4es+ot0wsHzoXfH08klwc0qY4
         zkCl0xLtWM9KRnxsVaB3iFkgPpMPi900RvVHzsSEkgoafQwuuzbqg2zXg5ZL4JTw0KxK
         RmoA==
X-Forwarded-Encrypted: i=1; AJvYcCXJDYpVt6xX/JlHWnCjSaFwILq/l+6XWnXP+ULrxvvRFTlC5Hbdrn1a4Xwtu0cWuePW6zeAcv4nr4pnJy5VjTkF@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPZsjmJA4WhZGIgNoqtGMvM3Menueu6wkUzas0FFBAkLgnR6s
	CnnTId6gBJW8f1GYh3WiAgCi0/NSwE2hLRPsNQzb5o9q272kxwWA/qgP22ZFWSk=
X-Gm-Gg: ASbGncssTDwHAvJnYrJokFPhrE3nY0pJTcahGN7Kt41RJGLRCXLlNR7OlgOUkXv2yt5
	h7lTkI35RFxXEzXRbKDyteOmxHgbLgokxgSAET53FiBq6CDqoHEqFXKezVSJRzhvuRqgM5xc6aX
	F1o1A3/wOUBTCRi7dXZZ1GNIYU0IfjWPpV1okwP5c8ZgiqSJH8jOV/fEmMRGismP2QtWlLDRtYB
	TDYkCkzA1cXm9wdL+m+RFRZ5Ff8yQ5xhUC0hclvctNVnqr5MLMKh5g=
X-Google-Smtp-Source: AGHT+IHMBE300Bcm54Mmq/v3tBkO0lxgfJUVqj14Z7wnWfcFOCNvI3wDAreuaFWCRfOaW1RTUGcZhg==
X-Received: by 2002:a05:600c:458b:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-434a9df7b85mr236310305e9.29.1733153507008;
        Mon, 02 Dec 2024 07:31:47 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:ebc7:b34e:f4a6:7947])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5dfc03csm105063765e9.2.2024.12.02.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:31:46 -0800 (PST)
Date: Mon, 2 Dec 2024 16:31:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Message-ID: <ecae7326gzjpwpg4a3ba2dgddh4jg362ybsf64xla4lyff3mk4@x3q6bocz2car>
References: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peon3ci7jqimuqo3"
Content-Disposition: inline
In-Reply-To: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_073149_321180_791BC795 
X-CRM114-Status: GOOD (  16.58  )
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


--peon3ci7jqimuqo3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sat, Nov 30, 2024 at 02:58:11PM +0100, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/devfreq to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> While touching these drivers, make the alignment of the touched
> initializers consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Note this patch is obsoleted by
https://git.kernel.org/linus/e70140ba0d2b1a30467d4af6bcfe761327b9ec95
=2E

Best regards
Uwe

--peon3ci7jqimuqo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdN0t0ACgkQj4D7WH0S
/k6qNwgAiyaoRUBzt+ES/sXpbjU1ikMyNnk8Olj+yqwh6q3TT7T/cGK/mJZ+n8Jx
Kf/b7GtwcRk3RScaL6SOlRNRgJCTKyfH7s8Ko1mLum0vsaTXMeCq2v3LWmKvMqk8
IKYihoDhPxfvbFrY6VlUixTkGip8fHGONhs/PShKhoM0Q5UeBXRq0jtssisQqaDj
MD4pC+pZn9OtMP1OzIoYDm9txIY+TIQfYil1fC3HJLrS+i19CGizdK1R0gaJPl4t
YRrVt/aAZ09xtLiGt1FM8hS+DbwwIi4/t5eYPFEEzUMxFE1IAMuSkiwcr2GIQ2Wg
9eZ8IqZADcB+nKoGJhVo+lkPfeR5fQ==
=TKo+
-----END PGP SIGNATURE-----

--peon3ci7jqimuqo3--

