Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B94ACAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=; b=3+DqZf8N155qIZ1+Lgi/wAR3uy
	lBkPlwuYJYPxMparJt6N2qQNsfnEeU2zojRJSCEVRm4j3Xza6HR/zkys8EyDS0+e1KkkyWG+xRkeV
	Ut5dMKgNgkXoLRPn2G+WNL2wddPt8JWTDNBG15s0JtaxWEYb299efC8TbfQVCd1RKASO72fJFrrca
	4bp/nEDDmWRxlrFVjUua9+CgzZxAks8MLGzCfd97Fu/d8Ab2eJxpm/nKvffUCSGwZolUZtUXXP9sp
	5jmn0/ZJ/UKoMI/OBxlrRkBj9PplnHvC3Ficd0i3IiKPObwOVgwCNCWsbyyRNkUd8vTgTwDlMdJoh
	liYzQsPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDme-0000000HPGH-0RrJ;
	Thu, 18 Sep 2025 12:30:44 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDmc-0000000HPFw-0UcE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:30:43 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-77ddfe29cccso133703b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198641; x=1758803441; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=L0jvqy5yFXyqXC64vQ/ZHHp9vHg1UUUSPePXNBMX6QtuSXDhhHqFnAGwxSA0A0OE3p
         M87TmL9BM/YudjUnTDbVJf1D4Vl3aKz/IdxR6XKA1eGhElQ9PO9JiLpC/x3M0N3+Ygwt
         b5hOZ8BTWTPjsAoKVEG8GPHhT4d6qG4DwtF1+p9b/yLoaEQUWHu7REYpmT4gGk0cA29i
         sZhbha7t1jQqYbm0uCJ5brabYBp/FK/2OIAOutx7wbODk1K+U230u0Ag0w98jVTVy6MI
         n5Y4Ivh1SVUMmfA/4vi+vBwA/EN3SS+Xk1Gqi409Qq22+g35VAKfiw/QBvZOgZBJzVGS
         7pgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198641; x=1758803441;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ja6LsTNawGy4pmDnATZPCfzTVrsSk5wN9q0e+DceoU8=;
        b=bur3mCxbiMcNF80ptDek9NPRYEzWF7ghyAYOefNKNl8d0QzCyHEiJW6+FQYELrZcsu
         elQKneinDZow1gfXRIGlpmUT1eaJpIoMBmc7n3zO2s2GEcmZBdS6CMXcwhWgQF04SMir
         ka31mDBuvi6wv2bMSkNhtdQAQpFXyYz34V3PUUVAdz2sZ4jEjwr5Krk1KQWUGKAYpA8m
         jgxVaKVine3fzJOHy7yV0ff8RDEnK1gk716ySgDiJOfa7ubCpGRS0bykyfpHXRJziPqY
         uCsgpNn/JQ8n9WvD8vAn95h1dA9g/7u1tLRO6QFHJUnELmcboFdnaneb8XB9I54yv3Iz
         EjzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNFekEoPDsSWjj8m+LRN+h1Mqk5PrRiUeK9196yY0s8adXs7crQ5b8aJ4BNjOMrD6JFV+IpWxLGkGSWA5ZmDBG@lists.infradead.org
X-Gm-Message-State: AOJu0YxvQ7aK4p9YWjC64hezMCBgsuKAW3nnnBMprrwiXZ1D/VSa6Jik
	t5RcEFiz6ME5cuHKBkDbFQWgHvzTsD3KfYpiCNn1alax45+clYyPktdcqvLa1DXyG8XBVFcJtXK
	i0QdXZLpHDktj3y51yTzZ+7HitsGb6eU=
X-Gm-Gg: ASbGnct4qPyRzyR2PkPeqKRfxGrE7ACMKLvleuBLmxP8vJ23AAVYG3a6F/FhqH9vUJx
	0y0W3q/uKeRfC0iF+GzDCmqA4+mDX6TeP2QQ6EQiSc9uG+PVXwKlX/8FO6dxmwDhIxvp/KHINRk
	ap7J6UVUnQUl2KCebd6lhqHufTJDix/f1pndh+jhORzHZVpyVGojqvfAdqoR9VTMt+0m6CktBvt
	u9maDCAniqCLCP0RpPGR3T5TvNn9UYjFqv3D3Y2MSoEZuaGVwu5fLgFp39FJnE+bA==
X-Google-Smtp-Source: AGHT+IHfxVH6u3MLt6Uuih0vzSbpLygF4jPPQ9s8yqLw/oxh8/QW2NTZ+3Q+TitB6KAglFx0XO0/v8MormCOdtkYPDY=
X-Received: by 2002:a17:902:d4c1:b0:266:702a:616b with SMTP id
 d9443c01a7336-2681228a5cbmr84479475ad.18.1758198641200; Thu, 18 Sep 2025
 05:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-1-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:32:58 +0300
X-Gm-Features: AS18NWDb4GfzMHKRtymYoCSSIMdUKa-LQpWcaz1XI-CRyqhVc2xtdOdWO6gJCWo
Message-ID: <CAEnQRZB2ZkcRirj1SZkfbsPHyyGr5PfnCDfv+ZuMu_Mj6XKBEQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] remoteproc: imx_rproc: Simplify clock enable logic
 using dcfg flags
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_053042_154673_937D358D 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, Sep 18, 2025 at 2:51=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> Simplify the clock enable logic by removing the dedicated
> imx_rproc_clk_enable() function and integrate the clock handling directly
> into the probe function to simplify the code.
>
> Add a new IMX_RPROC_NEED_CLKS flag in dcfg to indicate whether clock
> management is required for a given SoC. Update probe logic to conditional=
ly
> enable clocks based on the new flag.
>

<snip>

> -               return dev_err_probe(dev, ret, "failed to enable clks\n")=
;
> +       /* Remote core is under control of Linux or clock is not managed =
by firmware */

I see that you negate the comment from imx_rproc_clk_enable but with
the negation
OR becomes AND.

So, the comment should be:

/* Handle clocks when remote core is under control of Linux AND the
clocks are not managed by remote side  FW */

Also, do we really need this flag?
Shouldn't we just make a decision based on the fact that clk is in the
device tree or not?

> +       if (dcfg->flags & IMX_RPROC_NEED_CLKS) {
> +               priv->clk =3D devm_clk_get_enabled(dev, NULL);
> +               if (IS_ERR(priv->clk))
> +                       return dev_err_probe(dev, PTR_ERR(priv->clk), "Fa=
iled to enable clock\n");

