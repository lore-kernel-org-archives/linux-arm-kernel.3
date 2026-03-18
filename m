Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488811077604
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 19:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=; b=oMWVp+vKEgyIJusbr30gSdwmC6
	IPC8q9voACBRoKxswtuweDVNpicG3GEQGp09jYZ/wnDiv1M5szBDHAWPhdUzVpVEBTpvA1T/LJZwS
	Y52HLdmethmeDPEqnDRH3sLX8xkE3MFkaJXJcWknERdPCPRXd1XJ8hULSQbZphvPKgYLVEOiIq3Tj
	H/U/mYqcMycqkby6qRO2icFaDh2/PJ3jFQT2e32Fx0gyyYZg6pPzGgZeS1FIFARwanQRA7RqsZBCl
	j9gqSDA2iYpTu/9WnsE5LpZXmLn3wiGq5zyFdaB14fj3gfPYEeozIDJaY2cSLa8sWZBbEglrn6A0L
	VSHO7xuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wBY-00000009CkI-47gw;
	Wed, 18 Mar 2026 19:04:04 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2wBU-00000009CjV-3ACR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 19:04:04 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b976536806cso19565666b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 12:04:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860638; cv=none;
        d=google.com; s=arc-20240605;
        b=Wh+ea0c49YFYIyRfRiYxk09Ot7wBBGqlXZ21B4QO2fOYQKa8MPyFn6eDMgT7PIgLBz
         pJf9+jE7hs51zMEh0ZSD32jtFYlxIrMtSeHOIswLmbJTRu2OwR2gLilkcqX5yHILnBZ6
         N/X1lFJ88z4oPNGHB6VH6UFPzZ8AqgPWbRePHldWoVtfUIdmGsK0lqTgdDPArIS1EwQ/
         yy3xQucgsyyfHFbEn90VYzqERRmQjkzi/LyoYnK0/7ufT0HZ2DlmnOIU7TG4ABBwv7v7
         XostBXnaAixLIFHywG1ekNJHl5plpcBCRX1OAscn+DYNz+DtZEBFceYKM9UInHpIxXmc
         05Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        fh=ls58yvnf5HJN5F7mm5rBbzXrNmU0XmIdOwuy5ABc4fg=;
        b=fJycK9JXH2Y4RKCnduCeAyFDjUyA++d7/jCbJahco3RCc2wg2A6K/SfyyWVvfA80aC
         hnnmFVUEUhD2PJHI0yKrosSNt2PG82Ry1zW3/kY4goB7UQfrLIFwvdV1AzWWHjDL/GYu
         nf7+WpnUZ7ud5rXl3/EA9gInirASdsYJ0GLSRUpoAj7XRVPNIJsb2wdhsbSti7V2iAoz
         QO0OlR/LKbxoy8OIcGcFt7BMudpU675TM18G5oFhS5IrzxIRii1HfcKolVzEDfRsjld7
         0lGQVUmyvYDkBnvMjBcFNA86aLApcFZtp7kDASRtldA4T8mjf9zuH0Tf+Z59GcLIAOnm
         +P0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773860638; x=1774465438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=Ya833Ur3SadcAs2fXP3mKLxsmBmkfB6fHGLPKP8Mi31NNiHcrSgx5jkZhILwRUyvgU
         xwTCGeGMripZBMxMyD2ZKc2SRDrqlIc2BMtmtDnaPuUf9vWEUDx5Vg5fjmrLUQS54i9C
         hWso7xk5Mpj4II7mUQTpD6epdvHTpsLNRPsDqgTc810ILr3TAzrSDuGsnyO9R/wpueqn
         YjWalc4xDanOunkKR1mN+4Y6SzAZ6pSs1eyfush58cthTd29eo3KEW+3Vswu2kMURcV7
         m9PL6EuuaX5HWgqH7YtV9s0GdKnya7BUmPmpxrAeCNKpcXcxPQm/JBkN7LSuTgIjOXVD
         jm3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860638; x=1774465438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04ig8Jpnhmqmb93VFIyiBP6MR+wj/njfRfrqGD7STpI=;
        b=AlqNCTck6EpOX+Ye30feEZHCVftyWGpoJDE2WaTcFBtdftw2toFX4bEsI0k/mYN73t
         ud4KS+F5LiMUvNsEPyufvS9JsSNvokemOOk8GpVT5a67o2mThi9Z8lzRCEt+ofkjKJds
         UCIOv78rxdQTcCtGqwfFfJQOuAYcN3qiQ2kXTb+sO0ytRdHu0v8cJSapIcF2ccKBQGA9
         7+C9wwiYBcRbiEZ7eAAawQE73dVJgE8i0JObVGepVrgz/ULTU30qyLHYkjsfEfMxWcNX
         wQzwhkorPoaJukdhbMXE5YG1pmwA4m1d0jJPI1TZqtX4L+bf936IuiFkJnQDstalYyXj
         aHsw==
X-Forwarded-Encrypted: i=1; AJvYcCV6sc/WDJUAMEMMGDL5XxHZhBKdFOUh8jOR8mhU0iEDUE/rvQlhoHrXUfLayfketE+KznGEc1jfUlBHTwLa0BsQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5iQH1QHFq7avu4Bq9C/I5kfDEMyfLRl3S/Fn4iaihygV/8yKG
	LkQQ3pA51OltYdlfvkjMSRNOz/8BqU4Ho7QyH5BDsjav8C9gCAGQLnD4Z7eb7hIxZWCtAhi3tU+
	bdNEYZv54T4wWrzK8t2hNPufzIUxYhfz3rfcOui82Ng==
X-Gm-Gg: ATEYQzxUR5J36EFwBYFqnq0Iqw0SeaZ2C1bY0vc6bw5euB2e1oj/Lz8TSu/omCIePfV
	UgLOr2FmJ2ZJCA/BNUQ7pTest/gREWuvuHoKwc5IQRp7z4uDQAcYYEbehVJiC66BWWtFgvqLqd/
	uzr2qX0wr/z18dwHH1Q1XtzrTal0J13jIaE8HyFXv+nrgDX8C323wY/mIMGdRiVpa9kmczyZcD0
	6F+ri9JHsbULiRN8vYLYWz4LtyNUUSmPR43OHj4mmQJuwRNuLXRNzifm3W8lgwjZusCVcp0BpyD
	anemzdlvVSa8qiekNfy+G1ImGrUphtB5INcUVJ5Gr1HuFJz1/iY=
X-Received: by 2002:a17:907:96a3:b0:b94:1bd:13fa with SMTP id
 a640c23a62f3a-b97f493bde3mr266129966b.21.1773860638142; Wed, 18 Mar 2026
 12:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
 <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185E1D7543DB60DE089423B894EA@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 18 Mar 2026 13:03:47 -0600
X-Gm-Features: AaiRm50DCHDfwwIrpEvrd6IARu-OJyOKkB98w-Mz3i8yabOEb0YcC2ELSE3lijw
Message-ID: <CANLsYkyvHBKVuRB9abg=WijMLAfaboBxb_eHWETQ6hU3C9Zmew@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_120400_877719_0D845E02 
X-CRM114-Status: GOOD (  55.64  )
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

On Wed, 18 Mar 2026 at 12:46, Shenwei Wang <shenwei.wang@nxp.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Mathieu Poirier <mathieu.poirier@linaro.org>
> > Sent: Wednesday, March 18, 2026 11:03 AM
> > To: Andrew Lunn <andrew@lunn.ch>
> > Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Shenwei Wang
> > <shenwei.wang@nxp.com>; Linus Walleij <linusw@kernel.org>; Bartosz
> > Golaszewski <brgl@kernel.org>; Jonathan Corbet <corbet@lwn.net>; Rob He=
rring
> > <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dool=
ey
> > <conor+dt@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Frank Li
> > <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> > <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> > doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel T=
eam
> > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> > <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> > remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> > kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> > Golaszewski <brgl@bgdev.pl>
> > Subject: [EXT] Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO =
driver
> > On Tue, 17 Mar 2026 at 08:11, Andrew Lunn <andrew@lunn.ch> wrote:
> > >
> > > > > +struct rpmsg_gpio_info {
> > > > > +   struct rpmsg_device *rpdev;
> > > > > +   struct rpmsg_gpio_packet *reply_msg;
> > > > > +   struct completion cmd_complete;
> > > > > +   struct mutex lock;
> > > > > +   void **port_store;
> > > > > +};
> > > >
> > > > Except if I missunderstood Mathieu and Bjorn's request:
> > > > "reuse all the design-work done in the gpio-virtio"
> > > > We should find similar structures here to those defined in
> > > > virtio_gpio.h.
> > > > struct rpmsg_gpio_config {
> > > >       __le16 ngpio;
> > > >       __u8 padding[2];
> > > >       __le32 gpio_names_size;
> > > > };
> > > >
> > > > /* Virtio GPIO Request / Response */ struct virtio_gpio_request {
> > > >       __le16 type;
> > > >       __le16 gpio;
> > > >       __le32 value;
> > > > };
> > >
> > > The core of the issue is that Shenwei is stone walling any change
> > > which makes it hard to keep the legacy firmware. It is possible to us=
e
> > > these structures, but it makes the extra code Shenwei needs to
> > > translate this protocol to the legacy protocol more difficult. It
> > > might need to keep state, etc.
> > >
> >
> > I agree with everything Andrew points out above.
> >
> > > Two points...
> > >
> > > The firmware implements more than GPIO. There is definitely I2C as
> > > well, the first version of the patch has bits of I2C code. Looking at=
:
> > >
> > > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
wn.
> > > net%2Fml%2Fall%2F20250922200413.309707-3-
> > shenwei.wang%40nxp.com%2F&dat
> > >
> > a=3D05%7C02%7Cshenwei.wang%40nxp.com%7C4b8879a9c89a4a831cf508de850
> > 7de18%
> > >
> > 7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639094465992371367%
> > 7CUnkn
> > >
> > own%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIl
> > AiOiJX
> > >
> > aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Ds8tl8n
> > m3eD
> > > 9l%2FetyyE%2FPWwJh4wQalaaHr4OEwzpQ7NY%3D&reserved=3D0
> > >
> > > There is also RTC, and a few other things which don't directly map to
> > > Linux subsystems, but maybe do have Linux drivers?
> > >
> > > Give how much pushback there has been on the existing protocol for
> > > GPIO, it would be wise to assume that I2C, and RTC is going to get th=
e
> > > same amount of pushback. If any of these three, GPIO, I2C, or RTC
> > > decide that only a new, clean protocol will be accepted, no legacy
> > > shims, the firmware has to change, breaking compatibility to legacy
> > > protocols, and the accepted shims become pointless Maintenance burden=
.
> > >
> >
> > I have made this point clear before: modeling legacy protocols in mainl=
ine doesn't
> > scale.  Mainline uses a single generic protocol, and yes, it means brea=
king legacy
> > protocols.  This is the cost of moving to a mainline kernel.  If people=
 want to use
> > the legacy firmware, they must stick with a legacy kernel.
> >
> > > Point two is that the customers who are pushing for these drivers to
> > > be added to Mainline probably know that nearly nothing gets into
> > > Mainline without some changes. There is some short term pain to
> > > swapping to Mainline because of these changes, in this case, firmware
> > > upgrades. But in the long run, it is worth the pain to be able to use
> > > Mainline. And those customers who don't want to upgrade the firmware
> > > can keep with the out of tree drives.
> > >
> > > So, what are our choices?
> > >
> > > 1) We accept the code as it is now, with the shim?
> > >
> >
> > NAK
> >
> > > 2) We keep pushing for the virtio protocol, with the shim?
> > >
> >
> > NAK
> >
> > > 3) We keep pushing for the virtio protocol, no shim, firmware changes
> > >
> >
> > Nothing will get merged in the RPMSG subsystem that includes support fo=
r the
> > legacy protocol.  Not today, not in a month, not in 5 years.
> >
>
> @Mathieu,
> Your tone is unnecessary. If you believe this driver must
> comply with a specific virtio protocol, then please point to the exact
> specification instead of making blanket statements.
>
> If virtio is the direction you prefer, you are of course free to propose
> and implement such support yourself.
>
> My patches are contributed in good faith to improve the ecosystem, and
> this work clearly belongs to the GPIO subsystem. I don't understand why
> you are asserting authority here without providing any technical
> justification.
>

All arguments have already been presented to you, we are now going in circl=
es.

I am happy to look at a new revision of this work that complies with
the comments Andrew, Arnaud and I provided.  I will not engage with
you or your work until that time comes.

> @Linus Walleij,
> From a technical standpoint, this GPIO driver is no different from
> gpio-mxc, gpio-omap, or gpio-rda. If the concern is simply the use of
> the word =E2=80=9Cgeneric=E2=80=9D in the name, I=E2=80=99m perfectly fin=
e reverting it to an
> NXP=E2=80=91specific driver.
>
> If maintaining a private GPIO driver is no longer acceptable going
> forward, that=E2=80=99s also fine =E2=80=94 we can stop the discussion he=
re. If you think
> there are still technical limitations in the driver itself, I=E2=80=99m m=
ore than
> willing to continue improving it.
>
> But the goal is not to create a driver for another protocol that someone
> claims perfect.
>
> Thanks,
> Shenwei
>
> > > 4) We pause GPIO where it is today, and restart all the arguments wit=
h
> > >    the I2C driver. We can come back to the GPIO driver in a few month=
s
> > >    time once we have a better idea how I2C is going. And maybe we als=
o
> > >    need to see the watchdog driver, and argue about its protocol.
> > >
> > > I also understand ST has a generic I2C driver nearly ready, if that
> > > gets merged first, that probably kills the NXP I2C protocol, and mayb=
e
> > > the NXP GPIO and RTC protocols.
> > >
> > > My vote is for 3. If not 3, then 4.
> > >
> >
> > Strong vote for 3.
> >
> > >      Andrew
> > >

