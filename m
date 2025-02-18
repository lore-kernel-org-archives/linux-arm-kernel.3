Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB58C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofCREMV0EYhAFq3WcLlZIf2QuraluHD/0VQo2zzli/s=; b=ZCvtBwNtA0euYFw8MhogmyAc7u
	e1lX2dOB4HBzr5DRBvPjAEwIfP5gjBWYcj9wpIq0CVeRSnkQTZZq7MwNtuYh8lOalxRaZf13VuHib
	O7QBBVMxbxxbOLtWuV6IQpX8NI0I7vDTwJWky02rg1xFqNa4JLsm0pU8DCQZp0Y2mOeyOY+js+r6t
	l/+rtkNcvSbNGAyXoeXp/o2kl38XhFDj9SniTCUNxmmHgfcbesbOXSmDymsO0W69/0Z5jQzY0Xxtw
	KQhGn1XRRylS+H14KxjZTX16IeoPeVKv/T8qs+tO5HumlCKDIAKUoJT8ISrJvHAhWRruwcBf5YQSt
	oPKoz4Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKqy-00000007l5J-36KA;
	Tue, 18 Feb 2025 10:29:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKmh-00000007jkk-2vNA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:25:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8451D13D5;
	Tue, 18 Feb 2025 02:25:17 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 811B93F6A8;
	Tue, 18 Feb 2025 02:24:55 -0800 (PST)
Date: Tue, 18 Feb 2025 10:24:52 +0000
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
Message-ID: <Z7Rf9GPdO2atP89Z@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218010949.GB22580@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_022459_780986_CA840DF5 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
> A potential solution is not using reg in the protocol nodes. Define nodes
> as below:
> devperf {
> 	compatible ="arm,scmi-devperf";
> }
> 
> cpuperf {
> 	compatible ="arm,scmi-cpuperf";
> }
> 
> pinctrl {
> 	compatible ="arm,scmi-pinctrl";
> }
> 
> The reg is coded in driver.
> 
> But the upper requires restruction of scmi framework.
> 
> Put the above away, could we first purse a simple way first to address
> the current bug in kernel? Just as I prototyped here:
> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
> 

Good luck getting these bindings merged. I don't like it as it is pushing
software policy or issues into to the devicetree. What we have as SCMI
binding is more than required for a firmware interface IMO. So, you are
on your own to get these bindings approved as I am not on board with
these but if you convince DT maintainers, I will have a look at it then
to see if we can make that work really.

-- 
Regards,
Sudeep

