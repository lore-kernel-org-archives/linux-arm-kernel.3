Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23224E81A24
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 14:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI4TauUaQM3GB5GqKkDqYSOsy+XFO04swF0+y9bWRrY=; b=Q2Vindsn10b72PirrRIf/DaJl5
	HPNtS2pnQkbmsQdx4Y+iecr+7sAdnQKve8kukROJHzwr6QL89/neh9ziKmVB1P7cpIk87bhFrIZs6
	MtOR/TcGWHZ76vLtmn6kDI1BBy//3M87S8af0niJulrQ21HSC8VtbOOi0+ehwZSxYSiXuN6rVmxp4
	Zse0oBL5lykTtIM+cGRpp/uibuk5z0cOn4JEkGcy6xk9ZDi6VeMoreBmj+vYpvHCTj+LGujQTkvea
	oO3lpIyPlhQENk5UzNUssmduGcEqk6aKbMa614vQyhmc7Q82C+qjn8ufNyhIsxAwq8CDPuopAkBjd
	aUNYCVLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzSp-00000006m0T-3yay;
	Mon, 16 Feb 2026 14:20:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrzSn-00000006lzz-2hn5;
	Mon, 16 Feb 2026 14:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771251635;
	bh=LpONIyurVKlNTOn/3d2FZntrtRRFlJmchmd0RLMCFp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lv7OKuFvFLoZjW/iPvVCHfLw3yaZpQvkh3sCrud39qbidVRk2kcy4bj8BV9HimpzH
	 WdoT65tJex7/y9zX1hnnbFB4PSh+wY7U2a2FhWurd81XyuRCidjy/cd6PtuCtRDOOc
	 9r2lwRDOBLwVoZHRTDcR2h+aGJ8UREz9vDQUIcy5/zJ6mud4XH9Ddbh4kMCC2R5/aY
	 MfzL7UuvaCA+TpZACzGQ6t8xBAi6Uz8ze2ejrhIkjlYCCrYectziG458moo1lBNsXZ
	 D3nuoqoOCfZfxAyulNvByrAtqFoeRgds6/BGcv3P1Bom4ePkeAjvqY92+C2sj4Gfd8
	 qIuFqm7x6OCkw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C40E917E0454;
	Mon, 16 Feb 2026 15:20:34 +0100 (CET)
Date: Mon, 16 Feb 2026 15:20:30 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Adam Ford
 <aford173@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Onur =?UTF-8?B?w5Z6a2Fu?=
 <work@onurozkan.dev>, Steven Price <steven.price@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v1 2/2] drm/panthor: treat sram as mandatory except
 mt8196
Message-ID: <20260216152030.5f91104e@fedora>
In-Reply-To: <aZMiv7ARO4TUSUTa@e142607>
References: <20260215100302.136719-1-work@onurozkan.dev>
	<20260216104423.6b5bcc96@fedora>
	<523c7b99-33a7-410d-8efb-b7bb2f2f416d@collabora.com>
	<4730819.LvFx2qVVIh@workhorse>
	<aZMiv7ARO4TUSUTa@e142607>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_062037_834224_428614C7 
X-CRM114-Status: GOOD (  32.39  )
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

Hi Liviu,

On Mon, 16 Feb 2026 13:59:27 +0000
Liviu Dudau <liviu.dudau@arm.com> wrote:

> On Mon, Feb 16, 2026 at 01:43:19PM +0100, Nicolas Frattaroli wrote:
> > On Monday, 16 February 2026 12:44:39 Central European Standard Time Ang=
eloGioacchino Del Regno wrote: =20
> > > Il 16/02/26 10:44, Boris Brezillon ha scritto: =20
> > > > Hello Adam,
> > > >=20
> > > > On Sun, 15 Feb 2026 16:21:34 -0600
> > > > Adam Ford <aford173@gmail.com> wrote:
> > > >  =20
> > > >> On Sun, Feb 15, 2026 at 4:04=E2=80=AFAM Onur =C3=96zkan <work@onur=
ozkan.dev> wrote: =20
> > > >>>
> > > >>> If sram-supply is missing, Panthor falls back to a
> > > >>> dummy regulator with a warning. This implicit behavior
> > > >>> hides missing DT wiring behind regulator core fallback. =20
> >=20
> > This is intentional design of the regulator API. A missing supply will
> > always result in a dummy regulator. The _optional function bubbles the
> > missing supply condition up to the caller.
> >=20
> > Catching device trees lacking supplies that are marked as required by
> > the binding is done with dtbs_check, not at runtime. =20
>=20
> I'm replying to this thread while I'm also trying to cover some discussio=
n in the
> DT patch series.
>=20
> What we're trying to solve is this: the Mali GPUs have an L2$+bits power =
domain
> that in upstream ended up being called 'sram' for reasons. The domain is =
important
> both for ultimate power savings (you can turn off most of the other GPU d=
omains
> and preserve enough state for the GPU to wake up on an interrupt) and for=
 normal
> operations, for obvious reasons. Now, vendors either don't bother to put a
> separate domain just for "sram" or go to the extreme of handing over cont=
rol over
> that domain to an MCU that implements aggresive and system-wide policies.=
 We're
> trying to cater for all cases, include the (currently hypotetical) one wh=
ere you
> have a separate "sram" power domain that Linux can control.
>=20
> When we have first upstreamed the bindings, inspired by Panfrost driver, =
we have
> added the sram-supply as mandatory which I think is turning out to be a m=
istake.
> Prompted by Mark Brown's reply[1] to Tyr adding 'sram-supply' as an optio=
nal
> property, Onur has started this and the DT patch series[2] to enforce the=
 presence
> of an 'sram-supply' to reduce the number of warnings in dtbs_check. In re=
ality
> what we are enforcing is a dummy supply that is the same as the one the G=
PU is using
> because most of the systems don't have a specific one.
>=20
> So the problem we have is: do we change the upstream binding and make 'sr=
am-supply'
> optional for every compatible string given that it is unlikely to be prov=
ided (and
> the code did not enforce it in panthor_devfreq.c anyway from the beginnin=
g), or
> do we accept that this power domain is important but usually not specifie=
d and we
> go with the current DT patch series that provides one?

My main worry with this approach is that SoC/board bring-up tends to be
an iterative process in practice, and it usually starts with a
bunch of resources forcibly enabled (either in the bootloader
or directly in Linux) because that's easy. Problem is, that's also very
easy to forget defining non-optional resources when the dts[i] is
upstreamed, because everything seems to work just fine. And because of
this DT backward-compat constraint, if get it wrong, and the supply is
needed for real, when we get to implement the real thing we're just
screwed. Having a runtime error preventing the device to probe forces
people to at least think twice before doing something stupid, like
making the SRAM (or L2-cache) supply point to the core supply when they
are two distinct regulator outputs.

Regards,

Boris

