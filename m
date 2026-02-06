Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E62FEE209F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csYVRUvVWbvvf8wcgd3EzDmqbBogEBisUcbX8ERb4cc=; b=202VL2rJTkKo4z7DywR5pfn/RU
	/4f9YWjeaHrPSTx6JVbp2xV8tBqsoTcnc5Wdlb8H9achJLtPZCHUcmLNXAINa0ahyax4I3wCyIR5l
	4ibWiOpDLWw8X8RAUeJHerruudbMqrv/4b95EV4Z9RVmp1FblOh/2AiIzG698wv1jfD+i/W+A6ZaP
	JovCLdu3FBpE1MmysFNISn+IYjXDQif0IPtKweF/cguIGfN4AuN9SgSkSGj/cWfMZijDmizgOQL1D
	BQVo1AJ63GMY43Sr5rTNMYU2MG5rrRP/c67IRWtVxPXvf57rjiSxTkRtF4/zCAENyQ4HWKl4qe9k6
	oxzQ3OtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLt8-0000000BMYq-2mMv;
	Fri, 06 Feb 2026 13:28:46 +0000
Received: from sender4-pp-g124.zoho.com ([136.143.188.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voLt5-0000000BMYI-0MwR;
	Fri, 06 Feb 2026 13:28:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1770384499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DNhXkQAPNzKgJra5xvbEkd80zM2ctRyQgWLurnlSVP13dexpfwbAKcknatu//Q/o50gvTzcTEQ1NKyu4UyPQubFoIfJj4S1uvzA4F86BsTqZWnzD5BFKT0lbGbCBxvP6u33L52vMVEiBEx1xnqNWPkOqyqCzvTXOOFWBDQx4Bwg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770384499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=csYVRUvVWbvvf8wcgd3EzDmqbBogEBisUcbX8ERb4cc=; 
	b=krYDuojyZe9hxAX+UOlCdC2mVhUbMfhuPLmX5QHqX2jXYjuoOaNz0p81QpwP9tkJQIBY++TDZUzlCbo8pJTHM7xQ5iXOL+4v6boDpZiiJsq2BLg93Jp5mes0JCKBEa07dy/MYKrR/qCqfjKYXX2zf/9kNAtUzIePQZi6dDqDgAE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770384499;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=csYVRUvVWbvvf8wcgd3EzDmqbBogEBisUcbX8ERb4cc=;
	b=MrABODs6Py2CZvfpDoWRviO/GTkEp24s+p+eSLIJjgdUCsmV3rSofLHtmRnF9AlB
	g1FUot3Db3J43BCNok1/pw+tAAHX+T57QxXQxqOsfDKN5vLn4VDBDquF+GobbLl6C6H
	IHbllLMwcl6p6cei54ZQmkuUz9CM38SovbYHkROs=
Received: by mx.zohomail.com with SMTPS id 1770384497666336.13465611924744;
	Fri, 6 Feb 2026 05:28:17 -0800 (PST)
Message-ID: <5963bca37996fa054ad75d4e5017d9c7e5158e9f.camel@collabora.com>
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>, Harry Wentland
	 <harry.wentland@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, daniels@collabora.com, 
	ariel.dalessandro@collabora.com, kernel@collabora.com, xaver.hugl@gmail.com
Date: Fri, 06 Feb 2026 08:28:14 -0500
In-Reply-To: <20260206110901.660cf712@eldfell>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
		<TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
		<TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
		<cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
	 <20260206110901.660cf712@eldfell>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_052843_196315_D18D4AC8 
X-CRM114-Status: GOOD (  25.76  )
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

On Fri, 2026-02-06 at 11:09 +0200, Pekka Paalanen wrote:
> On Fri, 2 Jan 2026 13:40:21 -0500
> Harry Wentland <harry.wentland@amd.com> wrote:
>=20
> > On 2026-01-01 07:37, Shengyu Qu wrote:
> > >=20
> > >=20
> > > =E5=9C=A8 2025/12/30 02:53, Shengyu Qu =E5=86=99=E9=81=93:=C2=A0=20
> > > >=20
> > > >=20
> > > > =E5=9C=A8 2025/12/24 3:44, N=C3=83 colas F. R. A. Prado =E5=86=99=
=E9=81=93:=C2=A0=20
>=20
> > > > > Given the lack of support for writeback connectors on the
> > > > > MediaTek KMS driver, combined with limited hardware
> > > > > documentation, I haven't been able to verify the correctness
> > > > > of
> > > > > each curve, only that they were visually sane (gamma curves
> > > > > made
> > > > > the image on the display brighter, while inverse gamma made
> > > > > it
> > > > > darker).=C2=A0=20
> > > >=20
> > > > Hmmm I don't think this is acceptable. sRGB/scRGB has two
> > > > transfer
> > > > functions mentioned in original specification[1]. To keep color
> > > > accuracy, we need someone from mediatek confirm whether this is
> > > > piece- wise or pure power 2.2 transfer function, this is
> > > > already
> > > > done in original amdgpu color pipeline series, sRGB means
> > > > piece-wise while also dedicated power 2.2 function exists.=C2=A0=
=20
> >=20
> > Not sure what you mean with this not being acceptable. This is
> > about
> > enabling HW support for this functionality. Not every HW has
> > writeback for testing. At some point you'll have to trust the
> > driver
> > devs if you're going to use functionality of the driver. We're not
> > always going to get everything perfect, but if that's really such a
> > worry you can always use shaders to do precisely what you want.
> >=20
>=20
> Hi Harry,
>=20
> yes, but I understood that in this case, the hardware documentation
> available is so vague that it's impossible to say what it will
> actually
> do. There are no formulas given or referenced in the documentation,
> are
> there, N=C3=ADcolas?

No formulas at all, the only documentation I had available for the
curves was the register definition, which simply lists the possible
values: SCRGB, BT709, BT2020, HLG.

--=20
Thanks,

N=C3=ADcolas

