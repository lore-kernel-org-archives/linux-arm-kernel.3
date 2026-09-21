Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EE8C982F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 04:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdNKTyGnq1+CX6eo+3+aZ6ceTiVolEgj20lCF+EVkZw=; b=or1L+bHadCT75IotJoHzi/S/AY
	JgxA0H4ktNC/ao+nb/1ov+RmHJK/11Ow/g2n7GCClC8vOC/SwMP5qCpno7cOOWNkVMFqgrh/uZkTE
	kthvFrgw+nU5tObjvPdZv1z1agvgsdSBChQLDWJiK7lOT3wuvZdBeHmWA+4Rs04AJVH+FW/xsQ1pC
	mqAd1HRf7rkpU5usKR7GxNnNf/5Q0TH1eJpDznsi0zNw9EhQPFg3z6m1wEPIA9eO+JmhuMdyjWHfk
	M4QwG/+qCwZ2oU/PAlFcOuKjxZ1C4mdrjdGkQtlbyyykkDRKJWHu5UbTNTzkFxEa8GTDdysYf3o1O
	INcjdRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VUo-00000000oFQ-0bxr;
	Mon, 21 Sep 2026 04:19:14 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VUk-00000000oEy-0iWb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 04:19:12 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.44])
	by APP-05 (Coremail) with SMTP id zQCowAD3ZD80sLBqH53SCA--.25119S2;
	Mon, 21 Sep 2026 12:19:01 +0800 (CST)
Message-ID: <75baf71c31b5d6aff74b7d472ca48fa83ff74707.camel@iscas.ac.cn>
Subject: Re: [PATCH v7 7/7] drm/verisilicon: fix DC8200 primary plane
 disable clearing FB_EN
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Joey Lu <a0987203069@gmail.com>, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 21 Sep 2026 12:18:59 +0800
In-Reply-To: <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
References: <20260918030125.315978-1-a0987203069@gmail.com>
	 <20260918030125.315978-8-a0987203069@gmail.com>
	 <4a7b271d2a90eff94c27dec3bf24114ce44df1fd.camel@iscas.ac.cn>
	 <1d988dfb-c930-4c17-ae77-47b93ff9f159@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-CM-TRANSID: zQCowAD3ZD80sLBqH53SCA--.25119S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCw43uFWrXryxKw13WrykZrb_yoW5XF4UpF
	s0vFW8KFs5Z3y09a4xtFyqga1Yy3W7t3s5Jr18GryYvrn8tr9rWFW8Jr9xZayDWrWxGF4S
	qF4v9a9xCFyUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-Originating-IP: [112.94.103.44]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_211910_603689_DB598388 
X-CRM114-Status: GOOD (  21.82  )
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

=E5=9C=A8 2026-09-21=E4=B8=80=E7=9A=84 10:43 +0800=EF=BC=8CJoey Lu=E5=86=99=
=E9=81=93=EF=BC=9A
>=20
> Icenowy Zheng =E6=96=BC 2026/9/18 =E4=B8=8B=E5=8D=88 01:52 =E5=AF=AB=E9=
=81=93:
> > =E5=9C=A8 2026-09-18=E4=BA=94=E7=9A=84 11:01 +0800=EF=BC=8CJoey Lu=E5=
=86=99=E9=81=93=EF=BC=9A
> > > vs_dc8200_primary_plane_disable_ex() calls regmap_set_bits() on
> > > VSDC_FB_CONFIG_EX_FB_EN instead of regmap_clear_bits(), so
> > > disabling
> > > the primary plane on DC8200-family hardware actually leaves the
> > > framebuffer enable bit instead of clearing it.
> > >=20
> > > This bug predates this series: it was carried over unchanged from
> > > vs_primary_plane_atomic_disable() when patch "drm/verisilicon:
> > > introduce per-variant hardware ops table" split the DC8200-
> > > specific
> > > implementation out into vs_dc8200.c.
> > >=20
> > > Fixes: dbf21777caa8 ("drm: verisilicon: add a driver for
> > > Verisilicon
> > > display controllers")
> > Maybe it'd be better to fix this before adding DC variant
> > abstraction,
> > for easier backporting.
> >=20
> > Thanks,
> > Icenowy
> Makes sense. Should I send it as a standalone patch targeting
> drm-misc-fixes (separate from this series), or do you have a
> different preference for how to split it?

I prefer a standalone patch, although changing the patch order to
before other drm/verisilicon changes is also okay.

In fact there's another point that seems to be fixed, and that fix
should be more easier with this patchset --
vs_primary_plane_atomic_update() (which operates with new plane state)
calls vs_primary_plane_atomic_disable() (which operates with old plane
state). With the refactor in this patchset, both calls can be directed
into the primary_plane_disable_ex callback (or maybe _ex could be
removed because no further hardware operation is present).

Thanks,
Icenowy

> >=20
> > > Signed-off-by: Joey Lu <a0987203069@gmail.com>
> > > ---
> > > =C2=A0=C2=A0drivers/gpu/drm/verisilicon/vs_dc8200.c | 4 ++--
> > > =C2=A0=C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> > > b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> > > index f72da10295e1b..25b5906a1c5fc 100644
> > > --- a/drivers/gpu/drm/verisilicon/vs_dc8200.c
> > > +++ b/drivers/gpu/drm/verisilicon/vs_dc8200.c
> > > @@ -70,8 +70,8 @@ static void
> > > vs_dc8200_primary_plane_enable_ex(struct vs_dc *dc, unsigned int
> > > out
> > > =C2=A0=20
> > > =C2=A0=C2=A0static void vs_dc8200_primary_plane_disable_ex(struct vs_=
dc
> > > *dc,
> > > unsigned int output)
> > > =C2=A0=C2=A0{
> > > -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > -			VSDC_FB_CONFIG_EX_FB_EN);
> > > +	regmap_clear_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
> > > +			=C2=A0 VSDC_FB_CONFIG_EX_FB_EN);
> > > =C2=A0=20
> > > =C2=A0=C2=A0	vs_dc8200_plane_commit(dc, output);
> > > =C2=A0=C2=A0}


