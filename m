Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8003C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 17:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JdHhJehaOGGRyz1yZkMniHUZHHY/gtuGeETDNFE6Evk=; b=SLtd05+cGc0JgMq/XuyKwr2Hsk
	UQikjLupKbLwZpjgfKDG4nviQ7CExcagkBKNxjv5eKKurDrYzjlbAh7vG2mtQD2xcj8IcipVxUoMm
	ug3MkvoS0dVTk75ytSePRZ2aV69479k6PbgZu6XsF/jd8bgbfaaZ4Z7ZtBPjKl5Z18RaAkvjJlDGf
	OgbLwGhuX9P4PP1K2ADfESG/D4bxq0RIF049W/niIQmICiqB9ejNooS1f0EcVcjkAi54CgpUAqvCw
	Fm01tkxQSavpVsengAu9Ab6LK8sxaD4IxfVNuPqrejJYU69PeHogbWxeS+lEPr8zZx4kMAtbq95cw
	s96PZ0NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uedUC-00000005dv1-2ODr;
	Wed, 23 Jul 2025 17:42:36 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ued9b-00000005aLC-3VPt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 17:21:21 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-31393526d0dso72813a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753291279; x=1753896079; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdHhJehaOGGRyz1yZkMniHUZHHY/gtuGeETDNFE6Evk=;
        b=KSqRFvfCsE/NOkRgEP07FhWgNlByo716t319KG5VkYowdRWfVKrd3SCQmobkURmj4F
         AEMDOfOetPC/ABqATY+Tk6HyUVU1T6rSil8fLmesfeO4BZ60RB6UwK6qz5eKOKB3bvXR
         Q4E3krLBHqc+jCqoPHXN4IIuQlrsOamSIrCi4MXDas2gfYB2qn+IZcbqvmiUzvtDQ5b1
         aySxwozP77EqLz2ohRejlQMS0ZmpQYZVZ8i9+aSBLPEGk9+Sn7bm3AXuG9UnFtKYwIpv
         CIx0YKKmt/8vg3aLgZHlP/QRouBVslGI8ovLqNE7Pov403TVa8NPlGwc3HS4Nawh0H6d
         ZOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753291279; x=1753896079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdHhJehaOGGRyz1yZkMniHUZHHY/gtuGeETDNFE6Evk=;
        b=g4PTT53ehYQ6CV16vnM+CAX03wjAmMahjyt1I0dUBcyue0MOK+irOauAAbkSCc14E6
         jJWdhSlgeIUb48n+Tw7RcYvv02Uj6IwKuMv79piN3PGxxI3zSYk4MqwotKfPo4UrJof9
         Pweg2A1crfk88SCnj3T/dQ5tRg31KIqgyyx5o6oS+W4RuA6ZqK5WGsQG4tcxvVYLy/E4
         M0Uf3CaPtQZ+2dgtaLE3hFruSZm9Ys24mklpvNw5AUJot+ZqEVDvZoKV6MGrk+kxUPCO
         M9HMKWDeaJ2N6fDqdljokiIEXutkqd/uBVTZtMgh6WtxyEqADFrWUXddpYUTI6Zh1RvL
         8+Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWPCMpdjZ2VyKVZVfcdUFCkfNy/BoCqq+bUGtAZzNX+Aft6LCGJ51xbCWNOKNKs7175+sRJYmpm2zj07SgALUJv@lists.infradead.org
X-Gm-Message-State: AOJu0YwqtaAFOA6Ug/H1hVRo20/b5ELZJlu/yksM3ypIp+f+Av9kS2rp
	CC9qH3MnnsTe/obog8cgCL/449c3j+cg23qOv14D7ssdgd0TJL/OLTwhDROG2kZMOxIovfpVSNb
	icdCnMBY5MVfFjzclEKe5FBiTseneZ3o=
X-Gm-Gg: ASbGnct3jE484oBnsUstZp2LhVJrbmmp8PC+uSnaDkcQ4LhQE36dyHp729NrDBY1qAg
	UcQNyxfhO10UKZP7Id2QIPXHE+YkwwwAEjoGHIHo4AQm2SM6lmKG1uhPrgsnqcZfZRWIKbW/KDw
	iKZXYiLYNHx36p31GjU2mp+zC2gIvgo7G5EY7u1pdwhmBgUfIlotrAM5FSHRfDOKFn60m/qAxhi
	ivNMKEdar9M048Zsg==
X-Google-Smtp-Source: AGHT+IGhqjYs4ux4jfZuva5tLAnfpmMqHOkhr1wVS9VTWIb8RSO5zHmqE5yUvKlSgMgvOyzAgKijetY+zLxjWE6uaW0=
X-Received: by 2002:a17:90b:4e83:b0:31c:15d9:8aa with SMTP id
 98e67ed59e1d1-31e507fe866mr5141730a91.34.1753291278497; Wed, 23 Jul 2025
 10:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220706234757.3162307-1-peng.fan@oss.nxp.com>
In-Reply-To: <20220706234757.3162307-1-peng.fan@oss.nxp.com>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 23 Jul 2025 12:21:07 -0500
X-Gm-Features: Ac12FXyiprxe_LGZo-24j2NghrBhcu3HCth78UZ6f-ppwtBUf5rP10c3ImRmsyI
Message-ID: <CAHCN7xJts7ki+wHGxwMw8eEa4hXkyOwZComzEf_JXiZUBhpkaw@mail.gmail.com>
Subject: Re: [PATCH V4] arm64: dts: imx8mp: add NoC node
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: djakov@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	festevam@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	abel.vesa@nxp.com, abailon@baylibre.com, l.stach@pengutronix.de, 
	laurent.pinchart@ideasonboard.com, marex@denx.de, paul.elder@ideasonboard.com, 
	Markus.Niebel@ew.tq-group.com, kernel@pengutronix.de, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-imx@nxp.com, abelvesa@kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_102119_874633_6E1AC1DA 
X-CRM114-Status: GOOD (  21.79  )
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

On Wed, Jul 6, 2022 at 6:46=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Add i.MX8MP NoC node to make the interconnect i.MX8MP driver could work.
> Currently dynamic frequency scaling of the i.MX8MP NoC has not been
> supported, only NoC initial settings are configured by interconnect
> driver.

Peng,

I noticed the Mini and Nano are both supported by the same NoC driver,
but only the 8MP has a DT node.  Looking through the TRM on the Mini,
I don't see the operating points listed.  Would they be the same 200M
and 1000M on the Mini and Nano?

adam
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>
> V4:
>  Georgi has merged the V3 driver and bindings patches. So only resend
>  this patch. Per Georgi's comments:
>   - Drop syscon from compatbile
>   - Drop the header inclusion
>
>  Seems I not see this patch in patchwork or mailist, maybe sent failed.
>  So gave a resend of V4.
>
>  V3:
>   https://lore.kernel.org/linux-arm-kernel/20220703091132.1412063-1-peng.=
fan@oss.nxp.com/
>
>  I not list the full change log, since this is only a minor patch
>
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mp.dtsi
> index eb2d516278eb..42ed8ee08548 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1019,6 +1019,27 @@ eqos: ethernet@30bf0000 {
>                         };
>                 };
>
> +               noc: interconnect@32700000 {
> +                       compatible =3D "fsl,imx8mp-noc", "fsl,imx8m-noc";
> +                       reg =3D <0x32700000 0x100000>;
> +                       clocks =3D <&clk IMX8MP_CLK_NOC>;
> +                       #interconnect-cells =3D <1>;
> +
> +                       operating-points-v2 =3D <&noc_opp_table>;
> +
> +                       noc_opp_table: opp-table {
> +                               compatible =3D "operating-points-v2";
> +
> +                               opp-200M {
> +                                       opp-hz =3D /bits/ 64 <200000000>;
> +                               };
> +
> +                               opp-1000M {
> +                                       opp-hz =3D /bits/ 64 <1000000000>=
;
> +                               };
> +                       };
> +               };
> +
>                 aips4: bus@32c00000 {
>                         compatible =3D "fsl,aips-bus", "simple-bus";
>                         reg =3D <0x32c00000 0x400000>;
> --
> 2.25.1
>

