Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF27C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=; b=b6Prn9Gn4eQyoHR0/kswLYDmkS
	gXcz+33BPjeGPLRV/JMQL+h8DmK3pShn0QibeOlXXm1uhHPZZKUv464dJLxZklzLPkI1ZIR0UqUXy
	SSYssd2E8RkShyXwmbSJJR9IwXhpCdfwovQLkkCkBExFmp1jLE6IcLVZ4AXuDNnT/s1TdcQ6v3ocw
	8eHVBcuwS8CAKuIYTvzQsiKGZvhfG87gTlWAtj3Y6QFbbGdO1HPiPnoKJh5cKgy98QLibR2AeLZxH
	QOnb7UlBOHUheDHDB7ZgMfUv1buiBZILQ3qlFmNbAjbVu3ojTzN6Q2SKfh9xsX5DPJv+pkjKEixUH
	iFYW2hlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LIZ-00000005k5u-02vJ;
	Mon, 28 Apr 2025 10:01:15 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LGa-00000005jt9-0JFB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 09:59:13 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e733cd55f9eso648452276.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 02:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745834350; x=1746439150; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=kqp4emIY174ysxvbFd5CR2P1CGBxEJU1FK3iXxKKe6f+pZCiv2NpOrAhkZv1+MzHS+
         oYKIW/8qrUFBcRcCCX+c45BY/v7XEXnNPC4t/G2n8zM3PGZ7dl3jCws3mwaUScvI+yQ5
         /Rj/iHGO9nLQf52kJCeSwCYE5sj1mRvvCjJUFTL7qsGTkcyhN/apydkODBAVv9ybjifS
         QYr3lVdN6boXY0NQFt+VheGyLGeNfLYAldWYvhm/AjZMUsjkhHU1qoC317AI19DBXJkB
         xQvx7e0olkh3egWj2tiTiW+aJCpwqjFaMlLjdSSZ8uWb5QInSfn72rsux5H7ojGGnkxK
         topw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834350; x=1746439150;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgHog5j3bHubplZHipHB2WxTh+7XYb3lCIW6vc6Lfpk=;
        b=vvzrJL/VkYDtc1S50+hVkuvZ6Fjjj70ZRZNQwaEhw78gwqp++60RwGfdnaX5XWzrlR
         kRA7PsRGT9e7lEWbIDb8upGGxvwJu0cXrssL086Mawimtwm87kzWsDNOyzOJui3a8cSr
         DZ4IVLh77SBKTCbFNpAykytNnAjosmm+Y//Zdtwgr9hwy1gVPU+QiF0idpvkxHQdTQsj
         lUzwFO1KtIgjHy78rmmB+bk+HE78r4F7ySmfv59NCfLzijwvppIHBLkRM6NKPrircytv
         X40BdIBdxk+X16wgolUs4mxgKamvNCIJsnKSvap480ABK50d6jEDNqiI+kWY5rypPO+C
         yoBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl2HWFf9/hqTPibgHuTVdDIZJxxIQjUH82kZ1F/7vdBnVRllMarSbvWzviHnrb/drKNUqUv2BkuHk8VBqPJp2S@lists.infradead.org
X-Gm-Message-State: AOJu0YwPpy71R+at7Poqy2CX84Fzl65K5u+tLoE3/60yZkbJOVh39e1n
	QLUgKBJUTZ4nGNPexfS0udWXS+Qqjn5JpoT5iwcMBHepfWhyruSrAnea992LXI/6jEhUf+gBwIj
	kASzd5R70r8NPK+29gS1nb4lGNpLaiYVWT0AbeQ==
X-Gm-Gg: ASbGncutSdfrvm082yKBFOR/NwJ3LRlhdSbTlSed455IaiTZHt6toJY6z5SAXOoomfC
	yWKeZ/31Xl9qR0eav8YikAW0kv/bQ6nimpKMvhBN6ex6ZPvaePmQlIvkQvdZx3bf2qYgUObXGNk
	1dMlpowhkvGHdt3QI3WneXZuk=
X-Google-Smtp-Source: AGHT+IGzqA988NBw7sdHyV2pa28mJrkNSc68Mx4LZTYc3yj0PJhv5acQ0zBwmMN9hv6uRI1W/EgLr/AniunkS+8k1Ek=
X-Received: by 2002:a05:6902:2e05:b0:e6d:f157:c601 with SMTP id
 3f1490d57ef6-e7316aa4b6cmr12912739276.17.1745834350357; Mon, 28 Apr 2025
 02:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250425111414.2522-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 28 Apr 2025 11:58:34 +0200
X-Gm-Features: ATxdqUESjgj-C7jn03RVVXo_02Q8tUEdsDkHYmNdSurwgrXAz3FKSyh0hhQHxd4
Message-ID: <CAPDyKFqxHd85DsUH6eZVyoocTDrvwNu+wTLRBq-jUwDY+2iFTg@mail.gmail.com>
Subject: Re: [PATCH 00/11] mmc: rename mmc_retune_* to mmc_host_retune_*
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-mmc@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ben Dooks <ben-linux@fluff.org>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>, Hu Ziji <huziji@marvell.com>, 
	imx@lists.linux.dev, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Viresh Kumar <vireshk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_025912_126654_FC9F5A14 
X-CRM114-Status: GOOD (  14.55  )
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

On Fri, 25 Apr 2025 at 13:14, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> As discussed previously[1], here is the next set of MMC core function
> renaming to indicate if an action is relevant for the host or for the
> card. Local build tests went fine, buildbots were happy too.
>
> [1] https://lore.kernel.org/r/CAPDyKFpsJpLre2bO9T7gsSthsta9f3JXoXTGZbjTjWVXH47gCw@mail.gmail.com
>
> Wolfram Sang (11):
>   mmc: rename mmc_retune_enable() to mmc_host_retune_enable()
>   mmc: rename mmc_retune_disable() to mmc_host_retune_disable()
>   mmc: rename mmc_retune_hold() to mmc_host_retune_hold()
>   mmc: rename mmc_retune_release() to mmc_host_retune_release()
>   mmc: rename mmc_retune() to mmc_host_retune()
>   mmc: rename mmc_retune_pause() to mmc_host_retune_pause()
>   mmc: rename mmc_retune_unpause() to mmc_host_retune_unpause()
>   mmc: rename mmc_retune_clear() to mmc_host_retune_clear()
>   mmc: rename mmc_retune_hold_now() to mmc_host_retune_hold_now()
>   mmc: rename mmc_retune_recheck() to mmc_host_retune_recheck()
>   mmc: rename mmc_retune_needed() to mmc_host_retune_needed()
>
>  drivers/mmc/core/block.c           | 16 +++++++-------
>  drivers/mmc/core/core.c            | 28 ++++++++++++------------
>  drivers/mmc/core/host.c            | 34 +++++++++++++++---------------
>  drivers/mmc/core/host.h            | 22 +++++++++----------
>  drivers/mmc/core/mmc.c             |  8 +++----
>  drivers/mmc/core/mmc_ops.c         | 12 +++++------
>  drivers/mmc/core/mmc_test.c        |  4 ++--
>  drivers/mmc/core/sdio.c            |  6 +++---
>  drivers/mmc/core/sdio_io.c         |  4 ++--
>  drivers/mmc/host/sdhci-acpi.c      |  4 ++--
>  drivers/mmc/host/sdhci-esdhc-imx.c |  6 +++---
>  drivers/mmc/host/sdhci-of-arasan.c |  2 +-
>  drivers/mmc/host/sdhci-of-at91.c   |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c  |  2 +-
>  drivers/mmc/host/sdhci-omap.c      |  2 +-
>  drivers/mmc/host/sdhci-pci-core.c  |  6 +++---
>  drivers/mmc/host/sdhci-pltfm.c     |  2 +-
>  drivers/mmc/host/sdhci-pxav3.c     |  4 ++--
>  drivers/mmc/host/sdhci-s3c.c       |  4 ++--
>  drivers/mmc/host/sdhci-spear.c     |  2 +-
>  drivers/mmc/host/sdhci-st.c        |  2 +-
>  drivers/mmc/host/sdhci-xenon.c     |  2 +-
>  drivers/mmc/host/sdhci.c           |  2 +-
>  drivers/mmc/host/sdhci_am654.c     |  2 +-
>  drivers/mmc/host/tmio_mmc_core.c   |  4 ++--
>  include/linux/mmc/host.h           |  2 +-
>  26 files changed, 92 insertions(+), 92 deletions(-)
>

Sorry if my suggestion was unclear. I only had the MMC_CAP|CAP2_*
related functions in mind. I think we should leave the mmc_retune*
functions as is as they are not "can" functions.

mmc_host_cmd23, mmc_host_done_complete, mmc_boot_partition_access,
mmc_host_uhs. All in drivers/mmc/core/host.h

According to your earlier renaming series, we should rename these function too:
mmc_host_can_cmd23, mmc_host_can_done_complete,
mmc_host_can_boot_partition, mmc_host_can_uhs

Does this make sense to you?

Kind regards
Uffe

