Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E88CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=; b=jwDr9WJUMr/p602aVaq41ZAmrm
	JmPlTIQye/bYunkXop0+BWyuImoleuiPrSTWNfppgITB6k6LSQi/t0L6u8c9nC+OdNb6tjBdAIYdY
	A0UT+nwqpCTtmHbmA/z20jHSWGvdYa4QDJU+gJnTJ3WWvLcASTHcpDR5Y9UsU/v94kkvXId5Ahr2s
	rLEN014qNaYWLW+Kf+MFy4NtFIc2C/vwnzXycIRqclUUqHLXCVBPKNRWwvNBCW66/WlJSiStvWf7x
	cmnSGSY607/QsmbB1WqqPjVsVXxPJJu21ENSZO1ozmR/lzm2SLi7ruWExVxcFiLftDIdX9kDoVnYZ
	AnfCWYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03N-00000007UBd-2O35;
	Mon, 18 Aug 2025 13:37:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unvCN-00000006wGI-429D;
	Mon, 18 Aug 2025 08:26:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755505586; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TkJ31jB1dC74/EBx/flkMf5oj39dXFkwhuGHCgNWMHshBoZwvchGHGGaLjonlfPpqgvfLjUrSldiTo2oevGRJV0Lxe4HcEjF5MqnEWAUBqNviLmUMnnyBleq+Tsu1uW/POR83UfsEVEKZ42FucmIKAJK7uka8HXXft2/7JHakF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755505586; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=; 
	b=PqLvXOzE7JsmOuiLkeNQpW6C6Ss9RuJxdxmj9VlOs0A1EyuMGiJ9/dNdOD+pwHb9e96QZ3t1QsqjyMlEVyrWOjQMdn9eu4RVi/WX4IPWcCN2X9Plb5eglP6XF07IoLEqOH+fhPvaS4EpcMSHMccPcGkinXnAZGF1yyfiQ4noLRk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755505586;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=tj2yGevcfo5KIS3N2gQc2IK6xq5EamVZy8KjuhEWC4g=;
	b=UdZmtK5LGeSmkPXn3snFHzL0cEnDQv2TqrktxrtgQhUDAVyuoZYSchXasjg6Z5+e
	NClvxAnPJEmnI5f3CqlQxKGBH6QzG4VI0aRtiD64hpcuAAWZxMUiq9sxUiDlFanjmFH
	MIcPnxrtFGCBnWSho07TqHbBltep/zVYUH1aYLJA=
Received: by mx.zohomail.com with SMTPS id 1755505583162870.9854534398668;
	Mon, 18 Aug 2025 01:26:23 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Jonas Karlman <jonas@kwiboo.se>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alex Bee <knaerzche@gmail.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] media: rkvdec: Add HEVC backend
Date: Mon, 18 Aug 2025 04:25:58 -0400
Message-ID: <6183937.lOV4Wx5bFT@earth>
In-Reply-To: <d7446ed8-4af1-475f-88e0-07025c60d0b1@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se> <13998356.uLZWGnKmhe@earth>
 <d7446ed8-4af1-475f-88e0-07025c60d0b1@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_012636_072644_087B4670 
X-CRM114-Status: GOOD (  39.87  )
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

Hi Jonas,

On Sunday, 17 August 2025 12:39:01 EDT Jonas Karlman wrote:
> Hi Detlev,
>=20
> On 8/12/2025 9:54 PM, Detlev Casanova wrote:
> > On Tuesday, 12 August 2025 09:07:33 EDT Nicolas Dufresne wrote:
> >> Le mardi 12 ao=C3=BBt 2025 =C3=A0 02:58 +0200, Jonas Karlman a =C3=A9c=
rit :
> >>> Hi Nicolas,
> >>>=20
> >>> On 8/11/2025 11:07 PM, Nicolas Dufresne wrote:
> >>>> First pass of review,
> >>>>=20
> >>>> There is obvious conflict between Detlev RK3388/3576 series, please
> >>>> coordinate. By picking the same direction, the common code can be sp=
lit
> >>>> from platform code, and then both sets can share that common code and
> >>>> avoid conflicts.>
> >>>=20
> >>> Yes, it is very unfortunate that Detlev did not base the work on v1 of
> >>> this series, this has been sitting idle on the list for almost 2 years
> >>> only waiting on its dependent H264 High10/4:2:2 series to be merged.
> >>>=20
> >>> Most feedback for v1 was related to unstaging and the series could be
> >>> applied clean until iommu detach/attach was introduced very recently.
> >>>=20
> >>> This series has also been referenced in multiple threads related to
> >>> rkvdec2 work, most recent at [1]. Unfortunately, I have missed both v1
> >>> and v2 of Detlev's new rkvdec2 series, and was not able to send a v2 =
of
> >>> this until now due to family tragedy.
> >>>=20
> >>> I will take a closer look at Detlev's new rkvdec2 series and see what=
 I
> >>> can do in a v3 to ease any merge conflicts.
> >>=20
> >> All in all, I'd like to have both of these series ready for 6.18. To
> >> avoid
> >> the need for dependant series, I can pick top patches if the preparati=
on
> >> is
> >> properly split from the platform specific code. Please make you
> >> recommendation.
> >>=20
> >> My main concern at the moment is the back and forth from register to
> >> structure, Detlev already ported everything else to structures, so
> >> porting
> >> a single codec for a single SoC seems like the least amount of work. I=
'd
> >> like to ear if any of you would be willing to convert it. This way I c=
an
> >> land the conversion early, and we remove one massive clash between the
> >> two
> >> sets.
> >=20
> > The conversion won't be too difficult to manage, I can do it as I did f=
or
> > h264 and add that to my serie over this one.
>=20
> Thanks, I very much appreciate that!, I won't have time to look into a
> conversion until at earliest next weekend.

I pushed a branch with my series rebased on yours[1]. It ports the hevc cod=
e=20
to using structs (for registers).
Also move the cabac table and common hevc functions.

Reports indicate that all works well :)

> > As my series is already doing a conversion, I'm not against keeping this
> > one without structs and simply do the conversion later, even if that
> > means merging code we know will change later.
> >=20
> > I'd also like to mention that currently, my serie changes the writel to
> > structs only for the registers, not for PPS and SPS.
> > So I don't mind keeping that part as is for rkvdec-hevc.
> >=20
> > For the variants support, I can also merge in my changes: my rkvdec_con=
fig
> > would just become an extention your rkvdec_variant.
> >=20
> > Finally, this series has been here for longer than mine, so it's only f=
air
> > to have me rebase mine, especially because it means doing a bit more of
> > what I already did.
>=20
> Great, I will try to get a v3 out in next few days after addressing some
> of the feedback.

I will rebase on your v3 and send my v3 when this one is accepted.


[1]: https://gitlab.collabora.com/detlev/linux/-/commits/add-vdpu381-and-38=
3-to-rkvdec-v3
Regards,
Detlev.



