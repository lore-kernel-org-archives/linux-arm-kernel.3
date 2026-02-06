Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616AEECD9BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 03:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9PMDCR5M61UjnLo8qS3MJxI0E0obebtYNPar4LQ1dU=; b=bqCOEg+eEKu2YUOIm5MdZlOgvb
	xNE3ibb9ih681QfCb27OUdUdKOGrK6XYBQpTGLhJ48cIh9n4OOCrFatg/LjD9rQTVlaqGcvaRhiw5
	uZESTJPcYaGEOpoBlGsRWFpFciXlUGw7CmmlQEcWXptWppQUD4fbIiDo34CHC/DsgJkVhIxRXXnaw
	UuTLShd2ukTa7eOg+x2BsE0rkLpfqSkZVKG5n4vwOtLfie1oV4J2zCGXjT57PpDP7nLmBi+ZXIvrf
	x5IC56oOHE6uR/M2bMHRKawfsgmr/T8Hxl3bbp3FdXF2v+3z5CIDBXJTnJAdzGWW52o0fTKdKSzWL
	4Ma7JA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCdx-0000000AoTX-1PUH;
	Fri, 06 Feb 2026 03:36:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voCdv-0000000AoTM-2quC;
	Fri, 06 Feb 2026 03:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B121B6001A;
	Fri,  6 Feb 2026 03:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1939BC4CEF7;
	Fri,  6 Feb 2026 03:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770348986;
	bh=3MP4Io1FQNfw2qWLKxUuFzooJmPrZrW7egR2WNYgQyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcXWaXHnWXrMpP6QccpsnPpusgRX3HGIa99QmRQUCUv+oKnuQp+1HhS9WiqBG+rb8
	 vUysoDmFr9SR+Fi11go0BDmC/XOByaUIyemB383sCfTC3d22nG2pfGv6W9VKeH7DLS
	 QtKSzl+MLSNLEMczijA35dqvQhZeg7kadKGOgIg787Zo7fwfE5Z7fhni9BRmXYQZJB
	 uVtGwLacLxoAq9zJcVA4ywpGg9bGcyRmFKDm4QNB0m0nrtpcWTRkhll8eJNzSDWYKV
	 eKlhsUb7tYXmEGZa+/0PYmIk7NTxaevN14yQW7FPG7D+unaUU9HnNkUV8kUi4sXHwu
	 v7ifhsY6UAs5g==
Date: Fri, 6 Feb 2026 03:36:22 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] remoteproc: mediatek: Unprepare SCP clock during system
 suspend
Message-ID: <aYVhtt_d0b22XxkV@google.com>
References: <20260204085442.1822123-1-tzungbi@kernel.org>
 <a880d5d9-348e-4777-ae7f-69bdf7794e58@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a880d5d9-348e-4777-ae7f-69bdf7794e58@collabora.com>
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

On Thu, Feb 05, 2026 at 01:30:42PM +0100, AngeloGioacchino Del Regno wrote:
> Il 04/02/26 09:54, Tzung-Bi Shih ha scritto:
> > Prior to commit d935187cfb27 ("remoteproc: mediatek: Break lock
> > dependency to prepare_lock"), `scp->clk` was prepared and enabled only
> > when it needs to communicate with the SCP.  The commit d935187cfb27
> > moved the prepare operation to remoteproc's prepare(), keeping the clock
> > prepared as long as the SCP is running.
> > 
> > The power consumption due to the prolonged clock preparation can be
> > negligible when the system is running, as SCP is designed to be a very
> > power efficient processor.
> > 
> > However, the clock remains prepared even when the system enters system
> > suspend.  This prevents the underlying clock controller (and potentially
> > the parent PLLs) from shutting down, which increases power consumption
> > and may block the system from entering deep sleep states.
> > 
> > Add suspend and resume callbacks.  Unprepare the clock in suspend() if
> > it was active and re-prepare it in resume() to ensure the clock is
> > properly disabled during system suspend, while maintaining the "always
> > prepared" semantics while the system is active.
> > 
> > Fixes: d935187cfb27 ("remoteproc: mediatek: Break lock dependency to prepare_lock")
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> Would be great if you could mention that in this driver, at the moment of writing,
> there is no .attach() callback, hence rproc->state can never be RPROC_ATTACHED (as
> in case that would also leave the clock prepared).

Thanks for your review.  Add it in the commit message and code comment in
v2[1].

[1] https://lore.kernel.org/all/20260206033034.3031781-1-tzungbi@kernel.org/

> > +#ifdef CONFIG_PM_SLEEP
> 
> ...you don't need this ifdef as when CONFIG_PM_SLEEP is not set the macro
> SET_SYSTEM_SLEEP_PM_OPS is stubbed out (check pm.h).
> 
> After removing the ifdef, there'll be something to change, specifically:
> 
> > +static int scp_suspend(struct device *dev)
> 
> static int __maybe_unused scp_suspend(struct device *dev)
> {
> 
> > +{
> > +	struct mtk_scp *scp = dev_get_drvdata(dev);
> > +	struct rproc *rproc = scp->rproc;
> > +
> > +	/* Only unprepare if the SCP is running and holding the clock */
> > +	if (rproc->state == RPROC_RUNNING)
> > +		clk_unprepare(scp->clk);
> > +	return 0;
> > +}
> > +
> > +static int scp_resume(struct device *dev)
> 
> static int __maybe_unused scp_resume(struct device *dev)
> {

Fix them in v2 too.

