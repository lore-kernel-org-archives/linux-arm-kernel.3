Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DB8C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 19:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=; b=CKl3j46jMI2pLMwAfSgDi4Phtb
	HCmCH7BnVAg0/PBalhvjH1sSbSA/3LNIfRBGQmUBgMEoRtlr8YSFsxgfJRTyX+86LTEfVry/oU7yi
	EBCa9HibortHZX2aJ+Ks3TTaN8sCOwi6x5Cl9HyW2R3i3ZDPPWQ/QCkZmqQbtgI00iHzjFUgwaNN5
	YUPDXMO8L0w10bWUrcb79ciJzCdt72kjzuhlo3FZcRLJ7L0ell//MjHYxx96rRA97KZ8ctTOyl7L+
	PadmIYLMGI1iZgpXvC7FTeZhY28WCB17QUhZPHAraxGI/zGcLkEDJmW1ssP9Vs9cwkMbdwjyjskh9
	fO3Ob32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVEbN-0000000FcNk-06oA;
	Fri, 27 Jun 2025 19:19:09 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDJr-0000000FSad-0cNr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 17:57:00 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-60f276c7313so94133eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1751047018; x=1751651818; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=GF3g2d0arM4b08F5WCBqovjtL9hVrKD1cCJqvgjIe+53bp4MqB7w3QKUSZsIBRJzIt
         bWX1jaoCHn1OE9bclNFGPk0cflNMMTinDv/26CKqnffynfZ+hsM4B4aqCmz6WVdE55bu
         o4cNgr0ta7nwRg63pzRQp78RDfvyQZfMRzn/9UG3GddSQGmnleXYcx3u8z297PA4UtTd
         TaHopIkgHsooJHdiv5C39L/QAdpUmedG1g2Q4IaViBOeA3AzFEBeGZbMD4+E04fln5yg
         59Qqg6rVcTzlm+8pN/I/xIbEJ50QZmqanr7W+0YlaL11tC9FVlEoeLuCrhTSrYLslb4U
         aOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751047018; x=1751651818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbuYeB/znMRVmNnp22re7GbKA0GoKXipcQWP3fhXkwI=;
        b=YRnSmT9YSc2kFzAkqAKhgbD4hw+mMVAr2/WVlo/So+DD/WXLqm+3zxepqTofJOZVo3
         OrhlsYnYWReh1MVl+0mG6R7xw2f38cO1rY4rERVtG46yZnKmZpvdy1yVHTmfCm/sWfSI
         f3aCpJtM1kMnqUgM6WMKFHcEme8mufJ2zfjModdtfCP+sRXT5BFQXj6o/qAsSyjZSZAD
         exsdiLktlWydRyIviwTP/sNr4fwFKQxe9JLU48v+eXvRsrq5fw2qEqkg5xOuVep5cN20
         BJhkuzgnyZtsd5qB6gxS2EA+MjRehXa/CTxov/dsqdzgvhIwh7yBNxLiWzeve/6UZfFK
         GqdA==
X-Gm-Message-State: AOJu0Yyvo0HWCeZZ6uMwHXKIYfnQqSD6VEQzPPNis3vnEOe/YTV3FiKK
	AnoEOr0IIsLJSKaXglIjaoNQ4cEMnNIwZ124H5OcgpxpZwISCOL6+O8GPJF6Y/6R3EgkC/xx6YA
	SfhK5mI/O4sncFwqZl8C/cMXaMFh3Q7gIXzNPT6mymw==
X-Gm-Gg: ASbGncuamG/xwtu0LuFq2B3QlIcRrPEHbD6y53+0CvK5bPKSXUAQEhavNo7GlyW/5RK
	lkW98iWmYuGjqLkWhVwmaF/sZq+i/nEtMmvASpeK//KEZX6YLnDOM77dcjQeWFojPRpW3ztw6b4
	xqWHPEwjtzt+qQTvUoc9xpppqeTIRQnM3XzWJKmA13ZiQX+NeotnjwGA==
X-Google-Smtp-Source: AGHT+IHn/O+yw4sdAQD7guPzO4j4/3MQOR3FH8Nb/hBYMQX3XW0mdG4bsbuqDOKcybzRbPj3Ume9tDS47O4jmJlhfy8=
X-Received: by 2002:a05:6820:994:b0:611:b561:258e with SMTP id
 006d021491bc7-611b90965aemr2849488eaf.3.1751047017799; Fri, 27 Jun 2025
 10:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250620213447.56392-1-aford173@gmail.com>
In-Reply-To: <20250620213447.56392-1-aford173@gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Fri, 27 Jun 2025 10:56:46 -0700
X-Gm-Features: Ac12FXwaCCVUyBeRU0CpBhDP3QxyDWYKIvfZAtJZ7SnZG3kcRW-1EnKbWFLlM-8
Message-ID: <CAJ+vNU0caeeC6in5dO_jkkbYNAnTL7drBZcmNBsstbrPWqUkHw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm-beacon: Fix HS400 USDHC clock speed
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_105659_268171_D3F4A5ED 
X-CRM114-Status: GOOD (  17.65  )
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

On Fri, Jun 20, 2025 at 2:52=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> The reference manual for the i.MX8MM states the clock rate in
> MMC mode is 1/2 of the input clock, therefore to properly run
> at HS400 rates, the input clock must be 400MHz to operate at
> 200MHz.  Currently the clock is set to 200MHz which is half the
> rate it should be, so the throughput is half of what it should be
> for HS400 operation.
>
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development=
 kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> index 21bcd82fd092..8287a7f66ed3 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
> @@ -294,6 +294,8 @@ &usdhc3 {
>         pinctrl-0 =3D <&pinctrl_usdhc3>;
>         pinctrl-1 =3D <&pinctrl_usdhc3_100mhz>;
>         pinctrl-2 =3D <&pinctrl_usdhc3_200mhz>;
> +       assigned-clocks =3D <&clk IMX8MM_CLK_USDHC3>;
> +       assigned-clock-rates =3D <400000000>;
>         bus-width =3D <8>;
>         non-removable;
>         status =3D "okay";
> --
> 2.48.1
>
>

Hi Adam,

This caught my interest. Where in the IMX8MMRM do you see this and
would it also apply to the IMX8MP? (You've patched your IMX8MM and
IMX8MN boards).

Have you encountered any issues when running eMMC at HS400 due to this
or is it just something you noticed in the RM more recently like with
my recent patch that lowers SPI clock due to an obscure RM note [1]

Best Regards,

Tim
[1] https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D96=
5976&archive=3Dboth

