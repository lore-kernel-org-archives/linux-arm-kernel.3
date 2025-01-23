Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8417C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 19:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2VCOEQAK19ULSsk2vqSc2GTpqBfe0PtJgwMdKQhESkg=; b=fcjm/H5Ye3pzo5fN9C/t97OXDY
	GJAM7yYHBsC7P84d41VW5CMAtiCWovVCy1RIyEQp0Dcz3jdgds9H0J8J4BvzyMJsnhcisKepU9BLi
	v9aW/sPJKJw3LVQhzz3Gry68pw6LkFl5E2V2ay3Wr35xS9PrVjLrov56M4DUSO9iSsUIiODyA1BgA
	F3BP52PBZGvAwmvFQnl45TGhbRK6jnHQGq1euUs8mP+bkhFBPhe08c14L1EBxf8+S6AiC2iq14Hkt
	hmdYwM49KQrrOv240pebmAWX9BKBMgKpL7+/54jGflEZ6QjUEYrlyT1lnev3Ijh46cp2Sn3fmcd3/
	0QRfq2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3GS-0000000DB80-28CI;
	Thu, 23 Jan 2025 19:53:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb3CN-0000000DAVV-3PfK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 19:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1786A1063;
	Thu, 23 Jan 2025 11:49:32 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4AE1B3F5A1;
	Thu, 23 Jan 2025 11:49:02 -0800 (PST)
Date: Thu, 23 Jan 2025 19:48:53 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: jack21 <jackhuang021@gmail.com>, sudeep.holla@arm.com,
	cristian.marussi@arm.com, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Huangjie <huangjie1663@phytium.com.cn>
Subject: Re: [PATCH] dirvers: scmi: poll again when transfer reach timeout
Message-ID: <Z5KdJa0QOIYIIRv4@pluto>
References: <20250123083323.2363749-1-jackhuang021@gmail.com>
 <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0fbc4cf-21ae-4332-8842-73f0467d16ff@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_114907_945270_653DEC69 
X-CRM114-Status: GOOD (  23.79  )
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

On Thu, Jan 23, 2025 at 01:38:30PM +0300, Dan Carpenter wrote:
> s/dirvers/drivers/
> 
> On Thu, Jan 23, 2025 at 04:33:24PM +0800, jack21 wrote:
> > From: Huangjie <huangjie1663@phytium.com.cn>
> > 
> > spin_until_cond() not really hold a spin lock, possible timeout may occur
> > in preemption kernel when preempted after spin_until_cond().
> > 
> > We check status again when reach timeout is reached to prevent incorrect
> > jugement of timeout.
> > 

Hi,

probably another not so short email of mine :P ... 

> 
> I suspect the real issue is that we exit the spin loop when
> try_wait_for_completion(&xfer->done) is true.  Probably we should add
> that as a Fixes tag?:
> 

The Kernel SCMI stack, acting as an SCMI agent have to cope with the
possible (even though rare) scenario of receiving Out of Order messages
when dealing with async commands...

...IOW, what to do if, after having issued an AsycnCmd, the Delayed response
is received BEFORE the corresponding immediate reply to the initial request:
such a wicked (and rare) situation could be the result of a misbehaving
platform server OR simply due to parallellization of activies on the A2P
and P2A on some transports, i.e. platform sent reply and delayed_response
in the correct order but the transport delivered those OoO, being
transmitted on 2 discinct physical  channels...hard but not impossible.

Kernel side we address this OoO scenario by assuming that, if a valid
Delayed Response to a in-flight Async-cmd is received on teh P2A chan,
before the immediate A2P reply, the transaction itself is good and we
can progress by just logging and ignoring/swallowing the missing
immediate-reply, that will probably arrive later, and just carry on
processing the Delayed Response.

In order to do that, we maintain, in fact, a per-message state-machine,
and inside scmi_msg_response_validate(), when we detect the OoO condition,
we cause the wait-for-immediate-reply to terminate by issuing forcibly a
complete(xfer->done)....

...this works straight away for the non-polled IRQ transactions since
causes the wait_for_completion() to terminate cleanly, BUT in order to
cut-short also the busy-wait in the polling case we need that additional
try_wait_for_completion()....so as not to spin forever for a message
that we dont care anymore...
[ note that any late arriving immediate-reply will be in teh future
 discarded at this point]

For this reason, I think that this patch, while correctly checking the
poll_done() condition when the spinloop terminates for the reason
explained in the commit-message, it should also check if the loop was not
instead forcibly terminated by the OoO scenario...if not, we will end up
considering the polling to have timeout, while instead it was forcibly
terminated by the OoO state machine complete() and just want to ignore
such missing message...

So what about instead of checking (untested):

+	if (!completion_done(&xfer->done) &&
+	    !info->desc->ops->poll_done(cinfo, xfer))

... so that we determine that the polling has timed out only when:

- the immediate-reply has NOT been received [!poll_done()]

 AND

- we were NOT forcibly make to ignore the missing reply in an OoO scenario
    [!completion_done]

NOTE THAT xfer->done on the polling path is ONLY completed in case of OoO.

> Fixes: ed7c04c1fea3 ("firmware: arm_scmi: Handle concurrent and out-of-order messages")
> 
> Btw, the scmi_xfer_done_no_timeout() has a confusing name, because it
> does timeout.  Was the "_no" an accident?
> 

Agreed. Not sure of the history of the bad naming...

Thans,
Cristian

