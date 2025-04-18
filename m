Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D164C369C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 08:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7v6a64FwreaJA0pCAKVOqC5CViB7StYRn/BcrMkSKM=; b=i6acEYTS8xwIcwE2FV+kIjysYu
	fH8iFknwIP02IIXQ19xNZkaSenG6zciIbqk1QWkTSkyefNzFrFoZTK/oxr+kQ9G9X5K0CJcqtXHpr
	0HwnvsFz1buro8DJuViFxPYG3re3exG37RcTIucLWjtE9e3P1JuCw4qHXYqmXTjfcbhJpCJ1Ls9j0
	4vVpPY3vvsCukqZFCf0LQTrmI3o6jcsQ7ETdbPy75VYH/glzfawlRKOjHVtvvUHCH1G45XX3oqbqi
	n4PAe078wnGO0twYakhik24wg0IMLj+TSnfehWU9ma6N9T2VfNAIk0IABNwj39izHfvee+RMV/P1D
	yMZ4kfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5hFk-0000000Fe11-0uOk;
	Fri, 18 Apr 2025 08:39:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5got-0000000FaE5-2XUP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 08:11:32 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so2978977a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Apr 2025 01:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744963890; x=1745568690; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7v6a64FwreaJA0pCAKVOqC5CViB7StYRn/BcrMkSKM=;
        b=F3eQKHC7WiNBd/x1zagUviKiBVpdDCKalrTZnqALBx9L2mKwEDGgMRJVFi25GhEXY2
         WzRr7MB23WBRjW4tN3mRF+jjuyy1UtbLnONpvfVLwe14WeC9khWIBHT7WUZFYQFdwcfR
         paW2cZrvmKC8zfw4DgTmtN3rMyc7kmruCKGVMr5IYrR5Tw2jgQpnvyOMwE4JgRudjcZa
         IVQa90aUtcJQyUzw5VnTddkfQXbXtvxXF1ent1r+ghKp5rLciTu3FlPg2r20Z1Gx6AHw
         aDPgCIrMBH8bCrxuQ1tfGcbiVllWa2MzHfcJk77r/4Rwjl806qKN1/CfNT1kT4MLkPZd
         ilMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744963890; x=1745568690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7v6a64FwreaJA0pCAKVOqC5CViB7StYRn/BcrMkSKM=;
        b=kQTbQOYdw0JmXozRHpaKUNpwhDdBpddAHWt3BaGXa2ILkhhA3C6p3HYMJsdqTs831Z
         BWXCNpE4VujnS+AlvSch0hC/kwlzvQlmp8PBIQi8PBErUdp0l1jtyNbiPRV6XsisfjLz
         ykNxhKe6CibxXuaeYJBmFcQ7fGBZpGpPaadfMYqMZP09o5Qwv3vfUyuzQ4hf7my+IrCr
         Jw735GwsCJ5pdqBC1EgEkZNsovUCgoIabKU3lQupIFkErNk+bZOfWDJWTmxChwLG1wa6
         V/SrpD+3QkdLYLgscaoBD3SOb1oXbTA6pl/XojCOAv7bP8JeeLws2oIHNWMNk+fknGt+
         PcLw==
X-Forwarded-Encrypted: i=1; AJvYcCW+nqIAun2ItJnHh2TIRi/zHenZm6xR4GZfSDaDAxHCvJH9diKqWDz2muSwloAWj13xNbTxGs+UrjOOaUH/wqUm@lists.infradead.org
X-Gm-Message-State: AOJu0YwZof6pPWSfVEO1IxVoY3HRpaB9v1QlxcMRX79TuBi+vFghxZcq
	AUACvcvfjHPoSlqBaSeMa/F3Dr4sFN+Fuk9xxwL6XURHXWGAZgEjgs/nGSdx2hDBdIRegDra507
	dLLrAAGe2KaVIKG6uGITTHHDDeCTl46ThFAOC1B811ftO+T1nNg==
X-Gm-Gg: ASbGncsEi6ThmQxhz3DzGpD46G7/XXP+Q6kPE+lHRtg3blVKBV9NBZDaQKuE09IY9F+
	3jT2lMhnxSG7WSrYmUwsWYitNxZciFsDAtsiexLL0dzjrgN1LKXSq8qO0bI2vTV6o+attERjTwV
	V+0lsEf3oyx8hFLlFSvQbajUM/9q7r4nLh6+a+87wTM2jKGGQ=
X-Google-Smtp-Source: AGHT+IHUdZc5HDjrZYA8LWyh9msnR6W71lP04fz39bJlOI9JeLCz/9ra+wyxcFCuEbg77rntJwlmJg7XBKEi694wwtw=
X-Received: by 2002:a05:6512:1045:b0:545:2d4d:36de with SMTP id
 2adb3069b0e04-54d6e6352a2mr234675e87.31.1744937653242; Thu, 17 Apr 2025
 17:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 17 Apr 2025 17:53:36 -0700
X-Gm-Features: ATxdqUHzOUVh8E2tR73MoZ4FAVpBQN57AXnmN-9HADX6gA9CnvHoa6p8qDTye_I
Message-ID: <CAGETcx_=hEuOs09=gRe58+34PFa0bfsYoAK9kYOn90FP5nDjmw@mail.gmail.com>
Subject: Re: [PATCH 00/11] pmdomain: Add generic ->sync_state() support to genpd
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Johan Hovold <johan@kernel.org>, Maulik Shah <maulik.shah@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_011131_644959_7AAD94DB 
X-CRM114-Status: GOOD (  25.84  )
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

On Thu, Apr 17, 2025 at 7:25=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> If a PM domain (genpd) is powered-on during boot, there is probably a goo=
d
> reason for it. Therefore it's known to be a bad idea to allow such genpd =
to be
> powered-off before all of its consumer devices have been probed. This ser=
ies
> intends to fix this problem.
>
> We have been discussing these issues at LKML and at various Linux-confere=
nces
> in the past. I have therefore tried to include the people I can recall be=
ing
> involved, but I may have forgotten some (my apologies), feel free to loop=
 them
> in.
>
> A few notes:
> *)
> Even if this looks good, the last patch can't go in without some addition=
al
> changes to a couple of existing genpd provider drivers. Typically genpd p=
rovider
> drivers that implements ->sync_state() need to call of_genpd_sync_state()=
, but I
> will fix this asap, if we think the series makes sense.
>
> *)
> Patch 1 -> 3 are just preparatory cleanups.
>
> *)
> I have tested this with QEMU with a bunch of local test-drivers and DT no=
des.
> Let me know if you want me to share this code too.
>
>
> Please help review and test!
> Finally, a big thanks to Saravana for all the support!

You are welcome! Thank you for getting this series done! Happy to see
sync_state() support being added to another framework.

I skimmed the series and at a high level it looks right. Not too
familiar with power domain code, so I didn't go deep. Just reviewed
the fw_devlink and driver core parts of it.

-Saravana

>
> Kind regards
> Ulf Hansson
>
>
> Saravana Kannan (1):
>   driver core: Add dev_set_drv_sync_state()
>
> Ulf Hansson (10):
>   pmdomain: core: Convert genpd_power_off() to void
>   pmdomain: core: Simplify return statement in genpd_power_off()
>   pmdomain: core: Use genpd->opp_table to simplify error/remove path
>   pmdomain: core: Add a bus and a driver for genpd providers
>   pmdomain: core: Use device_set_node() to assign the fwnode too
>   pmdomain: core: Add the genpd->dev to the genpd provider bus
>   pmdomain: core: Export a common ->sync_state() helper for genpd
>     providers
>   pmdomain: core: Add internal ->sync_state() support for genpd
>     providers
>   pmdomain: core: Default to use of_genpd_sync_state() for genpd
>     providers
>   pmdomain: core: Leave powered-on genpds on until ->sync_state()
>
>  drivers/pmdomain/core.c   | 273 +++++++++++++++++++++++++++++++-------
>  include/linux/device.h    |  12 ++
>  include/linux/pm_domain.h |  11 ++
>  3 files changed, 249 insertions(+), 47 deletions(-)
>
> --
> 2.43.0
>

