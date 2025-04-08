Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDB2C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2C+uRo2fVHUKx/+iSBSrq317XScpLFo+rXN012kNqs=; b=WO8lLPlHGXzBGFnPFmIQONaMt0
	DRXzicNbSzgqE2NO+LUi/5USyt39qh1ru9+egEiXB7G9hfC9SxCL4pwUz3rkDzbMMc7ILsuqJpU8Q
	gGKeSMtUzImM7jz2F/Zf2rO180ntwSMfdk+FXu1rQKGK/ROXdjWFCE7uA7wJ5VUXDcPkpgxt2EbZ/
	oruCCtk04CcozS6Q64p094oHmwHIjYcouggpQUmo9Glr9yYc8UsbiH59oGUnBvd0cIw9B/y2y8/RO
	UoX2PhjpHlWFheg1qvihSBqTDxbuTulQKnja7Emn+hr9/4nEntas+EQ2wAcuP7FmV/a3FVmrylb5o
	XNlw2Dkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23YM-000000036qT-2PYl;
	Tue, 08 Apr 2025 07:39:26 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23R2-000000034dK-1qel;
	Tue, 08 Apr 2025 07:31:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=y2C+uRo2fVHUKx/+iSBSrq317XScpLFo+rXN012kNqs=; b=0t+ePt6z+QxWnu8TYx2heg9Wol
	NRgQcKJR9WRPerFtM6YFYBDdWjiek8EV+Tg2n647qjfHDFVetKcnnXvW4V37ZifW/m9+4/EWHIYJw
	8iycksI2i8YAx73B29Z/lTXwTo8lv5MRxSEQfRu8YDGdgUb8dlBiFOMPhOuPGZtv+X3F/hSLDS05Z
	yXrPln7nDPLG4E809r++H5+p4Vs4qZF3XOWMpCRGMQcQ5eFgehaTO3JhyloeXkcPKtc3jhGiqzWPk
	15mKTOjJBdaN4Jh9dMHoN9N2bB7g6Ptjg3a0cffvNPhn5+8Vvxeq5NwWsnwJ2v3ot9PcTqArGDLLx
	CTbOrqVw==;
Received: from i53875b95.versanet.de ([83.135.91.149] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u23Qn-0005H9-MJ; Tue, 08 Apr 2025 09:31:37 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: linux-rockchip@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH 1/2] clk: rockchip: clk-pll: Fix CRU_xx_CON2 register usage
Date: Tue, 08 Apr 2025 09:31:36 +0200
Message-ID: <3871892.kQq0lBPeGt@diego>
In-Reply-To: <20250408063126.38904-1-eagle.alexander923@gmail.com>
References: <20250408063126.38904-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_003152_494780_058B8755 
X-CRM114-Status: GOOD (  16.67  )
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

Hi Alexander,

Am Dienstag, 8. April 2025, 08:31:25 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Alexander Shiyan:
> According to RK3588 TRM, CRU_(CPLL/GPLL/etc)_CON2 register
> (rate-k value) does not use highword write enable mask.
> Lets fix this.
>=20
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

The commit message doesn't say, but did you check this on actual
hardware too?

Sometimes there is a disconnect between the TRM and actual hardware,
so the actual real-life situation should be checked.


As for a test-case, any write without write-mask to a register that
would require a write-mask would not come through.
So with your patch applied, does the register value change after
the write below when reading it back again?


Thanks
Heiko


> ---
>  drivers/clk/rockchip/clk-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pl=
l.c
> index 2c2abb3b4210..77ba4d6e7b5f 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -959,7 +959,7 @@ static int rockchip_rk3588_pll_set_params(struct rock=
chip_clk_pll *pll,
>  		       HIWORD_UPDATE(rate->s, RK3588_PLLCON1_S_MASK, RK3588_PLLCON1_S_=
SHIFT),
>  		       pll->reg_base + RK3399_PLLCON(1));
> =20
> -	writel_relaxed(HIWORD_UPDATE(rate->k, RK3588_PLLCON2_K_MASK, RK3588_PLL=
CON2_K_SHIFT),
> +	writel_relaxed((rate->k & RK3588_PLLCON2_K_MASK) << RK3588_PLLCON2_K_SH=
IFT,
>  		       pll->reg_base + RK3399_PLLCON(2));
> =20
>  	/* set pll power up */
>=20





