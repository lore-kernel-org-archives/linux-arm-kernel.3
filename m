Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91613C3ABB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 17:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=; b=YC4kjZHlTQm/UFVJpwkkzo1ntF
	LxOIhoh42H01wIqYOMYTfLXkMI5f1S7U8dG7CjqSMApi54NIss+Yjrsf27yfZyejZRIlBsE+JRB/w
	H5prU/SJbSD2jv5C+XXjsXqHN7e32+NDnx6zgC8a4Sm0ZgRITHYwAnMYmjkDcdBEU0VI0Jq0Mf7GQ
	0Wmlbl2pY13g0cqaymhO8wyssPiYH+L7bSxIzafBxjUNS/X88GTkigAlE0jGChkcLlTZevSJTW9W+
	x3MWUpoYp4h3cS6Zzkn2zaLcgt7IiRDdYoKQEDivByTqCFDu/bn2ylU7+eMJqyqGLPWHNSJ96HqDu
	5AEffTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAu6J-00000002dpP-191x;
	Fri, 02 May 2025 17:23:03 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAtHe-00000002WBt-2exb;
	Fri, 02 May 2025 16:30:43 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so3066433a91.3;
        Fri, 02 May 2025 09:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746203441; x=1746808241; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=ThVsHw1LKsSfrd5tPt0MHoB+OD5yLHu+UNBV8KIbjNPm/6Lh9f4jSt03ZamVcpxW08
         Wc7JBaIHJtI0smgnwoz+wyrVrQPLS7cHcoWsGIRRsJMQVf+5x7WLQADYCwWNxu/Hf7fe
         aaY7IQmvJS3gJmJPxxE3ILDBHaQ8YPPcx/Ab0qpTEvDvsVmUgv0GO5PVtTIPRoX00lH/
         JD7Z60CcGGNHbCtAEYBPWKLhTMRJNrrblBzUSdN1D5NF/IA9fkjzFFLDmCrwKGVdkqLc
         dWJ9oD1WHq3AxpVOo/2oE0A56JFwFcjoxe0nYu4+OaaCxsuXTjZJRXjNsDAV+2xAQSQJ
         ZHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746203441; x=1746808241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tLgGDAzhbzi8zBfreiBGkw9+hq2PN6Kh7ZFPU4njLno=;
        b=JwezBfekyg1xNHc+4z1Y9IceDpzSXk+yftP6jCO6eCjPFUuRxHV0CEiJ6xGFyn8ziD
         1t0FkwQXMMJZJ9T/w9F9l/g5N7lKJJLhq99X20f2cHredtytyn3d/KrCVZEcAbIjwBbv
         d17ZSu76ewKnbN++/r3SumBKN2BvZPCd9zvkiF1E4NH3imSnTZlLgWfAV2UQ1fjEXcuP
         pEzyq4IjiugAQvkgecDKUxH2ZLUjTV09aU29GKELuJWQxP8kZmUSsw5cBFGNx2s+z4u5
         hCoZXdLzbRmGAEZdRPf86vDqcywmznqGOWN3TQrlVDpTJS4Ei0MNielx7u2sKlsOGzw5
         tT8g==
X-Forwarded-Encrypted: i=1; AJvYcCUFXj1CYfw52PTbk1he1Wpd2QWrvYuvAQ1Jfuu1YkosxhHHiocgkCBTuMjbsPbVRBFROwbcYF83EKLwpbfZgydn@lists.infradead.org, AJvYcCWE06+IzJR/Jz1y9+Y90tZpfazOt82Bvmca9OAuA6SkCo8s8Y8Atf6Suyah2XxdGw+zWtplpG6Rbf3mUW0y0vU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2wAjEiFl9O6jH+6C/avP84g7OTXRdaM0Qz/Q4f6AfsXH30HJZ
	mdss8FMlxHvxwzSUfvjTWgGXDqDsejGmiOv3wsXVVCAiwzqANfVX++GW2DKQuFNxgu2wLmc3HYN
	hXWY2Exwp4yM9nG5zm/3rMj2tiGQ=
X-Gm-Gg: ASbGnctDfRP/OLD1IIiyvrmRB4gZMl8e7OC6pVO4Lm6LnI1WBR1iX4zU2YALXPOXpqZ
	L/koWmQFh8NG/H1eZEhBx+JwQ2vAplssDV1vn0Oe3XTqDZZ4CoueKbYlRnkI77fE4xZMmDHI0uz
	LclTU21jofMZi0RBXCff4Qrw==
X-Google-Smtp-Source: AGHT+IFD83mVdOJy5lpNuPlZVPmLooAoJbMjhC2ix2c3XVL7B+J+mwkKq3CJH7cJU97BTv0F3P0V/yqYXOccmyxktrA=
X-Received: by 2002:a17:90b:582e:b0:2ff:6608:78cd with SMTP id
 98e67ed59e1d1-30a4e5a5e10mr6554332a91.9.1746203440962; Fri, 02 May 2025
 09:30:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250502150513.4169098-1-m.felsch@pengutronix.de> <20250502150513.4169098-6-m.felsch@pengutronix.de>
In-Reply-To: <20250502150513.4169098-6-m.felsch@pengutronix.de>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 2 May 2025 11:30:29 -0500
X-Gm-Features: ATxdqUGSLq9P6-CspNr6ECgbQeHdf383py-pp3cQ3WrpLLPzF-nJ74mtxVZrvag
Message-ID: <CAHCN7xJ5p+dwJD7i7caqwhmrz8+gZDVeqfdWA_=He-H+aTJgRg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250502_093042_668629_6AAC8265 
X-CRM114-Status: GOOD (  15.27  )
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
It was my understanding that having this dependency ensures the order
of the bring-up, but maybe I am wrong.  Do you know if the 8MP
suspend-resume works properly?


Should this get a fixes tag?

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

