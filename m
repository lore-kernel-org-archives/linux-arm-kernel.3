Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8228C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gcY7T0lP5le5CCNf+zhfFY+iI1N5QvSyJZnptU0Oys8=; b=vSBGEKZvN1iGdYe8d3Offhwnnj
	9q1qTk5nQoisht3AobZylZJxMC2o8miAequIr234SpqR2C7mAIUMEgi4zuhz/0TcSxxGrD0nyCABU
	L3hZKnwa3qCo0vC5IYboKW/eygHe7iabALZInWf0gAsYCeQmuwT+VsRTIk2M3j5lmclUIEM3ylRbN
	H5oiZPYmhKNFSH0tkGXoLy/xwdE2lXFzqA0X7pXkAqTfVDzymzXlFXLeCuhkWOG9L+zQRMstfFej7
	muJ0MVAeAP8UAt3xbLY0agpHiD4bjT4gx73bcqb0dD1RgAYDRyfdcY6B4R3rKJ+GfMb5Pw166WCuC
	6e/N0c5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQaa-0000000H1xU-3HzS;
	Wed, 08 Jul 2026 11:37:16 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whQaX-0000000H1wp-2r2B;
	Wed, 08 Jul 2026 11:37:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783510592; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fiM838OSJXxgoJdBoSWbg9eOpW3CqgvOWxKDidB7HrEtGzON8fr84bpH54/eWTMokKJGeHDcDC3nnYVk4PXKtWKRZ8YuoHs69TJbi8n1og/TFEs+dgzdDAJ2+0DE/KcqDXEHYoeEU9AYTGFqDed3+FOib+ScgGx/A8oJGBRFiak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783510592; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=gcY7T0lP5le5CCNf+zhfFY+iI1N5QvSyJZnptU0Oys8=; 
	b=Gb1vx0D3oEAGSswxky62uf/lSq8w8KZrVtlO0xcj6NALwgSI8elGNHJix84Q3+ITAfHFzoZc9fEBQyukiWVOJkdmrVr0HuZauE7AYvG2itYZUaKYdFplRrq4EReb8NcMpzEkeZeiDqIab3npvRk3Fr2+SKleQLi0R6yMI711yaI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783510592;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=gcY7T0lP5le5CCNf+zhfFY+iI1N5QvSyJZnptU0Oys8=;
	b=SgpZaz1LyvYikKA5/5BCe443LYNenKVSqHw4XguZa+HpuQiaQYXH8hvKhF1ve3KN
	ZZoSo3RXdwCGd6wE8gqO29opjDcsyyTT+lqZyJ5l1iegYaA+7VTNePrzVIX43pIzAZs
	LmElpjbQ+VBGQ+Mc7vZhhZGbSXxNb2Y7Y6gzMLQI=
Received: by mx.zohomail.com with SMTPS id 1783510588746822.2863328296761;
	Wed, 8 Jul 2026 04:36:28 -0700 (PDT)
Message-ID: <8304b0a704c8db697767584b8c34388f07ba401d.camel@collabora.com>
Subject: Re: [PATCH net-next 1/6] dt-bindings: net: mediatek-dwmac: add
 support for MT8189 SoC
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
Date: Wed, 08 Jul 2026 13:36:21 +0200
In-Reply-To: <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
	 <20260707-dwmac-mediatek-mt8189-v1-1-17f345eaaca3@collabora.com>
	 <b810b9cd-8f5e-4c9d-8496-908aae55dac1@lunn.ch>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043713_773572_E8DC48AC 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Andrew,

On Tue, 2026-07-07 at 14:42 +0200, Andrew Lunn wrote:
> > +=C2=A0 - if:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enu=
m:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 - mediatek,mt8189-gmac
> > +=C2=A0=C2=A0=C2=A0 then:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - d=
escription: MAC Main clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - d=
escription: PTP clock
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - d=
escription: RMII reference clock provided by MAC
>=20
> Since this is a MAC, it sounds like it is consuming its own clock?

In the driver ([1]), this clock is described as being only used and
needed in RMII when MAC provides the reference clock, and useless
otherwise (RGMII/MII or RMII when PHY provides the reference clock).

Its use and configuration also depends on the "mediatek,rmii-clk-from-
mac" vendor property ([2]) presence in devicetree.

Do you wish this clock description be reworded in the dt-bindings for
both occurrences?

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c#n480
[2]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Do=
cumentation/devicetree/bindings/net/mediatek-dwmac.yaml#n108

Regards,
Louis-Alexis
>=20
> 	Andrew

