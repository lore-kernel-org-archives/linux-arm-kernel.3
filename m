Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65032D767D8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFLi7sXfxk+XCHwdBr/DCPBnP9ObDHkez7dZLEKcBpk=; b=GVWdQ3BU6rLwkOyyuXjQ8iyf1m
	Yz3iwY69iWhmbrZC6plC4Pp3Z3aY1HLvfUjQjch61RF+fj7yqXNe50CxuSaRjfnWk6fuCiapiHv2Q
	0rJAils64uG80u5PTn4tK3psY6pUU1Kl8FATI/rJLz6BlZCm707ufa2j//ynHMlYMF9xlCGBYZATM
	qofxpURrHih1F0Wz5h+V9mHLNPlM2T7lGw9lbaKoa3m5CphNpYiRht0YXheWdR5HQmDkurCB6PyPD
	1mQx6/uAXdSfz09RR7A80y5mz/0hk/NIMhYYuAuFnf1/lmpLdlQ+KmYC5vGNLybEO4cqN7ZltynMF
	R0SzaH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6WEx-00000003p6b-3Dhn;
	Thu, 31 Oct 2024 14:33:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6W9B-00000003o4W-1FsT;
	Thu, 31 Oct 2024 14:27:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4ABBFA4427A;
	Thu, 31 Oct 2024 14:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B5FC4DE00;
	Thu, 31 Oct 2024 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730384382;
	bh=kvu/pNOvG5FZT1n14j6qWW3Zde2m2OO4VVYELDoWxLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hweOotzgnuI9+0LQv5EEgRrxW1sbD7PYRwnhXQ/oob00uYp/8wQSBdNsbmXLoXW3z
	 w0PNTun9kUlvk0MSVq1qwYyN+9KrsnxZFcAVXxv6zyZvSMPnAwyWciEu56CspyATly
	 7doJePMC60ihjAdOCbqyWeNP1ieKEk3SkJd97lkUxxfv5L3ScubAaqT3avOKvWpmS6
	 C/hxgxp40ZbOQFdQiH8GhrIym7r/SIm+3CEffsSrZLWklQCN7bt8mCw8xrpgH2zJ/x
	 /UwyJts0qWVgyk+FB05Dp3M04QH8SnHM7wYRdlHuHF2yta/160nHRhPEp1xJe3m0cc
	 V3Nd12DRz+moQ==
Date: Thu, 31 Oct 2024 15:19:39 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add TBF qdisc offload support
Message-ID: <ZyOR-w_KtIXk0ug6@lore-desk>
References: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
 <a66528bd-37cb-46b2-90e5-37b10dfa9c78@arinc9.com>
 <ZyM5CPfQYHc_Eolh@lore-desk>
 <d2776a19-5176-4ce4-9306-273ec7cda0a6@arinc9.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ysKMVCDzL0oWX2I+"
Content-Disposition: inline
In-Reply-To: <d2776a19-5176-4ce4-9306-273ec7cda0a6@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_072737_572678_1A6E1E07 
X-CRM114-Status: GOOD (  20.87  )
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


--ysKMVCDzL0oWX2I+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 31/10/2024 11:00, Lorenzo Bianconi wrote:
> > > On 30/10/2024 22:29, Lorenzo Bianconi wrote:
> > > > Introduce port_setup_tc callback in mt7530 dsa driver in order to e=
nable
> > > > dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw swit=
ched
> > > > traffic. Enable hw TBF just for EN7581 SoC for the moment.
> > >=20
> > > Is this because you didn't test it on the other models? Let me know if
> > > that's the case and I'll test it.
> >=20
> > yep, exactly. I have tested it just on EN7581 since I do not have any o=
ther
> > boards for testing at the moment. If you confirm it works on other SoCs=
 too,
> > I can remove the limitation.
>=20
> Seems to be working fine on MT7530. As we have tested this on the oldest
> and newest models that use this switching IP, I'm going to assume it will
> work on the other models as well. You can remove the limitation. Also,
> please change MT7530_ERLCR_P and MT7530_GERLCR to MT753X_ERLCR_P and
> MT753X_GERLCR.

ack, thx for testing. I will fix it in v2.

Regards,
Lorenzo

>=20
> tc qdisc add dev lan4 root tbf rate 10mbit burst 10kb latency 50ms
>=20
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-5.00   sec  5.88 MBytes  9.85 Mbits/sec    4             sen=
der
> [  5]   0.00-5.00   sec  5.50 MBytes  9.23 Mbits/sec                  rec=
eiver
>=20
> tc qdisc del dev lan4 root
>=20
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-5.00   sec   469 MBytes   786 Mbits/sec    0             sen=
der
> [  5]   0.00-5.00   sec   468 MBytes   785 Mbits/sec                  rec=
eiver
>=20
> tc qdisc add dev lan4 root tbf rate 11mbit burst 10kb latency 50ms
>=20
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-5.00   sec  6.38 MBytes  10.7 Mbits/sec    6             sen=
der
> [  5]   0.00-5.00   sec  6.00 MBytes  10.1 Mbits/sec                  rec=
eiver
>=20
> tc qdisc del dev lan4 root
>=20
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-5.00   sec   467 MBytes   783 Mbits/sec    0             sen=
der
> [  5]   0.00-5.00   sec   466 MBytes   783 Mbits/sec                  rec=
eiver
>=20
> tc qdisc add dev lan4 root tbf rate 11mbit burst 10kb latency 50ms
> tc qdisc replace dev lan4 root tbf rate 10mbit burst 10kb latency 50ms
>=20
> [ ID] Interval           Transfer     Bitrate         Retr
> [  5]   0.00-5.00   sec  5.88 MBytes  9.85 Mbits/sec    4             sen=
der
> [  5]   0.00-5.00   sec  5.50 MBytes  9.23 Mbits/sec                  rec=
eiver
>=20
> Ar=C4=B1n=C3=A7

--ysKMVCDzL0oWX2I+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZyOR+wAKCRA6cBh0uS2t
rGGrAP43x9ir/OC4Nuio7b+xx3gu7hiiiMPEZ1q8QZZQfNE+cwD/V1qt3XVM+x3Q
oN0FLzDtJ8l0dGS2xaSdjjTcL/hnpwU=
=WgBX
-----END PGP SIGNATURE-----

--ysKMVCDzL0oWX2I+--

