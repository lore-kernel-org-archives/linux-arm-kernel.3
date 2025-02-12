Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65C4C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5uuHPdBAhLJ9Cv3yIy1FDgkEJdGQjJIv8OIWVG9wGQ=; b=H5e7M6tJCyv4ukG5MbkQKg+rj8
	oqqIIlWVyrcguTjzq45LohkffDLG+toqzDSZjtlHtdGpcPE4Zl0N61b5ms/uIUprHitEKXfA2iZLm
	TqTIlvVUEO4M9Q/9GoZmeTgRQDRjrCsaE89g6Q0hQlHHRKBORTe8w6ee9FOOhrfIz3MnJbriU4s8I
	M1jG9gxByBG49zpPce99JtjfOdUR4MPLRCAeLNnO1cn8XXYK+6OsUnQ0x6TNlEfKkFc7ZLA30oTN9
	ojmR8EdO9oyeqlfMLCjPiD1fv173SywIm6G74/792C6HkBkysRntgVXAvEQLYoGgnpAXG4y/Myhh2
	3hWEgfBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiATR-000000075Uh-2DnQ;
	Wed, 12 Feb 2025 11:00:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAEV-00000007225-3o2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:44:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0147F12FC;
	Wed, 12 Feb 2025 02:45:04 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5E1E3F6A8;
	Wed, 12 Feb 2025 02:44:40 -0800 (PST)
Date: Wed, 12 Feb 2025 10:44:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 4/4] rtc: imx-sm-bbm: Support multiple RTCs
Message-ID: <Z6x7lemv2y8iMZZA@bogus>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-4-08c50830bac9@nxp.com>
 <Z6uCWK8jMTP7wInM@bogus>
 <20250212064117.GC15796@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212064117.GC15796@localhost.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_024443_988525_69562E5C 
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

On Wed, Feb 12, 2025 at 02:41:17PM +0800, Peng Fan wrote:
> On Tue, Feb 11, 2025 at 05:01:12PM +0000, Sudeep Holla wrote:
> >On Mon, Jan 20, 2025 at 10:25:36AM +0800, Peng Fan (OSS) wrote:
> >> From: Peng Fan <peng.fan@nxp.com>
> >> 
> >> i.MX95 EVK has two RTCs exported by SCMI BBM protocol. Current driver
> >> only enables the 1st RTC inside BBNSM module, leaving the board RTC
> >> not used by Linux.
> >> 
> >> To use the 2nd RTC, use 'bbm_info' to get the number of RTCs, register
> >> them all, and set 'bbnsm' as private info for rtc device to know which
> >> RTC it is when using rtc_class_ops to access rtc device.
> >> 
> >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >> ---
> >>  drivers/rtc/rtc-imx-sm-bbm.c | 69 +++++++++++++++++++++++++++-----------------
> >>  1 file changed, 43 insertions(+), 26 deletions(-)
> >> 
> >> diff --git a/drivers/rtc/rtc-imx-sm-bbm.c b/drivers/rtc/rtc-imx-sm-bbm.c
> >> index daa472be7c80697aa3cd3432eccef0c877e4c378..a29b30555d0c0581ecaa8b79760209dc780d2f0e 100644
> >> --- a/drivers/rtc/rtc-imx-sm-bbm.c
> >> +++ b/drivers/rtc/rtc-imx-sm-bbm.c
> >> @@ -15,16 +15,18 @@ struct scmi_imx_bbm {
> >>  	struct rtc_device *rtc_dev;
> >>  	struct scmi_protocol_handle *ph;
> >>  	struct notifier_block nb;
> >> +	u32 bbm_rtc_id;
> >
> >Is it not same as rtc_dev->id ? Why do you need a copy in this wrapper/
> >container structure ?
> 
> In theroy yes. The current system I use that all RTCs are managed by BBM
> protocol. So only two RTCs are registered.
> 
> In case there is other RTCs that not managed BBM, the rtc_dev->id
> will not be equal to bbm_rtc_id.
> 
> For example RTC1 is directly managed by Linux, RTC0 is managed by BBM.
> 
> The RTC1 is probed first, so its rtc_dev->id is 0. But from BBM protocol,
> the RTC0 use id 0 for BBM SCMI server to handle the RTC0.
> 
> I maybe overthinking here. But to avoid potential issues, I would like to
> keep bbm_rtc_id.
> 

Fair enough, I didn't think of this mix(firmware controlled RTC + Linux
controlled ones).

--
Regards,
Sudeep

