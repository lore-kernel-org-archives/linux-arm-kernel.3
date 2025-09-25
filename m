Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49897CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8gdJ7wKziz18TkLvoXgJuOhaMotEm6Z4D28IrFTO2s=; b=3YmxppFvvWJkqunhc8gWGaV0et
	Taa3ngNFQUvpsRN4B9jhp7X8P4AcKl7F/H+gDnDMAK0ja70FKSSGG2CUAsE2FOI6J1uSKhkRA9ybj
	/yKpZynqjthGzZz57NdQP6pBmWJ3mN3GbwdoBu6nzS3+9/08iyH2Gw6qS0jzBBrC8hcB3f7rkuEpQ
	HUzcEnV5G1kLYXWOkwLaOXjQrcKEdBDYY2KsfpiV/K8iwPlrOrwR677RyuFSgnvkclhZqAmDpSLaA
	azDHm6D8eOr3MXDn2FlHcxmckhbFg9TaVxkcvgIFyQBybTi1lhPth3kMqTNkN1150489mvjMlFemH
	f6Oc038A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uV5-0000000DanQ-371r;
	Thu, 25 Sep 2025 22:31:43 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1uV2-0000000DalT-3gwz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:31:42 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-59c662bd660so626855137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758839500; x=1759444300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8gdJ7wKziz18TkLvoXgJuOhaMotEm6Z4D28IrFTO2s=;
        b=o8EHSk2J4UYs/6bx2EPCNQFh556rt0v4e9eGTtFwHHlHqUCZnu6H3eQ+TeAgMMkLHm
         9LyQXDFEOvbsKgQwPzW9hg5Jt8cgHqVxAzXEk20oyFpCwlwMYZUWHNNRvdnRpHBSRjTR
         72D0c1KJ4Hdi1Ku782OEM4UN3W/dBGkFoNKQtxOurVCN21bccW0UHPx2xSvH/BFpdSlm
         DZp1Og32yfPv8BIQBI3BMjHGl2inwVMMTOWJqx8+BKVh9+No/XmOl2YGaAQQe1eB9prK
         U62Qf5NjPgnwZc7lx/gYUAFrzd4OsR30PnlDFMVyk8gimRjqAPoScZUFyGYqdCheHZFU
         kzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758839500; x=1759444300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8gdJ7wKziz18TkLvoXgJuOhaMotEm6Z4D28IrFTO2s=;
        b=s16I6/qqKN7HB73c1QywDwj7q68EtY+cscX0xbOYiF9nAz7hIxcaoDXtMaZnBWai7C
         xDpQSVrJOJxPLcnEeq6Zwb09M440KxEnvgn9fi0dtKJTd1O/xjMYyijNHcQihsPvDR8M
         TPyMakhR0QL3XMYAFeMhAfoobb65TLvEQiqLxpHLdkIznVpZk9BCmOHYJhyEmQCWXim9
         nmE0O8ZAmWw/me8zzcCDnmMu73cQg5R6BvN48VCyrCLiV+fB6bVXbodzsUhp5IiMS8XK
         s6UfRYYqZJxJ3x8O9v7LqwlDNEkvXSESM7T5sPwgvnqnVGi8DJnBg69NM9xynXNpMhPy
         FgHw==
X-Forwarded-Encrypted: i=1; AJvYcCWBQJPu/8JTPz54HCPKII9Deb0aph96XD4Ds1buqUlV4ZTtbKefruGj/AXrXDVuutNkFHvyWZ7/1mft+E5URDMM@lists.infradead.org
X-Gm-Message-State: AOJu0YxXbM0NmOooBLiYziDkOg55z+CYAbxEuZpyt/1m0HCmSUCXv5Gu
	G9YgUgmjbCt+8Gh0SEFREWvUK7h6Ytp9d3tM8iZ1rNY1ln2rjpma84H4Q1xp7jJggmRC8Eq5h0m
	KEFWMUjVEaP2k4kydzU7zAJRtHRdVJy5YKp1YynQd
X-Gm-Gg: ASbGncuBeD8xT2V4yU+vONpHzYWyyrqY1YAqR+3XIv1co1f/dDy4pem3xBlqnKIMBZy
	h2E2foqLW+0kIL3s+mUG44qF9KxtGPLTpwGnPcpSbAJQMsgmP+wyEV1A8WGcFbMBwdHsO5CVo4H
	MfTCg2mhqTMFkOqY7m9vW/8LOjwTCne49lN0GhYodYfyOXQVMeq7Jt62ikmp3NIfsIsxmBClR1w
	Lehn/h/cmdIRbGvsRHKUfn1CoAZ7rpoWdKDIMy3vONm
X-Google-Smtp-Source: AGHT+IFLlk6iDpEvaZjhHPcTDawfBx/XYJFVbUN5Hu8c0lEpBCCCVTWZi91ZCI4VwGOJE/tK3T8mihQAbe8ugPAiQBI=
X-Received: by 2002:a05:6102:5488:b0:5a2:8ace:c921 with SMTP id
 ada2fe7eead31-5acc4a1eaefmr2368837137.4.1758839499299; Thu, 25 Sep 2025
 15:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <20250701114733.636510-21-ulf.hansson@linaro.org> <4478f28b-47f8-4049-bf17-b7fc95cfac65@nvidia.com>
 <CAPDyKFqSyP3e=JRFYEuFefWVN5SYJWULU8SKzXmrThvyiVGXgg@mail.gmail.com>
 <a904d953-acb2-44f6-81bd-118f7abd22da@nvidia.com> <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
In-Reply-To: <614f726c-4d6d-463b-a8b3-26d3df590575@nvidia.com>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 25 Sep 2025 15:31:02 -0700
X-Gm-Features: AS18NWACHkwlAZcjEriaXRqurBvXndQI9uNxb7x206sV9Gbmg4UhlXtVn8x_XjM
Message-ID: <CAGETcx9CpOgtPSDK_qPRQ_u58w3fedSFAfFzugXW4eYq2TLECw@mail.gmail.com>
Subject: Re: [PATCH v3 20/24] pmdomain: core: Default to use
 of_genpd_sync_state() for genpd providers
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_153140_930011_61C6F3A6 
X-CRM114-Status: GOOD (  31.13  )
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

On Wed, Sep 24, 2025 at 4:41=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Ulf,
>
> On 03/09/2025 13:33, Jon Hunter wrote:
>
> ...
>
> >>> Following this change I am seeing the following warning on our Tegra1=
94
> >>> devices ...
> >>>
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to
> >>> 17000000.gpu
> >>>    WARNING KERN tegra-bpmp bpmp: sync_state() pending due to 3960000.=
cec
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
> > some of the above drivers are not yet upstreamed to mainline and so thi=
s
> > would be expected for now.
>
>
> I have been doing more testing and do see a lot of "tegra-bpmp bpmp:
> sync_state() pending due to" on our platforms for basically are driver
> that is built as a module.

It being "built as a module" is not reason enough for this warning to
happen though. One of the main points of fw_devlink is for things to
work just as well with modules.

In this particular system, do you never plan to load the modules? Or
is the module load just missing this timeout by a few seconds or
something?

If these can be turned off, why not turn these off using the sysfs
file or the timeout commandline option to turn them off? You are
burning power by leaving these on. A warning seems appropriate to me.

-Saravana

