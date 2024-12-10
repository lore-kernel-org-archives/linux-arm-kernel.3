Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB6E77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTo1WlZxDcXuwYlzN2yAn2e/Fnhdn41jTbwJ9a++r3U=; b=G2e7odTyo18AOwM9mLzyuOtO7D
	QcDRdidOhXgeJ79OM+aLRnb1zHHGHWoJDV5jlW6slhpd5+IPoRCCPO2wFmViNH9wxnPb1U3e7TOAd
	9NCr99889sc4oCMW/gZVK8xqm1mXZ4ZI4qlGs5ADZnmk13hyvGTzhNNyz9tapGlu9mgV5QS1AJjdM
	CVHoA+jmqM7zyPvE3qf8n/XjXyWPQM/IyJxa7XV5lXlgg14mkqhg/5npYItnIkbp/bbkgC69zBoS9
	9jBIGR0RROnu+I3xjpXMJEumEcP0KDRPGp5dZBDTe/rzh2xS0oLAEXEX2Q9f9xkgvMHM5TiwklgbV
	YOc676dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL05F-0000000BYSA-3ogk;
	Tue, 10 Dec 2024 13:15:25 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL042-0000000BY7m-1Xfq;
	Tue, 10 Dec 2024 13:14:11 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3d74363cbso5600050a12.2;
        Tue, 10 Dec 2024 05:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733836449; x=1734441249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTo1WlZxDcXuwYlzN2yAn2e/Fnhdn41jTbwJ9a++r3U=;
        b=MiABauBhFkXi4kjl+Iht+sdl/L6MBFGm/cPKRv7MsKzyGxMSYM2vb1XXhxg7qODnsF
         Daj3ZCpeiolCigyet+YiocF1mJIOijrGftgg+Fftyadf4KI7EWMXB7BG/YeT75bTaiMx
         geA/E/ZoYUdNpxNf+tB75DEkOGF4ZHur3EF7cPeNYEnxFM6ls4UwmY+v1C/TIi+vKX+Q
         PzlfOexOcrsPB74kRw/hOffcM3ZBaEpQZQ0GUNktXSS6hrmCLEW7kyLX+T0wKkuyZ2EQ
         NLLtz/nb1Jk/gnvfukI5fsfs3Mhy4WEVdeCfbBRRprpVIaHEAi0dkaC4tvoDU5Y0epXO
         Bu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836449; x=1734441249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTo1WlZxDcXuwYlzN2yAn2e/Fnhdn41jTbwJ9a++r3U=;
        b=rDO7rnxp8gGOnMwnqMnN4a0Ri1UV+y+RRogZT3tBgJT/BaupECaxU+zOA0Fpyi3J8z
         MWGhpgT3q1eVW0A3SidSqCgIaMe538IRjNc9vcpfiDT0GfJjpzx/hFgmJLMHKHTSEKoV
         503uar7lzr/4HmQjSI2o7sKaz8nLHO+zQq7lRV/rc8/9c2fIf7/wF+jZDOXYe6GXJSij
         c/lU1pFvW0GnA+D9BpN78XpPvOsL5oU7ozhh87/ovBrU3/CoMWnBe00zZCr+Ri2R21Av
         SIfS57JYs+J+8M2nlqM9eYbfNShw2DmLdCGcKwrD7PsJykNEogON9MPKrsxelCBz4if8
         gWjg==
X-Forwarded-Encrypted: i=1; AJvYcCVuxJidHwIPJX4fZy5MAFgqo5bShSw7ZtdAUVJnbq1z7Wb8XkLD1a3sl7WBERrpDTbyedfVvb80eb+VNN7UVbU=@lists.infradead.org, AJvYcCX+H9LBzOY54P3ZuB6uLFYz94xSQrpWntRW3SwagiR9XckD8VCa2iLbw6JXsyn88oFUF1+F7Rz6Llw13adnim2N@lists.infradead.org
X-Gm-Message-State: AOJu0YyBV0czTphlqGIHudJpxBGymeIxHHGpOo724Op0/TQgvw8HYFBK
	IoGEpZsgZKMfOur+Zp7bMJxlsdTrfBUSbvlQwbffVtoqf/1mmsukbIsIOe9V9EuNT/VRNcSN/Y/
	0Ed/cP9pxgUw/rjj3OaH7854arYU=
X-Gm-Gg: ASbGnctmdpurqiFJ/spzinHP3EKcnt1XRXkdXDI15Li1cr2pz9oTRfyaltIjhPRXxi4
	JWTSm1p6YmfSiQqsAIyNLFDvcGI7UKfO4N4Ltuof1b+kjXcIalhgR0MUazMU=
X-Google-Smtp-Source: AGHT+IHVzXa45twYUZopjBlz3Jtr4P+Wzu5Go0KaAZG4d/AM8XCVGszRXr/gWupt2mkcpi97dJ9ZGq0TBZUR5kCx85s=
X-Received: by 2002:a05:6402:350f:b0:5d0:b455:36ad with SMTP id
 4fb4d7f45d1cf-5d4185faa5emr5425785a12.27.1733836448713; Tue, 10 Dec 2024
 05:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-5-pgwipeout@gmail.com>
 <e32fa593abfa6d08202b4f929e0b4bdb@manjaro.org>
In-Reply-To: <e32fa593abfa6d08202b4f929e0b4bdb@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 08:13:59 -0500
Message-ID: <CAMdYzYp+MQVYr1tOMEOn62vXZGVEYrtd1p9vn6YQzXdrJgSdyA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: rockchip: add hevc power domain clock to rk3328
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Alex Bee <knaerzche@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Diederik de Haas <didi.debian@cknow.org>, 
	Johan Jonker <jbx6244@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liang Chen <cl@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	shironeko <shironeko@tesaguri.club>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_051410_405562_9001A59A 
X-CRM114-Status: GOOD (  24.52  )
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

On Tue, Dec 10, 2024 at 5:04=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Peter,
>
> On 2024-12-10 02:30, Peter Geis wrote:
> > There is a race condition at startup between disabling power domains
> > not
> > used and disabling clocks not used on the rk3328. When the clocks are
> > disabled first, the hevc power domain fails to shut off leading to a
> > splat of failures. Add the hevc core clock to the rk3328 power domain
> > node to prevent this condition.
> >
> > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-....
> > }
> > 1087 jiffies s: 89 root: 0x8/.
> > rcu: blocking rcu_node structures (internal RCU debug):
> > Sending NMI from CPU 0 to CPUs 3:
> > NMI backtrace for cpu 3
> > CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
> > Hardware name: Firefly ROC-RK3328-CC (DT)
> > Workqueue: pm genpd_power_off_work_fn
> > pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > pc : regmap_unlock_spinlock+0x18/0x30
> > lr : regmap_read+0x60/0x88
> > sp : ffff800081123c00
> > x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
> > x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
> > x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
> > x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
> > x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
> > x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
> > x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
> > x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
> > x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
> > x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
> > Call trace:
> > regmap_unlock_spinlock+0x18/0x30
> > rockchip_pmu_set_idle_request+0xac/0x2c0
> > rockchip_pd_power+0x144/0x5f8
> > rockchip_pd_power_off+0x1c/0x30
> > _genpd_power_off+0x9c/0x180
> > genpd_power_off.part.0.isra.0+0x130/0x2a8
> > genpd_power_off_work_fn+0x6c/0x98
> > process_one_work+0x170/0x3f0
> > worker_thread+0x290/0x4a8
> > kthread+0xec/0xf8
> > ret_from_fork+0x10/0x20
> > rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack
> > on
> > domain 'hevc', val=3D0x88220
> >
> > Fixes: 52e02d377a72 ("arm64: dts: rockchip: add core dtsi file for
> > RK3328 SoCs")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>
> While I was unable to formally verify this clock assignment,
> i.e. by using the RK3328 TRM or the downstream kernel source
> from Rockchip, it makes perfect sense to me.  Thanks for the
> patch, and please feel free to include:
>
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

It is unfortunate the TRM doesn't include the clock maps, because they
are extremely helpful when one can acquire them. It also doesn't help
that the TRM register definition only referred to this as "pll". I was
sent specifically the usb3 phy clock map for my work on the driver,
which had the location of each switch and divider along with the
register and bit that controlled it. That combined with the TRM
register map allowed me to find this error.

Thanks!
Peter

>
> > ---
> >
> >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > index 0597de415fe0..7d992c3c01ce 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > @@ -333,6 +333,7 @@ power: power-controller {
> >
> >                       power-domain@RK3328_PD_HEVC {
> >                               reg =3D <RK3328_PD_HEVC>;
> > +                             clocks =3D <&cru SCLK_VENC_CORE>;
> >                               #power-domain-cells =3D <0>;
> >                       };
> >                       power-domain@RK3328_PD_VIDEO {

