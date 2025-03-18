Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861C8C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2T2kVjVJTomMfDSeGvL/4MwKDplmr/KjUcacd7YzXgQ=; b=aeToW2HXXYv8rZo/AY2WF6DgCP
	7sW170y3iFsQ1VM1BCVQlqP1xaV1sKE13IzOg0sZYXCudid+Wi1pjHMhFALBZj6ODJJNXEFz5KnHx
	fRC4FjvkYNrq88kxKvqRdbBsiLXfF7YuQWninN0zimQHhlV7BBBWoX99Cbbwb6jY3G4xyUOu+D8Sx
	w5B35pxElrsZlDUt2FTiB312oD69XMBxiJ2RzvGkUpc0gNKsJOaXq9ojQHImHqb57R3IWWukRHZvL
	P35wOx6F6iJH15TcwfBBiodez+kYi2Z2Cxe32BnwWPCKKsFy9bdh+F3WIjJDnMNgBfBkjmRb6h2ei
	tldZOm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuXFN-000000063jT-28rI;
	Tue, 18 Mar 2025 13:44:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuX0g-000000061cM-2uvb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 13:29:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 615B013D5;
	Tue, 18 Mar 2025 06:29:40 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A79783F673;
	Tue, 18 Mar 2025 06:29:28 -0700 (PDT)
Date: Tue, 18 Mar 2025 13:29:19 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Sibi Sankar <quic_sibis@quicinc.com>, sudeep.holla@arm.com,
	dmitry.baryshkov@linaro.org, maz@kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	konradybcio@kernel.org
Subject: Re: [RFC V6 2/2] firmware: arm_scmi: Add quirk to bypass SCP fw bug
Message-ID: <Z9l1L1WICMYXSoIu@pluto>
References: <20250226024338.3994701-1-quic_sibis@quicinc.com>
 <20250226024338.3994701-3-quic_sibis@quicinc.com>
 <Z77M5iXHQsdMptWm@hovoldconsulting.com>
 <Z77W-fKBUqAALZKJ@hovoldconsulting.com>
 <759226e1-05aa-4ca2-b2f5-7f1a84dc427f@stanley.mountain>
 <Z77l1NflYXTnRyg0@hovoldconsulting.com>
 <Z8AjhHsVT9ZQTtZX@pluto>
 <Z8WKQJcPTQDIXaKD@hovoldconsulting.com>
 <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9kr5ABbqO27_BM-@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_062934_821266_AAFBDFD3 
X-CRM114-Status: GOOD (  37.93  )
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

On Tue, Mar 18, 2025 at 09:16:36AM +0100, Johan Hovold wrote:
> Hi Cristian,

Hi Johan,

> 
> On Mon, Mar 03, 2025 at 11:53:52AM +0100, Johan Hovold wrote:
> > On Thu, Feb 27, 2025 at 08:34:44AM +0000, Cristian Marussi wrote:
> > > On Wed, Feb 26, 2025 at 10:58:44AM +0100, Johan Hovold wrote:
> > 
> > > > Something like that, yes. :) I didn't try to implement it, but it seems
> > > > like it should be possible implement this is a way that keeps the quirk
> > > > handling isolated.
> > > 
> > > I hope next week to have a better look at this, in tne meantime just a
> > > few considerations....
> > > 
> > > Sooner or later we should have introduced some sort of quirk framework
> > > in SCMI to deal systematically with potentially out-of-spec FW, but as
> > > in the name, it should be some sort of framework where you have a table of
> > > quirks, related activation conditions and a few very well isolated points
> > > where the quirks are placed and take action if enabled...this does not
> > > seem the case here where instead an ad-hoc param is added to the function
> > > that needs to be quirked...this does not scale and will make the codebase
> > > a mess IMHO...
> > 
> > Sounds good. At least we have a good understanding now of how this
> > particular firmware is broken so it would be great if you could use
> > this as a test case for the implementation.
> > 
> > In summary, we need to force the use of a fast channel for
> > PERF_LEVEL_GET on these machines, or possibly fall back to the current
> > behaviour of only using the domain attribute to determine whether the
> > fast channels should be initialised.
> > 
> > The latter may allow for a less intrusive implementation even if we'd
> > still see:
> > 
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:0] - ret:-95. Using regular messaging.
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:1] - ret:-95. Using regular messaging.
> > 	arm-scmi arm-scmi.0.auto: Failed to get FC for protocol 13 [MSG_ID:6 / RES_ID:2] - ret:-95. Using regular messaging.
> > 
> > when not supported for all messages (e.g. with the current firmware).
> 
> > > Anyway, after all of this babbling, I know, talk is cheap :D...so now I will shut
> > > up and see if I can prototype something generic to deal with quirks, possibly
> > > next week...
> 
> Have you made any progress on the quirk framework prototyping?
> 

I have not forgot, tried a few things, but nothing really to post as of
now...dont wnat to rush either .... I was hoping to push something out at
the end of this next merge window...

> Do you need any input from Sibi on the protocol versioning for that?
>

No I am fine, I am planning anyway for something generic enough to be
easy then to plug your own quirks separately...

> We'd really like to enable cpufreq on this platform and ideally in 6.15.
> I think that should be possible given that we now understand in what
> ways the firmware is broken and what is needed to handle it even if we
> still need to decide on how best to implement this.
> 

v6.15 seems hard/impossible even using the original Sibi patch 
given the usual upstreaming-timeline of the SCMI stack where everything has
to be usually reviewed and accepted by rc4/rc5.....so both Sibi initial
patch and my own babbling were alreaady sort of late.

Thanks,
Cristian

