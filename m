Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B8C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BI4ugJqpUpaLGQsQ+EDdZxWC0RxUSrdZP/cPnbrYvqo=; b=xGcm1Lx5wXonXIHud3/IrVYd7p
	XU7ALuBj/qcqQpEOn5xGXVa/1wgUHRRkoefYjXdKDHhAKikF6B1yztPQ7w32O4bVsKbsLurnBytYM
	4SsDPLCQmtFYQmB/bs+F9J7afBY7SXvltDwxcXDlTATHW3VYpUtmkj0oWUT757joT/yiXW3QQLxQr
	1oqGbbHGK7E5KPW+1oPn07LWqFZmthPPdgKpAj+6IaMY2p+vAtjphFgq3Tq1NYao1iAT59V6W/zw/
	xTY9WFbQ62iERjNUpWao9qsDnrHte6HuJoQYwxPXqY5oC2UYa/PeAPesq1XYAktd9FlXqTa8GYF6A
	7PI0Uy9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIQg-0000000BDFg-2kZu;
	Thu, 03 Jul 2025 11:48:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHDE-0000000B06f-2IQG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:30:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a4f379662cso4630427f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538639; x=1752143439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BI4ugJqpUpaLGQsQ+EDdZxWC0RxUSrdZP/cPnbrYvqo=;
        b=QsQwGYf2YA1Bj47Bb/+Sj8+A52C0VNiBHjBzemVevg3DJXmB2aKcM8HbH97HIOIcWz
         jn5ZYr4+MDI/l7BDQuOWor/qdfWtb21SU2Fg0XzIFkMDGwqYge/YKMdFvFtC9IBq9fGJ
         hpahvApbhMbSIHLx//qvnbpCfA4cSRlnQGZXXjG2i1XcGT0FosLaxCONVyYOXQN54KD+
         Ad2CCds6GcNiqj58bxqEp2hStzmlNfmKgQw2CUQ2mN+r0wBysCk7vI8v4CVAOP0aZNkY
         iyJehSgbgp/Mp98eYjRlJwtsBoL57GZSh8uPjQyF7tXg+CM917dfog5qRbjPmL0NEGdZ
         S8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538639; x=1752143439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI4ugJqpUpaLGQsQ+EDdZxWC0RxUSrdZP/cPnbrYvqo=;
        b=HqcCC7iVvGZHi9FJ9DCZUjX5KQoAjKCZ/wSGHeN8th90FSIgq0FEjUm9Nu/QAXO/VI
         gjZkt4EcFolg6MBh3RB/3Ip1bkVC97yYIzRRgCzhEZdHWtBhZTwhAInfXUzU5g6srPbT
         qAoBoGQIU5zYUy520sKlAfB1Xvo1HA1Irf5s8Y6VHRZH+CrOPbWtYqbvxvzksBwnyQLI
         cuxTJY4Svd6RKmEzK8Msloz6O2AaIbw+nPslpuqQZzs/hYM6PyVvl3elhW2iqpaSd75F
         5PAoq/TgxwJc+SR9Y8r+6XkMGiY3QOCUNjpiCgw2lzaQI46Gw1hERXSJK2xMvk62xUdP
         8rMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpuIaHhZaKpKLJWnCa9LCQrSui8PMNCbmb4FRewNYstgmJBv66XlUxVTdVfPmAdkplFNgwlbPq204HlKwpV2Zq@lists.infradead.org
X-Gm-Message-State: AOJu0YxoX3kUyFQPDQMgCylTxf6gVj3mEP2lmPOA7NEviI64OsGpQV0W
	GAeNP6iVplSF/t9kYTldYnTQTnANFFVEtFC2sgHNIPjmoDe+mA+qfclM
X-Gm-Gg: ASbGncuFv87v8NSD9M62lvEGx6ReK8pyAzvuUgUF8Z131XRh6Q92FI9rX6M69lsqcSk
	7gBZAEfWIsrnSbZN9vKrFXpRlavqDC3avAb+PorLZFSGiqwisLHoaLShUBsX1asMxCGuzF0WRXZ
	MdgPdNlKgOL4Bma/HwOi+Kjoh7xvL570sBOcT+sPea08qXB6FGuH6opjjxse0f7BqpF590Na43t
	zYJ2mrVb5vDB6RFOPKW4emY1o69hG/gTSx+PwkQxqIyuY4GDMkdLwQl1iHKiWsMfdh1clVUYbew
	s/XmGfW1tXMqwTpHO00DX49NWlP+N2x725sbWeCEb0t9UujGzivhPSuSBTUCMeog6+frVFoYnO5
	Ya1Ws24/UHAjc7LDz9No4tp9t/z+gWwntt3G3nKwXMSB2jqyI
X-Google-Smtp-Source: AGHT+IEqcDm9FXin6E5d25wcn/Q1WhL1S759lH+zkxEhX3WasWxZ06JBuMRqSlkf4cLoHCfTMQiPZA==
X-Received: by 2002:a05:6000:490e:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b3c4b1a50amr1136564f8f.7.1751538638564;
        Thu, 03 Jul 2025 03:30:38 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm18479317f8f.51.2025.07.03.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:30:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:30:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
Message-ID: <aotsm66e2g7cedpfc5zk5cjjba2wg4eiwwldl2jshwcvpuvxxy@wphprcezmfd7>
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffoynagzvtqusef6"
Content-Disposition: inline
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_033040_584536_3C3F450B 
X-CRM114-Status: GOOD (  14.38  )
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


--ffoynagzvtqusef6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
MIME-Version: 1.0

On Thu, May 22, 2025 at 11:11:24AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks fine, I'll apply this later on.

Thierry

--ffoynagzvtqusef6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmW8sACgkQ3SOs138+
s6HKvw//Y8GzaJfNevR731uobzZnEb3hGURGs/CP4gtMWK2GMR8GYYMZ5enlMuge
dFR3PoQPlmDrAINPczrafOMzQr5KXbOBw+A68eRwj/e7eLP8WbNN0b2+a8h/PQdB
EqtyWjr/aka5l/qnjj9G4AVDEU2DqIktnxrRVYsUhsqQGKHyX2Lo0KZTKI7+VM4b
QBEFAgkevH6mcqmj1FffC8MgPjjsrk+Xw7X4lsSueB08WNwTrqxCkJRtxpIiIuIL
qpWsQyaqx0U2I8CJ3DyzvyvMZyHqo7ZkgeZ8IIhmb/KkFgRid+05/6GQeyPQakof
HoWbeZ2AmV4jMi+5fJ9E5IWytygiOAAobQQEch1lnb2aJYdF5KzGGRWwTLLOihor
3U3k9HLvbRmiaZaAybAHmSz0GphMPUV5y8FxXiF9twfEe4JV6s3x+2pyfjtPddGA
uIYV1xc7N2tvSDLAzpu08LFBWtP3qafUSu5UXCan7ompLUbxsM/81KsjVCr2Cnlh
ntUNLFSob6apatjvqeFG+JqsmQ+MTOEbCxA1dLqJJdo2UiZ6f/j0A4TXu/uJtrZf
5JEGEUGOmba9jy6wYw3KOcKO9Fz4IjF0nJyGZpUD2k0265v/eCExC9S9w5N+Pm6P
HwDPdX3vTtWfY3r552sO3pBIHuv4YzZy8ZJmxgXyplmEOH/BfRk=
=yhpd
-----END PGP SIGNATURE-----

--ffoynagzvtqusef6--

