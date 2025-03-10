Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D50C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oyWOJoYeq9jZSPxgQYVK080iqO70YfKJ6134fzkr864=; b=GPMNMWtQm10UG/A1hCxCH5yLbu
	03JWFAo2d1IkWOlv0Tp0O43+zqX8j3azq+aSVUd3dBp31PGm4Zse5q9GWGI0Ov/BUPVAEO/piRCaU
	FqYkkLICAjGUglImzvksOAcLVZqxvoU9PovrIlfICRxc8yjp4IDzDI4tBPXVfYThTTUNpsuyoJD75
	UPPJ5UqQh2RMOxdidptEB2+o42zCntoF0LaS2BtmbpCnRy5RnS2F5jGOIfNfhHt7AQXN9A/cADc7r
	uTKvhAfjeZMhiT/j/1U3KeiuqsG9FIHsqYyQMlJ2YJGULy7GWYiRcNpTHSGr1kboiNG0QZK5Y9hH7
	rZX9rhSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tregO-000000035yF-28sW;
	Mon, 10 Mar 2025 15:04:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trdOA-00000002pDa-2dJ2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 13:41:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4D4F26BC;
	Mon, 10 Mar 2025 06:42:01 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 462AC3F673;
	Mon, 10 Mar 2025 06:41:47 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:41:44 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z87sGF_jHKau_FMe@bogus>
References: <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z87UJdhiTWhssnbl@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_064150_765857_9B1D362F 
X-CRM114-Status: GOOD (  34.08  )
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

On Mon, Mar 10, 2025 at 11:59:33AM +0000, Sudeep Holla wrote:
> On Mon, Mar 10, 2025 at 10:45:44AM +0000, Peng Fan wrote:
> > > Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting
> > > fwnode for scmi cpufreq
> > > 
> > > On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
> > > >
> > > > Sorry, if I misunderstood.
> > > >
> > > > I will give a look on this and propose a RFC.
> > > >
> > > > DT maintainers may ask for a patchset including binding change and
> > > > driver changes to get a whole view on the compatible stuff.
> > > >
> > > > BTW, Cristian, Saravana if you have any objections/ideas or would
> > > take
> > > > on this effort, please let me know.
> > > >
> > > 
> > > Can you point me to the DTS with which you are seeing this issue ?
> > > I am trying to reproduce the issue but so far not successful. I did move
> > > to power-domains for CPUFreq on Juno. IIUC all we need is both
> > > cpufreq and performance genpd drivers in the kernel and then GPU
> > > using perf genpd fails with probe deferral right ? I need pointers to
> > > reproduce the issue so that I can check if what I have cooked up as a
> > > solution really works.
> >
> > This is in downstream tree:
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L2971
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L3043
> > https://github.com/nxp-imx/linux-imx/blob/lf-6.6.y/arch/arm64/boot/dts/freescale/imx95.dtsi#L80
> >
> > we are using "power-domains" property for cpu perf and gpu/vpu perf.
> >
> > If cpufreq.off=1 is set in bootargs, the vpu/gpu driver will defer probe.
> >
> 
> OK, does the probe of these drivers get called or they don't as the driver
> core doesn't allow that ? I just have a dummy driver for mali on Juno
> which just does dev_pm_domain_attach_list() in the probe and it seem to
> succeed even when cpufreq.off=1 is passed. I see scmi-cpufreq failing
> with -ENODEV as expected.
> 
> I need to follow the code and check if I can somehow reproduce. Also are
> you sure this is not with anything in the downstream code ? Also have you
> tried this with v6.14-rc* ? Are you sure all the fw_devlink code is backported
> in the tree you pointed me which is v6.6-stable ?
> 

I even tried the above branch, but no luck. The above is neither latest
stable version nor pure stable. It has few extra patches backported
though IIUC. Anyways any pointers to enable me to reproduce the issue
would be much appreciated.

-- 
Regards,
Sudeep

