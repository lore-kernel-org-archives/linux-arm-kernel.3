Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF920C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZxQGSUfQfwUHj5oyRYvQeOgS2I9ObjtSjRqQOUlky4=; b=ruPHTxKxFmjo2usMjk4go13GqM
	3R1vc/LyyRXYYys9HH00JRxzlGA+y+wpM5+R6YMkKFGQ+Hlm7dNmvSCDisN9wIS4zJMcvOdJNrR/k
	cL5GRgSocRdS3/nCkC2MDTg04VeAENFL3fvX3PuImclQELcjMHlXSG/T6nAsey1wOa3P9Gb1itXTN
	UGAdXFWSmkmYWTbw+V4uyVXXC7oS8pwuYS9WHkcB5ShSCod2gtm8UkqE0xiwk1nXJx54s2hs3Se5V
	0tNqLZunUOWLy9hziTsaLbAjwj3aPcclNYNJ2HeBmhBRLOgsx3cvmc2y9BxI82przkLc2nSJMgRPe
	ey07rcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3FC-0000000DAyZ-3aN0;
	Thu, 23 Jan 2025 19:52:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3CG-0000000DAU3-4C4J
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9671A4117C
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CABF2C4CEE5
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 19:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737661739;
	bh=b4vDZnBnRJMAExr0E30kjS5qChTkUb0rbppiv1HRSJI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EqFILXrfuR2ZIidhuGa5elmndxPWGARZ4+4SUQ2LogGGqSbmkEFngJj3ERNUU5Axy
	 YYUlQPgrWtS8Bo+FycDGiEFlKSSOw1QJSLV1SkcYzR3JUh5wJOsWKDKhy+f9dHUYrm
	 7pLUtWpNp2N+2Y0sK8B4CyIWN9Oj9mVmr/pc6wO0nOggRziN+6xsno0t+ylDSmez+f
	 hHOhgGyHUHGaLZIo95ILsDiPy3DdHTK6ShflF5RwVdt51e0wRjNvkhkge2MoFni6GY
	 d+OtMIPxV+S9hN6vnPi6I9YS/z47Wg42UQk9TAYDVlKrPFiHJYy97CE2ilrI6E2Cfo
	 Fe1T5Gag59atw==
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb9101419cso812016b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 11:48:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUseSE7dWIh0eOuoDe0KyEr1BzALFeoSJzNG+JscB5vSVpIJGIlZc8suIda+nYlhXixEjMTzQVtSpB2SoJgVIMz@lists.infradead.org
X-Gm-Message-State: AOJu0YyoxoUF5xEehDzUPAcC+sP04hLBqqnupTz8JjOLbimxJM/vhTJO
	nLno6N7Nh7QE/XGlFx5MByC51fY4caZ8idwCzpVkWVlHUjrg/lLkN3U1hjWhvu5brQJcN2bMAGG
	rzhw/qfxk4TIVC8wCtssHNrV300c=
X-Google-Smtp-Source: AGHT+IEn7eMjaHs+zmgjFd4WWVQahCuGuBBNarJzdEYSnQbw32rD83EbOPgQ6J9LSZlnM3ccjdpcf7atXcTLmBuPCOI=
X-Received: by 2002:a05:6808:4c88:b0:3ea:f791:3caf with SMTP id
 5614622812f47-3f19fc2ac4fmr14986057b6e.17.1737661739096; Thu, 23 Jan 2025
 11:48:59 -0800 (PST)
MIME-Version: 1.0
References: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
In-Reply-To: <236b227e929e5adc04d1e9e7af6845a46c8e9432.1737525916.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 23 Jan 2025 20:48:48 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>
X-Gm-Features: AWEUYZkHJTFNwFesQmZCHaWO-zzZKYYgHYBBgsz-SFLTIOGI_LaSzdS3jIxf3XU
Message-ID: <CAJZ5v0gz2WLtwJca5oAgZ23C+UmX18k9fvCbzRAEV6zZL4jiiQ@mail.gmail.com>
Subject: Re: [PATCH V2] cpufreq: s3c64xx: Fix compilation warning
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, kernel test robot <lkp@intel.com>, stable@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114901_166786_CEB94C8A 
X-CRM114-Status: GOOD (  20.35  )
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

On Wed, Jan 22, 2025 at 7:06=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> The driver generates following warning when regulator support isn't
> enabled in the kernel. Fix it.
>
>    drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_ta=
rget':
> >> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' =
set but not used [-Wunused-but-set-variable]
>       55 |         unsigned int old_freq, new_freq;
>          |                      ^~~~~~~~
> >> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set =
but not used [-Wunused-but-set-variable]
>       54 |         struct s3c64xx_dvfs *dvfs;
>          |                              ^~~~
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@i=
ntel.com/
> Cc: <stable@vger.kernel.org> # v5.4+
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2: Move s3c64xx_dvfs_table too inside ifdef.

Applied as 6.14-rc material.

If you'd rather apply it yourself, please let me know and I'll drop it.

Thanks!

>  drivers/cpufreq/s3c64xx-cpufreq.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-=
cpufreq.c
> index c6bdfc308e99..9cef71528076 100644
> --- a/drivers/cpufreq/s3c64xx-cpufreq.c
> +++ b/drivers/cpufreq/s3c64xx-cpufreq.c
> @@ -24,6 +24,7 @@ struct s3c64xx_dvfs {
>         unsigned int vddarm_max;
>  };
>
> +#ifdef CONFIG_REGULATOR
>  static struct s3c64xx_dvfs s3c64xx_dvfs_table[] =3D {
>         [0] =3D { 1000000, 1150000 },
>         [1] =3D { 1050000, 1150000 },
> @@ -31,6 +32,7 @@ static struct s3c64xx_dvfs s3c64xx_dvfs_table[] =3D {
>         [3] =3D { 1200000, 1350000 },
>         [4] =3D { 1300000, 1350000 },
>  };
> +#endif
>
>  static struct cpufreq_frequency_table s3c64xx_freq_table[] =3D {
>         { 0, 0,  66000 },
> @@ -51,15 +53,16 @@ static struct cpufreq_frequency_table s3c64xx_freq_ta=
ble[] =3D {
>  static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
>                                       unsigned int index)
>  {
> -       struct s3c64xx_dvfs *dvfs;
> -       unsigned int old_freq, new_freq;
> +       unsigned int new_freq =3D s3c64xx_freq_table[index].frequency;
>         int ret;
>
> +#ifdef CONFIG_REGULATOR
> +       struct s3c64xx_dvfs *dvfs;
> +       unsigned int old_freq;
> +
>         old_freq =3D clk_get_rate(policy->clk) / 1000;
> -       new_freq =3D s3c64xx_freq_table[index].frequency;
>         dvfs =3D &s3c64xx_dvfs_table[s3c64xx_freq_table[index].driver_dat=
a];
>
> -#ifdef CONFIG_REGULATOR
>         if (vddarm && new_freq > old_freq) {
>                 ret =3D regulator_set_voltage(vddarm,
>                                             dvfs->vddarm_min,
> --
> 2.31.1.272.g89b43f80a514
>
>

