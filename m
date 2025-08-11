Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DCBCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eNQMTatmBPKxFdkwKt+EGx4xbTTrm71X5AAkKcuKjqk=; b=nmE6IBgDtsEzHgNK4urUfJ9/bC
	ncKdwRz2uE7RyqW3708i9c3qG5U6SmorpduoA+S+y8Oic9HcbToaBf9DZ/ZCTbeuh2asFMs9c2qoA
	CMT296U3OpLhhEEz8cIvIqXMLDBRjKchgfKVu6owoXN8VMktlKTqIdsYKcBFliuYVfuzd6MVaBSMe
	Gz/MUtctLYkZfs91jwyfc3DJP8Jfd4xRpobvCS97XUkilO2/UaiOTgpOsvPYJxoanIebdxpDEteh8
	mZqKBedZG/zzMlm6SALPGGxjsmzgYL6fJ0uSNJqAaOSNOUZz/+p+e5t+L9WxSsT6ejzELPPNJarhj
	46ATd7fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulabS-00000009Ai9-1jnn;
	Mon, 11 Aug 2025 22:02:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVc5-00000008S3x-0w3A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 16:43:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92C895C5D19;
	Mon, 11 Aug 2025 16:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5857C4CEED;
	Mon, 11 Aug 2025 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754930588;
	bh=9z+tz1mZ02O2xUsDYySHzgddAuS1zPi5iv/IxcoOFc0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jl61eaUKy/n/uAo55PqQFasHJ3cCDEODQ42dDdfy8l5VpZaSFLCCkAQue4lRMuYXK
	 FDKMiZU4SE0+96uDG4SR1at/HzjxXh9LawkN4Ak6Py9oWk+cBZG+TqUgMpylxIqYOF
	 e5Ea1QQP5cfDhxBKoe+2dl5PCe728uGiP/3Ob4QkMnNviiHhKo1Vlv+/dUihzl5ih2
	 iQYXQXWJKYNhLbv9DqLc0j2WHjtmXacO5p3JZ3p9le3Xzi3nAd10zv6R7TtRpl/2/p
	 u1ynid+mLO5WsHy1MNsV9g8SrUOn75aSeFn1k148TtQxsgsd3TftPMOZQwUT2xghsC
	 M9TXjSo2P0QUA==
Date: Mon, 11 Aug 2025 09:43:07 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>, "andrew+netdev@lunn.ch"
 <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>,
 "edumazet@google.com" <edumazet@google.com>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "Simek, Michal" <michal.simek@amd.com>,
 "sean.anderson@linux.dev" <sean.anderson@linux.dev>, "horms@kernel.org"
 <horms@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "Katakam, Harini" <harini.katakam@amd.com>
Subject: Re: [PATCH net] net: xilinx: axienet: Increment Rx skb ring head
 pointer after BD is successfully allocated in dmaengine flow
Message-ID: <20250811094307.4c2d42ae@kernel.org>
In-Reply-To: <MN0PR12MB5953EF5C6557457C1C893668B728A@MN0PR12MB5953.namprd12.prod.outlook.com>
References: <20250805191958.412220-1-suraj.gupta2@amd.com>
	<20250808120534.0414ffd0@kernel.org>
	<BL3PR12MB65712291B55DD8D535BAE667C92EA@BL3PR12MB6571.namprd12.prod.outlook.com>
	<20250811083738.04bf1e31@kernel.org>
	<MN0PR12MB5953EF5C6557457C1C893668B728A@MN0PR12MB5953.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_094309_304064_E2B54F19 
X-CRM114-Status: GOOD (  16.20  )
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

On Mon, 11 Aug 2025 15:55:02 +0000 Pandey, Radhey Shyam wrote:
> > That wasn't my reading, maybe I misinterpreted the code.
> >
> > From what I could tell the driver tries to give one new buffer for each buffer
> > completed. So it never tries to "catch up" on previously missed allocations. IOW say
> > we have a queue with 16 indexes, after 16 failures (which may be spread out over
> > time) the ring will be empty.  
> 
> Yes, IIRC there is 1:1 mapping for RX DMA callback and
> axienet_rx_submit_desc(). In case there are failure in
> axienet_rx_submit_desc() it is not able to reattempt
> in current implementation. Theoretically there could
> be other error in rx_submit_desc() (like dma_mapping/netdev
> allocation)
> 
> One thought is to have some flag/index to tell that it should
> be reattempted in subsequent axienet_rx_submit_desc() ?

Yes, some kind of counter of buffer that need to be allocated.
The other problem to solve is when the buffers are completely
depleted there will be no callback so no opportunity to refill.
For drivers which refill from NAPI this is usually solved by
periodically scheduling NAPI.

