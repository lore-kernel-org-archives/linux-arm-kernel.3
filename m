Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF1FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 18:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=; b=YkL92s1Tadhf3tQk4cp/so6gRC
	L+LDsmhPkpExVY6wq0BXzgfjpuuE0yfSIGJCEpVCaVMRRUys8CtvJNA67XQ97/lRM7rS3YF3ySXJg
	YaNR3h9WDG/LWsXFV+wMow/gACZqtsX57nDfTQ8glNr6W5FtIjfMFbpy71p87CLJTvbNUWmmqHNXZ
	n3+dDX/PT51vZsEdYUqNL6VXbcjU1hwWa/5/NrcfPsNxlEMITwgE5rna/1A61a/MG2TNCUU82f32R
	2odEzVhz5MwEAZxV8zb5Orzhe8qVD2a+Gl3MITGQg5Ej+Tok1386Sa1ZKSQgtAf/VSYfUHggjQVxN
	KvCPCpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhSM-0000000Ehis-3kQJ;
	Sat, 25 Apr 2026 18:10:18 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGhSK-0000000EhiB-1Whn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 18:10:17 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-8aca4e14411so109338786d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 11:10:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777140614; cv=none;
        d=google.com; s=arc-20240605;
        b=jjAUrQY5i9m7moVaWexGYYqmosLzOE2WJ+2I0XSBNHEXzp2yXg8CZcyWJq4AC0y0pJ
         10Ma7ZOfnFn3O1dk4xOfEIfjslHC/5ul1HZBtYWuscOwj3FtS8VoTtkGRxr6YJURts9H
         B9ImZPDezKBVpl/bdN/a+KQ7dQ0VctcILIRWw51unWcloHPizHMCY23RyKjIxLYiSCIP
         JpbZir9g3ECTQdnJR8iAcpixpWNeNywH6D7SnraTfkciVI1N+ZeIH9oHfEsc9JNkMFjE
         yXbwuRVX/RAfEWm4sLHPS0to+0Jhu0jndR8k/uWg1ux+i9xrW41aR0d9vSoKlQMgHlzD
         LNYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        fh=Uo9rTx0Z16gQcGVvsPYDVJVlMJFw13i0+FjPfR00ni4=;
        b=lPE5hHLFbmtMFvEroDEtyIVjx82tQqWUa7LmJouGNDBNsJVR3pYvYRBOlON4n/C+pl
         CwqOiV2kif7RTAZ+GJquZplvX8bmOs3q81n4kFX7OL6xh1kCg1qzzOdzT5V7AaqDpQdR
         xaEUa3cPZnrK5MoiQizTNA03T6B1U9Ud2aXeFDFtfyZdaG1WtYdFf9hy3CAoGbIgN0M/
         mcjqO9HRjXVzhMx4SxfvGbcCOn1t8TeSBK0gIL8s/blUnhQI9ELukU6cCmVHGuUjLO9Z
         hjcb6oAIIx/QZtVjFeue33fDZa4Nwn5K80Zr7liBRrfRT0IO6riqN6LDvizyjx1YgXaG
         cr3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777140614; x=1777745414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        b=dUUiwnvdrl0a7sZvoVk6+rNqpR/+PwVD8l/2vkHEC9hL/EMjv6ZdTey0Vc97iaAEOW
         QE6W3iTuJkIaQNYhsPUYCimY9iRdD2V4hFmOhwNG4wIkaHWJeoNy+pOjg5hhf/siZ5rr
         y4bejf9ywcDtGhUDLqS5aGY5u6/NNXOYrbSmHpT6CBGvHUTfeuM0UHr0rKw0qBztqdjQ
         asRrjIlPBuo1Dby7he6zWkj8DTCkk4tftz2D0pXGKtMW4cOJnRhGg4/AF15VIAzwKjEG
         D5afpBI1vPskaVDUooqQ4xeYRiWkCeMZlsFHiNlfY0LJ/XnypAQwzEUWR1ehbPOb2a0z
         YJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777140614; x=1777745414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HcPTXTJmSyH/IMfXTVMA724OkR4f1Jn719XgrTAy0hs=;
        b=rC5RMrC0E6d0PFT4HvbmyppkaPF/qeWqSVv8fE1e/gHteytqNTNSeLVMb5PZwWCoZy
         SBYgD8xt7vNDEFOBgg+WZ+PZnHAL9pKuwALdqexs1vHQfsl7R9REPgWGVW3wGPoTcKW8
         PvOawRTuoG4GzF8uBgLDV3XEXaBUntQ1d/Zm/QFYvd+elZu8p+4A+EL2b4yN9ZZKlck9
         z/cO4N7/Gdaynvo9RzPvsNGcLz1xwtWWU8lZi7J9tlxp5mJjCepT8IwlGhUemeaBM295
         KgGl2ZwCdpzP8OgGkH5KtCOX6G5mP2RCAKWRvKeQghLaA4GROk1kRe5eK/ipmkwHSH3r
         7tSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sEQTPMRsQRZzK4hCa128Ljtgk9QvO60UXqBBBCNrKFwlPME9QHuqDH8vq9o90R42B0Hk2gP3yKOI9O/0Z7s1S@lists.infradead.org
X-Gm-Message-State: AOJu0YwTioRQdapzgENK+zeH4k4uNKfpkDQm3dCiTVmRO1Junp+16x/m
	YE14kawJYG4NRAhE9fMnNn3PoecdLlhkpbxQwz7HPfMJ8Lg84tFzFId2iCxH/VdjWZF/YqiHeep
	GLoBXljBzbOw+lleFMF7P41yaHWVCxRTxTMPnP402uA==
X-Gm-Gg: AeBDies7zqavjB4AagACISB3nTCcXDbdpZozEX9f3lP+0z06WUdviZxRXAu3u9mfvNb
	FbM9b1S9IqHVBxal8CBpXaaja6wjbIVmK7N3T5eLiDnNrC8rmBZ+ODJovYs9INviCvEbR+d+uNN
	/+y5vTMvSdxKvpYv4THV+N+WEM3ie3yVbLXWicGiUyO/qvPU0NTFfA5UZjOSMLwZCHBTRYz/IW0
	N/3cT6QIsMgaVhrHMw6MlOzuL2TnafVRyEUclKbaWgUEtpCV1VPK3f45CDSoEtiv8UqCZ+DQWUx
	KzmWE25sscgB8kfOsb5d8y0zNQqSFPk02Xn6rH8dUOcUOIA9Hp3VW+Bsc2WOxZvQBrnI/SZzc2D
	yAqmR
X-Received: by 2002:a05:6214:e85:b0:8b1:f069:3f67 with SMTP id
 6a1803df08f44-8b1f069473cmr348052086d6.27.1777140614077; Sat, 25 Apr 2026
 11:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260425031011.2529364-1-dennis@ausil.us> <20260425031011.2529364-4-dennis@ausil.us>
 <20260425112844.GB2964234@killaraus.ideasonboard.com> <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
In-Reply-To: <45evt7lkzuykoqsc2z27hsvm7fasmn6sr6gbjtdnme54jauehf@dmvon2o5emzd>
From: Dennis Gilmore <dennis@ausil.us>
Date: Sat, 25 Apr 2026 13:10:02 -0500
X-Gm-Features: AQROBzChrS7gVlPnev2Qw5PvTHOSVj5tSgsWsZxHd0olXAmf20o-DIbcxoWnR-Y
Message-ID: <CAABkxwt1=n=CnrVfCcw+EHjqjfsLkp67POk451fV8Gqw4vdnQw@mail.gmail.com>
Subject: Re: [PATCH v8 3/6] drm/bridge: simple: Add the Lontium LT8711UXD
 DP-to-HDMI bridge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, Alexey Charkov <alchark@gmail.com>, devicetree@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_111016_431436_B0861E97 
X-CRM114-Status: GOOD (  30.29  )
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

On Sat, Apr 25, 2026 at 9:24=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Apr 25, 2026 at 02:28:44PM +0300, Laurent Pinchart wrote:
> > Hi Dennis,
> >
> > Thank you for the patch.
> >
> > On Fri, Apr 24, 2026 at 10:10:08PM -0500, Dennis Gilmore wrote:
> > > The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> > > to HDMI2.0 converter, designed to connect a USB Type-C source or
> > > a DP1.4 source to an HDMI2.0 sink.
> >
> > As far as I can tell, the LT8711UXD has an I2C control interface.
> > Shouldn't it be an I2C device ?
>
> From the datasheet:
>
> The device is capable of automatic operation which is
> enabled by an integrated microprocessor that uses an
> embedded SPI flash for firmware storage. System control
> is also available through the use of a dedicated
> configuration I2C slave interface.
>
> My guess was that it can either be an I2C device or it can function as a
> simple platdev with no I2C controls. Please correct me if my
> understanding was wrong.
>
> But now looking at the schematics, it seems to be connected to I2C6.
> Which means that it should be desribed (and bound) as such.

Hi Dmitry and Laurent,

While the schematic shows that it can use I2C and has been wired up,
it also shows that both MODE_SEL and I2C_ADDR have unpopulated 10k
resistors; as a result, MODE_SEL is connected directly to GND, putting
the bridge in autonomous mode. I confirmed this by running `i2cdetect
-r -y 6`, with the only device on the bus being the HYM8563 RTC at
0x51. Without reworking the board, the device is not directly
controllable and just runs autonomously.

Dennis

> >
> > > Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm=
/bridge/simple-bridge.c
> > > index 8aa31ca3c72d..42c1f3d5ba0c 100644
> > > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > > @@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_m=
atch[] =3D {
> > >             .data =3D &(const struct simple_bridge_info) {
> > >                     .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > >             },
> > > +   }, {
> > > +           .compatible =3D "lontium,lt8711uxd",
> > > +           .data =3D &(const struct simple_bridge_info) {
> > > +                   .connector_type =3D DRM_MODE_CONNECTOR_HDMIA,
> > > +           },
> > >     }, {
> > >             .compatible =3D "parade,ps185hdm",
> > >             .data =3D &(const struct simple_bridge_info) {
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
>
> --
> With best wishes
> Dmitry

