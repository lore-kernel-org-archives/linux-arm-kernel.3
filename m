Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FEDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 21:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7gv7DO3sRanhSag9LvnX9LZtxm45e9XO0imyrqaXXo=; b=rJs97sDltZWQXhBcJdLd6L322T
	UnAtqH9DC5GV+N6ztUMu5gMbqouelwc5sIqQGQFGgUukS5BBR2wmzKOO2/Was5LTNmj0kVK+Zj3ne
	P0qsUT/QGKAKm1N5RSI8/DyZ+rA7IjSURr3f2kV3LQn1rypqSNCGmUJixum8QcinrDFzLlMw+ailA
	vgMtiGft4si36iJF2l8JjwSn/V2b3jOfJwQnSxe7uAHwToPYylDGio/Su9cEHo0WpHWUYI1kIgOyT
	1KOJpDKrK6jHKlZqhrMbdFhaovl/YftZLNWiIBmBlfWIElShFrNKKc7aKvC1U9Dv0tXt4Pk9n/g4W
	efaY0CTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwHd-00000003hBm-3dGP;
	Thu, 09 Jul 2026 21:27:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whwHc-00000003hBd-1qr5;
	Thu, 09 Jul 2026 21:27:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E9B2D43C37;
	Thu,  9 Jul 2026 21:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CC11F000E9;
	Thu,  9 Jul 2026 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783632467;
	bh=K7gv7DO3sRanhSag9LvnX9LZtxm45e9XO0imyrqaXXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BvuWBuDz7IFj4YppCCGpHWM4n2RrTqqSFf9MnF4JteCmXladxy8roihQmpUhe3zW2
	 3kU8DWcbn/KDobOugs7FtOq/4oq5zPpy/f7UQZXXrC1+XYC+1jHng8QLyqLj7Y7DHq
	 taA14sTXy0s365x58bM8TLUdKUQqelteSYdhO54s9DYANJMZtw8j6OdxxyW0BH4/V5
	 EEYaEI4nMb9BU2GqTL9+jRdM+sTja/Olu+4ViQpxNzf8zRwx3B+P2/d0XuUqO1IRNa
	 wenYWNjnmR6XS4ww6wCOKazCY5Uc5dndlQdotWYqSkbVfg2HFhK7+GfpO3cC6r164u
	 I8FGpqDu+VonQ==
Date: Thu, 9 Jul 2026 16:27:44 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] remoteproc: abort subdev stop sequence on first
 failure
Message-ID: <alAN2t2C5twxuIjd@baldur>
References: <20260611094851.dkg63rqztsv2pre7@hu-mojha-hyd.qualcomm.com>
 <aiqF5mh1PvWpH3L5@linaro.org>
 <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611105506.llvya5tda4xsd2lo@hu-mojha-hyd.qualcomm.com>
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

On Thu, Jun 11, 2026 at 04:25:06PM +0530, Mukesh Ojha wrote:
> On Thu, Jun 11, 2026 at 11:54:46AM +0200, Stephan Gerhold wrote:
> > On Thu, Jun 11, 2026 at 03:18:51PM +0530, Mukesh Ojha wrote:
> > > On Tue, Jun 09, 2026 at 01:43:17PM +0200, Stephan Gerhold wrote:
> > > > On Tue, Jun 09, 2026 at 03:52:52PM +0530, Mukesh Ojha wrote:
> > > > > If a subdevice fails to stop, it indicates broken communication with the
> > > > > DSP. Continuing to stop further subdevices against an unresponsive
> > > > > remote processor could close rpmsg devices that could remove the memory
> > > > > mapping from HLOS and in case if remote processor touches those memory
> > > > > can result in SMMU fault.
> > > > > 
> > > > > Change rproc_stop_subdevices() to return int and abort on the first
> > > > > failing subdev. Propagate the error through rproc_stop() and
> > > > > __rproc_detach() so callers are aware the teardown did not complete
> > > > > cleanly.
> > > > > 
> > > > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > 
> > > > But what would callers do about this? If you abort the teardown sequence
> > > > half-way through you now have an inconsistent half-stopped state that
> > > > neither a new call to stop() nor a new call to start() could recover
> > > > from. That doesn't sound much better than the SMMU fault. Or am I
> > > > missing something here?
> > > 
> > > SMMU fault result in device crash while other is non-functional remote
> > > processor. From Linux side, we do not know the state of remote processor
> > > when the timeout happens..cleaning the subdevices can result in the
> > > debug data being lost for hung remote processor.
> > > 
> > 
> > Ok, but how do we go from here? Do we expect that the system would have
> > some userspace monitoring daemon that would collect the debug data and
> > then reboot the device to make the remoteproc work again?
> 
> I would expect the manually collected crash dump in this state to find
> out the exact reason for remoteproc being stuck instead of ignoring it
> and claiming a graceful shutdown.
> 

We need to consider the scenario where there are other users running
this code than you, and as Stephan suggest, they probably expect the
system to recover (by some means). Few people would be expected to pull
out their JTAG hardware and start hacking away...

> Whatever we do here, the remote may be dysfunctional without a reboot,
> but cleaning the rpmsg device will clean all the required debug data, or
> at least if possible, tell the rpmsg driver with the rproc state that
> shutdown was tried but was not graceful.
> 

That's certainly something we need to take into account, but does the
use of "may be" leave room for the possibility that we have a
recoverable error?

Also remember that the user might be in the middle of an important video
conference when the CDSP hits this error, so we don't necessarily want
to reboot the system just because we enter such state - there's user
policy involved here.

Regards,
Bjorn

> > 
> > With these changes, I don't see how you would start the remoteproc again
> > without fully rebooting the board. Calling start()/stop() on the
> > subdevices again would lead to crashes because some of them are in
> > started state and some of them are in stopped state and we don't even
> > know which one is in which state.
> > 
> > Thanks,
> > Stephan
> 
> -- 
> -Mukesh Ojha

