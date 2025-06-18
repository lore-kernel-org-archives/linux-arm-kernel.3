Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD7CAC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=; b=GBU3j1xXhbA7ZgHs1dq5s6LRFa
	9z3rH3ESC8/N7lOVATHiVVAkP0Dfj1EzmucOzg3xDE3LXwLA8pC5wMDn/eRcF3y9BVpf+hEhXBF9c
	EY6aR0yb43IwO3c+bRQCncxCUPCEK97MMrrpChwifm64SZ6uf6b7vwxOeMVkVw6laK4ZeRPaEt6b9
	d2dblFlqMoKyUovkfpWMYWJyG4SruSrPcKtwRZvsG4hdnK+VwRmfi0Ps3Krs//saR1EexSdJIz0Ud
	EBV+DT72yzOK62543DFkDbcWD9Ty0LbYefXjiZrk1sN3gEDmJW/kr8M9CVFhMuLRFSSP+I/vaRlgT
	QwB+K1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvw4-0000000AlCt-0Qxf;
	Wed, 18 Jun 2025 16:46:52 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsLj-0000000ACXZ-37sg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:57:08 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-e75668006b9so6279707276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251427; x=1750856227; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=C67QX662TW1iWHehRY5gLsXfSfgg05/ZXws8IBBjlxtPuZLkhBChtzy9HMzTMOuHMp
         ewvUHT/8A7+EM4SOegYiC3bf9TEnIFhdRL1MqfoRd8Li6PfYJ2hZbi8zmyIFfzwRsVH2
         9j8bl3cVVS07cyl3qahOttdfVmTKg0NMoEB9VMM3kvDI9+kxw7da4Q0AeQPefVh++FDg
         bUGM5iH2Isvy3t/QrdIdqpY55uE/WY19a/MQcELWqEGjjUE031uiqfl3sH1bp9LbjXsv
         gc4F4BlCF+F8NCZKRno+XUsKzdqIxvuX60QLY7q6nsrs59zsrE1AvzTafCKhcE5SQQfM
         Jm1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251427; x=1750856227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=Uzq8BoQG6GtPZC0uFJ4d/fC8HLWV9vTdMOe+2gnXorDNhrNEp/47bLfkvStBYLfTQB
         LkRbBz3dL4W5t/DdxvwhNxZPPWZ+DI2lA2+iBHQOrYTgubvAJp+N6UAoyOmI4UC9BzBs
         KjsJgdXj4khbuOpUgeTDxlxes0/ZUOsqtfGpRYVjnNeYx7wkrwkPoAZwRoJqQOcxT3+X
         ZfkKuvm/e6Tj7KpQjefODmZpXtrGecllf6FZtwVmwOpoejDuLYFf4qK/pENAODLorghy
         k2kv4LL5gus7NKMlZSOdq18YOlH0dUgyiB2q0JndbOREfpnPhwZSvdZ0Gxdwr0vcCAw5
         3i5g==
X-Forwarded-Encrypted: i=1; AJvYcCVjJHg4qRPhzBBWTNPwq2+YcxPp1G69fLu/y1QJb3op0NAVSBMU4XqudFi6JALX1SuDvg7k+MPKL6G1+87QT2z4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk1Iiq1g7d1jVKxuKjtX8hU2Pa4jYWf/dggM1ihbwNBMCtK4fj
	bqswVrJp1q9EbIRGnC65k3Md16NNVDvW/5Cn0AgBbV/7ZW3poKrh4L3OppcZmz20hflZcywWC6t
	+01sAJJBRKYjneAUoNMoBe+Tnb2ib8IhivK2j0+2H6g==
X-Gm-Gg: ASbGncvTk9IWlVP1dzOaT/OY9hhCF8lwm6DVhdgU/rnJlPWPUuZ/lxZspLuDeLim1nt
	e4fwgyYIBrv2EZyBItYPK/AS6xRDiJKyx/RQp+kJq6VI4UqI+b9iL7RlhTF9SzlX4ic8gTfla7l
	04sel/uTMpJNd5lypvCU3d4OHiFVpsnaP+Yn4ev4mkNmQ=
X-Google-Smtp-Source: AGHT+IEZlf2SkQ6pDtcOhhdvV3LmUw3iR0H22QpguHg1V4liWBddtmQy97+4HMMAxIbIevgaVnIrB0SHGsEYRyBVYzQ=
X-Received: by 2002:a05:6902:6303:b0:e82:2b85:ea3a with SMTP id
 3f1490d57ef6-e822b85ee43mr16723424276.32.1750251426746; Wed, 18 Jun 2025
 05:57:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:30 +0200
X-Gm-Features: AX0GCFsnEI_9cu3U9fY7I_D0EnrNerJPcmhYfg39LAqv66uN774UfRLbAU6VCkM
Message-ID: <CAPDyKFrQ3Uj+coa0WCG00_pyaxu-yEnH26qmS6tevZ_772oZVg@mail.gmail.com>
Subject: Re: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_055707_782144_921B99F4 
X-CRM114-Status: GOOD (  17.91  )
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

On Thu, 12 Jun 2025 at 23:12, Sven Peter <sven@kernel.org> wrote:
>
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/apple/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
> --- a/drivers/pmdomain/apple/Kconfig
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
>         select MFD_SYSCON
>         select PM_GENERIC_DOMAINS
>         select RESET_CONTROLLER
> -       default ARCH_APPLE
>         help
>           The PMGR block in Apple SoCs provides high-level power state
>           controls for SoC devices. This driver manages them through the
>
> --
> 2.34.1
>
>

