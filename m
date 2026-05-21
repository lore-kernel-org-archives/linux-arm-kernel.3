Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E814CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=; b=QRLBdKCAVnf6LL/WEg2xN9ufH0
	ev51XnLjOQJnqLFVIibTznsC2Zl6FWLCQFm6RTLJYcDm1m5ElK4Pss/p15C9uqU7mbpsWxqUPBwIt
	ayc/arw19csuLMsPFfSHk4a5+bVhtzB+ODFjRJ19KDBz/5rqcjNhAHsyPfSNGTgYSwEVveQFir9Tk
	ALBxgFIQmJ6+6j/xMFKk9rtyAFbv2L34qd+MAIMDqt8gEcSw41nBgNuY+rgCMzp8AUL1Y3ZBPNdH2
	K0i4T2ekoXfSMdmQJKIG0hIgcnpycH29seudzwhnvkTyrr1kZk6ggQmAvTfMGsbc7bf0zcMbxAVZS
	o5CVDbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCmM-00000009Jfa-3zBN;
	Thu, 21 May 2026 23:26:14 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQCmK-00000009Jeq-3f3C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 23:26:13 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b6ce6d1d3dcso2457436a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 16:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779405971; x=1780010771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=;
        b=GfLwfkZHxRFkynzETNzlG72TfOvLIrAAbqGBT7qeCujfoJ0bslX4Lca0PxKiJjJ5cd
         ZYHbjjUlwknyz5phEkg8RHh9HxQBs4Jn4w6xC8AQxDQmwnxoUGjI8cQz90Gl4W0aZOke
         jHxCtzwGxXfb9fWUkcsgf1yw1+ogkIPoW98hqAFUn/a1dGs9zdCGcnDmmd9sZczKJ5jj
         1+MZF0XPwbBXuquDR21jARLAh5FsnPdrLLe9WIPf/X6dR7NAl43MfyG9G15tROLjUsxs
         Nm41KmH7X+zyOncuBoo3WLKelcZbtYjBIbg57ZP3rO8YzFjb1706ZEx6O1NzRQL84xF3
         tEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779405971; x=1780010771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dw7PuRHNA/W8Hiw9V5ggJj9yrjp9HMSTlX2kIqqk7uE=;
        b=F/Bh45S2rBJTNPk2oyOl15H1lN/SAOcEtptKqrheGIxlijQLiMnFmwTR6eLKvDt8hO
         D+w5zEKNAduMonDHJcl7pSZvvp9zZLT8dGbr1v/C0PPm5DQSOwLZxDncrpmR6ESNJz9S
         1lJ1dCF0hyjpLSWZYzSW4fuczZNPtZeDwwy5NMj1Mzx/p9A1IqAoq+fam4YOVDnVBULW
         YgXES8rSKvGUF72m/7Iw2SfFbFS2PQqfn6gm4M2FyGUYvgoxDbwLSxqN5mSoZ/gP6kCT
         kE25frJA6gsE5A9sSO2SovDnVwPQpUbhdLyIYZvkvry31vRJ+ilVJUK/jToQpcyV+WVX
         AQdA==
X-Forwarded-Encrypted: i=1; AFNElJ++AKPaB9Q2tr1b4sFsqODWGryS/kDX+4UTqJV0S0mq13x1bb2ugB8LbrO3nHA2pjOV0hIGQ2cImv5OhMxsDhpA@lists.infradead.org
X-Gm-Message-State: AOJu0YzupXtezQ89c07/O7UOHTMET4/FLCt5P3v3A2JoYZCEz9AY6Yq4
	5biT7TMUDNSd73rpMizw3oklwW7xaa1i5i171ag9uejvImvNehaEPCD9
X-Gm-Gg: Acq92OHbcJmePI+vAaYGLszws2JsZPsixj6BHp8wGCljRFe06V/+XFGgSX5lhdBCTjO
	OCGwL0/2aqOVA2uPeO92Xbru/omLdHemLunIzQFFSGIXnLpAiZzPos2X0BraHi+FrVtgyOfIykg
	+nLlBGpTZyETh5/YKzflUJDK92cfChH4OTuDi6T0cIgzVH+S1E67eQsZyatsKdI75/tGgeQzAHB
	8qzIqvRjTQy1L6x9P8a58CJkM+MpmdSWUuTu6FT3B8E20mPGE53ANnfmRw5Pt3O1cudeMwWbaFV
	MdO1zWWc6wKdnATC2VTvKvUoLgzW4+t+I59LM6rrfsc0xjziMuHA/5dqqUN6XdcIO+W+racnkj9
	YwkNve2P9s12cNKeIg800wGo6rYtMyMCYTXIHv4BFK7WGljwBq/Uncjpnypda1Zt6xEH0hN8pUT
	9WFMJRNmrl0WGueLTIgIo=
X-Received: by 2002:a05:6a20:9389:b0:398:7eea:50a0 with SMTP id adf61e73a8af0-3b328cfb9e4mr1006142637.18.1779405971211;
        Thu, 21 May 2026 16:26:11 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c851d2d9d86sm245625a12.20.2026.05.21.16.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:26:09 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 7C79E4244583; Fri, 22 May 2026 06:26:06 +0700 (WIB)
Date: Fri, 22 May 2026 06:26:06 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Message-ID: <ag-UjgpdYEdd5zi-@archie.me>
References: <20260521191458.177046-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1z/7KOFz6eY7PkPh"
Content-Disposition: inline
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_162612_908526_B70FFA2F 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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


--1z/7KOFz6eY7PkPh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 12:14:57PM -0700, Randy Dunlap wrote:
> Fix multiple documentation build warnings.
> Improve punctuation and formatting of the rendered output.

Much better, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--1z/7KOFz6eY7PkPh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCag+UiQAKCRD2uYlJVVFO
o9ksAQCQ5MAM4pSQ9ck8cANNTAKfC2X5mBf0qnJcPYNQVs5dPwD/TuV0pRHBwJoq
FU7BzdZAEC+z4vRC+9k1AEPkhjA3Ygo=
=nZ6w
-----END PGP SIGNATURE-----

--1z/7KOFz6eY7PkPh--

