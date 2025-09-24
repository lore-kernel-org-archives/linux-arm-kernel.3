Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB263CAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ws36E4l6sDZ0NgTD31F0HXvzlU5qFwYdqyOPAZNL3c=; b=iAqOhZ/RJGX1dVBMdKzGiZYJ4m
	nmJ+85oTjKiV4FpIOn6br7LQ4LgN3CvTse6tqyJ9ghUh1AMh55UNhL7GMLPdbK6l+Sm7/3uOpyfDB
	0b+r7Y1PMxIhKxcLImBV5AL47Q2ro1smrzkVJ69XRBvTFVQtsy4fEmi0pvyUYEAj72x/hj2e93Cei
	t5wySghhaAXiiUBIXpLwdoe6uNa8q97Z15ZeS4u24P4bXJ7Fhvx8Nzw9tC0t063jEbIAIuT0hXBIF
	d8HceHoszRO1jRo+L8qys/biEgEGlxdJ4HrLFTz715Do1FjCU8YtsMjdqdIcpnfTmuD93Z51wsW5v
	AHoXSTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RoU-00000001Syo-1JrV;
	Wed, 24 Sep 2025 15:53:50 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RoS-00000001Sx4-23ug
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:53:49 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-eaf8e473ddcso1125721276.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758729227; x=1759334027; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ws36E4l6sDZ0NgTD31F0HXvzlU5qFwYdqyOPAZNL3c=;
        b=E8AJIDTTql/HXs+2DJLM6/F7ylyatEoYnVpPbQNYJ0YFMiKDb0hGMHYQXRg71MDSJh
         v4U7FRUw4cbt1wkcrybJ29CNWdpSn4hkyZ6t+Z4DotveugRwwkjmXHkSrw9+jXkbnXuZ
         1Rtla/nwAyi6Pn/5z6dOiE/nZsv62vnGyiBdyFngAqbct2dAJ59Rwdd5mqtsqlJcUvqJ
         vFHxtXfJ2MZt4GyXFIM43Aud2L3Qm4BGpjEUPOw6xxUr74EjGi+MAoUqGRM8CaSe3y/R
         eBE2bU4RvWkY1lgf6YSvBddQZJe3HtK5nw4BywGLJXxoJ7ZV49EPtAXysqg72XsXYTmU
         9dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729227; x=1759334027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ws36E4l6sDZ0NgTD31F0HXvzlU5qFwYdqyOPAZNL3c=;
        b=qjkDr+LtqXR204rb9ywrnkcoDVYYbYI48hZSPPTQd8Hz341cBjYitZ1aPYpyteIdJQ
         aI0bYHeSGr+CUJTRmbSSFC/uj22NO/shM6P09cEq4yDWnMgp5izaawGJgOiEcV3g0sGi
         0W+hYRgeCsbrZvUsEMLfDSWDhCpABBw+Wfc9aVfJeWfre857BR6zu2GhwGot6eJQKlJu
         rTTj50D7mgCmkVjQZ7nq50cIupgmz5F8aTZfBBGK+L6pGkD7kXcSZpHOHN7G+Pyaikh7
         R7fh4xdWWbEAg9pNXdlhl4g9ARW4lWTGc/jhubj3EmQbSebj8ZVH94Dmg3OZtTW5u/J2
         4rKw==
X-Forwarded-Encrypted: i=1; AJvYcCUqqNQLuBqMw4ipWzggGz5C+1KYM0WRqqSzEMopwKL8BnozNfCVBb+l+jcgNCpR2OA+drSUcbsAliS+31FxCjdr@lists.infradead.org
X-Gm-Message-State: AOJu0YwSQdj8vcVc6dPWPUVjLNXRD+7RUROPfchZIj6FEjwj3Wj2MQIV
	qt8Z8hCV1p1c5TjbFhv7ELAlzqIKAqnLcTp7aqiQZMrrkLdDFeQokKs0SMGEOZVBxXoP9e3OWJ7
	gj4fLIFb/5ZpAq2E7Z884xVUogjadylJfLsBpk4uORQ==
X-Gm-Gg: ASbGncuI2nJh3khYGHSHKhXkszjqdogq9B2/0PdkllU6Oqr47rkzIKXNfJpaNNzUNSs
	7o8JyNsnOf4dC5rW55tYkhjYjDsPtwg3ennuyJBh+aiqIo9uuV49w0x/WKKSjCX/pNGDDAiF1SD
	IUuIL9mSOrRm59a1S8ILa8vy4kDW4rZVZyfB1drc/lTabDYW85+xCenzF7Xdlgg3R8QW8fTtTCN
	S7uV5AWkcGgDT4n7nr5maucE36GitfnVB8eVg==
X-Google-Smtp-Source: AGHT+IG/0HOlWN+Opy8mk1rlXCX6lREWcCWPZFITT3xAhxjSLe4cF9GNTsFZhuk9Ow8vzBprt7QptbBAX/tQMBdgAFw=
X-Received: by 2002:a05:690e:1648:b0:633:b317:9cea with SMTP id
 956f58d0204a3-6361a90013cmr66977d50.8.1758729226717; Wed, 24 Sep 2025
 08:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
 <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
 <a904d953-acb2-44f6-81bd-118f7abd22da@nvidia.com> <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
In-Reply-To: <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 24 Sep 2025 17:53:11 +0200
X-Gm-Features: AS18NWBv34Nq6YjDF4uwQFfPTxm1VXqbNiERHa_duVzXNf8ehBq83NeR0ORga00
Message-ID: <CAPDyKFoPOejFT+=OBoLTBXj5GYuHFwwnY9qGROTynrtHT=mCAw@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20250924_085348_545691_9D37B960 
X-CRM114-Status: GOOD (  30.17  )
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

On Wed, 24 Sept 2025 at 13:41, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ulf,
>
> On 03/09/2025 13:33, Jon Hunter wrote:
>
> ...
>
> >>> Following this change I am seeing the following warning on our Tegra194
> >>> devices ...
> >>>
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 17000000.gpu
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 3960000.cec
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 15380000.nvjpg
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 154c0000.nvenc
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 15a80000.nvenc
> >>>
> >>> Per your change [0], the 'GENPD_FLAG_NO_SYNC_STATE' is set for Tegra
> >>> and so should Tegra be using of_genpd_sync_state() by default?
> >>
> >> This is a different power-domain provider (bpmp) in
> >> drivers/firmware/tegra/bpmp.c and
> >> drivers/pmdomain/tegra/powergate-bpmp.c.
> >>
> >> For the bpmp we don't need GENPD_FLAG_NO_SYNC_STATE, as the
> >> power-domain provider is described along with the
> >> "nvidia,tegra186-bpmp" compatible string. In the other case
> >> (drivers/soc/tegra/pmc.c) the "core-domain" and "powergates" are
> >> described through child-nodes, while ->sync_state() is managed by the
> >> parent-device-node.
> >>
> >> In the bpmp case there is no ->sync_state() callback assigned, which
> >> means genpd decides to assign a default one.
> >>
> >> The reason for the warnings above is because we are still waiting for
> >> those devices to be probed, hence the ->sync_state() callback is still
> >> waiting to be invoked. Enforcing ->sync_state() callback to be invoked
> >> can be done via user-space if that is needed.
> >>
> >> Did that make sense?
> >
> > Sorry for the delay, I was on vacation. Yes makes sense and drivers for
> > some of the above drivers are not yet upstreamed to mainline and so this
> > would be expected for now.
>
>
> I have been doing more testing and do see a lot of "tegra-bpmp bpmp:
> sync_state() pending due to" on our platforms for basically are driver
> that is built as a module. It seems a bit noisy given that these do
> eventually probe OK. I am wondering if this should be more of a
> dev_info() or dev_dbg() print?

Yes, I agree. We have had similar reports for other platforms too.

I intend to send a patch for this in the next day or so.

Kind regards
Uffe

