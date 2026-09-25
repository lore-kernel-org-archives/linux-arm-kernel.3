Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED3C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrCZY+w8ZAuOgUKyJ5bzQ3lA0kZX185uW8oYwG5RuQA=; b=bdBEcFLw80BOMpDSnZyy8Ijwei
	J3Xu/pG+qefBX4nxIzdXFEb0EfZ/IrDToB2tqAKSdgrYizNX1dlp0wGGfHtxlphViDey+PfviQssz
	YNwlBE7EFMScKrLtYQE5cQsrMaMyVxSF/tpZSl6Yd0/269UB+8gXR7LNJMYmKbVRhAZf3TRuWkhVS
	hFmOThOja1VFRJEUwU6+AhukGCevbjKl1X0kAaDJrg7+e/y732vXtumUGV7GT6DsnEpKPOCHAx8oA
	YNahvaFoYEl7HPr+2L5HOArmqce6ufBSUz6KTPITvauV7k46k3EB86C0hVyXkQpe0tgWw59utnSeO
	m077BJjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9hS-0000000E3w4-40dF;
	Fri, 25 Sep 2026 17:27:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9hR-0000000E3vh-1zIA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 17:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA4DD44001
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABDAA1F008A7
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357224;
	bh=nrCZY+w8ZAuOgUKyJ5bzQ3lA0kZX185uW8oYwG5RuQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfFKqsvK75p5eO5B5LPWqx7YmtHZp5SiX1PFOsrb/Rw7u/0QFbVRoYO3MBcG/t5cL
	 f0grYRNmRlCV/gnwPAuW3LI+ccOXT0MjTt7Y8FeHXxJ869jP4sIIJdGs5M2A3YPkRs
	 ukh/P2eflHnEpauu+zEccKoAmEXT4qeEDi7o0bJS06Qz1CCYGEgXO5YqMpVQhl3no4
	 lLRGB99pVq05PP0MRgcsH4//8wpFOz+qWgGYKGx2Z78V8f5l9jdhS4QzuPEDb8kFis
	 pnJBNA0VYqlKgjIBYJuffADzzi0g5B+u1BB7AUPs4ANGSHG8KVd1IE7vW4tmTi93D2
	 bENY6AcgbMT3A==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so9376111fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 10:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByZGmT1yFrCHd2oFzmCEpBtDAx/z0xYjvagCsaYRhl+Smf8zby0fmQN6gzB3mkehe1daBnsXwTU+IYve6LXDHN1@lists.infradead.org
X-Gm-Message-State: AFuF++murS7/TeAQxAO5HOrQLXa4LwMWh+9wioHUsjQkqK6BSdMr2Upy
	I2nhM+NK5tOhzfWawt0SnCCaL/LXyxFKs0uheUO90IDMaBfHXOeMgd0YQ5DFmSo2fTaQZGNjj1Y
	qddxEMjQrDwyHpnLNxDfGbEQ37l4XvtU=
X-Received: by 2002:a05:651c:43dc:10b0:3a6:95a:52ab with SMTP id
 38308e7fff4ca-3a63c0e006emr12420831fa.18.1790357222990; Fri, 25 Sep 2026
 10:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com> <20260912191156.185448-5-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-5-sumeet4linux@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 19:25:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
X-Gm-Features: AclHuK-zkJzcW3eTrPbI8n4uwvaOkU97xV6DSlSAXWBceH5EJVI8blUeGSzDawM
Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
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
> to pr_err() and dev_err(). The %pe format specifier prints a symbolic err=
or
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messag=
es
> more readable without any functional change.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/thermal/cpufreq_cooling.c        | 4 ++--
>  drivers/thermal/devfreq_cooling.c        | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_=
cooling.c
> index 768859a7aed0..856d619370db 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *po=
licy)
>
>                 cdev =3D __cpufreq_cooling_register(np, policy, em);
>                 if (IS_ERR(cdev)) {
> -                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %ld\n",
> -                              policy->cpu, PTR_ERR(cdev));
> +                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %pe\n",
> +                              policy->cpu, cdev);
>                         cdev =3D NULL;
>                 }
>         }
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_=
cooling.c
> index 0330a8112832..9ada52cbf7dd 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, =
unsigned long freq)
>                 opp =3D dev_pm_opp_find_freq_exact(dev, freq, false);
>
>         if (IS_ERR(opp)) {
> -               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %ld\n",
> -                                   freq, PTR_ERR(opp));
> +               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %pe\n",
> +                                   freq, opp);
>                 return 0;
>         }
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/q=
com/qcom-spmi-adc-tm5.c
> index af72db6299cd..4554a6fa55d1 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *=
adc_tm)
>                                 continue;
>                         }
>
> -                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %ld\n",
> -                               adc_tm->channels[i].channel, PTR_ERR(tzd)=
);
> +                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %pe\n",
> +                               adc_tm->channels[i].channel, tzd);
>                         return PTR_ERR(tzd);
>                 }
>                 adc_tm->channels[i].tzd =3D tzd;
> --

Applied as 7.4 material, thanks!

