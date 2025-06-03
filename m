Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0569C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=; b=B6l8FVfaROTRSrLzG2+8KViWtf
	QMbe9LuUbnM0DlepBrJceq+1vriSh1LYzLCNuu059IEMuFoR9ckQRYNxNEMIKdmEzQPsKIsxuwEBJ
	HAiJiXEhJlweTFMs9DpAHqNl+/micAajOdmTJ0w0g6h7WNNyRQ4FWZ/yNTxDbXL9yh96IOOmeMXmD
	8CF4/QgLG0ZCT+g9vIcfvnDvP3nY1LfAMAk4x21lkpzJH32/CR/uQIVMuN0g/eLJMr8ZHilYZknba
	TMtS4QlVGycqcduEYeFuSeCrMp39J+pcyap5jfBURNq5yzB/OUjM4jjB7jBwxdEXoenmDccCFDIyz
	KBCcGX6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMbRe-0000000C2TC-3X5J;
	Tue, 03 Jun 2025 23:53:26 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMbPU-0000000C2O8-2kWt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 23:51:13 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b2c4476d381so382248a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 16:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748994671; x=1749599471; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=KqN9NJbuGPTh3HuaK1UNCQbJlF6sQ+IweBDuSV3S4z3twCt9LSnxgbDnMO2KxSDC0L
         BQm+sLqL7ISnMZCgy3xRD8kwqGPfDmeY3P8xnp+BJ3J/ZsnTCqEk4AgvTFr9d9HeQ1QO
         +Uo2HHcZrZLb32f/JdycVED09FMMwkQVIBK1H9WA4eszhGJ/JHApGxQE99kdC3ebF5bs
         IJFPr2k8ovgQfUiYmRkWmQDEJWtDNVPECGJUqkWD6BNEj54+C5lTljka3ocmvg2liwqW
         2rI5FS2P9aKZRtaXuqyCqAPldtAQeqE0Axc3txiXXAee6a1B9VGnn9nJrmbPIyZXhXP6
         6SRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748994671; x=1749599471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9L47Pw4FJq00Mo4o1EG2exd2hnFJSmIOUsOxTsjqiA=;
        b=ZnPLXuZf67ZBiE4BWriVwL/eu9hCU2xXIbviuKxR1yXJo2d9caUjlCVe+yka+c8v4g
         G6MOUaOHbBwuUjY3vTzz6uX3otVcxtP4BX4KQUTSOHLO6h8MIHTU5QuBV4s97S5NvNno
         k1IBsy4WccUzwuRRtCl5zKpv6OCwlvkwB7wFVCbQsDbd6Q8hC+RIxaElmCE7XGuN0V/3
         KMZyZy2D/4yBaPY6JOqkTWKNyGZbWN/fIo8AHSL3ccx26H6ksNuokslmTg66vIxB/+zk
         hUTaZkyZ3BPbO1CRUAI+dHEmLxiZoira9ypG3PPKq0IQpinBTjQZDL7/YLm5/baSENFq
         s9fA==
X-Gm-Message-State: AOJu0YwRJyfNzCZ1htfymXaxkRGM7eRWCzgxoBTKbge/JClyQrRalk+Q
	1jQHiuhjQ5NS1Gup/vsDcLldir3sL+DTFm5v+D9FQB+XeEZhM4RRrcbpV0xFwIxYLvIzRzzSXQk
	7t4HY6fIoyxrEBKDPVBUp8vWYfg9qOnE=
X-Gm-Gg: ASbGncvLoOQ5fHS2NMTEMLtqCYJDkUKF3C1NQfuE1vRn0aWgNbEvl6HR6mc8bvB0QJt
	ShIi+PK++RSxETiXaE28bO6eXm/mi8cCByk0WMRtnvzmpLTn6M6G8m0pQM/eXWYnXyECrXSqY5C
	JHtvu/qHtxiW804FAE2WqkroAkVEt4CuHV
X-Google-Smtp-Source: AGHT+IFNst2H7GFHVcub0yd3Kmx7L7dZwZEJToym/csaIT88WJqNMHe3BnbzVXN+qxD/TPW9kbEM0Emgl9txshV4zbM=
X-Received: by 2002:a17:90b:1c0b:b0:311:abba:53b6 with SMTP id
 98e67ed59e1d1-3130dce1bcemr1068222a91.14.1748994671162; Tue, 03 Jun 2025
 16:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250530221713.54804-1-aford173@gmail.com> <20250530221713.54804-5-aford173@gmail.com>
 <20250601183620.npuicmipv6kv54z6@pengutronix.de> <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
In-Reply-To: <CAHCN7xKjEt3rq4VUOSSTqcT4SyWxSCPLHGf6jR6KVHvor5wfKQ@mail.gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 3 Jun 2025 18:51:00 -0500
X-Gm-Features: AX0GCFtCdZakQVBK8i9Mwd6h5JPSbdyOFZQ8LmRy0bByuZIyxG3rUNoDH5Gee58
Message-ID: <CAHCN7xLr-7YQ9P8022g3SNPVgfQcEU8rSzZ-grMMom8kLm6e0Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: imx8mp: Configure VPU clocks for overdrive
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_165112_702495_0DD42A2F 
X-CRM114-Status: GOOD (  30.76  )
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

On Mon, Jun 2, 2025 at 10:35=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Sun, Jun 1, 2025 at 1:36=E2=80=AFPM Marco Felsch <m.felsch@pengutronix=
.de> wrote:
> >
> > Hi Adam,
> >
> > thanks for the patch.
> >
> > On 25-05-30, Adam Ford wrote:
> > > The defaults for this SoC are configured for overdrive mode, but
> > > the VPU clocks are currently configured for nominal mode.
> > > Increase VPU_G1_CLK_ROOT to 800MHZ from 600MHz,
> > > Increase VPU_G2_CLK_ROOT to 700MHZ from 500MHz, and
> > > Increase VPU_BUS_CLK_ROOT to 800MHz from 600MHz.
> > >
> > > This requires adjusting the clock parents. Since there is already
> > > 800MHz clock references, move the VPU_BUS and G1 clocks to it.
> > > This frees up the VPU_PLL to be configured at 700MHz to run
> > > the G2 clock at 700MHz.
> > >
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/b=
oot/dts/freescale/imx8mp.dtsi
> > > index 909555a5da4b..848b25c9b752 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> > > @@ -2256,8 +2256,8 @@ vpu_g1: video-codec@38300000 {
> > >                       interrupts =3D <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G1_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G1>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
1_800M>;
> > > +                     assigned-clock-rates =3D <800000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G1>;
> > >               };
> > >
> > > @@ -2267,8 +2267,8 @@ vpu_g2: video-codec@38310000 {
> > >                       interrupts =3D <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> > >                       clocks =3D <&clk IMX8MP_CLK_VPU_G2_ROOT>;
> > >                       assigned-clocks =3D <&clk IMX8MP_CLK_VPU_G2>;
> > > -                     assigned-clock-parents =3D <&clk IMX8MP_SYS_PLL=
2_1000M>;
> > > -                     assigned-clock-rates =3D <500000000>;
> > > +                     assigned-clock-parents =3D <&clk IMX8MP_VPU_PLL=
_OUT>;
> > > +                     assigned-clock-rates =3D <700000000>;
> > >                       power-domains =3D <&vpumix_blk_ctrl IMX8MP_VPUB=
LK_PD_G2>;
> > >               };
> > >
> > > @@ -2284,8 +2284,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
> > >                                <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
> > >                       clock-names =3D "g1", "g2", "vc8000e";
> > >                       assigned-clocks =3D <&clk IMX8MP_VPU_PLL>, <&cl=
k IMX8MP_CLK_VPU_BUS>;
> > > -                     assigned-clock-parents =3D <0>, <&clk IMX8MP_VP=
U_PLL_OUT>;
> > > -                     assigned-clock-rates =3D <600000000>, <60000000=
0>;
> > > +                     assigned-clock-parents =3D <0>, <&clk IMX8MP_SY=
S_PLL1_800M>;
> > > +                     assigned-clock-rates =3D <700000000>, <80000000=
0>;
> >
> > I think we can drop the "assigned-clocks =3D <&clk IMX8MP_VPU_PLL>" par=
t
> > completely.
> >
> > Before your patch the IMX8MP_VPU_PLL_OUT was used as clock-parent for
> > the IMX8MP_CLK_VPU_BUS. With yout patch IMX8MP_SYS_PLL1_800M is used.
>
> I think you're right.  I'll fix that up and do a V2.  I forgot to add
> my own s-o-b tag, so I'll fix that too.  I'll try to do it this week.

Marco,

I tried removing the assigned-clock references to the IMX8MP_VPU_PLL,
but i found the defaul speed was 800MHz for the PLL even when asking
G2 to be 700MHz.  The only way that I found to set the G2 to 700MHz
was to set the VPU_PLL to 700MHz.  I can do that either inside the G2
node or the vpumix_blk_ctrl node. I generally like to have the
blk_ctrl do it since it controls the G1_ROOT and G2_ROOT clocks, but
it doesn't seem to hurt it being inside the G2 node either.  I can see
the argument for having it insde the G2 node, since the G2 clock is
what's requiring the VPU_PLL to be 700MHz.

Let me know your preferences, and I'll move forward accordingly.

adam
>
> adam
> >
> > Regards,
> >   Marco

