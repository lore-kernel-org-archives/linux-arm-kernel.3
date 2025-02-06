Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE8AC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaX0ACGyjE/KyWtX01XxZ1NjbsjOHzDqMURUK2/QrFM=; b=CuP/QWdWnNSK+CXc+gLz1e/R4o
	U8wdYJ8Fuq/AlZGibmfh/MtzqHw/XWwHS1fRVmyaT1dCkDpq7Z0RathgthuTk6g1gCxmq7mFTfSNK
	/zzfOpo1NVv1bAY6t4L+C+GpZxXQ+FxAOn/IZah/oa4JE5W80jIptwzNboybw0Fv5BD62/FlkuAeB
	JzBbjchX/kk5PiUrQ/vBAbwb/t0Nr7AKvleMBuags3tQP1tsPln/kq12axnQbXcJEsguw7Ch9jsQj
	tN2B2wHgl8ogTL42v1CFygnh770Z/6B+IQ+KkBcKSs0kFdKDbOcTBqaWSsqXccHOkg5T9AXsYFvRS
	KWmZa/zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0Wy-00000006DSn-0oyX;
	Thu, 06 Feb 2025 11:58:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg0H3-00000006Atd-03MN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 11:42:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09E5112FC;
	Thu,  6 Feb 2025 03:42:45 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FAD53F5A1;
	Thu,  6 Feb 2025 03:42:19 -0800 (PST)
Date: Thu, 6 Feb 2025 11:42:12 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/4] firmware: arm_scmi: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z6SgFGb4Z88v783c@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_034225_094336_550C0321 
X-CRM114-Status: GOOD (  21.36  )
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

On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > >> --- a/drivers/firmware/arm_scmi/bus.c
> > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > >>  	device_unregister(&scmi_dev->dev);
> > >>  }
> > >>  
> > >> +static int
> > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > >> +		       int protocol, const char *name)
> > >> +{
> > >> +	/* cpufreq device does not need to be supplier from devlink perspective */
> > >> +	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > >
> > >I don't love this...  It seems like an hack.  Could we put a flag
> > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > >because that's what we're passing to this function).
> > 
> > This means when creating scmi_device, a flag needs to be set which requires
> > to extend scmi_device_id to include a flag entry or else.
> > 
> > As below in scmi-cpufreq.c
> > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > 
> 
> Yeah, I like that.
> 
> -	if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> +	if (scmi_dev->flags & SCMI_FWNODE_NO) {
> 
> Or we could do something like "if (scmi_dev->no_fwnode) {"

I proposed a flag a few review ago about this, it shoule come somehow
from the device_table above like Peng was proposing, so that a driver
can just declare that does NOT need fw_devlink.

Thanks,
Cristian

