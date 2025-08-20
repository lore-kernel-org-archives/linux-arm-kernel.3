Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55348CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZXpBBC5mh4rAG7klRDHZsl/hV9+g23+YKORmh4iEYCY=; b=LTSfy0AdCz5UFpRJ4+9zT/8Cwv
	iP4zUEsVhifj0owRn2Nv5JGWPqyatDJdoRcgBpYZTJedl2bVKK9D9T1sayenIf39EWS2Ky3mBYo/I
	7Act+4fmJxV1pH7iUZLnFlCe3Kw7JSIQoe5OjMAkEgaHg0vs/6Xq1IUdf27M/Q8VfjgYxk9GF9FTl
	eCL6mEThgT2IQnyAWCAgbIsnsUkB7AltuFtbXUHLGmT0VDAZo+vIcj5JYg4u7m16c/adjHTFR4b+h
	hupoa7L0ev8xAFVhQsfIp1Kui0RKGVYeGl//ZACPmvaSyiftH+LkJhJ5HpV49ym0a8AOsUt3ka4ZK
	NVi2DqFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotJh-0000000FJsY-3wPm;
	Thu, 21 Aug 2025 00:38:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uooWm-0000000ElKg-3RHd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 37D445C5E74
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 19:31:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73F4C113CF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 19:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755718279;
	bh=JdMnN/QvHNdC14uZpSWSeOLbLF7avgHXV6bfeFE314E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RGhHMttEkXppx0xIcllcHsXLmLQQzOdjxYuV/xm82W+tSpLj5siXsGatCtlz88msg
	 2kBwqKy5UBeiVfHuLZmptxFi73Zpxv/U9awFSIry45ieagzEsDibzMG1wAP3gxnkhW
	 raADuSVol+35H9SGVkQgHnkq5ZvoxRqgzaJ5nqp8/IExM7a4xIdtlcK3QcBxNxqBtm
	 KK/V1xpMYSVAS7R01YfN+CYcrvBHMjdmhrWPW+JZTdHhCYbshF/pY90CjAsTW4ka3t
	 Rd/tFqZozHdiLnaXYd+is6lZXoeiYPHaynU5+quh2DQJRYYBKUUeAlmyR3mDi8VG5s
	 b2OoQldEU+zEA==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61868d83059so2296971a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 12:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyxrJmWgLp55yhz1ONM7b47qMVfsn3djOwyMH2XGSjHV7sFA4r4nHpX3vaYV5rIuMiIEqikygcDRDk/zQdydp1@lists.infradead.org
X-Gm-Message-State: AOJu0YznCzBau5RZntf0/JFSyito6GslaYrNty5dKLP+kaTzkf79Pl5y
	cNYHHHCWyxAKzcUnTtUODkmOUdwCbuHFLcou+ubDr/uJBHxqF8w5O2W849XoaBN4Wt8gLSux0rO
	QX+l+JxSz6jW0ruDjj1KjiafMh3rVRw==
X-Google-Smtp-Source: AGHT+IHMduLqupXwUu5+wGeCnTMcG3KEnZjSMqXY8A1R3KzTvJxS2yEXoVkoMeeJWEbKS/NfptZmMJOd2EyU0/q6v2E=
X-Received: by 2002:a17:907:6e8b:b0:afc:aac3:6d2 with SMTP id
 a640c23a62f3a-afe02b475a2mr72725966b.2.1755718278469; Wed, 20 Aug 2025
 12:31:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250819213831.1368296-1-robh@kernel.org> <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
In-Reply-To: <CAEnQRZDga2cX=YPY5Z9NDyro94bxFjK9k5Xm5Vt2vVzf4ysKyA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 20 Aug 2025 14:31:07 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
X-Gm-Features: Ac12FXyzu14Kh1oSkN3MJaRVyez-SIK2NK1snFRbS1U4LOUdSfMmoXWd92DoGYw
Message-ID: <CAL_JsqJ1btLjZO_Z7H+qYZhWwTn0Wpq4Ji=deKdUxTwLHw-pTA@mail.gmail.com>
Subject: Re: [PATCH v5] remoteproc: Use of_reserved_mem_region_* functions for "memory-region"
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Aisheng Dong <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_123120_938397_E855578A 
X-CRM114-Status: GOOD (  19.96  )
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

On Wed, Aug 20, 2025 at 3:19=E2=80=AFAM Daniel Baluta <daniel.baluta@gmail.=
com> wrote:
>
> Hi Rob,
>
> This patch will break IMX RPROC support.
> <snip>
>
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
>
> <snip>
> >  static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmwa=
re *fw)
> <snip>
>
> > -               priv->mem[b].cpu_addr =3D devm_ioremap_wc(&pdev->dev, r=
es.start, resource_size(&res));
> > +               priv->mem[b].cpu_addr =3D devm_ioremap_resource_wc(&pde=
v->dev, &res);
>
> devm_ioremap_resource_wc works only for IORESOURCE_MEM resources:
>
> lib/devres.c:124
> static void __iomem *
> __devm_ioremap_resource(struct device *dev, const struct resource *res,
>
> =C2=BB       if (!res || resource_type(res) !=3D IORESOURCE_MEM) {
> =C2=BB       =C2=BB       ret =3D dev_err_probe(dev, -EINVAL, "invalid re=
source
> %pR\n", res);
> =C2=BB       =C2=BB       return IOMEM_ERR_PTR(ret);
> =C2=BB       }
>
> while the devm_ioremap_wc doesn't care about this.
>
> So we cannot use devm_ioremap_resource_wc here unless you add
> IORESOURCE_MEM flags
> to  of_reserved_mem_region_to_resource as discussed here:
>
> https://lkml.org/lkml/2025/4/28/759
>
> The same issue we are already experiencing with Sound Open Firmware
> where the change was already merged
> and we have a bug already reported.
>
> How should we fix this:
>
> 1) Add  res->flags =3D IORESOURCE_MEM; in  of_reserved_mem_region_to_reso=
urce

Sigh. I thought I rolled that change into it. I just sent a fix[1].

Rob

[1] https://lore.kernel.org/all/20250820192805.565568-1-robh@kernel.org/

