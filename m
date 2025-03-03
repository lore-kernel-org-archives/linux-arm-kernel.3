Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BA1C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Evb90FKrgPWzLV5Du6tP4VGKeYOTKgFcIlyLIolITHs=; b=c61uZdALDLuyYpX6sEaZrXNr2Y
	Qoj0BJTAchtZo0/xat3Mh+IPQfi1uBvvbVh4O3IKZyQU7AkA3JQe4gw3FySm49lrD1QIHLiY3jDVx
	Fm7G7HLXK4q+VQZVvBBlbpIt2HG1dB+J0rL0JKO05hrRuAnPLTcW0z0gnLPejZfOCuZ4URQV1Q+MD
	CQKpGMIhxVXS/zTYRu4TTI712XucG9MTV/b2HsjZtUJ4qllU0aUWcolCZ2tV58LpAirS+e0YnIl/N
	sGG2UPK51v6cCVGFpHmSaaAj91Wf+Uf+WNp8jR+9jHaHrXyDZGZTfPKDTckFq+KtBGYayYfhTVPSd
	IdalGI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6h6-000000015Y3-0ljG;
	Mon, 03 Mar 2025 14:22:56 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6OO-0000000113N-0ezF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:03:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43995b907cfso28349305e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 06:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741010614; x=1741615414; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Evb90FKrgPWzLV5Du6tP4VGKeYOTKgFcIlyLIolITHs=;
        b=A8LtqzHGR5Wx8tSOoCF8AUENN24/8RrlzextAVylUa+Siisjvidhe/9hjUvCLMhnr6
         gGwH8Ku3KNEnm4ldNutcVpSVcvtEV2YVJ5ukqaIakrZONV/vvi3I6bNLJ/KIsExMY7vL
         vwfuhygFZS1SCJQMbA8PlmwZOId0uR2+u6tv0cfJ0jkeli8QEvzzuf5nRxCCR/d3zByz
         8gDZRq2QvGrFSAfu7l6+50AhIZJ1r8vTzpklkUYd3A8O5K5AWO1DwM/g3fnV1W4dGa4n
         MBarLHutU4D2FNtF7pcyoTp013D7vtxg93NKmM5jFDp1Qr0L0CxSn+S20JL/TGwS27WZ
         Yuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010614; x=1741615414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Evb90FKrgPWzLV5Du6tP4VGKeYOTKgFcIlyLIolITHs=;
        b=vFNJhRmUsBkuuLh2EQDywnXRXiDRhVcy9aU301SyCs1HZXo64nYCv3ZPbgKiI6njXv
         sdGmvvFAuZR8UEFrk1dNe8Y1YwJms++6YUS2iIidACL/N+/18sf1/a0qMiOHCwJW64iM
         7TAZjitPUkTKw5DCchL1EbyFkC2CtH6zZpXpar52yd8lI37O024KYqr6PJWL1mWSJfxV
         gEQ8Rfe8LmRTl3hdpGZsGei3lru0ydgALV9nOrM/GOG+QjzRNheM+grGID1xFPh9JK6G
         VDRmS7UdAGwzgXB65guxZW+vTgaKK5f5kmpquRSs79e8KrD+yY32MAXyOAjcapmhEwkX
         bW7w==
X-Forwarded-Encrypted: i=1; AJvYcCW9CpQWxaXef8ITeHq1Vk/Pb9bMoehmLN4Jw1fZNalY8b+7xcNIyp/tNUROTo9dF9uVHLurjfGgmQlMM59y5Hfr@lists.infradead.org
X-Gm-Message-State: AOJu0YzRo+udlpFrSsYGZpJC4f7n/W3weH7SiRloxuiBsvXdb9c2vx1J
	h1MhxqPPst2X75CPy9nXDd6lCDLlC3pLdkNUrZAUHbnTe9shzPEPL2gzprl1i7o=
X-Gm-Gg: ASbGncsN6QEwuZMgI+0rqO+Gwz76GuBXJ/YM4XyrIKKErvAwFdpWGhReF2RXXxc8ca/
	qILJGcI1Z/wcRGVAIlcP9zcRTJLfsaRBLL4df+nhddv8H2f5iGjaEzzjHi2vV4pPk2TTPW3aDEW
	O6RgaHiuy4nRvCpQDXJtr4g112dll0CupSVietUxVElDoJiVO6RG6xhC6PZAeHQacOCQpWnp0Ys
	Osg2Ft+u/NPzWOTOpixhThfPQdlanqyCy1eH1exRQ77fEPypGyr5VKMXs2dR3niKWKNzrWQv/MU
	A92tXs+N5nJaTwWHcaimyEI4KTQIzkz3YIy0IL8PjWfubXWD9NSmkvPwxjL8y7fvokUM95/q9Et
	ILUPLgVbnhsWfZbdpQI98rSObcQ==
X-Google-Smtp-Source: AGHT+IH+p7ThXgxbHvbT9aEZalC898OCXp/uZvsSO+RyrFtvjYhk8Dx7PziT3Aqfwo54nFZzgv1HgA==
X-Received: by 2002:a05:600c:3505:b0:43a:b8eb:9e5f with SMTP id 5b1f17b1804b1-43ba66d588bmr103036975e9.3.1741010612945;
        Mon, 03 Mar 2025 06:03:32 -0800 (PST)
Received: from localhost (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bc48fc886sm26543925e9.4.2025.03.03.06.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 06:03:32 -0800 (PST)
Date: Mon, 3 Mar 2025 15:03:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
Message-ID: <xqe3grxdj62u6ixl5cdzcgzjo6swe64kegzjx4qabkfbkohlb5@rwu6rrh5lkzm>
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="747pyp5fjw7bmyol"
Content-Disposition: inline
In-Reply-To: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_060336_385681_33209DED 
X-CRM114-Status: GOOD (  17.72  )
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


--747pyp5fjw7bmyol
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
MIME-Version: 1.0

Hello Dinh,

On Mon, Feb 03, 2025 at 05:46:35PM +0100, Uwe Kleine-K=F6nig wrote:
> The only change since v2
> (https://lore.kernel.org/linux-arm-kernel/20250130074553.92023-2-u.kleine=
-koenig@baylibre.com):
> is that I added patch 1/2 that is supposed to fix the warning that I
> failed to notice with the testing I did. Thanks to Krzysztof and Rob for
> their patience with me. I hope I got it right now.

I didn't hear anything from your side on this patch set and I don't see
it applied in next. Do you still have it on your radar?

If you prefer me dropping the reg property on the fpga node, please
tell me. Otherwise you dropping it on application is fine for me and
keeping it is fine for the dt people, too.

Best regards
Uwe

--747pyp5fjw7bmyol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfFtq4ACgkQj4D7WH0S
/k6dEAf/YqUHjcoJ4EMUtHBrWkZ2SOE8Hhtl8/9eJmOAuWiftC/qMfMXKzqOPIN0
xTSnSCGP9Iuy5lGeSpdtNtzXMtvPQOmQxwSG41/5jRXG3Y2VR11i+OShfvskEd4m
Pg8Pz8eUP0ZbzTzWXy4Vnmff8foS0a+FrF547HrZT63OEfH5+Ghj10tRX83zYKww
Y5jZJStU0Yu1/1tpiBr40HCNT/KxVFxJd5mIcPX+ZIoJx3sQU9G4XRU1hG8u32Ab
Du1tUwz9HJpcjIkgSp43kR0rFMnZ84JrX2E7gGjykaC7urgTI0lU5+wby0gzNdCu
OuFHTdFjt+y6ax30NbrRxcKar1TxlQ==
=6e6Z
-----END PGP SIGNATURE-----

--747pyp5fjw7bmyol--

