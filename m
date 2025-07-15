Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572E7C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 11:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTflvjFePLQxgKie4eKSTOOZevSjP8T8WicglUvKhQU=; b=c83Fbp6OqLxCaYJDpEMOO773Um
	CQS/isNAw/RXekHhFtrnq7SjUtLCtN5bF3SCaPKgzVg8u5TUTcX1nDfAZ+xHvcYfhaRhQAVsM+LxM
	9bJ8N7CUNEyO5NXdIRjqR6CDY85Un/oZ98+E8cciaYRHtA5XVgWcyFqNaY8dXk0WEpVkPxUc4nug+
	rvf0HXkAEoCT52kmWQwTddFnsunPsDou4tQqDXSP1AKeaNe5wkfXj1l3AYI+uOR6D9r3yWCy2yrJa
	9c5yo+0wKq9HnaeDheXBItmQcytHWUm0++SY6Lje6l4yqCj9wmzRpzRtTeo8U+m+HZTSkcUlyPnrj
	ntRJeU1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeFl-0000000502C-1PBN;
	Tue, 15 Jul 2025 11:55:21 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubdwT-00000004xTz-21Aw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:35:26 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-70e767ce72eso48544647b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 04:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752579324; x=1753184124; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cTflvjFePLQxgKie4eKSTOOZevSjP8T8WicglUvKhQU=;
        b=qwyPiYsBchyMnRsotV8916Ou/GhKXddv2SX4A9PDbDCXH28hGf6j/Gu3+1z7Tx+Dih
         nXpvvGwPUNgDB2kPw1MUJmzEaamfXs0iob/Reu4BRF1ZG7iutU/iuqz1waWMJQfmjvcO
         vLQSg37MQGQXYblNGSaJ0O8DFiD5T49ZeOOgn94PrajnhSHS5LpTuJT7qP3t4masa1Kn
         +6sSEHgl7Oo6KE6xfKLbxp9kM0b5WC88//PqNwqgWLEwFf3Px3T2AQIXKuRyzJ3HiSTs
         svw/xSYktwmahV1Nb4115z6LaqkD5Bhr+N7sTtreX+LW98tRPwzUg8Fdv9Jv+W+3m5TC
         yNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579324; x=1753184124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTflvjFePLQxgKie4eKSTOOZevSjP8T8WicglUvKhQU=;
        b=uUQAQHYLKFDx3VZlHEmuwU1qfw6ZJZUHMHuWy7V+/cDQPbxjsWtlhQnehYDxGP/AMZ
         dlmTNbDFJrsMhQxsbhtdMOZSJ+SSuIMFYIrod66HbpfD8fUhz2rHDTIR7Cvnnh8DwbQX
         Ch2OniOKwY2VmfY/REzfVu3gYX5elqi6QEjf9AoF1cOcMUCPMZifA0Jd6oJXWF6cwCcZ
         +wU3PRhl+FSAHu2E57kmFXv9W4Z+jH0dFzNuT+yOsrNv2EABkITqpjubV6k4q+VvxxLT
         SHI0X3WNHkouglnNarFYo7RC2c43ErcaYcW5gFMMOiphZnFR3KC5z5nJ7HC45iAmSeJ4
         m1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0tSyuKPX7APYuXwXclZrdR8/DjZGw4XL7B4AU8LJAjhHRW0wGooifhOxVJ0UW+QLiCBn6g83G5KzKOYcOTbWe@lists.infradead.org
X-Gm-Message-State: AOJu0YyZLh5U+qREM9Ub9+a5his297WBgs+gzwXqspYBaVn7Gdmkyflu
	E/shxGn5/S5sfoYebQOi3HbAOhV7n2TZkHayNa/McALon6nts8tzpGKFaMwm8qt6uX0SscCMHUF
	LGC02w935074f/XGTsU0j4YkZLUfgSGABoYs4f8aEPA==
X-Gm-Gg: ASbGnct0n5AM0NhgxQBMxrwAoNCALIQU44ytfFK8Gixz6anQSl5QQ5275S8+j2BPW+Q
	lc2N9uYDJ0dfdIaANwiSjulmCA2aa0L+WtXKD2b7009m03jczwuE84NuzHzDLhTsPO7JcPATId+
	18RZdDUxRJgSw/izpO75M/nHtcj1y0Mqn9Zdv+5GQ4cnDVAS83eTk5cU0gH5uBnahpf73Vg9/u5
	fdhjKLI0N16KMPRChU=
X-Google-Smtp-Source: AGHT+IHfjHxIt9nZkak6zCnhG7sn8uSPBfYsxEtsb2a6mcbcWZf8ySh+73e1WwlnP3JuKOMwe35Yu94PqLxFVbjU1Uc=
X-Received: by 2002:a05:690c:6a08:b0:716:6a18:1740 with SMTP id
 00721157ae682-717d5e30ff5mr244148587b3.33.1752579324012; Tue, 15 Jul 2025
 04:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CGME20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae@eucas1p2.samsung.com>
 <20250701114733.636510-22-ulf.hansson@linaro.org> <212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com>
 <CAPDyKFrPOgWW_=ehCjtqAUR97HoLKmgFNO3bRT50-w6A1LgGFw@mail.gmail.com>
 <01646690-8964-49c8-bbed-556380844b14@nvidia.com> <CAPDyKFooYFVrzLEqOtwb02iyEf+c6qPB8+Us1--Y-oXbJVG+SQ@mail.gmail.com>
In-Reply-To: <CAPDyKFooYFVrzLEqOtwb02iyEf+c6qPB8+Us1--Y-oXbJVG+SQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 13:34:47 +0200
X-Gm-Features: Ac12FXw0mZPGQfTep1pMZhaIh1PE21HNet-YtWTUWTNvcL1vhGLnVaD4aB7xFiQ
Message-ID: <CAPDyKFq=6vZ4xbuduE9TvGB-NtCMpBKProYNRv-=c3cBZdTuPw@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] pmdomain: core: Leave powered-on genpds on until late_initcall_sync
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_043525_524001_D995575C 
X-CRM114-Status: GOOD (  53.08  )
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

On Tue, 15 Jul 2025 at 13:32, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 15 Jul 2025 at 12:28, Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> > Hi Ulf,
> >
> > On 10/07/2025 15:54, Ulf Hansson wrote:
> > > On Thu, 10 Jul 2025 at 14:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> > >>
> > >> On 01.07.2025 13:47, Ulf Hansson wrote:
> > >>> Powering-off a genpd that was on during boot, before all of its consumer
> > >>> devices have been probed, is certainly prone to problems.
> > >>>
> > >>> As a step to improve this situation, let's prevent these genpds from being
> > >>> powered-off until genpd_power_off_unused() gets called, which is a
> > >>> late_initcall_sync().
> > >>>
> > >>> Note that, this still doesn't guarantee that all the consumer devices has
> > >>> been probed before we allow to power-off the genpds. Yet, this should be a
> > >>> step in the right direction.
> > >>>
> > >>> Suggested-by: Saravana Kannan <saravanak@google.com>
> > >>> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> > >>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> > >>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > >>
> > >> This change has a side effect on some Exynos based boards, which have
> > >> display and bootloader is configured to setup a splash screen on it.
> > >> Since today's linux-next, those boards fails to boot, because of the
> > >> IOMMU page fault.
> > >
> > > Thanks for reporting, let's try to fix this as soon as possible then.
> > >
> > >>
> > >> This happens because the display controller is enabled and configured to
> > >> perform the scanout from the spash-screen buffer until the respective
> > >> driver will reset it in driver probe() function. This however doesn't
> > >> work with IOMMU, which is being probed earlier than the display
> > >> controller driver, what in turn causes IOMMU page fault once the IOMMU
> > >> driver gets attached. This worked before applying this patch, because
> > >> the power domain of display controller was simply turned off early
> > >> effectively reseting the display controller.
> > >
> > > I can certainly try to help to find a solution, but I believe I need
> > > some more details of what is happening.
> > >
> > > Perhaps you can point me to some relevant DTS file to start with?
> > >
> > >>
> > >> This has been discussed a bit recently:
> > >> https://lore.kernel.org/all/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org/
> > >> and I can add a workaround for this issue in the bootloaders of those
> > >> boards, but this is something that has to be somehow addressed in a
> > >> generic way.
> > >
> > > It kind of sounds like there is a missing power-domain not being
> > > described in DT for the IOMMU, but I might have understood the whole
> > > thing wrong.
> > >
> > > Let's see if we can work something out in the next few days, otherwise
> > > we need to find another way to let some genpds for these platforms to
> > > opt out from this new behaviour.
> >
> > Have you found any resolution for this? I have also noticed a boot
> > regression on one of our Tegra210 boards and bisect is pointing to this
> > commit. I don't see any particular crash, but a hang on boot.
>
> Thanks for reporting!
>
> For Exynos we opt-out from the behaviour by enforcing a sync_state of
> all PM domains upfront [1], which means before any devices get
> attached.
>
> Even if that defeats the purpose of the $subject series, this was one
> way forward that solved the problem. When the boot-ordering problem
> (that's how I understood the issue) for Exynos gets resolved, we
> should be able to drop the hack, at least that's the idea.
>
> >
> > If there is any debug we can enable to see which pmdomain is the problem
> > let me know.
>
> There aren't many debug prints in genpd that I think makes much sense
> to enable, but you can always give it a try. Since you are hanging,
> obviously you can't look at the genpd debugfs data...
>
> Note that, the interesting PM domains are those that are powered-on
> when calling pm_genpd_init(). As a start, I would add some debug
> prints in () to see which PM domains that are relevant to track.

/s/()/tegra_powergate_add()

> Potentially you could then try to power them off and register them
> accordingly with genpd. One by one, to see which of them is causing
> the problem.
>
> Another option could be to add a new genpd config flag
> (GENPD_FLAG_DONT_STAY_ON or something along those lines), that informs
> genpd to not set the genpd->stay_on in pm_genpd_init(). Then
> tegra_powergate_add() would have to set GENPD_FLAG_DONT_STAY_ON for
> those genpds that really need it.
>
> Kind regards
> Uffe
>
> [1]
> https://lore.kernel.org/all/20250711114719.189441-1-ulf.hansson@linaro.org/

