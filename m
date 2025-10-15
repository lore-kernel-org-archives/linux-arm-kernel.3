Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C8BCCD196
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFu78uXLNhhYEH7SVSyRI1WHuG5g54Ao3mQfyxG+tcA=; b=rN9rk/JjWoEcpvzUPSYSrQ9SBv
	EVgZqbVE7rdqV2/CIfwddJ43YUFi/oYtNNlwjcpTu1RYKcMIAVL6AbX7c5fy0O8eFWcy2AcB5xaFr
	8faekBfqHtQ0geDram6QjJHgQwcEaAO7W598I2KFXVQGAR123/pSdk0ZvAJH641uV9c+J3hOl/GGc
	5GS7ms9ZV/QAbEcWGnXN+EiMG6QVr7k8kJuQ4p1wQhq3FrtpWKAIrs/RrZ6zVMtDHbHTftjRNdrEk
	gNFW4i5t4I8VlM91L2/A9w2pAetn2IwoRp6K5v+YrFeXGYn6y7OSZ0LN0yNfFrvU7DWyt7+HErWUY
	Q/vJGNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91XJ-00000001hyg-2iIJ;
	Wed, 15 Oct 2025 13:27:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91XH-00000001hwm-0eho;
	Wed, 15 Oct 2025 13:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EFu78uXLNhhYEH7SVSyRI1WHuG5g54Ao3mQfyxG+tcA=; b=tWVdwD3BvmoVph276K/6AP4+qH
	FOgl0YNA7jJdbhOWcHJU/rnlh1YeNzgB9WF4tJPvuZKylLCkTWCzzR5K/D0I8cpazCXWYylTCdo7Z
	CJYaFUS7GccbUgcRUhX4T9cy/WFZ6RiFo6LexaXZpK6XVNPlissl69o1kRlu7mI8qYHBuKZ/5Rdya
	4BAA8eEnVsoY8kve7J9ddgxVXZbwAWfyUZIiEIvXV/ib2DyzjHnNWKJIvC34fzk0KH4N2bjYtWdvX
	GCb9B0oBFseQS66XDAw8YFoR+YhZJXBi1kUgasdPvWT17hTspcUsJFwPHgfcXGc/d1NGMro/KJFIu
	MairWdyQ==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v91X6-0007hd-Ux; Wed, 15 Oct 2025 15:27:12 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, zhangqing@rock-chips.com,
 sebastian.reichel@collabora.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3588: Don't change PLL rates when setting
 dclk_vop2_src
Date: Wed, 15 Oct 2025 15:27:12 +0200
Message-ID: <2749454.BddDVKsqQX@diego>
In-Reply-To: <6677ebf9-50bd-4df0-806c-9698f2256a8d@cherry.de>
References: <20251008133135.3745785-1-heiko@sntech.de>
 <6677ebf9-50bd-4df0-806c-9698f2256a8d@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_062723_232352_026DCA01 
X-CRM114-Status: GOOD (  18.61  )
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

Am Mittwoch, 15. Oktober 2025, 14:58:46 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Quentin Schulz:
> Hi Heiko,
>=20
> On 10/8/25 3:31 PM, Heiko Stuebner wrote:
> > dclk_vop2_src currently has CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPAR=
ENT
> > flags set, which is vastly different than dclk_vop0_src or dclk_vop1_sr=
c,
> > which have none of those.
> >=20
> > With these flags in dclk_vop2_src, actually setting the clock then resu=
lts
> > in a lot of other peripherals breaking, because setting the rate results
> > in the PLL source getting changed:
> >=20
> > [   14.898718] clk_core_set_rate_nolock: setting rate for dclk_vop2 to =
152840000
> > [   15.155017] clk_change_rate: setting rate for pll_gpll to 1680000000
> > [ clk adjusting every gpll user ]
> >=20
> > This includes possibly the other vops, i2s, spdif and even the uarts.
> > Among other possible things, this breaks the uart console on a board
> > I use. Sometimes it recovers later on, but there will be a big block
>=20
> I can reproduce on the same board as yours and this fixes the issue=20
> indeed (note I can only reproduce for now when display the modetest=20
> pattern, otherwise after boot the console seems fine to me).

I boot into a Debian rootfs with fbcon on my system, and the serial
console produces garbled output when the vop adjusts the clock

Sometimes it recovers after a bit, but other times it doesn't

> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger w/=20
> DP carrierboard

Thanks for testing
Heiko



