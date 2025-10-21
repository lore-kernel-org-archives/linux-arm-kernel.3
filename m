Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324E3CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kaLrb8mkfQjEuRi3C8h2RybuNenhPIPoHG7GvRR/GEI=; b=VJSWJvVXJBXer5YLo0XaDn/jPq
	Qr/UwHc6SL3qgyySr8eZqThyyC/NWzpl9SqNb4J/Obl9wqKcYCUoZhoyGd7kiLosYSePcTgarSvVd
	z+trba5NGphFoPV9vBgiqyFhYmDh5Z8Ase5JnBbNsyDwd0bQBPw8xSZy3vsBolyyJzuCmph5EGB6U
	+1OryIFHerP/aRBIAn9ynPq81/sGodTp7gickZXSqXCBaQwmkVAvdM5TnrTgJSFH/EDtHd6ngKy7Q
	Opa1Jgt5LjlcT/TRQZPsD6f7/C8I+lnYAYvRdwFiVnf2frQOs1oGMTUCwl9qU1xaXOHdte6Z0rqhk
	lxMc60cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8mt-0000000GTEI-3CFr;
	Tue, 21 Oct 2025 09:36:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8ms-0000000GTDZ-11fu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:36:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 817FD1007;
	Tue, 21 Oct 2025 02:36:02 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B2F23F66E;
	Tue, 21 Oct 2025 02:36:08 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:36:00 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, d-gole@ti.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH 02/10] firmware: arm_scmi: Reduce the scope of protocols
 mutex
Message-ID: <aPdUAOirD2yodeTy@pluto>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
 <20250925203554.482371-3-cristian.marussi@arm.com>
 <20251017160702.00002af4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017160702.00002af4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_023614_360274_39AE31E9 
X-CRM114-Status: GOOD (  32.95  )
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

On Fri, Oct 17, 2025 at 04:07:02PM +0100, Jonathan Cameron wrote:
> On Thu, 25 Sep 2025 21:35:46 +0100
> Cristian Marussi <cristian.marussi@arm.com> wrote:
> 
> > Currently the mutex dedicated to the protection of the list of registered
> > protocols is held during all the protocol initialization phase.
> > 
> > Such a wide locking region is not needed and causes problem when trying to
> > initialize notifications from within a protocol initialization routine.
> > 
> > Reduce the scope of the protocol mutex.
> > 
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Hi Cristian.  A few things inline and this runs into one of the things
> that is dangerous to do with guard() or the other cleanup.h magic
> (and documented there!)

Hi Jonathan,

thanks for having a look at this series.

> 
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 53 +++++++++++++++---------------
> >  1 file changed, 26 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index bd56a877fdfc..71ee25b78624 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -17,6 +17,7 @@
> >  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> >  
> >  #include <linux/bitmap.h>
> > +#include <linux/cleanup.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/device.h>
> >  #include <linux/export.h>
> > @@ -2179,10 +2180,13 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  	if (ret)
> >  		goto clean;
> >  
> > -	ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
> > -			GFP_KERNEL);
> > -	if (ret != proto->id)
> > -		goto clean;
> > +	/* Finally register the initialized protocol */
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> 
> See the guidance in cleanup.h on mixing goto and anything defined in that file.
> 
> In some compilers, if you hit the goto above and hence jump over this
> the cleanup variable will still be instantiated, but not initialized leading to
> a potential attempt to unlock random memory.
> 
> Either this needs more substantial rework, or just handling the mutex with
> out using guards.
> 

Thanks for the heads-up I will dig better into cleanup.h which obviously
I did not enough...my bad.

> 
> > +		ret = idr_alloc(&info->protocols, pi, proto->id, proto->id + 1,
> > +				GFP_KERNEL);
> > +		if (ret != proto->id)
> > +			goto clean;
> > +	}
> >  
> >  	/*
> >  	 * Warn but ignore events registration errors since we do not want
> > @@ -2243,25 +2247,22 @@ scmi_alloc_init_protocol_instance(struct scmi_info *info,
> >  static struct scmi_protocol_instance * __must_check
> >  scmi_get_protocol_instance(const struct scmi_handle *handle, u8 protocol_id)
> >  {
> > -	struct scmi_protocol_instance *pi;
> > +	struct scmi_protocol_instance *pi = ERR_PTR(-EPROBE_DEFER);
> >  	struct scmi_info *info = handle_to_scmi_info(handle);
> > +	const struct scmi_protocol *proto;
> >  
> > -	mutex_lock(&info->protocols_mtx);
> > -	pi = idr_find(&info->protocols, protocol_id);
> > -
> > -	if (pi) {
> > -		refcount_inc(&pi->users);
> > -	} else {
> > -		const struct scmi_protocol *proto;
> > -
> > -		/* Fails if protocol not registered on bus */
> > -		proto = scmi_protocol_get(protocol_id, &info->version);
> > -		if (proto)
> > -			pi = scmi_alloc_init_protocol_instance(info, proto);
> > -		else
> > -			pi = ERR_PTR(-EPROBE_DEFER);
> > +	scoped_guard(mutex, &info->protocols_mtx) {
> > +		pi = idr_find(&info->protocols, protocol_id);
> > +		if (pi) {
> 
> if !pi we carry on with it NULL, which is a behavior change from
> before where it would be ERR_PTR(-EPROBE_DEFER);
> 
> That might not matter, but it's not 'obviously' a safe change.

You are right...also the Dox comment is obsoleted..I will review this
patch as a whole, since even if probably right in its essence is badly
implemented because I rushed it in in this series to fix a probblem that
popped up on KASAN.

> 
> > +			refcount_inc(&pi->users);
> > +			return pi;
> > +		}
> >  	}
> > -	mutex_unlock(&info->protocols_mtx);
> > +
> > +	/* Fails if protocol not registered on bus */
> > +	proto = scmi_protocol_get(protocol_id, &info->version);
> > +	if (proto)
> Trivial but I'd flip the logic to
> 	if (!proto)
> 		return ERR_PTR(-EPROBE_DEFER);
> assuming a NULL return as mentioned above isn't the intent.
> Then
> 	return scmi_alloc_init_protocol_instance(info, protoo);

Yes this seems a better rework...

Thanks,
Cristian

