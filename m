Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA607CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vocBj1+Ny/M17nvY8HChL8a/9WD7YPQ/xLe6f3dwocg=; b=g0EwgTuCq5IwyjZihnUHSEM4Q7
	QFbXBIr3AvCz29kXr0tVn3Bp/5UlvMjfHeZ7sI9d5Fv0SOoLLU41P3rU2YmS/cmVMLJXCH65fZ3PJ
	PrrUKV8C3Ge08iiu7OMamE4ZlOhp+YXB+BCliupfrd6siuaFToiOAYL12FLefTJfXpgoY1QwDKCOA
	mRRgOQEt3HbvwEwny5WjlYbH0kBSCQ80ZstFLUK/UlY8igcjXyI6z8k6AnC/C7XbV3jLD7rAiZUGq
	OafRsM8K1x+n7qoURLaxWYlFZa00LRAVBdzawQMRIqfWYgP0tbWRPnG97IvCb7b+beCRCCMyrmG3x
	crxYpmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZAT-0000000ByVj-2noS;
	Mon, 24 Nov 2025 16:11:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZAQ-0000000ByVO-35dF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 50FB743656;
	Mon, 24 Nov 2025 16:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE7DC4CEF1;
	Mon, 24 Nov 2025 16:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764000713;
	bh=GynIxB5SdvojmQh0bSIvnMjrM6AMO9/Kdtc2TBwGNgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMfQjJPDUkiF/X8PrTSt0qVYlqYTimfC4O9SRbtvfpXKJCMCAgdFZvdQGYkpAitGN
	 JsXZNGEVGMZ7ApnvhyvOf7nyIhSuVND/jyjm3dUfph1ELfH03P3KYbkMLQGJWrcj8s
	 nLVgirQailZNhC/TcHKYUjaa/F41QDyFxwM6ZtBYIYGQGsh68/up3rpKqcC8DBxr/R
	 jO1FDT8nLrBm8xqBEDyK1BDgT7IaHsZQGsMOGRI1+6ekEhZOfY2g2gz2XeYeqgrW20
	 j6Jtc5+GoYwtPWdRwrhyL+UMikGY08Rko5iys5+LC6528BhRKuHE/X3jfMlR40EF00
	 nBJ/At9UsEDxQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vNZAP-000000004Lx-0Mql;
	Mon, 24 Nov 2025 17:11:53 +0100
Date: Mon, 24 Nov 2025 17:11:53 +0100
From: Johan Hovold <johan@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Besar Wicaksono <bwicaksono@nvidia.com>
Subject: Re: [PATCH] perf/arm_cspmu: fix device leaks on module unload
Message-ID: <aSSDyam4lxcSWvA7@hovoldconsulting.com>
References: <20251121115213.8481-1-johan@kernel.org>
 <aSSB0foqqbOl3fC3@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSSB0foqqbOl3fC3@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_081154_816457_6FDA1B39 
X-CRM114-Status: GOOD (  20.59  )
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

On Mon, Nov 24, 2025 at 04:03:29PM +0000, Will Deacon wrote:
> On Fri, Nov 21, 2025 at 12:52:13PM +0100, Johan Hovold wrote:
> > Make sure to drop the references taken when looking up the backend
> > devices during vendor module unload.
> > 
> > Fixes: bfc653aa89cb ("perf: arm_cspmu: Separate Arm and vendor module")
> > Cc: stable@vger.kernel.org	# 6.7
> > Cc: Besar Wicaksono <bwicaksono@nvidia.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/perf/arm_cspmu/arm_cspmu.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
> > index efa9b229e701..e0d4293f06f9 100644
> > --- a/drivers/perf/arm_cspmu/arm_cspmu.c
> > +++ b/drivers/perf/arm_cspmu/arm_cspmu.c
> > @@ -1365,8 +1365,10 @@ void arm_cspmu_impl_unregister(const struct arm_cspmu_impl_match *impl_match)
> >  
> >  	/* Unbind the driver from all matching backend devices. */
> >  	while ((dev = driver_find_device(&arm_cspmu_driver.driver, NULL,
> > -			match, arm_cspmu_match_device)))
> > +			match, arm_cspmu_match_device))) {
> >  		device_release_driver(dev);
> > +		put_device(dev);
> > +	}
> 
> There's already a fix queued for this; please take a look:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/commit/?h=for-next/perf&id=970e1e41805f0bd49dc234330a9390f4708d097d

Ah, forgot to check linux-next here, sorry.

The diff of that commit is identical even if the commit summary is a bit
misleading as this is not an error path.

Johan

