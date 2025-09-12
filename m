Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEC9CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L5LpCqgd6cuTc0c8Co1kvdyn21Z6xUMeh+u0WbfeIVU=; b=wH8dSjj/PJsxTs2mmO/xeZdoOf
	l7ZajFmqEGoYVKu7wo0umr0ySH/tYtFFNvnTR3iKGkU1kr5gzmINL0MRpUgTIV15Rmowq+q8civZH
	X4SP7XN0seD5lz0GEQJGy2OXysuYaqtDGr/NGTwCIHFE/0bYiGuQEP0VZIBrW2y5cmLe5gsJXX6mV
	IUZ/mN0G26HwwK9VrlCuVSkKMkQC3DjHAFoJn5eGp4szfaaNX1eOGdooHVVD1UP/ndmdsM73yG2YO
	RZxay/4q/iBg9k6z6sKFZGAeuLx/f1BEeYsb2qBs0vFkRK9ZQhvWmfAnNz5zlC+oJGchS5bCuR7J6
	0WhJZmLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8e4-0000000B1xN-1bmv;
	Fri, 12 Sep 2025 18:37:16 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8e1-0000000B1x2-3MtK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:37:15 +0000
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-556f7e21432so720300137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757702232; x=1758307032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5LpCqgd6cuTc0c8Co1kvdyn21Z6xUMeh+u0WbfeIVU=;
        b=hsaXa3sL3cic/isx/SB1Gx/nHAleOzsdfaskKAUNgTBQGY7akk0aVxpxvHPIhVZYWN
         boiepokpZE8jdCEQrPvJ+acKnr1/944mv+7l3dgqY35EOQB5rHGXq0A9rh7a0bCBvVDI
         MDlJ38+IMKgq1KFWeuWZR2hmVDun5rqaFgAGOKiAMDqmDxQinYA2r5nFjOv+b1bQf+Gw
         Mew/+IGfckM3+r0UabNQdI6OssL84ZUGjZv1H4ic0mgjC61xU7fzaDc8oTcZdlSBm7Om
         2iN7RZDI46oqb1UWF2QUto7Fl2I4Z9eZ7YkFIqy39ULoTu3QKhTNJJ7AU+fbTBdLDkKd
         PSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757702232; x=1758307032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5LpCqgd6cuTc0c8Co1kvdyn21Z6xUMeh+u0WbfeIVU=;
        b=Tz6wwfs4prwrEcs+iParmFQneOOqHB3B9QyiYE9dphuaH9qpaKGWYivv3yvXQaKrFX
         +mjsSfVTGs2wfPOacvG8u+BP6YhTxC8/eqUg+jVwQ/h5LVnxw9OLP2tcb7cZde/KULjP
         e9AgIZoRuNlQUyMj7DB8ws1OyBsPm9MJkb56+OYbqM9+Wzx7dJzGiLvv8IYfLT0skP/r
         QE+Ko7oWXFUqp5qjX/jjLfUFa1iGx64jzFF1phUo+7qfzICkIvyXJ2kWZoH9bBu/Y331
         FetTfMKqFZc/VCAlcfOhmcxjhp/2kjohEZBDR9M5igOIF6aKQabvcwLIok27EPXzp2dC
         mAxA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOiCrQ4f0xlKm6fArARTvzocI7BaIBlFkYYEJX0rydd2GVilLHrG+58mKaa0VH1LBEeysHpgxnZt3XOkKzMdq@lists.infradead.org
X-Gm-Message-State: AOJu0YyaTMFRgFu2VPzzwdFWxPJTklUAUKZwqhsHrRUWc9SBbuoDsySS
	i4mBxfUmXQ4aVB//mfHXOpCIhUDwsUp7E0bdXEpfWG+hLwDUGg5pWsYsStPrWGNq6KXM+6OBWRh
	HFIai4+pq3uKEf8fZ0t9A0o5+imtCLESmcDmFOGG9
X-Gm-Gg: ASbGncuF4OX94z8/GsyNoEYElb3gszQu8MRyZmnTndw41E8ZIiFTLWJL9qWFq2cMQ3T
	qmTYO1FhQ/mPotpSviDRhnyUKYg+2rzILtSftQrgvP9mpIErqa91x62dCJAHy54YTGaviZh7sBZ
	0WGOfSFZTl3bb0MRmPqplaXvhMUe4EyAXhfRC5jtRTMS/Z+DklGtEsj7wiFeNH420jBWVrP+HaM
	Irt96OXLyh8SkuLDraID/8=
X-Google-Smtp-Source: AGHT+IHUXgE+IihNEnKdjmOQEwLekUUvu3+aWzgDFOUfZi4sULxM7CrV7gKrH879sJaDGgzOnRIOHdgF+J3gqIizJi4=
X-Received: by 2002:a05:6102:3a09:b0:525:3802:c260 with SMTP id
 ada2fe7eead31-55608e9e69cmr2203452137.3.1757702231508; Fri, 12 Sep 2025
 11:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-1-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 12 Sep 2025 11:36:35 -0700
X-Gm-Features: AS18NWBJYwHlx6gFzPDiQm-A363FKAFgsm5_uMk29VFYTcWjd5qUP9Ell1HnVXs
Message-ID: <CAGETcx9W5MXyHA2r1kDh9=WJiQWLF1xdPaSCH=jXYeAHqQW60w@mail.gmail.com>
Subject: Re: [PATCH 0/5] pmdomain: Restore behaviour for disabling unused PM domains
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_113713_850840_5A9C148E 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, Sep 9, 2025 at 4:11=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> Recent changes to genpd prevents those PM domains being powered-on during
> initialization from being powered-off during the boot sequence. Based upo=
n
> whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relie=
s
> on the sync_state mechanism or the genpd_power_off_unused() (which is a
> late_initcall_sync), to understand when it's okay to allow these PM domai=
ns
> to be powered-off.
>
> This new behaviour in genpd has lead to problems on different platforms [=
1].
>
> In this series, I am therefore suggesting to restore the behavior of
> genpd_power_off_unused() along with introducing a new genpd config flag,
> GENPD_FLAG_NO_STAY_ON, to allow genpd OF providers to opt-out from the ne=
w
> behaviour.
>
> Kind regards
> Ulf Hansson
>
> [1]
> https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.or=
g/
> https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9=
daeb00@collabora.com/

I'm surprised this is happening. The default behavior of sync_state()
is to never turn off a power domain until all the consumers have
probed.

Is there a consumer that's not captured correctly? If so, can we add them?

Also, there are already sync_state related kernel configs, command
line options and sysfs files that should allow people to power off
devices (at different levels of granularity) even if its consumers
haven't probed.

Thanks,
Saravana

>
> Ulf Hansson (5):
>   pmdomain: core: Restore behaviour for disabling unused PM domains
>   pmdomain: rockchip: Fix regulator dependency with
>     GENPD_FLAG_NO_STAY_ON
>   pmdomain: renesas: rcar-sysc: Don't keep unused PM domains powered-on
>   pmdomain: renesas: rcar-gen4-sysc: Don't keep unused PM domains
>     powered-on
>   pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains
>     powered-on
>
>  drivers/pmdomain/core.c                   | 20 ++++++++++++++------
>  drivers/pmdomain/renesas/rcar-gen4-sysc.c |  1 +
>  drivers/pmdomain/renesas/rcar-sysc.c      |  1 +
>  drivers/pmdomain/renesas/rmobile-sysc.c   |  3 ++-
>  drivers/pmdomain/rockchip/pm-domains.c    |  2 +-
>  include/linux/pm_domain.h                 |  7 +++++++
>  6 files changed, 26 insertions(+), 8 deletions(-)
>
> --
> 2.43.0
>

