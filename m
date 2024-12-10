Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74367E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r4xfSODKGy3g81bMhiMFOfk/EfRckjRbt+ZPVGFK4g=; b=BL298YwfIY8i77A14sIsm/KOvv
	YNtKpYTSNX3OkBzConGCbvzRE0AN3T00Vg78n0h9Hb81LParLKuBj0jQPUdVQ7Ua6u1XSSeEc7IiI
	/kY0+tjinOrOCepoW8s7sXLzZ+ShlIC6zYOzr4QynDTUiA/dEbHT8brzndYS+4QsEfPAgK4yBUkFu
	tX9+/ysCDkKZUftQrsGqBIpYVEkdc0QvnCG/tRgSdNOwyb7myrFp21KlMsyS86RUdVaW+ppQES8OX
	pxMQ5cxEXrMAvDxLCadXB6O47/3mJ+hN2IcdRSK/ofn1HePPndxnVcU08CGSm+H3zEJGyCjqrM+Hp
	WKOdVnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKxEa-0000000B5XA-02Ld;
	Tue, 10 Dec 2024 10:12:52 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKx43-0000000B3d8-2Rnv;
	Tue, 10 Dec 2024 10:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7r4xfSODKGy3g81bMhiMFOfk/EfRckjRbt+ZPVGFK4g=; b=PL/M6RXV0ShUZBMUNHiO5ZgItP
	apLiD0XeIwBENg5C3YZHRvB7etdwsQkW62AKHgcAt5QqwRPGytnr5gjgh9b4FVMT+eIQj5q7oBbrF
	PvMqnPXqlb8rMfX/A53ximn12OI8ob53r+fgcoasq6nZT0XjAHUyuQPUtbcMLjRe+y18yephfx3cE
	emwHQ+w6sK7y0D9vOBkLXZqzDyvadoDStZb2HoeRAgXFRBc/BONNTJpmpPQYSFvp7jSb+8Emav+0W
	Yt5NL6mUE9LpbcgYi1OhE2bpqvMCfT/nG9QC/Rdt5xM7r+gaw1PZGdpr5IP/ERpaobgInwSFN4nEj
	qXJk9vIA==;
Received: from i53875bc4.versanet.de ([83.135.91.196] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tKx3g-0003mj-0a; Tue, 10 Dec 2024 11:01:36 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Yan <andyshrk@163.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>,
 Diederik de Haas <didi.debian@cknow.org>, andy.yan@rock-chips.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2 controller
Date: Tue, 10 Dec 2024 11:01:34 +0100
Message-ID: <2117643.K71DO8KEF6@diego>
In-Reply-To: <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
 <CAA8EJprLA09NP0KAztc5eoAMkGcrom84jg_pcbNcwN0FAaSLrw@mail.gmail.com>
 <2d68155e.1e5b.193ae4616b9.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_020159_615735_02F8AB7B 
X-CRM114-Status: GOOD (  28.14  )
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

Am Dienstag, 10. Dezember 2024, 02:54:09 CET schrieb Andy Yan:
>=20
> Hi Dmitry,
>=20
> =E5=9C=A8 2024-12-10 09:45:11=EF=BC=8C"Dmitry Baryshkov" <dmitry.baryshko=
v@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >On Tue, 10 Dec 2024 at 03:22, Andy Yan <andyshrk@163.com> wrote:
> >>
> >>
> >> Hi Dmitry,
> >>
> >> =E5=9C=A8 2024-12-10 09:01:38=EF=BC=8C"Dmitry Baryshkov" <dmitry.barys=
hkov@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
> >> >On Tue, Dec 10, 2024 at 08:50:51AM +0800, Andy Yan wrote:
> >> >>
> >> >>
> >> >> Hi,
> >> >>
> >> >> At 2024-12-10 07:12:26, "Heiko St=C3=BCbner" <heiko@sntech.de> wrot=
e:
> >> >> >Am Montag, 9. Dezember 2024, 17:11:03 CET schrieb Diederik de Haas:
> >> >> >> Hi,
> >> >> >>
> >> >> >> On Mon Dec 9, 2024 at 4:06 PM CET, Daniel Semkowicz wrote:
> >> >> >> > On 03.12.24 21:54, Heiko Stuebner wrote:
> >> >> >> > > This series adds a bridge and glue driver for the DSI2 contr=
oller found
> >> >> >> > > in the rk3588 soc from Rockchip, that is based on a Synopsis=
 IP block.
> >> >> >> > >
> >> >> >> >
> >> >> >> > I did more tests with different LVDS displays. I tested follow=
ing
> >> >> >> > configurations with DSI/LVDS bridge:
> >> >> >> > - 1024x600@60.01
> >> >> >> > - 1024x768@60.02
> >> >> >> > - 1280x800@60.07
> >> >> >> > - 1366x768@60.06
> >> >> >> >
> >> >> >> > All of them worked without issues, except 1366x768.
> >> >> >> > With this resolution, video is blurry, and offset incorrectly
> >> >> >> > to the left. There are also repeating errors on the console:
> >> >> >> >
> >> >> >> >   rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY=
 irq err at vp3
> >> >> >> >
> >> >> >> > In correct operation with other resolutions, there is no error.
> >> >> >> > I am not sure if this is a problem in your series or rather in=
 VOP2
> >> >> >> > driver.
> >> >> >
> >> >> >This really sounds like something is wrong on the vop side.
> >> >> >The interrupt is part of the vop, the divisable by 4 things likely=
 too.
> >> >>
> >> >> This is a hardware limitation on vop side:
> >> >> The horizontal resolution must be 4 pixel aligned.
> >> >
> >> >Then mode_valid() and atomic_check() must reject modes that don't fit.
> >>
> >> We round down to 4 pixel aligned in mode_fixup in our bsp kernel,
> >
> >What is meant by the "bsp kernel" here? I don't see it being present
>=20
> bsp kernel means downstream vendor kernel.
>=20
> >in the mainline kernel. So, if the mode is unsupported, it should be
>=20
> Will it be acceptable to add this round down in the mainline mode_fixup?

personally I'd like that.

I.e. the thing in the examoke above is an LVDS display, so has essentially
fixed resolution. So adapting the resolution may or may not be possible
(some for DSI or whatever) .

Doing that rounding-down AND emitting a dev_warn about that fact would
be preferrable to me personally, though I don't know if there is some
different precedent in other parts of DRM.


Heiko



