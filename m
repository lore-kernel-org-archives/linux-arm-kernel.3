Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5443FC02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 13:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZAh71u7iDW5TgFuwIN4/oX/du7eXN1HEZL6hdOP2kw=; b=VganxaCQ4I9oMtOdwxRIQ/OYj+
	ncnBznYlRCHBUrxiGCrByrJi4d7E+/7XK+NKwe+F/zCUZTbrDy1zQQ+6BDtoDLXmWwvyzTTYA+C1v
	/mBMWlKJ3OVOQTT5ckhnshi7MT553dRpx2mC5qBhmLh6fhVTyEVrDwVqkXhgKrtvxYvPG1qhm/2HL
	HvMD8/O+MW3lIb0Lr6HL4jt/q8/JzLYs76XGYuE6SqR/yFN1Gw0FZ6kJ/a2UgMToCC5Ha5HdV0KQU
	7ATKUU+2X2079cfQbLoqdjB466dQjRKVgRG99YSD8sdrMfmx5Y/OHrgr+t+q2RSHkSnIAcwIGiwx5
	GI/I1o0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJYq-0000000Ej2q-1ZRQ;
	Fri, 24 Jan 2025 13:17:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbJXW-0000000Eiy5-44lb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 13:16:04 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43635796b48so13880895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jan 2025 05:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737724561; x=1738329361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAh71u7iDW5TgFuwIN4/oX/du7eXN1HEZL6hdOP2kw=;
        b=PNEJq1ynReEbdyrr3T/0cHl7bzux5hQO70vL9Fy17eqfgAeFKrR0D7icARLPzMqWX5
         Pidd5k8fma6AQy5fx7SsdHzwF25TzZ1EeC5H5ie/YHyApUWpjqAsHORJ9t4FDmj7bLOD
         L7NYxXE97pgfnajAvVfY/10Zj/sR/6pC+CMn/0GXcFwz0Pn9jSmrIEj4YpcajmZElyBx
         3sX5iIcx6o38O8DKrlbp7xYVvl69PGkHQoqx5AjSsHmnftUu44hFEt0mo5ePHME3sEw0
         B9KgsgR9oYuTZzJbCPJCWl+nKzB78ZJg0PeWsiLgHPoRy15zysM5DMUmkeLtf7GuQBs5
         97Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737724561; x=1738329361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ZAh71u7iDW5TgFuwIN4/oX/du7eXN1HEZL6hdOP2kw=;
        b=B9A8VteD0hl1L58FuiRCbDFCNm5jM1X1S3UX+Ks2X2cG7GOV9oaY6ayz73VHWtYt0g
         drxqsetWU7aEL2i113UXqThiV53M8vJEQ4UGQSMpwHTCHNi0RN7sqpdqBOLuBO0Md2fB
         AK8WOuFYwL7mFt/8d5agKa+KBVBUtyIZP+S9Z4boIcj+XrJoCoHIHEAFoISDY5PDr8HA
         SQ+4XzVx3hlj9Iki4Mz5ZeKPFqfMz/CvKozqeZuyKdX5t4Ej5Fvm0asOQvAi0QG8fdjt
         wq+/KAKB2RLYJVtd2tj0Lz0LIowAQRaNWiGT+pZODY+7sFmc7kf+VIRZXNq2132HU3GU
         5TqA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNrNHN+DzeAwuffgin5uUStrn7Vg6nuz7Utgr4yZhNLxkCAPaFYJ/ZjAyWSMPBBxTpLoAZE2Z29i14trcS+pm@lists.infradead.org
X-Gm-Message-State: AOJu0YxdsNGGr7+bVkl7iE+yv05cWm9bu37cRxQLDzPAc5xy3lxOE3ed
	TCSz+J5pg7dntbtLKYx1RcQmT2doRabRV7rA/aXLN0VUoBzTj9J+
X-Gm-Gg: ASbGncs/juwBkNdm824nw7Gids5Om+HTwBn4iTEEsatgA4i6pelhuY0wiR6R5WZilTy
	iHBEecTcesovk4cWHUOOZlDll04PW17FaA/rHuFpyoIrNPUhqMQTUqCCq5K3B99uLVJ/w89eY2R
	HoeKDN+QF1d34psuNx3Wvb/ULsI9xXzqGkeG3NsB9yLhsuqJTyxW8gGkaA+ouoh3ffdkccpR6TV
	YcEYU5EqtYwAZKOQe0976GfhWceAyseyWm3qguoupY305spOKZzwzKFglk54Q2+BAJX2AF69elt
	MHZmNkampQPjY7xzbJmXSn307gjL5ygg8fsAWM8wOZSSHTljXEXHQazIyq8o5/V8egk=
X-Google-Smtp-Source: AGHT+IEwZbXxm4SZObd9WNjYWzy5X3F1IMVKmUJqH/hwSmh0/AUzwz0DpjVKAw0L1FgMgzHEfw0kPQ==
X-Received: by 2002:a05:600c:3546:b0:434:fc5d:179c with SMTP id 5b1f17b1804b1-438b885f8ebmr72834675e9.13.1737724560477;
        Fri, 24 Jan 2025 05:16:00 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501c2dsm25668225e9.13.2025.01.24.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:15:58 -0800 (PST)
Date: Fri, 24 Jan 2025 14:15:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Brad Griffis <bgriffis@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Joe Damato <jdamato@fastly.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <qkjv53fn32qdi5jh2d6bqdfnnl5x4x74cmir6fjtstfw2ijds6@eoxctjkqij7u>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qeva6rbep4nl2wrp"
Content-Disposition: inline
In-Reply-To: <20250124104256.00007d23@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_051603_015200_9F742F99 
X-CRM114-Status: GOOD (  27.49  )
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


--qeva6rbep4nl2wrp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
MIME-Version: 1.0

On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch> wrote:
>=20
> > > Just to clarify, the patch that you had us try was not intended as an=
 actual
> > > fix, correct? It was only for diagnostic purposes, i.e. to see if the=
re is
> > > some kind of cache coherence issue, which seems to be the case?  So p=
erhaps
> > > the only fix needed is to add dma-coherent to our device tree? =20
> >=20
> > That sounds quite error prone. How many other DT blobs are missing the
> > property? If the memory should be coherent, i would expect the driver
> > to allocate coherent memory. Or the driver needs to handle
> > non-coherent memory and add the necessary flush/invalidates etc.
>=20
> stmmac driver does the necessary cache flush/invalidates to maintain cach=
e lines
> explicitly.
>=20
> See dma_sync_single_for_cpu():
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
include/linux/dma-mapping.h#n297
>=20
> dma_dev_need_sync() is supposed to return false for Tegra234, since the e=
thernet
> controller on Tegra234 is dma coherent by SoC design as Brad said their
> downstream device tree has dma-coherent turned on by default, and after a=
dd
> dma-coherent to mainline ethernet node, stmmac driver works fine.
> But dma-coherent property is missing in mainline Tegra234 ethernet device=
 tree
> node, dma_dev_need_sync() returns true and this is not the expected behav=
ior.

My understanding is that the Ethernet controller itself is not DMA
coherent. Instead, it is by accessing memory through the IOMMU that the
accesses become coherent. It's technically possible for the IOMMU to be
disabled via command-line, or simply compile out the driver for it, and
the devices are supposed to keep working with it (though it's not a
recommended configuration), so exclusively relying on the presence of
an IOMMU node or even a dma-coherent property is bound to fail in these
corner cases. We don't currently have a good way of describing this in
device tree, but a discussion with the DT maintainers is probably
warranted.

> The dma-coherent property in device tree node is SoC specific, so only the
> vendors know if their stmmac ethernet controller is dma coherent and
> whether their device tree are missing the critical dma-coherent property.

What I fail to understand is how dma-coherent can make a difference in
this case. If it's not present, then the driver is supposed to maintain
caches explicitly. But it seems like explicit cache maintenance actually
causes things to break. So do we need to assume that DMA coherent
devices in generally won't work if the driver manages caches explicitly?

I always figured dma-coherent was more of an optimization, but this
seems to indicate it isn't.

Thierry

--qeva6rbep4nl2wrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeTklsACgkQ3SOs138+
s6Fg5A//RRfim9bUu9i1xTkv/GjjLWaRJ7VtWKD5ewVFok31BQU5MKDr06GxqWN9
ARoiC9XZPn/1W8+BYFrZKgWGeT6M47a8Z74LDBbfA2seTEokZWTH8jCyk5LEiVn3
5bKSSMe/2UmmQrGHvAg5Z8FYzaQVP6BcWZoT5K6o6vxRGj9LTgNz/nXlAaFUZFRj
PfnyyrCfF8NfiMOnRtDo8HVB1rxshscjOf/SpDjq++B3rzaLnUUBPI676WlWg0Ru
jMwQbr9Q8ynJBetKGA3Fy5TrAIP2vACLqW7kn4+OJYh9Cwo9HAelQ27y5aur/gdJ
UJCX5pCDtoyVEQwtxwbinOcG1TKGDGBPYUqv/1+IWjiKuHJuAC4/qgPxNLk7sGxp
CiKDGJBYl4vXfbyS43BJj6XqyjOIyFhK2/DEJ2ep64wIi82kJlx6qx6euZ52Ie++
41xc7Ek1ZOUVpz/mou/pAMOmyawOZiSCq/ai0Zzfg8aCsFdrfotasjzUZRh80a6H
4UQgUQSPS6aVitDSga17U6+lA8z62pCx7CQwup3GYNZSma/xLlFIbXNXYlIqsh66
ByAjxG5EK7+Qz4N32+axkdd8g0D6BGesvuHFbYQ8Fo69QfUMpcznChBJUoFH3V60
pKaMDF8b3UJMzAsljZtkby9xqYTiMVqZcGUYVyNRNOkZRo7DfAI=
=kOxw
-----END PGP SIGNATURE-----

--qeva6rbep4nl2wrp--

