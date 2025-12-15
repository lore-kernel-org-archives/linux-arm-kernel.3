Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD11D5B172
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wspWccdt9mHnVeiXHtz1BHV94m9lhbDaSny9i/kYLww=; b=oJi1cEmA24VktV27A36sGRn0zf
	oKghEfRj6p7CjOzGfgnCFW1tOyO60DGhCJGM6SdfXx+bcF6Tl+HwlHbMmGl5bvntzHejhnQ8VNKfD
	+4eO34foe++3o4Om/WF+fbfAuGWn6bAMGBTvc+Lh0xoIeCFvs2Fgt45ToRb/tldwTrogs8Hqbj88f
	OjOGIS5EqWTSUtsDH3mlOwg8B6ZkmjBHTx4KFuJfu4X8b1hXEVTOtLRBBonAxNsprWrYW3hyZH9/Z
	rEaDIBqvLOtMHGJm1FGe0RzXpLIDdnrCNXORDxbogpWokEhtq7hzaRNwZthuV9ESyA3x60eLxzR0M
	pZBfWN6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9jS-00000003oat-36vf;
	Mon, 15 Dec 2025 14:39:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9jR-00000003oag-0bZv;
	Mon, 15 Dec 2025 14:39:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21A7760156;
	Mon, 15 Dec 2025 14:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D79C4CEF5;
	Mon, 15 Dec 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765809563;
	bh=3NGg7h6VupPWi0xMjm0X5TrbirWmgw7NiurTa5OD018=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ty7e65DdD+aIvHa0EOs7D5ObsOVWmvNtHKv++yGdRenVF1ytjJsXDDT7iFHZh1OZs
	 yLsgRgF03XeRf0PSGzWXA3xWN6RDvpoOVUg7UMpixidYIsgl5InaWUi9co6xAB/DkI
	 nFihkT7uBhu7BOBDb/ZbkHIF6LnuerWsuJiLsMDTAY6UgroUkRPYfoei2P7rSzfvM1
	 uXEPQlIzHr3d57pg9Uo/GtrH9KqVOC4p6lqQ+cQDLiM2IW/5V0vm/Q+yua7/5Axr7J
	 +DTS8YrSHePd6xsShd6eWZp4YAog8xPMHAtGlrJDm9Svz9V4wAlCjW/TG8Y0lB7ild
	 J/u9f1SGi2MPQ==
Date: Mon, 15 Dec 2025 14:39:19 +0000
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Move net_devs registration in a
 dedicated routine
Message-ID: <aUAdlzPgf_lQKgLM@horms.kernel.org>
References: <20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org>
 <aUAXJ01iHnSJtItt@horms.kernel.org>
 <aUAcHVULgJTpdGzT@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUAcHVULgJTpdGzT@lore-desk>
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

On Mon, Dec 15, 2025 at 03:33:01PM +0100, Lorenzo Bianconi wrote:
> > On Sun, Dec 14, 2025 at 10:30:07AM +0100, Lorenzo Bianconi wrote:
> > > Since airoha_probe() is not executed under rtnl lock, there is small race
> > > where a given device is configured by user-space while the remaining ones
> > > are not completely loaded from the dts yet. This condition will allow a
> > > hw device misconfiguration since there are some conditions (e.g. GDM2 check
> > > in airoha_dev_init()) that require all device are properly loaded from the
> > > device tree. Fix the issue moving net_devices registration at the end of
> > > the airoha_probe routine.
> > > 
> > > Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> > > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > 
> > Hi Lorenzo,
> > 
> > As a fix this patch looks good to me.
> > 
> > Reviewed-by: Simon Horman <horms@kernel.org>
> 
> Hi Simon,
> 
> thx for the review.
> 
> > 
> > But I am somewhat surprised that the netdev isn't unregistered earlier
> > both in airoha_remove() and the unwind ladder of airoha_probe().
> 
> do you mean moving unregister_netdev() before
> airoha_qdma_stop_napi()/airoha_hw_cleanup()? I was thinking about it to be
> honest :)
> Since it is not related to this fix, I will post a patch as soon as net-next is
> open again.

Yes, that is what I was thinking.
And I agree that this is net-next material unrelated to this fix.

While you are there, I would look at making the unwind ladder
in probe follow the same pattern as remove, if possible.
I think that might mean moving airoha_ppe_deinit().

But perhaps you already thought of that too.
Or there is some good reason not to do so.



