Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC0CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 13:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aok4Q7VCeJwiry1qOMn1QTGAWgJx8h8keP6SSm7tHlQ=; b=mexvwYFydaOTXGvu/WSfjParO3
	cZ13d9hihLiUu06gFHvK3lFLp0drauUB3tWazKI45HM3yx0DHWxeZA+3CKBtlbYqUlAZj0XKNJEBe
	OGpeTiShbrzBI+CnI7ZsWxGnCvy67zUM+uQ/YgkJoWQZLG5wlXhbVgfkuZ7WPt5ltjYjLRI2zTpha
	QdnhEDH0OcmzqzxI0vezQUWWbtI8zUzyc8SDwKh25PKfWGqoF67wu2FIsUGyChduKm1mNAdsI6q4L
	Q6QKNPU7fFvgbl7/RW1Fkn1H5GbFDPl53V3bIZ5SK/vFscpizTGzF/YoIMn02hO4BSlVMxQTZpIF5
	R2YYWRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBChq-0000000HCUB-44tq;
	Tue, 21 Oct 2025 13:47:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBCho-0000000HCTX-1Be9;
	Tue, 21 Oct 2025 13:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=aok4Q7VCeJwiry1qOMn1QTGAWgJx8h8keP6SSm7tHlQ=; b=Mlh89lu7wtQLx4mdH9MuwJQYFv
	XjIltf3atCUoXi+p5e7lCcYpM4UyPbUFJm+8eFFY+UGuhKQeQyluZp0Rp4Gf4KwNQsQVqVsmdQKY+
	QfyOik/etf8+aeNaxMM/M03AgFlf+oK63yjolN12SLXGnWrPaev6B6BdbNe2fOhTph+snLAMKMkhY
	tcRNX0V96K6d+lekXsAm4R1AqXuq0oeJ40GsiSjyl8xqwkVAVmp1V1ul5J5fikDlL9QxhJDmoJg67
	DL6D3FDSRj9khpecMAgByuCCTkYyfhzqrDg4gHSGMBAQLBa3rTWPA0cNDLF1L2DZ2nEzDHOmZ2UG1
	ltdW8tjw==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBChk-0003Zt-HY; Tue, 21 Oct 2025 15:47:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@kernel.org, sugar.zhang@rock-chips.com,
 zhangqing@rock-chips.com, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
Subject: Re: [PATCH v4 5/7] clk: rockchip: add support for pvtpll clk
Date: Tue, 21 Oct 2025 15:47:11 +0200
Message-ID: <13871591.dW097sEU6C@phil>
In-Reply-To: <20251021065232.2201500-6-zhangqing@rock-chips.com>
References: <20251021065232.2201500-1-zhangqing@rock-chips.com>
 <20251021065232.2201500-6-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_064716_349399_9AA29B41 
X-CRM114-Status: GOOD (  18.76  )
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

Am Dienstag, 21. Oktober 2025, 08:52:30 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Elaine Zhang:
> Support to adjust pvtpll by volt-sel and otp.
> Support calibrate pvtpll init frequency.
>=20
> PVTPLL is used to monitor the chip performance variance caused by chip
> process, voltage and temperature, and generate a set of reference signals
> for adjusting the voltage of the chip.
>=20
> PVTPLL supports the following features:
>=20
> 1. A clock oscillation ring is integrated and used to generate a clock
> like signal (osc_clk),the frequency of this clock is determined
> by the cell delay value of clock oscillation ring circuit
>=20
> 2. A frequency counter(osc_cnt) is used to measure the frequency of osc_c=
lk.
>=20
> 3. A externally input clock (ref_clk) is used as a reference clock for
> detecting the frequency of osc_clk.
>=20
> 4. A calculation counter uses ref_clk to generate a configurable
> periodic timing window.
>=20
> 5. Two clock counters are used to measure the frequency of the clock
> generated by OSC_WRAPPER?
>=20
> 6. Support for dividing the ref_clk and osc_clk
>=20
> 7. Support for configuring the effective polarity of the voltage
> regulator signal 'OUT'
>=20
> The clock path of cpu used pvtpll:
>=20
>     --gpll--|--\
>             |   \                                 | \
>             |    \                                |  \
>             |     \                               |   \
>    --v0pll--| mux |--[gate]--[div]--clk_core_src--|mux |--clk_core
>             |     /                               |   /
>             |    /   --ref_clk--[div]-cpu_pvtpll--|  /
>    --v1pll--|   /                                 | /
>             |--/
>=20
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

[...]

> +	pvtpll->regmap_cru =3D syscon_regmap_lookup_by_phandle_optional(np, "ro=
ckchip,cru");

Not convinced about that :-) .

(1) the cru itself already ioremaps the CRU memory, so having a syscon
    there would ioremap that memory a second time.
(2) we should definitly not expose the whole CRU io-memory to other
    drivers to write "random" stuff to. This will just invited further
    hacks, where people want to take shortcuts with clock settings.

Also this seems highly specific to the rv1126b.

Looking at the registers, this is a clk-mux between that deepslow clock
and the actual pvtpll output and the config function really only
reparents to the pvtpll in all cases.

So I believe this should in the worst case just be mux clock, but also
I see that the "correct" setting will already be set by the

        /* pvtpll src init */
        writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_CORECLKSEL=
_CON(0));
        writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_NPUCLKSEL_=
CON(0));
        writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VICLKSEL_C=
ON(0));
        writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VEPUCLKSEL=
_CON(0));
        writel_relaxed(PVTPLL_SRC_SEL_PVTPLL, reg_base + RV1126B_VCPCLKSEL_=
CON(0));

in the rv1126b clock driver?

So that whole mode setting should not be necessary at all maybe?

Thanks
Heiko



