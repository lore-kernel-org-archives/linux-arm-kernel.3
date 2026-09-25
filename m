Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892D1C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Epk7UhZ5gcKRlHUrHbKgkjCtg/Lgn+z/n5ZSjQcdqpg=; b=GP4t6b3EPl8g9ZzRu93kIfHLZs
	pfLtvw+2ilroSlsLuWMgXTISx4JyY++PLh4l/kXI3GrGXgM5674/57D0DiK+lje9BLS3ZovrnhfFh
	p/C6egWNK8MP26x39Ov6hidl+qk9dxUk4tmhOaw4lu5Bl7wMjujgdxyagi4TiQxhog1dEiJa8BNMD
	fDk7K0of4R0a+j1pnlbkzkVpvL6K+JTkLOzHm/O99qWuxC25qafQINYsOGbtRULWBI3CbRkSFTYuv
	ltrkDlQGU3eI4BdcBz67js2WO8zKdd05vTVIk6g9oO9MvPO1YkECC0NPjYGsyZq3W2qwGJt9Hv8ZC
	0pTAge4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9l8-0000000E4Nj-2hXc;
	Fri, 25 Sep 2026 17:30:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9l7-0000000E4NT-3GD3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:30:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 333FD444F8
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 17:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58BE1F0092C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 17:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357452;
	bh=Epk7UhZ5gcKRlHUrHbKgkjCtg/Lgn+z/n5ZSjQcdqpg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y/XUqu531F/cGxWNwQZP2KG77Zo/WMA+a2WvMMRbN7BfMI9PrV3w2grWHN7FeDQ3P
	 V6H1WGyGtemPdDpa86l7/FirJmYdVcLZ0afDSQpWpcaagB9mIMo/4IimSgl+irC+Ba
	 7Uwoa8O/oiLOgSfajuan9d0VUnzxBFnHegatmVAc08ehBPOnl/k7CrIF5FSxYGlwcI
	 qbUaMkE0+tJgd54/hu7JN0b8vSKyHceLGyOzCKk/ZGOcik/F3I/rchZ8mJt16+4dqM
	 CRH8mXtTHa/HDfUQiyO8mONN560pa+TrMq2oukgjlnIkhq8Y4dwiri294Ymt7GhEjZ
	 1Q3lnD9Gbf4OQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff17443dso11439191fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:30:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxdx7qY7YxXNa5e1keFPVkdqDPVAKfqVzpXR+pV1Qf9aGYzJE7HGYm8/MtXgPAvciu0ukhrdXCw0Ryp9HOoNO4N@lists.infradead.org
X-Gm-Message-State: AFuF++nz3jlkqOk/bemAe+6jJgp+gp01nQium96ATgtKCFrxHOpAsQ30
	IolczCa0SIJF8wiWiJ/aiI/CgV0TXELB2IO4TQHyfBN9t83XFtf8TdwDe8JyUwthd44GwXhupcI
	0bNssKeFlZOlqve+2qnbq0eD3CakXaCA=
X-Received: by 2002:a05:651c:b1e:b0:3a5:f041:d7c9 with SMTP id
 38308e7fff4ca-3a63c2fbe45mr14867181fa.22.1790357451157; Fri, 25 Sep 2026
 10:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com> <20260912191156.185448-6-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-6-sumeet4linux@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 19:29:14 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j49-yEYmZXm8-2xWzy9OV7-8dUEwMonzPjbscgGd+6qg@mail.gmail.com>
X-Gm-Features: AclHuK-XXXjTpNVDNNDdptaZZX-F6i5Cfcawa8JfiTGZUJ-XQXiTSEwpAEK52uE
Message-ID: <CAJZ5v0j49-yEYmZXm8-2xWzy9OV7-8dUEwMonzPjbscgGd+6qg@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] powercap: intel_rapl: Use %pe to print error
 pointers symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sat, Sep 12, 2026 at 9:13=E2=80=AFPM Sumeet Pawnikar <sumeet4linux@gmail=
.com> wrote:
>
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_debug(). The %pe format specifier prints a symbolic error name
> (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it fall=
s
> back gracefully and prints the raw integer value. This makes messages mor=
e
> readable without any functional change.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/powercap/intel_rapl_msr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_r=
apl_msr.c
> index a34543e66446..46972ee1ff84 100644
> --- a/drivers/powercap/intel_rapl_msr.c
> +++ b/drivers/powercap/intel_rapl_msr.c
> @@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
>         rapl_msr_platdev =3D platform_device_register_data(NULL, "intel_r=
apl_msr", 0, def,
>                                                          sizeof(*def));
>         if (IS_ERR(rapl_msr_platdev))
> -               pr_debug("intel_rapl_msr device register failed, ret:%ld\=
n",
> -                        PTR_ERR(rapl_msr_platdev));
> +               pr_debug("intel_rapl_msr device register failed, ret:%pe\=
n",
> +                        rapl_msr_platdev);
>
>         return 0;
>  }
> --

Applied as 7.4 material, thanks!

