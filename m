Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92809C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=; b=S75Vv1URwLc5mbsn5tT2g40doZ
	yLnG+Yksz2K2zBcTdEHgB9+EkfE7HJMnDT+eeTuFAkDkoGcLof6XDDiMccOZplL6KQaHPftIOePZb
	aUxSt25KvVK1EoS7n1TAUyncd1Xr6+1QT0dBZljsFMjhdcg/1UWc4QGQrmRxuNEHjBewY2v5EIJSx
	d17MP+Aazzx7H7Uy9EmUHIUH7NJb4XaBXMA0QXpMqexQnyTzrgN/OyAF23wpIalzoqe8aUih67vB/
	DHh6IIbHVgiwrIf1BzdqQGQYA/DDOCTL8zHt94722qR9M2NJEZdT3VX0z4p5gKkN4DqvYTrOo7+Pz
	LlITBlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAXM-00000002Baz-3GKI;
	Thu, 20 Feb 2025 17:40:36 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlARs-00000002ALP-1BUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:34:57 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so8766945e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740072894; x=1740677694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=m0l+c2wd9ETCk/gRoy+91eyZXHWj3AV4kVMdSfyl1pGDqSldhB4s1D3ULVYQVat1eD
         2+YP1HovHjc582XmwQE1YVwyeL2mllPZIUngGJgI3zOX5ar2O/c3knOItTwah9B8+YJO
         YTk3VTC08Th/UurHwjyGGGGQ5/sLhYhHxqVfVYHkd8cn+GdmIJLN7oXct6Ffqj1BYXnQ
         Vu37qvrqdw6Eiq9pX7h12Bu2jnhzRVoa5J7mg52gEuyI1yE/B2RwcacT3Oq7+9QjqNnr
         dOUMkFlJlTTevMUs+RwhWuMXr2UtJA+hbuSDldb9vRmWq7ZYflfEGqzdB9jBSj5VUDVn
         kA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072894; x=1740677694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j5meLBzlPzoYaZHYVuzGBPkwAKe4KxyEluapquIWYM=;
        b=N3nXScE7mLaMRlPLsqFKISa3qc+ROxfFV+O8pd69w6s9CZ3ieiqfvLoUZzKPL7ouMB
         SKYRxxgvoFuA4anYjE48jTwwLVPHA6zcusm3xdnUk+gM656NkP76U2zRdE1WSa+9K6bX
         IhtjymAQK4870ltnAasJ9MuWzTSFziviSEmq4rbQETx2sR+qWv1UhfYSNMtnvPiATI30
         iKM8WblgbY6Fb7hgXbCNH8A7ldXkgCVer6MK398+GzGVBtn/Kn9r+tdbve7n7lwBd+jS
         vCMsOF+zmo9J92fK56oR9ckWrUjLc8K4vm5fv/fHa0SjSn7iQnXOQCwIH4/8nQRRGJCO
         SPvw==
X-Forwarded-Encrypted: i=1; AJvYcCX8IZXQUo0/A09Q4wXHFG1MbYnF6rHDsTwCLOPAx0qWQ18isrm9CoxwlihF4npczmp7ZPh5Y/9QFUe841iuZzTB@lists.infradead.org
X-Gm-Message-State: AOJu0YypBEqQdO4dJOjm1RvxAofgHQEKDzedSt48arrNQg4+Jp+kBSm7
	A9T8EXcUVIR5O4Bc6qjkPaMESbl1m+YGdhwig0YeB1xTcfRLX5p3
X-Gm-Gg: ASbGncsRqe/XRRb2F9JBebhpxP48lcWeUsEKKa5fJloDkWeS99UPgmXpwkC1PU7BvHM
	HQMH4HcqFL/bBUXChLIM/Z08dx02qU9siLBKY9pCibeLrpPpH5kBZQDhZCxBisDilBTQzdn72QR
	UyYOYXF6Lt0/I51Y20XbJLfV947rlPqGIgXoD0gcQgmYs5VKXpqRJpzVM70NNjMgqoWNgxAz7tY
	QrOHOdIW1tP2/At0ExqIFqrjHe/OhS0JeXRjp2IDFPwCFLLE4BAzc309sFnT3pMVZ84hA6spDv9
	7DY2DEtYvgzYQgQWcdPHzL2WD5uH28hoVNI80PWtil+XhE3yak1X4WZUSUcYg8caN2I=
X-Google-Smtp-Source: AGHT+IEPmmiKlS/ysPrkAIpR7/izG7EDUAs9G1mfa/hbF+C9JMVOv9VrwAD1oHez+9k3pqPo2/fSbg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-439ae21cdddmr609075e9.20.1740072894371;
        Thu, 20 Feb 2025 09:34:54 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43987088ecbsm117191125e9.31.2025.02.20.09.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:34:53 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sunxi@lists.linux.dev, Maxime Ripard <mripard@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] media: cedrus: Don't require requests for all codecs
Date: Thu, 20 Feb 2025 18:34:52 +0100
Message-ID: <2235304.C4sosBPzcN@jernej-laptop>
In-Reply-To: <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
 <20240731164422.206503-5-linkmauve@linkmauve.fr>
 <b3ab99a1-2e72-4b7e-8569-f7fe9beb3018@suswa.mountain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_093456_317610_25EE4D02 
X-CRM114-Status: GOOD (  12.33  )
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

Dne sreda, 31. julij 2024 ob 18:56:15 Srednjeevropski standardni =C4=8Das j=
e Dan Carpenter napisal(a):
> On Wed, Jul 31, 2024 at 06:44:14PM +0200, Emmanuel Gil Peyrot wrote:
> > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> >=20
> > JPEG decoding doesn=E2=80=99t need it currently.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
>=20
> Does this change have an effect on runtime?

Ideally, driver should allow only JPEG format to be used without request ap=
i.
Other codecs still require it (decoding doesn't work properly without it).

Best regards,
Jernej

>=20
> regards,
> dan carpenter
>=20
>=20
>=20





