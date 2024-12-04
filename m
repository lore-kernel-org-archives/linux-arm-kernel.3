Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDE2E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZopfNxUqKzOig+vq2vgMrOIZ/FkZeqWW6Q7fCMolsnI=; b=kA6QeehlGWtqkJXh41pySU61pW
	aYODApKrNqDqEKfqUB2/KyZ2wCzqbvTZ6T+uvos1K4t4RgklQNlEZIAbo/V80vGFbpNqmEtnJ6arv
	AmYGJuYWNr4R1MeOdrgkblCfhzKJgJz9BQscloLTCI4w8FBkIHdKZWd9zb70GnK1uqyE2U+XDz1/F
	j6aYbg+YZGXBCm7/7Pip1phzGh0axPJt2Szo9Mb2suHIAxm+fI675pCCQ3ODhSpP3Gh8+HJPzsni0
	fu8Q98PbYswiHUvSgLwXLry2teJGNZf9+dviVYjhN8utCmxOi6mNCBK2nBULwYQwsUFRUwB9bPepn
	P4jjI/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsBR-0000000DAt0-1ZXV;
	Wed, 04 Dec 2024 16:25:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIsAQ-0000000DAjh-292T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:23:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-434a14d6bf4so63395615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 08:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733329436; x=1733934236; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZopfNxUqKzOig+vq2vgMrOIZ/FkZeqWW6Q7fCMolsnI=;
        b=L8zGuRuK3bUeqRhfvPzJ1SRfllPTgQp/zVFfwAqD9L2qp7S49u30fDpg5lceKIBKYM
         k6b6WoxAVlO1uf5okmRmWL6g+qDKzSFtKZYQDOuwd68d/aYPJxAIOkcVgnO35Le8JxCD
         4Fh4qqA+J+3StY3fppCzabkWjyRsAGWU4pUXFMbC/Scg3JR1bnsgnTqLspHACfw1h3pk
         KdXkC1AIsP0i7ZOmCNV+ONEhln/YS6WXzw6NzTHT/4GR/uEfhD13m/HekujPCiF+FU7p
         DtbLsu8jMPDi7CObAwCuYQTwOGswZElWYaTBzcvit7jIj5AMqT7+teo1n7dXrALcFjh1
         LeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733329436; x=1733934236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZopfNxUqKzOig+vq2vgMrOIZ/FkZeqWW6Q7fCMolsnI=;
        b=HRF4HueZhgqw2pyAGjwKLBRcMqqHEE7zsP3n2Y+pgdjL70wZ441tLfJ3r94gYvcGQZ
         5EQyZfsdfE6GkZuX7dRVT1gHk+bq54VxwylVR1r/TwNJgdP1Lb/2wnIFH/sBu1DiTP7o
         9BTzcQ/r8NR2s5mmBn/3POLUMzygIjPx9svgirtxWo+22+VSK4TM9CAs0yK+i8V5TUe/
         sPPxMSjX6XIjj6rWyU5pvdDV6BHIKWRpWr8p0HixNxmdEHnT7cdC/cw2Mq0H9sfGi110
         Y6UOX7bHWzndJ8z5oK7dJ+cRIJQRusYMNgmNqitm1fypz44mIZVd1wspBS2RR/H83hHV
         DJpA==
X-Forwarded-Encrypted: i=1; AJvYcCUu31qmBKSnmA+LhvEMHFJeRKDT3OWcCTvRGmM3JPNH5vkLENAVBd8+iI/sqsk9LC/BE2oTDnbNJjWzxEMqHE1v@lists.infradead.org
X-Gm-Message-State: AOJu0YyaNrTjYEPngZkZdpqB3NCpiM/i1vE90ZnR8rbdpB9K+OiR0+zM
	4s30nLlbWfWFSjpCw5Tk/LWMQsWUQcXvmrm942VrJFevTlGezTWb
X-Gm-Gg: ASbGncv1OoBnk7gf2bJq3SSEOWBNbwbtgwGO+zw6v43Q+banCbYU7d4AJFNCy3Jmel0
	iELxchpDFhxmOkijqTMrgv85Ce4SRQU60t3DiQv/MYv7CeAt3aE/tGj6iPRzyZ0vxaHIMzvMdul
	MoMgUVxch8hMpstcq4rJ36FA8cDOFpGv0bM9DXOlDiRAW2ydZ5YOzbdblYWs7sFQN3r2RwJLeWQ
	kUdvzbouz2ovd+J11cbj38Rj/MWgMsuKTmJslRdg5eg45Uw2g08gQA1TriRTOXjLjHoPJg8WTbS
	tyNkdoAWHGzyBIz4FXkRAhjjHxEi7As9e3fo
X-Google-Smtp-Source: AGHT+IEBAuqD6aE0GozRqXuDmFoNCDvwnIaAsz1vt2MpdwK3ooetePeFd9j6ErzZeQHLGJ23gIUJhA==
X-Received: by 2002:a05:600c:3b23:b0:431:1868:417f with SMTP id 5b1f17b1804b1-434d09c154fmr72688655e9.17.1733329436035;
        Wed, 04 Dec 2024 08:23:56 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d04defb7sm47745125e9.0.2024.12.04.08.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:23:55 -0800 (PST)
Date: Wed, 4 Dec 2024 17:23:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Parker Newman <parker@finest.io>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <mpgilwqb5zg5kb4n7r6zwbhy4uutdh6rq5s2yc6ndhcj6gqgri@qkfr4qwjj3ym>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
 <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
 <20241119144729.72e048a5.parker@finest.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qqjxn4twghzwb4kk"
Content-Disposition: inline
In-Reply-To: <20241119144729.72e048a5.parker@finest.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_082358_552630_D15C6087 
X-CRM114-Status: GOOD (  38.95  )
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


--qqjxn4twghzwb4kk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
MIME-Version: 1.0

On Tue, Nov 19, 2024 at 02:47:29PM -0500, Parker Newman wrote:
> On Tue, 19 Nov 2024 20:18:00 +0100
> Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> > > I think there is some confusion here. I will try to summarize:
> > > - Ihe iommu is supported by the Tegra SOC.
> > > - The way the mgbe driver is written the iommu DT property is REQUIRE=
D.
> >
> > If it is required, please also include a patch to
> > nvidia,tegra234-mgbe.yaml and make iommus required.
> >
>=20
> I will add this when I submit a v2 of the patch.
>=20
> > > - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> > > - The mgbe device tree nodes in tegra234.dtsi DO have the iommus prop=
erty.
> > > - There are no device tree changes required to to make this patch wor=
k.
> > > - This patch works fine with existing device trees.
> > >
> > > I will add the fallback however in case there is changes made to the =
iommu
> > > subsystem in the future.
> >
> > I would suggest you make iommus a required property and run the tests
> > over the existing .dts files.
> >
> > I looked at the history of tegra234.dtsi. The ethernet nodes were
> > added in:
> >
> > 610cdf3186bc604961bf04851e300deefd318038
> > Author: Thierry Reding <treding@nvidia.com>
> > Date:   Thu Jul 7 09:48:15 2022 +0200
> >
> >     arm64: tegra: Add MGBE nodes on Tegra234
> >
> > and the iommus property is present. So the requires is safe.
> >
> > Please expand the commit message. It is clear from all the questions
> > and backwards and forwards, it does not provide enough details.
> >
>=20
> I will add more details when I submit V2.
>=20
> > I just have one open issue. The code has been like this for over 2
> > years. Why has it only now started crashing?
> >
>=20
> It is rare for Nvidia Jetson users to use the mainline kernel. Nvidia
> provides a custom kernel package with many out of tree drivers including a
> driver for the mgbe controllers.
>=20
> Also, while the Orin AGX SOC (tegra234) has 4 instances of the mgbe contr=
oller,
> the Nvidia Orin AGX devkit only uses mgbe0. Connect Tech has carrier boar=
ds
> that use 2 or more of the mgbe controllers which is why we found the bug.

Correct. Also, this was a really stupid thing that I overlooked. I don't
recall the exact circumstances, but I vaguely recall there had been
discussions about adding the tegra_dev_iommu_get_stream_id() helper
(that this patch uses) around the time that this driver was created. In
the midst of all of this I likely forgot to update the driver after the
discussions had settled.

Anyway, I agree with the conclusion that we don't need a compatibility
fallback for this, both because it would be actively wrong to do it and
we've had the required IOMMU properties in device tree since the start,
so there can't be any regressions caused by this.

I don't think it's necessary to make the iommus property required,
though, because there's technically no requirement for these devices to
be attached to an IOMMU. They usually are, and it's better if they are,
but they should be able to work correctly without an IOMMU.

Thanks, and apologies for dropping the ball on this,
Thierry

--qqjxn4twghzwb4kk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQghYACgkQ3SOs138+
s6GbwA//QaUQrLioM0UTRNYWW6ecsfiMO/nk5jBbz5LbMh7211gzUPPg83dUc3w8
PnF586hTlqDo6mLikH3nc7DOt18GNUfjadV8xtLuJX6kYH/VDUEvjQaznfVpfrXo
QdsbMn8MJT6DCq9Qcjvv3shtaGlDyJY/CFKkdKUVwvaw5IXzWdtoxX5Q9vF3v/W3
fxoHRE90syhc9GmFKH9ntlt1Ku+mpNOm6pWYB6QLNTMqctjXJZsxnM+EvGqL57k7
+UCaJvfR2laTf41FkDbLGziIrHmSwoZLMIh08eyIjTGFfOvKqtpO9/a5ckCo9a+t
zjlhdWI0GzRplmw2KYxkWGboZCUrGHzNSbp2GRUKaBs0MB7UVVrVCIDJ2Vj81l4f
JoVhBQUQjNXSuQtZM3GKNq/8SkuQUfdSSt7xCw1lBMBCxXtbEtz7FvbmBjd2qx5o
8vIzqLhXQNp5QfJZT+tTtWnAIm+5GEIZG2mr/pg9CCPKqtAhugSNZc18Me/IS+CM
xXZWZLTQrfmHzUq2eTe0l9iVaTwLUf9ZDF3giHwXoyposgYTugBcHzbp10v1jB4M
L/GJKcC8Lmv1vHMtTrhRJk/UWNSL4TVC7gmcvfXPQRdPB4Q9lXFTuHs0w+ggZVi4
W2Ino7yR62yUh5iLveyTQqBAv5FT2c2EkB7TECfxyb0xGOLYpTw=
=kEPd
-----END PGP SIGNATURE-----

--qqjxn4twghzwb4kk--

