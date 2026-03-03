Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5205AEC047B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 09:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECZHRdcw2yjtkhM54V5V+4EHA5UV9Qy54k8lbgSHfCE=; b=bqY1BYefgpj/2ZA1tiKev4BHkD
	J0hxgm2oAgwfj/Hb92+bsbcdEzU8/YO5tAy5NXd5MuovD78bqQfk88sHHDUijxCH75+fRNwJyDKWX
	IflTFlhSIc8BQC83yHE3cbAOqgIT6Q9JwLJ3s6U6N+nmrSMePzbv11P9F84+K30dpiZvJUfVVKAFQ
	7faYPro+Jitx0iqN2aYZlqulHjru/nRmYLKRqHGhd9GSkpNOooroT5AGBl5R83BfChcVxQJ+nKkh4
	ZflBYHRcgcEMpBSGX9RI3PqtUjmPwyiFSSXgQEBqESsF14viEEdXb7tY8ibdiCTK5lqzn5nzQQA6V
	CBO1M2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxM0m-0000000Es5j-2xl0;
	Tue, 03 Mar 2026 09:25:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxM0k-0000000Es3v-02XO;
	Tue, 03 Mar 2026 09:25:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C4BFD43ED7;
	Tue,  3 Mar 2026 09:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56996C2BC87;
	Tue,  3 Mar 2026 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772529948;
	bh=2z8ZSyC5A7LLCOOWT8EV9tuw/GmjD3s5IHXtdve+8Ug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZeyjEFQMukw3TU8d5tOoDLzd3ODMTrHFhlOmHqLJBRHk1ybfs/HzLXRzD8+RhvdyS
	 EIcansrNtvHYscxkbudam4Ys/cs/RV0zLEi9KxRvWw8kk5gGWe+GcVCvChwK3EOfs6
	 RAK2QT394GtuMA4811HyKgLz7/60l9UPzRKs6xxDBjej/YaRRdlAB+fM+gUx8gHe2V
	 YceWVCmdeOuRCGLYI07ztlafMcO2Lt766kX5V99XTMKJZAO1E8OQ/YclLqWthx++6F
	 ifn/8lgvE0DIc256/bKLBh2/wLPLecfGmWkVzxUP7d3HN5wb83KcKnd08caPKt2nk+
	 5ejoQlh/diXAg==
Date: Tue, 3 Mar 2026 10:25:46 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Paolo Valerio <pvalerio@redhat.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: Reset prog ptr to NULL
 in case of error in mtk_xdp_setup()
Message-ID: <aaapGn50iQ54jl8t@lore-desk>
References: <20260227-mtk-xdp-prog-ptr-fix-v1-1-b73d7588b645@kernel.org>
 <20260302182909.06de1942@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yCyu0DIjJWfjcGTH"
Content-Disposition: inline
In-Reply-To: <20260302182909.06de1942@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_012550_079104_E0812625 
X-CRM114-Status: GOOD (  16.18  )
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


--yCyu0DIjJWfjcGTH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 27 Feb 2026 16:52:11 +0100 Lorenzo Bianconi wrote:
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -3751,8 +3751,16 @@ static int mtk_xdp_setup(struct net_device *dev,=
 struct bpf_prog *prog,
> >  	if (old_prog)
> >  		bpf_prog_put(old_prog);
> > =20
> > -	if (netif_running(dev) && need_update)
> > -		return mtk_open(dev);
> > +	if (netif_running(dev) && need_update) {
> > +		int err;
> > +
> > +		err =3D mtk_open(dev);
> > +		if (err) {
> > +			rcu_assign_pointer(eth->prog, NULL);
> > +
> > +			return err;
> > +		}
> > +	}
> > =20
> >  	return 0;
>=20
> Maybe there's something special here, not obvious without context,
> but why are we setting eth->prog to NULL rather than old_prog?
> At the very least the commit message needs to explain..

Reviewing the code I agree, we can just restore the old program, moving
bpf_prog_put() below the error condition. I will fix it in v2.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--yCyu0DIjJWfjcGTH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaaapGgAKCRA6cBh0uS2t
rIStAP4k8YfdaIeG/OvYD60XFhFefPws3OFtIzDTK6JLsChQ5AD/eA9wJQv6eO5c
T2X7PaXMz/PBi9Y7g9wayveHv1am8gc=
=ljTC
-----END PGP SIGNATURE-----

--yCyu0DIjJWfjcGTH--

