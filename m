Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2ABE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vkoVyy6uCpLzlhwSnm1vHxEsbOQ+nXvkDsqoKqIAe5Q=; b=DZeM6vCuwesEZtRjvDyc2GQzoR
	q1cNHZ90bH3dbiQD7BZIrWUOu1VFx7mGdazrod/X+ZGnc4tb6d1zOMo/1VZI8hDU8W3RkSbJz4a7W
	3DWojP4GT4QGXQpgyt20f1Xt4aKo1j0jiCKgZTsUHzY2n6slckL5YvAsZ3ZiEvEV8f025pkQlFv6H
	lJgb35eO+79fLQS2ZyNbjEHI20VYehes5K0xSZLV/TdTDTgqvFO30cMdR/qTlwWtQy7WhF1KOk7aA
	FgbrcwMD0NxRC65hKzgo+VaIsVnkp7Kc631LH0Raf6816v/qXRuWESdORmvgiiFgEJ2wYWvp5hDpo
	cJcxORvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7YD-0000000FERG-14j7;
	Thu, 05 Dec 2024 08:49:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7XC-0000000FEGd-2xTs;
	Thu, 05 Dec 2024 08:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vkoVyy6uCpLzlhwSnm1vHxEsbOQ+nXvkDsqoKqIAe5Q=; b=c5SwmsafkScThU52BgeXHwt5UQ
	sKqFqY8Q0T6yQSZN/51TiMiH5OytpZmjvxdf3ehQHPPfQqQxcRgJOA2ytwDhzv1bQGv5o5G+6WoAx
	WUkFRhfnTjvSQ3Y7nZdfVSduLkGW2fcnAKyfK6iYFz92Xh4AI1ZEOx5CaF1rCHHxXCaCZUFPwa+VO
	/sTDZ5Y2NLo6t30SGn25U9IGVSLqnAbZdlgtFWzbaD6V43Sj0D9p4G29ccvmPFFlyqS7surSoZJ/p
	Q8GaSpU5YbfMp2oMyyio9TCnGlVIpadE+pQ3eU4COZlDPup3vX4pUApGYpH8jtTXKbDqOULB7s9Kb
	bnDg8PmQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ7X9-00000002oFa-3aIW;
	Thu, 05 Dec 2024 08:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vkoVyy6uCpLzlhwSnm1vHxEsbOQ+nXvkDsqoKqIAe5Q=; b=0ZtQ6DJEFHGEmBh1Tww482lN82
	Vej40ed98V17Tt6bWDap4Tpmedv9HxkoQiHuimmhMGDGmNn/+fK0cqEL2k1vz9Jv819Jrs6Z7Lva0
	7G4cw2t76SRONtp8KTTDxO9Aoce8kvvAcUq4SzOHNEr3rx4ZvP3pFPsQTixTivhmNnE47qVWSD0NM
	twujlr47srFp0AI9EPCQl48iZF4+bnCqslssmnvlvbEfI+NYRtMyokpPV4Z6cTdRWsGOBIYAt8vf/
	P9mYZjdcHuJbsLLd9iezUv+i2D7tCE4yHAqhOEqDxzaJtaPk3iqKnmgwa2Rp0fPO9FiymiVHbgMMA
	TU2AdtIg==;
Received: from i5e86190f.versanet.de ([94.134.25.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tJ7Wz-0001jK-VE; Thu, 05 Dec 2024 09:48:17 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Val Packett <val@packett.cool>
Cc: Val Packett <val@packett.cool>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: add clock ID for CIF0/1 on RK3066
Date: Thu, 05 Dec 2024 09:48:17 +0100
Message-ID: <5336726.6fTUFtlzNn@diego>
In-Reply-To: <20241205055122.11613-1-val@packett.cool>
References: <20241205055122.11613-1-val@packett.cool>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084828_074625_88733797 
X-CRM114-Status: GOOD (  18.87  )
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

Hi Val,

Am Donnerstag, 5. Dezember 2024, 06:50:46 CET schrieb Val Packett:
> RK3066 does have two "CIF" video capture interface blocks, add their
> corresponding clock IDs so that they could be used.
> 
> Signed-off-by: Val Packett <val@packett.cool>

please split this into two patches
- addition of the clock-ids to the dt-binding header
- setting the clock-ids in the clock driver

Thanks
Heiko

> ---
>  drivers/clk/rockchip/clk-rk3188.c             | 4 ++--
>  include/dt-bindings/clock/rk3188-cru-common.h | 2 ++
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3188.c b/drivers/clk/rockchip/clk-rk3188.c
> index 684233e72105..81e94b338d0f 100644
> --- a/drivers/clk/rockchip/clk-rk3188.c
> +++ b/drivers/clk/rockchip/clk-rk3188.c
> @@ -344,7 +344,7 @@ static struct rockchip_clk_branch common_clk_branches[] __initdata = {
>  
>  	GATE(0, "pclkin_cif0", "ext_cif0", 0,
>  			RK2928_CLKGATE_CON(3), 3, GFLAGS),
> -	INVERTER(0, "pclk_cif0", "pclkin_cif0",
> +	INVERTER(PCLK_CIF0, "pclk_cif0", "pclkin_cif0",
>  			RK2928_CLKSEL_CON(30), 8, IFLAGS),
>  
>  	FACTOR(0, "xin12m", "xin24m", 0, 1, 2),
> @@ -602,7 +602,7 @@ static struct rockchip_clk_branch rk3066a_clk_branches[] __initdata = {
>  
>  	GATE(0, "pclkin_cif1", "ext_cif1", 0,
>  			RK2928_CLKGATE_CON(3), 4, GFLAGS),
> -	INVERTER(0, "pclk_cif1", "pclkin_cif1",
> +	INVERTER(PCLK_CIF1, "pclk_cif1", "pclkin_cif1",
>  			RK2928_CLKSEL_CON(30), 12, IFLAGS),
>  
>  	COMPOSITE(0, "aclk_gpu_src", mux_pll_src_cpll_gpll_p, 0,
> diff --git a/include/dt-bindings/clock/rk3188-cru-common.h b/include/dt-bindings/clock/rk3188-cru-common.h
> index 01e14ab252a7..dd988cc9d582 100644
> --- a/include/dt-bindings/clock/rk3188-cru-common.h
> +++ b/include/dt-bindings/clock/rk3188-cru-common.h
> @@ -103,6 +103,8 @@
>  #define PCLK_PERI		351
>  #define PCLK_DDRUPCTL		352
>  #define PCLK_PUBL		353
> +#define PCLK_CIF0		354
> +#define PCLK_CIF1		355
>  
>  /* hclk gates */
>  #define HCLK_SDMMC		448
> 





