Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08ECA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 09:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma/6vP6cw0Ynsztpbgjyb4FEYEjAJYKzRW150ld1Q7A=; b=F7GaTA0YtsJJMEtMb8EYpFWe+B
	S12bPvdBeh6HVSHlUnfKdeFLxfJ8nmHtUmCP5eWqsq0Txue/uyN/y9ReBuCOhxypxuhz0SyqYwf9q
	uhfFBqIp247kBt3LtTPHekPMgTJ+BAiLFjjLUPidU+u+kmGm0NJA4fYjU/FD92eRJ4nGJqCqH6e02
	9Y5x1vLhEF3Rhu1Jd7WY4XtJyplA1wAQj7DW0Ool0C/BBWbNXF/foopirxOBUeBwndcLQ/41G6lb7
	HAIigJg/uC5MKqC9HmbPTK0OIJsB7WWVG1C1b+dl3Hfy6TyshmtJQqSzjTR/Asftc9T4GwB7iCUb4
	qyc/fWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdBu-00000001ylZ-0w3C;
	Thu, 11 Sep 2025 09:02:06 +0000
Received: from mail-vk1-f171.google.com ([209.85.221.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwdBr-00000001yjt-47MF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 09:02:05 +0000
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-544ad727e87so326901e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757581322; x=1758186122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ma/6vP6cw0Ynsztpbgjyb4FEYEjAJYKzRW150ld1Q7A=;
        b=vix9UTc3/0iR08J3dUO3SMSl2kFbnbY/tcylrcLj7051VkgZWZET5YHqBSkcef50BA
         ujlYA2LScJyhosqYVZfx3dk5kmj1H3kQ0HlrK1YRc8eRui5rQHBBonT3h31OtYiJ2POt
         0lIVoI3jCkMw5rgnqyjvXmyVI8jIhxe1TRNF0YFUdLd0Bf4goqcy0fDfjMzP9oWJKmjY
         NpjBPRDYG1+C863xKCFAS4F8rB+2fuskCYYS9DcwD8ujQVd7yUD11aNxYZ9sJEZrupaR
         WJlZoukGd2z2Q3Z9zbzG8P378dw6VMrYIsTaxIBDXpEiKclTi5gxxOXI7UMtg5jj7aGh
         weDg==
X-Forwarded-Encrypted: i=1; AJvYcCUAQG9htdXDna9IeMedWLhy9nk0nmOmnQvLZZCFppvtMx8cVT79FnOecFqi3oOMLhYp2kqOoCNFOIUJr/PGQG4a@lists.infradead.org
X-Gm-Message-State: AOJu0YxXJvoBiSlgBEzKGxwPnhD9k2xLEMJd3vHg1WOrDpIFRyzieu1t
	JqInvh7drzd7lN5wXGRu5igJ1zVu22da5vSjBA19mBLdTujInu4Ps8gzfOWUkV5S
X-Gm-Gg: ASbGncu9lizbUcICfH6SwBS9lCXcacq8JVukV3ceX59ZP1VmTgYDtorg/mz8CSFQakL
	C0WEcjbfi8+INF5ydJAb1t8l+ivJqhHPS3hH5e7Nw/Ko8Txg9civ8eS6HPKylGGi3vnMAKdH3qL
	2oNcJ9FNH9Rm9tWyODuT/9K2dXBV4dwrddMlxpIOcFKhUBW2vq3u980lFCW77bbjTh1Rwqs0ySW
	Xe7N94kD9bq3INSxlt9xQuj1EmhRcrxiu+RYTkCkYf3VP4GErw7bZpM3X4mvSBuv83naxwPDR6E
	4hEc15jjEtZFWqygGrod7tVA45iU3x0VYkk1PVS8NhaHqXqtHL7r73gNZtakPZhzJYiD42cFSIa
	wpQvG/YUDhUUf5SJ3JsWcZsV+RPU7LM2HtvLQ/NKYsnHX8BHNRcPnSJHq52JvTpzPYwdLzb8=
X-Google-Smtp-Source: AGHT+IE7ULMo2DEAk7uZXbXORginIxajwMrF4H25nF0fB0NGkvHdIFKfCVVbqH0O7Ot8mdabuvfKBQ==
X-Received: by 2002:a05:6122:251c:b0:544:9414:1058 with SMTP id 71dfb90a1353d-5473a3adb08mr6041627e0c.2.1757581322324;
        Thu, 11 Sep 2025 02:02:02 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d3f0769sm150680e0c.18.2025.09.11.02.02.01
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 02:02:01 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-8943501ba3dso357236241.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 02:02:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkzPyupMBqZWxOzWl7NthVAxNFXRwhey3drw07AoKiAnatQ90jK7aLMsHm/3StmnOnrbiiiVkaLl17rhpazXKw@lists.infradead.org
X-Received: by 2002:a05:6102:3e0b:b0:522:1013:cace with SMTP id
 ada2fe7eead31-53d1c2e1cbamr6471994137.10.1757581321304; Thu, 11 Sep 2025
 02:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org> <20250909111130.132976-4-ulf.hansson@linaro.org>
In-Reply-To: <20250909111130.132976-4-ulf.hansson@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 11:01:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB05sQpv0nKgU2NNn4=KAmNCpHhAnz3s15Gopu8FKVkQ@mail.gmail.com>
X-Gm-Features: AS18NWB_6gJmqKrqPl8hBI-saW-lKUrGeAKCkd2NAqUJ0GfWChjmTWPU1ec2v1s
Message-ID: <CAMuHMdWB05sQpv0nKgU2NNn4=KAmNCpHhAnz3s15Gopu8FKVkQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] pmdomain: renesas: rcar-sysc: Don't keep unused PM
 domains powered-on
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_020204_027360_B5B48C88 
X-CRM114-Status: GOOD (  25.92  )
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

Hi Ulf,

On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> The recent changes to genpd makes a genpd OF provider that is powered-on at
> initialization to stay powered-on, until the ->sync_state() callback is
> invoked for it.
>
> This may not happen at all, if we wait for a consumer device to be probed,
> leading to wasting energy. There are ways to enforce the ->sync_state()
> callback to be invoked, through sysfs or via the probe-defer-timeout, but
> none of them in its current form are a good fit for rcar-sysc PM domains.
>
> Let's therefore opt-out from this behaviour of genpd for now, by using the
> GENPD_FLAG_NO_STAY_ON.
>
> Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

> --- a/drivers/pmdomain/renesas/rcar-sysc.c
> +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> @@ -241,6 +241,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
>                 }
>         }
>
> +       genpd->flags |= GENPD_FLAG_NO_STAY_ON;

So this applies to all PM Domains.  While this doesn't hurt, perhaps it
should not be set for always-on domains, and thus moved up, to become
an "else" branch in the "if/else if/..."-logic handling always-on
domains at the top of the function?

This applies to rar-gen4-sysc.c, too.

>         genpd->power_off = rcar_sysc_pd_power_off;
>         genpd->power_on = rcar_sysc_pd_power_on;
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

