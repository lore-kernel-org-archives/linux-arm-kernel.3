Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCE7D74977
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=; b=rM0xd8u+V7BBKszazo3akInDYi
	oZF1HAHmTZuMFe7rBxI1u17PXj2x2arHuspzXjUNwup0U5yjBe5dBOO8dee/mrr0zYWAR7V0/oPph
	hslAgC+FPEG6op4wBWZfkIegz0/dJ9XJwjxePJeTPTtMw+kWCLhtuKKuBq8DeJvEAgnenRj3xqhbU
	T1W0KaVsA/iy/WNnPSpI5CrVgZPWIave06BpnX/AvtGKIJ29/4JC0N3kSh3Vta3rGsj7KgGjTQEKO
	zgmCFm2zo3GnOQiesZjt887CLdfpMgogsPZ8un9paXjPf2W2Sy2QFJhI7In6l+3wRdWB9eP8XJnFo
	Hhg4NiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t62hW-0000000H40M-2N4M;
	Wed, 30 Oct 2024 07:01:06 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t62fs-0000000H3rW-360i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 06:59:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so58589515e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 23:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730271562; x=1730876362; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=;
        b=IyqsxO61idhBLc4o39Hm8zUV8Y2EUgUNKQPFjgkadL/WH4LlT+xn2D7URNuGXxcRQE
         K2dF7zkP3MInf0chfwlD2ytVRIVAJgRuHPUZZEgdG+61gAdoVMg/NC/a/jeZ+SVtSjZx
         QmJivuy53uU8iY6hNj1t/hfzC5vvJhFEvJ121cLn1DfOjHYPLaNav5rkBPOlTrC4JnbT
         /kGJOW6mQrKw4MOMF2uOUUH+zUY6PYwSSVNGpo+rjTcsv3mmi2kUUSfuRIZjGwHh3NRi
         4jiM3zUjLpYY5cs3BxnpNHcWsTd3yoX3DZg6+af8iU5oK0VxIfrZSxnAxujV3VJIuroM
         dgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730271562; x=1730876362;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i16pYFlL+2GPz4u0u591aWQv0tNB7ELcsGAfV5zdSA0=;
        b=cQ5LOhtcRc1DJl9YOyl3SeSlmDE0cSdGRMEmI/8u1/hGCMaJsatt5Wi9kZ9IshWqcZ
         GAU6h/l23Tf2RIw3fJ4ECXBanIEMwwSuwk0xi5Z4SIk+HRg5LTgE4vZXvbBqD4e/Qgzl
         WEG1ywJOGJ61EB+EAG5dH+RjTQLoYALNSTRT+SdS5FA7uTbfQO5IWwcz/LE0yawdnXna
         5kNrsocjnjBL1WwFr1SU0PVXoiupehzAkJ1RsyFhinbdIbCzJ4tDwonNtO1UPttQ16Xy
         9vdV2l7XXUo99k7dUgIYZYeDt/eHWTfTV+s7A9pswkKY1+HzI0b6CauVUhOR5El3IeD7
         V1dA==
X-Forwarded-Encrypted: i=1; AJvYcCUC4PBghXo85l9UVm4c8+2HlTlkDBprJn+1q74H4kB7H/nlvJBkwYDmsGMArkskCbARS/mYZW+xrXjPFc140ndz@lists.infradead.org
X-Gm-Message-State: AOJu0YwOgGSMrc6qwzKxxOR15wLvykNwCDBN51LoaC+JsS+JwjeeMXCV
	GHLFayUC7OWFkFZ1FKqraKt/ubrZ1h6xjLrGQb5takaBMHWOrMHHpsX7a/hvw9w=
X-Google-Smtp-Source: AGHT+IFyqfOrZ4MI+sXiINodrY0EVZIGOc3drYiZoKJHu/kEVijxTqjjc6wOezZxjLb6iMiKoIcUbQ==
X-Received: by 2002:a5d:638b:0:b0:37d:387b:f080 with SMTP id ffacd0b85a97d-381b7075edfmr1643140f8f.15.1730271562350;
        Tue, 29 Oct 2024 23:59:22 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b70f25sm14695531f8f.67.2024.10.29.23.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 23:59:21 -0700 (PDT)
Date: Wed, 30 Oct 2024 07:59:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
Message-ID: <jzihr7yp5ftyl6ojhtnv2r4duos6or6hozip7yxxodycokwjms@nfa5clftyocy>
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-3-afb0cbcab0ec@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xv6ynghrtwc3g4ok"
Content-Disposition: inline
In-Reply-To: <20241023-en7581-pinctrl-v9-3-afb0cbcab0ec@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_235925_066062_BD73D56B 
X-CRM114-Status: GOOD (  11.02  )
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


--xv6ynghrtwc3g4ok
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 3/6] dt-bindings: pwm: airoha: Add EN7581 pwm
MIME-Version: 1.0

Hello,

On Wed, Oct 23, 2024 at 01:20:03AM +0200, Lorenzo Bianconi wrote:
> Introduce device-tree binding documentation for Airoha EN7581 pwm
> controller.
>=20
> Co-developed-by: Christian Marangi <ansuelsmth@gmail.com>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

LGTM

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Thanks
Uwe

--xv6ynghrtwc3g4ok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmch2UMACgkQj4D7WH0S
/k4AsAf/WTL0HrSsNuwSLR9YrYS9gYAReyTQAnpm7wbARGWjQE5VLwUF+noWxWP/
AWmOyJdCsgTFs3fXzuToK5SrEPTcsLv3lMAZl48Q7n6NNxMfHFFQSnLp7h+ZRKxu
OQcfRE0N2VD/4NNDTlKZ9/LoTUTCFhJzjlGnhI6YlEe9Rj97KA1GlBrpneUUfXJ/
ukXdcpGeN4W8DzvrzZSLjZYKT5EfDoFA0UFX6cDS1dZbe9LeCH/v13KFM5f7p1HU
+rs9IqNp62uk4YBbsaRjExCK9pcQsQMK/zxcTUn+jMbqR5wweK0wtulbSUdgChQE
Q1oE4Hk6LfFUUnRHCMrbhDER34YMOA==
=rEHm
-----END PGP SIGNATURE-----

--xv6ynghrtwc3g4ok--

