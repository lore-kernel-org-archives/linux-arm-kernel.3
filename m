Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A18C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 02:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=; b=zl1wsFYBUTymxNeGTc2O+YigTL
	Q7tZgvXHN1mE3F04Cwbzi9M9CCXbXuJW/nlRzYT9gqV1KY1nLqmWm42ejq4pbrdIjQi77yc4LYLb7
	v3gkg5o2Lbc21GnhrlmLnIZ8lW+OIWpJrz+SxH9CFHF+cP4n07p+xyhOAL0sRiqFI9HOmMth+Z3xh
	z+TmqRu5cFuboptNYN3UBJqp0NbI/WbnHg2S8ykBi7lmOHLWHhgHpY8U8FXMOEnep4a/uy5/Z7arV
	a9l9CyggpXFSiR6ZdoLjftVYjbVYsfqVnL09wRIyVbgQgW7w8N+f2C5IRiyAUI5GyOzjwdXo4pWI8
	t+FS1jLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK6kl-0000000C0Y1-3RCo;
	Wed, 28 May 2025 02:42:51 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK6ie-0000000C0RG-1Vn6;
	Wed, 28 May 2025 02:40:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3114416a5e1so2182824a91.3;
        Tue, 27 May 2025 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748400039; x=1749004839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=Eo/kyk+obxMVswOcIkKnfrgRcyZSWItFyJN+FZjvYDigv4lpo6lQ52g8p9j1zOV0Sf
         Llq0Jv+QQitXGWQR/aI3BTUdbA2N/WgukP3oesk2ZC9idpxtHzCzDZqO0aLKHBYWh1l4
         p35YrhGc0QKpgQ6/oD7h1vdsqKRM8Dby8DTqCTz2vH8jlRCo4Jb5q0fcKg5K3vp0yxil
         QaRq8YdmPgUL5x4P1WIsHikLcV3zhga+s7uvtGiR2yYiy9iLg4JWaz6PzsIVN4r5jX3s
         k8/mg12hQICo6Fc20juRDjhP/TBKFze1D3WOFQZlI0calepVHievhR7bzd9nqgbg3Lvq
         ZB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748400039; x=1749004839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QVCrwFga7VCzG3Y0sAuFXlGZgCRKGevrmncrDPwjQQ=;
        b=hA4EXqTufNF2PguUPldzOd09xZeu5DB7xCqDdGXauwoWRaeFGMVwGo4gHj6V/XPtFY
         4SMOKzdDh5zq//d4xzNrUjf78Pk5uwkRSZB89gzWJuSwk2Et5Bpvtl9IMOcQFNFGynwV
         oVL5vaCVdD59hoHMza/ZoC2cruyRoQbKX5V3yZUAWyBv57BONynVEWUx7I9fhLnGUCpD
         sCq0bIMRVlN2BcfoeN15ySe4FsbLXcKbdVASduviGwSixDi2veRDPoef4dt4G6dHqP9j
         +o9cXaAJJnRQaasW5RZH5rWkNwrgMBTsXWnAkSiA75Stq5wwpGsK1AnuXCj/+ONaZN8f
         04JA==
X-Forwarded-Encrypted: i=1; AJvYcCUlsYnluW7Vvm2xN6OVLKcJOtRDbDWGa+GsWqpWW7m0kH5HZeWFQ8pqqdxGOyZgBWOnyk8RqACRtZQV4RTfjCE=@lists.infradead.org, AJvYcCWPqjgdQFcgmpY38Ukg/R6pPQ0mXb0S56M5qEoyo67228f9fHphE5DbKpsvLuH4Oar9R8AmwUjLyc+/MMbWuJX8@lists.infradead.org
X-Gm-Message-State: AOJu0YzDn3ribhCHpQ+wtElhLuf8lzMhJXWFcBHzRlCiz/7BkWl0e6hD
	aNWeelSl6eXMU0gzuduIpi9LMQJ7NzPz6RA/oKBCs/zqST3Cmd4LOTWpADpmuFcNg5LkPiLvFjh
	kA0zqNlK1OywslWkaeVkgSihx+4heDJU=
X-Gm-Gg: ASbGnct/CFy3QMeebLzjCq2DtwD/0TqeUq0QefjRA7AY3i2/WqZmQ/lEnNZqL0fbtWf
	Sjma+61EjXu34VhfZtDemOJ2ijwzWRTjExmgJHRWnBFfHEUdazReRVbhH1zUon/YMqyUrbQsJBO
	I4ntCBPFJ6VKg/R8WuFqS1h5w+P+g+bT11
X-Google-Smtp-Source: AGHT+IHRMZo43pEeAtLI78ACPEQsq81r4IdJpe7xwrqhoPqeVeSetdh3kIm1Bu4kbG/AqnuQglUbFQNYsL16HqS/f2o=
X-Received: by 2002:a17:90b:350f:b0:311:b3e7:fb3c with SMTP id
 98e67ed59e1d1-311e7470ad2mr865718a91.31.1748400038884; Tue, 27 May 2025
 19:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Tue, 27 May 2025 21:40:27 -0500
X-Gm-Features: AX0GCFtDk6wBi6zhuoVYcuypl9PXHMAr0D_EC9JmX8PK8nOKUAJQE21kF0uG_U0
Message-ID: <CAHCN7x+KiZKwN6hHji38xqid8A-wLVSFgqrbx0jkj+KyjvuKhg@mail.gmail.com>
Subject: Re: [RFC PATCH 05/11] arm64: dts: imx8mp: drop gpcv2 vpu
 power-domains and clocks
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: nicolas.dufresne@collabora.com, benjamin.gaignard@collabora.com, 
	p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, paulk@sys-base.io, 
	hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, 
	sebastian.fricke@collabora.com, ming.qian@nxp.com, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_194040_408019_D35B6846 
X-CRM114-Status: GOOD (  17.11  )
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

On Fri, May 2, 2025 at 10:10=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> The GPCv2 G1, G2 and VC8000E power-domain don't need to reference the
> VPUMIX power-domain nor their module clocks since the power and reset
> handling is done by the VPUMIX blkctrl driver.
>
Using fluster, I wanted to test this.  I didn't test fluster before this:

./fluster.py run -d GStreamer-VP8-V4L2SL-Gst1.0
Ran 57/61 tests successfully               in 7.059 secs

./fluster.py run -dGStreamer-H.264-V4L2SL-Gst1.0
Ran 129/135 tests successfully               in 45.741 secs

Both of these outperformed the tests I ran a while ago on the imx8mm
running at 600MHz.  I haven't updated my clocks to run at overdrive
rates yet, but if you want, I could help with that.  Either way, I
think you could push submit patch as a stand-alone or with some clock
updates even before the adding the encoder stuff.

Tested-by: Adam Ford <aford173@gmail.com> #imx8mp-beacon-kit

> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index e0d3b8cba221..cf9b6c487bd5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -879,24 +879,17 @@ pgc_mediamix: power-domain@10 {
>
>                                         pgc_vpu_g1: power-domain@11 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G1>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G1_ROOT>;
>                                         };
>
>                                         pgc_vpu_g2: power-domain@12 {
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_G2>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_G2_ROOT>;
> -
>                                         };
>
>                                         pgc_vpu_vc8000e: power-domain@13 =
{
>                                                 #power-domain-cells =3D <=
0>;
> -                                               power-domains =3D <&pgc_v=
pumix>;
>                                                 reg =3D <IMX8MP_POWER_DOM=
AIN_VPU_VC8000E>;
> -                                               clocks =3D <&clk IMX8MP_C=
LK_VPU_VC8KE_ROOT>;
>                                         };
>
>                                         pgc_hdmimix: power-domain@14 {
> --
> 2.39.5
>
>

