Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18EBE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 13:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cID+icBwQVZ1cLeVHmwo+pX71ArOF+/a0tJhAyvJi3E=; b=X0QgFMWl9EEiWZNoVq18ZdApuJ
	k7yhDJLFs7i+mu1DomfavZq2to3H9O25q7DQF9hJLCe8woGC3rNguogDCz9VaImyWIBBtgbayUBGo
	A9XS34ToFQHNOLf42WGaN11ZtwGacRSFNlG7L/pNFWv0OpxpDjiEHc2ZNWshfqsFC4Z648Iiadd5l
	uWHif3zRYZ/IQIXaQgv6UypK575aMTvz/OWKsRIHOeSy4wQXaB5BFoBHqqNH9gLOp7iBikGAfECQW
	uxlGrho50ZRvD9KHCfJmjy58eUn6J5w5SHFEg+WFFdRo9luvAFFi5XkXIAKOO5ohro9cUAsRPtCb4
	vfF/Xzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0EB-0000000BZMX-0nk0;
	Tue, 10 Dec 2024 13:24:39 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0D8-0000000BZFA-1e9c;
	Tue, 10 Dec 2024 13:23:35 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso5598150a12.1;
        Tue, 10 Dec 2024 05:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733837012; x=1734441812; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cID+icBwQVZ1cLeVHmwo+pX71ArOF+/a0tJhAyvJi3E=;
        b=DdZEdkKFiD13GPTBGNUX8CNuLzygmH1mBTaqnZEyZqQ4ypsCUeH6gHsRnpHkqwEphg
         DGGTKqTFc43B6uV5kGwdDDU5hGuAZx1iJR4jP2SSnQ8fIjGkajK87aYAzhUzItEp51R1
         bMXp9+CYhEBi16xplB7Ui2MfIM85EgLl5uzHKFJ4iXxyzazwkciWUu7p2qdGEZ50l+gY
         mSprOcWq2Wx8BsnP5aJkOfYM5DDzM9MwUVVc9eCE1/jTw2i6fyPIbAAe3Hae6mID8lH7
         QGDcXehF6npdc2zRLn6bygs4/kGlBvrXWi5u6HdPZ4dlOIgJf6XHbsWmvmgXD/ZNQT1k
         4Q3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733837012; x=1734441812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cID+icBwQVZ1cLeVHmwo+pX71ArOF+/a0tJhAyvJi3E=;
        b=DCuSU6F0PQRiAaimehHiDuZw895MNy9xNeIXn4l0dAGR++Rr2MPEYupVPCc7SByyvl
         XX0gN3FgZLMcBp5UZqW4oM5g2wmhG84+Tbtqhhc3e1LKnWIlgbxqu7XHi9XqfcntAUfj
         FPxErlJzltoFCcHMQ8zSixDoqFerBto/PT2/06PjMftXf1chvpjddkyd9pWkMIa9A7Bj
         nDL+62wp/9+q1kQl7UTyTROwvmYgDyfpi73LAwWVuDENuEeLCvGxbI2pU4/xEjcPJp60
         NGxtqlFsvDnlT9/SQg7sMcnmWBF+55DJJbNpsT2O+hq+USl7WMeQ9eKDkwHpJfS/VWht
         avAA==
X-Forwarded-Encrypted: i=1; AJvYcCWwzwvdHFav4Lsfm+VwYvyJzJ0vlnaZdfAOhGN9KlSyloY7P5LbtaYE9KxrsYH6fvHvtYEIiXA21K8Fx0AworrI@lists.infradead.org, AJvYcCXbjagKB6Gf919VX8i2zyOeE/5Q4YwR3hic9m3l22unoim53CJsLx2KIgc1qnc/XM0HYhVXJqbzKWQYkRQBrTw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjVz12A65Ikhymr4rSSB8QkqVGaJpYY0RXcV20cx/HNAd+r8m
	u7aVCUB0HmPviWecwRLzpEByjhRWLXZZiMh4JVnBpvlw7GfF/Auoe/OXVzHTBEW6JZ+/IOIKPHJ
	nHgmB7yxLfRpSDPMSXgORvw11LOg=
X-Gm-Gg: ASbGncsrK6eG+UlswftqHPK1YlxAWRB0Ar/v1h8k3HppNLGFFn9Jgg0jHUc3jLKuZY+
	Lua+2sO6q4Octh2Kqk6nmlsJ5z1GSXtwcAN+MqrdFlzWlvAcIyM3Q2zWbD5A=
X-Google-Smtp-Source: AGHT+IEiQZp+8ruy21+1lGoFTcEYaNOlU4Ihj6HejgjGDUx9L85LTtGqOVIO6IG1rybYdwfcnDlo7HnORY98CWMtsNI=
X-Received: by 2002:a05:6402:1ecb:b0:5d0:9c3b:faf4 with SMTP id
 4fb4d7f45d1cf-5d41e28eedbmr2927675a12.7.1733837012164; Tue, 10 Dec 2024
 05:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-5-pgwipeout@gmail.com>
 <e32fa593abfa6d08202b4f929e0b4bdb@manjaro.org> <CAMdYzYp+MQVYr1tOMEOn62vXZGVEYrtd1p9vn6YQzXdrJgSdyA@mail.gmail.com>
In-Reply-To: <CAMdYzYp+MQVYr1tOMEOn62vXZGVEYrtd1p9vn6YQzXdrJgSdyA@mail.gmail.com>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 08:23:22 -0500
Message-ID: <CAMdYzYquvGBzfWqvUOku7m1sM9qxmBHAL95cANDViUCT1oEEhQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241210_052334_432923_C43B6E6C 
X-CRM114-Status: GOOD (  29.43  )
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

On Tue, Dec 10, 2024 at 8:13=E2=80=AFAM Peter Geis <pgwipeout@gmail.com> wr=
ote:
>
> On Tue, Dec 10, 2024 at 5:04=E2=80=AFAM Dragan Simic <dsimic@manjaro.org>=
 wrote:
> >
> > Hello Peter,
> >
> > On 2024-12-10 02:30, Peter Geis wrote:
> > > There is a race condition at startup between disabling power domains
> > > not
> > > used and disabling clocks not used on the rk3328. When the clocks are
> > > disabled first, the hevc power domain fails to shut off leading to a
> > > splat of failures. Add the hevc core clock to the rk3328 power domain
> > > node to prevent this condition.
> > >
> > > rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks: { 3-...=
.
> > > }
> > > 1087 jiffies s: 89 root: 0x8/.
> > > rcu: blocking rcu_node structures (internal RCU debug):
> > > Sending NMI from CPU 0 to CPUs 3:
> > > NMI backtrace for cpu 3
> > > CPU: 3 UID: 0 PID: 86 Comm: kworker/3:3 Not tainted 6.12.0-rc5+ #53
> > > Hardware name: Firefly ROC-RK3328-CC (DT)
> > > Workqueue: pm genpd_power_off_work_fn
> > > pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> > > pc : regmap_unlock_spinlock+0x18/0x30
> > > lr : regmap_read+0x60/0x88
> > > sp : ffff800081123c00
> > > x29: ffff800081123c00 x28: ffff2fa4c62cad80 x27: 0000000000000000
> > > x26: ffffd74e6e660eb8 x25: ffff2fa4c62cae00 x24: 0000000000000040
> > > x23: ffffd74e6d2f3ab8 x22: 0000000000000001 x21: ffff800081123c74
> > > x20: 0000000000000000 x19: ffff2fa4c0412000 x18: 0000000000000000
> > > x17: 77202c31203d2065 x16: 6c6469203a72656c x15: 6c6f72746e6f632d
> > > x14: 7265776f703a6e6f x13: 2063766568206e69 x12: 616d6f64202c3431
> > > x11: 347830206f742030 x10: 3430303034783020 x9 : ffffd74e6c7369e0
> > > x8 : 3030316666206e69 x7 : 205d383738353733 x6 : 332e31202020205b
> > > x5 : ffffd74e6c73fc88 x4 : ffffd74e6c73fcd4 x3 : ffffd74e6c740b40
> > > x2 : ffff800080015484 x1 : 0000000000000000 x0 : ffff2fa4c0412000
> > > Call trace:
> > > regmap_unlock_spinlock+0x18/0x30
> > > rockchip_pmu_set_idle_request+0xac/0x2c0
> > > rockchip_pd_power+0x144/0x5f8
> > > rockchip_pd_power_off+0x1c/0x30
> > > _genpd_power_off+0x9c/0x180
> > > genpd_power_off.part.0.isra.0+0x130/0x2a8
> > > genpd_power_off_work_fn+0x6c/0x98
> > > process_one_work+0x170/0x3f0
> > > worker_thread+0x290/0x4a8
> > > kthread+0xec/0xf8
> > > ret_from_fork+0x10/0x20
> > > rockchip-pm-domain ff100000.syscon:power-controller: failed to get ac=
k
> > > on
> > > domain 'hevc', val=3D0x88220
> > >
> > > Fixes: 52e02d377a72 ("arm64: dts: rockchip: add core dtsi file for
> > > RK3328 SoCs")
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> >
> > While I was unable to formally verify this clock assignment,
> > i.e. by using the RK3328 TRM or the downstream kernel source
> > from Rockchip, it makes perfect sense to me.  Thanks for the
> > patch, and please feel free to include:
> >
> > Reviewed-by: Dragan Simic <dsimic@manjaro.org>
>
> It is unfortunate the TRM doesn't include the clock maps, because they
> are extremely helpful when one can acquire them. It also doesn't help
> that the TRM register definition only referred to this as "pll". I was
> sent specifically the usb3 phy clock map for my work on the driver,
> which had the location of each switch and divider along with the
> register and bit that controlled it. That combined with the TRM
> register map allowed me to find this error.
>
> Thanks!
> Peter

Apologies, that's the wrong response for this one.
This patch was the result of educated guess combined with testing. I
grabbed all of the clocks that looked like they could affect things,
then tested them one at a time until I isolated them to this clock. It
lives alone with cpll as the parent and has no children according to
the clock summary. (Though the writeup i mistakenly included above
proves the clock map isn't always accurate).

Thanks,
Peter
>
> >
> > > ---
> > >
> > >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > index 0597de415fe0..7d992c3c01ce 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> > > @@ -333,6 +333,7 @@ power: power-controller {
> > >
> > >                       power-domain@RK3328_PD_HEVC {
> > >                               reg =3D <RK3328_PD_HEVC>;
> > > +                             clocks =3D <&cru SCLK_VENC_CORE>;
> > >                               #power-domain-cells =3D <0>;
> > >                       };
> > >                       power-domain@RK3328_PD_VIDEO {

