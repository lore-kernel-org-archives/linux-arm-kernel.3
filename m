Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8269CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 10:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38CN86+v/N3yFeHrI8mpeV2lMrT0UcLaFt3ugTYePww=; b=R2FkZTJz86kr0IVnu1QWErXdpW
	71HzwduxumG/1hyc1JSNNyPh19ruuqkI5BecRcio78M8WFdL8KCKYjPI4elcrrqK7ExvdffVFCnEy
	Sg0SsarYsq0I7dkeT5D/DtVa5TQVkxwkoWuqFpUEhUbIRW2LkukWn+PzsDGlZ+sUZ58Q8ZqTKIOZQ
	Su93/IPY6gsPL2s+GDv0dQ6mhSIW+zlXplHk5mZ+zsPnOOCTrjeSsSZBibPwpVPBrs+2cphQqp8XR
	DFgBn/RbUArcY00pCfdCgmaHhnZ6+48cSkolQTW8/Tu3v8Wtg+uI5RMgNMHMrBipXcOwRjjMoWinN
	tgVE6RgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBQq-0000000GxJy-28Z8;
	Thu, 18 Sep 2025 10:00:04 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzBQn-0000000GxJL-2Ge4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 10:00:02 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58I9xqX71721643;
	Thu, 18 Sep 2025 04:59:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758189592;
	bh=38CN86+v/N3yFeHrI8mpeV2lMrT0UcLaFt3ugTYePww=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tsgj5salexCwGPpZCXDQDFIU1+Hr0BUPeO100cAx0k7uv3bkMyqjLbtZfon1aGGY3
	 vZxWPSG+FkIFsunHQRfvFwJ3gDfKIN/qIduzHHRcPi8limvOKOu3QZa5mzYqTx9MhC
	 15bPn/eNvj+Gj96Smuc0Ig7TRDH7LE1COliYUPp4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58I9xqTX1465831
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 04:59:52 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 04:59:52 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 04:59:52 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58I9xoAl683748;
	Thu, 18 Sep 2025 04:59:51 -0500
Date: Thu, 18 Sep 2025 15:29:50 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Peng Fan <peng.fan@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki"
	<rafael@kernel.org>, Len Brown <lenb@kernel.org>,
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
Message-ID: <20250918095950.h7wmz2qj5e6khtwr@lcpd911>
References: <20250902-pm-v3-0-ffadbb454cdc@nxp.com>
 <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250902-pm-v3-1-ffadbb454cdc@nxp.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_030001_777539_12BEDF26 
X-CRM114-Status: GOOD (  17.51  )
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

On Sep 02, 2025 at 11:33:00 +0800, Peng Fan wrote:
> For some cases, a device could still wakeup the system even if its power
> domain is in off state, because the device's wakeup hardware logic is
> in an always-on domain.
> 
> To support this case, introduce device_set/get_out_band_wakeup() to
> allow device drivers to control the behaviour in genpd for a device
> that is attached to it.
> 

Thinking more into it, to me it seems like if the intent here is to only
allow the device drivers to figure out whether they should be or not be
executing the suspend/resume_noirqs then that can still be checked by
wisely using the device set_wakeup APIs in the driver itself.

Not sure why this patch should be necessary for a
driver to execute the suspend_noirq or not. That decision can very well
be taken inside the driver's suspend resume_noirq hooks based on wakeup
capability and wake_enabled statuses.

Just a pseudo code:
```
driver_suspend_noirq () {
	if (device_may_wakeup()) {
		// do the sequence where the power domain might get turned off
		// but like you say device can do some out band wakeup
		return XXX;
	}
	// regular suspend sequence here... maybe inband wakeup config / clk
	// disable etc...
}
 ```

And something similar in resume_noirq?

Just need to make sure that the probe func does the
device_set_wakeup_enable or capable stuff correctly as per your H/w and
wakeup requirements...


-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

