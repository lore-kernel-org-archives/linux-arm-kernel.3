Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B2410ED656
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 10:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCEsSDCbuvbV02ERH5WWnhYmvAJXiLYur5xXmlqScUA=; b=4EGAJ9ZrKauTnpVBlUmlqmQOSY
	7HpSsJHxTgbjyfrvb756pAdosLylg1OqDkU1s3kWygX9q00J+rNlB0+LDobm1C2sU549VjideNOoY
	UC23c+uWfyqWJ/76hXQ7hPISF6uNMufE0fk0c5v50HaOqJryjPgplrKqDv7WEPZU7nTpOVsRDjB22
	bzc5i/Qki8fWLUelpRIElS5V/jmBxnrCNUOaAxeOKJNrAYJF7R0J7j8EeEqFKnQX2hqbT88T7mSft
	641PXgzxn0DbfUskQwWdhQS/sAvGdRV+tmhaqsLVY/hOwknF1RdZt7t+vqWS8XV8h4Q8tab4NzJKv
	3Vs2PFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64Rc-000000079s3-0jMA;
	Fri, 27 Mar 2026 10:29:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w64RW-000000079qU-0ujl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 10:29:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 647B561344;
	Fri, 27 Mar 2026 10:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE01C19423;
	Fri, 27 Mar 2026 10:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774607369;
	bh=KJvE2/bPrNGOPxsHw5kAvsJmyAmIFF2r2alqDrMrz1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z3/6Hxm+5+mlvJOdbUTrhgx0o1IMGa0JWOLr81OqS4ZfTTZh5HaZtIsrBvTumBeBs
	 iF9bW+Gn+a1O5FSOvpU/EP5LojF8Moz/lKangXJnakIRPieO8VfgX7Nfg+2oiY/7Oc
	 ZphGb7PIx5Vpv/Mbpt59RagLz47CV2yZXiV+BWVSvlif9KJ1RQ2PB+PFBTSuFVjxM6
	 S7m9sM00nZhp2JyuuBw5NEowKFqcF7w5FSMMuqLYXtuHhxWYqVCxVg0YLu9IhLGp5Q
	 ldZuOWaZQpMOsPEfYJFKt7IY/NB5ON/0GqGQZpZ64lR7aCK0tEGqe88g1EB9XQxjQi
	 iHoZGH4kf4kVg==
Date: Fri, 27 Mar 2026 10:29:24 +0000
From: Simon Horman <horms@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, m-malladi@ti.com, jacob.e.keller@intel.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ti: icssg-prueth: fix missing data copy and wrong
 recycle in ZC RX dispatch
Message-ID: <20260327102924.GF111839@horms.kernel.org>
References: <20260325125131.53399-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325125131.53399-1-devnexen@gmail.com>
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

+ Meghana Malladi

On Wed, Mar 25, 2026 at 12:51:30PM +0000, David Carlier wrote:
> emac_dispatch_skb_zc() allocates a new skb via napi_alloc_skb() but
> never copies the packet data from the XDP buffer into it. The skb is
> passed up the stack containing uninitialized heap memory instead of
> the actual received packet, leaking kernel heap contents to userspace.
> 
> Copy the received packet data from the XDP buffer into the skb using
> skb_copy_to_linear_data().
> 
> Additionally, remove the skb_mark_for_recycle() call since the skb is
> backed by the NAPI page frag allocator, not page_pool. Marking a
> non-page_pool skb for recycle causes the free path to return pages to
> a page_pool that does not own them, corrupting page_pool state.
> 
> The non-ZC path (emac_rx_packet) does not have these issues because it
> uses napi_build_skb() to wrap the existing page_pool page directly,
> requiring no copy, and correctly marks for recycle since the page comes
> from page_pool_dev_alloc_pages().
> 
> Fixes: 7a64bb388df3 ("net: ti: icssg-prueth: Add AF_XDP zero copy for RX")
> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Hi David,

Thanks for the update.
My understanding is that this addresses the review of v1.

Reviewed-by: Simon Horman <horms@kernel.org>

v1: https://lore.kernel.org/all/20260324211402.342474-1-devnexen@gmail.com/

Some points to keep in mind for the future:

* Please include a version number in the subject when posting versions >
  This helps a lot in tracking things.

  Subject: [PATCH v2] ...

* Please include the target tree. As a fix for code, which I asusme
  is present in net, in this case that would be the net tree.

  Subject: [PATCH net v2] ...

  Otherwise it would probably be the net-next tree.

* Please CC all relevant parties. In this case that would
  include Meghana as he provided review of v1.

* Please consider including a changelog, along with links to earlier
  versions below the scissors ("---")

* b4 can help with most of these things

* More information on the Netdev development process can be found at
  https://docs.kernel.org/process/maintainer-netdev.html

...

