Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A93AC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 22:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePwAWTLBP0goybEt9LUIGj7rug40FGOIf/8aHv/KjBQ=; b=p28AfZDoEpPc7bY0z7005jCgLm
	leOcMBKIUxku9vNCXlAFjj4sT2Yw0+JBWGSls56xySRvR0vZAT76rPTz12H2xz8xZnYZxrk3vdhg/
	8XG5v7aqAFNzEtQBpcGGdT2iCAowRgfbKWnnAJNDY7B63si2bW15oJI038aFBFzO4VqXCG/qVSrgI
	ErKaM6v3uz5LYQFgAdufVDy5m15GgP9JwGCqCEVJNsKLXiGrZeczqBfiPte/PXqngEgmFyIeHroIz
	k0fYoRZNaPVdYq81Tudgb46mUGrTgMnZXwQC5Fcw5gzAt4kXu2R4aBfLfJi/3IdfyIrzJKhrSWYGg
	oWD16A6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOlB6-00000005Mfa-486w;
	Mon, 09 Jun 2025 22:41:16 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOl7O-00000005MI4-0bp8;
	Mon, 09 Jun 2025 22:37:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749508640; x=1749767840;
	bh=ePwAWTLBP0goybEt9LUIGj7rug40FGOIf/8aHv/KjBQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=WrJD5m+ipdpSFadzxKB0513AbmaX9XQq4ZXwkX0b9R5PNLMlLgSklRsCqnqGmCz+B
	 l/FvELmUNanPkE9pn6163SFxF58VU5ztnU1KpG0xLGC3385+Q7m9SH5zr7D/HFHHCc
	 Hr99Mx7Xm01Q8YuABJDhPPpeg/4FrmCcSFX2sDdc9K7VEHcWkhXhZv/pqjtN9M3QqL
	 k2kvPFMdeb8ZTlmssngBovN8oQ11PhLI2Ibe1GUtTRmXzHwaY5+pbW77WPMvsnupJ2
	 4udTcopn6ZWkYH0TrRXqiZb55EFInMJVJOkBtEGvuRyjE1en5IXcVW4J0bR2hMawtS
	 QTjYTQ9YtZUXA==
Date: Mon, 09 Jun 2025 22:37:13 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Message-ID: <4z0y_F1ZT_xfO0-DwU-D5NwL3t3wHuGmivOB3QFjDsn0hzpz_hOeU63pRVBIgSU1j89jmYPq-TJHPqMCj3fAygwwX6IaPoVsqKqVi2jxmCc=@proton.me>
In-Reply-To: <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me> <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org> <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me> <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 21961013ddd1adef816f64a8c4bc9f75454c6cf5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_153726_791164_F7598F7B 
X-CRM114-Status: GOOD (  29.21  )
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

Hi Diederik, sorry for late response

> Interesting that it also happened with drm=3Dy.

I actually checked now and i don't have the issue with drm=3Dy, sorry for=
=20
misinforming you all, hopefully no one's time was wasted.

> As you're more knowledgeable then I am with this, maybe look through
> https://lists.sr.ht/~diederik/pine64-discuss/D9AM2OOLREO0.2JMAI42J06TW0@c=
know.org
>=20
> to see if you may spot something relevant?

Heh, I'm not that knowledgeable but I will look through it.

> > happened twice and at short interval and since this patch allows for ga=
mma
> > LUT update regardless of color_mgmt_changed state this makes DSP CTRL G=
AMMA
> > LUT EN bit to be unset twice too. It seems that VOP does not like it. I
>=20
>=20
> Happy to see you found the cause :-)
> Do you happen to know why it was unset twice? That sounds suboptimal.

It is due to DRM modeset which can happens when CRTC (display) config chang=
es=20
"significantly". AFAIK modeset happens def. when you go out of suspend or
display timings change. I might have been fooled by serial console last tim=
e
as it does not appear to happen twice in short interval when i review the=
=20
journal entries.

> But (IIUC) setting a bit to a value it already has causing issues,
> sounds surprising as well.

Depends on what hardware does, when you write to a register it might cause
many other things to happen and seems like for vop2 it messes something up.

I made a second patch so that the first write is not permitted but all=20
subsequent are permitted (regardless of lut en state) - issue disappeared=
=20
too. So it might be that very first write to dsp lut disable happens too=20
fast (in relation to something else)?. It is not intuitive because when drm=
 is
a module it happens usually like ~second later.

part of the log with drm=3Dy
```
[    6.543099] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
```

part of the log with drm=3Dm
```
[    7.944120] rockchip-drm display-subsystem: [drm] GAMMA LUT DISABLE
```

> > patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only i=
f
> > GAMMA LUT EN bit is set. I checked that this also does not break the ga=
mma
> > lut functionality with emphasis on out-of/into suspend behavior.
> >=20
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > index d0f5fea15e21..7ddf311b38c6 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_vid=
eo_port *vp)
> > {
> > u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
> >=20
> > + if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
> > + return;
> > +
> > dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
> > vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
> > }
>=20
>=20
> I built a kernel with 6.14-rc1 + this patch and can confirm the screen
> has output again :-)

cool :)
=20
> > I will wait with sending a patch because maybe Andy has something to ad=
d
> > to this.
>=20
>=20
> Sounds like a plan. It could be that this issue surfaced an underlaying
> issue and if so, fixing that would be even better.

When i have time this week I will check on what version of the kernel i=20
tested gamma lut when i sent the patches and test there.

> Thanks a lot!
>=20

Thank _you_ for taking your time to do all the bisecting.

Best regards, Piotr Zalewski

