Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E398C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 11:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FAUuYkKzKbrrKb0ZtaRbfH0JfxAr3PFg0MM+Bw2KxlA=; b=LrZ0fk5r9euMsvj0O9V5uLODuB
	DwiWBnFvSIfa3PKve/xVkGg4NhD+ttGZVXmzwc3MVj5KcytuxbsUrItzkH0i0QFokSxS8z1myKOPF
	DtMKK4YDr4WhJ07rWExy3TV939/s//q/HTEYoTvIBpxulmyl7f4D8b+Ty6fm1zfo8QpqDWNxkWIuy
	BSeOoFid2aCweNhZHeALRJdbvdtV17LwJLeTkvzF9KUzQINyw+udCRsRzGbqB0RQtJd9YRTuTFmpD
	k55f3HWb70PAN2q7AMN3dRGUfWpiW4cKjlKjgQX0wtefcRHm34DK0X6R1F7X+e8ZsJHcNppGNFiIa
	qOFH2gwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrjB-0000000EATk-1wbb;
	Thu, 23 Jul 2026 11:36:37 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmrj9-0000000EATK-0rvD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 11:36:36 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba320so819352a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 04:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784806593; x=1785411393; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FAUuYkKzKbrrKb0ZtaRbfH0JfxAr3PFg0MM+Bw2KxlA=;
        b=iw87iTyYSwwxgbuZcdPTKGw18MGIRsCtL2elLiCJ8hfYRk3Jb8yAsuHHriwY+apfxf
         YcgKbpBi4dAm2ECJpRgE2S4/JY56/33NWJTfiIDAO5QV+5a1IbDbzeB+ztueviT4QWUG
         ZFLvdfp2uP7w9PCWHUik9u7O1jQkv6MKnGRMwHTxWwVTFRLPmx6LF9bDXcuGw9AVxVmD
         kh6+NCksS8XivAGcgN/Bp2Tg7z/Rm9SvUGqtC2UEKS99cPxoP+qojKMnTiiR5Akwp7G+
         SNECNie2qj6aGPLps0PrBXfa76IOfRfortjtevPHcqvsT+PeBMv+IvCJl/Hf7mLndold
         TNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784806593; x=1785411393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FAUuYkKzKbrrKb0ZtaRbfH0JfxAr3PFg0MM+Bw2KxlA=;
        b=pNYGExCcUtwxEf4zcP2bMersaNkdw+XbM1SGTJSgcKUyDXGKuxWZTIfP/KTrFcPDHo
         qtF2hgiDzT0Ch9ms5jyqn0KmqzUpa0a2gmg8LBR7F3RGzrgBBeQTQmd9SajzVARdguEy
         mJIConxJ3G3q8fmgGcpNTlQNT8urferpuxCM30i8D5+/51oEfDGBPG0Ua+zR2SEeDdtN
         7uksksVoUprMSUSXUSkjZ/1+pY18Ug9xfJEB/cp/jK+Awx4xxEnYNK4lna7vsY6KQ//0
         Ryn9cwDtxoYwDfcbC4Et9iL7hqv3JrbK4CDkMORUCRTPuFDVbwX3GVFL81/F1+uwwGYG
         Wr7Q==
X-Forwarded-Encrypted: i=1; AHgh+RovRWsrDdLIAv0nByfJVDdnNCNkONpbJpuYjLYjdri+mnytvRyStD5KnkSGi5Vo+5F2S4RyAGqADv9vORbqm0HP@lists.infradead.org
X-Gm-Message-State: AOJu0YwqotWpn4X2H+F4/1HlYiE3KJF+yiZjiadFckCALYsnUqBEhHtD
	e5I2oau7HrhMr9FFDOfLkWFGziLD7ALdpNjh+5vo6g5ZnIF6pXoDlYqAiuIxCvRSRQA=
X-Gm-Gg: AR+sD126O7BWOVeZijcpNeVXBCYsAhSg3ifPYMql4q4xaB3FQKH3wzjaRgLpF7rV/o8
	cUJK2IDCdkrGzYPdhpsS193iVxB2WC1FfSJtDdSohghhC3Z/wGhOFT6vATta1rWagjTnYke9efv
	BPG2gXlwYzrf3H5H1+xxsfCUkRhIKSiAEr2iNIQIUu+AOWVkc8RUe3ECenp9TVJDrfhQBrKlST2
	DaLvRay8SiP37n23IcaPjKmQ+1wwePB9miT/RBSWFhPTiU/+bBUkxGwLJF46FEQ5ak0XdMDAUX5
	WJccm9eg97FlVrwkRb3m7WVlKrhBk/04A3SCaxrqVzbEmZm0euwRioSmQgOpdJ4Tm8N4K1b9SnB
	1xgejlXv6R1x3lLy8Zj6KLq+K7FJt1Ip2C8m0WwxWKsclTl0oeETSXR2mlTCnVwp5rTLgLASOEp
	M4CFH4E1Xdh9dg8Xaj6SNIWyI08BCYWPXmBtFeSiQ=
X-Received: by 2002:a05:6402:1ecc:b0:698:7418:57a9 with SMTP id 4fb4d7f45d1cf-69f748ae779mr1009923a12.17.1784806592716;
        Thu, 23 Jul 2026 04:36:32 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f350377b7sm1980490a12.27.2026.07.23.04.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:36:31 -0700 (PDT)
Date: Thu, 23 Jul 2026 13:36:29 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 1/7] i2c: core: add callback to change bus frequency
Message-ID: <amH8vX-M6lAWajQ_@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
 <20260719-i2c-mux-v12-1-a5010d623a57@gmail.com>
 <19dbf4be-5f17-46b3-924d-eb24ae41fdd9@lysator.liu.se>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OVfm+UyA/qXeCYnJ"
Content-Disposition: inline
In-Reply-To: <19dbf4be-5f17-46b3-924d-eb24ae41fdd9@lysator.liu.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_043635_284485_BEDF2835 
X-CRM114-Status: GOOD (  25.98  )
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


--OVfm+UyA/qXeCYnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Peter!

On Thu, Jul 23, 2026 at 01:03:53PM +0200, Peter Rosin wrote:
> > + *
> > + * @set_clk_freq: Set clock frequency for the adapter. Returns the act=
ual set frequency.
> > + *      This function is optional.
> >    */
> >   struct i2c_adapter {
> >   	struct module *owner;
> > @@ -742,6 +745,8 @@ struct i2c_adapter {
> >   	struct rt_mutex mux_lock;
> >  =20
> >   	int timeout;			/* in jiffies */
> > +	u32 clock_Hz;			/* bus clock speed */
> > +	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz); /* Optio=
nal */
>=20
> To expand on the comment from v9 by Wolfram [1], I too think it
> would be good if this function pointer did not live directly in
> i2c_adapter but instead in some other struct so that the actual
> pointer could live in read-only memory. I.e. if i2c_algorithm
> does not fit for some reason, a new function pointer struct might
> be called for?

My objection to move it to i2c_algorithm, was mostly based on that the
algorithm should not be aware of the current clock frequency. When I
reread the comment from Wolfram (and you), I realize that we are only
talking about the function pointer, which is fine to put into the
i2c_algorithm struct.

Sorry for the misinterpretation, I will move the pointer to
i2c_algorithm and keep clock_Hz in i2c_adapter.


>=20
> Also, returning int instead of unsigned hints that the function
> might return a negative error code, but the new code in 3/7 does
> not handle errors. So, either change to unsigned int, or update
> the support code in 3/7 to handle errors. I think the latter is
> the better approach.

Agree, thanks.
>=20
> Cheers,
> Peter
>=20
> [1] https://lore.kernel.org/all/ahX44_rzaRlTLSLU@shikoro/
>=20
> >   	int retries;
> >   	struct device dev;		/* the adapter device */
> >   	unsigned long locked_flags;	/* owned by the I2C core */
> >=20
>=20


Best regards,
Marcus Folkesson

--OVfm+UyA/qXeCYnJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmph/LgACgkQiIBOb1ld
UjImNA//dFlLVBf+3iuSWVyzi5/TaqJrTyo993+vC/Iq8vZPYcabFRIM7vl7+adb
+df/fj8ph8NtPZAmGiaq+da6i6bKEdVowVEgrD/sactK6PRAcxFxeNMdHpKgsaY7
HnOAf8YEFcwjZ0QPoQimY5Idh/Qv0NTw8Pf7iPIvPfFxBuwVKT5XDB2ncoccxjMW
ezPMdzk3sBED7xPcys/Z6Qeh41EdP4ez2uRfWdDaPBBJ94kEY3LTuEDX0oCnIoCS
y7MBafA2mqwT1bAuZYKOAqBCzqgkx9oiGN9gWH7DWrPpj8l7sGO3BcsPzJ0JlFNo
VabrYsyPA84qPo3Z6ZAb9uRbnrIlVmr+3sfAmBJfJ//1uSRfY3RWqelps7XZrt6d
oO0NX19S1rXeChsLEcT+YfCGXE2a3Jdnsy53PDvCduUaVyUs/euPjMacICzOfbQm
Hbv5fUTEq+rej6BmwBpAcQxaap0liwf4qBF7vzgKJIxpsMa826qM83q7x4fbhUgn
Ph/2jvBQFX0v5vdME4J18smKjXQalggtU9dxREWJ/cQ42JYh7eG5iaTD8wr+7K4y
Ing9Tm5Y5kRBUAs3oRvgyAoPQkpxQagvaqJ7H0fzDNTF5djqX4F7h14uk+zB2XOm
qDrt7QPJNmHqdzSBAj5okLUlhMIp9mFuMiAPlCc920QS2yfBSms=
=nf2D
-----END PGP SIGNATURE-----

--OVfm+UyA/qXeCYnJ--

