Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FF6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 13:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zP41Rmpn5mMZPXrAIAfE+G59N4Vqeo9bSbuVW5Vwl9E=; b=RBAZAKHBYv464t2TFAxaXDMsin
	LNasF8XVgnGTloe9zxaFyoMHwV3Jdv3nARWWS3OUOkymZxGRlgto+Y+PSnPDjyQmZQGgnawXP1Z5J
	uX3dL+eNyQb91YqwlA6Mm0yEMiLnK677e4F5i352MALc2IWUkcSYMzDaoznPUCFdWv3GsF/kNTwvj
	AC4xcf/y9x9yZ2FIT5byD9vqVAZeUa9EnnUIfb2+AvpjXk8WzTGrv3xA1c4FFenXZLctt0OPR9SCO
	nNN91/zjTa5UrW3KQBe0N12kcNFTcMMhE+ZqRFc5SjouC5PjJ3JqQCWYbDGQQOT6biMfs1LS70a+s
	5etlJxDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdv9-0000000DoTm-1aOH;
	Wed, 05 Nov 2025 13:51:31 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGdv6-0000000DoTG-0R73
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 13:51:29 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-89ed2ee35bbso1013450185a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1762350687; x=1762955487; darn=lists.infradead.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zP41Rmpn5mMZPXrAIAfE+G59N4Vqeo9bSbuVW5Vwl9E=;
        b=ZJAaf6X/69HKqFhEWnN6cOXfiKq3YLnw+7h3tkey69x93AOq+NJOsYgcJHJnM+SB3g
         FfzlFPHTT/0fseA1QADMOoCqCVdbnxlLeWZFgLNVNFkeOSjdrlfubDiqdEGYDC+QuLWs
         /WwSZ3R63RKaCjfa7EcSwjIxijvIAB2pROw1wksoU6sfWN1OmLfkCG9Gs1dPCfXgghId
         p2zD1xSkkB42Rs0xL/yscvQ6OKEmv1PfmAvrCmlVwNARTT3auNeYR061qMzGaelKF1xt
         xS7PLfeYcn7Q+yMYePrDIpgEFUgEmmmfPpsaD6S8uvhsU0+V1cKkqMUU0/NQDEKEBKrF
         x72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762350687; x=1762955487;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP41Rmpn5mMZPXrAIAfE+G59N4Vqeo9bSbuVW5Vwl9E=;
        b=pEtckTCGxBmi5DBsAon8pSA6QNy/vDPS2rlzdojPrn2DmlEmUuANvVaEcCFBUkTmo7
         XcUmmJFYvYf6JSv5eIzEWD+Byk47WeqIkzwt9Ee7dzlBJU/TP1zZl+277J5SYwwP8iA9
         K/za92dzP0HozH77P70yMiD9GW1z+r0iWyghzjTGP2066+Ri2KLqI0AOMrkf3By5QgQP
         kyBdNdJdSDx99y/XbK6Zg/VUy2BmDFR2/LpZ3qwNKCBfKX9QwVyK5l6y8/xPAxWYzl4E
         ZClkwLh2TiTwPe5GtLj8F/M7Tx/u8CtBTCuxnsRVl8IsYBdETICtQSmGFWEp4bYWMLe4
         rWwA==
X-Forwarded-Encrypted: i=1; AJvYcCUGnhPCpdjwcht2B5KM6/ayKHTFWs8ogBGFJf6lqUNC5J7hTRc3wPhDFDzEPWPV+RPMc4WqFpuUeCoopV5OfAei@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy/E6sllBc8DzyxqpKtMEkqzNYRcsueyTXOueO4L2Dq1QFUyNn
	UgY3abOmF0PeMfAtvphcMpOP57WBMY0ED6+7aenS4IEU4Pu06yrfYHhyIa5Rq86MMlE=
X-Gm-Gg: ASbGnctHV5Lj9JXu5k5bbKHL2xRQ/ItEfJga3SdxEiUIaOvfwKc/J5iwti3L+el9Wpg
	g58mOmRAaW44vh8XGjNMPRZn4o6xSwElUjxmFgDU+WARVr0nRk9J7lhCbd8kAAR6UaSs3vqpPQ2
	VsbeLznnchPoOkx9O6qvX+PKD3UN1ws7+SYwKgzLdQYqM22appihnaP8Dh2ZP3h88LQnsZNmd39
	/N048j2mQHQSg69pTSX6SR1J3etHczqYs6gbnWqzuVjo2Kc3cg6TnZLm5PSEU0zTPs7bP0dpNZX
	J5N2XI94Zl46uYJ02loNX2vSDlAav8ljOOAu37Vf6DkMvFakFxOjYR+V8ZTO5aheDDf8bvL9IdF
	jg2rYvT0yckP/XFIRGDSkFIbLv8wEmZsua/kGG6oqvIDRb+ZHaHNTPEgut5Tw3cdApgM38bB5RO
	IWLAyQ9Q==
X-Google-Smtp-Source: AGHT+IHjDb17WJE5ovnji+ZuOA/1CxRvnHlgllSFFQ/L3BHsKI5wbhqVXzK9pnt8K5pFCIhkgw4W3A==
X-Received: by 2002:a05:620a:4045:b0:8b0:f8c4:a5fe with SMTP id af79cd13be357-8b220c001f8mr430100785a.89.1762350686452;
        Wed, 05 Nov 2025 05:51:26 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:ef24::c41? ([2606:6d00:11:ef24::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b0f5413f43sm432543785a.8.2025.11.05.05.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:51:25 -0800 (PST)
Message-ID: <6d046cef20dcef4eb14aba6fa89e30d303f6a1b5.camel@ndufresne.ca>
Subject: Re: [PATCH 0/3] Add Amlogic stateless H.264 video decoder for S4
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Zhentao Guo <zhentao.guo@amlogic.com>, Neil Armstrong	
 <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley	 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet	 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Date: Wed, 05 Nov 2025 08:51:23 -0500
In-Reply-To: <174ef722-99f0-440d-8eee-5dca086e13f0@amlogic.com>
References: <20251027-b4-s4-vdec-upstream-v1-0-620401813b5d@amlogic.com>
	 <b976b442-7d07-4fef-b851-ccd14661a233@linaro.org>
	 <540d98ea-114c-43bc-94c0-e944b5613d74@amlogic.com>
	 <b6e6881197dc4c83e43ef5eb1f20c2bf1887d395.camel@ndufresne.ca>
	 <174ef722-99f0-440d-8eee-5dca086e13f0@amlogic.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2cG765y6sSQkAAGLj2Ko"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_055128_383192_442E5AFF 
X-CRM114-Status: GOOD (  13.11  )
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


--=-2cG765y6sSQkAAGLj2Ko
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 05 novembre 2025 =C3=A0 17:26 +0800, Zhentao Guo a =C3=A9crit=
=C2=A0:
>=20
> =E5=9C=A8 2025/11/5 0:13, Nicolas Dufresne =E5=86=99=E9=81=93:
> > [You don't often get email from nicolas@ndufresne.ca. Learn why this is
> > important at https://aka.ms/LearnAboutSenderIdentification=C2=A0]
> >=20
> > [ EXTERNAL EMAIL ]
>=20
> Yes, we plan to support the interlaced and mbaff streams in the=20
> following stages. The decoder hardware can support interlaced/mbaff.

Perfect, let's focus on the core for now then, I have additional feedback f=
or
you on top of Neil's review, hopefully I can get these ready this week.

regards,
Nicolas

--=-2cG765y6sSQkAAGLj2Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQtWXAAKCRDZQZRRKWBy
9C7bAP9Qs1rNKbRgDkazxpbW2p5TVrPLZK8wjWZLZUY+/CCltwD+LgR3cm+8x2UQ
D82jlWcSVIKc5R+xySP7dgFgB+WISQU=
=2auc
-----END PGP SIGNATURE-----

--=-2cG765y6sSQkAAGLj2Ko--

