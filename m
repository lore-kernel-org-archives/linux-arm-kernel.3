Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BCDC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 21:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9LS7SYHFlkHvaK4ZooIhwRFHr3vUhLavYrz1nuVPqA=; b=rNoMv1wi4OXRJ8aEq2piMhy+59
	txW/HAfy6SqcK8zwg62aktkPe1DD7T6GN+z7t5jo1B2oQ91EWFh3LLW3lI4bVKMlxPmhlZcV1jabh
	TvHVogtOcclWwvFkhgBX9GtfxqqKv+sJBrkxvPELxD9TCUmADhBSDgK9mAVizrIsWpzOAuIW3tKOa
	XLM0MHIfS1AmtYyNjSiNinfeSkVkLnwaXvEnu/jMqJ0hJbTt+3gEBAOC3ESTGJAI/rlS9yLwHaDD3
	8Iu+PCPW++FfTmtxdeXpiuORSXzASV6qlHJjn9PdygStvM1fPSGLaRnHFhjJ9LpLm0xpDXcr9gTTh
	jQHMG07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KIp-00000005a0B-1AUX;
	Sun, 06 Sep 2026 21:21:27 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3KIm-00000005Zz7-1T8y
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 21:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Reply-To:Content-ID:Content-Description;
	bh=Y9LS7SYHFlkHvaK4ZooIhwRFHr3vUhLavYrz1nuVPqA=; b=f4AoxTbb7TWe9/8DFTs7RutDb7
	L82gmbWW2DODqTgiGpBE+E/m0FCkwVtngj8SNAYQuewyWcdMlGTbsVC2+lwNR6wO2xoq3DR7498yq
	mirf/cmsxLfxhCtGUqUheLnnAbkfCX9gaXuU2mFHeLlZAAYlJNtKMn4nOkQazdx2SK3u2RUlqfOFM
	KWcbkU4Q73N5/5H/UvoLmg1kZBTNJRKz56T6MAydZXl+bJWQ9dQs7uiQsvZqBs6/e5nhDWZB1AItV
	U8MJg2E733lKvHsWsYvc/4PDZ1t2e/Smd1u09n+LeuXOg4Y4OLkmRVpwVyptbunYr32iPGvPB515T
	BJuyiljA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	(Exim 4.96)
	(envelope-from <domibel@debian.org>)
	id 1x3KIl-0011J9-01
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 21:21:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84e04df8c46so3211257b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 14:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjIzr4oxfTTDHy7/D+5zsh4iIRuW9AzlP8FCknBBefYJfOXwwr1OKh5h4iNdYvS6yoT1PpjJateUjIwfi6enz/@lists.infradead.org
X-Gm-Message-State: AFuF++lOL7eD1fG4MC+LRGQwmCkSpI1NqeKF9StAk2uRwQHazBNFhuxl
	x6vi7J8V81aOAKEvkJJW1KJiqPLpFQIS/IlR2rd+fVXZ9WPnhc35V6WUD3bm/Apit1uBlxz7LQI
	L461TKajio5k6wnITeT9Wkq1FCC+aBMo=
X-Received: by 2002:a05:6a00:c206:b0:851:d12e:389b with SMTP id
 d2e1a72fcca58-8628622c78fmr14582711b3a.14.1788729379886; Sun, 06 Sep 2026
 14:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-jh7110-clean-send-v2-13-331680c8b9d1@samsung.com>
 <0ccb4168-ff88-459c-972d-3c091c155db2@murena.io> <e780ecb8-918f-4816-99c8-b69b10b25a18@murena.io>
 <CAAvaLCwvVUddS14MPx0FHdnp+QeZ99+ox17pXt2hSWPTCFcHtw@mail.gmail.com>
 <cb0884b3-c9be-4cfd-ba43-27add3821ddd@murena.io> <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
In-Reply-To: <6a5f8c11a092cef83bae8d9ea0100c2fc133a514.camel@icenowy.me>
From: Dominique Belhachemi <domibel@debian.org>
Date: Sun, 6 Sep 2026 17:16:08 -0400
X-Gmail-Original-Message-ID: <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
X-Gm-Features: AcwNN1W3Ei1cx4_W0731mEUNvW6xw1POICbdb9C66iM9zFCtDZzsTbla6YfIM_c
Message-ID: <CAAvaLCxMntrTbTQ9VNu4H_6LA30TRAqi7mCpn+x3hbTG9WqERA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Maud Spierings <maud_spierings@murena.io>, Dominique Belhachemi <domibel@debian.org>, 
	m.wilczynski@samsung.com, Laurent.pinchart@ideasonboard.com, 
	airlied@gmail.com, alex@ghiti.fr, andrzej.hajda@intel.com, 
	andy.yan@rock-chips.com, andyshrk@163.com, aou@eecs.berkeley.edu, 
	bmasney@redhat.com, conor+dt@kernel.org, conor@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	hal.feng@starfivetech.com, heiko@sntech.de, hello@big-grey.co.uk, 
	jernej.skrabec@gmail.com, jonas@kwiboo.se, kernel@esmil.dk, 
	krzk+dt@kernel.org, lee@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com, 
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, 
	maudspierings@gocontroll.com, mfd@lists.linux.dev, mripard@kernel.org, 
	mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de, 
	palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org, 
	sboyd@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Debian-User: domibel
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_142124_384015_676023FC 
X-CRM114-Status: GOOD (  19.93  )
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

On Sun, Sep 6, 2026 at 11:19=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2026-09-06=E6=97=A5=E7=9A=84 16:59 +0200=EF=BC=8CMaud Spierings=
=E5=86=99=E9=81=93=EF=BC=9A
> > On 9/6/26 07:39, Dominique Belhachemi wrote:
> > > On Sun, Aug 30, 2026 at 10:17=E2=80=AFAM Maud Spierings
> > > <maud_spierings@murena.io <mailto:maud_spierings@murena.io>> wrote:
> > >
> > >     I was still having some glitching happening on the display, but
> > > I've
> > >     found the way to fix that, the question is what is actually
> > >     happening here.
> > >
> > >         0x29590020 <- 0x00000005
> > >     This one I have no idea, it is 0x00000009 with this patch
> > > series but
> > >     with the vendor kernel I get the value above. When I hook up my
> > >     external
> > >     display (regular 1440p) this becomes 0x0000000D on the vendor
> > > kernel.
> > >
> > >     But I can't find this register being written to anywhere there?
> > >
> > >
> > > Maybe this needs to be swapped?
> > >
> > > drivers/gpu/drm/bridge/inno-hdmi.c
> > >    -#define v_HSYNC_POLARITY(n)          ((n) << 3)
> > >    -#define v_VSYNC_POLARITY(n)          ((n) << 2)
> > >    +#define v_HSYNC_POLARITY(n)          ((n) << 2)
> > >    +#define v_VSYNC_POLARITY(n)          ((n) << 3)
>
> Very weirdly, the original definition here matches current mainline
> inno-hdmi.c, but the changed definition matches JH7110 vendor
> inno_hdmi.h [1].
>

The vendor code is correct and matches the RK3128 TRM.

HDMI_reg08
    Bit  Attr  Reset  Description
    3    RW    0x0    vs_polarity   VSYNC polarity   1'b0: Negative
1'b1: Positive
    2    RW    0x0    hs_polarity   HSYNC polarity   1'b0: Negative
1'b1: Positive

Nobody noticed this so far because in 720p/1080p both polarities are
positive, but Maud's 3:2 panel has differing H/V polarity.

Best
-Dominique

