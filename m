Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56ABC02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiRdD0OhCvYRd6p3PFFB+fY3g1OiwiXD8xw+Hkub7Ws=; b=IPrFiQbnQMvP6bFPJCBpQWSY52
	ulHK/eAOBz+4sGDrRwnmwoytBRVPtaXI7/phDwIxh/QijWDKjXPyaY2ztHZ/N1tdsDxvqWw3/t2Me
	b+ap/HxqmzyI9pkVhBGhWsKOOl5flF2Xqo+gYEiFJBBY4OMlkmcrHDCeJlpuSuDYGQjd2yu6F4XLc
	4Nr/oY69adgP3XLaEAH+3yKt6Hwox7NpsuS5pDjGcI/dIsgDoOw4MYCl7aECui0H0LuJ3hgHllZfA
	d2jOo23oQ8vZZ3RAwFwagMygwMg6pYZfpp2UcvcP17R5fqiRAhQj1DdDXjXieOgTR1STeKcICXUHv
	fBXmlqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdsl-000000082p3-3G5u;
	Tue, 14 Jan 2025 10:10:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdpP-000000082HN-1DTN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:07:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D25411FB;
	Tue, 14 Jan 2025 02:07:46 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C45A63F792;
	Tue, 14 Jan 2025 02:07:15 -0800 (PST)
Date: Tue, 14 Jan 2025 10:07:03 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
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
Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 pinctrl
Message-ID: <Z4Y3OE8ubIWGiDhb@pluto>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-2-e9a3a5341362@nxp.com>
 <20241227152807.xoc7gaatejdrxglg@bogus>
 <Z3Q07EDfN0kTiVRV@pluto>
 <20250106044120.GB14389@localhost.localdomain>
 <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84595C6840D6B79B728F8B1B88182@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_020719_409493_7E7F6E5B 
X-CRM114-Status: GOOD (  24.00  )
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

On Tue, Jan 14, 2025 at 08:31:03AM +0000, Peng Fan wrote:
> Hi Cristian, Sudeep
> 
> > Subject: Re: [PATCH 2/4] firmware: arm_scmi: bus: Bypass setting
> > fwnode for pinctrl
> > 
> [...]
> 
> > >> fix here) than this change.
> > >
> > >...or indeed this is another possibility
> > 
> > I am doing a patch as below, how to do you think?
> 
> Do you have any comments on below ideas?
> 
> I am thinking to send out new patchset based on
> below ideas in this week.
> 

Hi Peng,

sorry for the delay.

Why both blacklist and allowlist ?

Cristian

> > 
> > With below patch, we could resolve the devlink issue and also support
> > mutitple vendor drivers built in, with each vendor driver has a
> > machine_allowlist.
> > 
> > diff --git a/drivers/firmware/arm_scmi/bus.c
> > b/drivers/firmware/arm_scmi/bus.c index
> > 1d2aedfcfdb4..c1c45b545480 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -55,6 +55,20 @@ static int scmi_protocol_device_request(const
> > struct scmi_device_id *id_table)
> >         unsigned int id = 0;
> >         struct list_head *head, *phead = NULL;
> >         struct scmi_requested_dev *rdev;
> > +       const char * const *allowlist = id_table->machine_allowlist;
> > +       const char * const *blocklist = id_table->machine_blocklist;
> > +
> > +       if (blocklist && of_machine_compatible_match(blocklist)) {
> > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > +                        id_table->name, id_table->protocol_id);
> > +               return 0;
> > +       }
> > +
> > +       if (allowlist && !of_machine_compatible_match(allowlist)) {
> > +               pr_debug("block SCMI device (%s) for protocol %x\n",
> > +                        id_table->name, id_table->protocol_id);
> > +               return 0;
> > +       }
> > 
> >         pr_debug("Requesting SCMI device (%s) for protocol %x\n",
> >                  id_table->name, id_table->protocol_id); diff --git
> > a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h index
> > 688466a0e816..e1b822d3522f 100644
> > --- a/include/linux/scmi_protocol.h
> > +++ b/include/linux/scmi_protocol.h
> > @@ -950,6 +950,9 @@ struct scmi_device {  struct scmi_device_id {
> >         u8 protocol_id;
> >         const char *name;
> > +       /* Optional */
> > +       const char * const *machine_blocklist;
> > +       const char * const *machine_allowlist;
> >  };
> 
> Thanks,
> Peng.
> 
> > 
> >  struct scmi_driver {
> > 
> > Thanks,
> > Peng
> > >
> > >Thanks,
> > >Cristian

