Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87035D29C33
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DUV0vbeK4FJC4V+/glh7sb9LW92myK4KqpO0eP9+S8=; b=TDlf/SGZRo9SGtpKk3H8vA4khN
	EGm41CnvJPloqbVgZ7753WsIhPu8roSXkptMchaRVwFVZZfknjfQlAHfPzlrnGmF+BAbaRymY/BSy
	lD/KDP8APGwFDSKMKYd//jW5TvgH3nx7M9Rw+EWEnmtCgd6Odn5BkMO9a5MqESt9O9OcrRJnja6Lu
	ILnMRuvWcgRTrpOGY8jxGEakO55q8lTDr9J35S2Ozu9UDhirqCvtlP9bZxdyZov71fsYV1EGInV4c
	zbcFzlxQIfURr1UiqxsmefGCErTZo4G9x5YUTaH77nTWfyXreMVNzqDxXHyHgVmtM8FTi65SNwGex
	cLQnt2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrVa-00000002OMz-1c0T;
	Mon, 19 Jan 2026 15:49:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrVV-00000002OLZ-1EwC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:49:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43489FEC;
	Mon, 19 Jan 2026 07:49:25 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 986073F694;
	Mon, 19 Jan 2026 07:49:29 -0800 (PST)
Date: Mon, 19 Jan 2026 15:49:27 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, d-gole@ti.com, elif.topuz@arm.com,
	lukasz.luba@arm.com, philip.radford@arm.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 03/17] firmware: arm_scmi: Allow protocols to register
 for notifications
Message-ID: <aW5Sh1lIS0n_2Fyr@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-4-cristian.marussi@arm.com>
 <20260119113326.00005902@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119113326.00005902@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074934_024440_6EBCE45A 
X-CRM114-Status: GOOD (  22.51  )
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

On Mon, Jan 19, 2026 at 11:33:26AM +0000, Jonathan Cameron wrote:
> On Wed, 14 Jan 2026 11:46:07 +0000
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Allow protocols themselves to register for their own notifications and
> 
> and provide their own notifier callbacks.
> 
> > providing their own notifier callbacks. While at that, allow for a protocol
> > to register events with compilation-time unknown report/event sizes: such
> > events will use the maximum transport size.
> 
> I'm not keen on the 'while at that' part of the patch. In an ideal
> world that's a separate patch.

Yes indeed...it was tempting to do it together with the rework since it
was the only usecase that triggered the 'while-at' change...

...but this series in general needs more splitting both at the protocol
level and at the FS level (once I get some feedback from FS guys) so I
will split this out too.

> 
> One other comment inline.
> 
> Jonathan
> p.s. You get to my review victim whilst I run a particularly annoying
> bisection on the other screen (completely unrelated!) :)
> 
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > v1-->v2
> >  - Fixed multiline comment format
> > ---
> >  drivers/firmware/arm_scmi/common.h    |  4 ++++
> >  drivers/firmware/arm_scmi/driver.c    | 12 ++++++++++++
> >  drivers/firmware/arm_scmi/notify.c    | 28 ++++++++++++++++++++-------
> >  drivers/firmware/arm_scmi/notify.h    |  8 ++++++--
> >  drivers/firmware/arm_scmi/protocols.h |  6 ++++++
> >  5 files changed, 49 insertions(+), 9 deletions(-)
> > 
> 
> 
> > diff --git a/drivers/firmware/arm_scmi/notify.c b/drivers/firmware/arm_scmi/notify.c
> > index 78e9e27dc9ec..e84b4dbefe82 100644
> > --- a/drivers/firmware/arm_scmi/notify.c
> > +++ b/drivers/firmware/arm_scmi/notify.c
> 
> 
> > @@ -779,8 +787,13 @@ int scmi_register_protocol_events(const struct scmi_handle *handle, u8 proto_id,
> >  	}
> >  
> >  	evt = ee->evts;
> > -	for (i = 0; i < ee->num_events; i++)
> > +	for (i = 0; i < ee->num_events; i++) {
> > +		if (evt[i].max_payld_sz == 0) {
> > +			payld_sz = max_msg_sz;
> > +			break;
> > +		}
> >  		payld_sz = max_t(size_t, payld_sz, evt[i].max_payld_sz);
> 
> Everything here seems to already be a size_t.  It is rare that we actually need max_t over
> max, and definitely not when all the types match.
> 		payld_sz = max(payl_sz, evt[i].max_payld_sz);

...indeed...I will fix.

Thanks,
Cristian

