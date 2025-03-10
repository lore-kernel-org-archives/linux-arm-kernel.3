Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E3FC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 09:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZM3lp58dqP9fRo8T3M/Fyf3CLx9G0+yBPauwPD1UJc=; b=lTANqBMdKbNP7WGsP/VDvBTr5u
	WQoJ33oPoVGD5AB+b9cbYwbkI1BDS0Qc/dIIOPKxHnzf2uXxFXii0LF8qpSYWIGNJvCwadtAUU7sN
	kwjyZpMUFkyXrg605wCO4jYYglOh3i8dkqCK7LEn88S8TNPePfVmE2ldVhVWVspopAUivoBOxJnk+
	Bf0OmgAE72uLaIsd3HPWzn0EK3rwH2TDMOO5yNYnjCV2oM1kL5//t9GEGjm9M6ncEeh3PB3PMNvTG
	4L4FTKetpA/NoJqpI1d9ySMaIZ3w9WeXZiRJmJ5m4tDRUU5Kk/yMQY7SVqD4SBtE2nKhryQ/iujxx
	Au+xApuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZkq-000000028zd-3ZxB;
	Mon, 10 Mar 2025 09:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trZRf-000000025KJ-0vR7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 09:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F97815A1;
	Mon, 10 Mar 2025 02:29:18 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D59473F5A1;
	Mon, 10 Mar 2025 02:29:03 -0700 (PDT)
Date: Mon, 10 Mar 2025 09:29:01 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <Z86w3ZRS6T2MvV3X@bogus>
References: <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
 <Z7Rf9GPdO2atP89Z@bogus>
 <20250218133619.GA22647@nxa18884-linux>
 <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_022911_299951_C28581F0 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, Feb 20, 2025 at 08:59:18AM +0800, Peng Fan wrote:
>
> Sorry, if I misunderstood.
>
> I will give a look on this and propose a RFC.
>
> DT maintainers may ask for a patchset including binding change and
> driver changes to get a whole view on the compatible stuff.
>
> BTW, Cristian, Saravana if you have any objections/ideas or would take on this
> effort, please let me know.
>

Can you point me to the DTS with which you are seeing this issue ?
I am trying to reproduce the issue but so far not successful. I did
move to power-domains for CPUFreq on Juno. IIUC all we need is both cpufreq
and performance genpd drivers in the kernel and then GPU using perf genpd
fails with probe deferral right ? I need pointers to reproduce the issue
so that I can check if what I have cooked up as a solution really works.

--
Regards,
Sudeep

