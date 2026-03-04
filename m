Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1397EB7ED7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 12:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J/vSHYl/zeedWq2s9J2GLz/C+OMXsU4m4BeXZtYn5sg=; b=veDWqBKt5busnDR4FZPKXdG8F5
	HHP50OKTx5roHBQ6YDLxKTfZUev0yY80jFzr+LH3fZzIQ109zjoEbK/5GN1wEJIIhHGD/ZUag+BXd
	le4tFK3feZ3fZ2dGSxfj/En9Jj29xk50CVEa14tQrvbgL0oloTCnKoK4PUHpIh1FDeznNZnS0Bh5F
	9zR3WeBPqCn1n/SFKICk95lHV19uuzP9TbCWLnVEHUMEqCisX3lzffR360aGAi8TWv6iE1H6KjMXM
	/Q7T30dEIrw7lSRQPIyMv1qbzMOq+mIrWKIqriVJ9doFaYjcjtTUPEFS/W3sTHArzj7f1lFtoDOff
	xPQTqLsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl31-0000000H9gv-0eau;
	Wed, 04 Mar 2026 12:09:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxl2y-0000000H9fV-3viH;
	Wed, 04 Mar 2026 12:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=J/vSHYl/zeedWq2s9J2GLz/C+OMXsU4m4BeXZtYn5sg=; b=YXfzLo2QqdItrAztYXnxz6YOFg
	rTZ+0dpqM6PM3TPb+cSNBWkgc4pAVwCJquzKnWUOnYZwlXCUQBchfIF6zB8a4m+vaRESj3yMahdHs
	GkN4cPWfWukZJnSLitWpcns++X55OEEmsNI1QBfTH2/R9qVqdLGtzZmb0w+VVWHNYXVUDlKi2hwD3
	Sixbu+v9xarDc6mITjI6GVjXQBAIXNiw2MbpKZzi3eALv2NZWBgsqzu9v1HUrDaxYUKah7ZzyBQvj
	mTZ1B8XSB8fCoidHxW4lAx7tnxhKNeBaIA0fX3QH3p8Eq/i77wSaMUCETky/FKqAcW1Y0uupLIS6u
	VeE9VxVQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Andy Yan <andyshrk@163.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, mturquette@baylibre.com,
 sboyd@kernel.org, zhangqing@rock-chips.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when setting
 dclk_vop2_src
Date: Wed, 04 Mar 2026 13:09:29 +0100
Message-ID: <2051535.usQuhbGJ8B@phil>
In-Reply-To: <368a3ca3.110d.19a286b585d.Coremail.andyshrk@163.com>
References: <20251008133135.3745785-1-heiko@sntech.de>
 <w3ttg7rmkut44gbys7m7rcwvsa67d4bqyez5fie3cxgbtjs6ib@pyelryb6gth2>
 <368a3ca3.110d.19a286b585d.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_040948_994856_DA740BE8 
X-CRM114-Status: GOOD (  49.57  )
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

Am Dienstag, 28. Oktober 2025, 02:25:14 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Andy Yan:
>=20
> Hello=EF=BC=8C
> =E5=9C=A8 2025-10-27 21:20:15=EF=BC=8C"Sebastian Reichel" <sebastian.reic=
hel@collabora.com> =E5=86=99=E9=81=93=EF=BC=9A
> >Hi,
> >
> >On Mon, Oct 27, 2025 at 10:03:57AM +0800, Andy Yan wrote:
> >> At 2025-10-21 00:00:59, "Sebastian Reichel" <sebastian.reichel@collabo=
ra.com> wrote:
> >> >On Mon, Oct 20, 2025 at 02:49:10PM +0200, Heiko Stuebner wrote:
> >> >> Am Donnerstag, 16. Oktober 2025, 00:57:15 Mitteleurop=C3=A4ische So=
mmerzeit schrieb Sebastian Reichel:
> >> >> > On Wed, Oct 15, 2025 at 03:27:12PM +0200, Heiko St=C3=BCbner wrot=
e:
> >> >> > > Am Mittwoch, 15. Oktober 2025, 14:58:46 Mitteleurop=C3=A4ische =
Sommerzeit schrieb Quentin Schulz:
> >> >> > > > On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> >> >> > > > > dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_R=
ATE_NO_REPARENT
> >> >> > > > > flags set, which is vastly different than dclk_vop0_src or =
dclk_vop1_src,
> >> >> > > > > which have none of those.
> >> >> > > > >=20
> >> >> > > > > With these flags in dclk_vop2_src, actually setting the clo=
ck then results
> >> >> > > > > in a lot of other peripherals breaking, because setting the=
 rate results
> >> >> > > > > in the PLL source getting changed:
> >> >> > > > >=20
> >> >> > > > > [   14.898718] clk_core_set_rate_nolock: setting rate for d=
clk_vop2 to 152840000
> >> >> > > > > [   15.155017] clk_change_rate: setting rate for pll_gpll t=
o 1680000000
> >> >> > > > > [ clk adjusting every gpll user ]
> >> >> > > > >=20
> >> >> > > > > This includes possibly the other vops, i2s, spdif and even =
the uarts.
> >> >> > > > > Among other possible things, this breaks the uart console o=
n a board
> >> >> > > > > I use. Sometimes it recovers later on, but there will be a =
big block
> >> >> > > >=20
> >> >> > > > I can reproduce on the same board as yours and this fixes the=
 issue=20
> >> >> > > > indeed (note I can only reproduce for now when display the mo=
detest=20
> >> >> > > > pattern, otherwise after boot the console seems fine to me).
> >> >> > >=20
> >> >> > > I boot into a Debian rootfs with fbcon on my system, and the se=
rial
> >> >> > > console produces garbled output when the vop adjusts the clock
> >> >> > >=20
> >> >> > > Sometimes it recovers after a bit, but other times it doesn't
> >> >> > >=20
> >> >> > > > Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> >> >> > > > Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588=
 Tiger w/DP carrierboard
> >> >> >=20
> >> >> > I'm pretty sure I've seen this while playing with USB-C DP AltMode
> >> >> > on Rock 5B. So far I had no time to investigate further.
> >> >> >=20
> >> >> > What I'm missing in the commit message is the impact on VOP. Also
> >> >> > it might be a good idea to have Andy in Cc, so I've added him.
> >> >>=20
> >> >> Hmm, it brings VP2 in line with the other two VPs, only VP2 had this
> >> >> special setting - even right from the start, so it could very well
> >> >> have been left there accidentially during submission.
> >> >
> >> >I did the initial upstream submission based on downstream (the TRM
> >> >is quite bad regading describing the clock trees, so not much
> >> >validation has been done by me). The old vendor kernel tree had it
> >> >like this, but that also changed a bit over time afterwards and no
> >> >longer has any special handling for VP2. OTOH it does set
> >> >CLK_SET_RATE_NO_REPARENT for all dclk_vop<number>_src, which you
> >> >are now removing for VP2.
> >> >
> >> >FWIW these are the two flags:
> >> >
> >> >#define CLK_SET_RATE_PARENT     BIT(2) /* propagate rate change up on=
e level */
> >> >#define CLK_SET_RATE_NO_REPARENT BIT(7) /* don't re-parent on rate ch=
ange */
> >> >
> >> >So by removing CLK_SET_RATE_NO_REPARENT you are allowing dclk_vop2_src
> >> >to be switched to a different PLL when a different rate is being
> >> >requested. That change is completley unrelated to the bug you are
> >> >seeing right now?

I guess the actual bug is, that VP2 cannot set its rate with the same
flexibility as the other VPs. I guess I can split that in two patches.

One dropping the SET_RATE_PARENT, to fix the actual bug, the
other dropping the NO_REPARENT flag to give VP2 the same
possiblities to find a rate.


> >> >> So in the end VP2 will have to deal with this, because when the VP
> >> >> causes a rate change in the GPLL, this changes so many clocks of
> >> >> other possibly running devices. Not only the uart, but also emmc
> >> >> and many more. And all those devices do not like if their clock gets
> >> >> changed under them I think.
> >> >
> >> >It's certainly weird, that VP2 was (and still is in upstream) handled
> >> >special. Note that GPLL being changed is not really necessary.
> >> >dclk_vop2_src parent can be GPLL, CPLL, V0PLL or AUPLL. Effects on
> >> >other hardware IP very much depends on the parent setup. What I try
> >> >to understand is if there is also a bug in the rockchipdrm driver
> >> >and/or if removing CLK_SET_RATE_NO_REPARENT is a good idea. That's
> >> >why I hoped Andy could chime in and provide some background :)
> >>=20
> >> The main limitation is that there are not enough PLLs on the SoC
> >> to be used for the display side. In our downstream code
> >> implementation, we usually exclusively assign V0PLL to a certain
> >> VP. Other VPs generally need to share the PLL with other
> >> peripherals , or use the HDMI PHY PLL.
> >>=20
> >> For GPLL and CPLL,  they will be set to a fixed frequency during
> >> the system startup stage, and they should not be modified again as
> >> these two PLL always shared by other peripherals.
> >>=20
> >> When shared with other peripherals,  we can not do
> >> CLK_SET_RATE_PARENT,. However, when we need a relatively precise
> >> frequency in certain scenarios, such as driving an eDP or DSI
> >> panel=EF=BC=88see what we do for eDP on rk3588s-evb1-v10.dts and
> >> rk3588-coolpi-cm5-genbook.dts =EF=BC=89, we tend to use V0PLL. But sin=
ce
> >> V0PLL does not proper initializated at system startup, we then
> >> need CLK_SET_RATE_PARENT. This does indeed seem to be a
> >> contradiction.
> >
> >I suppose for eDP and DSI, which are more or less fixed, it would

While DSI is fixed, eDP is not. While the Analogix-DP cannot support
DP+ (DP converted to HDMI), it can support a real DP connection just fine.


Heiko




