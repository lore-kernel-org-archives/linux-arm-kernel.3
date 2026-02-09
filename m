Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8B6E81BD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 15:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDz8atvRGi+5zRwzB5e64TtukIkeyPA7/zgUTWBzFvU=; b=Iu0Pw6AYsTm3sMSw1bGaVmVtjW
	JIw8uEkiRX3KCZ63VrwB56T0wOFfM6HkgkdV84UOxuApP4JKDz/yODBGivr2z8SCX57QlavGgwkGy
	19vokI5T64PjeZuKvqUCB6kfneE4Uxcj7GLnwhHxa5ndIJ2XQPvFaBzgUStKugjfIP84uTyPohliI
	99oB3wYKCy14BpthjGnvSLig9DsQv0EU3aygh8ez6FDcqhoG9mEt6FbnprDNof+aSWV3HUE4JucQs
	+aILUzbPppoOeQ7ggywjC+HIB4ojIk+Q4jXPLoJXykLBK5VmmPAtIEtshdn19Exm0BijhUwnaOuUV
	A5/B2EAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTN8-0000000FctF-2HG0;
	Mon, 09 Feb 2026 15:40:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTN7-0000000Fct5-2Lqw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 15:40:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D15260008;
	Mon,  9 Feb 2026 15:40:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3742C116C6;
	Mon,  9 Feb 2026 15:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770651620;
	bh=5DRu3dMpaADpDKLopx8dO5LEkVz+35Fl6LlXv05MFMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E3giKneRdTIS8o5HAfKsCgyA3Vk576TJHuj27G++WpF4bVwo8cqDkL6Qmv+VYPGZ8
	 cuixX8S9UWdGdgfLNEhjWW+EobdUEmwbMpxPsUxHYKe2KuU+agUKPUb/oWYn35b27L
	 +GtecYO4Men19p1sVRPAWK38hPds7C0lkC1Rq2OvR9enQA/5TK2AbLY7olteRNqLCq
	 xJz0El8ZBaNm7AuLJLQxUx/LZGECtS+u6RnXBYid20/LgnxlvkWnspo+l0HdqD8tw6
	 cj29zBhNWE9FTbRHQQ2HoCrzcD3K5DGDHNgsfMuP9tHFWAvFpfgDJ/z1ciUy6p6Lr2
	 MqqCGfPCz2Nig==
Date: Mon, 9 Feb 2026 09:40:15 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: jassisinghbrar@gmail.com, Frank.Li@nxp.com, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, mathieu.poirier@linaro.org, 
	michal.simek@amd.com, nm@ti.com, rafael@kernel.org, robh@kernel.org, 
	s.hauer@pengutronix.de, shawn.guo@linaro.org, ssantosh@kernel.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages;
 Introduce mbox_ring_doorbell()
Message-ID: <yotr3aia3gra4jmlykqadqwi45lphhdyx7tt4n5cdwcungfpbd@gns6bb6m3vmz>
References: <20260208040240.1971442-1-dianders@chromium.org>
 <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
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

On Sat, Feb 07, 2026 at 08:01:23PM -0800, Douglas Anderson wrote:
> The way the mailbox core behaves when you pass a NULL `mssg` parameter
> to mbox_send_message() is a little questionable. Specifically, the
> mailbox core stores the currently active message directly in its
> `active_req` field. In at least two places it decides that if this
> field is `NULL` then there is no active request. That means if `mssg`
> is ever NULL it will cause the mailbox core to think is no active
> request. The two places where it does this are:
> 
> 1. When a client calls mbox_send_message(), if `active_req` is NULL
>    then it will call the mailbox controller to send the new message
>    even if the mailbox controller hasn't yet called mbox_chan_txdone()
>    on the previous (NULL) message.
> 2. The mailbox core will never call the client's `tx_done()` callback
>    with a NULL message because `tx_tick()` returns early whenever the
>    message is NULL.
> 
> Though the above doesn't look like it was a conscious design choice,
> it does have the benefit of providing a simple way to assert an
> edge-triggered interrupt to the remote processor on the other side of
> the mailbox. Specifically:
> 
> 1. Like a normal edge-triggered interrupt, if multiple edges arrive
>    before the interrupt is Acked they are coalesced.
> 2. Like a normal edge-triggered interrupt, as long as the receiver
>    (the remote processor in this case) "Ack"s the interrupt _before_
>    checking for work and the sender (the mailbox client in this case)
>    posts the interrupt _after_ adding new work then we can always be
>    certain that new work will be noticed. This assumes that the
>    mailbox client and remote processor have some out-of-band way to
>    communicate work and the mailbox is just being used as an
>    interrupt.
> 
> Doing a `git grep -A1 mbox_send_message | grep NULL` shows 14 hits in
> mainline today, but it's not 100% clear if all of those users are
> relying on the benefits/quirks of the existing behavior.
> 
> Since the current NULL `mssg` behavior is a bit questionable but has
> some benefits, let's:
> 
> 1. Deprecate the NULL behavior and print a warning.
> 2. Add a new mbox_ring_doorbell() function that is very similar to the
>    existing NULL `mssg` case but a tad bit cleaner.
> 
> The design of the new mbox_ring_doorbell() will be to maximize
> compatibility with the old NULL `mssg` behavior. Specifically:
> 
> * We'll still pass NULL to the mailbox controller to indicate a
>   doorbell.
> * Doorbells will not be queued and won't have txdone.
> * We'll call immediately into the mailbox controller when a doorbell
>   is posted.
> 
> With the above, any mailbox clients that don't mix doorbells and
> normal messages are intended to see no change in behavior when
> switching to the new API. Using the new API, which officiall documents
> that mbox_client_txdone() shouldn't be called for doorbells, does
> allow us to remove those calls.
> 
> There are two differences in behavior between the old sending a NULL
> message and the new mbox_ring_doorbell():
> 
> 1. If the mailbox controller returned an error when trying to send a
>    NULL message, the old NULL message could have ended up being queued
>    up in the core's FIFO. Now we will just return the error.
> 2. If a client rings a doorbell while a non-doorbell message is in
>    progress, previously NULL messages would have been "queued" in that
>    case and now doorbells will be immediately posted.
> 
> I'm hoping that nobody was relying on either of the two differences.
> In general holding NULL messages in the mailbox core's queue has odd
> behavior and is hard to reason about. Hopefully it's reasonable to
> assume nobody was doing this.
> 
> As mentioned above, it should be noted that it's now documented that
> "txdone" shouldn't be called (by both mailbox drivers and clients) for
> doorbells. That being said, in most cases it won't hurt since the
> mailbox core will ignore the bogus "txdone". The only case where it's
> critical for a mailbox controller not to call "txdone" for a doorbell
> is when a mailbox channel mixes normal messages and doorbells and
> cares about the txdone callback. Specifically, when you ring a
> doorbell and immediately send a normal message, if the controller
> calls "txdone" for the doorbell it could look as if the normal message
> finished before it should have. This issue also would have happened
> with the old NULL `mssg`, though.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I like how this cleans up the logic hacks, but perhaps even more so how
it takes a step towards cleaning up the mailbox API when it comes to
expectations between client and provider implementations.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

