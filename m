Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B28FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoWBzW9sP/Ck4fVB57oesqdAkMALQ+sKkQQoIFfRS40=; b=fSAyvBf4KugYQE4HGrwmUDROGv
	LNIDy9cekQ3ct8UroH22ick82pvQML3/B89LHb9FdbB++f+bXL4P9L/XlXYngjKEg1+DNUxawLTLT
	vgjyoar0hv/e7RU/OqdjkAnASGplxqAkZN///iBd7W7ePz/pr9zovhUsyZA1RLo21Ut1kB25OWuWp
	FO3x/xoU7v88g8ibgoqRIyoGoc/cbCLdB2eTHtRrK5qRLKgo6fMmq7SYB8xH9m0nWo5XBN5bC34YX
	BV37yarXV8MdONx4m3P2SwqzWAICIvhv5Jsl4GCmWseAqjdcGWKYP0bPnskYIp+qeRBcxGuPJlaqr
	Sh7rfZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYEm-00000005vpJ-3CyO;
	Thu, 14 May 2026 15:44:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNYEl-00000005voj-2ma5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 15:44:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF4CE60132;
	Thu, 14 May 2026 15:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F46C2BCB3;
	Thu, 14 May 2026 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778773474;
	bh=CVhvSu6SkBppssOg7G5C2DGY9lLATzw7R1N/Bet/nzg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OfPF7T8Dkf57fQNYbdn1sJwBXS6alw7Q80vJL5FGwa2aKEx8wDyDBLGSLWsSEshsu
	 Pn1xToB2PgjjLwZO2moTMx3IQ4j/GJussxwCtDD3BhgSJIw9qfu2RGM+IePNiMOu2e
	 b6vVqN6As7QplUup4ak5gPy3O2D2Ri/ruJxq1IwnxJ9AhQbEid5RYXmOxbatN0RaNN
	 W1H0TaDNZRCTLaovQQpHLbMI1jg3QzHUmGuhEgud8dgNYV9Hs0EvuRl5J5EfZhn4vI
	 Rp+Orfxw6qDTq57H5bli8GIvbfV1OQQ7dubMPGcxe2pJGgTPJVECRXxLEo5s/InDVf
	 VsflAmexmcR7Q==
Date: Thu, 14 May 2026 16:44:22 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Linus Walleij
 <linusw@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, Guenter
 Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260514164422.0eba9a61@jic23-huawei>
In-Reply-To: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 13 May 2026 10:16:53 -0700
Alex Tran <alex.tran@oss.qualcomm.com> wrote:

> SCMI client drivers do not consistently log the number of supported
> entities discovered from firmware. This information is useful during
> debugging because it shows which domains or resources were exposed by
> firmware during probe.
> 
> Add logging of the number of supported entities to the SCMI cpufreq,
> pinctrl, reset, hwmon, and powercap client drivers after a successful
> probe. This aligns these drivers with the existing logging in the SCMI
> power and performance domain drivers.
> 
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
Hi Alex,

Just curious but why +CC linux-iio and IIO folk?

May be you had a false suggestion to add them from get maintainers.
If so be sure to check it's suggestions make sense!

Not to worry - we can all hit the delete button ;)

Jonathan


> ---
> Changes in v2:
> - Use dev_dbg instead of dev_info log level
> - Link to v1: https://lore.kernel.org/r/20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com
> 
> ---
> Alex Tran (5):
>       powercap: arm_scmi_powercap: Log number of powercap domains
>       cpufreq: scmi-cpufreq: Log number of perf domains
>       hwmon: scmi-hwmon: Log number of sensors
>       reset: reset-scmi: Log number of reset domains
>       pinctrl: pinctrl-scmi: Log number of pins, groups, functions
> 
>  drivers/cpufreq/scmi-cpufreq.c       |  5 ++++-
>  drivers/hwmon/scmi-hwmon.c           |  1 +
>  drivers/pinctrl/pinctrl-scmi.c       | 11 ++++++++++-
>  drivers/powercap/arm_scmi_powercap.c |  1 +
>  drivers/reset/reset-scmi.c           |  8 +++++++-
>  5 files changed, 23 insertions(+), 3 deletions(-)
> ---
> base-commit: 1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
> change-id: 20260509-scmi-client-probe-log-173cf85d5563
> 
> Best regards,


