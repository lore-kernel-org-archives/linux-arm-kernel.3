Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A594CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 10:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WziRWtAQDPOgqfcKKpsG/YJDdpUVFZowmRQABd+4UVY=; b=vQ06I2Xi0iv0A+ESEl8D+Do8We
	aYvWlKv6mekshUv3HtrqR2sHyDH1mCRVkQQyfjiasxwFRvdy4b+bnHLbH+aplzAnihlmtpTyyEA5+
	GbvO9y7OBfb+Ez/iYEnT9764Kdtw04vScnV0x133/theqwO93phFtDz6ObmlsAyR3ct+F9hig6mNb
	CWNWSvO1BofGw1/Mp9warA+OctpqF5Ym87qk8ZHVCxEf3XJanJ7gqYBkFo8lASuh1puywVzrFDwg6
	zJbe1afDvpepSr+Q4vtOJn6i/MIyzOcLB8Gg+0FgsicpZS0WcEUrB2WUG1XYlftNDckLyufJAuRVU
	gKr5+qsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ySx-00000001EkJ-16ms;
	Wed, 15 Oct 2025 10:10:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ySt-00000001Eip-3bv0;
	Wed, 15 Oct 2025 10:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=WziRWtAQDPOgqfcKKpsG/YJDdpUVFZowmRQABd+4UVY=; b=m0ZZqw7QOv1LxvPy6+OiudHA/o
	72d/SeDprr4jod1xW6uBoB5b7acxzePtVNTn+GrZkVkT0ZvJcsXUN9fci5HfTDGoEF8d5NbOpf1YR
	YQrh215wAqbtV1oHp8i5sH0nGbNrDEpqT3qPNXoZZJDWkF/uvHwG/yY85c1SGeiUkndx9lxkKey3T
	cKfZB+6OKPr79BJ4/gdZ1u0+1JLmBmYMgFHHPREiwjoE9k2icQKx2UaZHJ/RLW3k2N+qNTB32iPvc
	hZhCODQElGacGtgBAg0oxvJVTS41Aj+EEajYn40wLJOsOhlbjafPFl+8nZJv4kLnNz25mO2EUXs1U
	1Hmo3Qew==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8ySo-0006Qp-Ej; Wed, 15 Oct 2025 12:10:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com
Subject: Re: [PATCH v1 1/5] clk: rockchip: Implement rockchip_clk_register_armclk_v2()
Date: Wed, 15 Oct 2025 12:10:33 +0200
Message-ID: <2271625.NgBsaNRSFp@diego>
In-Reply-To: <20251015091325.71333-2-zhangqing@rock-chips.com>
References: <20251015091325.71333-1-zhangqing@rock-chips.com>
 <20251015091325.71333-2-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_031039_921265_C813137A 
X-CRM114-Status: GOOD (  17.35  )
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

Hi Elaine,

Am Mittwoch, 15. Oktober 2025, 11:13:21 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> The clock path of CPU may be simplified as follows:
>=20
>     --gpll--|--\
>             |   \
>             |    \
>             |     \
>    --v0pll--| mux |--[gate]--[div]--clk_core--
>             |     /
>             |    /
>    --v1pll--|   /
>             |--/
>=20

when introducing new core concepts, please really try to explain the
concept and also in detail why the old code cannot fullfill the new
requirements.

=46rom what I gathered, the main difference is that on the bigger socs we
have one sort of dedicated PLL for each armclk (i.e. B0PLL, B1PLL, LPLL
on rk3588) with the other parents being used as an interim source while
we adjust the main one.

Here the rv1126b (and rk3506) don't have that, but instead can select
from a number of "equal-but-shared" PLL sources.

Is my reading correct here?


> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  drivers/clk/rockchip/clk-cpu.c | 165 +++++++++++++++++++++++++++++++++
>  drivers/clk/rockchip/clk.c     |  24 +++++
>  drivers/clk/rockchip/clk.h     |  15 +++
>  3 files changed, 204 insertions(+)
>=20
> diff --git a/drivers/clk/rockchip/clk-cpu.c b/drivers/clk/rockchip/clk-cp=
u.c
> index dcc9dcb597ae..a48628e5c095 100644
> --- a/drivers/clk/rockchip/clk-cpu.c
> +++ b/drivers/clk/rockchip/clk-cpu.c

[...]

> +struct clk *rockchip_clk_register_cpuclk_v2(const char *name,

can we please find a descriptive name instead of "_v2"

I guess if my reading above is correct something like "_multi_pll" or so
might be nice.


Thanks
Heiko



