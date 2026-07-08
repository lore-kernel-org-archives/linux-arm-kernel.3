Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C67E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 12:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wGYZTikwg2rXaLxaDX2K7Y9au6mX/qYf21+84FQdF+0=; b=WdVh3e6c76cC6kApgvJ4jiGurK
	l+yAZGrScJ0e3XRownOJ4zwswdzfkR7MkPVxh7QHumOFwDYHKlcg7QuBjSTFUFxOTuX2mDjkvpxkq
	ZbfZLgKiwxY0zE5PMDcD4HifrfzpWuEUeRRLM+8uXECd7TT3M1KlCvTGo83AO1W2+3kLb2wZWa8Vj
	sxBoK6cC9ui/lq+0zXH1Op0gF0TqhoXm1k8XV77MJuAIswFbpGDPLJkicRjYehTQCCsic43qvEpvK
	FGsiaeYDNGp5O3uaJ8+zg+lknXGh8A8s0Zo1iARsuGbaZgOFb5rvZcfpeOdLukUsoJN8VulJOY5Mx
	SmYEa66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR2L-0000000H3hG-3NTv;
	Wed, 08 Jul 2026 12:05:57 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whR2J-0000000H3gr-0LkS;
	Wed, 08 Jul 2026 12:05:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783512307; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KvgWjgnVrtF6+ZkBWicFziVYuQdsIssCDuicOCsak8yQIYN7+5NGdf+ouUluqMO+Ev9SpCAtLa9UAT0ZMlgXiSB9fnXQvS3VTwuC0nWRDjuzSKl2xyNx2lP4/AACMn9OXW18m83oYXQSvoABm1Md5du7KWpgypvrj/KL/C/BvOY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783512307; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=wGYZTikwg2rXaLxaDX2K7Y9au6mX/qYf21+84FQdF+0=; 
	b=i+SFhQOt8b7X+gb4HX6jliFLSEB9iWLysvFJn85UUCNPBSUlqm6LfKn81LjB2ZHGWpqst9XokiDCZIokBV4eByx9ip9FUP+H/CCPbfSzyqN+p47WVR2x96GqZ1hz6NZyIuQ+FKj317l4DDPoEhyS7bJN1g38dA+n5857+d9hjZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=louisalexis.eyraud@collabora.com;
	dmarc=pass header.from=<louisalexis.eyraud@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783512307;
	s=zohomail; d=collabora.com; i=louisalexis.eyraud@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=wGYZTikwg2rXaLxaDX2K7Y9au6mX/qYf21+84FQdF+0=;
	b=EL8T/+B7liCUlfZVaMPg9+sHHWJLi6JR1rw48kEi/26KZG9GVaSE91tpGn8QaUwq
	zOQx89xA1YldfIIOlBnXMApdwV0+nR1dNcGKgWuVRwjL5ACuITyd4pP7q5KXz7I3mqp
	3q+Jp1BO50LeAAOOYScLmdFpi7obyJAdCFf/uy1o=
Received: by mx.zohomail.com with SMTPS id 1783512305076652.4555392247563;
	Wed, 8 Jul 2026 05:05:05 -0700 (PDT)
Message-ID: <658a04060e5c415af97dcc84284ab8962d1b7348.camel@collabora.com>
Subject: Re: [PATCH net-next 3/6] net: stmmac: mediatek: rename MT2712 and
 MT8195 variant methods
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
Date: Wed, 08 Jul 2026 14:04:59 +0200
In-Reply-To: <5dbd217b-8df5-42cd-9197-36e0fb91ffe7@bootlin.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
	 <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
	 <5dbd217b-8df5-42cd-9197-36e0fb91ffe7@bootlin.com>
Organization: Collabora Ltd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_050555_183958_5D388C8D 
X-CRM114-Status: GOOD (  22.18  )
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

On Tue, 2026-07-07 at 11:05 +0200, Maxime Chevallier wrote:
>=20
>=20
> On 7/7/26 10:21, Louis-Alexis Eyraud wrote:
> > In preparation of newer SoC support, rename MT2712 and MT8195
> > variant
> > methods and sub functions to more generic names.
> >=20
> > Signed-off-by: Louis-Alexis Eyraud
> > <louisalexis.eyraud@collabora.com>
> > ---
> > =C2=A0.../net/ethernet/stmicro/stmmac/dwmac-mediatek.c=C2=A0=C2=A0 | 32
> > +++++++++++-----------
> > =C2=A01 file changed, 16 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > index 0cabab4fd89a..28e87990b0a1 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> > @@ -110,7 +110,7 @@ static const char * const mt8195_dwmac_clk_l[]
> > =3D {
> > =C2=A0	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
> > =C2=A0};
> > =C2=A0
> > -static int mt2712_set_interface(struct mediatek_dwmac_plat_data
> > *plat,
> > +static int set_phy_interface_v1(struct mediatek_dwmac_plat_data
> > *plat,
> > =C2=A0				u8 phy_intf_sel)
>=20
> What does this naming of "v1 / v2" refer to ?
>=20
> I personally don't find it much better than the current one prefixed
> by the SoC
> name. You still end-up using registers that have the "MT8195_" prefix
> in their
> names in the 'v2' variants of these functions, so it still sound SoC-
> family specific :)
>=20
I agree.

In a work in progress version of this series, I had renamed all
register definitions as well (to remove the mt8195_ prefix) but dropped
the changes because too much difference for little gain.
I kept this patch but it does not really improve the code.

> I'd say you can keep the original names as-is, or if you really want
> a rename,
> maybe use the mt81xx_ prefix for MT8195 and MT8189 ?
I'll drop this patch in v2 to keep the existing names (and smaller
changes).

Regards,
Louis-Alexis

> Maxime

