Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE6C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 13:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NNmnDmBtUq5nZ2ZYBzJF1hqzwX84VbJfqDMAknsTtK4=; b=CB1VPRzI9x2sPDc28pae98Uaj8
	8pSDPD9bAHHXsgGF33YeXurHmMa5H2aYWJbeuIq+UoIVoUWYoNsms4MtOuwaemU0aEaNRXbio8y7A
	q0tnhQL1NfuGxg3jrvgboGBg1KRg+ycJ3ndBXc1G1v/ctAJlX+sqLUuAYwz7W+KOv7yiSjAu4ExUD
	Im08GWVgtQvGkPEUXQMdNiZhtycas6Y4Lf17sYCHQw4HCAudtUf8EnPGxcoDBdOft4JnCedtyrpeG
	A4btrOShv3k8mGV8QMk4rvB343tkzr5TYejcKX2GnuGqeSaVqQnfPzEp1LxPXxFA6m9M/Ljvtj9CI
	wRQ6qhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiZBi-0000000B8je-01iU;
	Thu, 13 Feb 2025 13:23:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYxJ-0000000B6Kw-1XsH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:08:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3D1E16F3;
	Thu, 13 Feb 2025 05:08:54 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18FD83F58B;
	Thu, 13 Feb 2025 05:08:31 -0800 (PST)
Date: Thu, 13 Feb 2025 13:08:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Saravana Kannan <saravanak@google.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <Z63uttFGqXx4kqNr@pluto>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
 <20250120-scmi-fwdevlink-v2-1-3af2fa37dbac@nxp.com>
 <7a29ec8f-fef8-4f1c-a2eb-16a63f2b820c@stanley.mountain>
 <20250206105218.GA22527@localhost.localdomain>
 <e20415aa-517c-4e72-a1c3-9c02769c1149@stanley.mountain>
 <Z6SgFGb4Z88v783c@pluto>
 <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx8MXpLntMu4=9qECdZJzJLJbWa8ziH8XcW=yJNDAgD=Vw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050837_494825_AD14A34B 
X-CRM114-Status: GOOD (  28.26  )
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

On Thu, Feb 13, 2025 at 12:17:06AM -0800, Saravana Kannan wrote:
> On Thu, Feb 6, 2025 at 3:42 AM Cristian Marussi
> <cristian.marussi@arm.com> wrote:
> >
> > On Thu, Feb 06, 2025 at 02:31:19PM +0300, Dan Carpenter wrote:
> > > On Thu, Feb 06, 2025 at 06:52:20PM +0800, Peng Fan wrote:
> > > > On Wed, Feb 05, 2025 at 03:45:00PM +0300, Dan Carpenter wrote:
> > > > >On Mon, Jan 20, 2025 at 03:13:29PM +0800, Peng Fan (OSS) wrote:
> > > > >> diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
> > > > >> index 2c853c84b58f530898057e4ab274ba76070de05e..7850eb7710f499888d32aebf5d99df63db8bfa26 100644
> > > > >> --- a/drivers/firmware/arm_scmi/bus.c
> > > > >> +++ b/drivers/firmware/arm_scmi/bus.c
> > > > >> @@ -344,6 +344,21 @@ static void __scmi_device_destroy(struct scmi_device *scmi_dev)
> > > > >>          device_unregister(&scmi_dev->dev);
> > > > >>  }
> > > > >>
> > > > >> +static int
> > > > >> +__scmi_device_set_node(struct scmi_device *scmi_dev, struct device_node *np,
> > > > >> +                       int protocol, const char *name)
> > > > >> +{
> > > > >> +        /* cpufreq device does not need to be supplier from devlink perspective */
> > > > >> +        if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > > >
> > > > >I don't love this...  It seems like an hack.  Could we put a flag
> > > > >somewhere instead?  Perhaps in scmi_device?  (I'm just saying that
> > > > >because that's what we're passing to this function).
> > > >
> > > > This means when creating scmi_device, a flag needs to be set which requires
> > > > to extend scmi_device_id to include a flag entry or else.
> > > >
> > > > As below in scmi-cpufreq.c
> > > > { SCMI_PROTOCOL_PERF, "cpufreq", SCMI_FWNODE_NO }
> > > >
> > >
> > > Yeah, I like that.
> > >
> > > -     if ((protocol == SCMI_PROTOCOL_PERF) && !strcmp(name, "cpufreq")) {
> > > +     if (scmi_dev->flags & SCMI_FWNODE_NO) {
> > >
> > > Or we could do something like "if (scmi_dev->no_fwnode) {"
> >
> > I proposed a flag a few review ago about this, it shoule come somehow
> > from the device_table above like Peng was proposing, so that a driver
> > can just declare that does NOT need fw_devlink.
> 
> Sorry, looks I replied to v1 series. Can you take a look at that
> response please?
> https://lore.kernel.org/lkml/CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com/
> 
> If that suggestion I gave there would work, then that's the cleanest
> approach. This patch series is just kicking the can down the road (or
> down an inch).

Thanks for the reply, I will answer on that other thread.
Cristian

