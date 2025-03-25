Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA86C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FHndIVYNwQRbJ5agZ0hgtdvmI5GxtcfTYh32VkltYxk=; b=CfzJGsUsS6m3/FLtuilncd22LS
	U1DCFF3vGZ9v3SvxPunI8kkqPmahOsywAqzCaI7ornjQYC6w5DZDGPOZ05coD3npArKux7zPE/MHU
	LgsZgkTZny02L3/hEHQLTK/wVDDJqKcsQf7R41ZYD1FqK0ZUXTHYoC7RtL/IlFQgrlyms7G8gtOvn
	kE4XPN6AkclXtq+oG7tlxWaatyHxnvYj+Oh22W2fRyV4gOzhOFfn6UmhvLgmcj5kZHHSTHRhKYnDT
	mDiSVtYsctBzamClkOBTdk4UPK+RXnxDkamO1WfHoC59C5a4iMGvyq9U917OiVjHR3aRgchnQIYXI
	q8rUFyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4OM-000000062aE-2GDQ;
	Tue, 25 Mar 2025 13:32:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4Kn-000000061yX-06Mk;
	Tue, 25 Mar 2025 13:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A918E4375D;
	Tue, 25 Mar 2025 13:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117DCC4CEE4;
	Tue, 25 Mar 2025 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742909327;
	bh=dmvM6IN5Dthvxa5kh8GBs+FInlsd/ahwhF0FbdrWGqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EmLbCOHOih8hX0taTqKGfc5nAPd/Dpwg4C9VeIXPHSWWUjSbWi45uoM2BDlvUB+q0
	 HkzPlh/SjtVAf1CjUps8m/r9f5auBR7XTojLfrSfaROckQVfpVZFdka7Y9mXcbDU80
	 5ueJfukfGutY7ahZ6Gt1WaugQ3S8ITJiNT8M6PNHCepcqZQhi1AT0LFDo9HImWxW7p
	 /GtDVP6DT4UMw5tp9xX8pNSFJYMcvaqzDeh+MjuJj68HIAmIfq/OBkVw+J/FxmDS9/
	 k098C4S9DpBuIZKRDGBVSdBr7VcR9pMaa40u79KHwdi5vkmBjuIoJKJ7zvawCuApxq
	 TmXu7t6vo1wEQ==
Date: Tue, 25 Mar 2025 14:28:41 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Masahisa Kojima <kojima.masahisa@socionext.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, netdev@vger.kernel.org,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hyperv@vger.kernel.org,
	linux-omap@vger.kernel.org, Michal Kubiak <michal.kubiak@intel.com>
Subject: Re: [PATCH net-next v2 4/7] net: octeontx2: Add metadata support for
 xdp mode
Message-ID: <Z-Kvia3EhrtAjKOG@lore-rh-laptop>
References: <20250318-mvneta-xdp-meta-v2-0-b6075778f61f@kernel.org>
 <20250318-mvneta-xdp-meta-v2-4-b6075778f61f@kernel.org>
 <20250325044126.1c0f9b83@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="E4yhCdChUNhJbUGb"
Content-Disposition: inline
In-Reply-To: <20250325044126.1c0f9b83@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_062849_104762_E262EAD1 
X-CRM114-Status: GOOD (  12.59  )
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


--E4yhCdChUNhJbUGb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 18 Mar 2025 12:46:08 +0100 Lorenzo Bianconi wrote:
> > @@ -1514,13 +1518,14 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx=
2_nic *pfvf,
> > =20
> >  	hard_start =3D (unsigned char *)phys_to_virt(pa);
> >  	xdp_prepare_buff(&xdp, hard_start, OTX2_HEAD_ROOM,
> > -			 cqe->sg.seg_size, false);
> > +			 cqe->sg.seg_size, true);
> > =20
> >  	act =3D bpf_prog_run_xdp(prog, &xdp);
> > =20
> >  handle_xdp_verdict:
> >  	switch (act) {
> >  	case XDP_PASS:
> > +		*metasize =3D xdp.data - xdp.data_meta;
> >  		break;
> >  	case XDP_TX:
> >  		qidx +=3D pfvf->hw.tx_queues;
>=20
> This one handles ABORT and invalid return codes as PASS not DROP.
> That should probably be fixed separately?

Yes, right. I will post a fix for it.

Regards,
Lorenzo

--E4yhCdChUNhJbUGb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ+KvhgAKCRA6cBh0uS2t
rJqvAP9OpMaZdQLvzyjRJ+yYPN1BtI+hjZJfXaRH2utWQHb7uwD+L6oltUUEGPYK
Pxr4Ki69CfDwCdxPyDpzyKCdOPyfDAk=
=cnQi
-----END PGP SIGNATURE-----

--E4yhCdChUNhJbUGb--

