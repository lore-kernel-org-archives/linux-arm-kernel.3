Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B982CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TImWhcAqndssQTrfnkjNKmhvD9vElOxFN8zK455Rmc=; b=Q3IRbjSt8dT/PP4OPXHGyBYFwx
	diP7s31DJTpaB8Ymil2n2rFfX2zbA6J0oxKWzYhth0F1Ntr8/cW6e3qOC0Y6MfbI9aSki7oKTQ7rI
	h7OmZFm+kXMq9W4O7XeLj9iGdpv2Jdaog+oXIj0VK0f0bX03o30n1COxMDAFF0TtUT+irkpMAsCJB
	vOw9nkJ8hpzITJB3Wqu1TYqNnogIRugk8nl3FIt8zVwEHy/ET9IO9HNrm+giymDp9xLtAzQQCFKvj
	NrTqcUXCSGMmbsQFiLSbOh/hzuSS2Yf8cuKVoqvx0TFadGu2V/704sehKLOD/rPMBHbSBvbEugkc0
	CkAvNaFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDgv-0000000EDpJ-1xtH;
	Mon, 01 Sep 2025 23:12:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6HW-0000000D2Tp-3abo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17664450E2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 15:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF39C4CEFC
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Sep 2025 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756739838;
	bh=5weQGGRb22PrjCyP/g4zxlVoFtpKwJSJ+1zX1sG+Ceo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DFjWhN/jsNsqAZvHoveNR+Mgdhf7CMJNAnHMrmN/uF1Ia3yuW4Qod6p05GG8Q9AKP
	 fzD+FXwqy0hyFfv298cfv8KssWE1igCMs1gfYHUlIY3Pojgd8hFLbvmVrYD/IBGm5W
	 crp3nff/U+EJEAk2gYyeYerz2o55JEjk1N19gxpYnJJbdzMoF5GgV5YSlfB2VkZLOn
	 AE3ls2gQNv4xuJLcUc4UhU3gzfCY6dxcTnqht58XOTS5Od2EymDUI7FSQCEQWKtblB
	 cWPeRvvs7Bt+yVsA0oc7f1vLNZxvLc+i2XqNWZQlRBoj9cTjxGt1TsYxr/D+RpVS22
	 zXj0XkSwv0Msg==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-315a297f9a3so3303870fac.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 08:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHQIW+bNB4Iu88FIsMk4qoafeZpMhAHRBnVZU+a75bd/31vaGUMqSKZIS13gfSnI+89U+w/EYC+7lYfJc6b499@lists.infradead.org
X-Gm-Message-State: AOJu0YzR2/xms0AX9KGZpZX6PG0t86+PgEGsurBdoLgPha9WHloXiDTm
	A0HobRqp8gAmJskv8ptigbpsTxwC2A6JTgNTfn4t4hCzzpFFjasDHvcof+rKlg8ijEvHsZ23AlV
	b6sd8ljTuev9VCOXhUnE4nbgXoN7F89Y=
X-Google-Smtp-Source: AGHT+IEqozTSDrtoR1W72zJmy9Z1LH1mlLFPdwzpw5V1Yv8IGBwtb8EBAZercDEFewoqAI3YKrAtdKI2Ii3KK+l5mg4=
X-Received: by 2002:a05:6870:9b09:b0:30b:b123:b6c9 with SMTP id
 586e51a60fabf-319630e13fbmr3523480fac.12.1756739836982; Mon, 01 Sep 2025
 08:17:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn> <20250901085748.36795-4-zhangzihuan@kylinos.cn>
In-Reply-To: <20250901085748.36795-4-zhangzihuan@kylinos.cn>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Sep 2025 17:17:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
X-Gm-Features: Ac12FXy28aQLAZnDRwhZh3hbZ0aFKhCyHW17tDgFwo0nHMN5cP-adgYEeM5GYyY
Message-ID: <CAJZ5v0hu48NrMr6Vkjn_UyHywJMx7F5N6yWf2LiXxykZF79EKA@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] cpufreq: intel_pstate: Use scope-based cleanup helper
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, Ben Horgan <ben.horgan@arm.com>, 
	zhenglifeng <zhenglifeng1@huawei.com>, Zhang Rui <rui.zhang@intel.com>, 
	Len Brown <lenb@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Beata Michalska <beata.michalska@arm.com>, 
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>, Sumit Gupta <sumitg@nvidia.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_081718_934885_D44509F3 
X-CRM114-Status: GOOD (  19.84  )
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

On Mon, Sep 1, 2025 at 10:58=E2=80=AFAM Zihuan Zhang <zhangzihuan@kylinos.c=
n> wrote:
>
> Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
> annotation for policy references. This reduces the risk of reference
> counting mistakes and aligns the code with the latest kernel style.
>
> No functional change intended.
>
> Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
> ---
>  drivers/cpufreq/intel_pstate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
> index f366d35c5840..4abc1ef2d2b0 100644
> --- a/drivers/cpufreq/intel_pstate.c
> +++ b/drivers/cpufreq/intel_pstate.c
> @@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
>
>  static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
>  {
> -       struct cpufreq_policy *policy __free(put_cpufreq_policy);
> +       struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpuf=
req_cpu_get(cpudata->cpu);
>
> -       policy =3D cpufreq_cpu_get(cpudata->cpu);
>         if (!policy)
>                 return false;

The structure of the code is intentional here and there's no reason to
change it.

