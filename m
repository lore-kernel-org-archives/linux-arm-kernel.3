Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A405BC021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 09:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zqqxxvsosm5k5/6B5sycRIMayPxV7lt47xQp/+4Gtsk=; b=3qY0zNSuEJXwPr+MZhikj4FHIt
	ae97KXhzDAcYV96Wy3E4PfEiNIwKss+dlIS9zcuI+Jgm+bS381PyTF8kPK7X/62f4f8PqNsFyv6gA
	f9+pXbnpkQP0AtViMK2wQoA7lsu+TBTw62emY/zAO2l0U2SvK9bq2ZrQ9ldW0vjSqhz7e+rr81lpw
	Jzg+xOgkOhMK+7LQUt3ILmnxL2ap4Aet2kVtbojZaR2ryT3FsixCShv8qTm1TQA0lsTbsPh2ejm3O
	PLKERuHbbdPnv9E7B1qNAJmJZD9c9ldQIJ1J3zaAuGqjUsiQlQNOTZUz1Vtoa+wFmR9LH9AifFQBR
	G0gdlfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDd5-000000033sr-35H8;
	Wed, 26 Feb 2025 09:22:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnDC9-00000002ydM-3kJV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 08:55:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 722A95C40BC;
	Wed, 26 Feb 2025 08:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01663C4CED6;
	Wed, 26 Feb 2025 08:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740560109;
	bh=k9Imo4Ndb+Av6okiCY/htILEn6oyEwrXzbQnbAjSjo4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mVDJWhkLl84U3eyL0yjbQXFgShXMKq3Ay6Mog2dflRLeJZVCBeTBR+E9F43TEA5iP
	 wSN1Foc7A2kFeeM5JFDWbAbEPhtch38XJQKpb0POGXr0rHq+yWxFd74TN6LBUy9yac
	 eXBzIfoIPpGBFqgorhgz8jVDVot8nifzXyFOU2KbOXy3c0o2Ix/HvjvGWE9WsQviKz
	 iajrmmlAW0TY0/le6hESGZBTfxSJ/I2q3V9oPzsMntmRkLAJ1+LwK33W6s0GF+6yK6
	 C3NtvikLi2Z+zRNhFjoSxAev4RpXFtyghSuZQdEYxnZdvh+se/tRh4JfZkWZJqKJbe
	 rbJIlfRH0Tw8w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tnDCL-000000007d2-0AyI;
	Wed, 26 Feb 2025 09:55:21 +0100
Date: Wed, 26 Feb 2025 09:55:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z77M5iXHQsdMptWm@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_005509_983866_5FED5824 
X-CRM114-Status: GOOD (  16.05  )
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

On Wed, Feb 26, 2025 at 09:12:23AM +0100, Johan Hovold wrote:
> On Wed, Feb 26, 2025 at 08:13:38AM +0530, Sibi Sankar wrote:

> >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  			     u8 describe_id, u32 message_id, u32 valid_size,
> >  			     u32 domain, void __iomem **p_addr,
> > -			     struct scmi_fc_db_info **p_db, u32 *rate_limit)
> > +			     struct scmi_fc_db_info **p_db, u32 *rate_limit,
> > +			     bool skip_check)
> 
> This does not look like it will scale.

After taking a closer look, perhaps it needs to be done along these
lines.

But calling the parameter 'force' or similar as Dan suggested should
make it more readable.

> 
> >  {
> >  	int ret;
> >  	u32 flags;
> > @@ -1919,7 +1920,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  
> >  	/* Check if the MSG_ID supports fastchannel */
> >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > -	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes))
> > +	if (!ret && !MSG_SUPPORTS_FASTCHANNEL(attributes) && !skip_check)
> 
> Why can't you just make sure that the bit is set in attributes as I
> suggested? That seems like it should allow for a minimal implementation
> of this.

My idea here was that you could come up with some way of abstracting
this so that you did not have to update every call site. Not sure how
feasible that is.

> >  		return;
> >  
> >  	if (!p_addr) {

Johan

