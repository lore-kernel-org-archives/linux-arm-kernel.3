Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B753C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=; b=dBAQsonJX2fR0mWpw/m/rKWMJA
	S1eFnu7LO8UFhSuirKtMClHjfTYPEcfX7AfeBzjI7AC+qBp2lGETURsoTkwkgqn/JNA4g+99VgdiD
	SxP0EazP8FcXqqblUUQp6B98hiTzI4RzB1PAaVn9ZTcZf982yDLr7EP8hJj2RRvQgKNZsVFHybwK0
	rMoWuA1rxjgMvu2WXvlzd5zOxqPpE5S4K8tGRF8bumMKPQ8cu9a/V1BilW6IzbxJi7nPi210pIKiC
	EUSUmZOnIDHNX1SOFaBdIS7ej7iNlqBxvS+t7I0WlA1Z9b5wgmC1PRi4yO/qw4dgP/QreWApNVdYe
	pzKrG4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkq1-0000000CpPR-10Zh;
	Mon, 06 Jul 2026 15:02:25 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgkpy-0000000CpOe-0qVb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:02:23 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-39b355f96afso30538701fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783350140; cv=none;
        d=google.com; s=arc-20260327;
        b=d4lh6b727nlDU8LE7afkOFFLSrQEpCtffFutxDuT+CDxG6FPq/0jhBfE0lsL7xVk/U
         umtux69po4aqxln9UP5nIUMOGHpX0qwPbejdtZYWM1rIlV2czFIpCMn47FN0EM+EJE4I
         7j7k9G2hhjgIKbai4PvGl6IW9YEjsBykf8daPXgu4eYdzT0PNY3xIeytl8L7+bZGhJl9
         ednh3KnSVp8oDeCUBZr3ojAyD8SBnbCna+MIwFx2gp/GddOmAvfjdam/FvTOM2VPQcJF
         tkGroiY0aWm6acc9Y/bhqP3mZrmTaBT7O+9gQTFAP4bM06eM2FnO/xwqE2EW0V2pZPDj
         4Kbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        fh=FhgPNnrmtMRHemhYBCSrBgYPslV4h60jFUbZHYHzic0=;
        b=BhIRTF0PS7uZASTVku+rB/GY8WpgLjY6DqE8f6mcFvrvQ382vjiYI6REsBn74uUA83
         xJTOipioCzhA4rxiaUI2yO/myzq227vowRw/C9z3bHzjwBV/sdtQZnaNBEX52nwKlrK1
         1aUrYswS2vOAuqf+4B1T3UvzxZTtiM7/IoNqTgG+7piESWNKt5Z12tVRZxrYwqIzHJEl
         Dj4EpWihGke8OTf4rpjNulIpkzS3ptWdRl93ryIGs2Pe1GHs4XH3iZvEdJ44XYhPtG7k
         0PYo9b74J9SV6AZUd9SfPucZoDWBCI8w0y+ibT0UQA/PCIdVs5jKGdJ0FrUlHQs1dp6Q
         OMkA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783350140; x=1783954940; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        b=Mhs73Gr6kMVjNGqTIphWdmGVS+Ne80LvaVbUSuKhGZsn/rAOUbncyUmJZxGEX0MBdF
         VwtCzk4NVo+sZ3J4DQI5dU/1dT1eiymVFNeWnNDKKSu4SyhjRVdop187ECgYZr6iqwuq
         j9wJikAiHf+xQtoQrfOy7VkRHx9z2xjmmJ+tu+za4IF+PUolOi8IS0ClREiDPtFhOfBv
         KwiZ/fpDksucuiBe2OnE3+vmqa2oOrLJcyMb3Ih9hZzu+wnXqUSiwi7JPNpOkqew5xkz
         3D2Ip30ZWoAYZjmi7X3glu+kVFB4IYst0m3VcincFWz0/tmmlLoRyfSa1WDdxb4hkVXd
         F1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350140; x=1783954940;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWV4JkS2cCeJPf0nGFS2jwqaTnw6RGYanrKcHVTs/QE=;
        b=JfZXstcz+eiwb9fvl42cmxKXfa65qgJuFLHIP892UVS/MBwSxvkIQuBTLThdyEhDbL
         3QI/cjiX8/H5PXh8u4ixK3wSmMT1hxKiXaO5qzfbtSeKCKDhPoDTwFwfLl1E+GSS5gX5
         6E1bfmaJgHyeyItHL3p+Fdv4OMq54fH6xf8koAZBndV/mnMNyUp9PAsUYu6L3QqQkGvF
         y+LT+3BsgJ6/IpZVUet/QxPGSjmclweedsW6pzPdTCoqoqHBVkNxG8kjhrVBE6u9i/Ev
         7DyDNX0ZJd1zk4rds/L9OJU1/eZQEgfGE4wQO3P89Qj4E4N5eG1BGJK4/elOsUrxJSyx
         ayeA==
X-Forwarded-Encrypted: i=1; AHgh+RrUyCChmzNiBpy6kdyG5cXE7Bcm8FlrABxIp7wvlI5Pq1ud36wBNYvElR4vTx36dClASeuNU/E2TCDalIqoZt/q@lists.infradead.org
X-Gm-Message-State: AOJu0YxhMDVntRbpjFy6rGIhFufIFzp0ynQwACje58pVB+uTj75Pvhz1
	9t3Gx7f5/FX8Nw2QxOzAdavc0jFcf4vUREKZExXnGP2d+4IA4bKlTGJ0qO9n650ZGhqw46OXEkB
	MzekyBTnXUprQlqXz/AC03g2/8QsPHfk=
X-Gm-Gg: AfdE7ckqXehYxPAkfLw79YHT7K15llAiBh4ZpKMRwn6NSFIOBqh8ltYL2SpwtIeZpY8
	4npqXNMb1by15ivEsLAfMdNtBLCZe9SGMdSmt3qG8FCIXV86DSas+AbyRWSxOpIwPIiJjqq7V7T
	t+g4mWGaupoW6H65ta/6TkRAXK4QhwrcaOO7stapLMbQhNWW3al7aEfi3Xk7Psk1o5j+/9wuDia
	x/si2nmQ9g8Ko/6KoRi42L6kFu0B3tUfazqqXjlaQow+ujlHuv47L2trBqicqKtoHyO83vUOhWn
	51ax9Eg6xDyUsy2Qt4JK/qgZ4kYqp3BcBCPlxel71CRn8Ur4hdP/3elUL1vr8tk=
X-Received: by 2002:a2e:bc26:0:b0:39a:d718:da74 with SMTP id
 38308e7fff4ca-39c5fb3b7cemr2704641fa.0.1783350139532; Mon, 06 Jul 2026
 08:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260624100326.413699-1-piyushpatle228@gmail.com>
 <aj5MNiKSCiEDvDzL@raspi> <CAMB+xkayaViXeC2GyMMUfeCMzA4=fh-Dq6NYOL-hzKoLfAF19w@mail.gmail.com>
 <aksVMhFr8YzedE1w@raspi> <CAMB+xkY2rut-sEUMyFnXqYCNmyseP4nAGj4BfreORTTM=SN8_g@mail.gmail.com>
 <akuEOT2FRa77L0Jn@raspi>
In-Reply-To: <akuEOT2FRa77L0Jn@raspi>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Mon, 6 Jul 2026 20:31:42 +0530
X-Gm-Features: AVVi8CfYmix7GDHRP2N19e9NG0C7gIJlvJ3wBifD247sso2jQN2_T0J0s6RlIs4
Message-ID: <CAMB+xka8Fame7aFZSiWEtVcozSTXX8g9MKJu+cycU2vtiSDHmQ@mail.gmail.com>
Subject: Re: [RFC] drm/imx: upstream direction for i.MX95 display support
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, marex@nabladev.com, 
	daniel.baluta@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org, 
	tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_080222_309609_5580A700 
X-CRM114-Status: GOOD (  66.35  )
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

On Mon, Jul 6, 2026 at 4:00=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote:
>
> On Mon, Jul 06, 2026 at 03:15:24PM +0530, Piyush Patle wrote:
> > On Mon, Jul 6, 2026 at 8:07=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wr=
ote:
> > >
> > > On Sun, Jul 05, 2026 at 03:33:51AM +0530, Piyush Patle wrote:
> > > > On Fri, Jun 26, 2026 at 3:22=E2=80=AFPM Liu Ying <victor.liu@nxp.co=
m> wrote:
> > > > >
> > > > > On Wed, Jun 24, 2026 at 03:33:18PM +0530, Piyush Patle wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > The current dc/ implementation is a multi-device component driv=
er
> > with one
> > > > > > platform_driver per block bound via the component framework. Th=
e
> > downstream
> > > > > > i.MX95 driver is a single monolithic platform_driver mapping al=
l
> > blocks from
> > > > > > one register base. Unifying appears to require reconciling two =
bind
> > models,
> > > > > > rather than only adding match_data.
> > > > >
> > > > > I think that upstream i.MX95 display controller driver would also=
 be
> > based
> > > > > on the component helper.  That's something for sure.
> > > > >
> > > > > [...]
> > > > >
> > > > > > There is also anticipated divergence which is not yet upstream
> > (i.MX8QXP
> > > > > > prefetch/PRG, LTS and tiling modifiers, and the downstream i.MX=
95
> > blit
> > > > > > engine), although mainline dc/ is KMS-only today.
> > > > >
> > > > > Just want to point out that I sent out v5 patch set[2] to add i.M=
X8QXP
> > > > > prefetch engine(DPRC + PRG) support for KMS.  That changes the
> > driver's
> > > > > mode setting code a lot.
> > > > >
> > > > > [2]
> > https://lore.kernel.org/all/20251027-imx8-dc-prefetch-v5-0-4ecb6c6d4941=
@nxp.com/
> > > > >
> > > > > [...]
> > > > >
> > > > > > One question for Liu Ying is whether the separate-driver plus s=
hared
> > > > > > helper-library approach is still the preferred direction, and w=
here
> > the
> > > > > > helper boundary would be drawn (which blocks/ops are shared ver=
sus
> > > > > > implemented per driver).
> > > > >
> > > > > Yes, separate DRM drivers + a helper library approach is still th=
e
> > direction
> > > > > I want.  I think that the drivers and library would sit in the sa=
me
> > > > > directory drivers/gpu/drm/imx/dc/.
> > > > >
> > > > > The purpose to add a library is to share code to reduce overall c=
ode
> > lines.
> > > > > I'd assume that shared blocks or common part of slightly differen=
t
> > blocks
> > > > > should be covered by the library.
> > > > >
> > > > > [...]
> > > > >
> > > > > > how the component and monolithic driver models
> > > > > > would be reconciled given the differences described above.
> > > > >
> > > > > Like I said above, I don't think upstream driver would be monolit=
hic.
> > > > >
> > > > > --
> > > > > Regards,
> > > > > Liu Ying
> > > >
> > > > Hi Liu,
> > >
> > > Hi Piyush,
> > >
> > > >
> > > > A quick follow-up with some progress.
> > > > I went ahead with the refactoring we discussed and now have it work=
ing
> > on the
> > > > i.MX95 15x15 FRDM, following the component-based model.
> > > > The common implementations for ConstFrame, ExtDst, LayerBlend, Fram=
eGen
> > and
> > > > the FetchUnit base have been moved into shared dc-lib-* helpers, wi=
th
> > >
> > > Can you please share the code in a public place, like github?
> > >
> >
> > Sure. I've pushed the current work-in-progress branch here:
> > https://github.com/PiyushPatle26/linux-mecha-im95-wip/tree/imx95-dc-pre=
view
>
> I gave this branch a quick look.  The major problem is that you are using
> the same 'struct drm_driver dc_drm_driver' for i.MX95 and i.MX8QXP displa=
y
> controllers instead of using separate DRM drivers.  From userspace's POV,
> they should see different driver names(drm_driver.name).  From drivers'
> POVs, they should implement different mode setting callbacks.

I've reworked it based on your feedback and updated version to the same bra=
nch
I've split them into separate DRM drivers.
The shared dc_drm_driver and dc-drv-common.c are gone. i.MX8QXP and i.MX95
now each have their own struct drm_driver, component bind path, probe logic=
 and
mode-setting callbacks. Userspace now also sees different driver names
for the two SoCs.

The mode_valid, atomic_check, atomic_begin and atomic_flush callbacks
were already
identical in the previous version, so I've left them as a small shared
helper to avoid
duplicating the same code. If they diverge later, I'll split them into
separate implementations.

>
> It looks like it's not worth extracting common code into those dc-lib-* f=
iles.
> Each dc-[block].c is a library itself, though I could be wrong - after al=
l,
> I haven't find a time slice to add i.MX95 blocks to them and see how they
> will be.
>

Agreed. I removed the dc-lib-* split. The shared register code is now place=
d
directly inside each dc-[block].c file, so every block stays
self-contained while
still being reused by both drivers where needed.

> The idea is to share some code between the two DRM drivers *naturally*.
>
> >
> > The files you asked about are:
> > drivers/gpu/drm/imx/dc/dc-drv-common.c
> > drivers/gpu/drm/imx/dc/dc-lib-*.c
> > One thing I'd like to point out is that the pixel interleaver, display =
pixel
> > link, LDB and LVDS PHY drivers are ports of the existing NXP downstream
> > drivers. The new work in this branch is mainly the DC refactoring into =
the
> > component model and the shared helper library.
> > > > SoC-specific register layouts and tables supplied as data. The per-=
SoC
> > glue is
> > > > split into dc-drv-common.c, dc-drv-imx8qxp.c and dc-drv-imx95.c, wh=
ile
> > >
> > > Same here, just want to see how dc-drv-common.c and dc-lib-* would lo=
ok
> > like.
> > >
> > The files you mentioned are available under:
> > drivers/gpu/drm/imx/dc/dc-drv-common.c
> > drivers/gpu/drm/imx/dc/dc-lib-*.c
> > The helper library currently contains the common implementations for
> > ConstFrame, ExtDst, LayerBlend, FrameGen and the FetchUnit base.
> >
> > > > i.MX95-specific blocks such as DomainBlend, Dither, FetchEco, Fetch=
YUV,
> > > > HScaler and VScaler remain separate component drivers.
> > >
> > > i.MX8QXP display controller also has Dither, FetchEco, HScaler and
> > Vscaler,
> > > so they are not i.MX95-specific blocks.  To add minimal feautures at
> > first,
> > > we don't need to support them as of now.  i.MX95-specific FetchYUV is
> > similar
> > > to i.MX8QXP-specific FetchDecode, so maybe FetchYUV won't be a separa=
te
> > > component driver at the end of the day.  To start up small, I think t=
he
> > > must-have DomainBlend and Dither(for Data-Enable, HSync and VSync pol=
arity
> > > controls) and two FetchLayers can be enabled to support two display
> > pipelines.
> > >
> >
> > Okay, I've reduced the implementation accordingly. The current branch
> > only keeps DomainBlend, Dither and two FetchLayers. FetchEco, FetchYUV,
> > HScaler and VScaler have been dropped for now.
> > > BTW, do you have the i.MX95 TRM?  If no, then it would be difficult f=
or
> > you
> > > to add DT bindings for *all* blocks.  Note that the DT bindings are
> > supposed
> > > to be complete at the first place.
> > >
> >
> > Yes, I do.
> >
> > > >
> > > > The implementation is functional on the FRDM over the pipeline
> > > > DPU -> pixel-interleaver -> pixel-link -> LDB -> LVDS PHY -> IT6263=
 ->
> > HDMI
> > >
> > > As I said before in separate mail thread, pixel link is not used in t=
he
> > LVDS
> > > display pipeline, but instead it's only used in the MIPI DSI display
> > pipeline.
> > >
> >
> > Thanks for pointing that out. After checking the TRM, I updated the DT =
graph
> > so the LVDS pipeline is now:
> >
> > DC -> Pixel-interleaver -> LDB -> LVDS PHY -> IT6263 -> HDMI
>
> Yes, this pipeline is correct.
>
> >
> > Removing display_pixel_link from the LVDS path also required moving the
> > bridge
> > format translation into the pixel interleaver driver.
> > > >
> > > > EDID is read successfully, the initial modeset works for all tested
> > modes
> > > > (1920x1080@60, 1280x720@60, 720x480 and 640x480), and Weston and sw=
ay
> > both run.
> > > >
> > > > There are still two known limitations. The initial modeset works, b=
ut
> > > > subsequent mode changes currently wedge the ExtDst content shadow l=
oad,
> > which
> > > > appears related to the lack of a reset path for the i.MX95 FrameGen=
.
> > >
> > > Not sure what's the cause of the issue, but FrameGen needs to be disa=
bled
> > and
> > > then re-enabled if you want to do a full modeset.  I'd say that's not=
 a
> > reset
> > > path.  This critical issue needs to be fixed before posting formal
> > patches.
> > >
> >
> > Understood. I'll continue investigating the modeset issue before postin=
g the
> > formal patch series.
> >
> > > > In
> > > > addition, the DSI path is implemented on the DC side but remains
> > unvalidated.
> > >
> > > It's fine to support the LVDS display pipeline first as long as it do=
esn't
> > > do harm to the MIPI DSI display pipeline support.  So, maybe drop the
> > latter
> > > first.
> >
> > I've done that in the current branch. It now focuses only on the valida=
ted
> > LVDS pipeline.
> >
> > >
> > > >
> > > > The implementation is currently based on v7.2-rc1 together with you=
r
> > prefetch
> > > > v5 series.
> > > >
> > > > The work is now ready to be posted as patch series: Adding LVDS/DSI
> > > > i.MX95 support.
> > > >
> > > >
> > > > Regards,
> > > > Piyush Patle
> > >
> > > --
> > > Regards,
> > > Liu Ying
> >
> > Thanks again for taking the time to review this.
> >
> > Regards,
> > Piyush Patle
>
> --
> Regards,
> Liu Ying

framegen re-tune issue is still unresolved.
I'll fix that before posting the formal patch series.

Regards,
Piyush Patle

