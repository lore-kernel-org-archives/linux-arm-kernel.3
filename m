Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336DFCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 15:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6GfpxvqDVkOU3zBhesBRt10Y9kMWHkPFGAlHHI+Hhw=; b=phTLfEaikngqQX
	+OQ+KOWHx+dzAJhMFeIRd4O7dVI90oT+KTTp31lzl5vKszQve+9A0Vdz4KHlnYSIqEBZkiEQK3/rB
	opb6Kv+Vi0PzRR0TjO6pkuVOKViv45jgCd0NUEbfxaRc3iMINOebTz6eNAthpS/5gR+FN2ARETssS
	xXAJGNSoYbsLqz3Txg+jA2JGASqnRVj/GsOR4nXvBe3xT4CkF/Qcl83+DOQPyuTQTrvK0xLczb2mb
	cSsJ3+eBcVvYb6shGo++jBiIVFvKupmnSnT84rTGrHArRVIZj+jXl8BBL/SDdu2uS7NyW7mVjiUb+
	meXfWLEXUkc0NSSJndqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuukg-000000080Jd-15BW;
	Sat, 06 Sep 2025 15:22:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuuhr-000000080CA-1XX5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 15:19:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 720EE601DD
	for <linux-arm-kernel@lists.infradead.org>; Sat,  6 Sep 2025 15:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EED8C4CEF8
	for <linux-arm-kernel@lists.infradead.org>; Sat,  6 Sep 2025 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757171998;
	bh=3iOPrN74xVEBO/vjQdWGykSlHCyKwX8oXZwsfk42NFQ=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=gkjD6QR7YJzsrUwSIaXUj90MJ3QfIW6WOmF4eIkOrWl2CMY8fuurur0OkhQdg3Xq4
	 NHZre41UYop/d7lmQ8LonzvT/5iKf5fkE9+cERJKBja0qmIkB9wapmg/obtZVIznxr
	 qYyUxzcaKmIQYGHC/ZZfsbfHgWZ9xDhV5o6VZ2XNJ45JhxsBofwuL7hedTJs3MsZPA
	 HfTcUuyBuL4e0tYt3ylMhCe2pbYg7pv42JRRjYbekEY1pNBGAn5YR56xUq2lONN80c
	 59eMwWlnfFsVXDMP8bwdtCW4Z5BhlzCDGRDwzaEID5NhQxnMHsHPXgfhvMjHrF59HA
	 DpvC8FPzdWWzw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f6bdcc195so3494647e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 06 Sep 2025 08:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBdsne0i9bWq5zYGbFz5f/rnGf6udDEVYVt50M4autYSyDNWhK8X8lWRCJCkG/EgezDA5e/kqFHeJFAj6EbS+i@lists.infradead.org
X-Gm-Message-State: AOJu0YwsMds9yyIwlvZcC8N0f6EPqoUIdgr2lrPMPv8GZs7wZ+op/lYp
	DF2Uh6GVaEfMLRa6Ok6Xl+1hFFjeQspYjIi+rX+lmx/CkP8jdQ2eEcThYivNeaASFe6emqf0F23
	0zulQDKn/q75viwB6IwvB4lSi5ie5Wp4=
X-Google-Smtp-Source: AGHT+IHpDYVkVnfYFDnax1QMKGYderiLaGjKlKTAyHREe9npSmqRYhhRbtxlMlcuC4mrm2GRTCrRggKSNMNWOBmjBaQ=
X-Received: by 2002:a05:651c:20cc:20b0:32b:a9a4:cd58 with SMTP id
 38308e7fff4ca-33baef74c92mr4112521fa.15.1757171996500; Sat, 06 Sep 2025
 08:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250906041333.642483-1-wens@kernel.org> <20250906041333.642483-11-wens@kernel.org>
 <DU0P190MB244586AE96B47F85AFE7A702BC02A@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
In-Reply-To: <DU0P190MB244586AE96B47F85AFE7A702BC02A@DU0P190MB2445.EURP190.PROD.OUTLOOK.COM>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 6 Sep 2025 23:19:43 +0800
X-Gmail-Original-Message-ID: <CAGb2v64w0Hr+hrDoNjSOx=m8hZ37-jM=jDseygmxiRQmtNszEg@mail.gmail.com>
X-Gm-Features: Ac12FXz53VnrcQofrnLM0LEbOU6QTn8gTf2cydyfh9lYODHUFGAWC0ZWxvt-xSQ
Message-ID: <CAGb2v64w0Hr+hrDoNjSOx=m8hZ37-jM=jDseygmxiRQmtNszEg@mail.gmail.com>
Subject: Re: arm64: allwinner: a523: Enable MCU PRCM and NPU
To: Muhammed Subair <msubair@hotmail.com>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Dropping network and DT folks and mailing lists. Please report issues on
the relevant thread.

On Sat, Sep 6, 2025 at 3:30=E2=80=AFPM Muhammed Subair <msubair@hotmail.com=
> wrote:
>
> Hello
>
> I have a board with A527 chip , and NPU is detected in  legacy while the =
new patches shows below message
>
> upstream 6.17-rc4
> # dmesg | grep [   21.988215] etnaviv-gpu 7122000.npu: probe with driver =
etnaviv-gpu failed with error -110
>  7122000
> [   21.988173] etnaviv-gpu 7122000.npu: deferred probe timeout, ignoring =
dependency
> [   21.988215] etnaviv-gpu 7122000.npu: probe with driver etnaviv-gpu fai=
led with error -110

This shows that the driver is waiting for some resource to appear and timed
out. Do you have all needed device drivers enabled? I think you need to hav=
e
the power domain drivers and the MCU clk driver enabled.

ChenYu


> legacy 5.15
>
> [   13.887892] npu[106][106] vipcore, platform device compatible=3Dallwin=
ner,npu
> [   13.890322] npu[106][106] vipcore, platform driver device=3D0xffffff80=
c1a11c10
> [   13.890394] npu[106][106] vipcore irq number is 116.
> [   13.890471] vipcore 7122000.npu: supply npu not found, using dummy reg=
ulator
> [   13.892589] npu[106][106] NPU Use VF3, use freq 696
> [   13.892754] npu[106][106] Get NPU Regulator Control FAIL!
> [   13.892766] npu[106][106] Want set npu vol(1000000) now vol(-22)
> [   13.938664] npu[106][106] core_0, request irqline=3D116, name=3Dvipcor=
e_0
> [   13.938889] npu[106][106] vipcore, allocate page for video memory, siz=
e: 0x2000000bytes
> [   13.938900] npu[106][106] vipcore, video memory heap size is more than=
 4Mbyte,only can allocate 4M byte from page
> [   13.938948] npu[106][106] vipcore, cpu_physical=3D0x10cc00000, vip_phy=
sical=3D0x10cc00000, vip_memsize=3D0x400000
> [   13.940230] npu[106][106] VIPLite driver version 1.13.0.0-AW-2023-01-0=
9
> [   25.090905] sunxi:sunxi_pd_test-0.pd-npu-test:[WARN]: runtime_suspend =
disable clock
>
> -----Original Message-----
> From: Chen-Yu Tsai <wens@kernel.org>
> Sent: Saturday, 6 September 2025 8:14 AM
> To: Andrew Lunn <andrew+netdev@lunn.ch>; David S. Miller <davem@davemloft=
.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>=
; Paolo Abeni <pabeni@redhat.com>; Rob Herring <robh@kernel.org>; Krzysztof=
 Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Chen-Y=
u Tsai <wens@csie.org>; Jernej Skrabec <jernej@kernel.org>; Samuel Holland =
<samuel@sholland.org>
> Cc: netdev@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-kernel@=
lists.infradead.org; linux-sunxi@lists.linux.dev; linux-kernel@vger.kernel.=
org; Andre Przywara <andre.przywara@arm.com>; Jernej Skrabec <jernej.skrabe=
c@gmail.com>
> Subject: [PATCH net-next v3 10/10] arm64: dts: allwinner: t527: orangepi-=
4a: Enable Ethernet port
>
> From: Chen-Yu Tsai <wens@csie.org>
>
> On the Orangepi 4A board, the second Ethernet controller, aka the GMAC200=
, is connected to an external Motorcomm YT8531 PHY. The PHY uses an externa=
l 25MHz crystal, has the SoC's PI15 pin connected to its reset pin, and the=
 PI16 pin for its interrupt pin.
>
> Enable it.
>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>
> Changes since v1:
> - Switch to generic (tx|rx)-internal-delay-ps properties
> ---
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/=
arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> index 38cd8c7e92da..7afd6e57fe86 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -15,6 +15,7 @@ / {
>         compatible =3D "xunlong,orangepi-4a", "allwinner,sun55i-t527";
>
>         aliases {
> +               ethernet0 =3D &gmac1;
>                 serial0 =3D &uart0;
>         };
>
> @@ -95,11 +96,33 @@ &ehci1 {
>         status =3D "okay";
>  };
>
> +&gmac1 {
> +       phy-mode =3D "rgmii-id";
> +       phy-handle =3D <&ext_rgmii_phy>;
> +       phy-supply =3D <&reg_cldo4>;
> +
> +       tx-internal-delay-ps =3D <0>;
> +       rx-internal-delay-ps =3D <300>;
> +
> +       status =3D "okay";
> +};
> +
>  &gpu {
>         mali-supply =3D <&reg_dcdc2>;
>         status =3D "okay";
>  };
>
> +&mdio1 {
> +       ext_rgmii_phy: ethernet-phy@1 {
> +               compatible =3D "ethernet-phy-ieee802.3-c22";
> +               reg =3D <1>;
> +               interrupts-extended =3D <&pio 8 16 IRQ_TYPE_LEVEL_LOW>; /=
* PI16 */
> +               reset-gpios =3D <&pio 8 15 GPIO_ACTIVE_LOW>; /* PI15 */
> +               reset-assert-us =3D <10000>;
> +               reset-deassert-us =3D <150000>;
> +       };
> +};
> +
>  &mmc0 {
>         vmmc-supply =3D <&reg_cldo3>;
>         cd-gpios =3D <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 =
*/
> --
> 2.39.5
>
>

