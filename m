Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB672C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 15:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3e2PiIu2yG6qmD2UeYdaW6il4BUgkIs9FCPbn92s/E=; b=ENavxtvC1X1gl/wHq5nAyWK2Sd
	w81fwT+VbLIkFPB/9CpW2dy8GIPYsc7krnHFN0WrccX5uA3dWuhDH0jBfOXY32fl/mg2xPivztmrf
	U3Sm2I5yPlUjPbUDc63B70lSQD8k5mbosNjilWP93+7l1gyythO6HoO4s3q94P0WTuYEVZ3lWZm9C
	RwDIWWbP1gixXgxx7IXk9TTh26ci7X4LGjT9BKb46/U2Gi/FEGkKDt7S9D7LcNYVwdlbi5wn0k322
	eg3JS+E+Vn5nux/ZUkilcgnwMl91R3rVyPkwYLIcaJ1jLR7ojLvn51fIWPduq1Pl+qAwsL00+MXZf
	nZ0ntpUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEJe-0000000BMOs-2ZFw;
	Sun, 23 Feb 2025 15:54:50 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmEI4-0000000BMJM-3t6J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 15:53:14 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43989226283so24256735e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Feb 2025 07:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740325991; x=1740930791; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3e2PiIu2yG6qmD2UeYdaW6il4BUgkIs9FCPbn92s/E=;
        b=jQYOSFoUZfvsyftGfGO8GowvyFL/Iim5AJ7m2gWgeZHsptv0AQuzLwjrJd/6xRXxye
         YatbmHivh/uEfojRSD9ZedU9Y1Ot1GZJ1Za+d+8nFB0FDhlUxGpiroo1K+6zNvBFPm6j
         YoVDZYejGbp6W1s5rO3buKIJxUp0f6SOnh+9590Gjy3eVk3tB73tLmdU8myCMEWHoCuC
         igZ4D4L7im1cHSyMe6MTggqAjtYq60/HMoXYE585PYurSbEJ1cL+fQsn3g5OCRzGYVVV
         y6UxTGh1bkxvQ+UCLaaPmN0H/GJQWf6b7qGhF+KpZgyGl2getNltXgSvyk22xtJZhfgG
         CGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740325991; x=1740930791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3e2PiIu2yG6qmD2UeYdaW6il4BUgkIs9FCPbn92s/E=;
        b=qsOW7a/orQo2+ECqSJxKcYR5FsUYbBDzzJMnra7BgB9QCLeOLKy3dCNj/7onpehqwx
         YqaVJFHUdNooGKU0SE/AwFeOaS4+eMsLw1j9Drsn/qyYz35F9C0V9ec9VJI8+uj0L8Qa
         r+iqxFilm2N4CmxON9D5Al5SAl7vQHdE1ts2AFFjgl9GZzuwgGPdqM1yFq5cF9Y2DeyY
         mT4JXD2cBY0bwX+xpDiVNwYN9CLhWYQjWUl/cAqVAmWyNCTIqNq3dOssNkyQwy4HZ53q
         CMXLiP7H9wF0ftOcezASSi1mquSMNmTy8rnzNFuGjkPaKANZTchFhaLdPbmJgjeZ34mJ
         DVWw==
X-Forwarded-Encrypted: i=1; AJvYcCWB875kWclaDZBwyd84VZ3u5KfBBU294f+cbUwNWybxMNLIXm49ZaYfkmAX1BYdEiuLkXvL7VOPd6I1A/VTb8U8@lists.infradead.org
X-Gm-Message-State: AOJu0YwLd505gnRRyBL7pRAyCx1OI/w7EVjVKZAE9QvlRmxBHeqxM5wA
	o14yCDjXm7C7ay2FJwx2Qxk/uFN2wTvGmjQiqeF8NNL0GLDggrzF
X-Gm-Gg: ASbGncu05tKgyXqU6vHuIh6tmjdkBDapdZrKUWZtTC1I188wqzVz4x5C/ItvyuqVHZm
	fZgIqvDxyNDX62b8w2g7zAulafq39cqeyq3R1SePq5j/lWbPFpD14nGy23KfrzDnLVPSzqHkyAj
	ooOHexc/Tfbocm4FrzUVKyc3Ednm11DbtMAbHUkgPi19ZFRlE9buxfHzo5UhR/PDfwWJuWtT7ri
	UdAMjtvBJGzUua6cuSlXM1bLDTFAcDm2rD7JfkHmhm8miXijoAL+yPAbDMvLscGeRi8P80T/bvU
	JWQrURPwoeB00d4gZJbM8ENpyc+zkSy/f0+7O24niLdtV09dfp7E4EuZKni8m2jDk4LbEYfD0Hf
	ZSg==
X-Google-Smtp-Source: AGHT+IHPL+jXdxEEeBLWCOIwCIuIIZzPVqsjlW/gM+1S4FJuWMcMNYeu7/iNQfK6XHsfzRzL83fmfA==
X-Received: by 2002:a05:600c:1d29:b0:439:9377:fa17 with SMTP id 5b1f17b1804b1-439ae1f4d07mr88074615e9.18.1740325990809;
        Sun, 23 Feb 2025 07:53:10 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02ce428sm82838535e9.5.2025.02.23.07.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 07:53:10 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
 Chris Morgan <macroalpha82@gmail.com>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 00/27] drm: sun4i: add Display Engine 3.3 (DE33) support
Date: Sun, 23 Feb 2025 16:53:08 +0100
Message-ID: <2150124.bB369e8A3T@jernej-laptop>
In-Reply-To: <7770397.EvYhyI6sBW@jernej-laptop>
References: <20250216183524.12095-1-ryan@testtoast.com>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
 <7770397.EvYhyI6sBW@jernej-laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_075312_974051_C6A88D70 
X-CRM114-Status: GOOD (  59.79  )
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

Hi Maxime,

I'd like to pick your brain for the issue below.

Dne sobota, 22. februar 2025 ob 10:28:51 Srednjeevropski standardni =C4=8Da=
s je Jernej =C5=A0krabec napisal(a):
> Dne sobota, 22. februar 2025 ob 03:48:01 Srednjeevropski standardni =C4=
=8Das je Ryan Walklin napisal(a):
> > On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> > > Hi Ryan,
> > >
> > > sorry for very late review, but here we go...
> >=20
> > No problem, thanks for the review!
> >=20
> > > This patchset actually introduces 3 disticnt features, which should I=
MO=20
> > > be separated
> > > and thus making reviewing patches easier.
> > >
> > > 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=
=20
> > > this is used on
> > >     HDMI for proper 10-bit 4K@60 HDR output
> > > 2. Display Engine 3.3 (DE33) support
> > > 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> > > output rendering)
> > >
> > > If I'm not mistaken, your goal is only DE33 support.=20
> >=20
> > This is my initial goal, but I would still like good HDMI and video sup=
port (including HW decode).=20
> >=20
> > It took some refactoring and resequencing of (your) existing driver wor=
k to get to this series, and I have left out the HDMI and separated the TCO=
N code for the same reason, that initially I am intending to just support R=
GB operation to an LCD. I do intend however to use the HDMI code either in =
or out of tree but think that will be a much bigger/more complex change to =
mainline given the current HDMI code is more invasive to the generic driver.
> >=20
> > The YUV and AFBC changes seemed more self-contained and seemed reasonab=
le approaches given that they were both features of the DE3 and up. I am ha=
ppy either to split these into either 4 or 5 separate patches ie:
> >=20
> > 1a. refactor CSC code to prepare for YUV
> > 1b. add YUV for DE3
> > 2. refactor mixer enumeration and regmaps to support DE3+
> > 3. add DE33
> > 4. Add AFBC
> >=20
> > My only reluctance is that that adds more work to manage multiple patch=
es which are logically grouped and in terms of ease of review, all these 4 =
steps are in the current set in that order (apart from AFBC which is comple=
tely standalone), and I don't think submitting them separately reduces comp=
lexity. It however will reduce reviewer burden as you suggest, but this has=
 been a slow process already.
>=20
> Sorry, completely forgot. YUV420 HDMI code relies on my previous work, wi=
th which
> Maxime wasn't happy with:
>=20
> https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.skrab=
ec@gmail.com/
>=20
> So unless switching HDMI to bridge ops is implemented, which also brings =
format,
> YUV formatter and some other patches just add unused code, which isn't id=
eal,
> especially if we decide to rework driver before that code can be put in a=
cceptable
> state for all involved.
>=20
> From quick look, patches 5-13, 26 should be dropped for now. Not sure abo=
ut 1-4.
>=20
> I'm fine with AFBC support going in, it's just one patch.
>=20
> >=20
> > I am happy to accept either process but this has been some time already=
 now with lots of stylistic feedback but not much on the correctness of the=
 approach and code, and I am keen to get this landed.
> >=20
> > There is are two=20
> > > reasons why
> > > I've never sent these patches myself:
> > >
> > > 1. scaling YUV images doesn't work
> > >
> > > Not a problem for any user who doesn't use video player with DRM plan=
e=20
> > > rendering,
> > > which I assume is most of them. We can get around of this issue to de=
ny=20
> > > scaling
> > > YUV buffers until the issue is sorted out.
> >=20
> > Good to know, I hadn't appreciated that. Mostly relevant for video as y=
ou say and it would be good to land YUV support without scaling, then exten=
d subsequently, possibly when we get to the video engine?
>=20
> Correct.
>=20
> Just be aware of one thing. Even if YUV buffer is rendered in 1:1 scale, =
vi scaler
> still needs to be configured. That's because U and V planes are subsample=
d and
> need to be scaled to Y plane size. For unknown reason, that works just fi=
ne, but
> if Y scale is bigger than 1, it all falls apart.
>=20
> This should be implemented in atomic check.
>=20
> >=20
> > > 2. plane allocations are hackish
> > >
> > > DE33 for the first time introduced option to move planes between the=
=20
> > > mixers. DRM
> > > has also support for this, but for time being static allocation is=20
> > > acceptable and tbh,
> > > even dynamic support need appropriate initial setting.
> > > As you might guessed this is done in DE33 clock driver using magic=20
> > > values. Proper
> > > way would be to introduce some kind of connection between mixer/plane=
=20
> > > and clock
> > > driver, so initial configuration can be moved to appropriate module=20
> > > instead of
> > > being thrown into clock driver. I need to check where to put it and h=
ow=20
> > > to properly
> > > connect DT nodes. Maybe syscon phandle? I'll do some research.
> >=20
> > Thanks, I was not aware of this either.
>=20
> Here you have some pointers how this values are actually set:
> https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-5.15-su=
n55iw3/bsp/drivers/video/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c#L=
232-L260
>=20
> I think this is the biggest issue of this code. As soon as we solve it pr=
operly, we
> have an ability to implement all remaining features at a later date.
>=20

DE33 has introduced "shared" planes, which can be allocated to any mixer. T=
hey
have now distinct memory region and are not included in mixer regions anymo=
re
as it was the case with DE2 and DE3. This patchset maps whole planes region=
 to
mixer0 which was a hack to get quick result and to push problem to a later =
time,
which is obviously now.

I see two solutions:
1. All mixers map same region for planes. Not sure if this is acceptable, b=
ut it's
    far the easiest to implement (already done).
2. Implement separate plane driver. Each mixer would have phandle to plane =
node
    and could call plane management functions there, like switch plane crtc=
=2E This
    to me sounds like a better solution.

What do you think?

Best regards,
Jernej

> >=20
> > > There is one glaring issue (when you work on driver and test every=20
> > > aspect of it).
> > > DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> > > registers
> > > from memory buffer directly to hw registers. IIRC it does that at=20
> > > vblank time. This
> > > tells you that current concept of writing register values at any time=
=20
> > > userspace feels
> > > to do commit is wrong and we've been lucky that it works as well as i=
t=20
> > > does. So,
> > > in order to fix this, driver would need quite a big reorganization.=20
> > > Introducing
> > > shadow buffers would solve most of the issues, most likely also with=
=20
> > > YUV scaling.
> > > Implementing RCQ would be then relatively simple and even improve=20
> > > timings.
> > > Note that even DE3 has occasional issue with YUV scaler and also=20
> > > read-modify-read
> > > access to some of its register can produce bogus value and thus corru=
pt=20
> > > image
> > > until next commit.
> >=20
> > Thanks, again I wasn't aware. All my testing has shown remarkable stabi=
lity and there are some downstream users out-of-tree with good feedback, bu=
t would be happy to support an effort to improve this.
>=20
> Let's land DE33 support first since it's long overdue and then I'm happy =
to discuss plans for moving forward.
>=20
> Best regards,
> Jernej
>=20
> >=20
> > Regards,
> >=20
> > Ryan
> >=20
>=20
>=20
>=20
>=20
>=20





