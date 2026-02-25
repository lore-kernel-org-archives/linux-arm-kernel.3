Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838DDFD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qdm1ClNZDvJGC8A1m8NxsxgLeYXG7gi/ipO7JE+hgTU=; b=Tf/R/rbinLqe/34gY8Hm+MveIh
	toF6sq4KaoGizejaJ27u/zoEzazY3JrBFkq0evXHW79qtNqj1HRs5YhdvdYDcdr3VGM2e6419Ux1w
	PhZ/IlFvFRw3lhmdzjkJpRsv28cPxI9ztkuhF7cJHgpz/Y7y8lapPKClkql8F9o+Fqfht+oSrIED0
	LdkIOULj0p2CmSFkyr3Jd9AjJ77pgoQjBg5XIe5vvpj6YNFT++2jMNvcS1YUJDiCWx5a8gpCTdMx1
	WIJqajjpDc30a/1tO+90lai52x8ve35zpr962ggVPOyBB+cg4lK68m1jJP+VOyPEAQn5IqOPhpfP2
	Rhiuu2zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEyx-00000004659-1mY9;
	Wed, 25 Feb 2026 13:31:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEyv-0000000464o-1t4e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 13:31:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CADD04444A
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 13:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A42ECC2BC9E
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772026272;
	bh=/48T+4l4iZtBbRi6T7U/AVuXVc3uThox+MEEPlMuVxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=vAsi852I6GtlZqJrKc1nreG5WL38J0a7DblELx/msmF7z0yjmXkBD0nU76UWf3Qgf
	 zrnOHXblIBcojCqez017n6mWh0GDvsY6YIXmmRoUiEyJZN2fGZgwZbbxMLtTh+hGWQ
	 /fRHGh+jz+SPW9ueiVVFttQAhgdWEnfmz/Ta4ztr+R5WwU3fUaXLbXPrK7VLyByVE4
	 j8LcjBFT/1K/w0ETG7ZT/UUN9HKjkOiFo6W40i2x/IVElmsnRbNTM6xysiLbyMEE4H
	 IPRAMggYRz+iyXM4Fo7ggIHZiKglvqyE3hPaj7DzWeH+7FUmkB2UHEUt96K5OeRmri
	 6expzjnEqM3qA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b88593aa4dcso927802466b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 05:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyedL+BFWxJRttRVJDq2nOG0/eI8qHc+ak6Fp+QshgviO057wFkD5b4vz4d/vBBdHvfTVxj/zDJLxfak0UGfvM@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ6qZdpgDNw7wekz9011rXEYruxtNYJq5Xma3LEXyVHbTZGCFs
	lupNrtcNYngbZJIsg8Te7GYY5RLzlgOcm0hqQ3EEHO0WuvpcB4V8FhLxj5Ys/MQq0QLOdKWkHld
	8PRdpg8dcx6s8EyVfOCL1wP/7Lvnbaw==
X-Received: by 2002:a17:907:d0a:b0:b73:572d:3b07 with SMTP id
 a640c23a62f3a-b9081b3b176mr1168239266b.28.1772026271083; Wed, 25 Feb 2026
 05:31:11 -0800 (PST)
MIME-Version: 1.0
References: <20260219144200.2633404-1-robh@kernel.org> <aZ5VgoDF4QvWaCgE@shlinux89>
In-Reply-To: <aZ5VgoDF4QvWaCgE@shlinux89>
From: Rob Herring <robh@kernel.org>
Date: Wed, 25 Feb 2026 07:30:59 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJH_JHd2Z_eGCVC7ZC6f++i0B0sgO0S+H=6pEPkDaQb_w@mail.gmail.com>
X-Gm-Features: AaiRm5387ptX5lq7w4u8E_PCK0Uoy67m5yPpQa0GfE5zATrxIDOZ9S4knTtqULo
Message-ID: <CAL_JsqJH_JHd2Z_eGCVC7ZC6f++i0B0sgO0S+H=6pEPkDaQb_w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: freescale: imx93: Add Ethos-U65 NPU and SRAM nodes
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, Forrest Shi <xuelin.shi@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_053113_529667_276F515F 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, Feb 24, 2026 at 7:49=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
>
> Hi Rob,
>
> On Thu, Feb 19, 2026 at 08:41:59AM -0600, Rob Herring (Arm) wrote:
> >i.MX93 contains an Arm Ethos-U65 NPU. The NPU uses the internal SRAM for
> >temporary buffers. The SRAM is larger than 96KB, but that is all that is
> >available to non-secure world.
> >
> >Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> >---
> >NXP folks, any comments on NPU freq? IIRC, the clock controller supports
> >setting the freq to 1GHz. Is that supported?
>
> NPU supports three freqs:
> 500MHz for Low Drive mode
> 800MHz for Nominal Drive mode
> 1GHz for Over drive mode
>
> The NXP downstream choose nominal drive mode for peripherals,
> in NXP downstream, there is a driver to do nominal and over drive
> mode switch for the SoC at runtime(through sysfs interface by user), ther=
e
> is no dedicated arm core voltage supply, there is only one vdd soc supply=
.
>
> To avoid introduce complexity to various drivers, drivers use nomimal fre=
q,
> so OD->ND switch does not require drivers to update its own clock frequen=
cies.
>
> >---
> > arch/arm64/boot/dts/freescale/imx93.dtsi | 23 +++++++++++++++++++++++
> > 1 file changed, 23 insertions(+)
> >
> >diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/=
dts/freescale/imx93.dtsi
> >index 7b27012dfcb5..d826d4b5a06b 100644
> >--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
> >+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
> >@@ -43,6 +43,29 @@ map0 {
> >                       };
> >               };
> >       };
> >+
> >+      sram: sram@20480000 {
> >+              compatible =3D "mmio-sram";
> >+              reg =3D <0x0 0x20480000 0x0 0x18000>;
> >+              #address-cells =3D <1>;
> >+              #size-cells =3D <1>;
> >+              ranges =3D <0x0 0x0 0x20480000 0x18000>;
> >+      };
> >+
> >+      soc@0 {
> >+              npu@4a900000 {
> >+                      compatible =3D "fsl,imx93-npu", "arm,ethos-u65";
> >+                      reg =3D <0x4a900000 0x1000>;
> >+                      interrupts =3D <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> >+                      power-domains =3D <&mlmix>;
> >+                      clocks =3D <&clk IMX93_CLK_ML>, <&clk IMX93_CLK_M=
L_APB>;
> >+                      clock-names =3D "core", "apb";
> >+                      sram =3D <&sram>;
> >+                      assigned-clocks =3D <&clk IMX93_CLK_ML>, <&clk IM=
X93_CLK_ML_APB>;
> >+                      assigned-clock-parents =3D <&clk IMX93_CLK_SYS_PL=
L_PFD1>, <&clk IMX93_CLK_24M>;
> >+                      assigned-clock-rates =3D <800000000>, <24000000>;
>
> APB could run at 133.3MHz.

24MHz does seem a bit slow. Do you know what parent would that be?

Rob

