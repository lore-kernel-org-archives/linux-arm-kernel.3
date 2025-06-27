Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826ACC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 15:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=; b=KJZSMkdlKlLm+EBvoHc29fL3Ca
	AZRsWyY4yjJVS49J3sxODXx8tzx6IV2Ng+RgNy/ZwuL6gSq6s0KYrJNTe7w1skPtdf7cIMHSijRKp
	dNRQFWOWLn6u2BiPreQcu2NS8Hf4Fqtfme4TJOk5aDHa4IRK9aeUgLCe/beqwYLuLTZQdaHiXG2jE
	R+TTOVufEykoFCC60jRDCuPJPRQBvbfOHccraVS0v/5ZjWhAT2XsH3djw8fPGYdiaCmeMSahVK7dG
	gVjp3fIv0z/JQPBMOb6/E24WotaSvxLdqn8RHu4s5IVohGj5OqQsUfYpRSs160karjg6ZGNdo2In8
	hJ4+obcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAfQ-0000000F0aZ-03sF;
	Fri, 27 Jun 2025 15:07:04 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVA73-0000000Ev8I-2PrX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 14:31:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-607434e1821so3210997a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 07:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751034691; x=1751639491; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=KJlXp6wG0ws0ufKyWQMyF41XmvPV8gLzaPC1d+4wDzSjbfAKugUhIHEFDaIDXUGjl1
         K4HvN8h+vF5TOO49MgkXHQqDr7PLhXjiJb1pNYUlSiU+4N4p4QUeQgMO3zDZtNnBoYe9
         FYagR37qfvBoFtKH3x7hRmCw+q2Z9BNEb9hrjh/R4yLT940gkseVw3t4bKcr0qvvcOdI
         iV6S+sRf+h9XD6uDGtG5UiJGkuWSkWJvh2qcAzjimwgsHTtnUhV3bNBwRfDFMfwGAMCA
         sNfXen2EoYY5vwFs4xuC8ESgaii8WDRq0sV4G0qRGYURupK8n+hvMrvFkNFPCcpBrJsU
         U8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034691; x=1751639491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8o5xo7GeehPDbRd+X/7D8FpirwN/TZkXVzx9zL2sssc=;
        b=WaZSRCStYkgHao1D5CHc6ZEgOP1gPEyONs2Euc9YnffEmQgrRGZgu18tsU2UeivIvB
         XF40N4vqJD4Unhud8+UnJeBZk2viAl18413mMqJYG9upFAfElEjCHWqRboK7VbRvNTdF
         I0H9Sbq/3l0Nw+slS3tBxjdRx8FfD5iIc/dtNBw/c4MgjXOzS8+FjqptYu7IeGBPWbti
         bNOelgp68UUk65Q4xFol34ouynsoszl9oCNNDhgJloVd0ZbkQk1J+KHHn880rxdNl2Jj
         DGLLH6fJ7B67sEXBk8In2vyBhOABEXjx/4QWRk5HB4/J+g11TL8egQbeWpT+zgxYu/jq
         AlFw==
X-Forwarded-Encrypted: i=1; AJvYcCVLQyVFtdPcRZg7F5RYASKpT/rx/1FsjT3FdWBZDc6vx6S2uf3ofqIZ24AiOZjG/jkxPHaS9bUiY8eUD9NvArK1@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQFCBjNovXetp318btE4K/uJrDU463hm+/lIzJf6SHcYbAwOY
	14zLera/eXg17Gn/xqxBhhuicwBCwQrTGYtmQ2GA3mCwmcq1t6/uT1tthoWJrI2bvOvqDVJhXJK
	FB/1jzAuMEqxFbhrhzBVwF890JSozG9cGuldJtNQq5g==
X-Gm-Gg: ASbGncthXma1XBCK9KUttvGUVnJ717DA7PLmDZp0UrXlgOtVzShdCtvjnb3/ldnfOLN
	2v0+nAV8DBYWVhaK4AFu3WnrkB1h883W5PLovchMQxjp4q65jGEREo6fbXhzyUTcDW34nWSOtc0
	7XYe652A5UAXqo+F8bT0KyIVuLl6Kj6cZDOC62jic0OsK8e8xXt18rg+pY5NvwAfP9QtmSg8R9N
	q19aA==
X-Google-Smtp-Source: AGHT+IEL785XIeur6WCbc2OIj5nk/sVLVVNkV3GZ+ObEePJ/qNpPBLIGoWwmBJBgA18YqNdBbv+6Y6RgOuBSpzWsw/4=
X-Received: by 2002:a05:6402:5bc4:b0:607:eeb1:b18b with SMTP id
 4fb4d7f45d1cf-60c88d9c37dmr2283943a12.8.1751034691378; Fri, 27 Jun 2025
 07:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250626215911.5992-1-hiagofranco@gmail.com>
In-Reply-To: <20250626215911.5992-1-hiagofranco@gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 27 Jun 2025 08:31:20 -0600
X-Gm-Features: Ac12FXyLrcISUGMKifq1LXY0djWn87ywvC4vhLqatRfOsnXR-16wTizuirmCxWY
Message-ID: <CANLsYkzo32BHkxRzSLY1U_PcidMPOaz7xZjDs8HKtTCQ0ZpF=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] remoteproc: imx_rproc: allow attaching to running
 core kicked by the bootloader
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@oss.nxp.com>, daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_073133_624757_CA834BFD 
X-CRM114-Status: GOOD (  22.67  )
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

On Thu, 26 Jun 2025 at 15:59, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> This patch series depends on Ulf's patches that are currently under
> review, "pmdomain: Add generic ->sync_state() support to genpd" [1].
> Without them, this series is not going to work.
>

I thought we agreed to repost when the feature referred to above and
the work in drivers/pmdomain/core.c will be merge.  I'm not sure what
to do with this patchset.

> For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
> started by the bootloader and the M core and A core are in the same
> partition, the driver is not capable to detect the remote core and
> report the correct state of it.
>
> This patch series implement a new function, dev_pm_genpd_is_on(), which
> returns the power status of a given power domain (M core power domains
> IMX_SC_R_M4_0_PID0 and IMX_SC_R_M4_0_MU_1A in this case). If it is
> already powered on, the driver will attach to it.
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
> v6:
> - Added "reviewed by" from Ulf and Bjorn.
> - Fixed and improved commit descriptions of patches 2 and 3.
> - Improved the comment inside imx_rproc.c file.
> v5:
> - https://lore.kernel.org/all/20250617193450.183889-1-hiagofranco@gmail.com/
> v4:
> - https://lore.kernel.org/lkml/20250602131906.25751-1-hiagofranco@gmail.com/
> v3:
> - https://lore.kernel.org/all/20250519171514.61974-1-hiagofranco@gmail.com/
> v2:
> - https://lore.kernel.org/lkml/20250507160056.11876-1-hiagofranco@gmail.com/
> v1:
> - https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/
>
> Hiago De Franco (3):
>   pmdomain: core: introduce dev_pm_genpd_is_on()
>   remoteproc: imx_rproc: skip clock enable when M-core is managed by the
>     SCU
>   remoteproc: imx_rproc: detect and attach to pre-booted remote cores
>
>  drivers/pmdomain/core.c        | 33 +++++++++++++++++++++++++++
>  drivers/remoteproc/imx_rproc.c | 41 ++++++++++++++++++++++++++++------
>  include/linux/pm_domain.h      |  6 +++++
>  3 files changed, 73 insertions(+), 7 deletions(-)
>
> --
> 2.39.5
>

