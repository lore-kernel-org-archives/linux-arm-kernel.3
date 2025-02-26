Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024D0C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 10:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwYT3hIzJ8YHSPIWadrIR8Mtg13RLpkPatW2+YOHSrg=; b=O6iuh9sQOi34SKaImuSyWW+E97
	GOUS1ntNKM9JewDUFDuc+fpzi04Ku7BAcwnrmc2CJy4xjOlBCDMCPe21MWpO6+dGv+aWSgMFUKRjK
	qrkUJpFlCAdBw2bHWcUX7ZJp2A51PFRb+FTXglQkAu1bvIYEUj8UjFTAi8lGRImOI1ZD6RQrVg3kL
	5gVkCGwaOS3iBIDITkJ6WmwvgnbCcXflzvO1jggxtxFu6OQH/HzridGgILVoEscSVwkiOzoLd9DCa
	C/9hXpEam/yt6sIJDSd16jABFK6UjWEtGALQoc9Z7oj9k+/WaWKcGHbTL8CxhsgRNegCccfM6c7D5
	r/E91qMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEFz-00000003DBv-08Gb;
	Wed, 26 Feb 2025 10:03:11 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnEBX-00000003CDu-2EXb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 09:58:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 56DEC6127A;
	Wed, 26 Feb 2025 09:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9321DC4CEE9;
	Wed, 26 Feb 2025 09:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740563914;
	bh=EvazlJDvIpSU8xWaHY1rfrsB8hsCd5XKw0hdPe8UWiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Avlx0PYeAPsIbsX7doARLDiRl4MUL0bVhphVW7ezkhMZnD1TLd2dYM61UpYblKun/
	 uinfftczSMAtwDsD9MDph6dKFfELQjF9NfBjEu6TqTENnjYTW8ceYq/kPLGe9XZJ50
	 n5AVTYKQVwn9CdiCs8MbsvEr8/VbOsxdr9pgI39RMn4O6yebHjnq6OZQXP9EJnHjRG
	 rHBqc+DbFfyeYhzF0nm353hO9GOrPDTPuAvW7/xvY/7o9z/TzB4tZfNsqgPmYntVda
	 S7dYN3J9T/gDblDWf+RyX0r+ONVtOjJJlO7b4FZsHG30ES8SZrzb6KQ8sW2QpDuoaR
	 6UvlYd9EVgpFA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnEBg-000000000Qe-2U3f;
	Wed, 26 Feb 2025 10:58:45 +0100
Date: Wed, 26 Feb 2025 10:58:44 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, dmitry.baryshkov@linaro.org,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77l1NflYXTnRyg0@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
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
> 
> I'm having a hard time finding your email.

	https://lore.kernel.org/lkml/Z4Dt8E7C6upVtEGV@hovoldconsulting.com/
 
> Why does the scmi_proto_helpers_ops struct even exist?  We could just
> call all these functions directly.  Do we have plans to actually create
> different implementations?
> 
> If we got rid of the scmi_proto_helpers_ops struct then we could just
> rename scmi_common_fastchannel_init() to __scmi_common_fastchannel_init()
> and create a default wrapper around it and a _forced() wrapper.
> 
> Some other potentially stupid ideas in the spirit of brainstorming are
> that we could add a quirks parameter which takes a flag instead of a
> bool.  Or we could add a quirks flag to the scmi_protocol_handle struct.

Something like that, yes. :) I didn't try to implement it, but it seems
like it should be possible implement this is a way that keeps the quirk
handling isolated.

Johan 

