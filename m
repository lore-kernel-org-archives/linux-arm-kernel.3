Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AA5CD6E7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9Q2reB/yZPpZ8/eSn50xdc+8VSCDBGfUYlb4VIhsU0=; b=MhEVloRwTSKst+44btnLvJ2B6z
	ZGuAxkBjFF3NypSrXeedxLoLFN5/1eTxVvJYmaxOIcxxN3tjUo9XJVZtaOOqD4mwoknwjSRj6UqV9
	6bvG2TNBp9l0L+tklS+IFOHPeFrm1x2MDNuwRlceHPmaKnEdDZZoiGJl4qcQkG5jRCCLx8jmesYu9
	HNlCueiguRlEluuolin8sv+D0jHkVR9lj+B6lxZS3lTKQwIYusnGfsVUoBIzI2RJNjALF13MEqBp2
	EQenzgmf2f/BQEtN/48BRHPtBMBr6Gc2byK40TFqWSMqKosDVYaNrJkuT2MC+v0IaNFihbyEqEtaT
	7Thek0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXrh-00000000weZ-2SI6;
	Fri, 05 Jun 2026 16:57:49 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXre-00000000wck-0fWr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:57:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-bef47b1ac01so342622266b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 09:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780678664; cv=none;
        d=google.com; s=arc-20240605;
        b=j0DPLcQljs2Uue4PamAXAbKI1Q8sIAjcw6hl6MUQR0VXM7aSv2uoNsVtgRYIvg2hKZ
         +8Ikl9PrTTGlyKVPc0rf4VnGgXM80vcqULoqFQr1mZkXKnXiso2G4PpAu1Cq7P+oHsPM
         DQ+oif/OYA9AhTyPRwvLu9CL09OVzMrc8wlt+GK0+QdyCT2qoFcaAOS5OpFsH8ysJXEy
         fTvNa1Xdm/pT6CT8fvVi+fPTrp8nzL/tIEYcXKWw4UcuHILO6TU3/hWOp6ZZtV5dM1iR
         VXpZVJIGW/fdKMYZDwuoLjVH2n7i+nyzn/zGeiNIoGFwcfCKfPGZSd/9QFbsWjn9Gnh/
         A0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t9Q2reB/yZPpZ8/eSn50xdc+8VSCDBGfUYlb4VIhsU0=;
        fh=JqV16RfcKoEywh8v8tsEPleqixwF/bIZI4OLVRM6g9Q=;
        b=hmH+b8x+wu45tro1G3Nn0YPybYVMG26WSL521EBjxpdVSxMnD/SBual7eL+/Sra040
         i9bZs7nZWeMrASxwkzac/6mNombhZuB2r1BVW/yzS6/n7WJZJAYxaiV3DHWzecVcDVF3
         ezPwPPgdMKpl8H2Gykeld1y215ShQFKKWYwN6GY/HadU4aHy4NInH+Y23d9658xlirQH
         d5U2REll/eOPB5eezHaWYtXepCw6qijmGsXPNE+0KWb7EjlPUMqsAf0dZh3B+ABcAKcg
         Ejgpfaiv9LwWNwiEdbP3ps7WpXJBASS7guGAYDGCkgcpUgtw32Ppko6fJ+GZs8zi4pgw
         bETQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1780678664; x=1781283464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9Q2reB/yZPpZ8/eSn50xdc+8VSCDBGfUYlb4VIhsU0=;
        b=wwmiUJyJzk3iKGCKlvRRrOtecuX49pmgeSxE85TtXM0PJDPTBfH6SHsr6H34AuKHs1
         xyP202gZOqupcM/pacIuGOpXEl+LwIHsc+3LAiR+cSweh1ENejRxypvY9gwl50CTnf5H
         T0DCumECRzIIaKkf1VrTA9+wkmFzmeXp3dc+KAAn2y0UPUVtJoeeTSwxP0nNFKUsZY//
         bMOLXkjgeGJ2bC+hiL1YgDxkqVFH4HB3teAQThTE9f7qMBN/p1c6spk8mOto0b3TgoFu
         Y6gYagkuee7ccBiEojpSjrqnNORQWBYyrYOgXB5eCy5I64g5/KjuWgT7+CBHRPAXe+RA
         1GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780678664; x=1781283464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t9Q2reB/yZPpZ8/eSn50xdc+8VSCDBGfUYlb4VIhsU0=;
        b=Le6tCPCsot6j1g2Oxeiq9Eutq9K0xIg061VglO1O5C2j2x+/bXBOYAtp7X/wr23oEv
         e259te64DyMXK+ZKGHjyD0swHsiTAA7XSBVPeJSSPTyRHcjEqmmjWzk+ZICsAjUJD4LX
         OiBWWE5OdWznBj1B79WUuzmVayLxIdZ9k7y313Sqku2F3Fc0tFkKpJjenWC2kLJFdKB0
         Uf4ypTUxdPOFrbF16wHzDSQC1NzRoqvc/oqWgKWCj8fED2TE4x8kCZEOpIdCRa54NEtQ
         w7vJ/GVE7o8faxpbl4RYPZUOwgqOTrERmpgSJEdYzZ/WVboVlp85aW7PbhGNZw+jv/dG
         O8NA==
X-Forwarded-Encrypted: i=1; AFNElJ9iQkBsw4fOpjLcp9QuzfP8jX+SDfpcPXOZiaQ5D3Ztt5Fl8/dvqUPHDv8LpC1U5qnZTrraovVjBLHjKw9nQfDw@lists.infradead.org
X-Gm-Message-State: AOJu0YzeMMFWmU3HRP2txmyQnChSuE8wMibnV5k9rtQjgUx1Q7/XmieH
	q+m8mz59C8uRLrZ0Z7gHbNxY+y28+HVIuvlo2P5dj5rEO2OVSa9mL8kMKWOurYXE4UxNO+YVKLo
	7LTZ0/6AbjnhueqJ2WfNuilDyCFrG3CTI0eEwsV3yQA==
X-Gm-Gg: Acq92OFGoD/Jy1vwkY9djm6/iYNTzC4eew2jVAgfGr931stkYd+KZ+Rt4socYls1+V2
	kg4oahwbRkW7b8y54nJy0LlfT29wUiFp+xrptOOdEHO8e4YsHhT0OMYR5qSYdKjFcP8pIe4maLE
	Jyybbjae/B/236SuHvReWvWfuwmrTifaeg20jCkl+2sV6N5D1TioTTIlkPtNLM27/0LktLjt2sd
	JMyrUA2OlimW0CIuqLXNIq4iJHIDtOxV1j25HAUX17JiQvrRD+Zwf2M6n+KEWA+jTfh06in7ivk
	wRU4EsG9HD6WXAN5qqpo0bOd3ucmSj4j7Vk7Rp4Nl2RCELT8nFg=
X-Received: by 2002:a17:907:6eac:b0:bee:e2a2:bdbf with SMTP id
 a640c23a62f3a-bf37234cfe1mr246835966b.29.1780678663320; Fri, 05 Jun 2026
 09:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260409-vop2-clk-rate-check-v2-1-b207cfc427d7@collabora.com> <CABjd4Yw_HYpjhrgmonB9FmWV00q=r3yvqnFE4TXEHpM1ZgWOhA@mail.gmail.com>
In-Reply-To: <CABjd4Yw_HYpjhrgmonB9FmWV00q=r3yvqnFE4TXEHpM1ZgWOhA@mail.gmail.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 5 Jun 2026 20:57:33 +0400
X-Gm-Features: AVVi8CeLjRpF5Sxm7pNUsioQchN9UZhAfu68dWtF3YAmYUc88EGpBg5CfEN24ZY
Message-ID: <CAKTNdwE-qYFiNpn1b9Zy=vjf0QO3JXF_ofp=b5x1-n9Q2WaMCg@mail.gmail.com>
Subject: Re: [PATCH RFC v2] drm/rockchip: vop2: Add clock rate mode check
To: Alexey Charkov <alchark@gmail.com>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_095746_240217_C8798C67 
X-CRM114-Status: GOOD (  31.88  )
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

On Fri, Jun 5, 2026 at 7:58=E2=80=AFPM Alexey Charkov <alchark@gmail.com> w=
rote:
>
> On Fri, Apr 10, 2026 at 2:37=E2=80=AFAM Sebastian Reichel
> <sebastian.reichel@collabora.com> wrote:
> >
> > The display might offer modes, which exceed the maximum clock rate of a
> > video output. This usually happens for displays that offer refresh rate=
s
> > above 60 Hz. This results in no picture (or a broken one) being display=
ed
> > without manual intervention. Fix this by teaching the driver about the
> > maximum achievable clock rates for each video port.
> >
> > The information about the maximum clock rates for each video channel an=
d
> > the tip about multiple pixels being processed per clock were provided b=
y
> > Andy Yan and roughly checked against the information available in the
> > datasheet (which specifies limits like "2560x1600@60Hz with 10-bit"
> > instead of a specific pixel rate).
> >
> > For the video ports supporting a 600 MHz input clock, there is some
> > logic to handle up to 4 pixels in parallel when needed resulting in
> > the extra multiplier.
> >
> > Suggested-by: Andy Yan <andy.yan@rock-chips.com>
> > Link: https://lore.kernel.org/linux-rockchip/1528d788.186b.19d08ed974c.=
Coremail.andyshrk@163.com/
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> > I've kept the RFC tag, as I'm not sure about the 4x parallel pixel
> > processing. IIUIC all of the video ports with a maximum of 600 MHz
> > input clock support it, considering they can go to 4K @ 120Hz,
> > which is above 1.2GHz while Andy mentioned a max. support clock rate
> > of 600 MHz.
> > ---
> > Changes in v2:
> > - Link to v1: https://lore.kernel.org/r/20260217-vop2-clk-rate-check-v1=
-1-989b569119ba@collabora.com
> > - based on v7.0-rc7
> > - rename max_clock_rate into max_pixel_clock_rate to distinguish from
> >   input clock
> > - update max clock rates to the numbers provided by Andy Yan with
> >   extra 4x multiplier for 4K 120Hz VPs
> > ---
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c |  3 +++
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  1 +
> >  drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 10 ++++++++++
> >  3 files changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.c
> > index a195f5c819a2..35a0edda5375 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> > @@ -1434,6 +1434,9 @@ static enum drm_mode_status vop2_crtc_mode_valid(=
struct drm_crtc *crtc,
> >         if (mode->hdisplay > vp->data->max_output.width)
> >                 return MODE_BAD_HVALUE;
> >
> > +       if (mode->clock > vp->data->max_pixel_clock_rate / 1000)
> > +               return MODE_CLOCK_HIGH;
> > +
> >         return MODE_OK;
> >  }
> >
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu=
/drm/rockchip/rockchip_drm_vop2.h
> > index 9124191899ba..fd46913f3346 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
> > @@ -225,6 +225,7 @@ struct vop2_video_port_data {
> >         u16 gamma_lut_len;
> >         u16 cubic_lut_len;
> >         struct vop_rect max_output;
> > +       u32 max_pixel_clock_rate;
> >         const u8 pre_scan_max_dly[4];
> >         unsigned int offset;
> >         /**
> > diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu=
/drm/rockchip/rockchip_vop2_reg.c
> > index f3950e8476a7..6ae3d506c476 100644
> > --- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> > +++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
> > @@ -559,18 +559,21 @@ static const struct vop2_video_port_data rk3568_v=
op_video_ports[] =3D {
> >                 .gamma_lut_len =3D 1024,
> >                 .cubic_lut_len =3D 9 * 9 * 9,
> >                 .max_output =3D { 4096, 2304 },
> > +               .max_pixel_clock_rate =3D 600000000U,
> >                 .pre_scan_max_dly =3D { 69, 53, 53, 42 },
> >                 .offset =3D 0xc00,
> >         }, {
> >                 .id =3D 1,
> >                 .gamma_lut_len =3D 1024,
> >                 .max_output =3D { 2048, 1536 },
> > +               .max_pixel_clock_rate =3D 200000000U,
> >                 .pre_scan_max_dly =3D { 40, 40, 40, 40 },
> >                 .offset =3D 0xd00,
> >         }, {
> >                 .id =3D 2,
> >                 .gamma_lut_len =3D 1024,
> >                 .max_output =3D { 1920, 1080 },
> > +               .max_pixel_clock_rate =3D 150000000U,
> >                 .pre_scan_max_dly =3D { 40, 40, 40, 40 },
> >                 .offset =3D 0xe00,
> >         },
> > @@ -775,6 +778,7 @@ static const struct vop2_video_port_data rk3576_vop=
_video_ports[] =3D {
> >                 .gamma_lut_len =3D 1024,
> >                 .cubic_lut_len =3D 9 * 9 * 9, /* 9x9x9 */
> >                 .max_output =3D { 4096, 2304 },
> > +               .max_pixel_clock_rate =3D 600000000U * 4,
>
> Hi Sebastian,
>
> I've tested it on a bunch of different displays with RK3576 while also
> giving VP0 an unlimited PLL to work with (and also expanding its rates
> table for each of the displays' EDID preferred pixel clocks), and I'm
> pretty sure this should be * 2 here, rather than * 4. That would also
> align with ".pixel_rate =3D 2" just below.
>
> In its current form, some of the advanced displays with 240 Hz modes
> by default choose modes leading to visual artifacts indicative of
> overclocking strain of the graphics pipeline.
>
> The rest look plausible, so with that change please feel free to include:
>
> Tested-by: Alexey Charkov <alchark@flipper.net> # RK3576

Sorry, wrong mailbox.

Tested-by: Alexey Charkov <alchark@flipper.net> # RK3576

Best regards,
Alexey

