Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3E4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=; b=NddPYrVHK4WaSiVtKyt2wwnLm8
	QwB1OAx+nqqOxSFA1QcGvvAc+yZA9KYAXSHxL4UoQFHQ7705RGUZ8aZsrFgeQYkkIlHonGdWJvCx0
	WghIbbkENqidfD5q8MRmY2c25SwgqWulZdRxs7l3G6rM3GMou5hQ9m245yvNIJBFKWqNmZKOruBRX
	QJP9Ukuj2125uWXej7mVVanlAjsJYxvRXzm7A4PfR6Dr0PLScspK4YBAypjWmZUGknAoi5fNSMMrf
	mnY1VyfqdSC/K8ttsOGv0mfMJw4U4l7BPCP049NUXuLMBlvh0+Zo8+M0yQ1G1ftLYWKH4bLynjG8/
	WUlRMqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tllq8-00000007jSJ-1ClJ;
	Sat, 22 Feb 2025 09:30:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tllod-00000007jI9-38hv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 09:28:57 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38f31f7731fso1415972f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 01:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740216534; x=1740821334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
        b=X2kD3ntbR8wwHKc11ULVGjO8mQqyZBgzsbYb3ttsUtu7c0qHrrLAOks50XlOZWonJu
         iWcANYVynQLBoGtRSHajXvhYmT3nHRCL5SB4u8pufYv/UN09/FY4dBTOh7+Lts3+f8b+
         1Jo03C1cVxGGqkmQho5csjOd7DCjyMqvL2i7++27DsFadcNccmV0YWPpv+IkGpMClEfS
         sNQqjZylt+ofLKVbvZ4HbtP2Y8def5xJwTY89BtEUhJEV0/rDzi9wvhdtZhKEHj1r7Es
         mUjlvusdwak/xZE2x02Lp/RD+cRkgmFh0VuBj+lhjO2lY34NizPh+vbk2HA9VZ237ruI
         NHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740216534; x=1740821334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=St1JTstNvtpDJwVJQG8kMHDEmxsx7ifcGkS2W32UHvQ=;
        b=Gh0jVtj31JhstkAlM65rVP1Mokn4ToKmZlGtxr7nQ4nUyBoo+H64lXMhOKSvWHwfT2
         FCe1Us+HSX9fSj7odJlClj+7hrSXnOGe2h7qYjhU0fbOqsgSP62cMITY92BdD29GvfTr
         UHdeSQuwqrRz0obvb2/WvSUq9WVz/r30PX3lNXIF7L1AZYwPLrY2++4rf/b99ySoR+DA
         gHLofgIkTvN5fVYKy3KRl2FqM7i93v1ICS74ql6oFstBiF8ozsGu2/UXFW77esXAyhhq
         wBgpSsXKjsdheYrjTXEBgNQIuEWikLRw+KwJcJn4n+JnUqAfBnM7IfLTu11TbLD6buAm
         m2VA==
X-Forwarded-Encrypted: i=1; AJvYcCVVHOe1z0rtfzsWOmK32y+dqy/uPdPP/AK/0Aq4UMtkDm9v4vRLm5dlzNtwgu9ViRCXHA7iUNLl48NZccNVYH0V@lists.infradead.org
X-Gm-Message-State: AOJu0YyuJslqDGrDPuoxZUqnCvPnlInmKzDj5NpzcQb6sdkta3N6TIii
	KdUBtRe1KPaWUX7bXK72p6E88ltof2E/EN/lQTSqmxujEwrr6YCs
X-Gm-Gg: ASbGncsacSdLvFlq1l7MCD9r5qjpbRG+M2m62/bT1lmCfjM9Kqj1xjnVdx9n9JoXT+r
	eVfevvnXiF8JRg2jXHt7A+BsoDj58seN7lu82yBkpQ+cQMkrXOt8w55BaoE1pYfd2Gyu+qBDccL
	h0IEvP2PjFkfPOFxJiby0Ey4bLl52u9rRIyjWeu/U3Oe5dGYuDEqRKzY/2TsDqMlInzFBUwY0hC
	bh3NBjxK161v6EaBd6rmDGsDRIGw8zr+YlFcIXNFr5Rgj2AplNo5MnCZc+0Ke8oHVX+4aU5e/kh
	FXXL3X7Ac9cf+QugbsUjnUZYCvIQI+dQ3o9VR7+u5Vkv1ELAq2FcW5qW8wV1IDq3ydmJJf/RBe/
	7yA==
X-Google-Smtp-Source: AGHT+IF6pzVIMqT3bI5J8rbMV0F1AIJ9MBRqLOEPinMndAjfKOv9u7BlBPc4YGBvwr2qQglMbEAZjA==
X-Received: by 2002:a5d:6da2:0:b0:38f:443b:48f4 with SMTP id ffacd0b85a97d-38f6f0d0ea0mr4633663f8f.49.1740216533405;
        Sat, 22 Feb 2025 01:28:53 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b439dsm25488772f8f.8.2025.02.22.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 01:28:52 -0800 (PST)
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
Date: Sat, 22 Feb 2025 10:28:51 +0100
Message-ID: <7770397.EvYhyI6sBW@jernej-laptop>
In-Reply-To: <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
References: <20250216183524.12095-1-ryan@testtoast.com>
 <2221204.Mh6RI2rZIc@jernej-laptop>
 <2a864555-d81f-4048-aa0b-c286544faa50@app.fastmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_012855_833261_D370FED2 
X-CRM114-Status: GOOD (  48.73  )
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

Dne sobota, 22. februar 2025 ob 03:48:01 Srednjeevropski standardni =C4=8Da=
s je Ryan Walklin napisal(a):
> On Sat, 22 Feb 2025, at 7:57 AM, Jernej =C5=A0krabec wrote:
> > Hi Ryan,
> >
> > sorry for very late review, but here we go...
>=20
> No problem, thanks for the review!
>=20
> > This patchset actually introduces 3 disticnt features, which should IMO=
=20
> > be separated
> > and thus making reviewing patches easier.
> >
> > 1. native 10-bit YUV420 output (without YUV->RGB->YUV conversions) -=20
> > this is used on
> >     HDMI for proper 10-bit 4K@60 HDR output
> > 2. Display Engine 3.3 (DE33) support
> > 3. AFBC modifier/format support (used for more efficient GPU or VPU=20
> > output rendering)
> >
> > If I'm not mistaken, your goal is only DE33 support.=20
>=20
> This is my initial goal, but I would still like good HDMI and video suppo=
rt (including HW decode).=20
>=20
> It took some refactoring and resequencing of (your) existing driver work =
to get to this series, and I have left out the HDMI and separated the TCON =
code for the same reason, that initially I am intending to just support RGB=
 operation to an LCD. I do intend however to use the HDMI code either in or=
 out of tree but think that will be a much bigger/more complex change to ma=
inline given the current HDMI code is more invasive to the generic driver.
>=20
> The YUV and AFBC changes seemed more self-contained and seemed reasonable=
 approaches given that they were both features of the DE3 and up. I am happ=
y either to split these into either 4 or 5 separate patches ie:
>=20
> 1a. refactor CSC code to prepare for YUV
> 1b. add YUV for DE3
> 2. refactor mixer enumeration and regmaps to support DE3+
> 3. add DE33
> 4. Add AFBC
>=20
> My only reluctance is that that adds more work to manage multiple patches=
 which are logically grouped and in terms of ease of review, all these 4 st=
eps are in the current set in that order (apart from AFBC which is complete=
ly standalone), and I don't think submitting them separately reduces comple=
xity. It however will reduce reviewer burden as you suggest, but this has b=
een a slow process already.

Sorry, completely forgot. YUV420 HDMI code relies on my previous work, with=
 which
Maxime wasn't happy with:

https://lore.kernel.org/linux-sunxi/20230924192604.3262187-1-jernej.skrabec=
@gmail.com/

So unless switching HDMI to bridge ops is implemented, which also brings fo=
rmat,
YUV formatter and some other patches just add unused code, which isn't idea=
l,
especially if we decide to rework driver before that code can be put in acc=
eptable
state for all involved.

=46rom quick look, patches 5-13, 26 should be dropped for now. Not sure abo=
ut 1-4.

I'm fine with AFBC support going in, it's just one patch.

>=20
> I am happy to accept either process but this has been some time already n=
ow with lots of stylistic feedback but not much on the correctness of the a=
pproach and code, and I am keen to get this landed.
>=20
> There is are two=20
> > reasons why
> > I've never sent these patches myself:
> >
> > 1. scaling YUV images doesn't work
> >
> > Not a problem for any user who doesn't use video player with DRM plane=
=20
> > rendering,
> > which I assume is most of them. We can get around of this issue to deny=
=20
> > scaling
> > YUV buffers until the issue is sorted out.
>=20
> Good to know, I hadn't appreciated that. Mostly relevant for video as you=
 say and it would be good to land YUV support without scaling, then extend =
subsequently, possibly when we get to the video engine?

Correct.

Just be aware of one thing. Even if YUV buffer is rendered in 1:1 scale, vi=
 scaler
still needs to be configured. That's because U and V planes are subsampled =
and
need to be scaled to Y plane size. For unknown reason, that works just fine=
, but
if Y scale is bigger than 1, it all falls apart.

This should be implemented in atomic check.

>=20
> > 2. plane allocations are hackish
> >
> > DE33 for the first time introduced option to move planes between the=20
> > mixers. DRM
> > has also support for this, but for time being static allocation is=20
> > acceptable and tbh,
> > even dynamic support need appropriate initial setting.
> > As you might guessed this is done in DE33 clock driver using magic=20
> > values. Proper
> > way would be to introduce some kind of connection between mixer/plane=20
> > and clock
> > driver, so initial configuration can be moved to appropriate module=20
> > instead of
> > being thrown into clock driver. I need to check where to put it and how=
=20
> > to properly
> > connect DT nodes. Maybe syscon phandle? I'll do some research.
>=20
> Thanks, I was not aware of this either.

Here you have some pointers how this values are actually set:
https://github.com/orangepi-xunlong/linux-orangepi/blob/orange-pi-5.15-sun5=
5iw3/bsp/drivers/video/sunxi/disp2/disp/de/lowlevel_v33x/de330/de_top.c#L23=
2-L260

I think this is the biggest issue of this code. As soon as we solve it prop=
erly, we
have an ability to implement all remaining features at a later date.

>=20
> > There is one glaring issue (when you work on driver and test every=20
> > aspect of it).
> > DE33 introduced RCQ, which is basically DMA, which copies shadowed=20
> > registers
> > from memory buffer directly to hw registers. IIRC it does that at=20
> > vblank time. This
> > tells you that current concept of writing register values at any time=20
> > userspace feels
> > to do commit is wrong and we've been lucky that it works as well as it=
=20
> > does. So,
> > in order to fix this, driver would need quite a big reorganization.=20
> > Introducing
> > shadow buffers would solve most of the issues, most likely also with=20
> > YUV scaling.
> > Implementing RCQ would be then relatively simple and even improve=20
> > timings.
> > Note that even DE3 has occasional issue with YUV scaler and also=20
> > read-modify-read
> > access to some of its register can produce bogus value and thus corrupt=
=20
> > image
> > until next commit.
>=20
> Thanks, again I wasn't aware. All my testing has shown remarkable stabili=
ty and there are some downstream users out-of-tree with good feedback, but =
would be happy to support an effort to improve this.

Let's land DE33 support first since it's long overdue and then I'm happy to=
 discuss plans for moving forward.

Best regards,
Jernej

>=20
> Regards,
>=20
> Ryan
>=20





