Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76496E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGDjDmjaarnv2LRhR9yI+0cQdlmEnitFOz5zg2VCDVs=; b=SyDdU4fdtH/G2wO46P9XihQRA1
	dgMjlVBSBHOSQHHLGd8gX8DZD3f5Stv3LRYGOoqcfHRKHjshuRUDMpyI5yhtePbqW07sa0OppXCc+
	3KPusQR5vfPhV1MjZWbLpTp789gc5xLnKiSXqYdXgNIX4tU1nBK07DoIz8DrNspls/KknXi35CYfX
	Y0kIlXPHCfdY2AEfOte1VXz60Sz44oYp4CeDO9Ljv4D6PUENMNAda82AKBEQXxo0P4q6JF3+YTslq
	MPTMo4238SBqzwTev0A6wTJFkTCG5hEnHSi/XIk0oGwr8CMcide2McbCkMQEuf3bIvwe8fhY+DVCY
	jMOpedGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0ps-0000000BfiS-0NGs;
	Tue, 10 Dec 2024 14:03:36 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL0oh-0000000BfM3-3Hio
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:02:24 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e388503c0d7so4418266276.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733839342; x=1734444142; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGDjDmjaarnv2LRhR9yI+0cQdlmEnitFOz5zg2VCDVs=;
        b=L4Kow7IFQOKVPB3NFjvqH5HK6BCvUJtcyeRUAtE+77/bQyyAJoO/HRom+ZxNXX+w/i
         tFsYBjmvbufCXX6r69deMcLpjTKjM58Zr9RY7MsKw4FRqnPEYDW3lFOVFQfMxgWg7kOp
         Hz8jxsSEYlFRSbi5V1Gyiv9pC8/+WruyOcPrJQ3pJgdB412BTimfi60nFNCsJ3zIPdBe
         MRaa5WDezl8E/708XLg8Z7nr6uPM/o5zWHZp3hZbkYFshP0UJUMlVzikXuiX1GccSi5D
         p6Mh7BklltNKlAXpgUp4IU1vYf66PLli2d1Au+DEUfEQ0/uGksqwBMhYWLWjyL7EdWsX
         uG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733839342; x=1734444142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGDjDmjaarnv2LRhR9yI+0cQdlmEnitFOz5zg2VCDVs=;
        b=EJfe9QN3f2R3RFV3b95hr9xo6jkgpOkAgTbSZuT/BycfpDQffSk8Ch/57hdloOjD4d
         bMbeLhcswtTy4iXqVq3Pw+97gVh68pHZvfWTn8wGwUqzg6WdxRFBp9T+a6qMsDXAaXzK
         nxPGppnkGXvPvvRQEVHFSY1tAJxxRyjCKMexAls3OSb2UdTaXQ0j0aUxaAcNPEuQIy0R
         +ZbPVqnusLQs8PWIutwN65/trsHmlxioMECAopGa8Qu3C32QEFs3IxVwryLPmz+YH7AR
         c0AHcdBxQSScjZfWESGlyL0txx80G481APfmLWSrqTUQglB4Ulj1LpmhEGQ/z7btqeTY
         xG1w==
X-Forwarded-Encrypted: i=1; AJvYcCW2Nvuw2tkDCCYIzEvGNpxffZF6KZyhdJKcM00tXkyI2aMHb/t8a6R3hhRtRFa0eIzvaYghwxnV+sIp0ceLdcB9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5my9OSdM/6oPLFtnqibVD+X98ERhIb/C8gseK2SmfcOvpghqD
	aIKEk7txfTTABriwmMrxedxXJr2Rnfutfnr/7oTGvFhmDZohRLOkGbCj75pyBDoAeHBOhwbLZKx
	+Xtp9j1JtGo13gV1sjHzGEmR4geeVLBcvojwxkg==
X-Gm-Gg: ASbGncuOnjtqkQi9fJTYRuHdxXLdWSB4SKVkZXkEt9RBmnBymDcN+ZgEv+r6sZUwIsk
	0j+nk2ej2jF7i926tTGzN5qRsJ63Z9K9lOHyN
X-Google-Smtp-Source: AGHT+IF8ODQGXD7UsXZFA398vKfIghJH5HEH16ZMuk46OLFWyEc2exSc7lgWOZZzJyVLz5Z9bI2L9Yz5Wky7WJz7dOY=
X-Received: by 2002:a05:6902:200b:b0:e39:82aa:45a8 with SMTP id
 3f1490d57ef6-e3a0b527cbcmr14579056276.53.1733839341586; Tue, 10 Dec 2024
 06:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20241119141827.1.I6129b16ec6b558efc1707861db87e55bf7022f62@changeid>
In-Reply-To: <20241119141827.1.I6129b16ec6b558efc1707861db87e55bf7022f62@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Dec 2024 15:01:45 +0100
Message-ID: <CAPDyKFoghwa+x0Dc8RfWWdDpP-mD4qUBZKpXjy4pK0mQwf6gGg@mail.gmail.com>
Subject: Re: [PATCH] cpuidle: psci: Activate GENPD_FLAG_ACTIVE_WAKEUP with OSI
To: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Alexandre TORGUE <alexandre.torgue@foss.st.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_060223_818873_6AC33B6A 
X-CRM114-Status: GOOD (  22.39  )
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

On Tue, 19 Nov 2024 at 14:21, Patrick Delaunay
<patrick.delaunay@foss.st.com> wrote:
>
> Set GENPD_FLAG_ACTIVE_WAKEUP flag for domain psci cpuidle when OSI
> is activated, then when a device is set as the wake-up source using
> device_set_wakeup_path, the PSCI power domain could be retained to allow
> so that the associated device can wake up the system.
>
> With this flag, for S2IDLE system-wide suspend, the wake-up path is
> managed in each device driver and is tested in the power framework:
> a PSCI domain is only turned off when GENPD_FLAG_ACTIVE_WAKEUP is enabled
> and the associated device is not in the wake-up path, so PSCI CPUIdle
> selects the lowest level in the PSCI topology according to the wake-up
> path.
>
> This patch is a preliminary step to support PSCI OSI on the STM32MP25
> platform with the D1 domain (power-domain-cluster) for the A35 cortex
> cluster and for the associated peripherals including EXTI1 which manages
> the wake-up interrupts for domain D1.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Makes perfect sense to me - so applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/cpuidle/cpuidle-psci-domain.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index 146f97068022..5fb5228f6bf1 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -72,6 +72,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
>          */
>         if (use_osi) {
>                 pd->power_off = psci_pd_power_off;
> +               pd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
>                 if (IS_ENABLED(CONFIG_PREEMPT_RT))
>                         pd->flags |= GENPD_FLAG_RPM_ALWAYS_ON;
>         } else {
> --
> 2.25.1
>

