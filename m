Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F86BC8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=; b=IVDP1DCKPbxjklALP4wP7P7wu2
	wBvN0N43e1aDsWCcVZV/D29W7M1UNXNVf3SIDRf5nPkXLk1PfTughStsfBHD+n3jzm31chdizmdXZ
	/ggmIRJUpFPj77mKwRshToV3vsXh4DiguSv9VbEK3poD3i94XD4s1gxOZ2MvAhtkwN5osIriBxgiu
	FrQwwnc+boOC5n5jozAJOwozvOXIXPbAynzckl1lqt0YmyvI0VhvHAjxL32CWExIDR/g8uiBNLqzO
	LM/iDPI8ESOK+ZpmGynGoqrRiFwNbBcmU9LhSPdSXE0YDxezB+2pWWoOCxYd5y4OnnurmpvLDKAWZ
	KbFJwUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiq8-000000026rC-2UPh;
	Mon, 07 Jul 2025 10:12:48 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiJN-000000020fe-3pfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 09:38:59 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-8762a0866a3so56906339f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 02:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1751881137; x=1752485937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=jbzLqYh59+keisbp67lT3PkP72bWdi/qwhxaEZU/qeMaWhb7nZ6WGaNZF2cUurCR6z
         Xb4TVFJbDkfy6kKz6QE0qgP4tyoVbtpeE/zSOpXm/WLxizNFveJtBrePAvFSbB4vncXq
         cDdgLzgKN7b/j7N0p25mjwM5P6Fkoy1gGyo2werhmnQCRiX+cXGCdSUntO6x4qRW4XgZ
         IHFeSH1oTbFCCdpYkRyVIwhHakgNuY5FoJwyeYmOnylgh0/q6NQn/41WwcayHBpscGcN
         CFwtynrE31ORG+XBocD6/lJFBhCeYtbvGObeRvukC/xQCMcqZImFVmz/zUAOti489MYX
         1KNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881137; x=1752485937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgZsROmV74i3LKEIf/xZRowc3GM1ebMqOxLJS5yWzYQ=;
        b=gWIh9P5MmCM8Z0cM0GHVV7MDJ5VKDkk/flaOK79fR/EJUipJMP3btT6G2uLbpZFcAO
         pjXSG2Fzcsh0sbt7vBaGYpchFCvMB/frGV1lJ05tt4ZKd0HLXnZuXSvAp5VitKZVopmR
         fQYs2HFqsPiMmVXG56CcNhtOMXNbDD7CFF0zdAA0vT2YVe+M6xMLuEcbmvY/pM8nc5ae
         ufllVOODIPF0P0n6Nn2Np6q9085lXeixq04tR7GXQ22mky2FID2vh63nXlRA+jaffF8/
         aHqGQmVsV4+J5gx1bHqx1yV6zP5sHk8DT+uUzKcF6ZyS8XFvXd2pR7PLViWbbYIIUZ9y
         nM2w==
X-Forwarded-Encrypted: i=1; AJvYcCUCcvsbPH7+SE9mOLSwMtLp7H56lNNpqU31lwksMFllGQ404gOvaT3MXtMd8umXdE7aR7r8XlmcVInjs+jGMeNR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8/nmBUSryaoguV6tcILFvVbwqLSFmMkz3h8+R+nFhecvEhd9z
	7M6sbX2V7PShlle4BUwAnQJTPpaZs5YuALzx1teJmBak5n9ni3ULHuQAnBY/FjxIyh8zV3rN7aK
	woPaYLzignsR4httHT2kMOL1F004dxC2zxHYMnRMqPQ==
X-Gm-Gg: ASbGnct67s8p5qEOzI+lVM6e7Cd6DT9ReDPDxTUH0Q8vrHbNp5DsvTChvlyCCUfhKw+
	yWWJx914S7TNwp2lqscY4EuiUHXn1HU9Fg3Moxm+dTOdXeEGAnlH0T6D8EXqsmiWQ0JTbw52npj
	H9P1226QBgE8z65guGDhBjBfDS8lp4BJEoeXpxkrw/wYyS
X-Google-Smtp-Source: AGHT+IFKjzUQeQQI7LB5Qa2/KiIun4MBso9sECmrBCp6niwPJVZxqnnGmZUVkWEtGZmc3+SOF9owpQQYDocnGgSsvgQ=
X-Received: by 2002:a05:6e02:2589:b0:3dc:8b57:b76c with SMTP id
 e9e14a558f8ab-3e13ee92f38mr68372945ab.9.1751881136933; Mon, 07 Jul 2025
 02:38:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org> <20250701114733.636510-25-ulf.hansson@linaro.org>
In-Reply-To: <20250701114733.636510-25-ulf.hansson@linaro.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Jul 2025 15:08:45 +0530
X-Gm-Features: Ac12FXxDUsc83NMJbxmZApkih2qJ3f4DnyYJbjNzkyF_HKvftJAST2PYGqAG2oQ
Message-ID: <CAAhSdy06D-7PGbt4jR2rr2D_rJG4CnevHV+LJm-BZ7CxMpECQw@mail.gmail.com>
Subject: Re: [PATCH v3 24/24] cpuidle: riscv-sbi: Drop redundant sync_state support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023857_953393_813C8FF5 
X-CRM114-Status: GOOD (  24.47  )
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

On Tue, Jul 1, 2025 at 5:18=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> The recent updates to the genpd core, can entirely manage the sync_state
> support for the cpuidle-riscv-sbi-domain. More precisely, genpd prevents
> our ->power_off() callback from being invoked, until all of our consumers
> are ready for it.
>
> Let's therefore drop the sync_state support for the
> cpuidle-riscv-sbi-domain as it has become redundant.
>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: linux-riscv@lists.infradead.org
> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xi=
linx ZynqMP ZCU106
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  drivers/cpuidle/cpuidle-riscv-sbi.c | 22 +---------------------
>  1 file changed, 1 insertion(+), 21 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidl=
e-riscv-sbi.c
> index 83d58d00872f..a360bc4d20b7 100644
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -44,7 +44,6 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_da=
ta, sbi_cpuidle_data);
>  static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
>  static bool sbi_cpuidle_use_osi;
>  static bool sbi_cpuidle_use_cpuhp;
> -static bool sbi_cpuidle_pd_allow_domain_state;
>
>  static inline void sbi_set_domain_state(u32 state)
>  {
> @@ -345,20 +344,6 @@ static int sbi_cpuidle_init_cpu(struct device *dev, =
int cpu)
>         return ret;
>  }
>
> -static void sbi_cpuidle_domain_sync_state(struct device *dev)
> -{
> -       struct sbi_pd_provider *pd_provider;
> -
> -       /*
> -        * All devices have now been attached/probed to the PM domain
> -        * topology, hence it's fine to allow domain states to be picked.
> -        */
> -       sbi_cpuidle_pd_allow_domain_state =3D true;
> -
> -       list_for_each_entry(pd_provider, &sbi_pd_providers, link)
> -               of_genpd_sync_state(pd_provider->node);
> -}
> -
>  #ifdef CONFIG_DT_IDLE_GENPD
>
>  static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
> @@ -369,9 +354,6 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm=
_domain *pd)
>         if (!state->data)
>                 return 0;
>
> -       if (!sbi_cpuidle_pd_allow_domain_state)
> -               return -EBUSY;
> -
>         /* OSI mode is enabled, set the corresponding domain state. */
>         pd_state =3D state->data;
>         sbi_set_domain_state(*pd_state);
> @@ -401,8 +383,7 @@ static int sbi_pd_init(struct device_node *np)
>         if (!pd_provider)
>                 goto free_pd;
>
> -       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN |
> -                    GENPD_FLAG_NO_SYNC_STATE;
> +       pd->flags |=3D GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
>
>         /* Allow power off when OSI is available. */
>         if (sbi_cpuidle_use_osi)
> @@ -570,7 +551,6 @@ static struct platform_driver sbi_cpuidle_driver =3D =
{
>         .probe =3D sbi_cpuidle_probe,
>         .driver =3D {
>                 .name =3D "sbi-cpuidle",
> -               .sync_state =3D sbi_cpuidle_domain_sync_state,
>         },
>  };
>
> --
> 2.43.0
>

