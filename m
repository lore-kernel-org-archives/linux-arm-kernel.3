Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1615C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 14:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8CKX5RtKDBhVUfuV7o6TJDYp+hkhEN8uz8LA3KQM/U=; b=oOOk1j0GjMcBrGLkt8ji9QM94O
	qOtDkhM6P8X7SX8bKd22wvkLSXwuFfm+QiiNF+zxo8cHKeKuLbWW2gqmuCPyFTiN9GJf4Lah+4ykC
	bLMEMeVRHYDOoGmEz384Cqirg4Ldkc8fHa70xEOX/sMgqWxyiZ5tORPZ+bGlkhk993mY86aq9R9NX
	yYozDC4Fas4UPTWYdyA160sAhVawCriiwQQXXxFGRG+jxwLMDIX26fjzI8VBnzv7N+V9lscylo1fn
	+19hE7J/bvLyGUHKxXql4SuDE6cxAprVReIeqoM9d68t/2SiGxlb4fv/OJDAoMnzdbNYeLjq1kqVO
	TfJB5kVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfMm-0000000FggN-0jag;
	Wed, 07 May 2025 14:03:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCfD8-0000000Fdwt-01c2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 13:53:23 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a0b9303998so11634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746626000; x=1747230800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H8CKX5RtKDBhVUfuV7o6TJDYp+hkhEN8uz8LA3KQM/U=;
        b=gvL/ZpgD6EEWhrG+EQLd/d70MFsyUKXXpEA+vSIt96j24K+X7Je3rQUn+/2Zmt6/KE
         y3aJ0IzD+aprS78IeylwgpkakixDGEhSd4ttkBaoBOzRtOsKkQ2BEAF5gRk7wbLxF1XK
         cVJ3PI3exfSXvE9iHKW6cZJH8UPihdpxhF9zFkantZpPPFU8WDwonffo63HLiedDKCkP
         PqumO218PQstybPo+hQAEWPEvxya4Ya5N96Y00Uq1RLZ+N3N97JysC5F6w/qAD+sGobO
         dxQhDnMgmPWkFdOwZv7IFPvDBgiyAO/KOjIj+wiueVRqSB3rOmDJV1RAElLj+eS+L/2I
         SdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746626000; x=1747230800;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8CKX5RtKDBhVUfuV7o6TJDYp+hkhEN8uz8LA3KQM/U=;
        b=QUSLRbSFI8Ek0/bRBTPJx+t+MmGnj75y5nsj1Dcs/l861sqn9g0RKKSCqp8tq00Li9
         Xmf/rJ/bK3huTxWVJb6fJeMVRpFd92jJ/+smOJNJLJanHQkNupyOcYRIMXNjJQkY+ZPh
         rkp5s9IdXTXaY8p/pC9frPC6YDJUiopbrunbBluxh6ejVPdbUNz7MOgYtxploAZYSRWJ
         qGGPTNwOPSb9zPF1KXf3DzQuwxJdIvgN9DkasuiMaypAt/qdPEFh9Pt/bnNJ2MB1pFxW
         LGUpVSCNB+mAIXsndudfUtMF/STrUHIdBQcddj0Jq+jpseksZRmcURyQnd1HHndzX+Lr
         909Q==
X-Forwarded-Encrypted: i=1; AJvYcCXAc4PQHT1AaOwe3+H8/pa0t71Pd0oSGJcnAf4G6sw/FUFUu1/UkWxQPVOBGV+fSGAFLGsHesGY5k9YkzqexAOE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+Atlzn8MDIO0yE3l+TbkCnju6v/Wfs4NTwt1rYh4QM7dK4ecr
	Vt0SytbogbCftecVePnL5fbBB4h9xV3tA4lgSziKUZ/lElCBaRoV
X-Gm-Gg: ASbGnctFV7yJFwkw8C64L6lBYmiIRwUgpDRBYFxB5x6S4KHgSrQGkFxLrbARhskJVJs
	Q7xWGkO96i43pZEanUx9weXGznRvIpDVM4xBGY3E2nVNL679fCXfx8Us3X2cZ8xPaAyUm3LoJ20
	3Ekeartdt03vI6oPHtWXDbx7oOEZM6WL0pG+beN/klLIJymtBPabdXJ7Sfyx2uTof554njMOtY0
	6d9FzDYUd1TKhyfCtvLhykIGB8Jkyzf/03ExSEg02OOLR4ckkQOhTU3qWIKE4zvUDUA9dTcg1mx
	3VBjE4gYluRCt9VFUKliyRNh+lsw+zTjWz4jE3r5/2E/qppVQtT3LzCapqFI+Rr4DHG/IsxZ9+I
	czImxQJpFicrV4yRlKc51bj5pDjw=
X-Google-Smtp-Source: AGHT+IGiZQCYB6NVFg9TXxSzOwjtnYqTmre5AXBjPdkm5XFgXjGxTjxB4v1QFfUbJ3UrvGM9ejoxSA==
X-Received: by 2002:a05:6000:2510:b0:3a0:b207:90c with SMTP id ffacd0b85a97d-3a0b53e9eb1mr2470130f8f.19.1746625999708;
        Wed, 07 May 2025 06:53:19 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3c49sm17293968f8f.39.2025.05.07.06.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:53:18 -0700 (PDT)
Date: Wed, 7 May 2025 15:53:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Takao Orito <orito.takao@socionext.com>, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: serial: Convert
 socionext,milbeaut-usio-uart to DT schema
Message-ID: <fdstwr7r6mbk23eumztvyt2br6kuec4mz52cezvbsseh6fq44f@bd37mbcznfv7>
References: <20250506220038.2546557-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jrzy6va6ji6o3orv"
Content-Disposition: inline
In-Reply-To: <20250506220038.2546557-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_065322_058088_2DC0CC85 
X-CRM114-Status: GOOD (  13.91  )
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


--jrzy6va6ji6o3orv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] dt-bindings: serial: Convert
 socionext,milbeaut-usio-uart to DT schema
MIME-Version: 1.0

On Tue, May 06, 2025 at 05:00:37PM -0500, Rob Herring (Arm) wrote:
> Convert the Socionext Milbeaut UART binding to DT schema. It is a
> straight-forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/serial/milbeaut-uart.txt         | 21 -------
>  .../serial/socionext,milbeaut-usio-uart.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 21 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/milbeaut-uar=
t.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/socionext,mi=
lbeaut-usio-uart.yaml

Reviewed-by: Thierry Reding <treding@nvidia.com>

--jrzy6va6ji6o3orv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbZcwACgkQ3SOs138+
s6HMCRAAmaBQl8RNi3nV8RVeUWOB2s6tsCICUsITP7eKVArNNB18n99307gQPh40
+f02OMvUsF486Mm+C/PoAfpi7v/ATcENRqoPRFiFqiZR7ZUC8IUVFNpehD02PD8Z
+0x6ZbwTKYmYvttqJpLFQe1f0OmVQx6laSCg796FpTla1dBQjCAsQtNgN3HF6ZU1
/+R8W+2lskoS1GOFHvjQcnVWyHCd+n8r4a5Hrq6dKoG3BVkBidnq0viKEdvJ+asl
+EvlOJpdzZbE2IvYAeZQj57eFZQUlaaL0JmLqp12a4A2qMPztsG0IcBSK7i3Ir1L
NXs22PgsKyQKjBdqB2G04mUZKH/A4hZ1ki3cjJ+BQ7c+JOtCzvyMbmLyIAAsICxa
bi1GWh1DdeYSbdFI0OMwWGQI2pbwrRWGlddm0cYoyp0L2qKp2CvXEkHqQWBJ6/O/
Ib/B39Zbu+VP2cZppAjMaohuVYak3nrYQ11A7vkhlVXWfhRwZj3YiJfWzK8Ys6tA
NpNpI83ZEUvMKzvea3Np+s3iIMmtIllOcIuocuSalV6psrR50vcD2w9YdBmr8KIq
FdW4a7OkbQXV0k/AU2JaWTo2/wFsJ2t2UO2CVJci+AYTRUYCclizJBBe9oispzbk
zmr1qhO0aRDfEi0i3MwOjicMrpyUs2DIpCh/iwU5CtNzSZRMA3o=
=S4E+
-----END PGP SIGNATURE-----

--jrzy6va6ji6o3orv--

