Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70815C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=; b=EMFcWgqr0XR2/2M1UWFlvnC6Re
	u+QAwEqZy8bgsMlZ35QeqUDAH6rTfL9fExw9lq5N+xY79dOIfbnsT7odU1QsbYNuJXLYSsOcyekza
	Fuc6jhc32MJIaa6TviV8AytjbyF39GP48TN1dRuj2yFtVh6I81sQQyD1XGIab76gm3FloSmq8v36V
	Q54zBBd/Y5ps78m1NqEOF/isem1D51vh1YyGqN1Z/DoRfR8zM9sVZToi6Q73EiA15g4is8CGhpMuY
	iiI+ONc3zCh+qs5poGNPa0CwTs9hyqk7BqZoXEDQkOEw+ro80ZCe7vVZ4Z7C5isiD6qe2Ikt1y6cO
	2poCXgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwt4-000000009u0-3iBT;
	Thu, 08 May 2025 08:45:50 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwg2-000000007sM-1qB4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:32:23 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-70a23f4fe8bso6827727b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1746693141; x=1747297941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=EUWi/3LyAChUvKnOZYlMcmLBTbH7cAgdwLgokaZKkAUybBcBnJkcl62SyLLmAeHN1e
         Lk03vNX9EUQ7gzTdRibSbzBTrQlv1tKAbrsPdq+ydzcfFhA+xGVsE106NkovHHXQvud/
         jscvPhZ1xPj5xGkYfZTo3CJ6Sj6Nakbe0m36Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693141; x=1747297941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quaZx11+VGNrggf88njtg5xLklc9eFfI7c4+X9LIJ5o=;
        b=B6eCAV1b6QoQrsbiYeP7nPetHVsYk2H/zN89IXXQ+v3rXZH0NToFPYuFyHHHBkaqqE
         Mcvx51gUpHrZq2rjfOsE5B9zbPgLNhF5i/BcLz06n0Zv39owQlgQDTzitJtywWzUHaxz
         6hUtgq35zcO4vLt+eoANz3iZkYRQ+jPj8zNmsk0NRdFQLGyFz47x8wq79IF7Nd1RUYaD
         XtRUuoLBkXFuprFInyDoCbZa890Zt68lTUnZECTPXI6/SijSkTftISe8DgkP+Dbs3H4N
         fq//1TW0OynRf+J9waS9OQOGQQBVo6JIwClXre3b5FhZzBhlAr23CEqJWlTft4s5bVRK
         +bSA==
X-Forwarded-Encrypted: i=1; AJvYcCWvI09vmaK+ZrDFZlwZSB5mhPXZdikojGOl3+FD0VX00ZOoUDXq4dA82mIfoTIPdkzDdMGcvH+B56NfLBfdOi/x@lists.infradead.org
X-Gm-Message-State: AOJu0YxtI4BH/qzNDNqLPbc1Acy8DemYb7WKIEj1zaTSPVSOP509OCcT
	aNirC6mbSoihEWHqJbF5sC2X5IeFwOWMxtnSVzjZiJwj0BWX4RkIwfjxRcz6qdgu8bQ03f5j1v2
	jzYVJyTEiI8QHFN9WyHud9cQCSMBBWX/SjCc6lA==
X-Gm-Gg: ASbGnctafQJn53lfIhPcvOC+XqoglIO/E9PMhAl2qots13a5Cjsa5ej9XVitESRi3Xj
	VTfHaFmHFtxUdB4sJUo9+RCCF9Bna6b80mj05kI6PRvnFZc9HGKzIDSzn0GK2ZVMBHrSfvATuZG
	PPIB8Pc8qgDEcBhWkDMKi7
X-Google-Smtp-Source: AGHT+IE4CmJhrdoXRe32HoBH4jbtzbQ2hoNMjPwxRG6sk3WrTeunXaOWumwPqctZu6MIIYqzIKZAUd1PKmmcUuwqfyo=
X-Received: by 2002:a05:690c:6085:b0:703:d7a6:6266 with SMTP id
 00721157ae682-70a1d9f9304mr89735297b3.10.1746693141277; Thu, 08 May 2025
 01:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com> <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
In-Reply-To: <174643143452.2950397.16722215892279685541.b4-ty@linaro.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 8 May 2025 10:32:10 +0200
X-Gm-Features: ATxdqUGGoyMhD-TPgWfLjSDF0XqnBspVuNvo1SR1O8IpFOj15QasDBjp5hm1sY0
Message-ID: <CABGWkvrkVLRocFsZs9JLni4KDZCDyYDZxMzwA9AzAwipmUyTzQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v12 00/19] Support spread spectrum clocking for
 i.MX8M PLLs
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-amarula@amarulasolutions.com, 
	Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Abel Vesa <abel.vesa@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013222_482133_3D303125 
X-CRM114-Status: GOOD (  18.33  )
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

Hello Shawn,

On Mon, May 5, 2025 at 9:52=E2=80=AFAM Abel Vesa <abel.vesa@linaro.org> wro=
te:
>
>
> On Thu, 24 Apr 2025 08:21:30 +0200, Dario Binacchi wrote:
> > This version keeps the version v9 patches that can be merged and
> > removes the patches that will need to be modified in case Peng's
> > PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
> > The idea is to speed up the merging of the patches in the series
> > that have already been reviewed and are not dependent on the
> > introduction of the assigned-clocks-sscs property, and postpone
> > the patches for spread spectrum to a future series once it becomes
> > clear what needs to be done.
> >
> > [...]
>
> Applied, thanks!
>
> [01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
>         commit: 20e5d201b5d8f830e702d7d183f6b1b246b78d8a
> [02/19] clk: imx8mm: rename video_pll1 to video_pll
>         commit: 26a33196b5b68cf199b6c4283a254aa92d2aaf4b
> [03/19] dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
>         commit: 2d50415e2457c6f6621c2faa3b01b11150fb9c67
> [04/19] clk: imx8mp: rename video_pll1 to video_pll
>         commit: 21bb969f608cefd8d847cf6eb50a193d9f1fbb87
> [05/19] dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
>         commit: 2ba124053687c933031a6dc5b2e16ceaca250934
> [10/19] clk: imx: add hw API imx_anatop_get_clk_hw
>         commit: 17e3c1a272d97e49b4f3fbfe1f1b889e120d2be8
> [11/19] clk: imx: add support for i.MX8MM anatop clock driver
>         commit: 3cbc38cf42ca42d2dc9a93c949e0381ff919df71
> [12/19] clk: imx: add support for i.MX8MN anatop clock driver
>         commit: 80badb1d7264e83b512475898e7459f464a009c9
> [13/19] clk: imx: add support for i.MX8MP anatop clock driver
>         commit: 4c82bbe8b5437c7f16b2891ce33210c0f1410597
> [14/19] clk: imx8mp: rename ccm_base to base
>         commit: 1a77907dbbecfbe5e6a1aec28afd49a1dc184b7a
> [16/19] dt-bindings: clock: imx8m-clock: add PLLs
>         commit: 6a55647af3334f1d935ece67de4a838a864b53fc
>

Please check the remaining patches, as they are required for correctly
building the
ones merged by Abel. The kernel test robot has already reported build error=
s.

Thanks and regards,
Dario

> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

