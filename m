Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nilE7uTgSMT2YbWFrd5UVjg90TJPQVzV3fTHvrJ5g9Q=; b=BpD4bUZni8jArI1XbUGFQhd3FJ
	wJotGOVBjI24XoNWJMGg0siaC6D9A1xMZ3I6arazZxj1c5KyZE5wRXsWixtnWZ2p38EN+jm4gncoo
	Q7GVMGNoiTkvHwo8E/5nZI+fBa+z3HFHpdH6XyB6b07qlN6NIbvrboh7ltsm9v0dm3qURZq6bbT+1
	vIQrLa7181m7UCLPLb8U9v+uTjsTx5hxPDgxHCyS1WVOflBgNafkL1b7uiFN/ndJumtP/9TwmzPWW
	7baRdYj78Gqzgc1mvob5yibR+zStSNAWQJionqp8zGcugf0xLo0whMkxmN9Vd0Uyim1rPFlzD4wdk
	oNVxXEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEse-0000000HZvU-0ixu;
	Thu, 18 Sep 2025 13:41:00 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzEsb-0000000HZvA-1tzo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 13:40:58 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IDegeo493090;
	Thu, 18 Sep 2025 08:40:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758202842;
	bh=nilE7uTgSMT2YbWFrd5UVjg90TJPQVzV3fTHvrJ5g9Q=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MFbMU4shPzOOyyPffN2117PkiSfS5+6xV4iCKozf8h/zi023q/OaB8HgpicPY3/OA
	 MMqoO9v9QqYMEeseYLjZ/rzwu6PpbAwO0f7VGVFXwap1ryREJUzyEnIW5jJu4WxzQ2
	 4dXH+0N0u1mUURA3voN8NbHY2f36H3tu5/DW+P68=
Received: from DLEE207.ent.ti.com (dlee207.ent.ti.com [157.170.170.95])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IDef4E2388304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Sep 2025 08:40:42 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Sep
 2025 08:40:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 08:40:41 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IDeeNc667154;
	Thu, 18 Sep 2025 08:40:41 -0500
Date: Thu, 18 Sep 2025 19:10:40 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael
 J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek
	<pavel@kernel.org>, Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Xu Yang <xu.yang_2@nxp.com>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <imx@lists.linux.dev>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] pmdomain: core: Introduce
 device_set/get_out_band_wakeup()
Message-ID: <20250918134039.zkpeqsbf6m2ymxvt@lcpd911>
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
 <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
 <20250918095950.h7wmz2qj5e6khtwr@lcpd911>
 <20250918131230.GD9196@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250918131230.GD9196@nxa18884-linux.ap.freescale.net>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_064057_583198_D6BDC623 
X-CRM114-Status: GOOD (  40.04  )
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

Hi Peng,

On Sep 18, 2025 at 21:12:30 +0800, Peng Fan wrote:
> Hi Dhruva,
> 
> On Thu, Sep 18, 2025 at 03:29:50PM +0530, Dhruva Gole wrote:
> >On Sep 02, 2025 at 11:33:00 +0800, Peng Fan wrote:
> >> For some cases, a device could still wakeup the system even if its power
> >> domain is in off state, because the device's wakeup hardware logic is
> >> in an always-on domain.
> >> 
> >> To support this case, introduce device_set/get_out_band_wakeup() to
> >> allow device drivers to control the behaviour in genpd for a device
> >> that is attached to it.
> >> 
> >
> >Thinking more into it, to me it seems like if the intent here is to only
> >allow the device drivers to figure out whether they should be or not be
> >executing the suspend/resume_noirqs then that can still be checked by
> >wisely using the device set_wakeup APIs in the driver itself.
> >
> >Not sure why this patch should be necessary for a
> >driver to execute the suspend_noirq or not. That decision can very well
> >be taken inside the driver's suspend resume_noirq hooks based on wakeup
> >capability and wake_enabled statuses.
> 
> I should join today's SCMI meeting, but something else caught me (:

It's alright, maybe see you in the next one ;)

> 
> Thanks for looking into this. 
> 
> In genpd_suspend_finish, genpd_sync_power_off will be called if
> "(device_awake_path(dev) && genpd_is_active_wakeup(genpd))" is false.
> So if the device is enabled wakeup, the genpd will not be turned off because
> the check return true.

Umm I think this device_awake_path stuff is only going to be true when
someone calls device_set_wakeup_path, I don't think it is going to
return true for a wakeup_capable device. I know all these "wakeup"
terminology and APIs have become all too confusing :( , so maybe Ulf can
correct me.
I maybe misremembering, but I have seen in some cases where a driver may
have marked itself wakeup_capable but the suspend hooks still do get
called... So your concern about genpd_sync_power_off not being called
due to wakeup capable device driver may not be valid... Again please
feel to correct me if I am wrong.

Did you also look at the wake IRQ stuff I mentioned?
In the path you're talking about it just checks
device_awake_path(dev) && genpd_is_active_wakeup(genpd)
However if the device irq is just marked as a wake IRQ, I don't think
that is checked anywhere in this path. So definitely if the IRQ of your
device is set as a wake IRQ, it will still get suspended and resumed as
usual and that's what you want right?


> 
> But to i.MX, if the device is configured as wakeup source, we still need to
> power off the power domain, because the device has out-of-band wakeup logic.
> 
> This patch is to make sure the power domain could be powered off in
> suspend flow and powered up in resume flow.
> 
> Thanks,
> Peng
> 
> >
> >Just a pseudo code:
> >```
> >driver_suspend_noirq () {
> >	if (device_may_wakeup()) {
> >		// do the sequence where the power domain might get turned off
> >		// but like you say device can do some out band wakeup
> >		return XXX;
> >	}
> >	// regular suspend sequence here... maybe inband wakeup config / clk
> >	// disable etc...
> >}
> > ```
> >
> >And something similar in resume_noirq?
> >
> >Just need to make sure that the probe func does the
> >device_set_wakeup_enable or capable stuff correctly as per your H/w and
> >wakeup requirements...
> >
> >
> >-- 
> >Best regards,
> >Dhruva Gole
> >Texas Instruments Incorporated

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

