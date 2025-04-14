Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBE7C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 08:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXVX2IdtdTa7ShJMcJ9YGyDSfeDx/KtqH3o3UIQh1/k=; b=AtwNIS+/IOJJobfrqGtveAYi33
	HtQ07JcKosJdwlskZDBIhfPZIrbf8lnNAa3yrnIqw0upeNnxUqRR3UTWyJXZANNBVtKsWesbPKoiP
	JQ80/uDnw3N1edlzfAzTJerSiQ8jvVrLcq6i80mEw7v8cuyTNw00VqWvDpJddwU1aEgsiJlL5FiW+
	V+72adOu8w2JPVC/qx9cN76QajD0gv7Kob6mLGvu3OcnFJG2JV/T/0hcWbB6VoI7vONpB0Azf5cwq
	YvKylhZ36r9gfPt/XY1xHualje5K9tIQezKabGwk3bgPX9L7JSIfcr1Ugt98AfqWqMIZeG292q5nr
	/G3us9Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FMp-000000018fD-2tvW;
	Mon, 14 Apr 2025 08:40:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FKx-000000018Sc-2IJo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:38:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CADEA1007;
	Mon, 14 Apr 2025 01:38:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96F8B3F694;
	Mon, 14 Apr 2025 01:38:35 -0700 (PDT)
Date: Mon, 14 Apr 2025 09:38:23 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_zJbRH7vQ0TswGg@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <20250409-fierce-astonishing-bug-dd2adb@sudeepholla>
 <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D94LGXDHGVBD.1GB1GHOWORHMU@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_013839_666444_6EFF16BA 
X-CRM114-Status: GOOD (  25.62  )
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

On Sat, Apr 12, 2025 at 01:39:45PM +0300, Matthew Bystrin wrote:
> Sudeep,
> 

Hi Matthew,

> Thanks for taking your time.
> 
> Sudeep Holla, Apr 09, 2025 at 14:12:
> > The start update should retain as soon as Platform uC acks the request.
> > And 2 notifications can be sent out for update procedure started and
> > completed. I don't see any issue there. What is the semantics you are
> > talking about ?
> 
> I'm going to refer to section 4.1.1 from the spec, where stated following about
> delayed responses,
> 
> "Messages sent to indicate completion of the work that is associated with an
> asynchronous command" 
> 
> Compared to notifications,
> 
> "These messages provide notifications of events taking place in the platform.
> Events might include changes in power state, performance state, or other
> platform status"
> 
> So before I implemented mentioned driver I had red this two and had chosen
> delayed responses, because it had seemed more appropriate. Details below.
> 
> > Even delayed response as some timeout so I would rather prefer to use
> > notifications
> 
> Hmm, I see.
> 
> > in your usecase as it is completely async.
> 
> Just to emphasize, according to the spec I don't think that delayed responses
> and events have different degree of asynchrony. The difference is in the
> initiator of 'messaging'. Events are sent by platform to indicate its' state and
> delayed responses are sent to indicate status of previously requested operation.
> 

Delayed reponses are certainly better than notification for completion
of agent initiated actions BUT this does not exclude the usage instead
of a sync-command to start the operation and a notification to signal
its completion...depends really on the case.

The classic example of a needed async-cmd is reading a sensor that takes
a long time due to its own physical nature...

AFAIU, in this case you have an async operation whose completion time is
considerably longer (so you aim to configure a specific timeout for that
specific command) BUT it is also bound to the payload itself that you
are trying to load AND/OR to other platform specific HW charactristics
(like how slow are your flashes in this HW releases...): this means that
while the sensor slowness is stable and predictable, and the timeout can
be fixed a-priori, in this case you risk to have in the future anyway to
have to refine and tune this ad-hoc custom timeout....while you'd have
none of this issue by simply waiting for a notification (ofc you could
have to set a large timeout on your side anyway while waiting for
notifs...)

...unless you plan to dynamically tune the async-cmd timeout at runtime
based on the known payload size (that means more commands to query the
soon-to-be-flahsed payload) but anyway this does NOT solve the fact that
the platform characteristics can influence the length of the operation.

Thanks,
Cristian

