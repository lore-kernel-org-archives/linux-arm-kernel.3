Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C4C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=; b=dcEhFgCZLNBro5y3W0MZlmu+cM
	c+44y9sIl7pdPZt2+O0sts6tngdQUj4QMOIVL52zkDwUcMzUkXz8oqACP9pg/FMVhOQzK6BKvhSqp
	ULRj9fYLdyLNoipn8Bn9dzFIMzwfJljVtzpZDtWI1a7rvK1JDdEJ+3s3GUI0/8qFQwwgbDhUnlzL7
	qb8YAeKY0+d1OMv3aqcCSEyWJdBWSfeUgEbfkJWbi3gl5MzH6GagQNtHvhOFOxf3H7/G1Q3u3aJ22
	n4HuE94yuwCZiyQrrHU+G/Vxf13URF9ozYn1nMB69IvVjVVqKAaLiRomB8/ezWlLp/CtrUOqZ4/a0
	HnA21K6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyJT-0000000BB9c-3jVr;
	Thu, 20 Aug 2026 08:39:51 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwyJR-0000000BB8N-1Vpl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 08:39:50 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66c70e2904dso2557930d50.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 01:39:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787215188; cv=none;
        d=google.com; s=arc-20260327;
        b=ErIs+9L1ogOyvEZyvYH51w2q84YYE7vZVjvUDmKWrb6ZTd+yhWkHL6ZU3oUD7QQGJO
         It8aMxNVQ+tmNqr9jTvxWdqHcGHnPr1mgyNxczlKEaGU6d3NgSibD0QztL4k5buN3osa
         BLS7C7LMl2teDCUnzYadfQzg0gSSXO5Mo70wDASgumd4oZh6uVrMAP1H82kCSfcSHc0R
         4MSK1eKhccLaLQ1AbPGLewy0eVdltOKDR4d+pEzI5F5CdRE7w20mrCq0LW1p4KrmyGRq
         bPTQIG8A9ZOgk4ftAvXcBW9J8XzAJWVgCakeWS37Ehy8Y0JhvpJY39WEqtRGwswpLXGo
         bJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        fh=GGaOGRw4So5W7RdjZmtqi3TIecxZRDdkJdKGqeiotoU=;
        b=N5A/5jEi0RLHz9fBF5bP6WY7CDUYXlKdYP6yzHhghI+Q4/hSWEqCGZvGJCf9v4MeNE
         y3+xrOlxCSYFsvBc10uKJXgKKDGH+xPeEeuBzbGUWeZLQkB2zU3kigB5Yx9922hoe0+G
         IphsoN5/k7mL2lZMQ1d0aJfIoIP8K5c0CV58Vs7Z46OCG50XHpbB6qnFPfOZqL2YqYMM
         OJBMBZHvTAH61LR5WsUW1WqnwFJwSPlhjq5WEnXgxLQedf4/ZObTVo0vYhd2NRFRX6tz
         aGNm0oEDLG3ll62z33Nnybi3wp01ctDpcJlU9pbR7PEDNZgr8GxslIHdSV54IPSM89Nk
         sD4A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787215188; x=1787819988; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        b=G60WZbRoT33oWmaDcqKzjEkGzsrX1Cx9ONFUswIglfobDQAnVNTm121Mw3VcBucP9r
         Tgoq+l8VaQPdZxNChQg4zbRqixyUBU12S7WhfF1y4rtArj4yyq1cTWJ+d9SnOCjJKaXs
         pMmGOlC4E0I1rP/3saRqpQdDTp2ewxFOx5b1pO5BrbY7JmbNefp/331/L4T98WGyi86t
         gjQn98RHAli6Hoh9pqWcUwcs78VuqiznIAv2Dd+GOiHsISHphi+qF5kc5oaZks7Qkrlx
         f0EjBOMGBH+psy6bhKL+sybbSiITibi4e5cLPWSPAmr3xOugVotTBpOLHwl+VosnLHuO
         3YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787215188; x=1787819988;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPkfI3IDNTID47/UVl4zqm8cNnUO3oY3o1tY2rxayrw=;
        b=aHkM6NL60Ek1+JmsyUClpsFo4j/esHslLQK6QAcPbaEaiJ38R1Vyz4BpVVJjInBqrb
         XTQG/Si9A7zB79s16k3UNbDWntNdNbC7uvL4wV8CwlK3lIYP9XgqoKakM+GwoWq9WRsT
         lA4XdusY74wUaEVJw/lbSPwXSIE33DERZwTxqPJlHmEu5GimklmKGf3IEWAC8EWGkrPE
         sOL8DAZ6UqGCN8h/77yXSb98qy/H10/dsvhDyJk0occsqf/L6ubjqXEfQSJg4Og/54hI
         oakycBXXhonH6NaMSDsbE/PUJ5t+3O0Cc2ZngjTFHte/gv2OC820LxaBAd45LycRyqWi
         aOkg==
X-Forwarded-Encrypted: i=1; AHgh+RrGx5ylIAO/KDoivahGcXiGks9H5v1BJQaC8Xml6MIXo1Cr8E9KvTBuTwLjAzKxtloTVFx8HC9XoMqNdZRbRGg1@lists.infradead.org
X-Gm-Message-State: AFuF++kRWggg7XXycWuYNOYR22A5ygrwj49EG5Kgwlw3Trt/dmNz6WKj
	2B07MxZcSlJf52PH28QzwPrfw1K0lCy7iibpNNUYtq7whQDfQ3VH1M5KE+4zR2j/664loLlUuIQ
	8Kmx7mWXBr/qQxMYleY/hGXRlLtshw62HL29Bp4abfxsJe8jVn/7NJ0bEBw==
X-Gm-Gg: AR+sD10nai4QzSzBvCuq8hSIWsRQtX97EibzcFvowJfT6rxPq0cwLR0LlSWIbvfkeM1
	fE6ZZ93zf+Gjj/EbPpaFGlBWJ1sop29CUfBSier8A1PrMRSGuE2tS9i+Q927XJKloOs/X2U0ukJ
	Io5AbCGbywuCIO+0XwL844arYX6K9Ja4Gbm6UipiBESvA5k1AdjR3g41yb624tdpGFIyr7hj+bN
	goackih7Q+9itC0zXnTHQVVHUn0WDhykwY5P8WMq/K551gfZ2W+8WI2d8Ts7G5Z6oB0t3vWxnxr
	uIx0mCTZudu0uYhsLUdovCC5J6ewKhz9bpHWdzteqC68p6Rbkec3Sr4gQ5CwNiGJEncFHJD/EI+
	E
X-Received: by 2002:a05:690e:803:20b0:667:b314:aeba with SMTP id
 956f58d0204a3-66ccb53611dmr2826265d50.5.1787215187958; Thu, 20 Aug 2026
 01:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260820075427.67050-1-karl@asseily.com>
In-Reply-To: <20260820075427.67050-1-karl@asseily.com>
From: Karl Asseily <karl@asseily.com>
Date: Thu, 20 Aug 2026 11:39:37 +0300
X-Gm-Features: AcwNN1XuFpjrLHh4no0BJ3vL9VS_J2vNnUUzNm52YHAD3fGNRJEb3zzTPlR_AqM
Message-ID: <CA+gvwbo2Brc+JLBZZxn03OyD51=7hw3-j08-5x4YoXG2Cx1z9g@mail.gmail.com>
Subject: Re: [PATCH] clk: rockchip: rk3588: let MCLK_SPDIF* rate requests
 reach the divider
To: mturquette@baylibre.com, sboyd@kernel.org, heiko@sntech.de
Cc: bmasney@redhat.com, linux-clk@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_013949_427705_07002EC0 
X-CRM114-Status: GOOD (  26.00  )
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

Please drop this patch. It is a no-op and my analysis was wrong.

rockchip_clk_register_branch() adds CLK_SET_RATE_PARENT to every
branch_gate at registration:

case branch_gate:
flags |=3D CLK_SET_RATE_PARENT;

so the MCLK_SPDIF* gates already propagate and the flags column in the
branch table makes no difference.

The behaviour I was chasing was real, but the cause is elsewhere:
simple-audio-card only calls the CPU DAI's set_sysclk() when the card
node has an mclk-fs property, and rk_spdif_set_sysclk() is the only
caller of clk_set_rate() in the S/PDIF path. Without mclk-fs no rate
request is ever made, MCLK stays at whatever the bootloader left, and
44.1 kHz material goes out at 48 kHz. Adding mclk-fs to my card node
fixed it. The before/after rates I quoted belong to that change, not
to this one.

Sorry for the noise.

Karl

On Thu, Aug 20, 2026 at 10:54=E2=80=AFAM Karl Asseily <karl@asseily.com> wr=
ote:
>
> Every MCLK_SPDIFn gate is declared with flags 0, while the CLK_SPDIFn mux
> immediately above it already carries CLK_SET_RATE_PARENT. The rockchip
> S/PDIF driver calls clk_set_rate() on the gate, which has no .set_rate of
> its own and, without CLK_SET_RATE_PARENT, no way to pass the request up.
> The clock core therefore computes "new rate =3D=3D current rate", returns=
 0,
> and changes nothing.
>
> The visible effect is that S/PDIF is stuck on whatever divider the
> bootloader left behind. On a board whose audio PLL is parked on the
> 48 kHz family, every 44.1 kHz source goes out at 48 kHz, silently, with
> nothing reporting an error. Measured on an RK3588 board playing 44.1 kHz
> material, before and after:
>
>   mclk_spdif0   12287999 Hz    48000 x 256
>   mclk_spdif0   11289598 Hz    44100 x 256
>
> Add CLK_SET_RATE_PARENT to all eight MCLK_SPDIF gates so the request
> propagates to the fractional divider that can satisfy it.
>
> Propagation stops there. Each chain terminates at CLK_SPDIFn_SRC, which
> is declared with flags 0, so a rate request cannot reach a shared PLL and
> pull unrelated consumers off frequency.
>
> Two pairs of gates share a divider - mclk_spdif2 and mclk_spdif2_dp0 both
> sit on clk_spdif2_dp0, and mclk_spdif5 and mclk_spdif5_dp1 on
> clk_spdif5_dp1 - so a rate set on one moves the other. That sharing is in
> the hardware and is not introduced here; before this change neither of
> them could set a rate at all.
>
> Signed-off-by: Karl Asseily <karl@asseily.com>
> ---
>
> Notes:
>     Generated against broonie/sound.git for-next. clk-rk3588.c
>     carries no ASoC changes, so this should apply to any current tree.
>
>     Tested on RK3588 hardware running 7.1.3: without this a 44.1 kHz stre=
am leaves
>     the S/PDIF transmitter at 48 kHz; with it mclk_spdif0 retunes and the=
 receiver
>     locks at 44.1 kHz.
>
>     checkpatch --strict reports "Alignment should match open parenthesis"=
 on the
>     touched lines. That continuation indentation is unchanged by this pat=
ch and
>     matches every other clock entry in the file; realigning only these ei=
ght would
>     make them the inconsistent ones.
>
>  drivers/clk/rockchip/clk-rk3588.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk=
-rk3588.c
> index 2ba9976654c..b3d577dccfc 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -960,7 +960,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(33), 0,
>                         RK3588_CLKGATE_CON(9), 0, GFLAGS,
>                         &rk3588_spdif0_fracmux),
> -       GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", 0,
> +       GATE(MCLK_SPDIF0, "mclk_spdif0", "clk_spdif0", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(9), 1, GFLAGS),
>
>         GATE(HCLK_SPDIF1, "hclk_spdif1", "hclk_audio_root", 0,
> @@ -973,7 +973,7 @@ static struct rockchip_clk_branch rk3588_early_clk_br=
anches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(35), 0,
>                         RK3588_CLKGATE_CON(9), 4, GFLAGS,
>                         &rk3588_spdif1_fracmux),
> -       GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", 0,
> +       GATE(MCLK_SPDIF1, "mclk_spdif1", "clk_spdif1", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(9), 5, GFLAGS),
>
>         COMPOSITE(ACLK_AV1_ROOT, "aclk_av1_root", gpll_cpll_aupll_p, 0,
> @@ -1868,9 +1868,9 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(123), 0,
>                         RK3588_CLKGATE_CON(57), 4, GFLAGS,
>                         &rk3588_spdif2_dp0_fracmux),
> -       GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", 0,
> +       GATE(MCLK_SPDIF2_DP0, "mclk_spdif2_dp0", "clk_spdif2_dp0", CLK_SE=
T_RATE_PARENT,
>                         RK3588_CLKGATE_CON(57), 5, GFLAGS),
> -       GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", 0,
> +       GATE(MCLK_SPDIF2, "mclk_spdif2", "clk_spdif2_dp0", CLK_SET_RATE_P=
ARENT,
>                         RK3588_CLKGATE_CON(57), 6, GFLAGS),
>         COMPOSITE(CLK_SPDIF5_DP1_SRC, "clk_spdif5_dp1_src", gpll_aupll_p,=
 0,
>                         RK3588_CLKSEL_CON(124), 7, 1, MFLAGS, 2, 5, DFLAG=
S,
> @@ -1880,9 +1880,9 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(125), 0,
>                         RK3588_CLKGATE_CON(57), 9, GFLAGS,
>                         &rk3588_spdif5_dp1_fracmux),
> -       GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", 0,
> +       GATE(MCLK_SPDIF5_DP1, "mclk_spdif5_dp1", "clk_spdif5_dp1", CLK_SE=
T_RATE_PARENT,
>                         RK3588_CLKGATE_CON(57), 10, GFLAGS),
> -       GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", 0,
> +       GATE(MCLK_SPDIF5, "mclk_spdif5", "clk_spdif5_dp1", CLK_SET_RATE_P=
ARENT,
>                         RK3588_CLKGATE_CON(57), 11, GFLAGS),
>         COMPOSITE_NOMUX(CLK_AUX16M_0, "clk_aux16m_0", "gpll", 0,
>                         RK3588_CLKSEL_CON(117), 0, 8, DFLAGS,
> @@ -2059,7 +2059,7 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(149), 0,
>                         RK3588_CLKGATE_CON(63), 6, GFLAGS,
>                         &rk3588_spdif3_fracmux),
> -       GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", 0,
> +       GATE(MCLK_SPDIF3, "mclk_spdif3", "clk_spdif3", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(63), 7, GFLAGS),
>         COMPOSITE(CLK_SPDIF4_SRC, "clk_spdif4_src", gpll_aupll_p, 0,
>                         RK3588_CLKSEL_CON(150), 7, 1, MFLAGS, 2, 5, DFLAG=
S,
> @@ -2069,7 +2069,7 @@ static struct rockchip_clk_branch rk3588_early_clk_=
branches[] __initdata =3D {
>                         RK3588_CLKSEL_CON(151), 0,
>                         RK3588_CLKGATE_CON(63), 10, GFLAGS,
>                         &rk3588_spdif4_fracmux),
> -       GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", 0,
> +       GATE(MCLK_SPDIF4, "mclk_spdif4", "clk_spdif4", CLK_SET_RATE_PAREN=
T,
>                         RK3588_CLKGATE_CON(63), 11, GFLAGS),
>         COMPOSITE(MCLK_SPDIFRX0, "mclk_spdifrx0", gpll_cpll_aupll_p, 0,
>                         RK3588_CLKSEL_CON(152), 7, 2, MFLAGS, 2, 5, DFLAG=
S,
> --
> 2.34.1
>

