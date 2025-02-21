Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B4C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHG50uYe1UlL5jG5c16+79jfcRFCmEfeHokgqfYVFLU=; b=xQYAg9QSERAUNdi66ibwmcJelR
	6rxqYG1SVFw+9B2yyglneg+DCqK0zT9Zr60xmn8SZPTlBGQH6IAGlVnZM0Rzo1t/so6LrwGIrAWy/
	rvAOugR5qlcJ5zsTWVTiKIv+88QdA+rkU8iFZ1YKqBSs3+ee0Qwrog2SfH67d0nD5SB2yKvRbPsop
	7byvAHVuEVfBycw5HwTfsQtMM6Y6G1m53MFPrinlCSTW+2mK9QEkkffQrXTAtQFDPw4x1dFjnfFh8
	RYiXUBVQerOWoJ74djqRFVqNeKHYEBxYdu6HTNRGw2hTjPuUIFlIUIBjG81pEeZ7YL6I7jlUU0EEp
	kD4lc3XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbyR-000000076Aj-3uUI;
	Fri, 21 Feb 2025 22:58:23 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbwz-000000075y7-349c;
	Fri, 21 Feb 2025 22:56:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E27EA6831F;
	Fri, 21 Feb 2025 22:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC8C0C4CED6;
	Fri, 21 Feb 2025 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740178582;
	bh=Ka0DRUByZEjytukX3Y0ZxmgbHJ1AWQmN9+6GeZEtS4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fDE5GPdAG7hNwNwiVAGT5GKN5nMZOLXIP4mGEaCei8HTmqX9awjC7Zh4T/WuEjDds
	 xHRkcpygkdgnd3JhxUVS3bNTcuQHUfU+Coq1cDF+5JP9MriVUsVukyxCS+5XmRnTk8
	 HcsRhTqyPji+EdaYxEnT/ol7pL7Fdzz1HHxQXxw8TeLTtc4edZjHy2xgj822tOea8O
	 Gd6zjeTX+o4V3ZxdNpKCyvwpeEiNFuDy3spAIj970ElH4SOXrbRYPZ9xVi1Kci+Cbs
	 hHwraMPN1skgXbc1ypMM5m2Ybogs00JjlQuT25Zg68lAmix5XtPazKY0qRk+R+mXS4
	 Mcleg14SatFvg==
Date: Fri, 21 Feb 2025 23:56:19 +0100
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH net-next v6 12/15] net: airoha: Introduce Airoha NPU
 support
Message-ID: <Z7kEk1EduSiIQ-_g@lore-desk>
References: <20250221-airoha-en7581-flowtable-offload-v6-0-d593af0e9487@kernel.org>
 <20250221-airoha-en7581-flowtable-offload-v6-12-d593af0e9487@kernel.org>
 <20250221141635.4d01e792@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cdu6KHnWeLWh1Yn3"
Content-Disposition: inline
In-Reply-To: <20250221141635.4d01e792@kernel.org>
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


--cdu6KHnWeLWh1Yn3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, 21 Feb 2025 11:28:13 +0100 Lorenzo Bianconi wrote:
> > +	addr =3D kzalloc(size, GFP_ATOMIC);
> > +	if (!addr)
> > +		return -ENOMEM;
> > +
> > +	memcpy(addr, p, size);
>=20
> coccicheck says:
>=20
> drivers/net/ethernet/airoha/airoha_npu.c:128:8-15: WARNING opportunity fo=
r kmemdup

ack, I will fix it in v7.

Regards,
Lorenzo

> --=20
> pw-bot: cr

--cdu6KHnWeLWh1Yn3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ7kEkwAKCRA6cBh0uS2t
rIf3AP4jBL5NkpvTLF12BAQUCaZnPrUQS87ss38GQIdjJ1jWqgEAvsBOs54/Vn+i
u4hGD/DEtqYAZNRviFUfHTuumTOidAM=
=WZls
-----END PGP SIGNATURE-----

--cdu6KHnWeLWh1Yn3--

