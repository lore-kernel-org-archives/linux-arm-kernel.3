Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDAFCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R67bXIcJ6ZW0Mr/MWeiAET685IqQQBHGOBblU9BvLWU=; b=KMAM3MBwtrl++sB/Fu3wteGFmT
	Ezgt39mMtvtTjBO7haZ5bWZN//oEpiFFkZs5mm5N0s6oN3MArwQZAZzZJiSmXZg9Dagl0+8yv5+O+
	xw6q2KQVBZyTBz7mkItm9dGMp1YdtsD3UU33dU/081lz/wYWFQlAUBLKbvb5nbCayJv50afkgSKYa
	RgBAVuD4mRKZ1PDk/r69AhCfecrMDSpS/OzI/C8iwRLWsOIDlj/gi8hXspLMSm4vr/WBmw64Tg+8d
	rXwqDogfDx5OZ2Y/9OInyJiVwnQ5EkACu6KLLpffz4UZOGbfwPXyqo51PqyzLLjhjqnIeoT+wCTgv
	xM07KcGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKND4-0000000HWdS-0eWS;
	Tue, 05 May 2026 21:21:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKND1-0000000HWci-1Wtj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 21:21:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA0F51A25;
	Tue,  5 May 2026 14:21:29 -0700 (PDT)
Received: from donnerap.manchester.arm.com (donnerap.manchester.arm.com [10.33.8.81])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B732E3F7B4;
	Tue,  5 May 2026 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778016095; bh=+mPWg2uMzAPmVMXDNRmqAMdMillF7YQN7BUboho7Z6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SDdAZKViRVhC0qIt6LW792CahJRW7eJW6wA41BeX2cVSzI2R2cMdMFLMu/oc0RGgX
	 G5OSKgH0Qed2hIjb/E1KiivDuLXpDhyf9VLBEGXnfpJwgwRBYUrwDaLhm/FesIJjS1
	 eg7yX1OtlI29sfmJqwW5oTmTgLi4HG7n48MDkHJY=
Date: Tue, 5 May 2026 22:21:30 +0100
From: Philip Radford <philip.radford@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-pm@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	quic_sibis@quicinc.com, dan.carpenter@linaro.org, d-gole@ti.com,
	souvik.chakravarty@arm.com
Subject: Re: [PATCH v5 06/12] firmware: arm_scmi: Extend powercap report to
 include MAI
Message-ID: <afpc_Y2cQUw6xKbr@donnerap.manchester.arm.com>
References: <20260428090922.346069-1-philip.radford@arm.com>
 <20260428090922.346069-7-philip.radford@arm.com>
 <afpPbHkvNE0ijM9n@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afpPbHkvNE0ijM9n@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_142139_602304_4FF399C0 
X-CRM114-Status: GOOD (  33.04  )
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

On Tue, May 05, 2026 at 09:13:32PM +0100, Cristian Marussi wrote:
> On Tue, Apr 28, 2026 at 10:09:15AM +0100, Philip Radford wrote:
> > Extend scmi_powercap_meas_changed_report to include MAI change
> > notifications.
> > 
> 
> Hi
> 

Hi,
Thanks for the review.

> > Signed-off-by: Philip Radford <philip.radford@arm.com>
> > ---
> >  drivers/firmware/arm_scmi/powercap.c | 20 ++++++++++++--------
> >  include/linux/scmi_protocol.h        |  1 +
> >  2 files changed, 13 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/powercap.c b/drivers/firmware/arm_scmi/powercap.c
> > index 1d1188e98d49..b9d50f4e8ae5 100644
> > --- a/drivers/firmware/arm_scmi/powercap.c
> > +++ b/drivers/firmware/arm_scmi/powercap.c
> > @@ -11,6 +11,7 @@
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> >  #include <linux/scmi_protocol.h>
> > +#include <linux/stddef.h>
> >  
> >  #include <trace/events/scmi.h>
> >  
> > @@ -164,6 +165,7 @@ struct scmi_powercap_meas_changed_notify_payld {
> >  	__le32 agent_id;
> >  	__le32 domain_id;
> >  	__le32 power;
> > +	__le32 mai;
> >  };
> >  
> >  struct scmi_msg_powercap_cpc {
> > @@ -1212,13 +1214,6 @@ static int scmi_powercap_notify(const struct scmi_protocol_handle *ph,
> >  		if (ret)
> >  			return ret;
> >  
> > -		if (enable && !low && !high) {
> > -			dev_err(ph->dev,
> > -				"Invalid Measurements Notify thresholds: %u/%u\n",
> > -				low, high);
> > -			return -EINVAL;
> > -		}
> > -
> 
> Ok so you removed this check because now that a notification can be
> emitted even only to notify a MAI change, it is possible that the
> thresholds are zero and the notification will be emitted anyway due to
> a MAI change....BUT you have to review or completely remove the comment
> block that precedes this that says:
> 
>    /*                                                               
>     * Note that we have to pick the most recently configured        
>     * thresholds to build a proper POWERCAP_MEASUREMENTS_NOTIFY     
>     * enable request and we fail, complaining, if no thresholds     
>     * were ever set, since this is an indication the API has been   
>     * used wrongly.                                                 
>     */                                                              
> 
> ...becasue NOW is no more true and misleading, since you just removed the
> fail and complain part...
> 
> It would be good to shortly explain in a comment the new possible
> scenarios in which notification can be enabled...
> 

Apologies, I have overlooked this comment. I will amend it.

> >  		ret = ph->xops->xfer_get_init(ph, message_id,
> >  					      sizeof(*notify), 0, &t);
> >  		if (ret)
> > @@ -1333,14 +1328,23 @@ scmi_powercap_fill_custom_report(const struct scmi_protocol_handle *ph,
> >  	{
> >  		const struct scmi_powercap_meas_changed_notify_payld *p = payld;
> >  		struct scmi_powercap_meas_changed_report *r = report;
> > +		const size_t sz_v2 = offsetofend(struct scmi_powercap_meas_changed_notify_payld,
> > +						 power);
> > +		const size_t sz_v3 = sizeof(*p);
> 
> While this is a valid and nice construct, I think is overkill here since
> these offsets/sizes will never change at runtime....
> 
> ...you can just define above a couples of DEFINE that hardcodes the
> sizes of the v2 and v3 by using the
> 
> 	#define SZ_V2 	(sizeof(struct scmi_powercap_meas_changed_notify_payld))
> 
> and
> 	#define SZ_V3   (SZ_V2 - sizeof(__le32))
> 

Noted, will do.

> >  
> > -		if (sizeof(*p) != payld_sz)
> > +		if (payld_sz != sz_v2 && payld_sz != sz_v3)
> >  			break;
> >  
> >  		r->timestamp = timestamp;
> >  		r->agent_id = le32_to_cpu(p->agent_id);
> >  		r->domain_id = le32_to_cpu(p->domain_id);
> >  		r->power = le32_to_cpu(p->power);
> 
> maybe more clear to simply:
> 		
> 		r->mai = 0;
> 		if (payld_sz == SZ_V3 && PROTOCOL_REV_MAJOR(ph->version) >= 0x3)
> 			r->mai = le32_to_cpu(p->mai);
> 
> 	

Agreed.
	
> > +
> > +		if (payld_sz == sz_v3 && PROTOCOL_REV_MAJOR(ph->version) >= 0x3)
> > +			r->mai = le32_to_cpu(p->mai);
> > +		else
> > +			r->mai = 0;
> > +
> >  		*src_id = r->domain_id;
> 

Thanks,
Phil

