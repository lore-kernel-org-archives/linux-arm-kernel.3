Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C7EC9EC97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=; b=wGCrIz0v/Ae96WtTre5+Yfc8Br
	y4CZCUuvrAertSPGwuh4XGHC0oqLMzDqW/wRxg+Dz4q3X6tkUQZPbBWkoJbRoNepY8PnpRHyHpr+j
	i0VzJ0tj3NIEF2HR5hHJZYbONqL2gielyEK7fvZR5klzL00vZG3rFK79qvFqRYskSJqtJZT2brmSP
	IkdVEiN8KF9xhyET9FHg7KxaxyVb4Hk+tjCiVXHVVy1mIGf8nLLERZnM53DYJm38TnWXT3eAX4QBo
	ICBRZMhEzVewG+urExqW4mdQU+qbKSJhABcfQywE427hZF/TBaaj57BBOpRwt5HlmooUPZW9nTXxY
	8MU5uGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJVQ-00000005boQ-482L;
	Mon, 12 Jan 2026 15:06:56 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJVO-00000005bny-46fk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 15:06:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-81f39438187so871877b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 07:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768230414; x=1768835214; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=q3ja9ejEM9d7U3h7qZ7pZzzz6FCmqG1sZ+JSdwVDSV5akere8b33r+xjMqsnKFp82u
         PEUj+IiPaS2bZsF0vFA5fOfk7VK+6Ma5ZPOYnfBsWh9iRzYVhlPw9ZS51aim5GiwvN7t
         KWTaoUy0Nw2LP0dNgVArP551XkBQVGUva62TBp1ahIvH1G2+0hMvvFcIAWDdcLrxa1s7
         ZF+yhGBWk1OPoFfVxa9dxx2T8tYDc7YOiMiE3a7dTrC5iOiPwNM1fNM1hG1UcXlblYpi
         0PIT8OWDKZotfkf9Q0/5ukQwpiuVeOLkkJw4X3oRcRgW5zxdDBfjt86/1Y3eppAsb3HK
         yAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230414; x=1768835214;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HP6AkMvuLhfF7BdOoI9QTFT1HBmcbloV9tH4WSSJF80=;
        b=RquEQINlZCtGiQhUqdF5cmYiqAbUe6dgtsQkK7xNYlsiIrA5J4a2qXWG1vXPm6F8H3
         s0NZJjko8MhZjhZ91V+Yj2Aq1mPHVk5iJucL2WLUR0sz3uqxXCKLmMmCxMmzhucJOv5l
         xBgXFaal1JSY33Fo7xMUpp1jcUHvVk27nMB2ZV2yUNrFZ/aCbcEX9lfLnSLWQyTI/zfU
         e05iz5Zuv/3KfiSUaFi3M+8MS7HydqzXoEhCemh8T1H0KJU3hv1SkpbMkEaUcTObZVXj
         PqVrixVEqeq+j3XI1TlFOjmUhtkZwaZ3jHoORWTJMojZXYQ0ogP05wAbbyk6Rbtu7VbY
         E8OA==
X-Gm-Message-State: AOJu0YzS4tC/BaDBgEMok3lPIEe6iVbmR5TmmM3GIiefp94h7rnWQmv8
	KVN0TH6BJAyoQDh27hX/YT1c/xk42mQlWHUOJVvwg+n4E1zbdlan4DAyUhAPRnv0tOc=
X-Gm-Gg: AY/fxX4SIzrGdSp6xTY8Pe4PVlYcWMcvC02hOU7Khd/hD6uXipzctHqlbvgCBYm5sE7
	sp2dS4KWMTiMlPpTyBRAYJt+K9nAMcKSJk782jT4u3lgSIxYCIP1mkeJVlBXpn3mVuFpW8TN/Yj
	eT4W5nR659ztrFESqIjRUcGDT2B7sURZCpZVsKbl8nM8gOKNzD+cL3RT2NafT5qkuz7q4ig36JB
	mPrWdFHb++YgfgVu98fqonqi2fwNTh86mRmyxqMfpMa0gKdrb2n66eEOeHEEUDx+17syh/08RHy
	b/Y8LRvZksLbgIzV9Dzku3fF3WropBb1Y193a3w0+Ddj72Dk835n+YGAuyei1ESqdLNPFhkGCrN
	HChkQvsGFMsvPPtmK1G17ws6vKsZVyrJOmptnQ6qx+qJsppRPrFzmrfSEahLy8zc4w4TpHJ3E+T
	S8FACxLgDowfm0tkye
X-Google-Smtp-Source: AGHT+IEPMgDPCYjsxat+foxE0Th9ljcBX6K2Ppfj2CK2lZL+CCALz+VFGZbGbJZ0pdZjm8CcOhAGug==
X-Received: by 2002:a05:6a00:90a6:b0:7e8:4398:b34f with SMTP id d2e1a72fcca58-81b7f7e226fmr16141102b3a.34.1768230413899;
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Received: from draszik.lan ([212.129.79.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6c8199f4sm6182089b3a.68.2026.01.12.07.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 07:06:53 -0800 (PST)
Message-ID: <7097507636282e4613d324ff5acb74eb747d519b.camel@linaro.org>
Subject: Re: [PATCH v2 4/5] clk: samsung: gs101: add support for Display
 Process Unit (DPU) clocks
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki	
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	kernel-team@android.com, Will McVicker <willmcvicker@google.com>, Juan
 Yescas	 <jyescas@google.com>, Doug Anderson <dianders@google.com>
Date: Mon, 12 Jan 2026 15:07:20 +0000
In-Reply-To: <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
References: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
	 <20260112-dpu-clocks-v2-4-bd00903fdeb9@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_070655_022935_10DD8057 
X-CRM114-Status: GOOD (  14.68  )
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

On Mon, 2026-01-12 at 14:16 +0000, Peter Griffin wrote:
> cmu_dpu is the clock management unit used for the Display Process Unit
> block. It generates clocks for image scaler, compressor etc.
>=20
> Add support for the muxes, dividers and gates in cmu_dpu.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> Changes in v2:
> =C2=A0- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
> =C2=A0- Fix dout_dpu_busp parent (Peter)
> ---
> =C2=A0drivers/clk/samsung/clk-gs101.c | 283 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A01 file changed, 283 insertions(+)
>=20
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs=
101.c
> index 8551289b46eb88ec61dd1914d0fe782ae6794000..b38c6c8749aae42319d2004ff=
5ffbc9a19320cac 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -25,6 +25,7 @@
> =C2=A0#define CLKS_NR_MISC	(CLK_GOUT_MISC_XIU_D_MISC_ACLK + 1)
> =C2=A0#define CLKS_NR_PERIC0	(CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK + 1)
> =C2=A0#define CLKS_NR_PERIC1	(CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK + 1)
> +#define CLKS_NR_DPU	(CLK_GOUT_DPU_SYSREG_DPU_PCLK + 1)

Between APM and HSI0 to keep alphabetic ordering :-)

> =C2=A0
> =C2=A0#define GS101_GATE_DBG_OFFSET 0x4000
> =C2=A0#define GS101_DRCG_EN_OFFSET=C2=A0 0x104
> @@ -4426,6 +4427,285 @@ static const struct samsung_cmu_info peric1_cmu_i=
nfo __initconst =3D {
> =C2=A0	.drcg_offset		=3D GS101_DRCG_EN_OFFSET,
> =C2=A0};
> =C2=A0
> +/* ---- CMU_DPU --------------------------------------------------------=
----- */

I'll do a full review later, but this new block should also be between
existing CMU_APM and CMU_HSI0 blocks to keep alphabetic ordering.


Cheers,
Andre'

