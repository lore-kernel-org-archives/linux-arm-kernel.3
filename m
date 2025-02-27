Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236BCC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ypuPD5OxM2/gUWzzTeslfAj9pnWNAkv2HsViXRsiWYc=; b=cXErClsoUGz/77CqhraHPBwHEk
	WAdfaL98XJ1Yz5zDPldyWlbT1xYkpK4U4dukEeRbpvKQH7q6YE11qu+o5WIbintfJd+qaKOrcDUSx
	q7X0lG75TGvDETAWWmtL6eHDsv+g1tI4aH58LleMFYx1c2j/Nngm2/6S4Mo0Jd0sznfjhZlK/Zylg
	TG4/elf7oaKSvsz/pfDR47NL9Fj3zfIi3MmK41BIxJsvNL7mNOGWim8pAvofov7gl29s/bkWBPBkF
	Wz0riFH305FCEd+ERHTUr2MSHYN6SeQGrsJXs8IH26umssjaXrq2oIbdzc6/Wp6uH6/F/bWoGvXmv
	sA54mCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZNl-00000006iQr-03cJ;
	Thu, 27 Feb 2025 08:36:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZM7-00000006iCF-3Fqs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A80172C1C;
	Thu, 27 Feb 2025 00:35:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 719873F6A8;
	Thu, 27 Feb 2025 00:34:53 -0800 (PST)
Date: Thu, 27 Feb 2025 08:34:44 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8AjhHsVT9ZQTtZX@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77l1NflYXTnRyg0@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_003455_905394_26151B0C 
X-CRM114-Status: GOOD (  39.63  )
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

On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 12:31:27PM +0300, Dan Carpenter wrote:
> > On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> > > On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > > > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> > > 
> > > > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > > > >  			     u32 domain, void __iomem **p_addr,
> > > > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > > > +			     bool skip_check)
> > > > 
> > > > This does not look like it will scale.
> > > 

Hi,

> > > After taking a closer look, perhaps it needs to be done along these
> > > lines.
> > > 
> > > But calling the parameter 'force' or similar as Dan suggested should
> > > make it more readable.
> > > 
> > > > >  {
> > > > >  	int ret;
> > > > >  	u32 flags;
> > > > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > > >  
> > > > >  	/* Check if the MSG_ID supports fastchannel */
> > > > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > > > 
> > > > Why can't you just make sure that the bit is set in attributes as I
> > > > suggested? That seems like it should allow for a minimal implementation
> > > > of this.
> > > 
> > > My idea here was that you could come up with some way of abstracting
> > > this so that you did not have to update every call site. Not sure how
> > > feasible that is.
> > 
> > I'm having a hard time finding your email.
> 
> 	https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
>  
> > Why does the scmi_proto_helpers_ops struct even exist?  We could just
> > call all these functions directly.  Do we have plans to actually create
> > different implementations?
> > 
> > If we got rid of the scmi_proto_helpers_ops struct then we could just
> > rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> > and create a default wrapper around it and a _forced() wrapper.
> > 
> > Some other potentially stupid ideas in the spirit of brainstorming are
> > that we could add a quirks parameter which takes a flag instead of a
> > bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.
> 
> Something like that, yes. :) I didn't try to implement it, but it seems
> like it should be possible implement this is a way that keeps the quirk
> handling isolated.
>

I hope next week to have a better look at this, in tne meantime just a
few considerations....

Sooner or later we should have introduced some sort of quirk framework
in SCMI to deal systematically with potentially out-of-spec FW, but as
in the name, it should be some sort of framework where you have a table of
quirks, related activation conditions and a few very well isolated points
where the quirks are placed and take action if enabled...this does not
seem the case here where instead an ad-hoc param is added to the function
that needs to be quirked...this does not scale and will make the codebase
a mess IMHO...

Last but not least, these quirks 'activations' in the SCMI world should
be driven mainly by the VENDOR/SUB-VENDOR/IMPLEMENTATION_VERS triple and
only as a last resort by a platform compatible match...because the
IMPLEMENTATION_VERSION, exposed by the FW and gathered via SCMI Base
protocol, is completely under the vendor control so it can, and should, be
used to identify broken FW-versions...indeed all the distinct SCMI protocols
are anyway versioned elsewhere according to the spec, so there is no need to
repeat SCMI protocol version here..I mean it is an IMPLEMENTATION version

As an example on a JUNO the SCP reference FW reports:

arm-scmi arm-scmi.1.auto: SCMI Protocol v2.0 'arm:arm' Firmware version 0x20f0000

where the FW version represent something like the FW release tag, I think...not
really sure about the menaing our FW gys give to it, BUT definitely it is not
a bare copy of the SCMI protocol version...

So...
...does the platfom-to-be-quirked at hand properly use the IMPLEMENTATION_VERSION
flag in a sensible way ?
IOW does that change between a bad and good (or less bad :D) version ?
Because shooting with the platform 'compatible-gun' should be the last resort
if all of the above does NOT happen in this beloved fw...

Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
up and see if I can prototype something generic to deal with quirks, possibly
next week...

Thanks,
Cristian

