Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03265C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2i9OfWhFsb2+5+k8slLvVoZxYDFLVwBTXpo2u65vVw=; b=MSz26Dj2eyQ11RpqfB0spk/9l9
	nhuIVZ1JudDvDnWafMl9oBnETU/+xMeb5NZhOTeH1MIiEgYPJgoCythFG+7DEMkSJJIobkFgdpDwK
	FAr+95XouZ53KIw3mwHs0ZRCxYMcob/Cvj9FBdwmZgjViSmKseceIS1e30Dh6D8MXPWZCOaHIko/q
	A8Zv/70NmSdoJfdDKCraVx4rkF3jszyKNkrC8/wI00xZbIlrnfI+ewaD27+Lm5a4I3H+eEofQrQm7
	febTo3czlQr57/Rvx3vzY/vo6tiz5V321PAOwKrqB+LnIm8sapHCokVgGNtEpJzpMjApe4Xy1EVfS
	MDE90vyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAUp-000000075lc-1S4H;
	Wed, 12 Feb 2025 11:01:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAI2-000000072to-3WBf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:48:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DC6512FC;
	Wed, 12 Feb 2025 02:48:43 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 714193F6A8;
	Wed, 12 Feb 2025 02:48:19 -0800 (PST)
Date: Wed, 12 Feb 2025 10:48:16 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z6x8cNyDt8rJ73_B@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212070120.GD15796@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024822_919529_CC2D8B07 
X-CRM114-Status: GOOD (  22.44  )
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

On Wed, Feb 12, 2025 at 03:01:20PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 05:13:21PM +0000, Sudeep Holla wrote:
> >On Wed, Dec 25, 2024 at 04:20:44PM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> Two drivers scmi_cpufreq.c and scmi_perf_domain.c both use
> >> SCMI_PROTCOL_PERF protocol, but with different name, so two scmi devices
> >> will be created. But the fwnode->dev could only point to one device.
> >> 
> >> If scmi cpufreq device created earlier, the fwnode->dev will point to
> >> the scmi cpufreq device. Then the fw_devlink will link performance
> >> domain user device(consumer) to the scmi cpufreq device(supplier).
> >> But actually the performance domain user device, such as GPU, should use
> >> the scmi perf device as supplier. Also if 'cpufreq.off=1' in bootargs,
> >> the GPU driver will defer probe always, because of the scmi cpufreq
> >> device not ready.
> >> 
> >> Because for cpufreq, no need use fw_devlink. So bypass setting fwnode
> >> for scmi cpufreq device.
> >>
> >
> >Not 100% sure if above is correct. See:
> >
> >Commit 8410e7f3b31e ("cpufreq: scmi: Fix OPP addition failure with a dummy clock provider")
> >
> >Am I missing something ?
> 
> Could we update juno-scmi.dtsi to use ?
> 
>  &A53_0 {
> -       clocks = <&scmi_dvfs 1>;
> +       power-domains = <&scmi_perf x>;
> +       power-domain-names = "perf";
>  };
>

We can, but I retained it so that the clocks property support can be still
validated until it is removed. I think there are few downstream users of
it. It is not just the DTS files you need to look at when dealing with
such things. It is the bindings that matter. Until bindings are not
deprecated and made obsolete, support must exist even if you modify the
only user in the upstream DT.

--
Regards,
Sudeep

