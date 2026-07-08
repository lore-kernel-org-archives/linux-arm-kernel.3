Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEBCC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCvu92owlqFigfn30SNdUxyYgy9yaDdYJCfmb5B8+hA=; b=Gd/feHaatx8j6mkwTINkq8/W2c
	yB/6u2uiamvelb36Rk61oYo1AUUeBxwjSupF7NZ/2M2zPsynxGsJb/PhUwzMU5hCuHntitNgyiL/n
	TupGtv9uLj80HbXof6FCXDdzBitu3NXq4whAvwte//2WIyFI34OU4qs75KpS/Wqj2l7/K6BXkJYlQ
	7WsZ4oLwJvGHO7wvbzjCj0P7RDJYlLqPwJHq4Ce6Mq9b17KocPjGqO9cEXBL+S1IboAqKbDWF86cx
	T764gGsGPCU5zNJs485IpIhCdHdT82DAR8CieP+scsxx9ExrxTndU+OcgpCQItsPAeNr/v4xpFCYK
	vkwYKXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whROm-0000000H7hC-0Dah;
	Wed, 08 Jul 2026 12:29:08 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whROk-0000000H7go-04TR;
	Wed, 08 Jul 2026 12:29:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783513718; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dmk5QtOSqylrvj1O3kiWrYo5jOBHtMdHnLgwpkgK/OeYJcaygEFc908bdEjJcwFL8duOUKfqaBXGOC+SRZSCHufdPYaYi9PLGNM8bRxhcFLFnofEyRbsoTBNyULAcUmy14ns31kQof4IQPKzXk0XT8RQSPfV+HzfwpBImuFSjoI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783513718; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QCvu92owlqFigfn30SNdUxyYgy9yaDdYJCfmb5B8+hA=; 
	b=TUVE5cAWvaUKOL/7VkXKNsheZFAnqsjFihWOVi5E8/Lf3tOGzoa/GO+f4zkq6Tnoe+IopkOelUVU/gUR72HtIh4Cuvzg1DGca0jE5//B0m0MTT5dIGFCJ1yRRuscfQIB3dWcW5Zc8zDQl5E1y6DCGRw/JiBf04r8cl6BSbEceZo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783513718;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=QCvu92owlqFigfn30SNdUxyYgy9yaDdYJCfmb5B8+hA=;
	b=h6bRTRdCEfGpTsXUdZushp4txBmx8lAJ2sgujTR/sAo9JJSBSlceJfhV4vZkaYkY
	rtrySVIeuYT8F3dzrFdpWNZza1RcYhMupJRR8ITAYN7hBDSSyKEo6vz8FjpFDY09sUP
	Nkn2iZd7+RFWywEK1Pwpr2rr8GIUn8Cc/b1GUQZQ=
Received: by mx.zohomail.com with SMTPS id 1783513715946883.1743690151607;
	Wed, 8 Jul 2026 05:28:35 -0700 (PDT)
Message-ID: <e390664dc439043a43b6ded3c50c9a2bb5bbd2f6.camel@collabora.com>
Subject: Re: [PATCH net-next 5/6] net: stmmac: mediatek: add support for TX
 deallocation adjustment feature
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran	 <richardcochran@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Biao Huang
 <biao.huang@mediatek.com>, Maxime Coquelin	 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: rmk+kernel@armlinux.org.uk, kernel@collabora.com,
 netdev@vger.kernel.org, 	devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com
Date: Wed, 08 Jul 2026 14:28:30 +0200
In-Reply-To: <2a421449-01eb-4066-8c19-d554ff8e4f6e@bootlin.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
	 <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
	 <2a421449-01eb-4066-8c19-d554ff8e4f6e@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_052906_123279_0629E83E 
X-CRM114-Status: GOOD (  23.43  )
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

Hi Maxime,

On Tue, 2026-07-07 at 11:11 +0200, Maxime Chevallier wrote:
> Hi,
>=20
> On 7/7/26 10:21, Louis-Alexis Eyraud wrote:
> > The MT8189 SoC has in the Ethernet control 0 register from the
> > peripheral configuration (pericfg) additional bits to adjust the TX
> > deallocation.
> >=20
> > In preparation of MT8189 SoC support, add its definition, use in
> > the
> > set_delay_v2 callback, and a support flag in the platform data.
>=20
> Can you elaborate a bit on this ? I don't quite get what you mean by
> "tx deallocation", this seems to have to do with RGMII timings from
> the register access pattern, but the local boolean flag for the
> feature
> is named "use_stage_fine", I'm failing to connect all the dots here
> with the different terminology in use :(
>=20
The data sheets I have, don't have info regarding this register, so
I'll try to get more and improve commit and/or code description.

I'll also check if the register definition name is consistent
(downstream driver and upstream u-boot use this stage fine term).

The use_stage_fine feature flag could be renamed anyway to match what
it does.

> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0.../net/ethernet/stmicro/stmmac/dwmac-mediatek.c=C2=A0=C2=A0 | 25
> > ++++++++++++++++------
> > =C2=A01 file changed, 19 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index bcc0baef3f71..6b0a42b5839f 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -37,7 +37,8 @@
> > =C2=A0#define ETH_FINE_DLY_RXC	BIT(0)
> > =C2=A0
> > =C2=A0/* Peri Configuration register for mt8189 */
> > -#define MT8189_CTRL0_TXC_OUT_OP		BIT(20)
> > +#define MT8189_CTRL0_TXC_OUT_OP			BIT(20)
>=20
> Extra whitespace inserted here :)
>=20
Oops, to be fixed in v2

Regards,
Louis-Alexis

> Thanks,
>=20
> Maxime

