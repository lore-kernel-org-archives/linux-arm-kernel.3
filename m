Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=10jNbGRvZsPmWMGouxLK8UHxoLr85rz2aRkumx5Y9/A=; b=EcP4Ml2A0ET+70AO/0f3pxOGaH
	9K0lLarH6EFGqQ4IGNlEXl9PGMFuqWATxF74Eww7B3TpixpFo2q7JDCDZF3wsUo430XZ/Lu1BWSU2
	NBtaTW6zWtB8rptR2JaDvxTxwvCYX9vnPTNJnW2uCbekTTvsFeqPZCPNroRJugVUX9er3T0kVHgFy
	4GIK+cC2Dv6zGpfeUKwE3yZEHviQ+a5bF422UEpiSwslo/AcShGKlZ1c2plTIkNBBcGAYDD2HWyTB
	Kz2KOmACuitPKiQ4HPAg4usTDcKTyUWKcx7HN8uQKxn7y4rWvBTHGh8HbELPneeCPUxDQ+CgUhARi
	wJf3N9FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQiJ-0000000H2Ng-36rC;
	Wed, 08 Jul 2026 11:45:15 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQiH-0000000H2N7-0Y5M;
	Wed, 08 Jul 2026 11:45:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783511084; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BbzfzKxqbvPnrvyVyHOhzb8iD20zR3d66/NJqDevEdeclatBqZjVOp40FJJBVUGAkZDBYHC3ODWdArm/rrjpPI/IYXPshf4P9TSy6xjx5FerLYq09rVpkQAzZ0wtIsSdxbEgl7L1HfDSB20xpPNMSd/B5CoQVlqmup2BYQWPqWA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783511084; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=10jNbGRvZsPmWMGouxLK8UHxoLr85rz2aRkumx5Y9/A=; 
	b=LLI7sW882jTnhgaNd1popR55mSPsaxMbsW7mOffkw42FDSe0VycSQiGZ6O64cH0tHIQxND9to8OpnJaDzWBoOpCCdbMpAlocI3IZmYvw7TkOJqvBGqRvPyB3UW/jSL7WMfvBv+qkEAA9ROigdTLXPBOSp/QugRRqThk+tJqbR9E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783511084;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=10jNbGRvZsPmWMGouxLK8UHxoLr85rz2aRkumx5Y9/A=;
	b=hHGodoC5rNtt9ao4ZOa0g7TQj9LXm/mPnD0kmSkHKFrfpnRPy4Mnq1S3IQjvaToI
	LBIjBPD3bgr6htQpPURhrwg7UUMeCeGicaNuGHnfvGhRuM4zF2kDIcjqD0IrVq3NnNs
	mazulxdQPHJYyp46a0hAfQktOenapwaW2mdU/4ms=
Received: by mx.zohomail.com with SMTPS id 1783511083198326.6815554898435;
	Wed, 8 Jul 2026 04:44:43 -0700 (PDT)
Message-ID: <3c22fe68c08c414b789c79144ae569840e1ba6a9.camel@collabora.com>
Subject: Re: [PATCH net-next 2/6] net: stmmac: mediatek: add PERI_ETH_CTRLx
 register offset in platform data
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	maxime.chevallier@bootlin.com, rmk+kernel@armlinux.org.uk,
 kernel@collabora.com, 	netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 08 Jul 2026 13:44:36 +0200
In-Reply-To: <3e135fe0-4ef9-45be-a962-d131c8a2e9e0@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
	 <20260707-dwmac-mediatek-mt8189-v1-2-17f345eaaca3@collabora.com>
	 <3e135fe0-4ef9-45be-a962-d131c8a2e9e0@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_044513_229278_E49FD71B 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

Hi Andrew

On Tue, 2026-07-07 at 14:45 +0200, Andrew Lunn wrote:
> > +	.peri_eth_ctrl_offset =3D MT8195_PERI_ETH_CTRL_BASE,
>=20
> nitpick:
>=20
> Could the naming be more consistent? offset vs base?
>=20
> 	Andrew

Ack.=C2=A0

The commit description and subject also use offset terminology and not
base so better keep the consistency.

I'll rename this define to MT8195_PERI_ETH_CTRL_OFFSET in the v2
version and do the same for the MT8189 one in patch 6.

Regards,
Louis-Alexis

