Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A70C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7HD702RfpHXjFSS9LnmCasnaIsMWIVtBEVPu04XVSc=; b=0egNUXgXkgELUr1wPCUzUL1V7O
	x54rMBTmPsrpY1JgKrko3GNulzgw6Gx4uGMnQ62OHGvQ4gC4B0xfotQJjZa7J4nLIfuiQqI73FNh+
	Obvgi5+rVQ3C9sggDUfzf1JLoSsj5r1ZZzclEJQeToffvrlOmw2pwsV4eRadSv3bDOUGAM8QO/cMT
	iZrbSwjs6SG18mUTrovAsuacjOldM3kHRHeI/INLEZnvIEUZ4RbT9hPTCyx/og3ITFz3NoiUT2Mq0
	LqfNXCIOPhvI0N0dnYndQuBBjPJBUzLafN35sFoLXcqQ3cR5UU8jiHyAckUToZOfrIjgrNBR65j6M
	XZAqkEcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2NJ-00000000Bwh-0RnE;
	Mon, 03 Mar 2025 09:46:13 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2KN-00000000BHJ-1udy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:43:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so9683515e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740994989; x=1741599789; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I7HD702RfpHXjFSS9LnmCasnaIsMWIVtBEVPu04XVSc=;
        b=qfNuA6iQcsIg4s2b5I2f1Lhwbm1i4xUa3hIoXckc67zlFpY51O9G0quYLa4RJ/Bo5/
         qPeonTTxPIKBprg8AF6SAC/WUH6Q+yV3rSNMCS0xfieKZT1oedmY2ozV9z7nk+0NPxpA
         /5RNyrbquFOspKydQ3SSFUJ3qeeppIkojgFhclQvHJ+yNlobAX2uUXQq+86bcVxeSRqp
         s7+OncoS9TGYVIdLbagDNOf/ZBBOc3hRmVCNWf23DJwvKn49VGrz993x9fyyW34OuyOY
         hJCeI7N9bQ7j0NMK/Ele280STlaGWsKtsnJf0AMRb4Ly4nHHAuEzH+6ksauPy2fh5Y3K
         ik0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740994989; x=1741599789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7HD702RfpHXjFSS9LnmCasnaIsMWIVtBEVPu04XVSc=;
        b=NLM5Pozg76wf1BrWvtsMDYrlU4ppGMeb2VJ7joPZ8CJrb5Uccwum+SibHfRLafDWaB
         PUxvsMH731pkLAymnuG0fcMpz+6yRHZ+tUebaGJz4UQ7qS4RhNf2h2OZGufnC6OTtpHz
         LxAPzNY/cYz2v6MRB6gwHLRjXV/H443bxlIZxk+7y35fXwzEo1q2ygE55dW27v5F2dPe
         I5DCe0hirVnUPIvrTWIC1QuVAh2f6iF4WeLpOYhcGY5RXA77foe+Pb+ADUWAPI/A2E0v
         tmeV6UwfGkTob0pQcFG35wMX6fO62aWLPIgoI+pFiuvjpLTVqfkAUhIVPjUgnteGu9FM
         Pqpw==
X-Forwarded-Encrypted: i=1; AJvYcCU0iO99NTwi4Z+VOtiMWPiXYcKqyp1UxjUSg04EOMedZKYWBWk3tn2Hlb2Zjn2IssIvbFjjkHjscJ9S5N6ZjBED@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6dxJmOJ7i4DyXA7S/ExHRGRcrJ7E4MXRN61h20j/qbzEaERMR
	AkQJQdbwxs2znkT2Apa9iqaynNRtKSITF60kuSWOY36M41zcCH1pUlCs2SdUf6nz7mNVAtxss5C
	qnGI=
X-Gm-Gg: ASbGnctm2DZNbTtYjPd/aG9W3cbYLedOpdDxMGQdKKpZz/teTWVywTXo9MTNgX+eCae
	sRbK6IAP+RVbiQI9TdIrha50muEpOIJeSE9vmBX5OTmTvqJXQobBUzs6lQwW68It8+umgEqpc08
	6gHiTeTcBQ4vUeIlggMWOoi5eK3oCPHhOerK5phi6t3FgoWsSMWoME8CdjvAoqKG8fTkNq6y+RI
	NZahQ0Bff7uZUfgJxre6s6+ejYab0USkYCmvK11MBVk+KuBEE/s8m32+EXDdffGG3SHJ/JCubfa
	H82eaRC+EEwzZEgewRxTy9YFx3OllFWE22IZmimFteoCqeoSaqyMCYiSBy8nnmz7rBEaLjH1k+E
	2NpnM6b00fBtXkk9Qqr2+HN2QCg==
X-Google-Smtp-Source: AGHT+IGioXL+ceLlmWfZZmydFoO+5l0CmYAT/WRogvwkcEnYKD7My0ndm6CmTHlXPf3FtWobh/14Lw==
X-Received: by 2002:a05:600c:1547:b0:439:98f6:8bc8 with SMTP id 5b1f17b1804b1-43ba6760ca3mr81796515e9.26.1740994989516;
        Mon, 03 Mar 2025 01:43:09 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7b6asm14251498f8f.51.2025.03.03.01.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:43:08 -0800 (PST)
Date: Mon, 3 Mar 2025 10:43:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-pwm@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: stmpe: Allow to compile as a module
Message-ID: <miozabyaeoagqrw7evl4c44augcfbrdtupf4ium62xz5kb77cm@vndlz2rcoyj4>
References: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dszzsrs7iiegpzat"
Content-Disposition: inline
In-Reply-To: <20250215143723.636591-2-u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_014311_491879_351E3A38 
X-CRM114-Status: GOOD (  12.72  )
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


--dszzsrs7iiegpzat
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: stmpe: Allow to compile as a module
MIME-Version: 1.0

Hello,

On Sat, Feb 15, 2025 at 03:37:22PM +0100, Uwe Kleine-K=F6nig wrote:
> pwm-stmpe is the only driver that cannot be built as a module. Add the
> necessary boilerplate to also make this driver modular.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

=2E

Best regards
Uwe

--dszzsrs7iiegpzat
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfFeagACgkQj4D7WH0S
/k5Q0Af/fTmRfYYk6lWXxsIcFhHDAF6paE6ZWIq5+TiCzoRCcX8S4fiH92Kmz0kD
FcFDNskZuj/MZEUmfQ+xXClJVwpXTEhZL0589ALzo8uSv1FNZUg2tHk/tPT30Rxw
wfNynJPHkyO4gVQ6dm81qJ2e82VI6B85KNxN54DkJphIYhynS/OstQdsuT/kvsFf
cT1ei+v101ww6s1ycVH44lrCbC06sb9tC4XVkS3ZCQw443EzJM2A4nIE6MrIdLsa
A8pb7ggUHf/sUtQC/BDssdTAvWvq1hgXDDQSnVpuhg8lXhUyAW4xeoCZan2mFPrk
8nJ2zdNMDZPQ4WWaLC8jEJy5z4syUw==
=Uees
-----END PGP SIGNATURE-----

--dszzsrs7iiegpzat--

