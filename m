Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBACC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbHIyXGHwNL3k4vo0m60tJJ+2qCVlfpnkDc2xsJrQW0=; b=sm39iVyhGJx/JeZIfFCHYfym/L
	mlDOltNHjtWEoMvjTO0f+Es10LMxiSTNMKxjAmP5kX9a3GKUmw+kQB6242TSUBSTXW+76A8xBWfWr
	qZgJdCHB1leAjJwSgN6DWBV00miJCqSYZLOpUYWW7o+22a/LOQw4S7yeEl+lg9REHR+ZqH7afB9zu
	l6zZQbxjcZPVRzrIgeT3xcA9yY3ljBV86FuZuKz9hWr07Ybk0ivRVnnn05TwDQVitwdHhRcVnEKMD
	URJb3Z7rt/HoI+hT5z61CTrIrLR6Jl5BXlppju4IoQYqBptFE2QBXIE7T/WkQMbGqGLvMrI8YVpAL
	2cHKeCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYvF-00000006e4B-1SPR;
	Thu, 27 Feb 2025 08:07:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnYra-00000006d2t-2YDa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 08:03:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88B332BCC;
	Thu, 27 Feb 2025 00:03:34 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E4FD53F6A8;
	Thu, 27 Feb 2025 00:03:16 -0800 (PST)
Date: Thu, 27 Feb 2025 08:03:08 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
	sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z8Ab_wrO8JgSD_D0@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_000322_727356_992FEF6D 
X-CRM114-Status: GOOD (  26.37  )
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

On Wed, Feb 26, 2025 at 12:31:27PM +0300, Dan Carpenter wrote:
> On Wed, Feb 26, 2025 at 09:55:21AM +0100, Johan Hovold wrote:
> > On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> > > On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:
> > 
> > > >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > > >  			     u32 domain, void __iomem **p_addr,
> > > > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > > > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > > > +			     bool skip_check)
> > > 
> > > This does not look like it will scale.
> > 
> > After taking a closer look, perhaps it needs to be done along these
> > lines.
> > 
> > But calling the parameter 'force' or similar as Dan suggested should
> > make it more readable.
> > 
> > > 
> > > >  {
> > > >  	int ret;
> > > >  	u32 flags;
> > > > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> > > >  
> > > >  	/* Check if the MSG_ID supports fastchannel */
> > > >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > > > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > > > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> > > 
> > > Why can't you just make sure that the bit is set in attributes as I
> > > suggested? That seems like it should allow for a minimal implementation
> > > of this.
> > 
> > My idea here was that you could come up with some way of abstracting
> > this so that you did not have to update every call site. Not sure how
> > feasible that is.
> > 
> 
> I'm having a hard time finding your email.
> 
> Why does the scmi_proto_helpers_ops struct even exist?  We could just
> call all these functions directly.  Do we have plans to actually create
> different implementations?
> 
> If we got rid of the scmi_proto_helpers_ops struct then we could just
> rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> and create a default wrapper around it and a _forced() wrapper.

These are common helpers for all the protocols to avoid endlessly
repeating the same code pattern (like fc_init or iterators) and they are
laid out this way to be usable by any protocol even if you compile it as
a module WITHOUT the need of EXPORTing any of these symbols....same
reason why all protocol ops exposed in scmi_protocol.h are defined to be
accessed using an instance handle....trying to limit as much as possible
EXPORTing symbols beside the basic needs...specially because SCMI
specifes a protocol that is extensible by design both for standard and
vendor protocols, so it would soon became a hell to maintain such an
API..I mean just look at scmi_protocol.h...these helpers are made
accessible this way for the same reasons...same for the xops
(beside also not being overlying appreciated in the Android world to
ass an excessive number of EXPORTed syms)

Thanks,
Cristian

