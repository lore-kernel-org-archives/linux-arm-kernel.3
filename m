Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8E4FEA81C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 07:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=; b=YwbfawlIaZV/uNQguCyCDTydo3
	kNlgMevQy1V9XxdsEFpQIg47ilXpcqSLioqpyEMyO3u0v9u11Ecg2mPuLRt+ToJTpnzaUrO4GfY5G
	JXkIA9urXp5y1H6iFHTVws7Wi+CR6acBLBQa6B5PZ/PAL3e1l71ETXirljxXbZ7v6qrcZ4w+0Kxdo
	gqzd/iWMNEbTMrUHGzqL8YQgZapqtnZsf/M0Jbogk01zkV8cfLH6doAh5NZh2AjW3WWw/13tqaAOz
	sFHW1XHMqr7hFVWX/TMZmWC2wkBWlmcz2HOZ3udoaaNlPr4bypmcEprIin58DSVsB9upjM52XLpH4
	6up58eaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IRQ-00000002q7D-0coX;
	Wed, 25 Mar 2026 07:14:12 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5IRM-00000002q6f-3vnj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 07:14:11 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso2736235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 00:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774422847; x=1775027647; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=;
        b=yaGKvHHRrx9gq5iD5EBivgc4KqFOKNGiF4JrupxxiFka+JUOiSNifz2b2/EttjhPYv
         OI0rRnu/6EEp+DgdoUnXsmgYVTjB2/xCtIN+x7ywAOskGVl4t0TPPBwuWZEwxU8D+9YI
         2w4gGO47qTBSTd9omPmpRlBifuMobschgXICMLUQV+2cJMUtEPdBc2TRlefE+mgOTHjR
         kSOSaqbY+4IYPFQaT5++kEB+sL4nGr6wRE60vRDabulE3NEIjZOBZE9oH2by2p5rqeso
         PSmJBNieSXRbAij4kaABoZia3lmBeM8zZ+Y6+nanBPAY/fN+AiZdsTNFYVJEoS3L2bWb
         KUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774422847; x=1775027647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fkr6ntC5TQeGRAuflXX+PZEwU6WuhtzwRMBzb0AtdG0=;
        b=tRloSNKVmHQRN6oaC93Xju+PA1HrHW26+uxFGhvRQKV6k617mYVToo3V0zgSpQMset
         XwzReo3Nb9qcdoN215ujGMiHzQi1KdGspP3nwnGJ9am2GYXMRunq7YwOa9hKb9b9R6Fh
         uh/PVGeAnpsyEb8g+0uJtveD2EYakq7wDz+ayXRfCmsrJ66LM2dW3wYNpiXhdgz4C3WD
         20Teye6y3m2Ka7V/weFQh2bgbUEb2SusGFuCx/uhZjmCru4vyhLrjpezi42XpPpNZUVT
         OjtEAvxRXmoRDQJHvG5vr/wzsrjgbGUU48hmcAQqyboeNslZHYWGTU0xQOeKz4zfk6Wn
         VUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9cgQJcYeR4fAZV6SVwWUjm1MOUeXffkVc5jBk4DeB4z54QmESMGnspV42VjUXiiv2k05GT0+9mM26NynCHXmE@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7U4daCWN1C1verlD4ikVgZswcYQgJhKuk7AleCT6QUhojVeZ
	gM6gFNhoLkIERQezBmrEdFOgrBFKzPztv4+7sNzMTK8QaqQaD00LhaUhrFryzaTPpIY=
X-Gm-Gg: ATEYQzzCw1EsTgMZ/FcuL6MWqv9l836Vh7fnrM8SNB1ZzdDNM8cQPYTi6z4BSoSh/J6
	Rw8cJoJu8D1f8y7j+FcCHktcj+o0/GBxz1a1ZgwNriIlWnTirPmWUCYBTslf33eDh9G/Oz9tZfp
	6hmDf+y9ID9am0kxQM0C/1zr2bzsKYTDNfCvKntDH0ccgSxOj5pzjcWYSTUfHbz8y4maBSIct7m
	dUqNHCtXt/RwTHahj9juO1ETB2DMPtckRnEFtSPPxljaZs83iFQHP/xobMtEi6kWyaJe2TX+dJm
	7wclRpKk9vjDlOdK8nBmLQRlyvQ06eiw552BHzHxmBcbYUa12Pcpg7ZWes7NJg63NlwOzoH8TD1
	IcpIYrroItkTB5zQVcp3Mt3Zx1pI1ZX0MldkQ8TSgqyRzq1BBckdnQA/8pMS3igboByEDEIqr1A
	QDSENdsIVZn23FP1Vo1fRneio3mAeHX7NjMA==
X-Received: by 2002:a05:600c:888c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-4871608eb93mr26991745e9.12.1774422846667;
        Wed, 25 Mar 2026 00:14:06 -0700 (PDT)
Received: from localhost ([193.115.216.78])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48711764625sm111818775e9.14.2026.03.25.00.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:14:06 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:14:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Richard GENOUD <richard.genoud@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski <paulk@sys-base.io>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, John Stultz <jstultz@google.com>, 
	Joao Schim <joao@schimsalabim.eu>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <acOK8lTTyqUDkOUb@monoceros>
References: <20260305091959.2530374-1-richard.genoud@bootlin.com>
 <b47801f9-3828-4c68-992c-e85373576f3d@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xajyc235ccyd4b6n"
Content-Disposition: inline
In-Reply-To: <b47801f9-3828-4c68-992c-e85373576f3d@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_001409_264454_DC1AA5F2 
X-CRM114-Status: GOOD (  13.15  )
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


--xajyc235ccyd4b6n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v4 0/4] Introduce Allwinner H616 PWM controller
MIME-Version: 1.0

Hello Richard,

On Mon, Mar 23, 2026 at 05:27:07PM +0100, Richard GENOUD wrote:
> Hi Uwe, do you plan to grab this series or does it needs some further
> reviews?

I didn't find the time to look into your patches yet, but I have them on
my list. Unfortunately there is quite some more on that list, so I'll
have to ask you for some patience.

Best regards
Uwe

--xajyc235ccyd4b6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnDizsACgkQj4D7WH0S
/k4DawgAl9zebky6JUhsQcoYow/EocbW1XqWpz2vAU4LvXyj/0aQHwcFNmx+4DKy
6IvMXFcFuL4pueeCfijwE/tpUQDXKcfsj71O4CuoJwj0vaDNV/j0L6/UNYIPCwXI
YJYZ0Sd0JAL8BHluFBQtb2dd5oVwq04sETQUJ0IVH6TNEkU9lVsCM1nc9AD8a+gE
en1Jc9qxxLeNkNt7ZE01K5A8d8vyqR2iyq+rZgTGNrM9hF9Ie6Xk9wOwR/1J4qli
3tdzMjk/EQgFWj2mUkublabj28rl5M20evd/SgdL9Q05si+LeWcTchW3XyrZTgOq
uWWaKIZls5u84B0vW44FpG4l/XTcZw==
=04lb
-----END PGP SIGNATURE-----

--xajyc235ccyd4b6n--

