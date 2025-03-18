Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA748C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6eRMsycQCwnvUIb7YBuRBaRFSAMCS6WfElJU0fnob0=; b=HbHxObZ2Vzz4yi2N0JYMqI8oEg
	deWlH0JoiubzO2wqIxJIVGvkc6UQKOOXY1HQDjYnqsryPq+Xnj354G4u3A6aPzKkryucigVnEtGxr
	RK+c79qXkFcYqVNoK44MOGD9nmHIQ6mJb8VJ67v9oHcxE/WdoTtACOiRnV7+W6BoNT71jxSi05jIQ
	aAiRYNMZGjnQsNeMnOy/lJtl5Nin9Q3lqsFA0UQM6r5qwNlWJu+8je5rZr0wMKOXQjEVwVh/W0OO9
	oy7whCJVgbk+EHx7nKg1gpZWMBMc8Ys+z4GKYY1T/A7CoQdEdJkldZur/G5znl+FhCDbSYNjPlXXi
	KHe2l+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUt1-00000005fZj-3Jxf;
	Tue, 18 Mar 2025 11:13:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuUlq-00000005dw5-0uzR;
	Tue, 18 Mar 2025 11:06:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 085515C4A1D;
	Tue, 18 Mar 2025 11:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D9C8C4CEDD;
	Tue, 18 Mar 2025 11:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742295964;
	bh=+6eRMsycQCwnvUIb7YBuRBaRFSAMCS6WfElJU0fnob0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FZYeGP3ChLjFgxxPhXwyrzj+8hdudeUK9TYlMtJjGSLAVE9l7b23fy6AlOGY3cXco
	 JxmfMzVCnaC8910yJDVJNyWc9cVokzjiSUhLJ9Nwbn3O0bxJNoUovv6P8rxYZkGqUW
	 8vxI26ywb35jSaW/zqOold5OFSPC3VgWsJPF46QKs3hueJrNGXj/MHgxylHyWs/90j
	 gcF0O9bB1CgoEohptMg4SEViZ5T3Sa50+WsOO+APy9ZU2ApxdGL0RC3xjifQ7u/F5s
	 60UVEROqpuCVkYO1fQXx5oetwtG8O03iJJf3018VZ4xMcN/cI+pX2Ms/28vDZz3R1V
	 2DKF4AiY4dA2A==
Date: Tue, 18 Mar 2025 12:06:01 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
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
	linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next 0/7] net: xdp: Add missing metadata support for
 some xdp drvs
Message-ID: <Z9lTmfyUsY3lqr1m@lore-desk>
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org>
 <6259af5f-f518-4f88-ada9-31c3425ce6ed@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7FKbPnYNhz7Z7bep"
Content-Disposition: inline
In-Reply-To: <6259af5f-f518-4f88-ada9-31c3425ce6ed@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_040606_312573_E93F9F94 
X-CRM114-Status: GOOD (  12.40  )
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


--7FKbPnYNhz7Z7bep
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 3/11/25 1:18 PM, Lorenzo Bianconi wrote:
> > Introduce missing metadata support for some xdp drivers setting metadata
> > size building the skb from xdp_buff.
> > Please note most of the drivers are just compile tested.
>=20
> I'm sorry, but you should at very least report explicitly on per patch
> basis which ones have been compile tested.
>=20
> Even better, please additionally document in each patch why/how the
> current headroom is large enough.

ack, I will do in v2.

Regards,
Lorenzo

>=20
> Thanks,
>=20
> Paolo
>=20

--7FKbPnYNhz7Z7bep
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ9lTmQAKCRA6cBh0uS2t
rDqfAQDOJNpxheA0LSnvOCTN+kPvwHBu5AGV2ArPeTAp70kJ3QD/apFRSAbfIcY1
1f9jJDVDMRYLq6bmd+WcgF6DA0c7JwE=
=n3M4
-----END PGP SIGNATURE-----

--7FKbPnYNhz7Z7bep--

