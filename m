Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97118C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yAr2MMcQmJia94d0o/9946JSg1UMoz80UDiSt9zzs8=; b=gvHFq0Wje7khR6TriqFHmzKXqQ
	sTF+tcsl9kqaq6dhoJAmhnkZoKuDT16RjnA+TIg/PgxrjRTGoWZ/w+j078mRbwfXWQKSMVjThv1Ky
	sWu1QSlHGAiWdgKVC3JJWYgR5nUtP88CE5Ml6zpWPa2M5xknbu/0+EFZN+QUpR0XsHLGoRquFLCJG
	aXMQHT2M+8XxRJZhALURNSOv3KjExaF0yprW/1bJ5OZrmjTyPHHHe+5JqInN1ZwOrvSgfChr5coP0
	UNai+iyLWcjw6+CafbzMjHfef+gBVqF/eW1Z+QhBype6+Wpy3HAWz89nXLBO+E2L0/lzYxXFYRAZy
	GFBmGy2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxk5-00000005Sk9-1XTT;
	Tue, 11 Mar 2025 11:25:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxhh-00000005SOF-1mD1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:23:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6DFB152B;
	Tue, 11 Mar 2025 04:23:28 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D9EC73F673;
	Tue, 11 Mar 2025 04:23:14 -0700 (PDT)
Date: Tue, 11 Mar 2025 11:23:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	"Fabio Estevam" <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Sascha Hauer" <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z9AdICiyaCmzKh-N@bogus>
References: <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_042321_507257_3D873CAC 
X-CRM114-Status: GOOD (  12.19  )
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

On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> Based on linux-next, I added below node:
>
> +
> +               test@4f000000 {
> +                       compatible = "fsl,imx-test";
> +                       power-domains = <&scmi_devpd IMX95_PD_VPU>, <&scmi_perf IMX95_PERF_VPU>;
> +                       power-domain-names = "vpumix", "vpuperf";
> +               };
>
> I not write a driver for it, so just check devlink information from sysfs interface.
>
> From below sys directory, this test device takes scmi_dev.4 and scmi_dev.3 as supplier.
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# ls
> driver_override  of_node  subsystem                          supplier:scmi_protocol:scmi_dev.4  waiting_for_supplier
> modalias         power    supplier:scmi_protocol:scmi_dev.3  uevent
>
> Checking scmi_dev.4 below, it is scmi cpufreq, not the scmi perf device.
> scmi_dev.3 is correct, it is genpd.
>
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scmi_protocol/devices/scmi_dev.4/modalias
> scmi_dev.4:13:cpufreq
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000# cat /sys/bus/scmi_protocol/devices/scmi_dev.3/modalias
> scmi_dev.3:11:genpd
> root@imx95evk:/sys/bus/platform/devices/soc:test@4f000000#
>
>
> So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> created earlier and when device_add, the below logic makes the fwnode pointer points
> to scmi cpufreq device.
>         if (dev->fwnode && !dev->fwnode->dev) {
>                 dev->fwnode->dev = dev;
>                 fw_devlink_link_device(dev);
>         }
>

Thanks, looks like simple way to reproduce the issue. I will give it a try.

--
Regards,
Sudeep

