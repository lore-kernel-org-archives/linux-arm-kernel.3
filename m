Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28597C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=; b=US8zmz3aGZj8UTbvw8dF3KXhfh
	wiHp+e1A8lEMm21Dy1Ut2X0uaedWz+crGk+P4dCXmA3eA8Bs31pWwyk6xq9Zm3SfwxKqiyrFatvth
	q6DdPghEGWNIwzBVIqHzZa9ByvH4GuNo4RouxQpP7rVCav4GvUuD2KgZ9ZE8xiSBFJGSdJr+xCG+q
	6qmZfnBqIhKTgT0G3TlliXb8mouFcx5EkjTZRMLvj5By0vDO53oFD3nvZJXwbxjv5An/LSYDUndrP
	yNJg+AqADn5OSFUmf+t7txM/KyDSxpXNFWdD/rBUryBHvwdfFqMbtRbbSWbEnohTSZ088L/f9spLH
	+y5VQ1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnsP-0000000EMIN-2otL;
	Thu, 12 Jun 2025 19:46:19 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPkX5-0000000Dufr-2Ck7;
	Thu, 12 Jun 2025 16:12:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749744714; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jYPHD2l/zJ3su6lP130DojZirFBDkFLTji72xBSpawIGXXSV0wFpaMNKWRMDmmR8Wmo50DQ7Tk5Gq6RpqVOLlxat9lVr+zgjRSDHVxnvqCFGVhbMZQ9Ra4BEICpgJ5PG7EDxcnlXoZKo9xdGM7K3ziH+DN9papVdBjCRluyMJmA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749744714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=; 
	b=OSh2Z/sDsqOZAp7xuCJ+573tzsP+7lPgY4NPwO8XnPar3qp/eBU2VsvUU8zxI/PoCSsC88hvL9dX4f3G7XmDw86eRhXCvqr1p2kXrxDVTX326+Jz+YJAV9+zghnB8zRd0dUasP7ioQnf8B19WjWZaxQpfGtRbzHOiwoxJynsmxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749744714;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=XPNH0zAjZMtcy8SGc/xpsdQgVSTCk0Ndsxo7h4JpeKM=;
	b=NJEQMW0mjJ12hH2ZMehzEujJty2xY1lQrqfDkqNkHU2U8AefwxzhYV+k7eVTNNtj
	2isSFGEPiKmWmIIM7wCNir4iLLdCJDE4o4V3tD3prgRY0emHCaHB/TY1X693Q/hQ2Br
	R7I3nUCO462tINGcxM+GLG20jVI8057Wrm6eiwybw3OwQhtYCtApfLwB9q/LuDOx6or
	9oQj16gey48His7rPPPj0nT7JbIhFA0Wfb//uNyalcmmb1VwEf++h9Eshg17FDd9m/v
	YefU75tH9NqS4Ih71G5MAUmxxE24POffc8efJsKtdJieERz1EPF+y7qksMIYNbOupc5
	v1ea2+ouYg==
Received: by mx.zohomail.com with SMTPS id 1749744711397806.3789973608574;
	Thu, 12 Jun 2025 09:11:51 -0700 (PDT)
Message-ID: <8a1312fbafe65b3fbd2ed7a1fb9f618654fc5d59.camel@icenowy.me>
Subject: Re: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 
 =?gb2312?Q?Rafa=810=920_Mi=810=920ecki?= <rafal@milecki.pl>, Chen-Yu Tsai
 <wenst@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org
Date: Fri, 13 Jun 2025 00:11:44 +0800
In-Reply-To: <20250612-scholar-crown-517f28582edf@spud>
References: <20250612135559.2601139-1-uwu@icenowy.me>
	 <20250612-scholar-crown-517f28582edf@spud>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-ZohoMail-Owner: <8a1312fbafe65b3fbd2ed7a1fb9f618654fc5d59.camel@icenowy.me>+zmo_0_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_091203_629933_69E43954 
X-CRM114-Status: GOOD (  17.01  )
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

=E5=9C=A8 2025-06-12=E6=98=9F=E6=9C=9F=E5=9B=9B=E7=9A=84 16:34 +0100=EF=BC=
=8CConor Dooley=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, Jun 12, 2025 at 09:55:58PM +0800, Icenowy Zheng wrote:
> > My Lenovo Flex 11 Chromebook contains a board with revision ID 2.
> >=20
> > Add rev2 to the compatible list of base hana DTB to allow
> > depthcharge to
> > match the DTB.
> >=20
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> > =C2=A0Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > index 108ae5e0185d9..7d13547ff57ba 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -132,6 +132,7 @@ properties:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev5
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev4
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana-rev3
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: google=
,hana-rev2
>=20
> Ordinarily I would complain about inserting a compatible like this
> being a problem, but these chromebooks are all cocked up so w/e
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Yes, the DepthCharge bootloader seems to have some different
understanding of root node's compatible -- it just generates
"google,${device}{-rev${rev},}{-sku${sku},}" and match them in the DT's
to get the most compatible DT.

BTW I checked the Chromium OS hana DT, it lists down to rev0, but what
I get is just rev2, so I just added rev2.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: g=
oogle,hana
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: m=
ediatek,mt8173
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Google Hana rev7 (P=
oin2 Chromebook 11C)
> > --=20
> > 2.49.0
> >=20


