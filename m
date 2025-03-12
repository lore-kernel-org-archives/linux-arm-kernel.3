Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E641FC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZ8/AqATwrbud4D1iUSUko7p8CF8LXE6BXHNSYrq4kQ=; b=jm9YX4xkKNnrY/Q9sO/hJUDpYT
	IoyITtAwPHolDUK71fVtaCXW2pmhdhywKDu4GRj8sR2VhAqB7QlpZB+56QC5XvWE9iXTg9X2MrzVS
	gHZDXKu/9p757G89de5YwQZfCa4u/TUlc+VJuy9zDD93dy6VTJlhztiYW80dQILG36+oEcHkIyXyK
	KDP11FRKCiCy8jmdRKtB57PR3VAlzNZlCMqyTiQOuDvziUccb5mgNiojLgpbYLt0jJUw9Wx7UE7bm
	58DyKeRacrXta6u5oeujXQy5WcPmrsMac5l7u2QPslpsBRS+RTHVKdqRBs5S6orA6SmmXfTkwCYfV
	qjIdvyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLAX-00000008Oma-40q4;
	Wed, 12 Mar 2025 12:26:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKGg-00000008GGD-3hyW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:28:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25A46152B;
	Wed, 12 Mar 2025 04:29:09 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 962C83F694;
	Wed, 12 Mar 2025 04:28:55 -0700 (PDT)
Date: Wed, 12 Mar 2025 11:28:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
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
Message-ID: <Z9Fv9JPdF5OWUHfk@bogus>
References: <Z7Wvyn1QJQMVigf9@bogus>
 <Z7Z-ZnztmvUxWoQJ@NXL53680.wbi.nxp.com>
 <Z86w3ZRS6T2MvV3X@bogus>
 <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9FnZzBQuZ1j5k3I@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042858_963667_830B4784 
X-CRM114-Status: GOOD (  15.56  )
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

On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> > >
> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> > > created earlier and when device_add, the below logic makes the fwnode pointer points
> > > to scmi cpufreq device.
> > >         if (dev->fwnode && !dev->fwnode->dev) {
> > >                 dev->fwnode->dev = dev;
> > >                 fw_devlink_link_device(dev);
> > >         }
> > >
> >
> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
> >
> 
> I could reproduce but none of my solution solved the problem completely
> or properly. And I don't like the DT proposal you came up with. I am
> not inclined to just drop this fwnode setting in the scmi devices and
> just use of_node.
>

Sorry for the typo that changes the meaning: s/not/now

I meant "I am now inclined ..", until we figure out a way to make this
work with devlinks properly.

-- 
Regards,
Sudeep

