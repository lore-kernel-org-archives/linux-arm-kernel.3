Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D24C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 12:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=; b=rtQf7mquZv5ZRDK4pMnINImFSE
	+zcF/kBjeDNcwMAm6pLI2QzuzfHuKaY262sdO5wn7aNbnWvQqk4e33+rYQ1lI+z6tXdJtW2qJd5jS
	y6iUScdlfpoeZ97DxN/FWoEJ4DKD3xGuxJ1mwgmPBBhvYDXrPZNmEyjMCyxXdp9Izk0BWYvakL3zM
	dv57jbwZJy0V/Afs7iPJ6Wm2pp1LDtG73vQKOPcCEFDVBx3X1jvUsPP+wfPx7Aaxt0shlRtQbMz2f
	PkP2ibniAGCP4v4ZUtT2PeBtLU9SxZxZrC/Ic2UGb6t+LltuhWw+nZV9TcBDkycNlPzSYxm5AE5W4
	LxsnZJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQW1-0000000AtNZ-1Epa;
	Tue, 03 Jun 2025 12:13:13 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMQSm-0000000At69-1wJX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 12:09:53 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-70b4e497d96so53167097b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 05:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748952591; x=1749557391; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=DV7Oad6HgnfupUGaigtZf/Ovry5+zQegvSTylJaV9xWI+EUvAmPVyc0d59jw7mMcUw
         vQtMOXJhq05qz/95GsroePeebJxQ+WGWKwzmiIAQja8lCEzo5CA/Sn4mGlI1CmuGzKxw
         UkrOvk7v8nQ/NEiSiFsF2P1aE69iP0GqwzFRyPa/8RezJiySTNO7K+ht2fnL14yZPkQD
         IZki79LNM4j2sx04dd+53rrANle9OWggO06Yt4RthEcL3UWzbGBTHGbZYh+qiPMR+KZU
         WyGB0q2VKAaQthUXwzHXv/hRUAOoLZp3C0JrK3V+RQ3l6JfEHcInTlkqdHRzLWj7FHx7
         FC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748952591; x=1749557391;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkgkfx1ZHJ5WRXN3wk71OJao3glFFdhvQiWlOBbCHtw=;
        b=lVdDsmHNnfDR3o40FNAsX+/1UwaeBPKV1e/z71lom9i5Da2JtBQw9aNeKHbYrrj41A
         p1d5tkM5EXZTnwYokzQ0B97/bjvsrVuh0QTQSstrbC2ngVWdS8R6tm7xhaDXIA2ZeSV+
         nWIzMfdNXSEc81B7e6XLIc9qgl+3KApfY/9A3BRs/NWiIIf2jb1WtrD34oa3PTIGRUZT
         ISDy7ILIi3oijou9cb+1zn16jpx05UUPMzpd/dYKxfWcqySIAI5bg4oA41lOOa5eJsCf
         hda/dYYRS1lky738S/BGke7bkFUx73a3XJAWb0qmUAUbTddvozl/25gN09Yvm1TYJ25W
         +91g==
X-Forwarded-Encrypted: i=1; AJvYcCWe6O6Hw0y/gnesUNDqLtA1ndFdDn8thl7cfevi6msXyj6S2Lh4JtB/RBIYcLV7gO3IjyYs+DSdcZqCHn+itNhw@lists.infradead.org
X-Gm-Message-State: AOJu0YxDfYGj3UT3LjlbMsm56L6UTe21tt3OZuO+DXy7MJfBtRSQg5Y/
	qf8eLkVqTx1K0q3cxK5vgftwAkIuD9EcbJqyYEoZHpBuArelDz9S72xL3fFVmZZsHR76Yg6SYqP
	LYdLHZp5Exmi8KILgUvE6yDqemF2Bae3vfcV7etfECg==
X-Gm-Gg: ASbGncskxEt1x7TCE8Tt8pSfz4GNhLgMgUE69N0k5wO663fcpW0XHmCXalksIPrUOX3
	ZhTh+xrbo3KlswzhEuQdLLOQVxCWz3P77FGIMbEtoMJelwOyM+0rMiLbpr3nJTLQyYMbr3OVsbP
	2QQDzvlOZiibQGfXSaROWjm7sOceYTsrFp7mNsp20CueQ=
X-Google-Smtp-Source: AGHT+IEBu6kRLR+QihKU16+LErg47sPGw3yJ9MbHWp+STBlEAPmBRdPA2kKSotqf4d+nhihTdrEqxcQCav79Y/SEImk=
X-Received: by 2002:a05:690c:6888:b0:70e:923:2173 with SMTP id
 00721157ae682-71097c2a76fmr158597817b3.5.1748952591135; Tue, 03 Jun 2025
 05:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250602131906.25751-1-hiagofranco@gmail.com>
In-Reply-To: <20250602131906.25751-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Jun 2025 14:09:14 +0200
X-Gm-Features: AX0GCFuMy0nMLljWiQ8PZlmv65MxrymGJ77Eb8A4CZbrmvODDSNF3Eq2H4oVdUw
Message-ID: <CAPDyKFrUAF5oWkyc3mLf0+R9VAypBotNyR4B5Chr3KQFYJOjbw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_050952_504291_224C2333 
X-CRM114-Status: GOOD (  22.56  )
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

On Mon, 2 Jun 2025 at 15:19, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under review,
> "pmdomain: Add generic ->sync_state() support to genpd" [1]. Without them,
> this series is not going to work.
>
> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is already
> powered on, the driver will attach to it.
>
> Finally, the imx_rproc_clk_enable() function was also changed to make it
> return before dev_clk_get() is called, as it currently generates an SCU
> fault reset if the remote core is already running and the kernel tries
> to enable the clock again. These changes are a follow up from a v1 sent
> to imx_rproc [2] and from a reported regression [3].
>
> [1] https://lore.kernel.org/all/20250523134025.75130-1-ulf.hansson@linaro.org/
> [2] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
> [3] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/
>
> v4:
> - dev_pm_genpd_is_on() introduced to drivers/pmdomain/core.c
> - imx_rproc.c updated to use the generic power domains instead of the
>   SCU API call, which depends on Ulf's patch series.
>
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
>
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
>
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 27 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 33 ++++++++++++++++++++++++++-------
>  include/linux/pm_domain.h      |  6 ++++++
>  3 files changed, 59 insertions(+), 7 deletions(-)
>

We are awaiting further feedback on the other series [1]. As you have
tested it, may I add your tested-by tag for it? Or perhaps if you can
send a reply to the cover-letter for it?

Anyway, for $subject series:
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

