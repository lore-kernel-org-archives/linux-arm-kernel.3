Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3453C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 08:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=; b=MvC4aeSuMyxwOUXQaWsXYHFUzU
	PzuYR1ug8GHcVuKKO4psvduT1e7D62JZnmZtl67Y7tAg4TjBn/CR5JMebo3/KVQsZQbE+S7l2+MGC
	H7gRiLGvoBJtLDUCU3y+UOGGRyg65metTPddYbu2Wp5Qccigob/ZhNgw3oR9lH0euOhapnB8GJ0ls
	Jn8vAjhfOBcKKbkVI/hoDr9QKxAgPEewwJhYqkN9salboHmk11vKa06pWh6UdATzxeU486Wt6T/ZA
	G2U0ocjRwg9ytC3hNcpDzgWcBBbTFip2mZ9yu6YUm5xl+xbx1n/Anf2jH6zh83a9aKAFwR870O4r2
	KTCKPbjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVwe-00000004MGQ-3OCd;
	Tue, 01 Jul 2025 08:02:24 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVsP-00000004Lcc-1pn6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 07:58:03 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-ae0b6532345so1232965666b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Jul 2025 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751356679; x=1751961479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=M7wzQevqaFbpbIbD0zY2/33/gaTPiSY6OWzft1TpYQJ0aM63VjrSya9L0mPW+6qync
         5myBdXd6VOqgRK2JsqJmaMN37y20pB8hpNaBLD4fRAClzSkEjjKiwyvK80zOUsA+/vG7
         PbAV9MFCFebHvwPmN17gyM+YSdnvOOc0D+sDpi01i7km8vIgwvTtX7mTHa4mLgW2XR03
         WNDhBhNcV+DjUai2q5s3IC713vhWOIqfmxCZiRz1NBBjrOdbpN9mGEK+ps5xwJH8l2qq
         2P2Y/KCuTTRLDGGfYDBKo2SGvUh5m6F6oV1tVlq/sK0+NgY8kGIvi+za/hVuFbCeXMm+
         BfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356679; x=1751961479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=KtBXGias7TddDf00TlPTlywd0su+vgY8/i8c7fHo2EjjGQtac5eE6og3Qyw+E+kaNE
         Pr6EhwYbTsWdiu8WQH9mbUrJxfzusRsDAlDhTTnUv4QqfHPWVEjXW/Be1bKiBm5tU0M5
         uXNKpsU20ntE9WpTGz34Ko7BMOEScOqyT8IMqA/wJB/hhOahO0n6aacc2R50mRrBY1CU
         VV+t+qUlPIOkuR1XJOocKupLeF3iI+h4rXgWU2DzCBmcNT2SHcgB25qhOr22O2Qh5JAK
         w5EM2vrUH/JC9T4muPxZmjm7WKAolKPm5wOqVe0HUNL6SSb+/3Klv4CdTcpyBFjQrbUo
         PPkg==
X-Forwarded-Encrypted: i=1; AJvYcCVHJxnBdR9+SCpBG0vXlvHBVk1E7krFWNnZb9aYFZxfSkJeQvB+VJhNG0cytXCnrc+XSrJ0F0bBDqkFpRdwk/CV@lists.infradead.org
X-Gm-Message-State: AOJu0YyTcMmoTxdMi3iXIc+xivlDSv07Uq5KboA0dDrP6B5gJf877ra0
	dKC2VveiY6rj1EdDMR/PlGtiMAXQ3ppCt4hm1wYq9CRJDl+PWYVHglDtC1l0X29XKSU=
X-Gm-Gg: ASbGncvReTrtUnrqbQE9SapEdUYLmuUmY4C8mQE++oZeUUOJGSfFLEPb1oDlJO1fvvF
	Qm7GZGKeDGHRgcgwSR/KlPkCac5lTJLJzdkPH70rtEg0RL6kzhL5e+flzmY5mqSaD+f/rjhKLqo
	uQFt4HsGBE8EOcZ6jt4wiCPofTL5VjgxfJcJyP/5ubQ2wu/FECc1WwcE/MgKPxXSm5mL0PyQruO
	JvGf6R6O1m5EpVyMAa4WcSZm2IJ4lPlrh4nVZ6k4DKJBRBbV5nkx1Sq3ojSqukO4xB8XSAb6F2b
	3HMz0K2XrI9yolv3JahZxRtoKTXi4sbN1T4L7D69wtkEwb0D0P0bVH+EzhKxHqFaJBmVMDTVg8z
	+fZBezw1bd9+EEp95KJfh4YRaOeQQ
X-Google-Smtp-Source: AGHT+IGGrCAc15VHtma/sGYQ2QD6trb1EHpP/JN8l1psGDWhOW7Eth1ZId1p8Z9JxXzDyNqdoc0dkQ==
X-Received: by 2002:a17:907:3d8f:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae3b0b8fa19mr136200866b.28.1751356679310;
        Tue, 01 Jul 2025 00:57:59 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae35363a172sm808993166b.8.2025.07.01.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:57:58 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:57:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
Message-ID: <wzadx2ut3wjm24bw7ol4qjjeku6f74sp3tovtexs5w62ljesid@n7d2f4uzga6b>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvqu3sv3rcoezsre"
Content-Disposition: inline
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_005801_479550_2A4A65AD 
X-CRM114-Status: GOOD (  13.53  )
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


--dvqu3sv3rcoezsre
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
MIME-Version: 1.0

Hello,

On Tue, Jun 24, 2025 at 08:15:36PM +0200, Uwe Kleine-K=F6nig wrote:
> some time ago the pwm core implemented additional locking to protect
> lowlevel driver callbacks against driver removal. A side effect is that
> .apply() and .get_state() are serialized. This allows to drop some
> locking that is now superfluous due to the core's locking.
>=20
> I identified a few drivers that are affected; these are cleaned up
> accordingly here.

I applied these patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

Best regards
Uwe

--dvqu3sv3rcoezsre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjlQEACgkQj4D7WH0S
/k4vegf8DgkQ0a9kQ5LjlzCtQA04Tm1xfeP7UVjfQXVsJkkBcOU4mfdoSrU9tfno
BfO6tWeFYcUdJbCAPLDW0rtt/PLGq00m1Ti+DotG0ys5XYfE4C/L2gEcEJXEWdh5
teuOCdBWo55vAOj0OT+fFWSagAH5t1UJvOiX/XHUqS4do4wNVCUDo3oCG94zvqRo
t+cSZpO8iWlY+qK/wJu7rClU87CHx+WgtSs+TKH44z6SV8chWe2sh2a8bJzEYjLf
oCP3jZ6htcXuYiqQEyxRtyzYPvV7Uhy3tnshs2tS54Pyvgs6hYa13ZkPU9uSa154
6kyYGeshrOV0IJSJUvGmR+mfNO9lcQ==
=GkCe
-----END PGP SIGNATURE-----

--dvqu3sv3rcoezsre--

