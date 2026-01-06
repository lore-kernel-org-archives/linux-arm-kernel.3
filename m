Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E382CEFD15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 21:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBHaApQtC04T9moDxD3c+2ckkQCoO8PAwV8aYj1W34k=; b=ar7Unno0gJA60pGn4jgun9GLux
	t5vGDrE4RIdghMMZQWRirPQuMPnzpzdEA6dl5nBKyMX68TeaIwfBE8mzD6cMN1kVdbhPROn73pY71
	KYgV6mcn9huxC3Scp2TNFh/etV2rHp72pYBf9LjsRS4OWXqCOFrPwKMG/xVtixUAdQixnN+EubfwV
	N2cF15ldNJxwjebEOZp1NBkDHvM9eh5VhqOscOQu3uA9IqH8gX33h0T7hqKAixx0QkAbvWKjZj3G+
	M+icxg1JBm16Kc6xwZ4YD7r+spfDJ8dICbPeCDY0pt6FKecKmrr/+1krI24aiDRI1SWbkNt+sBntH
	kRQaCdqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEpw-0000000DsXj-2Gav;
	Tue, 06 Jan 2026 21:43:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdEpu-0000000DsXd-3deb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 21:43:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05B1A6013C
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 21:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1222C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Jan 2026 21:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767735809;
	bh=AbF1eOY89KhXmRJMDsJG8KEK/8SWy/YP0fH0ODncTA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cZhV1TK/rp3f5Bt8aOXeN14taQ4noYvV6auOfn2+dSCUTE795qZzWyBzTIJ9jt3W0
	 XGC9cQI2WBImBapS4jWDp0eEVslWePAur+dGXKqt3n6hBi4oK198vn9IiWABR+Qw1U
	 dFOc3ZI0HNidZBVrw8ZETUHrpy4K1mYLm5QIWXuU9StPeo1WvhT9NeFMgk6LsJt1xq
	 89qOTrWvvUll1tJzLcHlRL76jZXLYyZiYU1qmkPb+XyoPhYcSoFq7qc4YqYsJKU/q6
	 AUBCT8Pll7tsa+tk8TSWU+hPukw30eFhI6dMWbgG3Gx5krEfmphDOGGv98Se9p6EGZ
	 8gZ107YULPhSw==
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b727f452fffso18971566b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 13:43:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXwvjYcYZnaKxT/22c2TpUKCUiSvvDxiMfi27YDxtJLwFhKQpZPzBwxihHl7ZL1PQohhtUSGahFfbKXOPa6uZ7X@lists.infradead.org
X-Gm-Message-State: AOJu0YzSjXmwliM/a7jiN6BMsQbQBcXJMG/fN28qROGwDzgBtZYctCmT
	sjqWT95hv8VrNuvMf6JHmaDZYzk0rKkZFeEL9/+8W+5T+m6/1OZdb7OeAqLWTdf9voC/axT/fQ0
	xZDIWlZT/9o5ehp+Mks3Zz5InDRq4og==
X-Google-Smtp-Source: AGHT+IFxhMpPIoUMMMgZYzU2Daw/YU+xq9ktCivIKXSJwd/AoywlJ3PqutPpN9e8sIAT/rTKCPU1AW4EfzAUlBh+O3s=
X-Received: by 2002:a17:907:9550:b0:b7f:fa5d:53d with SMTP id
 a640c23a62f3a-b8429b96f7dmr302576966b.30.1767735808153; Tue, 06 Jan 2026
 13:43:28 -0800 (PST)
MIME-Version: 1.0
References: <20251229165127.4006134-1-Frank.Li@nxp.com>
In-Reply-To: <20251229165127.4006134-1-Frank.Li@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 Jan 2026 15:43:16 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+6+y5POyWmQnkMB6PJWvH-Gt-qAiJO5gk9N2L5GZT8SQ@mail.gmail.com>
X-Gm-Features: AQt7F2oDZcdOwHwx-niPp0Zu_2KEnB_1S_Vt1fCBf44bR_3pWueL-Rt34VmPsjI
Message-ID: <CAL_Jsq+6+y5POyWmQnkMB6PJWvH-Gt-qAiJO5gk9N2L5GZT8SQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-skov: add pinctrl-name 'reset' to
 fix CHECK_DTB warning
To: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Dec 29, 2025 at 10:51=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add pinctrl-name 'reset' to fix below CHECK_DTB warnings:
>   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: switch@5f (microch=
ip,ksz9893): pinctrl-names: ['default'] is too short
>         from schema $id: http://devicetree.org/schemas/net/dsa/microchip,=
ksz.yaml#
>
> The commit (e469b87e0fb0d dt-bindings: net: dsa: microchip: Add strap
> description to set SPI mode" force use two pinctrl-name 'default' and
> 'reset'. switch@5f doesn't use SPI, so it is safe to use the same pinctrl
> setting for both.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/a=
rm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> index 020f20c8ce667..7d2fc5fdd3bd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> @@ -373,8 +373,8 @@ &i2c4 {
>
>         switch: switch@5f {
>                 compatible =3D "microchip,ksz9893";
> -               pinctrl-names =3D "default";
> -               pinctrl-0 =3D <&pinctrl_switch>;
> +               pinctrl-names =3D "default", "reset";
> +               pinctrl-0 =3D <&pinctrl_switch>, <&pinctrl_switch>;

I guess this is getting dropped anyways, but this is completely wrong.
"reset" entry here corresponds to pinctrl-1 property. pinctrl-N
properties can have any number of phandles, but those are all one
name.

Rob

