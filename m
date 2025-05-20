Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D0C5479B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=; b=HBfHuYnlUzCDxsUFA2YZFcjc5R
	B/je868SkqCNXVTDQvkoId3cM2weU9m+R+xlwlCjnUZHgI8KktxRyko6snR7gjT5GXo9JgslwipK2
	AE48KVulqr3aaZPsqJeP6EhcPBYX+1ovk+039MkXf+rCi3vKHOteM8eRdK9FbpkMd4YuYkpCIWGvP
	RxOoKUlWaDM0S3rHVmzpRvyUThA4OoXHeJQzNEMSYucsn1xY8VsOm+yv9gAtr3hdhtrPFy4sUp0RN
	r+MRWBko01OR/pEBnz0WoLxtH/wedBcjzNoJUcpi98EVk3YzBiXejSesT4PIVJa3qK1lZqtsIdXrU
	mptSLknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHN9K-0000000D2K7-134e;
	Tue, 20 May 2025 13:36:54 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHN7D-0000000D1v7-0ieZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 13:34:44 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-551efcb745eso3240996e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 06:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747748081; x=1748352881; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=UHYtZNBpmqn9eQ0m0cnWRrsSajl/A7xJctdA3lkWEgpj2c/vhtQFuxi+bZuDmzPXTV
         8IAd2NlSvyGL3L7nBmWjb5A7dscX/rTGJdNigDnE2pM4MGA7Wp8S+DYASXuSlFprwhr3
         /+2BuoZw5zYXA4pXQg/IMqPuCOZl5gQZLl9Zrd0lkOTai/ZKKcC7N0o8nOvp5eLQ4jgb
         URj5ONdCY2nvOOYtlumnd0y25e36ZwYDLzTDgGqgreH8G6WhC8Yshz4qobZq7dLXviL9
         zj6qBI22A3+bS2wrOIjC7amybhBZtjSr+a0yzUvXsdSQ6skwhDNtJMBZVS/vIp0IuyOL
         PIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748081; x=1748352881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfD1s22Ic364TvVTHCagUpXijjIYK42cBGG9M8zpn10=;
        b=ozujyptTjQfQmYLDOdFq2n96HuYEGGG/W3MWr07olrEtlo5x4V1vnIveXtKNG05EHC
         U3+ZcJ5VccG2Q0+leTR3EDcaZP9XzfWo3VFvhN0MxpmNWdNuH3ScDW13cq4Rf4pzKiDk
         gNE0LCZVdtA78llFx0D7dKPfTCWaky+hZg/IGOKBmMJkAcD2CZafE9Gzqm3AtlGyvH6h
         uPIQEwQggib7MtGl2HUC9CxXNTDgSsFXX/ZSBI3hEnP7E+Zf1OB7StsYZbxqM/gwB4/k
         WZ7fzzwePYt7YKABQBxjhwK6TZksEfGgZXnbpbGXxB5p0TPjtw9pQLgvqxMd36j6UI7V
         hNgg==
X-Forwarded-Encrypted: i=1; AJvYcCWONrheKs87WxyYogOYV/InScXhGMkhy/iEPLjl6bX3C8+AmlSiMCASjLwAN5bxvhH7hVrfOYrnnCIyYNBMGZ2W@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ3AftiRX8hMKFI9rXl0meULX8WoYMByfLhzDzM2+IEVmFos5f
	65s0z+hmvsH+QW1fGoB3SZyrKAbzT+mzuEFSKHBucmRPdMcKZys6hNmoAbVtV7fdV/UXF2YM5hs
	8JRKJK5XOb3x744r/Nz4Kko7WE3AkZhA=
X-Gm-Gg: ASbGncsSvX9j3mdM6FdLAzpqLHElXnpjHQIQHgyv6nNI12Wqtba8ZvJ2jC+yk3uxoJc
	WNjSzN66pA1R16tZ3mMV5tjgDL4yS50w473UlbhBDCIS5rp0Fa/8b9bO0b0zfUnHpo/31Xt8Dvf
	16B1b2IJM1Dp1bIDgL5QWZ8EqTJEfj9uXBYBm4dZuG77Putz0Ued5NHmKBIJQAz7U=
X-Google-Smtp-Source: AGHT+IGOdVh5BabNP6weiWFLJXZ3ZVMdQGC/USr/zeCgTmal+W0BVS9hJ31uxCQihRwgnGjI33KrTTR4UAo6HbnMaFc=
X-Received: by 2002:a05:6512:4602:b0:549:490e:240d with SMTP id
 2adb3069b0e04-550e71d7d90mr5140507e87.28.1747748080897; Tue, 20 May 2025
 06:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250520115143.409413-1-c.stoidner@phytec.de>
In-Reply-To: <20250520115143.409413-1-c.stoidner@phytec.de>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 20 May 2025 10:34:29 -0300
X-Gm-Features: AX0GCFu-SKgKDmlyHEywfDCC8Hm0Dm6pbXAwBI2nvYfhldnFsrevIPgWdHRuit4
Message-ID: <CAOMZO5D8giOiBCeV5AP1pL+hCFQt9bs3gFsr2mCgMSSbcbCovw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: freescale: imx93-phycore-som: Delay the
 phy reset by a gpio
To: Christoph Stoidner <c.stoidner@phytec.de>
Cc: Primoz Fiser <primoz.fiser@norik.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_063443_209770_92D1989E 
X-CRM114-Status: GOOD (  11.00  )
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

On Tue, May 20, 2025 at 8:52=E2=80=AFAM Christoph Stoidner <c.stoidner@phyt=
ec.de> wrote:

> diff --git a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> index 88c2657b50e6..c08f4b8a65a6 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-phycore-som.dtsi
> @@ -58,6 +58,9 @@ &fec {
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
>                                  <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
>         assigned-clock-rates =3D <100000000>, <50000000>, <50000000>;
> +       phy-reset-gpios =3D <&gpio4 23 GPIO_ACTIVE_HIGH>;
> +       phy-reset-duration =3D <1>;
> +       phy-reset-post-delay =3D <0>;

These properties are marked as deprecated in fsl,fec.yaml.

It would be better to place the properties described by
ethernet-phy.yaml under the ethernet-phy@1 node.

