Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A9ED0C5FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eS8rX5mMOZuM7iOmnVlMjMWTsDYulm8Wr/Ffg5REB0I=; b=v7mNxTiu7Yh7rvrCS9I7k91/3x
	c5NyZcqBChiSS4zVnq4hRNJRBzkd3bbLOLFwRlEKEoYAG6hW3f9AMH5PndOWhr69smlMEfUas2qZO
	N+EAt/NNyxXqpsDGWeRcUIVHcIJ1Yy+TRkiEC1vl9CC2KpQrCEOm90U+TI1eMnYonH71oPaL+wKcr
	8ebtrCuRikS+deNG91zP0TX0o6FnR2/hK3BiUzk7BOA4Fd4ogvxXtkH29WcKbLPKHjCY3egK5HRkX
	/PiI/wXOh82oj0LFMeNZoR+q+WwlZsYiQL56y95Yf2cZOhZDeBoxzfghim0e24jQ+yXzl/PR3+lW0
	NNTKVYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4H0e-00000003GA8-2SiW;
	Fri, 25 Oct 2024 09:53:32 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Gyd-00000003FbU-284R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:51:29 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43193678216so4331135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729849885; x=1730454685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eS8rX5mMOZuM7iOmnVlMjMWTsDYulm8Wr/Ffg5REB0I=;
        b=l2CvzaRCTEG+n2NfQOoF1B7V8fBavBGFnqIqKWeV6igKo7gqY85iHh7M0L+4SzKfb2
         3sAa8udW0XmxJS4tD8Yq5wPunb1UGRsKjI+QQazciaqm1f3hEXoBCPSqkUKm8FNln+ho
         Z2LR5EGmaYyRiWmOylnez+GN7xx79eukkwz26Kg6gacoU+3uJ66uM1l8T4NtQxOhJvr3
         xeCl+usilApEVNAFtxCypsHZmT3WM5RMeoZRp1qs09EaeLcmptMs2MgqEAGHHY2C264J
         eVHTJcPI1efEjSFr1T95FZLX8u558bYrgdEK7MIUE7XjCJ8RTse5uEdPOwt+pLQwGrvb
         yZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849885; x=1730454685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS8rX5mMOZuM7iOmnVlMjMWTsDYulm8Wr/Ffg5REB0I=;
        b=njXrKpJUp8PwC3WiyTdpFx2gU6lnyjJ9rnvUYsFTQhEzpeZq3awNVbot579An4J0b3
         sat5cxzqzjwUdJSP2QGNDAQDI11l+5hzKVLQbk4A3Y7dy5FDN1OQ5C2KxD4UToNBUQgE
         sWEB5O2vAQS1BeW8zkqMI/ey9/c3ExMEjx0l915y2inBDTUiqoU84llhi/nXlLcXTpvu
         UvYfbrNOoOpp4svzpp52SYgddWRfbInj6SNTvJNN3Mx6XA++lJPeuoZWiqDl6gD7+Qju
         Vs2Fg9AohtVSz8HZZ3UC5EvzvHVaWsaOgC4Q4BZXneF+zmm/VCPu6KyqEMIl7TuldZ9P
         QUIw==
X-Forwarded-Encrypted: i=1; AJvYcCWQm3iEM8CmynhVhmWLcc7Y+qCXaiHmUfl21Jv8WsIUggtgluM7xgzx5bQQx3ubZDZzugS54KHlc+BeEb4+5LF8@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm1AzVr01MrqyJG5Jjx+1pvcjaaDN2naCY/XM3kW7KRwadRVPp
	s1y4IwsMY0W7XvJS1RrC4XGjYlYN+FRvvJRvzHb9IUfMG+yocZuxHe4Pq8KEORM=
X-Google-Smtp-Source: AGHT+IFDV36MWuOmWTSfdyoZelQED1y92jdFLEPG7iTL0qbLzm4EM0LgHmwk3kn2qqGpjQjCt2H/Mw==
X-Received: by 2002:a05:600c:4f90:b0:42c:b7f9:4bbd with SMTP id 5b1f17b1804b1-4318c7568e6mr46185845e9.26.1729849885628;
        Fri, 25 Oct 2024 02:51:25 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193573e47sm12984395e9.8.2024.10.25.02.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 02:51:25 -0700 (PDT)
Date: Fri, 25 Oct 2024 11:51:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Erik Schumacher <erik.schumacher@iris-sensing.com>
Cc: "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>
Subject: Re: [PATCH v3] pwm: imx-tpm: Use correct MODULO value for EPWM mode
Message-ID: <bj7bgcwkesq3ixhkqveduid2uaieiq2dfu3u7yq7wxemkde2j2@yejpwvdqwpah>
References: <1a3890966d68b9f800d457cbf095746627495e18.camel@iris-sensing.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sl7dqqmbdj2g2fww"
Content-Disposition: inline
In-Reply-To: <1a3890966d68b9f800d457cbf095746627495e18.camel@iris-sensing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_025127_634893_E3CA3DE7 
X-CRM114-Status: GOOD (  14.12  )
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


--sl7dqqmbdj2g2fww
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: imx-tpm: Use correct MODULO value for EPWM mode
MIME-Version: 1.0

Hello,

On Fri, Oct 25, 2024 at 08:37:00AM +0000, Erik Schumacher wrote:
> The modulo register defines the period of the edge-aligned PWM mode
> (which is the only mode implemented). The reference manual states:
> "The EPWM period is determined by (MOD + 0001h) ..." So the value that
> is written to the MOD register must therefore be one less than the
> calculated period length. Return -EINVAL if the calculated length is
> already zero.
> A correct MODULO value is particularly relevant if the PWM has to output
> a high frequency due to a low period value.
>=20
> Fixes: 738a1cfec2ed ("pwm: Add i.MX TPM PWM driver support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Erik Schumacher <erik.schumacher@iris-sensing.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

I let it sit there for a few days to get some coverage in next and then
intend to send it to Linus for mainline inclusion ~ mid of next week.

Best regards
Uwe

--sl7dqqmbdj2g2fww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcbahQACgkQj4D7WH0S
/k7y1Qf9G4+8zoyZWisqpY8A+jAeBGbPi1/KL1HUprlJN2yFlbZ4lyvECyFr2yzj
UHP5qZiEvwREAnytE93HWPUdr3WJIgCw6Qxa5fYKBX/KYZ1COZ3orrasz+EpTk6P
L8ve8uBsuCzALHBmtPeceuhYk04Qg5/z7ybqhR42G/+PG25V4avWrvsb2w/Cwttz
StADVmVE03DhKoswdKdte1NkZ85Cq+H3pO4bykCA2SZou6mVqOV5CE+amJ95pzgO
jniVWLVJQRM750OSB4jDWG52GlEwswThV2eL6uUqiHnZhuuAd/AhZvbmHG+Vwcdn
tdcYKNFg6UsZsVKSZOxMfO/C74oHiw==
=jWQ1
-----END PGP SIGNATURE-----

--sl7dqqmbdj2g2fww--

