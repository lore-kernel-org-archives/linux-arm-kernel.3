Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBE3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wn9sfkYCA+8MMuqi9mezFTLeTidX43wgbJn8YfW6qA4=; b=Sxb/kCil+pRuOkPF1s9GvBAdCv
	+1/wYbC6aZnloOByn5K/McJR9KWaW7tQYBLDj3cSCwOjQmrMJ2hOgE2HH2FkLhdcW3r1n6rZKwrMR
	eR98brfueY/de0Jplq3QJRBYKmeKhV1cuNcQZOSMDa5J11SaCTzvp0fFt1r1s6/XOqOwPGn0S3tLV
	WEg0PTntRYzrt55FQ7dsTJ8jXgRtWON2Ru0/3zJsJEqQAoUyZjjepO7irF+sD5jgvOObKktTnoacy
	trB5UlHrckEcpLWGmdqMaTHA8m1Esd8OUnU7Dlmy27kYKbsm00y08p4C3wXZ/qD/HTm+QMQQ6L1NX
	BrHj/5aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TRH-00000006yQu-2SUv;
	Wed, 09 Apr 2025 11:17:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TNi-00000006xkW-3uGx
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Apr 2025 11:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wn9sfkYCA+8MMuqi9mezFTLeTidX43wgbJn8YfW6qA4=; b=fETCgVcSH/yuoYbENH9ve81uGu
	6FPFaiixa20sPe9Sqm3Ums/lmoG3VTbcTc6Pa33OGCikDAytHSsMlKkYxwf/9wBGnsDLS9TFuXCkV
	Bi6YOllbOXpIJqwwmbV3IqZtBeHSjBTdDN/9JLA05NWbhvkjQOP0cqcvf3qGy35pDwfU87GV6y70R
	ujZAbWKhWcnSOCadnvNcMbFzElvaB4VSAvT0eshoGrzsGtZlvS+Ij8h4OOKtafn1nsFpfBhjZEQXb
	2TEr3mZzAtBG36IV9ntlRRnhKD5ETbrZIB2i5X1N5XWGkiL9ASkKffPl4GFFIx6MHGYq7jPpKfrM8
	FrxFOS+g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2TNf-00000008bPl-1VZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:14:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01B081595;
	Wed,  9 Apr 2025 04:14:07 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 947573F694;
	Wed,  9 Apr 2025 04:14:03 -0700 (PDT)
Date: Wed, 9 Apr 2025 12:14:00 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
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
Message-ID: <20250409-incredible-attentive-scorpion-fa9def@sudeepholla>
References: <DB9PR04MB84614FBF96E7BC0D125D97F688D62@DB9PR04MB8461.eurprd04.prod.outlook.com>
 <Z87UJdhiTWhssnbl@bogus>
 <Z87sGF_jHKau_FMe@bogus>
 <PAXPR04MB8459EA5C7898393E51C246AD88D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <PAXPR04MB8459A73179FFF0ED0C9A51E488D12@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <Z9AdICiyaCmzKh-N@bogus>
 <Z9FnZzBQuZ1j5k3I@bogus>
 <Z9Fv9JPdF5OWUHfk@bogus>
 <20250313052309.GA11131@nxa18884-linux>
 <20250409035029.GC27988@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409035029.GC27988@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_121407_939288_9C9F398C 
X-CRM114-Status: GOOD (  24.51  )
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

On Wed, Apr 09, 2025 at 11:50:29AM +0800, Peng Fan wrote:
> Hi Sudeep, Cristian
> 
> On Thu, Mar 13, 2025 at 01:23:27PM +0800, Peng Fan wrote:
> >On Wed, Mar 12, 2025 at 11:28:52AM +0000, Sudeep Holla wrote:
> >>On Wed, Mar 12, 2025 at 10:52:23AM +0000, Sudeep Holla wrote:
> >>> On Tue, Mar 11, 2025 at 11:23:12AM +0000, Sudeep Holla wrote:
> >>> > On Tue, Mar 11, 2025 at 11:12:45AM +0000, Peng Fan wrote:
> >>> > >
> >>> > > So it is clear that wrong fw_devlink is created, it is because scmi cpufreq device is
> >>> > > created earlier and when device_add, the below logic makes the fwnode pointer points
> >>> > > to scmi cpufreq device.
> >>> > >         if (dev->fwnode && !dev->fwnode->dev) {
> >>> > >                 dev->fwnode->dev = dev;
> >>> > >                 fw_devlink_link_device(dev);
> >>> > >         }
> >>> > >
> >>> >
> >>> > Thanks, looks like simple way to reproduce the issue. I will give it a try.
> >>> >
> >>> 
> >>> I could reproduce but none of my solution solved the problem completely
> >>> or properly. And I don't like the DT proposal you came up with. I am
> >>> not inclined to just drop this fwnode setting in the scmi devices and
> >>> just use of_node.
> >>>
> >>
> >>Sorry for the typo that changes the meaning: s/not/now
> >>
> >>I meant "I am now inclined ..", until we figure out a way to make this
> >>work with devlinks properly.
> >
> >when you have time, please give a look at
> >https://github.com/MrVan/linux/commit/b500c29cb7f6f32a38b1ed462e333db5a3e301e4
> >
> >The upper patch was to follow Cristian's and Dan's suggestion in V2[1] to use
> >a flag SCMI_DEVICE_NO_FWNODE for scmi device.
> >
> >I could post out the upper patch as V3 if it basically looks no design flaw.
> >I will drop the pinctrl patch in v3, considering we are first going
> >to resolve the fw_devlink issue for cpufreq/devfreq.
> >
> >[1] https://lore.kernel.org/all/Z6SgFGb4Z88v783c@pluto/
> 
> Not sure you gave a look on this or not. I am thinking to bring this V3
> out to mailing list later this week. Please raise if you have any concern.
> 

Yes I had some thoughts. I will take a look and refresh my memories first.

-- 
Regards,
Sudeep

