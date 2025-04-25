Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35494C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 11:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JgXBBnWi0uIkNeEB5o6NTaG1+2XeK+GQm7cn+WLAW74=; b=Wt/omTVEjHWAzkt6P3MZNMrco9
	kI8SDBdux40F7CLELgHggogbPwdkNu817o/K4elTBCIJCBBvCqSc2QAKEks0M8Vs6MWP6Us3Dw2+L
	9hxqbcXIPuIq07nSYz50lDErCrymeNrJ4UDQTbvJwrGzf4UreDvL7I9NWUe8BmqRldtaMwVV7mCKa
	A3ClWd0EBYpCupgV/bE8Ok3OdHy1ypiHC+esEoBiAblHBJG4Haq1/ncXsE2e/GtyBb5y5U6LsAhPT
	+0DAZETQqDf3xu/CCQAFeH2+Um08E5bMumAwHA1btMjGe3AOTvVR57y+gJh98wSOEQsHFox2FwFRE
	0RlrNv0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8HiZ-0000000H2pJ-0JLe;
	Fri, 25 Apr 2025 11:59:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GB1-0000000Gi71-1EOO;
	Fri, 25 Apr 2025 10:20:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63F6860007;
	Fri, 25 Apr 2025 10:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8471C4CEEB;
	Fri, 25 Apr 2025 10:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745576454;
	bh=jcAtdlYTfa1RC2cu9dSkGODwfuS/DqnkQIJyB/0DwRY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NdlX7sD02k7fzLbQiCInydO04W7vNrrsSFK46wdHTBwTPZqMbEB24s9kLeSGsLHmI
	 m2ALbZgzluFz8vkpMwt1JsUjPJCkkDzWfFnmE3QoazXWQALiM8lMu8iPbnmPR2bte0
	 0hilI4WmcaAphIiYWf4Ilnj32DR9ln6y53qULzVIz3J4rCkimtfGXhZfb3NMnxy2HI
	 cqDbc7MJKHXc7jIPAQ1k8eK7ImF7jevVYdOYqnCMJdIxsV/HXWDR5MAGtUR8c6TDPS
	 7agCVTMwigx5V92d4pFvMyu8mfk9IXs6PCqLKQjeUcLz7g6DO2kfL4kQ7QKF+deZ1J
	 xKQ6HeRgQxMpQ==
Date: Fri, 25 Apr 2025 11:20:50 +0100
From: Simon Horman <horms@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH net-next] net: ethernet: mtk_wed: annotate RCU release in
 attach()
Message-ID: <20250425102050.GO3042781@horms.kernel.org>
References: <20250423150811.456205-2-johannes@sipsolutions.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423150811.456205-2-johannes@sipsolutions.net>
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

On Wed, Apr 23, 2025 at 05:08:08PM +0200, Johannes Berg wrote:
> From: Johannes Berg <johannes.berg@intel.com>
> 
> There are some sparse warnings in wifi, and it seems that
> it's actually possible to annotate a function pointer with
> __releases(), making the sparse warnings go away. In a way
> that also serves as documentation that rcu_read_unlock()
> must be called in the attach method, so add that annotation.
> 
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>

Reviewed-by: Simon Horman <horms@kernel.org>

Thinking out loud:

* Without this patch I see the following, but with this patch I do not.

  .../mt7915/mmio.c:636:5: warning: context imbalance in 'mt7915_mmio_wed_init' - wrong count at exit
  .../mt7996/mmio.c:302:5: warning: context imbalance in 'mt7996_mmio_wed_init' - wrong count at exit

* The only implementation of this callback I found is mtk_wed_attach
  which is already annotated as __releases(RCU);

* The only caller of this callback I could find is mtk_wed_device_attach()
  which takes rcu_read_unlock(). And the the callback needs to release it
  to avoid imbalance.

