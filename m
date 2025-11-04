Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA73CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+U+2OT0FEQDBEjE7PvdbjsFGjvlFaLiZZoCZT0U7HwU=; b=r0TijlgZQB5emgJ2gGQM97TQYX
	XL60U3Jo89aTG5cEo5VeomsfdQQq5xq6dCePiYABvBhitumAadCykX2zPFStwPYTBP+xGJKEyrXCy
	PIFhrrzABjAYF4UnyH06TdLnNSlQXTtIDNHHP19bAJbuqeTGpLM34B1kySBjvuzQp3gNpSU+hejRK
	XDtWXTNwNL29cd+2wTmI/nqhv84nsmT8Z9wJ0VGwR88vN+IDdnQB2dpcKtsJ5FE+gJuJrv8Mm+krY
	vhytIdKRvjo0TP0mobfH4s8TesCxzYg8OIyWR1hJk2i0iXcILNbvbeJOTF/2dTpA5sQlA0ZsyNhmx
	d0Cbh6Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQlM-0000000CleA-46et;
	Tue, 04 Nov 2025 23:48:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQlL-0000000Cldz-45Ro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 095B1601EF;
	Tue,  4 Nov 2025 23:48:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E23C4CEF7;
	Tue,  4 Nov 2025 23:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762300110;
	bh=Q2/QncbSe1650Y8pwvQWHnA5DpeavIeF6BYxviBnp1I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NitVMveQvbt1i533gsvJWGVaHAnqN/0sBwsYa/Uj4lT1tXlWsD+c9rFs04/3twCP6
	 hZiAPAEqAx1dsVqmhmLijeiZidxoJv5WKRme4Qbe5uRKVjpPlLhiLdHatBcnqX9CZB
	 kUjOfrDt5nZ/Z0GrQRC9cEePN8uSu2ae7AsOmk2o1ZcHcsNoMu/kJH0jpEQpzHd9zn
	 iSYE+Or3T3HRGVUm/YyU/YgeUs2nfFRKJYdDSVXolI8tOf5+H0OEfZ1iTQ3kdV46Ch
	 rpZfegPYodVRzcnAva0IC6+e8QXTnGqMr+xVEHPg4ZezsNQbQhSrohuqPqC9hubz5u
	 24ZSXGiVLaOXA==
Date: Tue, 4 Nov 2025 15:48:28 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: Paolo Abeni <pabeni@redhat.com>, <horms@kernel.org>,
 <namcao@linutronix.de>, <vadim.fedorenko@linux.dev>,
 <jacob.e.keller@intel.com>, <christian.koenig@amd.com>,
 <sumit.semwal@linaro.org>, <sdf@fomichev.me>, <john.fastabend@gmail.com>,
 <hawk@kernel.org>, <daniel@iogearbox.net>, <ast@kernel.org>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [EXTERNAL] Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth:
 Add XSK pool helpers
Message-ID: <20251104154828.7aa20642@kernel.org>
In-Reply-To: <c792f4da-3385-4c14-a625-e31b09675c32@ti.com>
References: <20251023093927.1878411-1-m-malladi@ti.com>
	<20251023093927.1878411-3-m-malladi@ti.com>
	<05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
	<ba1b48dc-b544-4c4b-be8a-d39b104cda21@ti.com>
	<c792f4da-3385-4c14-a625-e31b09675c32@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 4 Nov 2025 14:23:24 +0530 Meghana Malladi wrote:
> > I tried honoring Jakub's comment to avoid freeing the rx memory wherever 
> > necessary.
> > 
> > "In case of icssg driver, freeing the rx memory is necessary as the
> > rx descriptor memory is owned by the cppi dma controller and can be
> > mapped to a single memory model (pages/xdp buffers) at a given time.
> > In order to remap it, the memory needs to be freed and reallocated."
> 
> Just to make sure we are on the same page, does the above explanation 
> make sense to you or do you want me to make any changes in this series 
> for v5 ?

No. Based on your reply below you seem to understand what is being
asked, so you're expected to do it.

> >> I think you should:
> >> - stop the H/W from processing incoming packets,
> >> - spool all the pending packets
> >> - attach/detach the xsk_pool
> >> - refill the ring
> >> - re-enable the H/W
> > 
> > Current implementation follows the same sequence:
> > 1. Does a channel teardown -> stop incoming traffic
> > 2. free the rx descriptors from free queue and completion queue -> spool 
> > all pending packets/descriptors
> > 3. attach/detach the xsk pool
> > 4. allocate rx descriptors and fill the freeq after mapping them to the 
> > correct memory buffers -> refill the ring
> > 5. restart the NAPI - re-enable the H/W to recv the traffic
> > 
> > I am still working on skipping 2 and 4 steps but this will be a long 
> > shot. Need to make sure all corner cases are getting covered. If this 
> > approach looks doable without causing any regressions I might post it as 
> > a followup patch later in the future.

