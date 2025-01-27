Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C181C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 13:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvzYFhX8SUBJyGpqjsoQ6jIbjkQaAtJdp897xoVPh9M=; b=y/MQJoMIMaXHmT+raRgDl3pKwt
	ik3uqIolTyUFnAKwMW0EKyjZU/Ew4qWXJuqdPFwmFwDKx0mmNGaObf04ltm//AQRLzRWHNXprIfik
	HFe5xF/ttS60GUvrvm1GO5AtH9Y8G1GKCFa2rln5vhFes5yfPawvgmTqDmGeHKZ7RLqnICZc7SZz5
	lH9jXIjE8PZz7fdiiBavhxM7ZTqpKFLpCmZ5qTLI/z+cPIxAoX7fm8JEahSdh9KWaQBY6UUS6St9I
	vnOoQc8V9pjyeHUNeUNRAU9pgSHUL5jPKxDLnHC1anKpxieXJ9JM0UkKjuDvn2bzjtv/93lzX6gSm
	FUl+pxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPC6-00000002NZd-2DXP;
	Mon, 27 Jan 2025 13:30:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcPAk-00000002NRP-3RdT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 13:29:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43675b1155bso50989235e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 05:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737984541; x=1738589341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FvzYFhX8SUBJyGpqjsoQ6jIbjkQaAtJdp897xoVPh9M=;
        b=U25MF0+b0Efqho3cS+0Z+1am9vV2cdOWmXwqls+Z+TdfkGl0VInoypAza/0jRMZZX+
         rD6j4UQbGIwWlgbajkOeuJzkcYMCQw9F6N/R/Whh6Y8hw1VWA8fFFvWEc0iNg5W0E4au
         hJ9afEKTnCjgm2p3uCnQsFzZE7dppilSPyWNP8E506he6don7UOXh4haVs3zrd700xII
         2R+mr0OMgr8Y9E3L9bOJd6Wb1vAYwm8Qu0vC3OGK7sw/tHEe6w6SWPxTSA0y9nHHkNPn
         MQZCJBQfZrd4HLMXhffOdYSWU9yjpyVNHaVBCfXYN3bNdG/GQU4fOWODzHonbddQgLRQ
         0Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984541; x=1738589341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvzYFhX8SUBJyGpqjsoQ6jIbjkQaAtJdp897xoVPh9M=;
        b=AIVKgV7/OrUP/xwhiwYjc95tj8CjTRcdLsJfgL/QmWzMvtrbZK7wwwYApGOQZEGd2u
         edlK7WwKlmKDlEI6Op+hUZ1O2sCpV4WAMXib/zjdMy0gSsFzOZz9fLMhUWsIoF0c1XC7
         KmScGS9jXeQg6U5FqyvAT1jnetrne45EHifgSqra6Qfg8Q8+vdDqytye6FSBKPCj0DTH
         uFIR+ZTac39/BSK3R8o00DuCWQzEs8siXjzp4jwNHPJrSJ7GhQlb3mjq1N66VU0T5yor
         TFsQ90gTS8d+0IJ5ZAWRlD11Xzmkb2tDD75AJw7AIa+ij3zcMVAmKIwbcegH+Yb0hplb
         R/9A==
X-Forwarded-Encrypted: i=1; AJvYcCVC2ymbywczpYmj6alV379dsyE9MvJdpnSGsSyOkpf9E8gkLauAdzr0It8k7FgmQWFJPlwg2wlEjqNZCq2KkYGg@lists.infradead.org
X-Gm-Message-State: AOJu0YzMrccllCWao2iCqdL+Rkgh07QtF7hkJwqyHh4w3Cp9wFlSv30K
	gXpmbaTru3DnzccSNHD2z3/IitblfUbjH3k34d/b4DpJy26m/mPA
X-Gm-Gg: ASbGncsuxe68PvrxYHlo+i9TWjnDil+v70FQ8e/7aVM83XWtyejcyoctwuNvlaExAUX
	+Me+/qWcgTK8PRhONW0XnIVJa/lxAvit+nFsLLWwzRGGDbFKAm7nu+sIlw2eAi7b5cSb1xP34Y3
	+y+O2dYZ+QRsfgrMICeIN6xWR9tGazs5hALTEP3WeDOi26H+uwd3HjaXhWvoRLBxSoYf1ICIZcL
	OYOiIWw4bOZyd2kY9HGNa5PpiJJGTAgLAYHC0Yv2OtKHVtZXOYZrviITXxUQuvocETthuHLl/yT
	LOJ7t3oJ6znU5SwUqDClwZ9syS5TWgAAMUO+vxehpY4wWqs5JelYKGnWimuswXy6JSA=
X-Google-Smtp-Source: AGHT+IFdDa7a3oSeFSq3XdbGtmA71EbKMopM7KAl71p/Rr59XXaBfgDYSq3pBLs5ZQTyA8iqtGNjYg==
X-Received: by 2002:adf:ef04:0:b0:385:f23a:2fe1 with SMTP id ffacd0b85a97d-38bf566f7c9mr25956570f8f.26.1737984540632;
        Mon, 27 Jan 2025 05:29:00 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d7a7sm11357596f8f.32.2025.01.27.05.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:28:58 -0800 (PST)
Date: Mon, 27 Jan 2025 14:28:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: Ido Schimmel <idosch@idosch.org>, Andrew Lunn <andrew@lunn.ch>, 
	Brad Griffis <bgriffis@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Joe Damato <jdamato@fastly.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
Message-ID: <kyskevcr5wru66s4l6p4rhx3lynshak3y2wxjfjafup3cbneca@7xpcfg5dljb2>
References: <cover.1736910454.git.0x1207@gmail.com>
 <bd7aabf4d9b6696885922ed4bef8fc95142d3004.1736910454.git.0x1207@gmail.com>
 <d465f277-bac7-439f-be1d-9a47dfe2d951@nvidia.com>
 <20250124003501.5fff00bc@orangepi5-plus>
 <e6305e71-5633-48bf-988d-fa2886e16aae@nvidia.com>
 <ccbecd2a-7889-4389-977e-10da6a00391c@lunn.ch>
 <20250124104256.00007d23@gmail.com>
 <Z5S69kb7Qz_QZqOh@shredder>
 <20250125230347.0000187b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="le5bosxlscibz3la"
Content-Disposition: inline
In-Reply-To: <20250125230347.0000187b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052902_861560_65D657F7 
X-CRM114-Status: GOOD (  34.68  )
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


--le5bosxlscibz3la
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v3 1/4] net: stmmac: Switch to zero-copy in
 non-XDP RX path
MIME-Version: 1.0

On Sat, Jan 25, 2025 at 11:03:47PM +0800, Furong Xu wrote:
> Hi Thierry
>=20
> On Sat, 25 Jan 2025 12:20:38 +0200, Ido Schimmel wrote:
>=20
> > On Fri, Jan 24, 2025 at 10:42:56AM +0800, Furong Xu wrote:
> > > On Thu, 23 Jan 2025 22:48:42 +0100, Andrew Lunn <andrew@lunn.ch>
> > > wrote:=20
> > > > > Just to clarify, the patch that you had us try was not intended
> > > > > as an actual fix, correct? It was only for diagnostic purposes,
> > > > > i.e. to see if there is some kind of cache coherence issue,
> > > > > which seems to be the case?  So perhaps the only fix needed is
> > > > > to add dma-coherent to our device tree?   =20
> > > >=20
> > > > That sounds quite error prone. How many other DT blobs are
> > > > missing the property? If the memory should be coherent, i would
> > > > expect the driver to allocate coherent memory. Or the driver
> > > > needs to handle non-coherent memory and add the necessary
> > > > flush/invalidates etc. =20
> > >=20
> > > stmmac driver does the necessary cache flush/invalidates to
> > > maintain cache lines explicitly. =20
> >=20
> > Given the problem happens when the kernel performs syncing, is it
> > possible that there is a problem with how the syncing is performed?
> >=20
> > I am not familiar with this driver, but it seems to allocate multiple
> > buffers per packet when split header is enabled and these buffers are
> > allocated from the same page pool (see stmmac_init_rx_buffers()).
> > Despite that, the driver is creating the page pool with a non-zero
> > offset (see __alloc_dma_rx_desc_resources()) to avoid syncing the
> > headroom, which is only present in the head buffer.
> >=20
> > I asked Thierry to test the following patch [1] and initial testing
> > seems OK. He also confirmed that "SPH feature enabled" shows up in the
> > kernel log.
>=20
> It is recommended to disable the "SPH feature" by default unless some
> certain cases depend on it. Like Ido said, two large buffers being
> allocated from the same page pool for each packet, this is a huge waste
> of memory, and brings performance drops for most of general cases.
>=20
> Our downstream driver and two mainline drivers disable SPH by default:
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c#n357
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/=
drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c#n471

Okay, that's something we can look into changing. What would be an
example of a use-case depending on SPH? Also, isn't this something
that should be a policy that users can configure?

Irrespective of that we should fix the problems we are seeing with
SPH enabled.

Thierry

--le5bosxlscibz3la
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeXihUACgkQ3SOs138+
s6FoPhAAqxOsjlx6etEbkgUZAt/RbOShSCthQYEh+Lc+Fk856UbSJeQ3h2jIDUKE
LeAtoppjWnoZbrJGesP99QLBsq5R1ouYiacktzWwyp9PciXmWivAxAmdUZ5kqXsC
Y/OrrsL7PLxMlhij/qY+pMBH1UiTfuLLftMNxYAY/3w5QIAt1hfFIlA0qEb2B+ZN
C9Ir1Ma1TRKSosngX/WNlEacT9jh4mpx7zk8IcD5LEur3mEIWcGrF82zhUf+3Xi0
92sBCxHz4ydKwXTOtFZDm8EiBo43Xo9R14OTaOR9Q8Odv3Hz0ywEuMDjt4NzryXd
bm014ztiC52fmSkDCIy3TM42q3NNBVlDUJDqYZjc/9S+MBhPNyyug8WKsnz6QWiV
4DPxCw/mrKYZNOjQnUOGx/WTpkQY8lSs4LGNusP2Fg+FUcqbfnODBO6nRFOUSI4z
dI1Bn34IjnEIM+zddlYP8Q+JNbcVK3JUWF93lVX2YdJGmELCNEGMrt5TDxMOJSNm
AFTJdmNRUvGf6hM7xhqOZXABWY6/qKQhR3UaKWavOJMc5kG6gQbxsIHpHE6zWRig
jFEnol2StQW1PAm2fCdlrBdFADFzgrkfsvbIv9r/XegXU/vTIQXmLm5U4O8DJ58Q
y4HTY/66dTEmd//qV+a3jonm88YEvcXIXiaJBFvchrJflKFtHYY=
=dCSI
-----END PGP SIGNATURE-----

--le5bosxlscibz3la--

