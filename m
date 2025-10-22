Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D460ECCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLEmUot0dG9xtL8DSLz9R1/+HNCZwZn0MDiZJ/G/QNg=; b=KSJ3uBd9TwQJSR4GcmwRY9qNQf
	YSNicRYhoS2vC5CrJYIJX8UQcamKt49fxgc51jr3wzrg0Y6PBI+lzoWCnQDEPsD70Wq6LtRyrLtEP
	D8DmOJh4fC3mZAaWViN1GXhVOYdRc2OEFnySabDdLIooYYe8KlIOSlUFvFEd//metJ1X1twVYOAIj
	94ZywkR808eqppgjEj6xAmVUJR0EeD0L4pRyab114IUbv4sJ3/wi+2GxGGD0liHn59rBxNNv8R1Cx
	M8shqzkV9eY73VvBJrdSMMm1aT6ewyHFds9mGdaoY4VZjkd14iNiarIJmO9DbUWak89W2Qt+gDapL
	a4veh6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQV-00000002uEo-13hb;
	Wed, 22 Oct 2025 12:58:51 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBYQP-00000002uBp-1LBX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:58:46 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-71d71bcab6fso66873627b3.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761137924; x=1761742724; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eLEmUot0dG9xtL8DSLz9R1/+HNCZwZn0MDiZJ/G/QNg=;
        b=oNZnW6N/JU/e23IklGyYQybGrTuafcimNL/Gj2wd/OE5nJDRAtmRmAInkQG2gpsueH
         SulO2HOVsu0RkbU+Vl/EVxswp3XMC//AHBOYB3ZFXmF8SMSbrpBrDhCEg4P094KZgrEq
         VxnpunKEDte0U0ynBa3JLF7zeK9/NkoEdPNXoKo/MIkguR38vXw20B64sLjwsnrWxN8x
         zwBuIu3Br8nljO1ER2YPFsbWtfUUhfgQ5iukRIM8BY7ebjyEGD5iJUGNvNwpvqdbdrb0
         zzuXfFcB4qDt1Ax4ns7iySW9AJknEHyCRUqI4tqGwdVdDE6Ljkp3JTQ4DRsp4I3AHU7r
         AU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761137924; x=1761742724;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eLEmUot0dG9xtL8DSLz9R1/+HNCZwZn0MDiZJ/G/QNg=;
        b=FtzzmQrgNs0tzuv9aaylaRdRkOWwqzpqlTvbT4Hy2XR0sffYRhEHh5MKrSdPR128dr
         5zvjXrv1p0pmnycfNercqkR9qQ5YkEx/8UBunoAyLbMXn4BUZOBfqoH6wj7cE2hYQPuE
         SYH7rQQ6tNI3rnTtEUNAPLf289WWZs//YRrkwK50v4GP5W3RKJ7odWZhWdXA+PpXOC1A
         PlclZROhrIT96C5uKdaQMO9ITFowSVBj6iwcXVYR0IEi8tjMRuVFgezVAPmrCRfztkhY
         FXjhrP4w6zcHg93dgbUKzdJ1GeNZKYNez02QjtuQGgqTnT7I96TA08NvmZRz7zcjl56K
         Y1rg==
X-Forwarded-Encrypted: i=1; AJvYcCUV/CnCdsXm+zCY4zYQlHFuHe3dqaS2vbF76CBSk0YAzXaQQ9fvDTk91wYPdXKp+CaGBIdfgHB7KoJx31YoGNR+@lists.infradead.org
X-Gm-Message-State: AOJu0YwP6TxFDu5UpYqyCxHyImvA7o+6hISO2ONQDSO4fsfHwlYRDiaj
	tdrgprDmXgxsFsWnKKxIncQupfYzzSW/4ZqiHwgrekn2GQTejZP9hlTpqiyTJF8AkfyoYH6thGx
	xVru2ikSr24e3GDmoui8/kvQJGdSoLIlyTvD9Wjf1bw==
X-Gm-Gg: ASbGncvlgh45d2jmx9l1fnWhcgcmFul9grrR86X9JUojoZ2JnhssQmfgWF8G4LkMzeJ
	4KdRMbyFslf/iRpLIrOsu16DlScfTqYrubeggxGdEgRx2REEXcukH9lcTwSRe25dJsgkblJ0Fpw
	vKTiZ1Bz1pGe8XkQdjGA025oe68fAyzQmd8Vb3OAeLF5mtW1wPQyTURv1rYr0ebcy3PNikF6UUf
	HA+2uCz8GLkoF+ahsDGz90VTiwOS1/jNF4eauJ+sKWHuB1ElhYhubF0rpZqktcjxqpARQpkDeYa
	50B7Azg=
X-Google-Smtp-Source: AGHT+IHAv7HiO6eP4aWMFZPRTzo0gGsJMyquNUGCzuthL+6MyEwwQSP44SzayI7psI05mL8WUrrN1mroERg61KE28fg=
X-Received: by 2002:a05:690e:144b:b0:63e:19a8:e40d with SMTP id
 956f58d0204a3-63e19a8e6f1mr16159025d50.38.1761137924084; Wed, 22 Oct 2025
 05:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251021135155.1409-1-thorsten.blum@linux.dev>
In-Reply-To: <20251021135155.1409-1-thorsten.blum@linux.dev>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Oct 2025 14:58:07 +0200
X-Gm-Features: AS18NWBn7Jc97c4IenLEHpSvuwzifEIi9PksbXk3zzduCyplxNyhkwWrmNivFQk
Message-ID: <CAPDyKFo64vzC+66=v_4v5Z2CbFvFEQ+tYpSKcRvnvRcMvHD=TQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cpuidle: psci: Replace deprecated strcpy in psci_idle_init_cpu
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_055845_362232_3710020D 
X-CRM114-Status: GOOD (  16.25  )
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

On Tue, 21 Oct 2025 at 15:52, Thorsten Blum <thorsten.blum@linux.dev> wrote:
>
> strcpy() is deprecated; use strscpy() instead.
>
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/cpuidle/cpuidle-psci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
> index b19bc60cc627..e75d85a8f90d 100644
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -382,8 +382,8 @@ static int psci_idle_init_cpu(struct device *dev, int cpu)
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
>         drv->states[0].power_usage = UINT_MAX;
> -       strcpy(drv->states[0].name, "WFI");
> -       strcpy(drv->states[0].desc, "ARM WFI");
> +       strscpy(drv->states[0].name, "WFI");
> +       strscpy(drv->states[0].desc, "ARM WFI");
>
>         /*
>          * If no DT idle states are detected (ret == 0) let the driver
> --
> 2.51.0
>

