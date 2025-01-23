Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7400DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIZXj0NQXlFQEJN+NUiNBmBZ8xZyeEtXhJlqzjffnhQ=; b=g/aXysNLo7creTKkaat8WgMoWT
	03Jvw3hZID9e/uDL5u9qe+jvt2ECpQGo2SjyHDfAYdHvJFRnVi55ltEegE0UsE2ljw2ooaT4guyGo
	SDoIEnLO5lj6tX4SKQiUR3rlA5zEBTIVZ7/eYlN5eYcz+Ei2CQJUAsy0EBw19YDdJNY9AYY4A/Smg
	Lgu9jna7XZz7AzJuBcVpfUUHXogjPlMA8FKjkq0YtLJnuh9WqMF7d+CAG722b7XwZDZdrV0qISoOw
	7zToALymdf5NiHCitWDrb10vaeQgQdyKDHRgcwYWNUpR/KS+3jy3V/wIhgkwUXWlvcf7eZ+5Mi9bZ
	Gaq0/ccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb35y-0000000D9mA-0iGH;
	Thu, 23 Jan 2025 19:42:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb34f-0000000D9Zn-2ISk;
	Thu, 23 Jan 2025 19:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 988105C5B53;
	Thu, 23 Jan 2025 19:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EA82C4CEEA;
	Thu, 23 Jan 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737661268;
	bh=FzgMlZoMTVJxW0DtNfnaS6A9Ohe9wUCQbfRzCAOE11Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GE9Gsa7iiU444KpkYxrogoBdZowGSjkyO0k7laPoPcoq6g3XxCe0poALteq4R4Zph
	 tZ3ytakM0acv90IqA3t/Tq+HIhgvttRHrxIMc4+ftcYx59CQekJex95lkIBya9MuSj
	 e8hgK78Mvi+bBQYrsrlD41mZ7vaA3+PkczkIp5mOMTvpFuEkiNLQOfTC7I53w3Jpp9
	 jdf7sxICX3pGKHys55ON+N8sg3msEwZ1hAbYoGP7MqRskWyhGBaMTolzt8pF6nm7po
	 ccEaxXFbs1MchzhtSnnv0PMPk6yc1GTQLhaCumG8Mkicq84A+N5GxqwlpPfo2bFwbT
	 FHvlAO5Y9gebg==
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3eb790888c6so345991b6e.2;
        Thu, 23 Jan 2025 11:41:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU5wulwOCBhoWF/df0Ls9hO3W3T+TwhWaWCN5xE+6vLruEZ/FldTCQSkOHa4pFt7BOiY5m+9fBg0pnNc6rxyyWW@lists.infradead.org, AJvYcCWkKFSNLMIp5nF02L7KERweyb0oew5d5PQCOcQrknpPHpemrbgDsYB26rQNVzTIv5XGonnEecWXTYntAEH7/dM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwE9bPgt+g48VmhCWU+3Svn3YBlZuCZoK4vrYeA9OgT3EvIHqJg
	xictHatyFBnlgzmBq0sQyK8gMU6cPbpCt+7Y29yxi4ygXwnudtuwpTlf1mk/m+BIFVBE3Ucl2Qg
	Y7jlVaqtkeLIU1iTfPfW/a+pnqA4=
X-Google-Smtp-Source: AGHT+IFEZLpokzQrSZWtE1aUlhzheSpv16W1XbXdM7wOE5P8c+MPFR4VPEp6oVT06Ebj/5DfcgalM7sIG87OhMAknWU=
X-Received: by 2002:a05:6808:309c:b0:3ea:519e:cc71 with SMTP id
 5614622812f47-3f19fd7beb4mr15987065b6e.39.1737661267410; Thu, 23 Jan 2025
 11:41:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1737631669.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1737631669.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Jan 2025 20:40:56 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gQDxb0-a5HiEa0vyWCGz01esQBy1fJ4vNXDZJ=GW1W+Q@mail.gmail.com>
X-Gm-Features: AWEUYZmJBrMCqL-riW-i0DlJyFI1cRh2mxShaIBztS2B8ipvq-I9aavy-zqQjVc
Message-ID: <CAJZ5v0gQDxb0-a5HiEa0vyWCGz01esQBy1fJ4vNXDZJ=GW1W+Q@mail.gmail.com>
Subject: Re: [PATCH 00/33] cpufreq: manage common sysfs attributes from core
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Cristian Marussi <cristian.marussi@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Hector Martin <marcan@marcan.st>, Huacai Chen <chenhuacai@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kevin Hilman <khilman@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Markus Mayer <mmayer@broadcom.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Sven Peter <sven@svenpeter.dev>, 
	Thierry Reding <thierry.reding@gmail.com>, WANG Xuerui <kernel@xen0n.name>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, arm-scmi@vger.kernel.org, 
	asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114109_680416_37CB06BF 
X-CRM114-Status: GOOD (  14.21  )
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

On Thu, Jan 23, 2025 at 12:38=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> Hello,
>
> Most of the drivers add available and boost frequencies related attribute=
s. This
> patch series tries to avoid duplication and simplify driver's code by man=
aging
> these from core code.
>
> A quick search revealed that only the drivers that set the
> policy->freq_table field, enable these attributes. Which makes sense as
> well, since the show_available_freqs() helper works only if the
> freq_table is present.
>
> In order to simplify drivers, create the relevant sysfs files forcefully
> from cpufreq core.
>
> Pushed here:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/core=
-attr

Acked-by: Rafael J. Wysocki <rafael@kernel.org>

for the series.

Thanks!

> --
> Viresh
>
> Viresh Kumar (33):
>   cpufreq: Always create freq-table related sysfs file
>   cpufreq: dt: Stop setting cpufreq_driver->attr field
>   cpufreq: acpi: Stop setting common freq attributes
>   cpufreq: apple: Stop setting cpufreq_driver->attr field
>   cpufreq: bmips: Stop setting cpufreq_driver->attr field
>   cpufreq: brcmstb: Stop setting common freq attributes
>   cpufreq: davinci: Stop setting cpufreq_driver->attr field
>   cpufreq: e_powersaver: Stop setting cpufreq_driver->attr field
>   cpufreq: elanfreq: Stop setting cpufreq_driver->attr field
>   cpufreq: imx6q: Stop setting cpufreq_driver->attr field
>   cpufreq: kirkwood: Stop setting cpufreq_driver->attr field
>   cpufreq: longhaul: Stop setting cpufreq_driver->attr field
>   cpufreq: loongson: Stop setting cpufreq_driver->attr field
>   cpufreq: mediatek: Stop setting cpufreq_driver->attr field
>   cpufreq: omap: Stop setting cpufreq_driver->attr field
>   cpufreq: p4: Stop setting cpufreq_driver->attr field
>   cpufreq: pasemi: Stop setting cpufreq_driver->attr field
>   cpufreq: pmac: Stop setting cpufreq_driver->attr field
>   cpufreq: powernow: Stop setting cpufreq_driver->attr field
>   cpufreq: powernv: Stop setting common freq attributes
>   cpufreq: qcom: Stop setting cpufreq_driver->attr field
>   cpufreq: qoriq: Stop setting cpufreq_driver->attr field
>   cpufreq: sc520_freq: Stop setting cpufreq_driver->attr field
>   cpufreq: scmi: Stop setting cpufreq_driver->attr field
>   cpufreq: scpi: Stop setting cpufreq_driver->attr field
>   cpufreq: sh: Stop setting cpufreq_driver->attr field
>   cpufreq: spear: Stop setting cpufreq_driver->attr field
>   cpufreq: speedstep: Stop setting cpufreq_driver->attr field
>   cpufreq: tegra: Stop setting cpufreq_driver->attr field
>   cpufreq: vexpress: Stop setting cpufreq_driver->attr field
>   cpufreq: virtual: Stop setting cpufreq_driver->attr field
>   cpufreq: Remove cpufreq_generic_attrs
>   cpufreq: Stop checking for duplicate available/boost freq attributes
>
>  drivers/cpufreq/acpi-cpufreq.c         |  1 -
>  drivers/cpufreq/apple-soc-cpufreq.c    |  8 --------
>  drivers/cpufreq/bmips-cpufreq.c        |  1 -
>  drivers/cpufreq/brcmstb-avs-cpufreq.c  |  1 -
>  drivers/cpufreq/cpufreq-dt.c           |  8 --------
>  drivers/cpufreq/cpufreq.c              | 15 +++++++++++++++
>  drivers/cpufreq/davinci-cpufreq.c      |  1 -
>  drivers/cpufreq/e_powersaver.c         |  1 -
>  drivers/cpufreq/elanfreq.c             |  1 -
>  drivers/cpufreq/freq_table.c           |  8 --------
>  drivers/cpufreq/imx6q-cpufreq.c        |  1 -
>  drivers/cpufreq/kirkwood-cpufreq.c     |  1 -
>  drivers/cpufreq/longhaul.c             |  1 -
>  drivers/cpufreq/loongson2_cpufreq.c    |  1 -
>  drivers/cpufreq/loongson3_cpufreq.c    |  1 -
>  drivers/cpufreq/mediatek-cpufreq-hw.c  |  1 -
>  drivers/cpufreq/mediatek-cpufreq.c     |  1 -
>  drivers/cpufreq/omap-cpufreq.c         |  1 -
>  drivers/cpufreq/p4-clockmod.c          |  1 -
>  drivers/cpufreq/pasemi-cpufreq.c       |  1 -
>  drivers/cpufreq/pmac32-cpufreq.c       |  1 -
>  drivers/cpufreq/pmac64-cpufreq.c       |  1 -
>  drivers/cpufreq/powernow-k6.c          |  1 -
>  drivers/cpufreq/powernow-k7.c          |  1 -
>  drivers/cpufreq/powernow-k8.c          |  1 -
>  drivers/cpufreq/powernv-cpufreq.c      |  2 --
>  drivers/cpufreq/qcom-cpufreq-hw.c      |  7 -------
>  drivers/cpufreq/qoriq-cpufreq.c        |  1 -
>  drivers/cpufreq/sc520_freq.c           |  1 -
>  drivers/cpufreq/scmi-cpufreq.c         |  8 --------
>  drivers/cpufreq/scpi-cpufreq.c         |  1 -
>  drivers/cpufreq/sh-cpufreq.c           |  1 -
>  drivers/cpufreq/spear-cpufreq.c        |  1 -
>  drivers/cpufreq/speedstep-centrino.c   |  1 -
>  drivers/cpufreq/speedstep-ich.c        |  1 -
>  drivers/cpufreq/speedstep-smi.c        |  1 -
>  drivers/cpufreq/tegra186-cpufreq.c     |  1 -
>  drivers/cpufreq/tegra194-cpufreq.c     |  1 -
>  drivers/cpufreq/vexpress-spc-cpufreq.c |  1 -
>  drivers/cpufreq/virtual-cpufreq.c      |  1 -
>  include/linux/cpufreq.h                |  1 -
>  41 files changed, 15 insertions(+), 75 deletions(-)
>
> --
> 2.31.1.272.g89b43f80a514
>

